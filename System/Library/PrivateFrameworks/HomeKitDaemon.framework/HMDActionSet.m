@implementation HMDActionSet

- (HMDActionSet)initWithName:(id)a3 uuid:(id)a4 type:(id)a5 home:(id)a6 queue:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDActionSet *v19;

  v12 = (void *)MEMORY[0x24BDD16D0];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDActionSet initWithName:uuid:type:home:queue:notificationCenter:](self, "initWithName:uuid:type:home:queue:notificationCenter:", v17, v16, v15, v14, v13, v18);

  return v19;
}

- (HMDActionSet)initWithName:(id)a3 uuid:(id)a4 type:(id)a5 home:(id)a6 queue:(id)a7 notificationCenter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDActionSet *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  NSString *type;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSUUID *uuid;
  void *v34;
  uint64_t v35;
  NSUUID *spiClientIdentifier;
  uint64_t v37;
  HMFMessageDispatcher *msgDispatcher;
  uint64_t v39;
  NSMutableArray *currentActions;
  id v42;
  id v43;
  objc_super v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v44.receiver = self;
  v44.super_class = (Class)HMDActionSet;
  v20 = -[HMDActionSet init](&v44, sel_init);
  if (v20)
  {
    v42 = v19;
    v43 = v14;
    v21 = (void *)MEMORY[0x24BE3F208];
    objc_msgSend(v14, "hm_truncatedNameString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hmf_cachedInstanceForString:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    name = v20->_name;
    v20->_name = (NSString *)v23;

    objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v16);
    v25 = objc_claimAutoreleasedReturnValue();
    type = v20->_type;
    v20->_type = (NSString *)v25;

    if (v16 && v17 && objc_msgSend(MEMORY[0x24BDD7480], "isBuiltinActionSetType:", v16))
    {
      v27 = (void *)MEMORY[0x24BDD1880];
      objc_msgSend(v17, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v28, 0, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v15)
      {
        v31 = objc_msgSend(v15, "copy");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v31;
    }
    objc_msgSend(MEMORY[0x24BE3F210], "hmf_cachedInstanceForNSUUID:", v30);
    v32 = objc_claimAutoreleasedReturnValue();
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v32;

    spiClientIdentifierForUUID(v20->_uuid);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F210], "hmf_cachedInstanceForNSUUID:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    spiClientIdentifier = v20->_spiClientIdentifier;
    v20->_spiClientIdentifier = (NSUUID *)v35;

    objc_storeStrong((id *)&v20->_workQueue, a7);
    objc_storeWeak((id *)&v20->_home, v17);
    objc_msgSend(v17, "msgDispatcher");
    v37 = objc_claimAutoreleasedReturnValue();
    msgDispatcher = v20->_msgDispatcher;
    v20->_msgDispatcher = (HMFMessageDispatcher *)v37;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v39 = objc_claimAutoreleasedReturnValue();
    currentActions = v20->_currentActions;
    v20->_currentActions = (NSMutableArray *)v39;

    v20->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_notificationCenter, a8);
    if (v18)
      -[HMDActionSet _registerForMessages](v20, "_registerForMessages");

    v19 = v42;
    v14 = v43;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDActionSet msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDActionSet home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDActionSet;
  -[HMDActionSet dealloc](&v6, sel_dealloc);
}

- (NSString)description
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

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[HMDActionSet name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet spiClientIdentifier](self, "spiClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet lastExecutionDate](self, "lastExecutionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet actions](self, "actions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ActionSet name: %@, uuid: %@, spiClientIdentifier: %@, type: %@, lastExecutionDate: %@, numActions: %tu"), v4, v6, v8, v9, v10, objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x24BDD16A8];
  -[HMDActionSet name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet uuid](self, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet spiClientIdentifier](self, "spiClientIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet lastExecutionDate](self, "lastExecutionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet actions](self, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[HMDActionSet urlString](self, "urlString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("ActionSet name: %@, uuid: %@, spiClientIdentifier: %@, type: %@, lastExecutionDate: %@, numActions: %tu, assistantIdentifier: %@"), v4, v5, v6, v7, v8, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v12;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE3EB68]);
  -[HMDActionSet appData](self, "appData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dumpState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE3EA58]);

  -[HMDActionSet actions](self, "actions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  if (objc_msgSend(v16, "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v31 = v16;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v21);
          v23 = (void *)MEMORY[0x227676638]();
          objc_msgSend(v22, "type");
          HMActionTypeAsString();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, v24);
          }
          objc_msgSend(v22, "stateDump");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v26);

          objc_autoreleasePoolPop(v23);
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v19);
    }

    v16 = v31;
  }
  v27 = (void *)objc_msgSend(v3, "copy");

  return v27;
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
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kActionSetUUID"));

  -[HMDActionSet type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("kActionSetType"));

  -[HMDActionSet name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("kActionSetName"));

  -[HMDActionSet actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("dictionaryRepresentation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("kActionSetActions"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void)isAccessValidForExecutionWithMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  HMDActionSet *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id inited;
  void *v17;
  HMDActionSet *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDActionSet *v24;
  NSObject *v25;
  void *v26;
  const __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  void (**v35)(id, uint64_t, _QWORD);
  id v36;
  char v37;
  id location;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = parseMessageSource(v6);
  -[HMDActionSet home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "synchronouslyFetchIsCarPlayConnectedStatus");
  if (!objc_msgSend(v9, "applyDeviceLockStatus:", v6)
    || !-[HMDActionSet containsSecureCharacteristic](self, "containsSecureCharacteristic")
    || !-[HMDActionSet containsUnsecuringAction](self, "containsUnsecuringAction") && (v8 | 8) == 9)
  {
    goto LABEL_18;
  }
  if (v10 && objc_msgSend(v9, "isCarPlayAccessAllowedForActionSet:withMessage:fromSource:", self, v6, v8))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Access is allowed by CarPlay access rules for action set execution", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v7[2](v7, 1, 0);
    goto LABEL_28;
  }
  if ((objc_msgSend(v6, "isEntitledForSPIAccess") & 1) != 0)
    v15 = 1;
  else
    v15 = objc_msgSend(v6, "isInternal");
  if (v8 == 1)
  {
    inited = objc_initWeak(&location, self);
    v17 = (void *)MEMORY[0x227676638](inited);
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Checking siri unlock access for siri triggered action set execution", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v9, "siriSecureAccessoryAccessController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __64__HMDActionSet_isAccessValidForExecutionWithMessage_completion___block_invoke;
    v34[3] = &unk_24E7796D8;
    objc_copyWeak(&v36, &location);
    v35 = v7;
    v37 = v15;
    objc_msgSend(v21, "isUnsecuringSiriActionAllowedWithCompletion:", v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    goto LABEL_28;
  }
  if ((objc_msgSend(v6, "isEntitledForSecureAccess") & 1) == 0)
  {
    v30 = (void *)MEMORY[0x24BDD1540];
    v31 = +[HMDDeviceCapabilities supportsDeviceLock](HMDDeviceCapabilities, "supportsDeviceLock");
    v32 = 10;
    if (v15)
      v32 = 2003;
    if (v31)
      v33 = 82;
    else
      v33 = v32;
    objc_msgSend(v30, "hmErrorWithCode:", v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_18:
    v22 = 0;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v27 = CFSTR("denied");
    else
      v27 = CFSTR("allowed");
    if (v8 > 9)
      v28 = CFSTR("Unknown");
    else
      v28 = off_24E780100[v8];
    v29 = v28;
    *(_DWORD *)buf = 138544130;
    v40 = v26;
    v41 = 2112;
    v42 = v27;
    v43 = 2112;
    v44 = v29;
    v45 = 2112;
    v46 = v22;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Access is %@ for action set execution from source: %@ for reason: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v23);
  ((void (**)(id, uint64_t, void *))v7)[2](v7, v22 == 0, v22);

LABEL_28:
}

- (void)execute:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x24BE3F138]);
  v7 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@, %s:%ld"), v8, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 297);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v6, "initWithName:", v9);

  -[HMDActionSet workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__HMDActionSet_execute___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v13 = v5;
  v14 = v15;
  v11 = v5;
  dispatch_async(v10, block);

  __HMFActivityScopeLeave();
}

- (void)_execute:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[HMDActionSet workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "isRemote"))
  {
    -[HMDActionSet home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeRequestTuplesFromMessage:outUnhandledRequests:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __34__HMDActionSet__execute_activity___block_invoke;
  v14[3] = &unk_24E779700;
  objc_copyWeak(&v18, &location);
  v11 = v7;
  v15 = v11;
  v12 = v6;
  v16 = v12;
  v13 = v10;
  v17 = v13;
  -[HMDActionSet isAccessValidForExecutionWithMessage:completion:](self, "isAccessValidForExecutionWithMessage:completion:", v12, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)executeWithTriggerSource:(id)a3 captureCurrentState:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HMDActionSet *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDActionSet workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDActionSet workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __79__HMDActionSet_executeWithTriggerSource_captureCurrentState_completionHandler___block_invoke;
    v19[3] = &unk_24E7962D8;
    v19[4] = self;
    v20 = v8;
    v21 = v9;
    v22 = a4;
    dispatch_async(v11, v19);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet name](v13, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet actions](v13, "actions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2048;
      v28 = objc_msgSend(v17, "count");
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Work queue hasn't been configured, bailing out the execution for action set %@ with number of actions: %lu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v18, 0);

    }
  }

}

- (void)handleRemovalOfService:(id)a3 transaction:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  HMDActionSet *v21;
  id v22;
  id v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = a4;
  objc_msgSend(v6, "accessory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self;
  -[HMDActionSet actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v23 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
        {
          objc_msgSend(v13, "serviceID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "instanceID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isEqualToNumber:", v15) & 1) != 0)
          {
            objc_msgSend(v13, "accessoryUUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "uuid");
            v17 = v8;
            v18 = v9;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v16, "isEqual:", v19);

            v9 = v18;
            v8 = v17;

            v6 = v23;
            if (v20)
              -[HMDActionSet _handleRemovalOfAction:transaction:](v21, "_handleRemovalOfAction:transaction:", v11, v22);
          }
          else
          {

          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

}

- (void)auditActionsForAccessory:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  HMDActionSet *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  HMDActionSet *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30 = self;
  -[HMDActionSet workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v29 = v11;
  if (v11)
  {
    v26 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HMDActionSet actions](v30, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      v27 = v9;
      v28 = v12;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v18, "isStaleWithAccessory:", v9))
          {
            v19 = (void *)MEMORY[0x227676638]();
            v20 = v30;
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "shortDescription");
              v23 = v16;
              v24 = v13;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v36 = v22;
              v37 = 2112;
              v38 = v18;
              v39 = 2112;
              v40 = v25;
              _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Audit: Associated characteristic(s) no longer exists on accessory %@ for action %@  ", buf, 0x20u);

              v13 = v24;
              v16 = v23;

              v9 = v27;
              v12 = v28;
            }

            objc_autoreleasePoolPop(v19);
            objc_msgSend(v12, "addObject:", v18);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v15);
    }

    v7 = v26;
    if ((objc_msgSend(v12, "hmf_isEmpty") & 1) == 0)
      -[HMDActionSet _handleRemovalOfActions:transaction:](v30, "_handleRemovalOfActions:transaction:", v12, v26);

  }
}

- (BOOL)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDActionSet setHome:](self, "setHome:", v8);
  -[HMDActionSet setMsgDispatcher:](self, "setMsgDispatcher:", v9);
  -[HMDActionSet setWorkQueue:](self, "setWorkQueue:", v10);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDActionSet actions](self, "actions", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15++), "configureWithHome:", v8);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  v16 = -[HMDActionSet _fixUpActions](self, "_fixUpActions");
  -[HMDActionSet _registerForMessages](self, "_registerForMessages");

  return v16;
}

- (void)setActions:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray setArray:](self->_currentActions, "setArray:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)__handleActionsUpdated
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  HMDActionSet *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDActionSet *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDActionSet *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDActionSet *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  _BYTE buf[12];
  __int16 v29;
  HMDActionSet *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableArray count](self->_currentActions, "count");
  v5 = -[NSMutableArray count](self->_currentActions, "count");
  os_unfair_lock_unlock(p_lock);
  if (v5)
  {
    if (v4 != 1)
      goto LABEL_12;
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Last action removed - removing donated intents", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x227676638](-[HMDActionSet _removeDonatedIntent](v7, "_removeDonatedIntent"));
    v11 = v7;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending notification for now empty action set %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDActionSet notificationCenter](v11, "notificationCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet home](v11, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("HMDActionSetNotificationKey");
    *(_QWORD *)buf = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("HMDHomeActionSetEmptiedNotification"), v15, v16);

  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v20;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@ActionSet empty/non-empty edges - re-evaluating triggers in the home", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  -[HMDActionSet home](v18, "home");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reEvaluateTriggers");

LABEL_12:
  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v25;
    v29 = 2112;
    v30 = v23;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Sending notification for now empty action set %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  -[HMDActionSet notificationCenter](v23, "notificationCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "postNotificationName:object:userInfo:", CFSTR("HMDActionSetActionsUpdatedNotification"), v23, 0);

}

- (void)addAction:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_currentActions, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  -[HMDActionSet __handleActionsUpdated](self, "__handleActionsUpdated");

}

- (void)removeAction:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_currentActions, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  -[HMDActionSet __handleActionsUpdated](self, "__handleActionsUpdated");

}

- (void)removeAllActions
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_currentActions, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  -[HMDActionSet __handleActionsUpdated](self, "__handleActionsUpdated");
}

- (NSArray)actions
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_currentActions, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)serializedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDActionSet home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)_fixUpActions
{
  HMDActionSet *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDActionSet *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDActionSet *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDActionSet *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDActionSet *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v49;
  HMDActionSet *v50;
  void *v51;
  char v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v2 = self;
  v74 = *MEMORY[0x24BDAC8D0];
  -[HMDActionSet actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v6)
  {
    v8 = v6;
    v52 = 0;
    v9 = *(_QWORD *)v58;
    *(_QWORD *)&v7 = 138544130;
    v49 = v7;
    v50 = v2;
    v51 = v4;
    v54 = v5;
    v55 = *(_QWORD *)v58;
    do
    {
      v10 = 0;
      v56 = v8;
      do
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "type", v49);
        if ((unint64_t)(v12 - 2) >= 3)
        {
          if (v12 == 1)
          {
            v18 = v11;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
            v20 = v19;

            if (v20)
            {
              objc_msgSend(v20, "mediaProfiles");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "count");

              if (v22)
              {
                objc_msgSend(v4, "addObject:", v20);
              }
              else
              {
                v41 = (void *)MEMORY[0x227676638]();
                v42 = v2;
                HMFGetOSLogHandle();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDActionSet name](v42, "name");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDActionSet uuid](v42, "uuid");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "uuid");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v49;
                  v62 = v44;
                  v63 = 2112;
                  v64 = v45;
                  v65 = 2112;
                  v66 = v46;
                  v67 = 2112;
                  v68 = v47;
                  _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ActionSet %@/%@: Removing media action %@ since there are no media profiles", buf, 0x2Au);

                  v8 = v56;
                  v2 = v50;

                }
                objc_autoreleasePoolPop(v41);
                v52 = 1;
                v5 = v54;
              }
            }
            else
            {
              v31 = (void *)MEMORY[0x227676638]();
              v32 = v2;
              HMFGetOSLogHandle();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                HMActionTypeAsString();
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v62 = v34;
                v63 = 2112;
                v64 = v18;
                v65 = 2112;
                v66 = v35;
                _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                v2 = v50;
              }

              objc_autoreleasePoolPop(v31);
              v8 = v56;
            }

            v9 = v55;
          }
          else if (!v12)
          {
            v13 = v11;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v14 = v13;
            else
              v14 = 0;
            v15 = v14;

            if (v15)
            {
              objc_msgSend(v15, "characteristic");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16
                && (objc_msgSend(v15, "targetValue"),
                    v17 = (void *)objc_claimAutoreleasedReturnValue(),
                    v17,
                    v17))
              {
                objc_msgSend(v4, "addObject:", v15);
              }
              else
              {
                v23 = (void *)MEMORY[0x227676638]();
                v24 = v2;
                HMFGetOSLogHandle();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDActionSet name](v24, "name");
                  v53 = v23;
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDActionSet uuid](v24, "uuid");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "uuid");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "targetValue");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544642;
                  v62 = v26;
                  v63 = 2112;
                  v64 = v27;
                  v65 = 2112;
                  v66 = v28;
                  v67 = 2112;
                  v68 = v29;
                  v69 = 2112;
                  v70 = v16;
                  v71 = 2112;
                  v72 = v30;
                  _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ActionSet %@/%@: Removing write action %@/%@ since the characteristic %@ or value is nil", buf, 0x3Eu);

                  v9 = v55;
                  v2 = v50;

                  v23 = v53;
                }

                objc_autoreleasePoolPop(v23);
                v52 = 1;
                v4 = v51;
                v5 = v54;
              }
              v8 = v56;

            }
            else
            {
              v36 = (void *)MEMORY[0x227676638]();
              v37 = v2;
              HMFGetOSLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                HMActionTypeAsString();
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v62 = v39;
                v63 = 2112;
                v64 = v13;
                v65 = 2112;
                v66 = v40;
                _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                v4 = v51;
                v5 = v54;
              }

              objc_autoreleasePoolPop(v36);
              v8 = v56;
            }

          }
        }
        else
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v8);
  }
  else
  {
    v52 = 0;
  }

  -[HMDActionSet setActions:](v2, "setActions:", v4);
  return v52 & 1;
}

- (BOOL)containsSecureCharacteristic
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMDActionSet *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDActionSet actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_29901);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Does this actionSet contain any Secure class accessory : %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsUnsecuringAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMDActionSet *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDActionSet actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_61);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Does this actionSet contain any unsecuring action : %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsMediaPlaybackActions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDActionSet actions](self, "actions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "type") == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsShortcutActions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDActionSet actions](self, "actions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "type") == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (HMDActionSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDActionSet *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = (HMDActionSet *)-[HMDActionSet _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  HMDActionSet *v14;
  uint64_t v15;
  HMDApplicationData *appData;
  uint64_t v17;
  NSDate *lastExecutionDate;
  void *v19;
  NSMutableArray *currentActions;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_decodeAndCacheTruncatedNameStringForKey:", CFSTR("actionSetName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("actionSetType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    v8 = (id)*MEMORY[0x24BDD5220];

    v7 = v8;
  }
  if (objc_msgSend(MEMORY[0x24BDD7480], "isBuiltinActionSetType:", self->_type))
  {
    v9 = (void *)MEMORY[0x24BDD1880];
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    objc_msgSend(WeakRetained, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = self->_type;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v11, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionSetUUID"));
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", WeakRetained);
  }

  v14 = -[HMDActionSet initWithName:uuid:type:home:queue:](self, "initWithName:uuid:type:home:queue:", v6, v13, v7, v5, 0);
  if (v14)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.appDataRepository"));
    v15 = objc_claimAutoreleasedReturnValue();
    appData = v14->_appData;
    v14->_appData = (HMDApplicationData *)v15;

    -[HMDApplicationData updateParentUUIDIfNil:](v14->_appData, "updateParentUUIDIfNil:", v14->_uuid);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.actionSetLastExecutionDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    lastExecutionDate = v14->_lastExecutionDate;
    v14->_lastExecutionDate = (NSDate *)v17;

    +[HMDActionSet allowedActionClasses](HMDActionSet, "allowedActionClasses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.actions.3")))
    {
      v33 = v6;
      currentActions = v14->_currentActions;
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("HM.actions.3"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setArray:](currentActions, "setArray:", v21);

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("HM.actions.4"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = (void *)MEMORY[0x24BDBD1A8];
      if (v22)
        v24 = (void *)v22;
      v25 = v24;

      -[NSMutableArray addObjectsFromArray:](v14->_currentActions, "addObjectsFromArray:", v25);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v26 = v14->_currentActions;
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v27)
      {
        v28 = v27;
        v32 = v5;
        v29 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v35 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "updateActionSetIfNil:", v14, v32);
          }
          v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v28);
        v5 = v32;
      }
      v6 = v33;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("actionSetActions"));
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setArray:](v14->_currentActions, "setArray:", v25);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("HM.actionSetMediaPlaybackActionsCodingKey"));
      v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v14->_currentActions, "addObjectsFromArray:", v26);
    }

  }
  return v14;
}

- (BOOL)_isValidCharacteristicWriteAction:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  -[HMDActionSet _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HMDActionSet *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  int v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  HMDActionSet *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDActionSet *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  HMDActionSet *v69;
  int v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDActionSet home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("home"));
  -[HMDActionSet uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("actionSetUUID"));

  v8 = objc_msgSend(v4, "hmd_isForXPCTransport");
  v9 = objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess");
  v10 = objc_msgSend(v4, "hmd_homeManagerOptions");
  v69 = self;
  if (v8)
  {
    v70 = v9;
    if ((v9 & (v10 >> 10)) == 1)
    {
      -[HMDActionSet actions](self, "actions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = MEMORY[0x24BDAC760];
      v81[1] = 3221225472;
      v81[2] = __33__HMDActionSet__encodeWithCoder___block_invoke;
      v81[3] = &unk_24E788D10;
      v81[4] = self;
      objc_msgSend(v11, "na_filter:", v81);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v64 = v8;
      v66 = v5;
      v68 = v4;
      v26 = (void *)MEMORY[0x24BDBCEB8];
      -[HMDActionSet actions](self, "actions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v27, "count"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      -[HMDActionSet actions](self, "actions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      v30 = v70;
      if (v29)
      {
        v31 = v29;
        v32 = *(_QWORD *)v78;
        v71 = v28;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v78 != v32)
              objc_enumerationMutation(v28);
            v34 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
            switch(objc_msgSend(v34, "type"))
            {
              case 0:
                v35 = v34;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v36 = v35;
                else
                  v36 = 0;
                v37 = v36;

                if (v37)
                {
                  objc_msgSend(v37, "characteristic");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "accessory");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v40 = v39;
                  else
                    v40 = 0;
                  v41 = v40;
                  v42 = objc_msgSend(v41, "hasTelevisionService");

                  if ((!v42 || _os_feature_enabled_impl())
                    && -[HMDActionSet _isValidCharacteristicWriteAction:](self, "_isValidCharacteristicWriteAction:", v37))
                  {
                    objc_msgSend(v72, "addObject:", v35);
                  }

                  v30 = v70;
                }
                else
                {
                  v51 = (void *)MEMORY[0x227676638]();
                  v52 = self;
                  HMFGetOSLogHandle();
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    HMActionTypeAsString();
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v84 = v54;
                    v85 = 2112;
                    v86 = v35;
                    v87 = 2112;
                    v88 = v55;
                    _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                    self = v69;
                    v30 = v70;
                  }

                  objc_autoreleasePoolPop(v51);
                }

                v28 = v71;
                break;
              case 1:
              case 3:
              case 4:
                if (v30)
                  objc_msgSend(v72, "addObject:", v34);
                break;
              case 2:
                v43 = v34;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v44 = v43;
                else
                  v44 = 0;
                v45 = v44;

                if (v45)
                {
                  if (v30)
                  {
                    objc_msgSend(v72, "addObject:", v43);
                  }
                  else
                  {
                    v56 = (void *)objc_msgSend(v45, "copy");
                    objc_msgSend(v56, "removeShortcut");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v72, "addObject:", v57);
                    v30 = v70;
                  }
                }
                else
                {
                  v46 = (void *)MEMORY[0x227676638]();
                  v47 = self;
                  HMFGetOSLogHandle();
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    HMActionTypeAsString();
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v84 = v49;
                    v85 = 2112;
                    v86 = v43;
                    v87 = 2112;
                    v88 = v50;
                    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                    self = v69;
                    v30 = v70;
                  }

                  objc_autoreleasePoolPop(v46);
                  v28 = v71;
                }

                break;
              default:
                continue;
            }
          }
          v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        }
        while (v31);
      }

      v12 = (void *)objc_msgSend(v72, "copy");
      v5 = v66;
      v4 = v68;
      v8 = v64;
    }
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("actionSetActions"));
  }
  else
  {
    v65 = v5;
    v67 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = self;
    v17 = (void *)v15;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    -[HMDActionSet actions](v16, "actions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v74 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          objc_msgSend(v23, "type");
          v24 = v14;
          switch((unint64_t)v14)
          {
            case 0uLL:
              v25 = v12;
              goto LABEL_13;
            case 1uLL:
              v25 = v13;
LABEL_13:
              objc_msgSend(v25, "addObject:", v23);
              v24 = v14;
              goto LABEL_14;
            case 2uLL:
              goto LABEL_14;
            case 3uLL:
            case 4uLL:
              v24 = v17;
LABEL_14:
              objc_msgSend(v24, "addObject:", v23);
              break;
            default:
              continue;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v20);
    }

    v4 = v67;
    objc_msgSend(v67, "encodeObject:forKey:", v12, CFSTR("actionSetActions"));
    objc_msgSend(v67, "encodeObject:forKey:", v13, CFSTR("HM.actionSetMediaPlaybackActionsCodingKey"));
    objc_msgSend(v67, "encodeObject:forKey:", v14, CFSTR("HM.actions.3"));
    objc_msgSend(v67, "encodeObject:forKey:", v17, CFSTR("HM.actions.4"));

    v5 = v65;
    self = v69;
    v8 = 0;
  }

  -[HMDActionSet executionMessage](self, "executionMessage");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v58 != 0, CFSTR("HM.actionSetExecutionInProgress"));

  if ((v8 & 1) != 0 || objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    -[HMDActionSet lastExecutionDate](self, "lastExecutionDate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v59, CFSTR("HM.actionSetLastExecutionDate"));

  }
  if ((objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    -[HMDActionSet name](self, "name");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v60, CFSTR("actionSetName"));

    -[HMDActionSet type](self, "type");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v61, CFSTR("actionSetType"));

  }
  -[HMDActionSet appData](self, "appData");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v8)
    objc_msgSend(v62, "encodeForXPCTransportWithCoder:key:", v4, CFSTR("HM.appData"));
  else
    objc_msgSend(v4, "encodeObject:forKey:", v62, CFSTR("HM.appDataRepository"));

}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDActionSet messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (void)handleRemovalOfAccessory:(id)a3 transaction:(id)a4
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDActionSet *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t i;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  HMDActionSet *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  HMDActionSet *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  HMDActionSet *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  id v73;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  id obj;
  uint64_t v79;
  uint64_t v80;
  char v81;
  HMDActionSet *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  id v106;
  __int16 v107;
  void *v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v77 = a3;
  v76 = a4;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v82 = self;
  -[HMDActionSet actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
  if (v80)
  {
    v79 = *(_QWORD *)v98;
    *(_QWORD *)&v6 = 138543618;
    v72 = v6;
LABEL_3:
    v7 = 0;
    while (2)
    {
      if (*(_QWORD *)v98 != v79)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v7);
      switch(objc_msgSend(v8, "type", v72))
      {
        case 0:
          v9 = v8;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = v9;
          else
            v10 = 0;
          v11 = v10;

          if (!v11)
          {
            v58 = MEMORY[0x227676638]();
            v59 = v82;
            HMFGetOSLogHandle();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              HMActionTypeAsString();
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v104 = v61;
              v105 = 2112;
              v106 = v9;
              v107 = 2112;
              v108 = v62;
              _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

            }
            goto LABEL_74;
          }
          objc_msgSend(v77, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v11;
          objc_msgSend(v11, "accessoryUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "isEqual:", v14);

          if (v15)
            goto LABEL_63;
          goto LABEL_64;
        case 1:
          v27 = v8;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v27;
          else
            v28 = 0;
          v29 = v28;

          if (v29)
          {
            objc_msgSend(v29, "mediaProfiles");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v30, "mutableCopy");

            v95 = 0u;
            v96 = 0u;
            v93 = 0u;
            v94 = 0u;
            objc_msgSend(v77, "accessoryProfiles");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
            if (v86)
            {
              v73 = v27;
              v74 = v29;
              v75 = v7;
              v81 = 0;
              v84 = v31;
              v85 = *(_QWORD *)v94;
              v33 = v32;
              v83 = v32;
              do
              {
                for (i = 0; i != v86; ++i)
                {
                  if (*(_QWORD *)v94 != v85)
                    objc_enumerationMutation(v33);
                  v35 = *(id *)(*((_QWORD *)&v93 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v36 = v35;
                  else
                    v36 = 0;
                  v37 = v36;

                  if (v37)
                  {
                    v91 = 0u;
                    v92 = 0u;
                    v89 = 0u;
                    v90 = 0u;
                    v38 = v31;
                    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
                    if (v39)
                    {
                      v40 = v39;
                      v41 = *(_QWORD *)v90;
                      do
                      {
                        for (j = 0; j != v40; ++j)
                        {
                          if (*(_QWORD *)v90 != v41)
                            objc_enumerationMutation(v38);
                          v43 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
                          objc_msgSend(v43, "uniqueIdentifier");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v37, "uniqueIdentifier");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          v46 = objc_msgSend(v44, "isEqual:", v45);

                          if (v46)
                          {
                            objc_msgSend(v38, "removeObject:", v43);
                            v81 = 1;
                            goto LABEL_48;
                          }
                        }
                        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
                      }
                      while (v40);
LABEL_48:
                      v33 = v83;
                      v31 = v84;
                    }

                  }
                  else
                  {
                    v47 = (void *)MEMORY[0x227676638]();
                    v48 = v82;
                    HMFGetOSLogHandle();
                    v49 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      v104 = v50;
                      _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_DEBUG, "%{public}@Accessory Media Profile is NIL", buf, 0xCu);

                    }
                    objc_autoreleasePoolPop(v47);
                  }

                }
                v86 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
              }
              while (v86);

              v29 = v74;
              v7 = v75;
              if ((v81 & 1) != 0)
              {
                if (objc_msgSend(v31, "count"))
                {
                  objc_msgSend(v74, "modelObjectWithUpdatedMediaProfiles:", v31);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "add:", v51);

                }
                else
                {
                  -[HMDActionSet _handleRemovalOfAction:transaction:](v82, "_handleRemovalOfAction:transaction:", v73, v76);
                }
              }
            }
            else
            {

            }
            goto LABEL_79;
          }
          v63 = v27;
          v64 = MEMORY[0x227676638]();
          v65 = v82;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            HMActionTypeAsString();
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v104 = v67;
            v105 = 2112;
            v106 = v63;
            v107 = 2112;
            v108 = v68;
            _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

          }
          v69 = (void *)v64;
LABEL_75:
          objc_autoreleasePoolPop(v69);
          v29 = 0;
LABEL_79:

LABEL_80:
          if (++v7 != v80)
            continue;
          v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
          if (!v80)
            goto LABEL_82;
          goto LABEL_3;
        case 3:
          v9 = v8;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v9;
          else
            v16 = 0;
          v17 = v16;

          if (v17)
          {
            v18 = v77;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
            v20 = v19;

            objc_msgSend(v20, "lightProfiles");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v87[0] = MEMORY[0x24BDAC760];
            v87[1] = 3221225472;
            v87[2] = __53__HMDActionSet_handleRemovalOfAccessory_transaction___block_invoke;
            v87[3] = &unk_24E782CB8;
            v13 = v17;
            v88 = v13;
            objc_msgSend(v21, "na_firstObjectPassingTest:", v87);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              v23 = (void *)MEMORY[0x227676638]();
              v24 = v82;
              HMFGetOSLogHandle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v72;
                v104 = v26;
                v105 = 2112;
                v106 = v22;
                _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Removing natural lighting action for light profile: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v23);
              -[HMDActionSet _handleRemovalOfAction:transaction:](v24, "_handleRemovalOfAction:transaction:", v9, v76);
            }

            goto LABEL_64;
          }
          v58 = MEMORY[0x227676638]();
          v59 = v82;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            goto LABEL_74;
          goto LABEL_73;
        case 4:
          v9 = v8;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v52 = v9;
          else
            v52 = 0;
          v53 = v52;

          if (v53)
          {
            v13 = v53;
            objc_msgSend(v53, "accessory");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "uuid");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "uuid");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v55, "hmf_isEqualToUUID:", v56);

            if (v57)
LABEL_63:
              -[HMDActionSet _handleRemovalOfAction:transaction:](v82, "_handleRemovalOfAction:transaction:", v9, v76);
LABEL_64:
            v29 = v13;
            goto LABEL_79;
          }
          v58 = MEMORY[0x227676638]();
          v59 = v82;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
LABEL_73:
            HMFGetLogIdentifier();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            HMActionTypeAsString();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v104 = v70;
            v105 = 2112;
            v106 = v9;
            v107 = 2112;
            v108 = v71;
            _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

          }
LABEL_74:

          v69 = (void *)v58;
          goto LABEL_75;
        default:
          goto LABEL_80;
      }
    }
  }
LABEL_82:

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDActionSet workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__HMDActionSet_invalidate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)actionWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[HMDActionSet actions](self, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmf_firstObjectWithUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_registerForMessages
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
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
  char v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  -[HMDActionSet type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD5218];
  v5 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD5218]);

  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    v37[0] = v6;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v10;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v13;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v14;
    v15 = v35;
  }
  else
  {
    v34[0] = v6;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v17;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v14;
    v15 = v32;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDActionSet home](self, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "administratorHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerForMessage:receiver:policies:selector:", CFSTR("kAddActionRequestKey"), self, v9, sel__handleAddActionRequest_);

  objc_msgSend(v20, "administratorHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoveActionRequestKey"), self, v12, sel__handleRemoveActionRequest_);

  objc_msgSend(v20, "administratorHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerForMessage:receiver:policies:selector:", CFSTR("kReplaceActionValueKey"), self, v19, sel__handleUpdateActionRequest_);

  objc_msgSend(v20, "administratorHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerForMessage:receiver:policies:selector:", CFSTR("HMUpdateActionSetFromBuilderMessage"), self, v27, sel__handleUpdateActionSet_);

  -[HMDActionSet type](self, "type");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", v4);

  if ((v29 & 1) == 0)
  {
    objc_msgSend(v20, "administratorHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerForMessage:receiver:policies:selector:", CFSTR("kRenameActionSetRequestKey"), self, v19, sel__handleRenameRequest_);

  }
}

- (void)_handleAddActionRequest:(id)a3
{
  id v4;
  void *v5;
  HMDActionSet *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDActionSet *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDActionSet *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDActionSet *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  HMDShortcutActionModel *v31;
  void *v32;
  void *v33;
  HMDActionSet *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDActionSet *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138543362;
    v48 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Add action to action set", (uint8_t *)&v47, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "uuidForKey:", CFSTR("kNewObjectUUIDKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v4, "uuidForKey:", CFSTR("kActionUUID")), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[HMDActionSet actions](v6, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = maximumActionsPerActionSet;

    if (v11 >= v12)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v6;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDActionSet name](v17, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138543618;
        v48 = v19;
        v49 = 2112;
        v50 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can't add action to action set %@; already at maximum actions allowed",
          (uint8_t *)&v47,
          0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 49);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v13);
    }
    else
    {
      objc_msgSend(v4, "dictionaryForKey:", CFSTR("kActionInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmf_numberForKey:", CFSTR("kActionType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v14, "unsignedIntegerValue"))
      {
        case 0:
          -[HMDActionSet _addCharacteristicWriteActionModelWithUUID:message:](v6, "_addCharacteristicWriteActionModelWithUUID:message:", v9, v4);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 1:
          -[HMDActionSet _addMediaPlaybackActionModelWithUUID:message:](v6, "_addMediaPlaybackActionModelWithUUID:message:", v9, v4);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 2:
          if ((objc_msgSend(v4, "isEntitledForShortcutsAutomationAccess") & 1) != 0)
          {
            v31 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDShortcutActionModel alloc], "initWithObjectChangeType:uuid:parentUUID:", 1, v9, v6->_uuid);
            objc_msgSend(v4, "dictionaryForKey:", CFSTR("kActionInfo"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDShortcutActionModel loadModelWithActionInformation:](v31, "loadModelWithActionInformation:", v32);

            if (v31)
            {
LABEL_26:
              -[HMDActionSet home](v6, "home");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "backingStore");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "name");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "transaction:options:", v39, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v41, "add:withMessage:", v31, v4);
              objc_msgSend(v41, "run");

            }
            else
            {
LABEL_20:
              v33 = (void *)MEMORY[0x227676638]();
              v34 = v6;
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = 138543362;
                v48 = v36;
                _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Can't add action to action set, failed to create backing store model object", (uint8_t *)&v47, 0xCu);

              }
              objc_autoreleasePoolPop(v33);
            }
          }
          else
          {
            v42 = (void *)MEMORY[0x227676638]();
            v43 = v6;
            HMFGetOSLogHandle();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = 138543362;
              v48 = v45;
              _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Client does not have have entitlement for shortcut automation, cannot add action", (uint8_t *)&v47, 0xCu);

            }
            objc_autoreleasePoolPop(v42);
            v29 = (void *)MEMORY[0x24BDD1540];
            v30 = 80;
LABEL_30:
            objc_msgSend(v29, "hmErrorWithCode:", v30);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "respondWithError:", v46);

          }
          break;
        case 3:
          -[HMDActionSet _addLightProfileNaturalLightingModelWithUUID:message:](v6, "_addLightProfileNaturalLightingModelWithUUID:message:", v9, v4);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 4:
          -[HMDActionSet _addAppleMediaAccessoryPowerActionModelWithUUID:message:](v6, "_addAppleMediaAccessoryPowerActionModelWithUUID:message:", v9, v4);
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_25:
          v31 = (HMDShortcutActionModel *)v15;
          if (v15)
            goto LABEL_26;
          goto LABEL_20;
        default:
          v25 = (void *)MEMORY[0x227676638]();
          v26 = v6;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 138543362;
            v48 = v28;
            _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Can't add action to action set, unsupported action type", (uint8_t *)&v47, 0xCu);

          }
          objc_autoreleasePoolPop(v25);
          v29 = (void *)MEMORY[0x24BDD1540];
          v30 = 3;
          goto LABEL_30;
      }
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v6;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543362;
      v48 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot add action to action set as UUID is nil.", (uint8_t *)&v47, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v9);
  }

}

- (id)_addCharacteristicWriteActionModelWithUUID:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDActionSet *v9;
  NSObject *v10;
  void *v11;
  HMDCharacteristicWriteActionModel *v12;
  void *v13;
  HMDCharacteristicWriteActionModel *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMDCharacteristicWriteActionModel *v47;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  HMDCharacteristicWriteActionModel *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v70 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Add characteristic write action model", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = [HMDCharacteristicWriteActionModel alloc];
  -[HMDActionSet uuid](v9, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v12, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v13);

  objc_msgSend(v7, "dictionaryForKey:", CFSTR("kActionInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel loadModelWithActionInformation:](v14, "loadModelWithActionInformation:", v15);
  -[HMDActionSet home](v9, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x24BDD1880]);
  -[HMDCharacteristicWriteActionModel accessory](v14, "accessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);
  objc_msgSend(v16, "accessoryWithUUID:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  -[HMDCharacteristicWriteActionModel characteristicID](v14, "characteristicID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel serviceID](v14, "serviceID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "findCharacteristic:forService:", v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v25;
  if (!v25 || !v16)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v26);
    v47 = 0;
    goto LABEL_31;
  }
  v49 = v22;
  v50 = v16;
  v51 = v15;
  v52 = v7;
  v53 = v6;
  v54 = v14;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[HMDActionSet actions](v9, "actions");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v25;
  v61 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (!v61)
    goto LABEL_26;
  v28 = *(_QWORD *)v65;
  v59 = *(_QWORD *)v65;
  v60 = v26;
  do
  {
    for (i = 0; i != v61; ++i)
    {
      if (*(_QWORD *)v65 != v28)
        objc_enumerationMutation(v26);
      v30 = *(id *)(*((_QWORD *)&v64 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      if (v32)
      {
        objc_msgSend(v32, "characteristic");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "accessory");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "service");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "instanceID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "instanceID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "isEqual:", v36))
        {
          objc_msgSend(v34, "uuid");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "accessory");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "isEqual:", v39))
          {
            objc_msgSend(v62, "instanceID");
            v56 = v37;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "service");
            v58 = v34;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "instanceID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v40, "isEqual:", v42);

            v27 = v55;
            v34 = v58;

            v28 = v59;
            v26 = v60;
            if ((v57 & 1) != 0)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = v52;
              objc_msgSend(v52, "respondWithError:", v46);

              v47 = 0;
              v6 = v53;
              v14 = v54;
              v16 = v50;
              v15 = v51;
              v22 = v49;
              goto LABEL_31;
            }
            goto LABEL_23;
          }

          v28 = v59;
          v26 = v60;
        }

LABEL_23:
      }

    }
    v61 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  }
  while (v61);
LABEL_26:

  v14 = v54;
  -[HMDCharacteristicWriteActionModel targetValue](v54, "targetValue");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel targetValue](v54, "targetValue");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v43;
  objc_msgSend(v27, "validateValueForWrite:outValue:", v44, &v63);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v63;

  if (v45)
  {
    v7 = v52;
    objc_msgSend(v52, "respondWithError:", v45);
    v47 = 0;
  }
  else
  {
    -[HMDCharacteristicWriteActionModel setTargetValue:](v54, "setTargetValue:", v26);
    v47 = v54;
    v7 = v52;
  }
  v6 = v53;
  v16 = v50;
  v15 = v51;
  v22 = v49;

LABEL_31:
  return v47;
}

- (id)_addMediaPlaybackActionModelWithUUID:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDActionSet *v9;
  NSObject *v10;
  void *v11;
  HMDMediaPlaybackActionModel *v12;
  void *v13;
  HMDMediaPlaybackActionModel *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  id v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  HMDActionSet *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  HMDMediaPlaybackActionModel *v43;
  void *v44;
  id v46;
  id v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v58 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Add media playback action model", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = [HMDMediaPlaybackActionModel alloc];
  -[HMDActionSet uuid](v9, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v12, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v13);

  objc_msgSend(v7, "dictionaryForKey:", CFSTR("kActionInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackActionModel loadModelWithActionInformation:](v14, "loadModelWithActionInformation:", v15);
  -[HMDActionSet home](v9, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackActionModel profiles](v14, "profiles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __61__HMDActionSet__addMediaPlaybackActionModelWithUUID_message___block_invoke;
  v54[3] = &unk_24E779788;
  v18 = v16;
  v55 = v18;
  objc_msgSend(v17, "na_map:", v54);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaPlaybackActionModel profiles](v14, "profiles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  mapProfilesToAccessoryUUIDs(v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackActionModel setAccessories:](v14, "setAccessories:", v21);

  -[HMDMediaPlaybackActionModel profiles](v14, "profiles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  mapProfilesToServiceUUIDs(v18, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackActionModel setServices:](v14, "setServices:", v23);

  if (objc_msgSend(v19, "count")
    && (-[HMDMediaPlaybackActionModel accessories](v14, "accessories"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "count"),
        v24,
        v25)
    && v18)
  {
    v46 = v18;
    v47 = v6;
    v48 = v15;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[HMDActionSet actions](v9, "actions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v26);
          v31 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v32 = v31;
          else
            v32 = 0;
          v33 = v32;

          if (v33)
          {
            objc_msgSend(v33, "mediaProfiles");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "intersectsSet:", v19);

            if (v35)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "respondWithError:", v44);

              goto LABEL_24;
            }
          }

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v28)
          continue;
        break;
      }
    }

    -[HMDMediaPlaybackActionModel validate](v14, "validate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v7, "respondWithError:", v26);
LABEL_24:
      v43 = 0;
      v6 = v47;
    }
    else
    {
      v43 = v14;
      v6 = v47;
    }
    v15 = v48;
    v18 = v46;
  }
  else
  {
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v9;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaPlaybackActionModel accessories](v14, "accessories");
      v49 = v15;
      v40 = v7;
      v41 = v6;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v58 = v39;
      v59 = 2112;
      v60 = v41;
      v61 = 2112;
      v62 = v19;
      v63 = 2112;
      v64 = v42;
      v65 = 2112;
      v66 = v18;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Attempt to add playback action model with UUID (%@) and mediaProfiles: (%@) and accessories (%@) on home (%@)", buf, 0x34u);

      v6 = v41;
      v7 = v40;
      v15 = v49;

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v26);
    v43 = 0;
  }

  return v43;
}

- (id)_addLightProfileNaturalLightingModelWithUUID:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDActionSet *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMDActionSet *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v32 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Add light profile natural lighting write action model", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("kActionInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v13)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("kActionUUID"));
    +[HMDLightProfileNaturalLightingAction actionWithDictionaryRepresentation:actionSet:](HMDLightProfileNaturalLightingAction, "actionWithDictionaryRepresentation:actionSet:", v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v25);
      v24 = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[HMDActionSet actions](v9, "actions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __69__HMDActionSet__addLightProfileNaturalLightingModelWithUUID_message___block_invoke;
    v29[3] = &unk_24E788D10;
    v16 = v14;
    v30 = v16;
    objc_msgSend(v15, "na_firstObjectPassingTest:", v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v9;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lightProfileUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v21;
        v33 = 2112;
        v34 = v17;
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Action already exists for light profile with UUID %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v23);
    }
    else
    {
      objc_msgSend(v16, "modelObjectWithChangeType:version:", 1, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v23 = v26;
        v24 = v23;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v28);

      v23 = 0;
    }
    v24 = 0;
LABEL_14:

    v25 = v30;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v14);
  v24 = 0;
LABEL_16:

  return v24;
}

- (id)_addAppleMediaAccessoryPowerActionModelWithUUID:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDActionSet *v9;
  NSObject *v10;
  void *v11;
  HMDAppleMediaAccessoryPowerActionModel *v12;
  void *v13;
  HMDAppleMediaAccessoryPowerActionModel *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  HMDAppleMediaAccessoryPowerActionModel *v24;
  void *v25;
  int v26;
  HMDAppleMediaAccessoryPowerActionModel *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v41 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Add Apple TV Power Action model", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = [HMDAppleMediaAccessoryPowerActionModel alloc];
  -[HMDActionSet uuid](v9, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  v14 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v12, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v13);

  v31 = v7;
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("kActionInfo"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryPowerActionModel loadModelWithActionInformation:](v14, "loadModelWithActionInformation:");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HMDActionSet actions](v9, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
        v21 = v20;

        if (v21)
        {
          objc_msgSend(v21, "accessory");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessoryPowerActionModel accessoryUUID](v14, "accessoryUUID");
          v24 = v14;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v23, "hmf_isEqualToUUID:", v25);

          v14 = v24;
          if (v26)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v31;
            objc_msgSend(v31, "respondWithError:", v29);

            v27 = 0;
            goto LABEL_17;
          }
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v16)
        continue;
      break;
    }
  }

  v27 = v14;
  v28 = v31;
LABEL_17:

  return v27;
}

- (void)_handleUpdateActionSet:(id)a3
{
  id v4;
  void *v5;
  HMDActionSet *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
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
    objc_msgSend(v4, "messagePayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to update ActionSet %@ / %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDActionSet _handleUpdateActionSetFromBuilder:](v6, "_handleUpdateActionSetFromBuilder:", v4);

}

- (void)_handleUpdateActionSetFromBuilder:(id)a3
{
  id v4;
  void *v5;
  HMDActionSet *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void (**v12)(id, id, _QWORD);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  HMDActionSet *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  HMDActionSet *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  HMDActionSet *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
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
    v45 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating Home owned action set (from builder)", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDActionSet home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet type](v6, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD5218]);

  if (v11)
  {
    objc_msgSend(v4, "responseHandler");
    v12 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v13, 0);
  }
  else
  {
    objc_msgSend(v9, "backingStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transaction:options:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "messagePayload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hmf_stringForKey:", CFSTR("kActionSetName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_11;
    -[HMDActionSet name](v6, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_11;
    -[HMDActionSet name](v6, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceActionSetName:withNewName:", v22, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v6;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v27;
        v46 = 2112;
        v47 = v23;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to rename actionset with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(v4, "respondWithError:", v23);

      v13 = 0;
      v12 = 0;
    }
    else
    {
LABEL_11:
      objc_msgSend(v4, "messagePayload");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v43 = 0;
      v29 = -[HMDActionSet _updateActionSetFromDictionary:transaction:response:error:](v6, v28, v17, &v43, &v42);
      v13 = v43;
      v12 = (void (**)(id, id, _QWORD))v42;

      if ((v29 & 1) != 0)
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = v6;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v45 = v33;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating actionSet", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __50__HMDActionSet__handleUpdateActionSetFromBuilder___block_invoke;
        v36[3] = &unk_24E7806D8;
        v37 = v4;
        v38 = v19;
        v39 = v31;
        v40 = v9;
        v13 = v13;
        v41 = v13;
        objc_msgSend(v17, "run:", v36);

      }
      else
      {
        -[HMDActionSet name](v6, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v9, "replaceActionSetName:withNewName:", v19, v34);

        objc_msgSend(v4, "respondWithError:", v12);
      }
    }

  }
}

- (void)_handleAddNewAction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  HMDActionSet *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  HMDActionSet *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  HMDActionSet *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10
    && (objc_msgSend(v7, "proxyConnection"), (v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v12 = (void *)v11,
        v13 = objc_msgSend(v7, "isEntitledForShortcutsAutomationAccess"),
        v12,
        (v13 & 1) == 0))
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Missing ShortcutsAutomationAccess Entitlement for Add", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 80, CFSTR("Missing Entitlement"), 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v14);
  }
  else
  {
    -[HMDActionSet addAction:](self, "addAction:", v8);
    objc_msgSend(v7, "transactionResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markChanged");
    v15 = (void *)MEMORY[0x227676638](objc_msgSend(v14, "markSaveToAssistant"));
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v40 = v7;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet uuid](v16, "uuid");
      v39 = v15;
      v21 = v14;
      v22 = v10;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v18;
      v44 = 2112;
      v45 = v20;
      v46 = 2112;
      v47 = v24;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Add Action uuid: %@, Action set uuid: %@", buf, 0x20u);

      v10 = v22;
      v14 = v21;
      v15 = v39;

      v7 = v40;
    }

    objc_autoreleasePoolPop(v15);
    switch(objc_msgSend(v8, "type"))
    {
      case 0:
        v29 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
        v31 = v30;

        if (v31)
          goto LABEL_24;
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v16;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        goto LABEL_26;
      case 1:
      case 3:
      case 4:
        -[HMDActionSet sendNotificationWithAction:message:](v16, "sendNotificationWithAction:message:", v8, v7);
        break;
      case 2:
        v29 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v29;
        else
          v35 = 0;
        v31 = v35;

        if (v31)
        {
LABEL_24:
          -[HMDActionSet sendNotificationWithAction:message:](v16, "sendNotificationWithAction:message:", v29, v7);
        }
        else
        {
          v32 = (void *)MEMORY[0x227676638]();
          v33 = v16;
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
LABEL_26:
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            HMActionTypeAsString();
            v41 = v14;
            v37 = v10;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v36;
            v44 = 2112;
            v45 = v29;
            v46 = 2112;
            v47 = v38;
            _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

            v10 = v37;
            v14 = v41;

          }
LABEL_27:

          objc_autoreleasePoolPop(v32);
        }

        break;
      default:
        break;
    }
  }

}

- (void)sendNotificationWithAction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDActionSet *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("kTransactionUpdate"));

  if (v9)
  {
    objc_msgSend(v7, "respondWithSuccess");
  }
  else
  {
    v25[0] = CFSTR("kActionUUID");
    objc_msgSend(v6, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    v25[1] = CFSTR("kActionInfo");
    objc_msgSend(v6, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v12;
    v25[2] = CFSTR("kHomeUUID");
    -[HMDActionSet home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v20;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Responding to client that ActionSet is successfully added : %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v7, "respondWithPayload:", v16);

  }
}

- (void)_handleAddCharacteristicWriteActionTransaction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCharacteristicWriteAction *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  HMDCharacteristicWriteAction *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  HMDActionSet *v38;
  void *v39;
  void *v40;
  HMDActionSet *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDActionSet *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDCharacteristicWriteAction *v58;
  HMDActionSet *v59;
  HMDActionSet *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "targetValue");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_26;
  v9 = (void *)v8;
  objc_msgSend(v6, "accessory");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_25;
  v11 = (void *)v10;
  objc_msgSend(v6, "serviceID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_25:
    goto LABEL_26;
  }
  v13 = (void *)v12;
  objc_msgSend(v6, "characteristicID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v39);

    goto LABEL_27;
  }
  -[HMDActionSet home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v6, "accessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);

  objc_msgSend(v15, "accessoryWithUUID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v6, "characteristicID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "findCharacteristic:forService:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "transactionResult");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v67, "source") == 1)
  {
    v61 = v21;
    v63 = v18;
    v65 = v15;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v59 = self;
    -[HMDActionSet actions](self, "actions");
    v25 = (HMDCharacteristicWriteAction *)objc_claimAutoreleasedReturnValue();
    v26 = -[HMDCharacteristicWriteAction countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v69;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v69 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v31 = v30;
          else
            v31 = 0;
          v32 = v31;
          v33 = v32;
          if (v32 && objc_msgSend(v32, "isActionForCharacteristic:", v24))
          {
            v40 = (void *)MEMORY[0x227676638]();
            v41 = v59;
            HMFGetOSLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "uuid");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v73 = v43;
              v74 = 2112;
              v75 = v24;
              v76 = 2112;
              v77 = v44;
              _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Action for chr (%@) has already existed with UUID %@. Cleaning from transaction store.", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v40);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "respondWithError:", v45);

            objc_msgSend(v6, "setObjectChangeType:", 3);
            v15 = v65;
            objc_msgSend(v65, "backingStore");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "transaction:options:", CFSTR("RemoveUnpushedActionModel"), v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "add:", v6);
            objc_msgSend(v48, "save");

            v21 = v61;
            v18 = v63;
            goto LABEL_35;
          }

        }
        v27 = -[HMDCharacteristicWriteAction countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        if (v27)
          continue;
        break;
      }
    }

    v18 = v63;
    v15 = v65;
    self = v59;
  }
  if (v24)
  {
    v34 = [HMDCharacteristicWriteAction alloc];
    objc_msgSend(v6, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[HMDCharacteristicWriteAction initWithUUID:characteristic:targetValue:actionSet:](v34, "initWithUUID:characteristic:targetValue:actionSet:", v35, v24, v36, self);
    v38 = self;
    v25 = (HMDCharacteristicWriteAction *)v37;
  }
  else
  {
    v64 = v18;
    v66 = v15;
    v62 = v21;
    v49 = (void *)MEMORY[0x227676638]();
    v60 = self;
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v52;
      v74 = 2112;
      v75 = v6;
      _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Characteristic is not yet available yet due to lack of PV or Resident sync. Create the action using the model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v49);
    v58 = [HMDCharacteristicWriteAction alloc];
    objc_msgSend(v6, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "accessory");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v53, "initWithUUIDString:", v36);
    objc_msgSend(v6, "serviceID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristicID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HMDCharacteristicWriteAction initWithUUID:accessoryUUID:serviceIID:characteristicIID:targetValue:actionSet:](v58, "initWithUUID:accessoryUUID:serviceIID:characteristicIID:targetValue:actionSet:", v35, v57, v54, v55, v56, v50);

    v21 = v62;
    v18 = v64;
    v38 = v60;
    v15 = v66;
  }

  -[HMDActionSet _handleAddNewAction:message:](v38, "_handleAddNewAction:message:", v25, v7);
LABEL_35:

LABEL_27:
}

- (void)_handleAddMediaPlaybackActionTransaction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
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
  uint64_t i;
  void *v19;
  void *v20;
  HMDMediaPlaybackAction *v21;
  id v22;
  void *v23;
  HMDActionSet *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDActionSet *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDActionSet *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMDActionSet *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "profiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "volume");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (objc_msgSend(v6, "state"), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "integerValue")))
    {

LABEL_5:
      v41 = self;
      -[HMDActionSet home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDBCEF0];
      objc_msgSend(v6, "profiles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v6, "profiles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v44 != v17)
              objc_enumerationMutation(v14);
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
            objc_msgSend(v10, "mediaProfileWithUUID:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v13, "addObject:", v20);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v16);
      }

      if (objc_msgSend(v13, "count"))
      {
        v42 = 0;
        v21 = -[HMDMediaPlaybackAction initWithModelObject:parent:error:]([HMDMediaPlaybackAction alloc], "initWithModelObject:parent:error:", v6, v41, &v42);
        v22 = v42;
        if (v21)
        {
          -[HMDActionSet _handleAddNewAction:message:](v41, "_handleAddNewAction:message:", v21, v7);
        }
        else
        {
          v36 = (void *)MEMORY[0x227676638]();
          v37 = v41;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v49 = v39;
            v50 = 2112;
            v51 = v22;
            _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to add media playback action with error: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v36);
          objc_msgSend(v7, "respondWithError:", v22);
        }

      }
      else
      {
        v31 = (void *)MEMORY[0x227676638]();
        v32 = v41;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "profiles");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v34;
          v50 = 2112;
          v51 = v35;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Add media action could not match profile UUIDs to profiles. UUIDs: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Could not map profile UUIDs to media profiles"), 0, 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "respondWithError:", v22);
      }

      goto LABEL_29;
    }
    objc_msgSend(v6, "encodedPlaybackArchive");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
      goto LABEL_5;
  }
  else
  {

  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "profiles");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volume");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "state");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodedPlaybackArchive");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v49 = v26;
    v50 = 2112;
    v51 = v27;
    v52 = 2112;
    v53 = v28;
    v54 = 2112;
    v55 = v29;
    v56 = 2112;
    v57 = v30;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Add media action invalid parameter: profiles : [%@], volume: %@, state: %@, encodedPlaybackArchive: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v23);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 20, CFSTR("Invalid action properties"), 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v10);
LABEL_29:

}

- (void)_handleAddShortcutActionTransaction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDShortcutAction *v9;
  void *v10;
  void *v11;
  HMDShortcutAction *v12;
  void *v13;
  HMDActionSet *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [HMDShortcutAction alloc];
    objc_msgSend(v6, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDShortcutAction initWithSerializedShortcut:uuid:actionSet:](v9, "initWithSerializedShortcut:uuid:actionSet:", v10, v11, self);

    -[HMDActionSet _handleAddNewAction:message:](self, "_handleAddNewAction:message:", v12, v7);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Add shortcut invalid parameter: no data", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 20, CFSTR("Invalid action properties"), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v17);

  }
}

- (void)_handleAddLightProfileNaturalLightingActionTransaction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  HMDLightProfileNaturalLightingAction *v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = 0;
  v8 = -[HMDLightProfileNaturalLightingAction initWithModelObject:parent:error:]([HMDLightProfileNaturalLightingAction alloc], "initWithModelObject:parent:error:", v7, self, &v10);

  v9 = v10;
  if (v8)
    -[HMDActionSet _handleAddNewAction:message:](self, "_handleAddNewAction:message:", v8, v6);
  else
    objc_msgSend(v6, "respondWithError:", v9);

}

- (void)_handleAddAppleMediaAccessoryPowerActionTransaction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDActionSet *v9;
  NSObject *v10;
  void *v11;
  HMDAppleMediaAccessoryPowerAction *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@_handleAddAppleMediaAccessoryPowerActionTransaction:message: with model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v14 = 0;
  v12 = -[HMDAppleMediaAccessoryPowerAction initWithModelObject:parent:error:]([HMDAppleMediaAccessoryPowerAction alloc], "initWithModelObject:parent:error:", v6, v9, &v14);
  v13 = v14;
  if (v12)
    -[HMDActionSet _handleAddNewAction:message:](v9, "_handleAddNewAction:message:", v12, v7);
  else
    objc_msgSend(v7, "respondWithError:", v13);

}

- (void)_removeAction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  HMDActionSet *v16;
  NSObject *v17;
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
  HMDActionSet *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  HMDActionSet *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDActionSet home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11
      && (objc_msgSend(v7, "proxyConnection"), (v12 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v13 = (void *)v12,
          v14 = objc_msgSend(v7, "isEntitledForShortcutsAutomationAccess"),
          v13,
          (v14 & 1) == 0))
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = self;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v42;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Missing ShortcutsAutomationAccess Entitlement for Remove", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 80, CFSTR("Missing Entitlement"), 0, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v29);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638](-[HMDActionSet removeAction:](self, "removeAction:", v9));
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = v6;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v44 = v7;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v43 = v15;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDActionSet uuid](v16, "uuid");
        v21 = v8;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v18;
        v50 = 2112;
        v51 = v20;
        v52 = 2112;
        v53 = v23;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Remove Action uuid: %@, Action set uuid: %@", buf, 0x20u);

        v8 = v21;
        v7 = v44;

        v15 = v43;
        v6 = v45;
      }

      objc_autoreleasePoolPop(v15);
      v46[0] = CFSTR("kActionUUID");
      objc_msgSend(v9, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = CFSTR("kHomeUUID");
      v47[0] = v25;
      objc_msgSend(v8, "uuid");
      v26 = v8;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v26;
      objc_msgSend(v7, "respondWithPayload:", v29);
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet name](v31, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet uuid](v31, "uuid");
      v35 = v6;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUIDString");
      v37 = v7;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v33;
      v50 = 2112;
      v51 = v34;
      v52 = 2112;
      v53 = v38;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@/%@: Ignoring _removeAction since home is nil", buf, 0x20u);

      v6 = v35;
      v7 = v37;

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v11);
  }

}

- (void)_handleRemoveActionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  HMDActionSet *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kActionUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet home](self, "home");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v15;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing action from actionSet : %@ / %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v8, "backingStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transaction:options:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "modelObjectWithChangeType:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "add:withMessage:", v20, v4);
    objc_msgSend(v19, "run");

  }
}

- (void)_handleRemovalOfAction:(id)a3 transaction:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDActionSet _handleRemovalOfActions:transaction:](self, "_handleRemovalOfActions:transaction:", v9, v7, v10, v11);
}

- (void)_handleRemovalOfActions:(id)a3 transaction:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "modelObjectWithChangeType:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "add:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_handleRemoveActionTransaction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDActionSet *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "transactionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet home](self, "home");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
  {
    -[HMDActionSet _removeAction:message:](self, "_removeAction:message:", v10, v7);
    if (objc_msgSend(v12, "isOwnerUser"))
    {
      objc_msgSend(v8, "markChanged");
    }
    else if (objc_msgSend(v12, "isAdminUser"))
    {
      objc_msgSend(v8, "markLocalChanged");
    }
    objc_msgSend(v8, "markSaveToAssistant");
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v16;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Couldn't remove action as it was not found : %@ / %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v17);

  }
}

- (void)_removeDonatedIntent
{
  id v3;

  +[HMDDonationHandler sharedDonationHandler](HMDDonationHandler, "sharedDonationHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeIntentForActionSet:", self);

}

- (void)_handleRenameRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDActionSet *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  HMDActionSet *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  HMDActionSetModel *v28;
  void *v29;
  void *v30;
  HMDActionSetModel *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDActionSet *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  HMDActionSet *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kActionSetName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "length"))
  {
    v7 = (void *)MEMORY[0x24BDD7480];
    -[HMDActionSet type](self, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "isBuiltinActionSetType:", v8);

    if ((v7 & 1) == 0)
    {
      v36 = (void *)MEMORY[0x227676638]();
      v37 = self;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDActionSet type](v37, "type");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDActionSet name](v37, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v39;
        v48 = 2112;
        v49 = v40;
        v50 = 2112;
        v51 = (uint64_t)v41;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Attempt to rename the actionSet %@/%@ to nil name", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v36);
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = 20;
      goto LABEL_17;
    }
    +[HMDHome getBuiltinActionSets](HMDHome, "getBuiltinActionSets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet type](self, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMDLocalizedStringForKey(v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet type](v14, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v16;
      v48 = 2112;
      v49 = v17;
      v50 = 2112;
      v51 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Resetting the name of built-in actionSet of type %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);

    v6 = (void *)v12;
  }
  v18 = HMMaxLengthForNaming();
  if (objc_msgSend(v6, "length") <= v18)
  {
    -[HMDActionSet home](self, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[HMDActionSet name](self, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "replaceActionSetName:withNewName:", v26, v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        v28 = [HMDActionSetModel alloc];
        -[HMDActionSet uuid](self, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v28, "initWithObjectChangeType:uuid:parentUUID:", 2, v29, v30);

        -[HMDActionSetModel setName:](v31, "setName:", v6);
        objc_msgSend(v25, "backingStore");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "transaction:options:", v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "add:withMessage:", v31, v4);
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __37__HMDActionSet__handleRenameRequest___block_invoke;
        v42[3] = &unk_24E799FD0;
        v43 = v25;
        v44 = v6;
        v45 = self;
        objc_msgSend(v35, "run:", v42);

        v27 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "respondWithError:", v27);
    goto LABEL_20;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  v23 = (void *)MEMORY[0x24BDD1540];
  v24 = 46;
LABEL_17:
  objc_msgSend(v23, "hmErrorWithCode:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v25);
LABEL_21:

}

- (BOOL)_handleRenameActionSetTransaction:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDActionSet *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hm_truncatedNameString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDActionSet home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "replaceName:withNewName:", v11, v9);

  -[HMDActionSet setName:](self, "setName:", v9);
  v27[0] = CFSTR("kActionSetUUID");
  -[HMDActionSet uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v28[1] = v9;
  v27[1] = CFSTR("kActionSetName");
  v27[2] = CFSTR("kHomeUUID");
  objc_msgSend(v10, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "respondWithPayload:", v17));
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v21;
    v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Responded to client with payload : %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v18);

  return 1;
}

- (void)_updateWriteAction:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDCharacteristicWriteActionModel *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCharacteristicWriteActionModel *v22;
  id v23;
  void *v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "uuidForKey:", CFSTR("kActionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("kActionInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "characteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    objc_msgSend(v11, "validateValueForWrite:outValue:", v10, &v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v25;

    if (v12)
    {
      objc_msgSend(v7, "respondWithError:", v12);
    }
    else
    {
      v15 = [HMDCharacteristicWriteActionModel alloc];
      -[HMDActionSet uuid](self, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v15, "initWithObjectChangeType:uuid:parentUUID:", 2, v8, v16);

      -[HMDCharacteristicWriteActionModel setTargetValue:](v22, "setTargetValue:", v10);
      -[HMDActionSet home](self, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "backingStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v23 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "transaction:options:", v19, v20);
      v24 = v8;
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v23;
      objc_msgSend(v21, "add:withMessage:", v22, v7);
      objc_msgSend(v21, "run");

      v8 = v24;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v14);

  }
}

- (void)_updatePlaybackAction:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HMDActionSet *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDActionSet *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDActionSet *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  uint64_t v50;
  void *v51;
  HMDActionSet *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  HMDActionSet *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("kActionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_arrayForKey:", *MEMORY[0x24BDD6648]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v6;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x24BDD6658]);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v68, "integerValue");
    objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x24BDD6668]);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_dataForKey:", *MEMORY[0x24BDD6638]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = 0;
    }

    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v78 = v22;
      v79 = 2112;
      v80 = v68;
      v81 = 2112;
      v82 = v71;
      v83 = 2112;
      v84 = v70;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@actionInfo state %@ volume %@ playbackArchive %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v19);
    if (v71 || v70 || v11)
    {
      v65 = v9;
      v66 = v8;
      v67 = v7;
      -[HMDActionSet home](v20, "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v10, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v29 = v10;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v73 != v32)
              objc_enumerationMutation(v29);
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i));
            objc_msgSend(v27, "mediaProfileWithUUID:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
              objc_msgSend(v28, "addObject:", v35);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        }
        while (v31);
      }

      if (objc_msgSend(v28, "count"))
      {
        v6 = v69;
        objc_msgSend(v69, "validate");
        v36 = objc_claimAutoreleasedReturnValue();
        v7 = v67;
        if (v36)
        {
          v37 = (void *)v36;
          objc_msgSend(v67, "respondWithError:", v36);
        }
        else
        {
          v38 = objc_alloc((Class)objc_msgSend(v69, "modelClass"));
          objc_msgSend(v69, "modelIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDActionSet uuid](v20, "uuid");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)objc_msgSend(v38, "initWithObjectChangeType:uuid:parentUUID:", 2, v39, v40);

          v41 = objc_msgSend(v68, "integerValue");
          if (v41 != objc_msgSend(v69, "state"))
            objc_msgSend(v64, "setState:", v68);
          objc_msgSend(v69, "volume");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = HMFEqualObjects();

          if ((v43 & 1) == 0)
            objc_msgSend(v64, "setVolume:", v71);
          objc_msgSend(v69, "mediaProfiles");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = HMFEqualObjects();

          if ((v45 & 1) == 0)
          {
            objc_msgSend(v64, "setProfiles:", v29);
            mapProfilesToAccessoryUUIDs(v27, v29);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setAccessories:", v46);

            mapProfilesToServiceUUIDs(v27, v29);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setServices:", v47);

          }
          objc_msgSend(v69, "playbackArchive");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = HMFEqualObjects();

          if ((v49 & 1) == 0)
            v50 = objc_msgSend(v64, "setEncodedPlaybackArchive:", v70);
          v51 = (void *)MEMORY[0x227676638](v50);
          v52 = v20;
          HMFGetOSLogHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "state");
            v63 = v51;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "volume");
            v62 = v52;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "encodedPlaybackArchive");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v78 = v54;
            v79 = 2112;
            v80 = v55;
            v81 = 2112;
            v82 = v56;
            v83 = 2112;
            v84 = v57;
            _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@model state %@ volume %@ playbackArchive %@", buf, 0x2Au);

            v52 = v62;
            v51 = v63;

          }
          objc_autoreleasePoolPop(v51);
          objc_msgSend(v27, "backingStore");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "name");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "transaction:options:", v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "add:withMessage:", v64, v67);
          objc_msgSend(v61, "run");

          v37 = 0;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v67;
        objc_msgSend(v67, "respondWithError:", v37);
        v6 = v69;
      }

      v9 = v65;
      v8 = v66;
      v18 = v68;
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v20;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v78 = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@At least one parameter change needed in the updateAction request", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 20, CFSTR("No action set in update action request"), 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v27);
      v18 = v68;
    }

  }
  else
  {
    v13 = v10;
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@At least one media profile needed in the updateAction request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 20, CFSTR("At least one media profile needed in the updateAction request"), 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v18);
    v10 = v13;
  }

}

- (void)_updateNaturalLightingAction:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDActionSet *v10;
  NSObject *v11;
  void *v12;
  HMDLightProfileNaturalLightingActionModel *v13;
  void *v14;
  void *v15;
  HMDLightProfileNaturalLightingActionModel *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("kActionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v12;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting action with action info %@:%@", (uint8_t *)&v22, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = [HMDLightProfileNaturalLightingActionModel alloc];
  objc_msgSend(v6, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet uuid](v10, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v13, "initWithObjectChangeType:uuid:parentUUID:", 2, v14, v15);

  -[HMDLightProfileNaturalLightingActionModel setNaturalLightingEnabled:](v16, "setNaturalLightingEnabled:", objc_msgSend(v8, "hmf_BOOLForKey:", *MEMORY[0x24BDD64F8]));
  -[HMDActionSet home](v10, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "backingStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transaction:options:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "add:withMessage:", v16, v7);
  objc_msgSend(v21, "run");

}

- (void)_updateAppleMediaAccessoryPowerAction:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDActionSet *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HMDActionSet *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("kActionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_UUIDForKey:", *MEMORY[0x24BDD5270]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x24BDD5280]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
    v15 = v10 == 0;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v16;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@accessoryUUID or targetSleepWakeState is nil: %@, %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v31 = v18;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v8;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v10;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating Apple TV power action: %@, with action info: %@, accessoryUUID: %@, targetSleepWakeState: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDActionSet home](v12, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "backingStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __65__HMDActionSet__updateAppleMediaAccessoryPowerAction_forMessage___block_invoke;
    v23[3] = &unk_24E792F40;
    v24 = v6;
    v25 = v12;
    v26 = v9;
    v27 = v10;
    v28 = v19;
    v29 = v7;
    v22 = v19;
    objc_msgSend(v21, "performBlock:", v23);

  }
}

- (void)_handleUpdateActionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  HMDActionSet *v30;
  NSObject *v31;
  HMDActionSet *v32;
  HMDActionSet *v33;
  HMDActionSet *v34;
  void *v35;
  HMDActionSet *v36;
  void *v37;
  HMDActionSet *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  _BYTE v42[24];
  HMDActionSet *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kActionUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet home](self, "home");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = 2;
  }
  else
  {
    v12 = objc_msgSend(v6, "type");
    switch(v12)
    {
      case 0:
        v16 = v6;
        objc_opt_class();
        v17 = objc_opt_isKindOfClass() & 1;
        if (v17)
          v18 = v16;
        else
          v18 = 0;
        v19 = v18;

        if (v17)
        {
          -[HMDActionSet _updateWriteAction:forMessage:](self, "_updateWriteAction:forMessage:", v16, v4);
          goto LABEL_28;
        }
        v29 = (void *)MEMORY[0x227676638]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_37;
        goto LABEL_36;
      case 1:
        v16 = v6;
        objc_opt_class();
        v20 = objc_opt_isKindOfClass() & 1;
        if (v20)
          v21 = v16;
        else
          v21 = 0;
        v22 = v21;

        if (v20)
        {
          -[HMDActionSet _updatePlaybackAction:forMessage:](self, "_updatePlaybackAction:forMessage:", v16, v4);
          goto LABEL_28;
        }
        v29 = (void *)MEMORY[0x227676638]();
        v32 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_36;
        goto LABEL_37;
      case 3:
        v16 = v6;
        objc_opt_class();
        v23 = objc_opt_isKindOfClass() & 1;
        if (v23)
          v24 = v16;
        else
          v24 = 0;
        v25 = v24;

        if (v23)
        {
          -[HMDActionSet _updateNaturalLightingAction:forMessage:](self, "_updateNaturalLightingAction:forMessage:", v16, v4);
          goto LABEL_28;
        }
        v29 = (void *)MEMORY[0x227676638]();
        v33 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_36;
        goto LABEL_37;
      case 4:
        v16 = v6;
        objc_opt_class();
        v26 = objc_opt_isKindOfClass() & 1;
        if (v26)
          v27 = v16;
        else
          v27 = 0;
        v28 = v27;

        if (v26)
        {
          -[HMDActionSet _updateAppleMediaAccessoryPowerAction:forMessage:](self, "_updateAppleMediaAccessoryPowerAction:forMessage:", v16, v4);
LABEL_28:

          goto LABEL_42;
        }
        v29 = (void *)MEMORY[0x227676638]();
        v34 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
LABEL_36:
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          HMActionTypeAsString();
          v36 = (HMDActionSet *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v42 = 138543874;
          *(_QWORD *)&v42[4] = v35;
          *(_WORD *)&v42[12] = 2112;
          *(_QWORD *)&v42[14] = v16;
          *(_WORD *)&v42[22] = 2112;
          v43 = v36;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", v42, 0x20u);

        }
LABEL_37:

        objc_autoreleasePoolPop(v29);
LABEL_38:
        v37 = (void *)MEMORY[0x227676638](v12, v13, v14, v15);
        v38 = self;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v42 = 138543874;
          *(_QWORD *)&v42[4] = v40;
          *(_WORD *)&v42[12] = 2112;
          *(_QWORD *)&v42[14] = v6;
          *(_WORD *)&v42[22] = 2112;
          v43 = v38;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unknown action %@ in set %@, cannot handle update action request", v42, 0x20u);

        }
        objc_autoreleasePoolPop(v37);
        v10 = (void *)MEMORY[0x24BDD1540];
        v11 = 3;
        break;
      default:
        goto LABEL_38;
    }
  }
  objc_msgSend(v10, "hmErrorWithCode:", v11, *(_OWORD *)v42, *(_QWORD *)&v42[16], v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v41);

LABEL_42:
}

- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDApplicationData *v11;
  void *v12;
  void *v13;
  HMDApplicationData *v14;
  void *v15;
  HMDActionSet *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "transactionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet appData](self, "appData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDActionSet appData](self, "appData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithModel:", v6);

  }
  else
  {
    v11 = [HMDApplicationData alloc];
    objc_msgSend(v6, "appDataDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet uuid](self, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDApplicationData initWithDictionary:parentUUID:](v11, "initWithDictionary:parentUUID:", v12, v13);
    -[HMDActionSet setAppData:](self, "setAppData:", v14);

    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appDataDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
  objc_msgSend(v8, "markChanged");
  objc_msgSend(v7, "respondWithPayload:", 0);

}

- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "transactionResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet setAppData:](self, "setAppData:", 0);
  objc_msgSend(v6, "markChanged");
  objc_msgSend(v5, "respondWithPayload:", 0);

}

- (NSArray)associatedAccessories
{
  void *v2;
  void *v3;

  -[HMDActionSet actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_120);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDActionSet actions](self, "actions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isAssociatedWithAccessory:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_generateOverallError:(id)a3 forSource:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDActionSet *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMDActionSet *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  HMDActionSet *v32;
  uint64_t v33;
  void *v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDActionSet *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  HMDActionSet *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  HMDActionSet *v67;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  HMDActionSet *v73;
  void *v74;
  HMDActionSet *v75;
  NSObject *v76;
  void *v77;
  HMDActionSet *v78;
  void *v79;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  HMDActionSet *v94;
  unint64_t v95;
  void *v96;
  id v97;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint8_t v118[128];
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  HMDActionSet *v122;
  __int16 v123;
  id v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v6, "setNumberStyle:", 1);
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 63);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = MEMORY[0x227676638]();
    v73 = self;
    v74 = (void *)v72;
    v75 = v73;
    HMFGetOSLogHandle();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v120 = v77;
      v121 = 2112;
      v122 = v75;
      v123 = 2112;
      v124 = v71;
      _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_ERROR, "%{public}@No accessories were changed so noting that action set %@ failed with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v74);
    v70 = v71;
    goto LABEL_69;
  }
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v7 = v5;
  v94 = self;
  v90 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
  if (v90)
  {
    v84 = v6;
    v85 = v5;
    v8 = 0;
    v91 = *(_QWORD *)v113;
    v9 = 0x24BDD1000uLL;
    v89 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v113 != v91)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * v10);
        objc_msgSend(v7, "hmf_dictionaryForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_dataForKey:", CFSTR("HM.mediaPlaybackErrorDataKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 1344), "hmf_unarchiveFromData:error:", v13, 0);
        v97 = (id)objc_claimAutoreleasedReturnValue();
        if (v97)
        {
          v14 = v12;
          v15 = v10;
          v16 = (void *)MEMORY[0x227676638]();
          v17 = v94;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v120 = v19;
            v121 = 2112;
            v122 = v94;
            v123 = 2112;
            v124 = v97;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Received media error for action set %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v16);
          ++v8;
          v10 = v15;
          v12 = v14;
        }
        else
        {
          objc_msgSend(v12, "hmf_dataForKey:", CFSTR("HM.genericErrorDataKey"));
          v20 = objc_claimAutoreleasedReturnValue();

          v100 = (void *)v20;
          objc_msgSend(*(id *)(v9 + 1344), "hmf_unarchiveFromData:error:", v20, 0);
          v97 = (id)objc_claimAutoreleasedReturnValue();
          if (v97)
          {
            v21 = (void *)MEMORY[0x227676638]();
            v22 = v94;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v24 = v10;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v120 = v25;
              v121 = 2112;
              v122 = v94;
              v123 = 2112;
              v124 = v97;
              _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Received error for action set %@: %@", buf, 0x20u);

              v10 = v24;
            }

            objc_autoreleasePoolPop(v21);
            ++v8;
          }
          else
          {
            -[HMDActionSet home](v94, "home");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v11);
            objc_msgSend(v26, "accessoryWithUUID:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v29 = v28;
            else
              v29 = 0;
            v97 = v29;

            v110 = 0u;
            v111 = 0u;
            v108 = 0u;
            v109 = 0u;
            v30 = v12;
            v86 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
            if (v86)
            {
              v31 = *(_QWORD *)v109;
              v32 = v94;
              v82 = v12;
              v83 = v10;
              v88 = v30;
              v81 = *(_QWORD *)v109;
              do
              {
                v33 = 0;
                do
                {
                  if (*(_QWORD *)v109 != v31)
                    objc_enumerationMutation(v30);
                  v87 = v33;
                  v92 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v33);
                  objc_msgSend(v30, "hmf_dictionaryForKey:");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v104 = 0u;
                  v105 = 0u;
                  v106 = 0u;
                  v107 = 0u;
                  v35 = v34;
                  v103 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
                  if (v103)
                  {
                    v102 = *(_QWORD *)v105;
                    v36 = v8;
                    v37 = (uint64_t)v100;
                    v99 = v35;
                    while (2)
                    {
                      v38 = 0;
                      v39 = (void *)v37;
                      do
                      {
                        if (*(_QWORD *)v105 != v102)
                          objc_enumerationMutation(v35);
                        v40 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v38);
                        objc_msgSend(v35, "hmf_dictionaryForKey:", v40);
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v41, "hmf_dataForKey:", CFSTR("kCharacteristicErrorDataKey"));
                        v37 = objc_claimAutoreleasedReturnValue();

                        if (v37)
                        {
                          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v37, 0);
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v42)
                          {
                            v101 = (void *)v37;
                            v43 = (void *)MEMORY[0x227676638]();
                            v44 = v32;
                            HMFGetOSLogHandle();
                            v45 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                            {
                              HMFGetLogIdentifier();
                              v46 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543874;
                              v120 = v46;
                              v121 = 2112;
                              v122 = v32;
                              v123 = 2112;
                              v124 = v42;
                              _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Received error for action set %@: %@", buf, 0x20u);

                            }
                            objc_autoreleasePoolPop(v43);
                            ++v36;
                            if (a4 == 1)
                            {
                              v95 = v36;
                              v96 = v42;
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v40, "integerValue"));
                              v47 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v92, "integerValue"));
                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v97, "findCharacteristic:forService:", v47, v48);
                              v49 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v49, "type");
                              v50 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v49, "service");
                              v51 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v51, "type");
                              v52 = (void *)objc_claimAutoreleasedReturnValue();
                              v53 = objc_msgSend(v93, "requiresDeviceUnlock:forService:", v50, v52);

                              if (v53)
                              {
                                objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 4000);
                                v65 = (void *)objc_claimAutoreleasedReturnValue();
                                v66 = (void *)MEMORY[0x227676638]();
                                v67 = v44;
                                HMFGetOSLogHandle();
                                v68 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                                {
                                  HMFGetLogIdentifier();
                                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138543874;
                                  v120 = v69;
                                  v121 = 2112;
                                  v122 = v94;
                                  v123 = 2112;
                                  v124 = v65;
                                  _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Execution for action set %@ completed with error: %@", buf, 0x20u);

                                }
                                objc_autoreleasePoolPop(v66);
                                v70 = v65;

                                v6 = v84;
                                v5 = v85;
                                goto LABEL_68;
                              }

                              v32 = v94;
                              v36 = v95;
                              v9 = 0x24BDD1000;
                              v37 = (uint64_t)v101;
                              v42 = v96;
                            }
                            else
                            {
                              v9 = 0x24BDD1000;
                              v37 = (uint64_t)v101;
                            }
                          }

                          v35 = v99;
                        }

                        ++v38;
                        v39 = (void *)v37;
                      }
                      while (v103 != v38);
                      v103 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
                      if (v103)
                        continue;
                      break;
                    }
                  }
                  else
                  {
                    v36 = v8;
                    v37 = (uint64_t)v100;
                  }
                  v100 = (void *)v37;
                  v8 = v36;

                  v33 = v87 + 1;
                  v30 = v88;
                  v7 = v89;
                  v12 = v82;
                  v10 = v83;
                  v31 = v81;
                }
                while (v87 + 1 != v86);
                v86 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
              }
              while (v86);
            }
            else
            {
              v7 = v89;
            }

          }
          v13 = v100;
        }

        ++v10;
      }
      while (v10 != v90);
      v54 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
      v90 = v54;
    }
    while (v54);

    self = v94;
    v6 = v84;
    v5 = v85;
    if (v8)
    {
      -[HMDActionSet actions](v94, "actions");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "count");

      v57 = v8 >= v56;
      self = v94;
      v58 = v57 ? 63 : 64;
      objc_msgSend(*(id *)(v9 + 1344), "hmErrorWithCode:", v58);
      v59 = objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        v60 = (void *)v59;
        v61 = (void *)MEMORY[0x227676638]();
        v62 = v94;
        HMFGetOSLogHandle();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v120 = v64;
          v121 = 2112;
          v122 = v94;
          v123 = 2112;
          v124 = v60;
          _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@Execution for action set %@ completed with error: %@", buf, 0x20u);

        }
        goto LABEL_67;
      }
    }
  }
  else
  {

  }
  v61 = (void *)MEMORY[0x227676638]();
  v78 = self;
  HMFGetOSLogHandle();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v120 = v79;
    v121 = 2112;
    v122 = v78;
    _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@Execution for action set %@ completed successfully", buf, 0x16u);

  }
  v60 = 0;
LABEL_67:

  objc_autoreleasePoolPop(v61);
  v70 = v60;
LABEL_68:

LABEL_69:
  return v70;
}

- (void)handleExecutionCompletionWithResponsePayload:(id)a3 error:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDActionSet *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  HMDActionSet *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v7 = a4;
  -[HMDActionSet workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_alloc(MEMORY[0x24BE3F138]);
  v10 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@, %s:%ld"), v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 2499);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v9, "initWithName:", v12);

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet executionMessage](v14, "executionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v16;
    v49 = 1042;
    v50 = 16;
    v51 = 2098;
    v52 = v18;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Action set execution completed for request identifier: %{public,uuid_t}.16P", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDActionSet executionMessage](v14, "executionMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet executionInitialStates](v14, "executionInitialStates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet executionActionSetEvent](v14, "executionActionSetEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet setExecutionActionSetEvent:](v14, "setExecutionActionSetEvent:", 0);
  -[HMDActionSet setExecutionMessage:](v14, "setExecutionMessage:", 0);
  -[HMDActionSet setExecutionStart:](v14, "setExecutionStart:", 0);
  -[HMDActionSet setExecutionTimeoutTimer:](v14, "setExecutionTimeoutTimer:", 0);
  -[HMDActionSet setExecutionInitialStates:](v14, "setExecutionInitialStates:", 0);
  -[HMDActionSet home](v14, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet setLastExecutionDate:](v14, "setLastExecutionDate:", v23);

    objc_msgSend(v19, "name");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = CFSTR("kExecuteActionSetRequestKey");
    if (v24)
      v26 = (__CFString *)v24;
    v27 = v26;

    objc_msgSend(v22, "saveWithReason:postSyncNotification:", v27, 0);
    v45 = CFSTR("kActionSetLastexecutionDate");
    -[HMDActionSet lastExecutionDate](v14, "lastExecutionDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x24BE3F1D0];
    -[HMDActionSet messageDestination](v14, "messageDestination");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "messageWithName:destination:payload:", CFSTR("kActionSetExecutedNotificationKey"), v31, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setIdentifier:", v33);

    objc_msgSend(v32, "setRemote:", objc_msgSend(v19, "isRemote"));
    -[HMDActionSet msgDispatcher](v14, "msgDispatcher");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sendMessage:", v32);

    objc_msgSend(v19, "responseHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = v7;
      if (!v36)
      {
        -[HMDActionSet _generateOverallError:forSource:](v14, "_generateOverallError:forSource:", v43, parseMessageSource(v19));
        v36 = (id)objc_claimAutoreleasedReturnValue();
      }
      v37 = (void *)objc_msgSend(v43, "mutableCopy");
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v20, CFSTR("kCharacteristicValuesBeforeWrite"));
      objc_msgSend(v19, "respondWithPayload:error:", v37, v36);

    }
    objc_msgSend(v22, "handleReportingSessionResponseMessage:", v32);
    objc_msgSend(v22, "endReportingSessionForMessage:", v19);
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "submitLogEvent:error:", v21, v7);

  }
  else
  {
    v39 = (void *)MEMORY[0x227676638]();
    v40 = v14;
    HMFGetOSLogHandle();
    v41 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v42;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring execution completion because home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v39);
  }

  __HMFActivityScopeLeave();
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  HMDActionSet *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDActionSet executionTimeoutTimer](self, "executionTimeoutTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HMDActionSet executionMessage](self, "executionMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Timer execution timeout triggered. Resetting executionInProgress.", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet handleExecutionCompletionWithResponsePayload:error:](v8, "handleExecutionCompletionWithResponsePayload:error:", 0, v11);

    }
  }

}

- (void)_execute:(id)a3 captureCurrentState:(BOOL)a4 writeRequestTuples:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDActionSet *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDActionSet *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDActionSet *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDActionSet workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138543362;
    v40 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Executing the action set", (uint8_t *)&v39, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDActionSet actions](v12, "actions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v12;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v27;
      v41 = 2112;
      v42 = v28;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Not executing the action set: there are no actions in it: %@", (uint8_t *)&v39, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = 25;
    goto LABEL_11;
  }
  -[HMDActionSet executionMessage](v12, "executionMessage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v12;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543362;
      v40 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not executing the action set: another execution is already in progress", (uint8_t *)&v39, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = 65;
LABEL_11:
    objc_msgSend(v22, "hmErrorWithCode:", v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "respondWithError:", v29);

    goto LABEL_12;
  }
  -[HMDActionSet setExecutionMessage:](v12, "setExecutionMessage:", v8);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet setExecutionStart:](v12, "setExecutionStart:", v30);

  -[HMDActionSet home](v12, "home");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "startReportingSessionForMessage:", v8);

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 1, 600.0);
  -[HMDActionSet setExecutionTimeoutTimer:](v12, "setExecutionTimeoutTimer:", v32);

  -[HMDActionSet executionTimeoutTimer](v12, "executionTimeoutTimer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDelegate:", v12);

  -[HMDActionSet workQueue](v12, "workQueue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet executionTimeoutTimer](v12, "executionTimeoutTimer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDelegateQueue:", v34);

  -[HMDActionSet executionTimeoutTimer](v12, "executionTimeoutTimer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "resume");

  -[HMDActionSet setExecutionInitialStates:](v12, "setExecutionInitialStates:", 0);
  -[HMDActionSet _createActionExecutionLogEvent:](v12, "_createActionExecutionLogEvent:", v8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet setExecutionActionSetEvent:](v12, "setExecutionActionSetEvent:", v37);

  if (v6)
  {
    -[HMDActionSet _issueReadRequests](v12, "_issueReadRequests");
  }
  else
  {
    v38 = (void *)MEMORY[0x227676638]();
    -[HMDActionSet _issueWriteRequests:](v12, "_issueWriteRequests:", v9);
    objc_autoreleasePoolPop(v38);
  }
LABEL_12:

}

- (id)_createActionExecutionLogEvent:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  HMDActionSet *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDActionSetEvent *v33;
  uint64_t v34;
  void *v35;
  HMDActionSetEvent *v36;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v38 = parseMessageSource(v3);
  v40 = v3;
  if (v38 == 1)
  {
    v39 = CFSTR("com.apple.Siri");
    v4 = CFSTR("com.apple.Siri");
  }
  else
  {
    objc_msgSend(v3, "applicationBundleIdentifier");
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)MEMORY[0x24BDBCEF0];
  -[HMDActionSet actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[HMDActionSet actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v48;
LABEL_6:
    v11 = 0;
    while (2)
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v11);
      switch(objc_msgSend(v12, "type"))
      {
        case 0:
          v13 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          if (v15)
          {
            objc_msgSend(v15, "characteristic");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "accessory");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v7, "addObject:", v17);

            goto LABEL_23;
          }
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_52;
          goto LABEL_51;
        case 1:
          v13 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v13;
          else
            v20 = 0;
          v15 = v20;

          if (v15)
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            objc_msgSend(v15, "mediaProfiles");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v44;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v44 != v24)
                    objc_enumerationMutation(v21);
                  objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "accessory");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v26)
                    objc_msgSend(v7, "addObject:", v26);

                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
              }
              while (v23);
            }

            goto LABEL_53;
          }
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_52;
          goto LABEL_51;
        case 3:
          v13 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = v13;
          else
            v18 = 0;
          v15 = v18;

          if (v15)
          {
            objc_msgSend(v15, "lightProfile");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "accessory");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
              goto LABEL_23;
            goto LABEL_22;
          }
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_52;
          goto LABEL_51;
        case 4:
          v13 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v13;
          else
            v27 = 0;
          v15 = v27;

          if (v15)
          {
            objc_msgSend(v15, "accessory");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
LABEL_22:
              objc_msgSend(v7, "addObject:", v16);
LABEL_23:

          }
          else
          {
            v28 = (void *)MEMORY[0x227676638]();
            v29 = self;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
LABEL_51:
              HMFGetLogIdentifier();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              HMActionTypeAsString();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v53 = v31;
              v54 = 2112;
              v55 = v13;
              v56 = 2112;
              v57 = v32;
              _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

            }
LABEL_52:

            objc_autoreleasePoolPop(v28);
            v15 = 0;
          }
LABEL_53:

LABEL_54:
          if (++v11 != v9)
            continue;
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
          if (!v9)
            goto LABEL_56;
          goto LABEL_6;
        default:
          goto LABEL_54;
      }
    }
  }
LABEL_56:

  v33 = [HMDActionSetEvent alloc];
  v34 = objc_msgSend(v7, "count");
  objc_msgSend(v40, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[HMDActionSetEvent initWithActionSet:source:numAccessories:bundleId:transactionId:](v33, "initWithActionSet:source:numAccessories:bundleId:transactionId:", self, v38, v34, v39, v35);

  return v36;
}

- (void)_issueWriteRequests:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  HMDActionSet *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  uint64_t v42;
  HMDActionSet *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  HMDActionSet *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  HMDActionSet *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  HMDActionSet *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  HMDActionSet *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t k;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  HMDActionSet *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  HMDActionSet *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  HMDActionSet *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  HMDActionSet *v143;
  void *v144;
  id v145;
  HMDActionSet *v146;
  void *v147;
  void *v148;
  id obj;
  _QWORD v150[5];
  _QWORD v151[5];
  _QWORD v152[5];
  id v153;
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _BYTE v171[128];
  _BYTE v172[128];
  uint8_t v173[128];
  uint8_t buf[4];
  void *v175;
  __int16 v176;
  id v177;
  __int16 v178;
  void *v179;
  __int16 v180;
  void *v181;
  __int16 v182;
  void *v183;
  _BYTE v184[128];
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDActionSet workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v146 = self;
  -[HMDActionSet executionMessage](self, "executionMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v4;
  v8 = (void *)objc_msgSend(v4, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v135 = v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v137 = objc_claimAutoreleasedReturnValue();
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  -[HMDActionSet actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v167, v184, 16);
  v148 = v6;
  v140 = v7;
  if (!v11)
  {
LABEL_65:

    v59 = (void *)MEMORY[0x227676638]();
    v60 = v146;
    HMFGetOSLogHandle();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v175 = v62;
      v176 = 2112;
      v177 = v135;
      v178 = 2112;
      v179 = v139;
      v180 = 2112;
      v181 = v136;
      v182 = 2112;
      v183 = v7;
      _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_DEBUG, "%{public}@Preparing to execute characteristic write actions: [%@], media playback actions: [%@], natural lighting actions: [%@] short cut actions: [%@]", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v59);
    v63 = (void *)objc_msgSend(v138, "mutableCopy");
    v64 = v63;
    v143 = v60;
    if (v63)
    {
      v65 = v63;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v65 = (id)objc_claimAutoreleasedReturnValue();
    }
    obj = v65;

    v165 = 0u;
    v166 = 0u;
    v163 = 0u;
    v164 = 0u;
    v73 = v135;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v163, v173, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v164;
      do
      {
        for (i = 0; i != v75; ++i)
        {
          if (*(_QWORD *)v164 != v76)
            objc_enumerationMutation(v73);
          v78 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
          objc_msgSend(v78, "characteristic");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "targetValue");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "authorizationData");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "identifier");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:", v79, v80, v81, v82, 1);
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(obj, "addObject:", v83);
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v163, v173, 16);
      }
      while (v75);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v145 = v139;
    v85 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v159, v172, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v160;
      do
      {
        for (j = 0; j != v86; ++j)
        {
          if (*(_QWORD *)v160 != v87)
            objc_enumerationMutation(v145);
          v89 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * j);
          objc_msgSend(v89, "convertedCharacteristicWriteRequests");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (v90)
          {
            objc_msgSend(v84, "addObject:", v89);
            objc_msgSend(v90, "characteristicWriteRequests");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = objc_msgSend(v91, "count");

            if (v92)
            {
              objc_msgSend(v90, "characteristicWriteRequests");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "addObjectsFromArray:", v93);

            }
            objc_msgSend(v90, "residualAction");
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            if (v94)
            {
              objc_msgSend(v90, "residualAction");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "addObject:", v95);

            }
          }

        }
        v86 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v159, v172, 16);
      }
      while (v86);
    }

    v133 = v84;
    objc_msgSend(v145, "removeObjectsInArray:", v84);
    objc_msgSend(v145, "addObjectsFromArray:", v144);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v96 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v97 = v136;
    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
    v142 = (void *)v96;
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v156;
      do
      {
        for (k = 0; k != v99; ++k)
        {
          if (*(_QWORD *)v156 != v100)
            objc_enumerationMutation(v97);
          v102 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * k);
          objc_msgSend(v102, "lightProfile");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "writeRequestForTransitionStartWithLightProfile:startDate:type:", v103, v96, 1);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          if (v104)
          {
            objc_msgSend(v147, "addObject:", v104);
            v105 = (void *)objc_msgSend(obj, "copy");
            v152[0] = MEMORY[0x24BDAC760];
            v152[1] = 3221225472;
            v152[2] = __36__HMDActionSet__issueWriteRequests___block_invoke;
            v152[3] = &unk_24E7797F0;
            v152[4] = v102;
            v153 = obj;
            v154 = v147;
            objc_msgSend(v105, "na_each:", v152);

          }
          else
          {
            v106 = (void *)MEMORY[0x227676638]();
            v107 = v143;
            HMFGetOSLogHandle();
            v108 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v175 = v109;
              v176 = 2112;
              v177 = v102;
              _os_log_impl(&dword_2218F0000, v108, OS_LOG_TYPE_ERROR, "%{public}@Failed to create write request for natural lighting action: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v106);
            v96 = (uint64_t)v142;
          }

        }
        v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
      }
      while (v99);
    }

    v110 = (void *)MEMORY[0x24BE3F1D0];
    v111 = v143;
    -[HMDActionSet messageDestination](v143, "messageDestination");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "messageWithName:destination:payload:", CFSTR("kActionSetWillStartExecutionNotificationKey"), v112, 0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v148;
    objc_msgSend(v113, "setRemote:", objc_msgSend(v148, "isRemote"));
    objc_msgSend(v148, "transport");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setTransport:", v114);

    -[HMDActionSet msgDispatcher](v143, "msgDispatcher");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v113;
    objc_msgSend(v115, "sendMessage:completionHandler:", v113, 0);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet _executeCharacteristicWriteRequests:message:](v143, "_executeCharacteristicWriteRequests:message:", obj, v148);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "addObject:", v117);

    -[HMDActionSet _executeMediaPlaybackActions:message:](v143, "_executeMediaPlaybackActions:message:", v145, v148);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "addObject:", v118);

    -[HMDActionSet _executeNaturalLightingActions:writeRequests:message:](v143, "_executeNaturalLightingActions:writeRequests:message:", v97, v147, v148);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "addObject:", v119);

    v7 = v140;
    v71 = (void *)v137;
    v72 = v133;
    if ((objc_msgSend(v134, "hmf_isEmpty") & 1) == 0)
    {
      v120 = (void *)MEMORY[0x227676638]();
      v121 = v143;
      HMFGetOSLogHandle();
      v122 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v175 = v123;
        v176 = 2112;
        v177 = v134;
        _os_log_impl(&dword_2218F0000, v122, OS_LOG_TYPE_DEBUG, "%{public}@Preparing to execute natural lighting actions for matter: [%@]", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v120);
      -[HMDActionSet _executeNaturalLightingActionsForMatter:](v121, "_executeNaturalLightingActionsForMatter:", v134);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "addObject:", v124);

      v111 = v143;
    }
    -[HMDActionSet _executeAppleMediaAccessoryPowerActions:message:](v111, "_executeAppleMediaAccessoryPowerActions:message:", v137, v148);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "addObject:", v125);

    -[HMDActionSet _executeGenericActions:message:](v111, "_executeGenericActions:message:", v140, v148);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "addObject:", v126);

    v127 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMDActionSet workQueue](v111, "workQueue");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = (void *)objc_msgSend(v127, "initWithQueue:", v128);

    objc_msgSend(MEMORY[0x24BE3F180], "allSettled:", v116);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = MEMORY[0x24BDAC760];
    v151[0] = MEMORY[0x24BDAC760];
    v151[1] = 3221225472;
    v151[2] = __36__HMDActionSet__issueWriteRequests___block_invoke_130;
    v151[3] = &unk_24E797000;
    v151[4] = v111;
    objc_msgSend(v130, "inContext:then:", v129, v151);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    v150[0] = v131;
    v150[1] = 3221225472;
    v150[2] = __36__HMDActionSet__issueWriteRequests___block_invoke_134;
    v150[3] = &unk_24E79A980;
    v150[4] = v111;
    objc_msgSend(v132, "getResultWithCompletion:", v150);

    v70 = v144;
    goto LABEL_109;
  }
  v12 = v11;
  v13 = *(_QWORD *)v168;
  while (2)
  {
    v14 = 0;
LABEL_7:
    if (*(_QWORD *)v168 != v13)
      objc_enumerationMutation(obj);
    v15 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v14);
    switch(objc_msgSend(v15, "type"))
    {
      case 0:
        v16 = v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        if (v18)
        {
          if (objc_msgSend(v138, "count"))
            goto LABEL_62;
          v19 = v135;
          goto LABEL_61;
        }
        v42 = MEMORY[0x227676638]();
        v43 = v146;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          goto LABEL_53;
        goto LABEL_47;
      case 1:
        v16 = v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v16;
        else
          v26 = 0;
        v18 = v26;

        if (v18)
        {
          v19 = v139;
          goto LABEL_61;
        }
        v42 = MEMORY[0x227676638]();
        v43 = v146;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
LABEL_47:
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          HMActionTypeAsString();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v175 = v45;
          v176 = 2112;
          v177 = v16;
          v178 = 2112;
          v179 = v46;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

          v6 = v148;
        }
        goto LABEL_53;
      case 2:
        v27 = v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
        v29 = v28;

        v30 = v29;
        if (!v29
          || (objc_msgSend(v6, "proxyConnection"), (v31 = objc_claimAutoreleasedReturnValue()) == 0)
          || (v32 = (void *)v31,
              v33 = objc_msgSend(v6, "isEntitledForShortcutsAutomationAccess"),
              v32,
              (v33 & 1) != 0))
        {
          objc_msgSend(v7, "addObject:", v27);

LABEL_63:
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v167, v184, 16);
            if (!v12)
              goto LABEL_65;
            continue;
          }
          goto LABEL_7;
        }
        v66 = (void *)MEMORY[0x227676638]();
        v67 = v146;
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v175 = v69;
          _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Missing ShortcutsAutomationAccess Entitlement for Execute(2)", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v66);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 80, CFSTR("Missing Entitlement"), 0, 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDActionSet handleExecutionCompletionWithResponsePayload:error:](v67, "handleExecutionCompletionWithResponsePayload:error:", 0, v70);
        v71 = (void *)v137;
        v72 = v30;
LABEL_109:

        return;
      case 3:
        v34 = v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v34;
        else
          v35 = 0;
        v18 = v35;

        if (!v18)
        {
          v47 = MEMORY[0x227676638]();
          v48 = v146;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            HMActionTypeAsString();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v175 = v50;
            v176 = 2112;
            v177 = v34;
            v178 = 2112;
            v179 = v51;
            _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

            v7 = v140;
            v6 = v148;
          }

          v52 = (void *)v47;
          goto LABEL_58;
        }
        objc_msgSend(v18, "lightProfile");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v36)
        {
          v55 = MEMORY[0x227676638]();
          v56 = v146;
          HMFGetOSLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v175 = v58;
            v176 = 2112;
            v177 = v18;
            _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Skipping executing natural lighting action, missing light profile: %@", buf, 0x16u);

            v7 = v140;
          }

          v52 = (void *)v55;
LABEL_58:
          objc_autoreleasePoolPop(v52);
          goto LABEL_62;
        }
        objc_msgSend(v18, "lightProfile");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v37, "supportsCHIP") & 1) != 0)
        {
          objc_msgSend(v18, "lightProfile");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isNaturalLightingSupported");

          if (v39)
          {
            v19 = v134;
            goto LABEL_61;
          }
        }
        else
        {

        }
        v19 = v136;
LABEL_61:
        objc_msgSend(v19, "addObject:", v18);
LABEL_62:

        goto LABEL_63;
      case 4:
        v40 = v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v41 = v40;
        else
          v41 = 0;
        v18 = v41;

        if (v18)
        {
          v19 = (void *)v137;
          goto LABEL_61;
        }
        v42 = MEMORY[0x227676638]();
        v43 = v146;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          HMActionTypeAsString();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v175 = v53;
          v176 = 2112;
          v177 = v40;
          v178 = 2112;
          v179 = v54;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

          v7 = v140;
        }
LABEL_53:

        v25 = (void *)v42;
LABEL_54:
        objc_autoreleasePoolPop(v25);
        goto LABEL_63;
      default:
        v20 = MEMORY[0x227676638]();
        v21 = v146;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          HMActionTypeAsString();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v175 = v23;
          v176 = 2112;
          v177 = v15;
          v178 = 2112;
          v179 = v24;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown action type %@:%@", buf, 0x20u);

          v7 = v140;
        }

        v25 = (void *)v20;
        goto LABEL_54;
    }
  }
}

- (id)_executeCharacteristicWriteRequests:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMDActionSet *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 v25;
  _BYTE buf[18];
  __int16 v27;
  __int128 *v28;
  __int16 v29;
  HMDActionSet *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = parseMessageSource(v7);
    v24 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v7, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v7, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v25 = *(_OWORD *)buf;
      v16 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v27 = 2098;
      v28 = &v25;
      v29 = 2114;
      v30 = v11;
      v31 = 2048;
      v32 = v16;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Executing write requests for request identifier: %{public,uuid_t}.16P from characteristic write action set: %{public}@ count: %lu", buf, 0x30u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDActionSet home](v11, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transport");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v7, "qualityOfService");
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __60__HMDActionSet__executeCharacteristicWriteRequests_message___block_invoke;
    v22[3] = &unk_24E799400;
    v22[4] = v11;
    v23 = v24;
    objc_msgSend(v17, "writeCharacteristicValues:source:identifier:transport:qualityOfService:withCompletionHandler:", v6, v8, v18, v19, v20, v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_executeMediaPlaybackActions:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  HMDActionSet *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = parseMessageSource(v7);
    objc_msgSend(v7, "clientName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("Unknown");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    v22 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2048;
      v26 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Executing media playback actions, count: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __53__HMDActionSet__executeMediaPlaybackActions_message___block_invoke;
    v20[3] = &unk_24E799400;
    v20[4] = v15;
    v21 = v22;
    -[HMDActionSet _executeMediaPlaybackActions:source:clientName:completionHandler:](v15, "_executeMediaPlaybackActions:source:clientName:completionHandler:", v6, v8, v12, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_executeNaturalLightingActions:(id)a3 writeRequests:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDActionSet *v22;
  NSObject *v23;
  void *v24;
  os_unfair_lock_s *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  id obj;
  void *v41;
  void *v42;
  void *v43;
  HMDActionSet *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[6];
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  os_unfair_lock_s *v61;
  uint64_t v62;
  void *v63;
  int v64;
  _BYTE buf[12];
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v38 = a5;
  v39 = v8;
  v37 = v9;
  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v41 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    v61 = (os_unfair_lock_s *)&v60;
    v62 = 0x2810000000;
    v63 = &unk_22282991F;
    v64 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    v44 = self;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetching up-to-date light profile settings before execution", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v57 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v16, "lightProfile");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "UUIDString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            *(_QWORD *)buf = 0;
            objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v50[0] = MEMORY[0x24BDAC760];
            v50[1] = 3221225472;
            v50[2] = __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke;
            v50[3] = &unk_24E779840;
            v50[4] = v16;
            v50[5] = v44;
            v55 = &v60;
            v51 = v43;
            v52 = v19;
            v53 = v41;
            v54 = *(id *)buf;
            objc_msgSend(v17, "fetchNaturalLightingEnabledWithCompletion:", v50);
            objc_msgSend(v42, "addObject:", v20);

          }
          else
          {
            v21 = (void *)MEMORY[0x227676638]();
            v22 = v44;
            HMFGetOSLogHandle();
            v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v24;
              v66 = 2112;
              v67 = v16;
              _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Skipping executing natural lighting action, missing light profile: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v21);
            v25 = v61 + 8;
            os_unfair_lock_lock_with_options();
            v26 = (void *)MEMORY[0x24BDBCE70];
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "hmd_dictionaryWithActionExecutionError:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v28, v19);

            os_unfair_lock_unlock(v25);
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v13);
    }

    v29 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMDActionSet workQueue](v44, "workQueue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithQueue:", v30);

    objc_msgSend(MEMORY[0x24BE3F180], "allSettled:", v42);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_140;
    v45[3] = &unk_24E779868;
    v45[4] = v44;
    v33 = v41;
    v46 = v33;
    v47 = v38;
    v48 = obj;
    v34 = v43;
    v49 = v34;
    objc_msgSend(v32, "inContext:then:", v31, v45);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v60, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

- (id)_executeNaturalLightingWriteRequests:(id)a3 message:(id)a4 naturalLightingActions:(id)a5 naturalLightingActionResultByActionUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMDActionSet *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  _BYTE buf[18];
  __int16 v36;
  __int128 *v37;
  __int16 v38;
  HMDActionSet *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v27 = parseMessageSource(v11);
    v33 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v11, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v11, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v34 = *(_OWORD *)buf;
      v21 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v36 = 2098;
      v37 = &v34;
      v38 = 2114;
      v39 = v16;
      v40 = 2048;
      v41 = v21;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Executing write requests for request identifier: %{public,uuid_t}.16P from natural lighting action set: %{public}@ count: %lu", buf, 0x30u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDActionSet home](v16, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transport");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v11, "qualityOfService");
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __124__HMDActionSet__executeNaturalLightingWriteRequests_message_naturalLightingActions_naturalLightingActionResultByActionUUID___block_invoke;
    v28[3] = &unk_24E78B3C0;
    v28[4] = v16;
    v29 = v33;
    v30 = v10;
    v31 = v12;
    v32 = v13;
    objc_msgSend(v22, "writeCharacteristicValues:source:identifier:transport:qualityOfService:withCompletionHandler:", v30, v27, v23, v24, v25, v28);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_executeNaturalLightingActionsForMatter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HMDActionSet home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "executeMatterNaturalLightingActions:", v4);
    else
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_executeAppleMediaAccessoryPowerActions:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  HMDActionSet *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = parseMessageSource(v7);
    objc_msgSend(v7, "clientName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("Unknown");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    v22 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2048;
      v26 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Executing apple tv power actions, count: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __64__HMDActionSet__executeAppleMediaAccessoryPowerActions_message___block_invoke;
    v20[3] = &unk_24E799400;
    v20[4] = v15;
    v21 = v22;
    -[HMDActionSet _executeAppleMediaAccessoryPowerActions:source:clientName:completionHandler:](v15, "_executeAppleMediaAccessoryPowerActions:source:clientName:completionHandler:", v6, v8, v12, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_executeGenericActions:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = parseMessageSource(v7);
    objc_msgSend(v7, "clientName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("Unknown");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    v17 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__HMDActionSet__executeGenericActions_message___block_invoke;
    v15[3] = &unk_24E799400;
    v15[4] = self;
    v16 = v17;
    -[HMDActionSet _executeGenericActions:source:clientName:completionHandler:](self, "_executeGenericActions:source:clientName:completionHandler:", v6, v8, v12, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)_issueReadRequests
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id location;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[HMDActionSet workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc(MEMORY[0x24BE3F138]);
  v5 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@, %s:%ld"), v6, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 3232);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (id)objc_msgSend(v4, "initWithName:", v7);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[HMDActionSet actions](self, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v10)
  {
    obj = v9;
    v39 = *(_QWORD *)v53;
    do
    {
      v40 = v10;
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v53 != v39)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v41 = v13;

        if (v41)
        {
          objc_msgSend(v41, "characteristic");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "supportsRead"))
          {
            +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v15);

          }
        }
        v16 = v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        if (v18)
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend(v18, "mediaProfiles");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v49 != v21)
                  objc_enumerationMutation(v19);
                v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                objc_msgSend(v23, "mediaSession");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "state");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "uniqueIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v26);

              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            }
            while (v20);
          }

        }
      }
      v9 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v10);
  }

  -[HMDActionSet executionMessage](self, "executionMessage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = parseMessageSource(v27);

  v29 = v56;
  objc_msgSend(v37, "count");

  objc_initWeak(&location, self);
  -[HMDActionSet home](self, "home");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet description](self, "description");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet executionMessage](self, "executionMessage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "qualityOfService");
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __34__HMDActionSet__issueReadRequests__block_invoke;
  v42[3] = &unk_24E793318;
  objc_copyWeak(&v46, &location);
  v43 = v56;
  v34 = v37;
  v44 = v34;
  v35 = v8;
  v45 = v35;
  objc_msgSend(v30, "readCharacteristicValues:source:sourceForLogging:qualityOfService:withCompletionHandler:", v34, v28, v31, v33, v42);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);

  __HMFActivityScopeLeave();
}

- (void)_executeMediaPlaybackActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  HMDActionSet *v24;
  id obj;
  id v27;
  _QWORD block[4];
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  _QWORD *v37;
  _QWORD *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id location;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v27 = a5;
  v23 = a6;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  v24 = self;
  MEMORY[0x227675180](self, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %s:%ld"), v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 3292);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (id)objc_msgSend(v11, "initWithName:", v14);

  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__29713;
  v47[4] = __Block_byref_object_dispose__29714;
  v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__29713;
  v45[4] = __Block_byref_object_dispose__29714;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet workQueue](self, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_group_create();
  objc_initWeak(&location, self);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v10;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v41;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v19);
        dispatch_group_enter(v16);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke;
        v32[3] = &unk_24E7798B8;
        v33 = v15;
        objc_copyWeak(&v39, &location);
        v34 = v49;
        v35 = v20;
        v37 = v47;
        v38 = v45;
        v36 = v16;
        objc_msgSend(v20, "executeWithSource:clientName:completionHandler:", a4, v27, v32);

        objc_destroyWeak(&v39);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v17);
  }

  -[HMDActionSet workQueue](v24, "workQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke_148;
  block[3] = &unk_24E795008;
  v29 = v23;
  v30 = v47;
  v31 = v45;
  v22 = v23;
  dispatch_group_notify(v16, v21, block);

  objc_destroyWeak(&location);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  __HMFActivityScopeLeave();

}

- (void)_executeAppleMediaAccessoryPowerActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id obj;
  id v26;
  _QWORD block[4];
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  NSObject *v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37;
  id location;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v26 = a5;
  v24 = a6;
  v12 = objc_alloc(MEMORY[0x24BE3F138]);
  v13 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %s:%ld"), v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 3381);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (id)objc_msgSend(v12, "initWithName:", v15);

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__29713;
  v45[4] = __Block_byref_object_dispose__29714;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__29713;
  v43[4] = __Block_byref_object_dispose__29714;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_group_create();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v11;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v40;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v19);
        objc_initWeak(&location, self);
        dispatch_group_enter(v16);
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __92__HMDActionSet__executeAppleMediaAccessoryPowerActions_source_clientName_completionHandler___block_invoke;
        v31[3] = &unk_24E779908;
        objc_copyWeak(&v37, &location);
        v21 = v47;
        v35 = v45;
        v36 = v43;
        v32 = v21;
        v33 = v20;
        v34 = v16;
        objc_msgSend(v20, "executeWithSource:clientName:completionHandler:", a4, v26, v31);

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v17);
  }

  -[HMDActionSet workQueue](self, "workQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__HMDActionSet__executeAppleMediaAccessoryPowerActions_source_clientName_completionHandler___block_invoke_149;
  block[3] = &unk_24E795008;
  v28 = v24;
  v29 = v45;
  v30 = v43;
  v23 = v24;
  dispatch_group_notify(v16, v22, block);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  __HMFActivityScopeLeave();
}

- (void)_executeGenericActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id obj;
  id v22;
  _QWORD block[4];
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  NSObject *v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id location;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v22 = a5;
  v11 = a6;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__29713;
  v41[4] = __Block_byref_object_dispose__29714;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__29713;
  v39[4] = __Block_byref_object_dispose__29714;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v20 = v11;
  v40 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_group_create();
  objc_initWeak(&location, self);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        dispatch_group_enter(v13);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke;
        v27[3] = &unk_24E779908;
        v28 = v12;
        objc_copyWeak(&v33, &location);
        v29 = v17;
        v31 = v41;
        v32 = v39;
        v30 = v13;
        objc_msgSend(v17, "executeWithSource:clientName:completionHandler:", a4, v22, v27);

        objc_destroyWeak(&v33);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v14);
  }

  -[HMDActionSet workQueue](self, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke_150;
  block[3] = &unk_24E795008;
  v24 = v20;
  v25 = v41;
  v26 = v39;
  v19 = v20;
  dispatch_group_notify(v13, v18, block);

  objc_destroyWeak(&location);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  HMDActionSet *v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  if (v9)
  {
    -[HMDActionSet _handleRemoveActionTransaction:message:](self, "_handleRemoveActionTransaction:message:", v9, v7);
    v10 = v6;
  }
  else
  {
    v10 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      -[HMDActionSet _handleRemoveAppDataModel:message:](self, "_handleRemoveAppDataModel:message:", v12, v7);
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543874;
        v19 = v16;
        v20 = 2112;
        v21 = v10;
        v22 = 2112;
        v23 = (id)objc_opt_class();
        v17 = v23;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v10);
    }
  }

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
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  char v36;
  id v37;
  void *v38;
  HMDActionSet *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  void *v44;
  HMDActionSet *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
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
    -[HMDActionSet _processActionSetModelUpdated:message:](self, "_processActionSetModelUpdated:message:", v12, v10);
    v13 = v9;
    goto LABEL_37;
  }
  v13 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[HMDActionSet _handleAddCharacteristicWriteActionTransaction:message:](self, "_handleAddCharacteristicWriteActionTransaction:message:", v15, v10);
LABEL_36:

      goto LABEL_37;
    }
    goto LABEL_35;
  }
  v13 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v13;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    objc_msgSend(v19, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[HMDActionSet _handleAddMediaPlaybackActionTransaction:message:](self, "_handleAddMediaPlaybackActionTransaction:message:", v19, v10);
      goto LABEL_36;
    }
LABEL_35:
    objc_msgSend(v17, "transactionObjectUpdated:newValues:message:", v8, v13, v10);
    goto LABEL_36;
  }
  v13 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v13;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_msgSend(v22, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[HMDActionSet _handleAddShortcutActionTransaction:message:](self, "_handleAddShortcutActionTransaction:message:", v22, v10);
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v13 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v13;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    objc_msgSend(v25, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[HMDActionSet _handleAddLightProfileNaturalLightingActionTransaction:message:](self, "_handleAddLightProfileNaturalLightingActionTransaction:message:", v25, v10);
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v13 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v13;
  else
    v27 = 0;
  v28 = v27;

  if (v28)
  {
    objc_msgSend(v28, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[HMDActionSet _handleAddAppleMediaAccessoryPowerActionTransaction:message:](self, "_handleAddAppleMediaAccessoryPowerActionTransaction:message:", v28, v10);
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v13 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v13;
  else
    v30 = 0;
  v31 = v30;

  if (v31)
  {
    objc_msgSend(v31, "uuid");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet actionWithUUID:](self, "actionWithUUID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v33, "transactionObjectUpdated:newValues:message:", v8, v13, v10);
    }
    else
    {
      v50 = 0;
      v36 = __HMDActionSetAddActionWithModel(self, v31, v10, &v50);
      v37 = v50;
      if ((v36 & 1) == 0)
      {
        v38 = (void *)MEMORY[0x227676638]();
        v39 = self;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = v38;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v52 = v41;
          v53 = 2112;
          v54 = v31;
          v55 = 2112;
          v56 = v37;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to process model, %@, with error: %@", buf, 0x20u);

          v38 = v49;
        }

        objc_autoreleasePoolPop(v38);
        objc_msgSend(v10, "responseHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v10, "responseHandler");
          v43 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, _QWORD))v43)[2](v43, v37, 0);

        }
      }

    }
  }
  else
  {
    v13 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v13;
    else
      v34 = 0;
    v35 = v34;

    if (v35)
    {
      -[HMDActionSet _handleUpdateAppDataModel:message:](self, "_handleUpdateAppDataModel:message:", v35, v10);
    }
    else
    {
      v44 = (void *)MEMORY[0x227676638]();
      v45 = self;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v47;
        v53 = 2112;
        v54 = v13;
        v55 = 2112;
        v56 = (id)objc_opt_class();
        v48 = v56;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v13);
    }
  }
LABEL_37:

}

- (void)_processActionSetModelUpdated:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "transactionResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[HMDActionSet _handleRenameActionSetTransaction:message:](self, "_handleRenameActionSetTransaction:message:", v16, v6);
    objc_msgSend(v7, "markSaveToAssistant");
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(v16, "lastExecutionDate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[HMDActionSet lastExecutionDate](self, "lastExecutionDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastExecutionDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

    if (v14 == -1)
    {
      objc_msgSend(v16, "lastExecutionDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet setLastExecutionDate:](self, "setLastExecutionDate:", v15);

    }
  }
  objc_msgSend(v7, "markChanged");
  if (!v9)
    objc_msgSend(v6, "respondWithPayload:", 0);

}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDActionSetModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDActionSetModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = [HMDActionSetModel alloc];
  -[HMDActionSet uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  -[HMDActionSet name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSetModel setName:](v9, "setName:", v10);

  -[HMDActionSet type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSetModel setType:](v9, "setType:", v11);

  -[HMDActionSet lastExecutionDate](self, "lastExecutionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDActionSet lastExecutionDate](self, "lastExecutionDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSetModel setLastExecutionDate:](v9, "setLastExecutionDate:", v13);

  }
  return v9;
}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v5;
  HMDActionSet *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDActionSet *v21;
  NSObject *v22;
  void *v23;
  HMDActionSet *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  int64_t v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v8;
    v41 = 2048;
    v42 = a3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating backing store objects for version: %ld", buf, 0x16u);

  }
  v32 = a3;

  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet modelObjectWithChangeType:](v6, "modelObjectWithChangeType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HMDActionSet actions](v6, "actions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v34)
  {
    v12 = *(_QWORD *)v36;
    v33 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v11);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "type");
        if (v15 <= 4)
        {
          if (v15 == 2)
          {
            -[HMDActionSet home](v6, "home");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDActionSet uuid](v6, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "triggerOwnedActionSetWithUUID:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "addAction:", v14);
            objc_msgSend(v14, "modelObjectWithChangeType:", 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
LABEL_11:
              objc_msgSend(v9, "addObject:", v16);

              continue;
            }
          }
          else
          {
            objc_msgSend(v14, "modelObjectWithChangeType:", 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              goto LABEL_11;
          }
        }
        v20 = (void *)MEMORY[0x227676638]();
        v21 = v6;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = v11;
          v24 = v6;
          v25 = v9;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          HMActionTypeAsString();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v26;
          v41 = 2112;
          v42 = (int64_t)v14;
          v43 = 2112;
          v44 = v27;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Did not create backing store object for action %@:%@", buf, 0x20u);

          v9 = v25;
          v6 = v24;
          v11 = v23;
          v12 = v33;
        }

        objc_autoreleasePoolPop(v20);
      }
      v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v34);
  }

  -[HMDActionSet appData](v6, "appData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32 >= 3 && v28)
  {
    -[HMDActionSet appData](v6, "appData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "modelObjectWithChangeType:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v30);

  }
  return v9;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((isInternalBuild() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[HMDActionSet name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDActionSet uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSDate)lastExecutionDate
{
  return self->_lastExecutionDate;
}

- (void)setLastExecutionDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastExecutionDate, a3);
}

- (HMFTimer)executionTimeoutTimer
{
  return self->_executionTimeoutTimer;
}

- (void)setExecutionTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_executionTimeoutTimer, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 80, 1);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (NSDate)executionStart
{
  return self->_executionStart;
}

- (void)setExecutionStart:(id)a3
{
  objc_storeStrong((id *)&self->_executionStart, a3);
}

- (HMFMessage)executionMessage
{
  return self->_executionMessage;
}

- (void)setExecutionMessage:(id)a3
{
  objc_storeStrong((id *)&self->_executionMessage, a3);
}

- (NSDictionary)executionInitialStates
{
  return self->_executionInitialStates;
}

- (void)setExecutionInitialStates:(id)a3
{
  objc_storeStrong((id *)&self->_executionInitialStates, a3);
}

- (HMDActionSetEvent)executionActionSetEvent
{
  return self->_executionActionSetEvent;
}

- (void)setExecutionActionSetEvent:(id)a3
{
  objc_storeStrong((id *)&self->_executionActionSetEvent, a3);
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
  objc_storeStrong((id *)&self->_executionActionSetEvent, 0);
  objc_storeStrong((id *)&self->_executionInitialStates, 0);
  objc_storeStrong((id *)&self->_executionMessage, 0);
  objc_storeStrong((id *)&self->_executionStart, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_executionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_lastExecutionDate, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_spiClientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_currentActions, 0);
}

void __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke_2;
  block[3] = &unk_24E7798E0;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  v5 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v5;
  v13 = *(_QWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v6 = (id)v8;
  v12 = v8;
  v7 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v14);
}

void __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke_150(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(a1 + 32));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v2 = v3;
  }

}

void __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Action execution failed with error: %@ / %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Action execution finished with success: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "hmd_dictionaryWithActionExecutionError:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v16);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __92__HMDActionSet__executeAppleMediaAccessoryPowerActions_source_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
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
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v6 = (void *)MEMORY[0x227676638]();
  v7 = WeakRetained;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] ATV Power action failed with error: %@ ", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v13;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] ATV Power action finished with success", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "hmd_dictionaryWithActionExecutionError:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v19);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __92__HMDActionSet__executeAppleMediaAccessoryPowerActions_source_clientName_completionHandler___block_invoke_149(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke_2;
  block[3] = &unk_24E779890;
  objc_copyWeak(&v16, (id *)(a1 + 80));
  v11 = v3;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v15 = *(_QWORD *)(a1 + 72);
  v9 = *(_OWORD *)(a1 + 56);
  v7 = (id)v9;
  v14 = v9;
  v8 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v16);
}

uint64_t __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke_148(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void **v14;
  const __CFString **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v38 = v8;
      v39 = 2114;
      v40 = v10;
      v41 = 2112;
      v42 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Play/Pause action failed with error: %@ ", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 32), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = CFSTR("HM.mediaPlaybackErrorDataKey");
    v36 = v12;
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = &v36;
    v15 = &v35;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v16;
      v39 = 2114;
      v40 = v18;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Play/Pause action finished with success", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v33 = *MEMORY[0x24BDD6658];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = &v34;
    v15 = (const __CFString **)&v33;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "mediaProfiles", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24), "uniqueIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v19, v27);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v22);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __34__HMDActionSet__issueReadRequests__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __34__HMDActionSet__issueReadRequests__block_invoke_147;
    v15[3] = &unk_24E792F40;
    v16 = v5;
    v17 = v8;
    v18 = a1[4];
    v19 = a1[5];
    v20 = a1[6];
    v21 = v6;
    dispatch_async(v9, v15);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2114;
      v25 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Lost self while reading characteristic values", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

void __34__HMDActionSet__issueReadRequests__block_invoke_147(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 32);
      v20 = 138544130;
      v21 = v5;
      v22 = 2114;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fulfill read requests (%@) before evaluating trigger: %@", (uint8_t *)&v20, 0x2Au);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 40), "handleExecutionCompletionWithResponsePayload:error:", 0, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x227676638](objc_msgSend(v10, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 72)));
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 72);
      v20 = 138544130;
      v21 = v14;
      v22 = 2114;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Finished read requests %@ with response %@", (uint8_t *)&v20, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v19 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "setExecutionInitialStates:", v10));
    objc_msgSend(*(id *)(a1 + 40), "_issueWriteRequests:", 0);
    objc_autoreleasePoolPop(v19);

  }
}

void __47__HMDActionSet__executeGenericActions_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !objc_msgSend(v6, "count"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute generic actions: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 40), "rejectWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "fulfillWithValue:", v7);
  }

}

void __64__HMDActionSet__executeAppleMediaAccessoryPowerActions_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !objc_msgSend(v6, "count"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute apple tv power actions: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 40), "rejectWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "fulfillWithValue:", v7);
  }

}

void __124__HMDActionSet__executeNaturalLightingWriteRequests_message_naturalLightingActions_naturalLightingActionResultByActionUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  uint32_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  __int128 v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id obj;
  id v64;
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v60 = v5;
  v61 = a1;
  if (v5 && !objc_msgSend(v6, "count"))
  {
    v53 = (void *)MEMORY[0x227676638]();
    v54 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v56;
      v72 = 2112;
      v73 = v5;
      _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute natural lighting write requests: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v53);
    objc_msgSend(*(id *)(v61 + 40), "rejectWithError:", v5);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v11;
      v72 = 2112;
      v73 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received response for natural lighting accessory write requests: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v12 = v61;
    obj = *(id *)(v61 + 48);
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v67;
      *(_QWORD *)&v14 = 138543874;
      v57 = v14;
      v58 = *(_QWORD *)v67;
      do
      {
        v17 = 0;
        v62 = v15;
        do
        {
          if (*(_QWORD *)v67 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v17);
          objc_msgSend(v18, "identifier", v57);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = *(void **)(v12 + 56);
            v65[0] = MEMORY[0x24BDAC760];
            v65[1] = 3221225472;
            v65[2] = __124__HMDActionSet__executeNaturalLightingWriteRequests_message_naturalLightingActions_naturalLightingActionResultByActionUUID___block_invoke_141;
            v65[3] = &unk_24E77E608;
            v65[4] = v18;
            objc_msgSend(v20, "na_firstObjectPassingTest:", v65);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "isNaturalLightingEnabled");
              v64 = v22;
              v24 = v7;
              v25 = objc_msgSend(v7, "hmd_isValidResponseForWriteRequest:naturalLightingEnabled:error:", v18, v23, &v64);
              v26 = v64;

              v27 = (void *)MEMORY[0x227676638]();
              v28 = *(id *)(v12 + 32);
              HMFGetOSLogHandle();
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if ((v25 & 1) != 0)
              {
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v71 = v31;
                  v72 = 2112;
                  v73 = v21;
                  v32 = v30;
                  v33 = OS_LOG_TYPE_DEBUG;
                  v34 = "%{public}@Successfully executed natural lighting action: %@";
                  v35 = 22;
                  goto LABEL_17;
                }
              }
              else if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v57;
                v71 = v31;
                v72 = 2112;
                v73 = v21;
                v74 = 2112;
                v75 = v26;
                v32 = v30;
                v33 = OS_LOG_TYPE_INFO;
                v34 = "%{public}@Failed to execute natural lighting action %@:%@";
                v35 = 32;
LABEL_17:
                _os_log_impl(&dword_2218F0000, v32, v33, v34, buf, v35);

              }
              objc_autoreleasePoolPop(v27);
              objc_msgSend(MEMORY[0x24BDBCE70], "hmd_dictionaryWithActionExecutionError:", v60);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = v61;
              v37 = *(void **)(v61 + 64);
              objc_msgSend(v21, "uuid");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "UUIDString");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v39);

              objc_msgSend(v18, "characteristic");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "addObject:", v40);

              v7 = v24;
              v16 = v58;
              v15 = v62;
            }

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      }
      while (v15);
    }

    if (objc_msgSend(v59, "count"))
    {
      objc_msgSend(v7, "hmd_responseByRemovingEntriesForCharacteristics:", v59);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x227676638]();
      v43 = *(id *)(v12 + 32);
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v71 = v45;
        v72 = 2112;
        v73 = v59;
        v74 = 2112;
        v75 = v7;
        v76 = 2112;
        v77 = v41;
        _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Updated response by removing entries for characteristics: %@ from: (%@ -> %@)", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v42);

    }
    else
    {
      v41 = v7;
    }
    v46 = (void *)objc_msgSend(v41, "mutableCopy");
    v47 = (void *)MEMORY[0x227676638](objc_msgSend(v46, "addEntriesFromDictionary:", *(_QWORD *)(v61 + 64)));
    v48 = *(id *)(v61 + 32);
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v50;
      v72 = 2112;
      v73 = v46;
      _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@Finished executing natural lighting actions with response: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v47);
    v51 = *(void **)(v61 + 40);
    v52 = (void *)objc_msgSend(v46, "copy");
    objc_msgSend(v51, "fulfillWithValue:", v52);

    v7 = v41;
  }

}

uint64_t __124__HMDActionSet__executeNaturalLightingWriteRequests_message_naturalLightingActions_naturalLightingActionResultByActionUUID___block_invoke_141(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "lightProfileUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  os_unfair_lock_s *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || objc_msgSend(*(id *)(a1 + 32), "isNaturalLightingEnabled") == a2)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v5;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Skipping natural lighting action %@ because either we failed to read with error: %@ or natural lighting is already enabled: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v6);
    v12 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
    os_unfair_lock_lock_with_options();
    v13 = (void *)MEMORY[0x24BDBCE70];
    if (objc_msgSend(v5, "code") == 48)
      v14 = 0;
    else
      v14 = v5;
    objc_msgSend(v13, "hmd_dictionaryWithActionExecutionError:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v15, *(_QWORD *)(a1 + 56));

    v16 = *(void **)(a1 + 64);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_138;
    v22[3] = &unk_24E779818;
    v22[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v16, "na_firstObjectPassingTest:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Removing write request from list of natural lighting accessory write requests: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(*(id *)(a1 + 64), "removeObject:", v17);
    }

    os_unfair_lock_unlock(v12);
  }
  objc_msgSend(*(id *)(a1 + 72), "fulfillWithValue:", 0);

}

uint64_t __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_executeNaturalLightingWriteRequests:message:naturalLightingActions:naturalLightingActionResultByActionUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_138(v7, v8);
  }
}

uint64_t __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_138(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "lightProfileUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

void __53__HMDActionSet__executeMediaPlaybackActions_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !objc_msgSend(v6, "count"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute media playback actions: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 40), "rejectWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "fulfillWithValue:", v7);
  }

}

void __60__HMDActionSet__executeCharacteristicWriteRequests_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !objc_msgSend(v6, "count"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute characteristic write requests: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 40), "rejectWithError:", v5);
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
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Finished executing characteristic write with response: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 40), "fulfillWithValue:", v7);
  }

}

void __36__HMDActionSet__issueWriteRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a2;
  objc_msgSend(v9, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "lightProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __36__HMDActionSet__issueWriteRequests___block_invoke_2;
    v10[3] = &unk_24E782CB8;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "na_firstObjectPassingTest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeObject:", v9);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
    }

  }
}

uint64_t __36__HMDActionSet__issueWriteRequests___block_invoke_130(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  uint64_t v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __36__HMDActionSet__issueWriteRequests___block_invoke_2_131;
  v12 = &unk_24E7958D8;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v9);

  v7 = (id)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return 1;
}

void __36__HMDActionSet__issueWriteRequests___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished execution of all actions with response: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "handleExecutionCompletionWithResponsePayload:error:", v5, 0);

}

void __36__HMDActionSet__issueWriteRequests___block_invoke_2_131(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Execution of action resulted in error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
      objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v12);

  }
}

uint64_t __36__HMDActionSet__issueWriteRequests___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lightProfileUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __37__HMDActionSet_associatedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "associatedAccessories");
}

void __65__HMDActionSet__updateAppleMediaAccessoryPowerAction_forMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAppleMediaAccessoryPowerActionWithModelID:](HMCContext, "findAppleMediaAccessoryPowerActionWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v7;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to find AppleMediaAccessoryPowerAction with UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  +[HMCContext findAppleMediaAccessoryWithModelID:](HMCContext, "findAppleMediaAccessoryWithModelID:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessory:", v9);

  objc_msgSend(v3, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find AppleMediaAccessory with UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(v3, "setTargetSleepWakeState:", *(_QWORD *)(a1 + 56));
  +[HMCContext currentContext](HMCContext, "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "save");

  objc_msgSend(*(id *)(a1 + 32), "uuid", CFSTR("kActionUUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = CFSTR("kActionInfo");
  objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v19;
  v23[2] = CFSTR("kHomeUUID");
  objc_msgSend(*(id *)(a1 + 64), "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "respondWithPayload:", v22);
}

void __37__HMDActionSet__handleRenameRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "replaceActionSetName:withNewName:", v3, v5);

  }
}

- (uint64_t)_updateActionSetFromDictionary:(void *)a3 transaction:(_QWORD *)a4 response:(_QWORD *)a5 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  HMDApplicationData *v34;
  void *v35;
  HMDApplicationData *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  HMDActionSetModel *v42;
  void *v43;
  void *v44;
  HMDActionSetModel *v45;
  HMDActionSet *v46;
  void *v47;
  void *v48;
  HMDActionSet *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  id v69;
  id obj;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  id v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(v7, "hmf_arrayForKey:", CFSTR("kActionSetActions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(a1, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(a1, "home");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v9;
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    if (v73)
    {
      v72 = *(_QWORD *)v86;
      v69 = v7;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v86 != v72)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v85 + 1) + 8 * v11);
        objc_opt_class();
        v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
        v14 = v13;

        if (!v14)
          break;
        objc_msgSend(v76, "actionWithDictionaryRepresentation:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v59 = (void *)MEMORY[0x227676638]();
          v60 = a1;
          HMFGetOSLogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          v7 = v69;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v62;
            v93 = 2112;
            v94 = v14;
            _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize action: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v59);
          if (a5)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          v58 = obj;
LABEL_51:

          v52 = 0;
          goto LABEL_58;
        }
        v16 = (void *)v15;
        objc_msgSend(v75, "addObject:", v15);
        v17 = a1;
        objc_msgSend(v16, "updateActionSetIfNil:", a1);
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v18 = v74;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v82;
LABEL_14:
          v22 = 0;
          while (1)
          {
            if (*(_QWORD *)v82 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v22);
            if ((objc_msgSend(v23, "isCompatibleWithAction:", v16) & 1) != 0)
              break;
            if (v20 == ++v22)
            {
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
              if (v20)
                goto LABEL_14;
              goto LABEL_20;
            }
          }
          v24 = v23;

          if (!v24)
            goto LABEL_23;
          objc_msgSend(v24, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setUuid:", v25);

          objc_msgSend(v16, "modelObjectWithChangeType:", 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "add:", v26);

          objc_msgSend(v18, "removeObject:", v24);
        }
        else
        {
LABEL_20:

LABEL_23:
          objc_msgSend(v16, "modelObjectWithChangeType:", 1);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "add:", v24);
        }

        ++v11;
        a1 = v17;
        if (v11 == v73)
        {
          v7 = v69;
          v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
          if (v73)
            goto LABEL_4;
          goto LABEL_26;
        }
      }
      v53 = (void *)MEMORY[0x227676638]();
      v54 = a1;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "name");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v56;
        v93 = 2112;
        v94 = v57;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Can't update action set %@; invalid serialized action",
          buf,
          0x16u);

      }
      objc_autoreleasePoolPop(v53);
      v7 = v69;
      v58 = obj;
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_51;
    }
LABEL_26:

    if ((objc_msgSend(v76, "validateActionsDoNotConflict:", v75) & 1) != 0)
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v27 = v74;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v78 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "modelObjectWithChangeType:", 3);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "add:", v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        }
        while (v29);
      }

      objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("kAppDataInformationKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = [HMDApplicationData alloc];
      objc_msgSend(a1, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[HMDApplicationData initWithParentUUID:](v34, "initWithParentUUID:", v35);

      objc_msgSend(a1, "uuid");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "createModelForAppDataPayload:existingAppData:parentUUID:", v33, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
        objc_msgSend(v8, "add:", v38);
      objc_msgSend(v7, "hmf_stringForKey:", CFSTR("kActionSetName"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(a1, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "isEqualToString:", v40);

        if ((v41 & 1) == 0)
        {
          v42 = [HMDActionSetModel alloc];
          objc_msgSend(a1, "uuid");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "uuid");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v42, "initWithObjectChangeType:uuid:parentUUID:", 1, v43, v44);

          -[HMDActionSetModel setName:](v45, "setName:", v39);
          objc_msgSend(v8, "add:", v45);

        }
      }
      v46 = [HMDActionSet alloc];
      objc_msgSend(a1, "uuid");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "type");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[HMDActionSet initWithName:uuid:type:home:queue:](v46, "initWithName:uuid:type:home:queue:", v39, v47, v48, v76, 0);

      -[HMDActionSet setActions:](v49, "setActions:", v75);
      if (a4)
      {
        -[HMDActionSet createPayload](v49, "createPayload");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v50, "mutableCopy");

        objc_msgSend(v51, "setObject:forKeyedSubscript:", v33, CFSTR("kAppDataInformationKey"));
        *a4 = (id)objc_msgSend(v51, "copy");

      }
      v52 = 1;
    }
    else
    {
      v63 = (void *)MEMORY[0x227676638]();
      v64 = a1;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v66;
        v93 = 2112;
        v94 = v64;
        _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_ERROR, "%{public}@Can't update action set %@; conflicting actions",
          buf,
          0x16u);

      }
      objc_autoreleasePoolPop(v63);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v52 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = 0;
      }
    }
    v58 = obj;
LABEL_58:

  }
  else
  {
    v52 = 0;
  }

  return v52;
}

void __50__HMDActionSet__handleUpdateActionSetFromBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v12 = v3;
  if (v3)
  {
    objc_msgSend(v4, "respondWithError:", v3);
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

      if ((v7 & 1) == 0)
      {
        v8 = *(void **)(a1 + 56);
        v9 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend(v8, "replaceActionSetName:withNewName:", v9, v10);

      }
    }
  }
  else
  {
    objc_msgSend(v4, "respondWithPayload:", *(_QWORD *)(a1 + 64));
  }

}

uint64_t __69__HMDActionSet__addLightProfileNaturalLightingModelWithUUID_message___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "lightProfileUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lightProfileUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __61__HMDActionSet__addMediaPlaybackActionModelWithUUID_message___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  objc_msgSend(*(id *)(a1 + 32), "mediaProfileWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __26__HMDActionSet_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_removeDonatedIntent");
  objc_msgSend(*(id *)(a1 + 32), "removeAllActions");
  return objc_msgSend(*(id *)(a1 + 32), "setMsgDispatcher:", 0);
}

uint64_t __53__HMDActionSet_handleRemovalOfAccessory_transaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lightProfileUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __33__HMDActionSet__encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "type"))
  {
    v4 = 1;
  }
  else
  {
    v5 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v4 = objc_msgSend(*(id *)(a1 + 32), "_isValidCharacteristicWriteAction:", v7);
  }

  return v4;
}

uint64_t __40__HMDActionSet_containsUnsecuringAction__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isUnsecuringAction");
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

uint64_t __44__HMDActionSet_containsSecureCharacteristic__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "requiresDeviceUnlock");
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

void __79__HMDActionSet_executeWithTriggerSource_captureCurrentState_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v5;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Execute triggered action set: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 40), "triggerType") == 2)
    v7 = 4;
  else
    v7 = 3;
  v8 = (void *)MEMORY[0x24BE3F1D0];
  objc_msgSend(MEMORY[0x24BE3F1B8], "allMessageDestinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = CFSTR("sourceType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v10;
  v31[1] = CFSTR("triggerSourceUUID");
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageWithName:destination:payload:", CFSTR("triggerSourceInternalMessage"), v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __79__HMDActionSet_executeWithTriggerSource_captureCurrentState_completionHandler___block_invoke_53;
  v23[3] = &unk_24E790900;
  v24 = *(id *)(a1 + 48);
  v15 = (void *)MEMORY[0x227676638](objc_msgSend(v14, "setResponseHandler:", v23));
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v18;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Executing actionSet %@ due to trigger %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  v21 = *(void **)(a1 + 32);
  v22 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v21, "_execute:captureCurrentState:writeRequestTuples:", v22, *(unsigned __int8 *)(a1 + 56), 0);

}

uint64_t __79__HMDActionSet_executeWithTriggerSource_captureCurrentState_completionHandler___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __34__HMDActionSet__execute_activity___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __34__HMDActionSet__execute_activity___block_invoke_47;
      v22[3] = &unk_24E79A910;
      v22[4] = v7;
      v23 = a1[4];
      v24 = a1[5];
      v25 = a1[6];
      dispatch_async(v8, v22);

    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v7;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        v28 = 2114;
        v29 = v21;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Access validation failed before executing the action set", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(a1[5], "respondWithError:", v5);
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] HMDActionSet has been set to nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = a1[5];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "respondWithError:", v15);

  }
}

uint64_t __34__HMDActionSet__execute_activity___block_invoke_47(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "isEntitledForSPIAccess");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Executing actionSet %@ for message %@/%@", (uint8_t *)&v12, 0x34u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_execute:captureCurrentState:writeRequestTuples:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

uint64_t __24__HMDActionSet_execute___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_execute:activity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __64__HMDActionSet_isAccessValidForExecutionWithMessage_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("denied");
      if (a2)
        v10 = CFSTR("allowed");
      v19 = 138543618;
      v20 = v8;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Access is %@ by siri watch unlock check for action set execution", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    if ((a2 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *(unsigned __int8 *)(a1 + 48);
      v16 = +[HMDDeviceCapabilities supportsDeviceLock](HMDDeviceCapabilities, "supportsDeviceLock");
      v17 = 2003;
      if (!v15)
        v17 = 10;
      if (v16)
        v18 = 82;
      else
        v18 = v17;
      objc_msgSend(v14, "hmErrorWithCode:", v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedActionClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t215 != -1)
    dispatch_once(&logCategory__hmf_once_t215, &__block_literal_global_153_29950);
  return (id)logCategory__hmf_once_v216;
}

void __27__HMDActionSet_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v216;
  logCategory__hmf_once_v216 = v0;

}

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[HMDActionSet uuid](self, "uuid");
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
  uint64_t v9;
  _BOOL4 v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  NSObject *v14;
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
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[8];
  _QWORD v35[8];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[HMDActionSet home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSet name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && v3)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSet actions](self, "actions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        if (-[HMDActionSet containsSecureCharacteristic](self, "containsSecureCharacteristic"))
        {
          v10 = -[HMDActionSet containsUnsecuringAction](self, "containsUnsecuringAction");
          v11 = (_QWORD *)MEMORY[0x24BE81F18];
          if (!v10)
            v11 = (_QWORD *)MEMORY[0x24BE81F10];
          objc_msgSend(v7, "addObject:", *v11);
        }
        if (!-[HMDActionSet containsMediaPlaybackActions](self, "containsMediaPlaybackActions"))
          goto LABEL_17;
        v12 = (_QWORD *)MEMORY[0x24BE81F08];
      }
      else
      {
        v12 = (_QWORD *)MEMORY[0x24BE81F20];
      }
      objc_msgSend(v7, "addObject:", *v12);
LABEL_17:
      v33 = v7;
      -[HMDActionSet _getActionsForActionSetObject](self, "_getActionsForActionSetObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc(MEMORY[0x24BDBCED8]);
      v35[0] = *MEMORY[0x24BE81F48];
      v34[0] = CFSTR("objectType");
      v34[1] = CFSTR("objectName");
      -[HMDActionSet name](self, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v20;
      v34[2] = CFSTR("objectIdentifier");
      -[HMDActionSet urlString](self, "urlString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v21;
      v34[3] = CFSTR("objectHome");
      objc_msgSend(v3, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[3] = v22;
      v34[4] = CFSTR("objectHomeIdentifier");
      objc_msgSend(v3, "urlString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[4] = v23;
      v35[5] = self;
      v34[5] = CFSTR("objectReference");
      v34[6] = CFSTR("objectSceneType");
      -[HMDActionSet type](self, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[6] = v24;
      v34[7] = CFSTR("objectSPIIdentifier");
      -[HMDActionSet spiClientIdentifier](self, "spiClientIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[7] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v31, "initWithDictionary:", v27);

      if (v32)
        objc_msgSend(v28, "setObject:forKey:", v32, CFSTR("objectSceneActions"));
      if (objc_msgSend(v33, "count"))
      {
        v29 = (void *)objc_msgSend(v33, "copy");
        objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("objectStatus"));

      }
      v19 = (void *)objc_msgSend(v28, "copy");

      goto LABEL_22;
    }
  }
  else
  {

  }
  v13 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSet uuid](self, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v15;
    v38 = 2112;
    v39 = v16;
    v40 = 2112;
    v41 = v18;
    v42 = 2112;
    v43 = v3;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because attribute(s) is nil: actionSet %@/%@  actionSet.home %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v13);
  v19 = 0;
LABEL_22:

  return (NSDictionary *)v19;
}

- (id)_getActionsForActionSetObject
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  HMDActionSet *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  HMDActionSet *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  HMDActionSet *v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  HMDActionSet *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  __int128 v85;
  uint64_t v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t v104[128];
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  id v108;
  __int16 v109;
  void *v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  -[HMDActionSet actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "count");

  if (!v3)
    goto LABEL_63;
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[HMDActionSet actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  -[HMDActionSet actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v101;
    v95 = *MEMORY[0x24BE81C88];
    v86 = *MEMORY[0x24BE81CA8];
    v94 = *MEMORY[0x24BE81DE0];
    *(_QWORD *)&v8 = 138543618;
    v85 = v8;
    v93 = *(_QWORD *)v101;
    v88 = v6;
    do
    {
      v11 = 0;
      v92 = v9;
      do
      {
        if (*(_QWORD *)v101 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v11);
        switch(objc_msgSend(v12, "type", v85))
        {
          case 0:
            v13 = v12;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v14 = v13;
            else
              v14 = 0;
            v15 = v14;

            if (v15)
            {
              objc_msgSend(v15, "characteristic");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "service");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "targetValue");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (isMetricLocale_onceToken != -1)
                dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_177454);
              getTupleForCharacteristic(v16, v18, isMetricLocale_isMetricLocale);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                v20 = objc_alloc_init(MEMORY[0x24BE81290]);
                objc_msgSend(v19, "attribute");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setAttribute:", v21);

                objc_msgSend(v20, "setActionType:", v95);
                objc_msgSend(v19, "value");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setValue:", v22);

                v23 = objc_alloc_init(MEMORY[0x24BE812E0]);
                v24 = (void *)MEMORY[0x24BDBCF48];
                objc_msgSend(v17, "urlString");
                v25 = v11;
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "URLWithString:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setEntityId:", v27);

                v9 = v92;
                v11 = v25;
                objc_msgSend(v23, "setAction:", v20);
                objc_msgSend(v89, "addObject:", v23);

              }
              v10 = v93;
              v6 = v88;
              goto LABEL_57;
            }
            v60 = v11;
            v61 = (void *)MEMORY[0x227676638]();
            v62 = self;
            HMFGetOSLogHandle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              HMActionTypeAsString();
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v106 = v64;
              v107 = 2112;
              v108 = v13;
              v109 = 2112;
              v110 = v65;
              _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

              v9 = v92;
              v10 = v93;
            }
            goto LABEL_45;
          case 1:
            v91 = v11;
            v40 = v12;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v41 = v40;
            else
              v41 = 0;
            v42 = v41;

            if (v42)
            {
              v98 = 0u;
              v99 = 0u;
              v96 = 0u;
              v97 = 0u;
              objc_msgSend(v42, "mediaProfiles");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
              if (v44)
              {
                v45 = v44;
                v87 = v42;
                v46 = 0;
                v47 = 0;
                v48 = *(_QWORD *)v97;
                do
                {
                  v49 = 0;
                  v50 = v46;
                  v51 = v47;
                  do
                  {
                    if (*(_QWORD *)v97 != v48)
                      objc_enumerationMutation(v43);
                    v52 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v49);
                    v47 = objc_alloc_init(MEMORY[0x24BE81290]);

                    objc_msgSend(v47, "setActionType:", v95);
                    v53 = objc_alloc_init(MEMORY[0x24BE812A8]);
                    objc_msgSend(v53, "setValue:", 1);
                    objc_msgSend(v47, "setValue:", v53);
                    v46 = objc_alloc_init(MEMORY[0x24BE812E0]);

                    v54 = (void *)MEMORY[0x24BDBCF48];
                    objc_msgSend(v52, "urlString");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "URLWithString:", v55);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "setEntityId:", v56);

                    objc_msgSend(v46, "setAction:", v47);
                    objc_msgSend(v47, "setAttribute:", v94);
                    objc_msgSend(v89, "addObject:", v46);

                    ++v49;
                    v50 = v46;
                    v51 = v47;
                  }
                  while (v45 != v49);
                  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
                }
                while (v45);

                v42 = v87;
                v6 = v88;
                v9 = v92;
              }

              v10 = v93;
            }
            else
            {
              v68 = (void *)MEMORY[0x227676638]();
              v69 = self;
              HMFGetOSLogHandle();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                HMActionTypeAsString();
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v106 = v71;
                v107 = 2112;
                v108 = v40;
                v109 = 2112;
                v110 = v72;
                _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                v10 = v93;
                v9 = v92;
              }

              objc_autoreleasePoolPop(v68);
            }

            v11 = v91;
            break;
          case 3:
            v28 = v12;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v29 = v28;
            else
              v29 = 0;
            v15 = v29;

            if (v15)
            {
              objc_msgSend(v15, "lightProfile");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v30;
              if (v30)
              {
                objc_msgSend(v30, "service");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_alloc_init(MEMORY[0x24BE81290]);
                objc_msgSend(v33, "setActionType:", v95);
                v34 = v11;
                v35 = objc_alloc_init(MEMORY[0x24BE812A8]);
                objc_msgSend(v35, "setValue:", objc_msgSend(v15, "isNaturalLightingEnabled"));
                objc_msgSend(v33, "setValue:", v35);
                objc_msgSend(v33, "setAttribute:", v86);
                v36 = objc_alloc_init(MEMORY[0x24BE812E0]);
                v37 = (void *)MEMORY[0x24BDBCF48];
                objc_msgSend(v32, "urlString");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "URLWithString:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setEntityId:", v39);

                v9 = v92;
                objc_msgSend(v36, "setAction:", v33);
                objc_msgSend(v89, "addObject:", v36);

                v11 = v34;
              }
              else
              {
                v79 = (void *)MEMORY[0x227676638]();
                v80 = self;
                HMFGetOSLogHandle();
                v81 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v85;
                  v106 = v82;
                  v107 = 2112;
                  v108 = v15;
                  _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting action doesn't have a light profile %@", buf, 0x16u);

                  v9 = v92;
                }

                objc_autoreleasePoolPop(v79);
              }

              v10 = v93;
            }
            else
            {
              v60 = v11;
              v61 = (void *)MEMORY[0x227676638]();
              v62 = self;
              HMFGetOSLogHandle();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                HMActionTypeAsString();
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v106 = v66;
                v107 = 2112;
                v108 = v28;
                v109 = 2112;
                v110 = v67;
                _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                v10 = v93;
                v9 = v92;
              }
LABEL_45:

              objc_autoreleasePoolPop(v61);
              v11 = v60;
            }
LABEL_57:

            break;
          case 4:
            v57 = v12;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v58 = v57;
            else
              v58 = 0;
            v59 = v58;

            if (v59)
            {

            }
            else
            {
              v73 = (void *)MEMORY[0x227676638]();
              v74 = self;
              HMFGetOSLogHandle();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                HMActionTypeAsString();
                v77 = v11;
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v106 = v76;
                v107 = 2112;
                v108 = v57;
                v109 = 2112;
                v110 = v78;
                _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                v11 = v77;
                v9 = v92;
              }

              objc_autoreleasePoolPop(v73);
            }
            break;
          default:
            break;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
    }
    while (v9);
  }

  v3 = v89;
  if (v89 && objc_msgSend(v89, "count"))
    v83 = (void *)objc_msgSend(v89, "copy");
  else
LABEL_63:
    v83 = 0;

  return v83;
}

@end
