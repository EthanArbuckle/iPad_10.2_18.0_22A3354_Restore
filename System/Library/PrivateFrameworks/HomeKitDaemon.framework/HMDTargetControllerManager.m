@implementation HMDTargetControllerManager

- (HMDTargetControllerManager)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDTargetControllerManager)initWithTargetControllerAccessory:(id)a3 targets:(id)a4
{
  id v6;
  id v7;
  HMDTargetControllerManager *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  id *p_isa;
  NSArray *buttonConfiguration;
  uint64_t v16;
  NSMutableSet *configuredTargets;
  unint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSMutableSet *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDTargetConfiguration *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id *v31;
  NSObject *v32;
  void *v33;
  HMDTargetConfiguration *v34;
  void *v35;
  void *v36;
  id *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSMutableSet *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSString *logID;
  void *v53;
  HMDTargetControllerManager *v54;
  NSObject *v55;
  void *v56;
  NSMutableSet *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  HMDTargetControllerManager *v68;
  void *v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  const __CFString *v78;
  void *v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  NSMutableSet *v83;
  __int16 v84;
  unint64_t v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v77.receiver = self;
  v77.super_class = (Class)HMDTargetControllerManager;
  v8 = -[HMDTargetControllerManager init](&v77, sel_init);
  if (!v8)
    goto LABEL_25;
  HMDispatchQueueNameString();
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v68 = v8;
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create(v10, v11);
  workQueue = v68->_workQueue;
  v68->_workQueue = (OS_dispatch_queue *)v12;

  p_isa = (id *)&v68->super.super.isa;
  objc_storeWeak((id *)&v68->_controller, v6);
  v68->_configurationRefreshed = 0;
  v68->_maximumTargets = 16;
  v68->_ticksPerSecond = 1000;
  buttonConfiguration = v68->_buttonConfiguration;
  v68->_buttonConfiguration = (NSArray *)MEMORY[0x24BDBD1A8];

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v16 = objc_claimAutoreleasedReturnValue();
  configuredTargets = v68->_configuredTargets;
  v68->_configuredTargets = (NSMutableSet *)v16;

  v18 = 0x24BDD1000;
  v67 = v6;
  if (!objc_msgSend(v7, "count"))
    goto LABEL_22;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v19 = objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v63 = v7;
  v20 = v7;
  v21 = (void *)v19;
  obj = v20;
  v72 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
  if (!v72)
    goto LABEL_21;
  v71 = *(_QWORD *)v74;
  v69 = (void *)v19;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v74 != v71)
        objc_enumerationMutation(obj);
      v23 = *(NSMutableSet **)(*((_QWORD *)&v73 + 1) + 8 * v22);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v23);
      objc_msgSend(v6, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v24);
      objc_msgSend(v25, "accessoryWithUUID:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = -[HMDTargetConfiguration initWithAccessory:buttonConfiguration:]([HMDTargetConfiguration alloc], "initWithAccessory:buttonConfiguration:", v26, 0);
LABEL_14:
        objc_msgSend(p_isa[3], "addObject:", v27);

        goto LABEL_15;
      }
      if (v25)
      {
        objc_msgSend(v25, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = identifierForTargetWithUUID(v24, v28);

        v30 = (void *)MEMORY[0x227676638]();
        v31 = p_isa;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v81 = v33;
          v82 = 2112;
          v83 = v23;
          v84 = 2048;
          v85 = v29;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Unable to look up the target with UUID %@ - adding with identifier %lu", buf, 0x20u);

          v6 = v67;
        }

        objc_autoreleasePoolPop(v30);
        v34 = [HMDTargetConfiguration alloc];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v29);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[HMDTargetConfiguration initWithIdentifier:name:category:buttonConfiguration:](v34, "initWithIdentifier:name:category:buttonConfiguration:", v35, 0, 0, 0);

        p_isa = (id *)&v68->super.super.isa;
        v21 = v69;
        goto LABEL_14;
      }
      v36 = (void *)MEMORY[0x227676638]();
      v37 = p_isa;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUIDString");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v6;
        v41 = (NSMutableSet *)v39;
        objc_msgSend(v40, "name");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "uuid");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "UUIDString");
        v66 = v36;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v81 = v65;
        v82 = 2112;
        v83 = v41;
        v84 = 2112;
        v85 = (unint64_t)v42;
        v86 = 2112;
        v87 = v43;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Attempting to initialize target with UUID %@ for a controller %@/%@ that is not configured with a home", buf, 0x2Au);

        v36 = v66;
        v6 = v67;
        p_isa = (id *)&v68->super.super.isa;

      }
      objc_autoreleasePoolPop(v36);
      v21 = v69;
LABEL_15:

      ++v22;
    }
    while (v72 != v22);
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
    v72 = v44;
  }
  while (v44);
LABEL_21:

  v78 = CFSTR("HMDTargetAccessoriesUUIDKey");
  v79 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "postNotificationName:object:userInfo:", CFSTR("HMDTargetAccessoryConfiguredNotificationKey"), v6, v45);

  v7 = v63;
LABEL_22:
  v47 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "name");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "UUIDString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stringWithFormat:", CFSTR("%@/%@"), v48, v50);
  v51 = objc_claimAutoreleasedReturnValue();
  logID = v68->_logID;
  v68->_logID = (NSString *)v51;

  v8 = v68;
  v53 = (void *)MEMORY[0x227676638]();
  v54 = v68;
  HMFGetOSLogHandle();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v68->_configuredTargets;
    *(_DWORD *)buf = 138543618;
    v81 = v56;
    v82 = 2112;
    v83 = v57;
    _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Initializing target controller manager with targets %@", buf, 0x16u);

    v8 = v68;
  }

  objc_autoreleasePoolPop(v53);
  objc_msgSend(*(id *)(v18 + 1744), "defaultCenter");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addObserver:selector:name:object:", v54, sel___accessoryNameUpdated_, CFSTR("HMDAccessoryNameUpdatedNotification"), 0);

  objc_msgSend(*(id *)(v18 + 1744), "defaultCenter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObserver:selector:name:object:", v54, sel___accessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), 0);

  objc_msgSend(*(id *)(v18 + 1744), "defaultCenter");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObserver:selector:name:object:", v54, sel___accessoryUnconfigured_, CFSTR("HMDAccessoryDisconnectedNotification"), 0);

  objc_msgSend(*(id *)(v18 + 1744), "defaultCenter");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addObserver:selector:name:object:", v54, sel___accessoryRemoved_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);

  v6 = v67;
LABEL_25:

  return v8;
}

- (void)invalidate
{
  void *v3;
  HMDTargetControllerManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating target controller manager", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", v4);

}

- (NSMutableSet)configuredTargets
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableSet copy](self->_configuredTargets, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSMutableSet *)v4;
}

- (void)addConfiguredTarget:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet addObject:](self->_configuredTargets, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeConfiguredTarget:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet removeObject:](self->_configuredTargets, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)resetConfiguredTargets
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet removeAllObjects](self->_configuredTargets, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)targetUUIDs
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDTargetControllerManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[HMDTargetControllerManager configuredTargets](self, "configuredTargets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v25;
    *(_QWORD *)&v5 = 138543874;
    v21 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "uuid", v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
        else
        {
          v13 = (void *)MEMORY[0x227676638]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v29 = v16;
            v30 = 2112;
            v31 = v17;
            v32 = 2112;
            v33 = v18;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Target %@/%@ does not have a UUID", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v13);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v6);
  }

  v19 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v19;
}

- (unint64_t)ticksPerSecond
{
  os_unfair_lock_s *p_lock;
  unint64_t ticksPerSecond;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ticksPerSecond = self->_ticksPerSecond;
  os_unfair_lock_unlock(p_lock);
  return ticksPerSecond;
}

- (void)setTicksPerSecond:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_ticksPerSecond = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)buttonConfiguration
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_buttonConfiguration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setButtonConfiguration:(id)a3
{
  NSArray *v4;
  NSArray *buttonConfiguration;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  buttonConfiguration = self->_buttonConfiguration;
  self->_buttonConfiguration = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)__accessoryDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControllerManager *v9;

  v4 = a3;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMDTargetControllerManager___accessoryDisconnected___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__accessoryConnected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControllerManager *v9;

  v4 = a3;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__HMDTargetControllerManager___accessoryConnected___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__accessoryNameUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControllerManager *v9;

  v4 = a3;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HMDTargetControllerManager___accessoryNameUpdated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__accessoryRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControllerManager *v9;

  v4 = a3;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__HMDTargetControllerManager___accessoryRemoved___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int)_parseSupportedTargetConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 UInt64;
  int v11;
  unint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  int v25;

  v4 = a3;
  v25 = 0;
  if (!objc_msgSend(v4, "length"))
  {
    v11 = -6727;
    goto LABEL_24;
  }
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");
  v6 = 0;
  v7 = 0;
  v24 = 0;
  v22 = 0;
  v23 = 0;
  v21 = 0;
  v8 = 16;
  v9 = 1000;
  while (2)
  {
    if (TLV8GetNext())
    {
      v15 = (uint64_t)v6;
      goto LABEL_20;
    }
    switch(v24)
    {
      case 1:
        UInt64 = TLV8GetUInt64();
        v11 = v25;
        if (v25)
          goto LABEL_23;
        v8 = UInt64;
        continue;
      case 2:
        v12 = TLV8GetUInt64();
        if (v12 <= 0x3E8)
          v9 = 1000;
        else
          v9 = v12;
        goto LABEL_16;
      case 3:
        v20 = 0;
        v13 = TLV8GetOrCopyCoalesced();
        v25 = v13;
        if (v13)
        {
          v11 = v13;
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        _parseTargetButtonConfiguration(v14, (uint64_t)&v19);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v19;

        if (v20)
        {
          free(v20);
          v20 = 0;
        }
        if (!v16)
        {

          v6 = (void *)v15;
          continue;
        }
        v25 = -6742;

LABEL_20:
        v11 = v25;
        if (!v25)
        {
          -[HMDTargetControllerManager setMaximumTargets:](self, "setMaximumTargets:", v8);
          -[HMDTargetControllerManager setTicksPerSecond:](self, "setTicksPerSecond:", v9);
          -[HMDTargetControllerManager setButtonConfiguration:](self, "setButtonConfiguration:", v15);
          -[HMDTargetControllerManager controller](self, "controller");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "saveHardwareSupport:", v7);

          -[HMDTargetControllerManager setConfigurationRefreshed:](self, "setConfigurationRefreshed:", 1);
          v11 = v25;
        }
        v6 = (void *)v15;
LABEL_23:

LABEL_24:
        return v11;
      case 4:
        v7 = TLV8GetUInt64() == 1;
LABEL_16:
        v11 = v25;
        if (!v25)
          continue;
        goto LABEL_23;
      default:
        continue;
    }
  }
}

- (id)__refreshedConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDTargetControllerManager configurationRefreshed](self, "configurationRefreshed"))
  {
    if (v4)
    {
      v19[0] = CFSTR("ticksPerSecond");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDTargetControllerManager ticksPerSecond](self, "ticksPerSecond"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      v19[1] = CFSTR("buttonConfiguration");
      -[HMDTargetControllerManager buttonConfiguration](self, "buttonConfiguration");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = MEMORY[0x24BDBD1A8];
      if (v6)
        v8 = v6;
      v19[2] = CFSTR("targetConfiguration");
      v20[1] = v8;
      v20[2] = v4;
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v20;
      v11 = v19;
      v12 = 3;
    }
    else
    {
      v17[0] = CFSTR("ticksPerSecond");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDTargetControllerManager ticksPerSecond](self, "ticksPerSecond"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = CFSTR("buttonConfiguration");
      v18[0] = v5;
      -[HMDTargetControllerManager buttonConfiguration](self, "buttonConfiguration");
      v14 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v14;
      v15 = MEMORY[0x24BDBD1A8];
      if (v14)
        v15 = v14;
      v18[1] = v15;
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v18;
      v11 = v17;
      v12 = 2;
    }
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v13;
}

- (void)_notifyConfigurationRefresh:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDTargetControllerManager _auditTargets:](self, "_auditTargets:", v4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDTargetControllerManager controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTargetControllerManager __refreshedConfiguration:](self, "__refreshedConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HMDTargetControllerAccessoryConfigurationUpdatedNotificationKey"), v5, v6);
}

- (void)refreshConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDTargetControllerManager_refreshConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_readSupportedConfigurationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDTargetControllerManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  void *v18;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTargetControllerManager controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5A00], *MEMORY[0x24BDD6C68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(location, self);
    -[HMDTargetControllerManager workQueue](self, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __72__HMDTargetControllerManager__readSupportedConfigurationWithCompletion___block_invoke;
    v14[3] = &unk_24E780660;
    objc_copyWeak(&v17, location);
    v16 = v4;
    v15 = v6;
    objc_msgSend(v5, "readCharacteristicValues:source:queue:completionHandler:", v8, 7, v9, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
LABEL_7:

    goto LABEL_8;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@No Supported target Configuration characteristic to refresh the configuration for the controller", (uint8_t *)location, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_refreshConfigurationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  HMDTargetControllerManager *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  void (**v15)(id, _QWORD);
  _QWORD *v16;
  __int128 *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (-[HMDTargetControllerManager configurationRefreshed](self, "configurationRefreshed"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuration was already refreshed - skipping this request...", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    v9 = dispatch_group_create();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__77281;
    v33 = __Block_byref_object_dispose__77282;
    v34 = 0;
    dispatch_group_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke;
    v27[3] = &unk_24E78BE90;
    p_buf = &buf;
    v11 = v9;
    v28 = v11;
    -[HMDTargetControllerManager _readSupportedConfigurationWithCompletion:](self, "_readSupportedConfigurationWithCompletion:", v27);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__77281;
    v25[4] = __Block_byref_object_dispose__77282;
    v26 = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__77281;
    v23[4] = __Block_byref_object_dispose__77282;
    v24 = 0;
    dispatch_group_enter(v11);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke_2;
    v19[3] = &unk_24E780688;
    v21 = v25;
    v22 = v23;
    v12 = v11;
    v20 = v12;
    -[HMDTargetControllerManager _listTargetsWithCompletionHandler:](self, "_listTargetsWithCompletionHandler:", v19);
    -[HMDTargetControllerManager workQueue](self, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke_3;
    v14[3] = &unk_24E7806B0;
    v14[4] = self;
    v16 = v23;
    v15 = v4;
    v17 = &buf;
    v18 = v25;
    dispatch_group_notify(v12, v13, v14);

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);

    _Block_object_dispose(&buf, 8);
  }

}

- (id)_dataForListTargetsWithOutError:(id *)a3
{
  void *v5;
  void *v6;
  HMDTargetControllerManager *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  TLV8BufferInit();
  if (TLV8BufferAppend())
  {
    v5 = 0;
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
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = 1;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Encoding for list target - operation %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  TLV8BufferFree();
  if (a3 && !v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_listTargetsWithCompletionHandler:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDTargetControllerManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDTargetControllerManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(id, id, _QWORD);
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, id, _QWORD))a3;
  -[HMDTargetControllerManager controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5A48], *MEMORY[0x24BDD6C68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v22 = 0;
    -[HMDTargetControllerManager _dataForListTargetsWithOutError:](self, "_dataForListTargetsWithOutError:", &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v12;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Unable to generate serialized data for listing targets - error %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      if (v4)
        v4[2](v4, v8, 0);
    }
    else
    {
      objc_initWeak((id *)buf, self);
      -[HMDTargetControllerManager workQueue](self, "workQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __64__HMDTargetControllerManager__listTargetsWithCompletionHandler___block_invoke;
      v18[3] = &unk_24E799B20;
      objc_copyWeak(&v21, (id *)buf);
      v20 = v4;
      v19 = v6;
      objc_msgSend(v5, "writeValue:toCharacteristic:queue:completion:", v7, v19, v17, v18);

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }

    goto LABEL_13;
  }
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@No Target List characteristic to audit configured target accessories - skipping", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8, 0);
LABEL_13:

  }
}

- (void)_auditTargets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDTargetControllerManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  HMDTargetControllerManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  HMDTargetControllerManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  __int128 v50;
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
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTargetControllerManager configuredTargets](self, "configuredTargets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v66 = v10;
    v67 = 2112;
    v68 = v4;
    v69 = 2112;
    v70 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Read targets %@, Configured targets %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v46 = v6;
  v11 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v11, "intersectSet:", v47);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v59 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v4, "indexOfObject:", v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = HMFEqualObjects();

        if ((v20 & 1) == 0)
        {
          objc_msgSend(v16, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDTargetControllerManager _updateName:buttonConfiguration:target:](v8, "_updateName:buttonConfiguration:target:", v21, 0, v16);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v13);
  }

  v22 = (void *)objc_msgSend(v46, "mutableCopy");
  objc_msgSend(v22, "minusSet:", v47);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v48 = v22;
  v23 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v48);
        v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        v28 = (void *)MEMORY[0x227676638]();
        v29 = v8;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v66 = v31;
          v67 = 2112;
          v68 = v27;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Target %@ not present in controller's target list - adding...", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
      }
      v24 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v24);
  }
  v45 = v4;

  objc_msgSend(v48, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTargetControllerManager _addTargets:](v8, "_addTargets:", v32);

  v33 = (void *)objc_msgSend(v47, "mutableCopy");
  objc_msgSend(v33, "minusSet:", v46);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v51 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
        v40 = (void *)MEMORY[0x227676638]();
        v41 = v8;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v66 = v43;
          v67 = 2112;
          v68 = v39;
          _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Target %@ present in controller's target list - removing...", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v36);
  }

  objc_msgSend(v34, "allObjects");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTargetControllerManager _removeTargets:](v8, "_removeTargets:", v44);

}

- (void)updateButtonConfigurationForTarget:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDTargetControllerManager_updateButtonConfigurationForTarget___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_dataForUpdateTarget:(id)a3 name:(id)a4 buttonConfiguration:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  const char *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  unsigned int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  id v50;
  _OWORD v51[21];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11 || objc_msgSend(v12, "count"))
  {
    v36 = v13;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[HMDTargetControllerManager configuredTargets](self, "configuredTargets", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if ((v22 & 1) != 0)
          {

            memset(v51, 0, sizeof(v51));
            v50 = v10;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v36;
            targetConfigurationTLVSize(v24, v36);

            TLV8BufferInit();
            objc_msgSend(v10, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "unsignedIntegerValue");

            v37 = v26;
            if (TLV8BufferAppend()
              || (v27 = objc_retainAutorelease(v11), v28 = (const char *)objc_msgSend(v27, "UTF8String"), v11)
              && (strlen(v28), v28 = (const char *)TLV8BufferAppend(), (_DWORD)v28)
              || v36 && (v28 = (const char *)__addButtonConfigurationTLV((uint64_t)v51, v36), (_DWORD)v28))
            {
              v23 = 0;
            }
            else
            {
              v29 = (void *)MEMORY[0x227676638](v28);
              v30 = v35;
              HMFGetOSLogHandle();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                buttonConfigurationAsString(v36);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v43 = v32;
                v44 = 2048;
                v45 = v37;
                v46 = 2112;
                v47 = v27;
                v48 = 2112;
                v49 = v33;
                _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Encoding for update target - identifier %lu  updatedName %@  buttonConfiguration: %@", buf, 0x2Au);

                v13 = v36;
              }

              objc_autoreleasePoolPop(v29);
              objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v51[0]);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            TLV8BufferFree();
            if (a6 && !v23)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_29;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
        if (v16)
          continue;
        break;
      }
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v13 = v36;
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
LABEL_29:

  return v23;
}

- (void)_updateName:(id)a3 buttonConfiguration:(id)a4 target:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  HMDTargetControllerManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDTargetControllerManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDTargetControllerManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *context;
  void *contexta;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  id v51;
  _OWORD buf[21];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8 || objc_msgSend(v9, "count"))
    {
      -[HMDTargetControllerManager controller](self, "controller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5A48], *MEMORY[0x24BDD6C68]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v51 = 0;
        -[HMDTargetControllerManager _dataForUpdateTarget:name:buttonConfiguration:outError:](self, "_dataForUpdateTarget:name:buttonConfiguration:outError:", v10, v8, v9, &v51);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v51;
        if (v14)
        {
          context = (void *)MEMORY[0x227676638]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = v12;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "name");
            v38 = v14;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "identifier");
            v39 = v13;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            buttonConfigurationAsString(v9);
            v41 = v11;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf[0]) = 138544386;
            *(_QWORD *)((char *)buf + 4) = v17;
            WORD6(buf[0]) = 2112;
            *(_QWORD *)((char *)buf + 14) = v18;
            WORD3(buf[1]) = 2112;
            *((_QWORD *)&buf[1] + 1) = v19;
            LOWORD(buf[2]) = 2112;
            *(_QWORD *)((char *)&buf[2] + 2) = v8;
            WORD5(buf[2]) = 2112;
            *(_QWORD *)((char *)&buf[2] + 12) = v20;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize request for updating %@/%@ with name %@  buttonConfiguration %@", (uint8_t *)buf, 0x34u);

            v13 = v39;
            v14 = v38;

            v11 = v41;
            v12 = v40;
          }

          objc_autoreleasePoolPop(context);
        }
        else if (objc_msgSend(v13, "length"))
        {
          memset(buf, 0, sizeof(buf));
          buttonConfigurationTLVSize(v9);
          TLV8BufferInit();
          v50 = 5;
          if (TLV8BufferAppend()
            || (v33 = objc_retainAutorelease(v13),
                objc_msgSend(v33, "bytes"),
                v34 = v33,
                v14 = 0,
                objc_msgSend(v34, "length"),
                TLV8BufferAppend()))
          {
            TLV8BufferFree();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf[0]);
            v35 = v11;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            TLV8BufferFree();
            -[HMDTargetControllerManager workQueue](self, "workQueue");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v45[0] = MEMORY[0x24BDAC760];
            v45[1] = 3221225472;
            v45[2] = __69__HMDTargetControllerManager__updateName_buttonConfiguration_target___block_invoke;
            v45[3] = &unk_24E7806D8;
            v45[4] = self;
            v46 = v10;
            v47 = v8;
            v48 = v9;
            v49 = v12;
            objc_msgSend(v35, "writeValue:toCharacteristic:queue:completion:", v36, v49, v37, v45);

            v14 = 0;
            v11 = v35;
          }
        }

      }
      else
      {
        v26 = (void *)MEMORY[0x227676638]();
        v27 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = v11;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          buttonConfigurationAsString(v9);
          contexta = v26;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf[0]) = 138544386;
          *(_QWORD *)((char *)buf + 4) = v29;
          WORD6(buf[0]) = 2112;
          *(_QWORD *)((char *)buf + 14) = v30;
          WORD3(buf[1]) = 2112;
          *((_QWORD *)&buf[1] + 1) = v31;
          LOWORD(buf[2]) = 2112;
          *(_QWORD *)((char *)&buf[2] + 2) = v8;
          WORD5(buf[2]) = 2112;
          *(_QWORD *)((char *)&buf[2] + 12) = v32;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Failed to look up target list characteristic for updating %@/%@ with name %@  buttonConfiguration %@", (uint8_t *)buf, 0x34u);

          v12 = 0;
          v26 = contexta;

          v11 = v42;
        }

        objc_autoreleasePoolPop(v26);
      }

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      buttonConfigurationAsString(v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138543874;
      *(_QWORD *)((char *)buf + 4) = v24;
      WORD6(buf[0]) = 2112;
      *(_QWORD *)((char *)buf + 14) = v8;
      WORD3(buf[1]) = 2112;
      *((_QWORD *)&buf[1] + 1) = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Request to update name %@  buttonConfiguration %@ for a nil target", (uint8_t *)buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)updateTargetAccessory:(id)a3 name:(id)a4 buttonConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__HMDTargetControllerManager_updateTargetAccessory_name_buttonConfiguration___block_invoke;
  v15[3] = &unk_24E79A910;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (id)_dataForAddTargets:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *context;
  id v38;
  id *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char v44;
  unsigned __int16 v45;
  unsigned int v46;
  _BYTE v47[128];
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  __int128 v67;
  __int128 v68;
  _OWORD v69[21];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDTargetControllerManager buttonConfiguration](self, "buttonConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  targetConfigurationTLVSize(v6, v7);

  memset(v69, 0, sizeof(v69));
  TLV8BufferInit();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  TLV8BufferInit();
  v44 = 2;
  v8 = TLV8BufferAppend();
  if (v8)
  {
    v9 = v8;
    v10 = 0;
  }
  else
  {
    v38 = v6;
    v39 = a4;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v14);
          -[HMDTargetControllerManager buttonConfiguration](self, "buttonConfiguration");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v15;
          v18 = v16;
          objc_msgSend(v17, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = objc_msgSend(v19, "unsignedIntegerValue");

          v46 = v15;
          v20 = TLV8BufferAppend();
          if (v20)
            goto LABEL_9;
          objc_msgSend(v17, "name");
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = (const char *)objc_msgSend(v23, "UTF8String");

          if (v24)
          {
            strlen(v24);
            v20 = TLV8BufferAppend();
            if (v20)
              goto LABEL_9;
          }
          v45 = objc_msgSend(v17, "category");
          v20 = TLV8BufferAppend();
          if (v20)
          {
LABEL_9:
            v21 = v20;
            v22 = 0;
          }
          else
          {
            objc_msgSend(v17, "buttonConfiguration");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v22, "count"))
            {
              v25 = v18;

              v22 = v25;
            }
            v26 = __addButtonConfigurationTLV((uint64_t)v69, v22);
            if (v26)
            {
              v21 = v26;
            }
            else
            {
              context = (void *)MEMORY[0x227676638]();
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v46;
                v34 = v45;
                objc_msgSend(v17, "buttonConfiguration");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                buttonConfigurationAsString(v35);
                v28 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v71 = v36;
                v72 = 2048;
                v73 = v33;
                v74 = 2080;
                v75 = v24;
                v76 = 2048;
                v77 = v34;
                v78 = 2112;
                v79 = v28;
                v29 = (void *)v28;
                _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding TLVs for add target operation - identifier %lu  name %s  category %lu  buttonConfiguration: %@", buf, 0x34u);

              }
              objc_autoreleasePoolPop(context);
              v21 = 0;
            }
          }

          if (v21)
          {
            v31 = 0;
            v9 = 1;
            goto LABEL_27;
          }
          ++v14;
        }
        while (v12 != v14);
        v30 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        v12 = v30;
      }
      while (v30);
    }

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v69[0]);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    v9 = TLV8BufferAppend();
    if (v9)
    {
      v6 = v38;
      a4 = v39;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v48);
      v31 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v6 = v38;
      a4 = v39;

      v10 = (id)v31;
    }
  }
  TLV8BufferFree();
  TLV8BufferFree();
  if (v9)
  {

    v10 = 0;
  }
  if (a4 && !v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)_postSelectionChangeNotification:(BOOL)a3 object:(id)a4 userInfo:(id)a5
{
  _BOOL8 v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = !a3;
  if (a3)
    v8 = CFSTR("HMDTargetControlServiceSelectedNotificationKey");
  else
    v8 = CFSTR("HMDTargetControlServiceDeselectedNotificationKey");
  v9 = (void *)MEMORY[0x24BDD16D0];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", v8, v11, v10);

  -[HMDTargetControllerManager controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDTargetControllerCommandEvent commandEventWithCommandType:accessory:](HMDTargetControllerCommandEvent, "commandEventWithCommandType:accessory:", v7, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitLogEvent:", v15);

}

- (void)_addTargets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDTargetControllerManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDTargetControllerManager *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDTargetControllerManager *v33;
  NSObject *v34;
  uint64_t v35;
  HMDTargetControllerManager *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  _QWORD v51[5];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  const __CFString *v63;
  void *v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HMDTargetControllerManager controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5A48], *MEMORY[0x24BDD6C68]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v62 = 0;
      -[HMDTargetControllerManager _dataForAddTargets:outError:](self, "_dataForAddTargets:outError:", v4, &v62);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v62;
      if (v8)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v12;
          v69 = 2112;
          v70 = v4;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize request for adding targets %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
      }
      else
      {
        v46 = v7;
        v47 = v6;
        v48 = v5;
        v49 = v4;
        v60 = 0u;
        v61 = 0u;
        v59 = 0u;
        v58 = 0u;
        v17 = v4;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v59 != v20)
                objc_enumerationMutation(v17);
              -[HMDTargetControllerManager addConfiguredTarget:](self, "addConfiguredTarget:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          }
          while (v19);
        }
        v45 = v17;

        -[HMDTargetControllerManager configuredTargets](self, "configuredTargets");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v24 = v22;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v55;
          do
          {
            v28 = 0;
            v50 = v26;
            do
            {
              if (*(_QWORD *)v55 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v28);
              objc_msgSend(v29, "uuid", v45);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
              {
                objc_msgSend(v29, "uuid");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObject:", v31);

              }
              else
              {
                v32 = (void *)MEMORY[0x227676638]();
                v33 = self;
                HMFGetOSLogHandle();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v35 = v27;
                  v36 = self;
                  v37 = v23;
                  v38 = v24;
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v68 = v39;
                  v69 = 2112;
                  v70 = v29;
                  _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Target being added %@ does not have a UUID", buf, 0x16u);

                  v24 = v38;
                  v23 = v37;
                  self = v36;
                  v27 = v35;
                  v26 = v50;
                }

                objc_autoreleasePoolPop(v32);
              }
              ++v28;
            }
            while (v26 != v28);
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
          }
          while (v26);
        }

        v63 = CFSTR("HMDTargetAccessoriesUUIDKey");
        v64 = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v40, "mutableCopy");

        -[HMDTargetControllerManager __refreshedConfiguration:](self, "__refreshedConfiguration:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addEntriesFromDictionary:", v42);

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v48;
        objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("HMDTargetAccessoryConfiguredNotificationKey"), v48, v41);

        -[HMDTargetControllerManager workQueue](self, "workQueue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __42__HMDTargetControllerManager__addTargets___block_invoke;
        v51[3] = &unk_24E799FD0;
        v51[4] = self;
        v52 = v45;
        v6 = v47;
        v53 = v47;
        v7 = v46;
        objc_msgSend(v48, "writeValue:toCharacteristic:queue:completion:", v46, v53, v44, v51);

        v4 = v49;
        v8 = 0;
      }

    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v16;
        v69 = 2112;
        v70 = v4;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to look up target list characteristic for adding targets %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
}

- (void)addTargetAccessory:(id)a3 buttonConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  HMDTargetControllerManager *v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMDTargetControllerManager workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__HMDTargetControllerManager_addTargetAccessory_buttonConfiguration___block_invoke;
    block[3] = &unk_24E79BBD0;
    v10 = v6;
    v11 = v7;
    v12 = self;
    dispatch_async(v8, block);

  }
}

- (id)_dataForRemoveTargets:(id)a3 outError:(id *)a4
{
  id v6;
  int v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  HMDTargetControllerManager *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v24;
  id *v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unsigned __int8 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "count");
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v60 = 0u;
  TLV8BufferInit();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  TLV8BufferInit();
  v31 = 3;
  v7 = TLV8BufferAppend();
  if (v7)
  {
    v8 = v7;
    v9 = 0;
  }
  else
  {
    v24 = v6;
    v25 = a4;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((v12 & 1) != 0 && TLV8BufferAppend()
            || (objc_msgSend(v15, "identifier", v24, v25),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "unsignedIntegerValue"),
                v16,
                v26 = v17,
                TLV8BufferAppend()))
          {
            v22 = 0;
            v8 = 1;
            goto LABEL_18;
          }
          v18 = (void *)MEMORY[0x227676638]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v33 = v21;
            v34 = 2048;
            v35 = v31;
            v36 = 2048;
            v37 = v26;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Encoding for remove target - operation %lu  identifier %lu", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v18);
          v12 = 1;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v60);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v8 = TLV8BufferAppend();
    if (v8)
    {
      v6 = v24;
      a4 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v39);
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v6 = v24;
      a4 = v25;

      v9 = (id)v22;
    }
  }
  TLV8BufferFree();
  TLV8BufferFree();
  if (v8)
  {

    v9 = 0;
  }
  if (a4 && !v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_removeTargets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDTargetControllerManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDTargetControllerManager *v13;
  NSObject *v14;
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
  HMDTargetControllerManager *v26;
  NSObject *v27;
  uint64_t v28;
  HMDTargetControllerManager *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  const __CFString *v50;
  void *v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HMDTargetControllerManager controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5A48], *MEMORY[0x24BDD6C68]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v49 = 0;
      -[HMDTargetControllerManager _dataForRemoveTargets:outError:](self, "_dataForRemoveTargets:outError:", v4, &v49);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v49;
      if (v40)
      {
        v7 = (void *)MEMORY[0x227676638]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v10;
          v55 = 2112;
          v56 = v4;
          v57 = 2112;
          v58 = v40;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize request for removing targets %@ - error %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v7);
        v11 = (void *)v39;
      }
      else
      {
        v36 = v6;
        v37 = v5;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v38 = v4;
        v17 = v4;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v46;
          do
          {
            v21 = 0;
            v41 = v19;
            do
            {
              if (*(_QWORD *)v46 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v21);
              -[HMDTargetControllerManager removeConfiguredTarget:](self, "removeConfiguredTarget:", v22);
              objc_msgSend(v22, "uuid");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                objc_msgSend(v22, "uuid");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addObject:", v24);

              }
              else
              {
                v25 = (void *)MEMORY[0x227676638]();
                v26 = self;
                HMFGetOSLogHandle();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v28 = v20;
                  v29 = self;
                  v30 = v17;
                  v31 = v16;
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v54 = v32;
                  v55 = 2112;
                  v56 = v22;
                  _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Target being removed %@ does not have a UUID", buf, 0x16u);

                  v16 = v31;
                  v17 = v30;
                  self = v29;
                  v20 = v28;
                  v19 = v41;
                }

                objc_autoreleasePoolPop(v25);
              }
              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
          }
          while (v19);
        }

        v50 = CFSTR("HMDTargetAccessoriesUUIDKey");
        v51 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v37;
        objc_msgSend(v34, "postNotificationName:object:userInfo:", CFSTR("HMDTargetAccessoryUnconfiguredNotificationKey"), v37, v33);

        -[HMDTargetControllerManager workQueue](self, "workQueue");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __45__HMDTargetControllerManager__removeTargets___block_invoke;
        v42[3] = &unk_24E799FD0;
        v42[4] = self;
        v43 = v17;
        v6 = v36;
        v44 = v36;
        v11 = (void *)v39;
        objc_msgSend(v37, "writeValue:toCharacteristic:queue:completion:", v39, v44, v35, v42);

        v4 = v38;
      }

    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v15;
        v55 = 2112;
        v56 = v4;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to look up target list characteristic for removing targets %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
}

- (void)removeTargetAccessory:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDTargetControllerManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[HMDTargetControllerManager targetConfigurationMatchingAccessory:](self, "targetConfigurationMatchingAccessory:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMDTargetControllerManager workQueue](self, "workQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __52__HMDTargetControllerManager_removeTargetAccessory___block_invoke;
      v14[3] = &unk_24E79C268;
      v14[4] = self;
      v15 = v5;
      dispatch_async(v6, v14);

    }
    else
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v10;
        v18 = 2112;
        v19 = v11;
        v20 = 2112;
        v21 = v13;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Attempt to remove a target %@/%@ that cannot be looked up in target controller manager", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
}

- (id)_dataForResetTargetsWithOutError:(id *)a3
{
  void *v5;
  void *v6;
  HMDTargetControllerManager *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  TLV8BufferInit();
  if (TLV8BufferAppend())
  {
    v5 = 0;
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
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = 4;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Encoding for reset target - operation %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  TLV8BufferFree();
  if (a3 && !v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_resetTargets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDTargetControllerManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDTargetControllerManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDTargetControllerManager controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5A48], *MEMORY[0x24BDD6C68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v17 = 0;
    -[HMDTargetControllerManager _dataForResetTargetsWithOutError:](self, "_dataForResetTargetsWithOutError:", &v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v17;
    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v10;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize request for resetting targets - error %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      -[HMDTargetControllerManager workQueue](self, "workQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __43__HMDTargetControllerManager__resetTargets__block_invoke;
      v16[3] = &unk_24E79BD80;
      v16[4] = self;
      objc_msgSend(v3, "writeValue:toCharacteristic:queue:completion:", v5, v4, v15, v16);

    }
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
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to look up target list characteristic for resetting targets", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)acknowledgeTargetControlService:(id)a3 active:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  HMDTargetControllerManager *v11;
  BOOL v12;

  v6 = a3;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDTargetControllerManager_acknowledgeTargetControlService_active___block_invoke;
  block[3] = &unk_24E799CF0;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)__handleActiveIdentifierChange:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDTargetControllerManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDTargetControllerManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v6, "unsignedIntegerValue"))
    {
      -[HMDTargetControllerManager targetConfigurationMatchingIdentifier:](self, "targetConfigurationMatchingIdentifier:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v11 = (void *)MEMORY[0x227676638]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v22 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "instanceID");
          *(_DWORD *)buf = 138544130;
          v26 = v21;
          v27 = 2112;
          v28 = v6;
          v29 = 2112;
          v30 = v14;
          v31 = 2112;
          v32 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v32;
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Unable to look up target for identifier %@ while reading activeIdentifier characteristic %@/%@", buf, 0x2Au);

          v11 = v22;
        }

        objc_autoreleasePoolPop(v11);
      }
      v23 = CFSTR("activeIdentifier");
      v24 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTargetControllerManager _postSelectionChangeNotification:object:userInfo:](self, "_postSelectionChangeNotification:object:userInfo:", 1, v8, v16);

    }
    else
    {
      -[HMDTargetControllerManager _postSelectionChangeNotification:object:userInfo:](self, "_postSelectionChangeNotification:object:userInfo:", 0, v8, 0);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      v27 = 2112;
      v28 = 0;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Received a non-number (%@) for activeIdentifier characteristic %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)_handleActiveIdentifierReadResponses:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HMDTargetControllerManager *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    v24 = *MEMORY[0x24BDD6C60];
    v21 = *MEMORY[0x24BDD5778];
    v22 = self;
    v25 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      v26 = v5;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        objc_msgSend(v8, "request");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "characteristic");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "service");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "error");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
          v14 = 1;
        else
          v14 = v12 == 0;
        if (v14)
          goto LABEL_19;
        objc_msgSend(v12, "uuid");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDTargetControllerManager controller](self, "controller");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v16))
          goto LABEL_18;
        objc_msgSend(v11, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "isEqualToString:", v24))
        {

LABEL_18:
          v6 = v25;
          v5 = v26;
          goto LABEL_19;
        }
        objc_msgSend(v10, "type");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v18, "isEqualToString:", v21);

        self = v22;
        v6 = v25;
        v5 = v26;
        if (!v23)
          goto LABEL_20;
        objc_msgSend(v8, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
        v13 = v20;

        self = v22;
        -[HMDTargetControllerManager __handleActiveIdentifierChange:forCharacteristic:](v22, "__handleActiveIdentifierChange:forCharacteristic:", v13, v10);
LABEL_19:

LABEL_20:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

}

- (void)_registerForActiveIdentifierNotifications
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  HMDTargetControllerManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id inited;
  void *v27;
  HMDTargetControllerManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id location[2];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", self, sel___characteristicEventsReceived_, *MEMORY[0x24BE1B490], 0);

  -[HMDTargetControllerManager controller](self, "controller");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  *(_OWORD *)location = 0u;
  v41 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", location, buf, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v41;
    v8 = *MEMORY[0x24BDD6C60];
    v9 = *MEMORY[0x24BDD5778];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v5);
        v11 = (void *)*((_QWORD *)location[1] + i);
        objc_msgSend(v11, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v8);

        if (v13)
        {
          objc_msgSend(v11, "findCharacteristicWithType:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v4, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", location, buf, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  if (objc_msgSend(v15, "count"))
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v19;
      v47 = 2112;
      v48 = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Registering for notification on active selection characteristics: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v33, "enableNotification:forCharacteristics:message:clientIdentifier:", 1, v15, 0, CFSTR("com.apple.HomeKitDaemon.targetControl"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v21 = v15;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v21);
          +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v25);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v22);
    }

    inited = objc_initWeak(location, v17);
    v27 = (void *)MEMORY[0x227676638](inited);
    v28 = v17;
    HMFGetOSLogHandle();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Refreshing the active selections on the controller", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    -[HMDTargetControllerManager workQueue](v28, "workQueue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __71__HMDTargetControllerManager__registerForActiveIdentifierNotifications__block_invoke;
    v34[3] = &unk_24E79ADC0;
    objc_copyWeak(&v35, location);
    objc_msgSend(v33, "readCharacteristicValues:source:queue:completionHandler:", v20, 7, v31, v34);

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);

  }
}

- (void)registerForActiveIdentifierNotifications
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDTargetControllerManager_registerForActiveIdentifierNotifications__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)__characteristicEventsReceived:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  HMDTargetControllerManager *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "hmf_arrayForKey:", *MEMORY[0x24BE1B498]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self;
  -[HMDTargetControllerManager controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    v30 = *MEMORY[0x24BDD6C60];
    v28 = *MEMORY[0x24BDD5778];
    v29 = v5;
    do
    {
      v10 = 0;
      v31 = v8;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        objc_msgSend(v11, "serverIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accessoryInstanceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "matchesHAPAccessoryWithServerIdentifier:instanceID:", v12, v13);

        if (v14)
        {
          objc_msgSend(v11, "characteristicInstanceID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "hmdCharacteristicForInstanceId:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "service");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "accessory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v17, "type");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v19, "isEqualToString:", v30))
              goto LABEL_14;
            objc_msgSend(v16, "type");
            v20 = v9;
            v21 = v6;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", v28);

            v6 = v21;
            v9 = v20;
            v5 = v29;

            if (v23)
            {
              objc_msgSend(v11, "value");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v25 = v24;
              else
                v25 = 0;
              v19 = v25;

              -[HMDTargetControllerManager __handleActiveIdentifierChange:forCharacteristic:](v27, "__handleActiveIdentifierChange:forCharacteristic:", v19, v16);
LABEL_14:

            }
          }

          v8 = v31;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

}

- (void)_saveTargetUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDTargetControllerManager configuredTargets](self, "configuredTargets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDTargetControllerManager configuredTargets](self, "configuredTargets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[HMDTargetControllerManager controller](self, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "saveTargetUUIDs:", v5);

}

- (void)autoConfigureTargets
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__HMDTargetControllerManager_autoConfigureTargets__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)updateTargets:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__HMDTargetControllerManager_updateTargets___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)targetConfigurationMatchingIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTargetControllerManager configuredTargets](self, "configuredTargets");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)targetConfigurationMatchingAccessory:(id)a3
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
  HMDTargetControllerManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTargetControllerManager controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = identifierForTargetWithUUID(v7, v8);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControllerManager targetConfigurationMatchingIdentifier:](self, "targetConfigurationMatchingIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

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
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v23 = v12;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      *(_DWORD *)buf = 138544386;
      v25 = v21;
      v26 = 2112;
      v27 = v15;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v33;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Attempting to lookup target %@/%@ for a controller %@/%@ that is not configured with a home", buf, 0x34u);

      v12 = v23;
    }

    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (void)handleConfigureTargets:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDTargetControllerManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDTargetControllerManager_handleConfigureTargets_responseHandler___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_handleConfigureTargets:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  HMDTargetControllerManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  HMDTargetControllerManager *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  id obja;
  id objb;
  HMDTargetConfiguration *v68;
  uint64_t v69;
  void *v70;
  HMDTargetControllerManager *v71;
  uint64_t v72;
  HMDTargetConfiguration *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned int v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  uint8_t v94[128];
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  id v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  uint64_t v102;
  HMDTargetConfiguration *v103;
  _QWORD v104[4];

  v104[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  -[HMDTargetControllerManager controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5A48], *MEMORY[0x24BDD6C68]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)*MEMORY[0x24BDD4DB8];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD4DB8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = v9;
    if (v12)
    {
      v13 = v11;
      v91 = 0;
      -[HMDTargetControllerManager _dataForResetTargetsWithOutError:](self, "_dataForResetTargetsWithOutError:", &v91);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v91;
      goto LABEL_8;
    }
    v17 = (void *)*MEMORY[0x24BDD4C48];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD4C48]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v13 = v17;
      v90 = 0;
      -[HMDTargetControllerManager _dataForListTargetsWithOutError:](self, "_dataForListTargetsWithOutError:", &v90);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v90;
LABEL_8:
      v19 = v15;
      v20 = 0;
      if (v19)
      {
LABEL_9:
        if (v7)
          v7[2](v7, v19, 0);
        v21 = v19;
        goto LABEL_47;
      }
LABEL_44:
      if (v14)
        -[HMDTargetControllerManager _configureTargetAccessories:reason:targetAccessories:responseHandler:](self, "_configureTargetAccessories:reason:targetAccessories:responseHandler:", v14, v13, v20, v7);
      v21 = 0;
      goto LABEL_47;
    }
    v22 = (void *)*MEMORY[0x24BDD48F8];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD48F8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v13 = v22;
      objc_msgSend(v6, "hmf_UUIDForKey:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessoryWithUUID:", v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v80 = v24;
        v20 = 0;
        v33 = 0;
        goto LABEL_29;
      }
      if (v9)
      {
        objc_msgSend(v9, "uuid");
        v25 = v14;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = identifierForTargetWithUUID(v24, v26);

        v77 = v25;
        objc_msgSend(v25, "category");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = mapTargetCategory(v28);

        v68 = [HMDTargetConfiguration alloc];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "name");
        v80 = v24;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDTargetControllerManager buttonConfiguration](self, "buttonConfiguration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = -[HMDTargetConfiguration initWithIdentifier:name:category:buttonConfiguration:](v68, "initWithIdentifier:name:category:buttonConfiguration:", v29, v30, v72, v31);

        v104[0] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = v73;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = 0;
        -[HMDTargetControllerManager _dataForAddTargets:outError:](self, "_dataForAddTargets:outError:", v32, &v89);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v89;

        v33 = v77;
LABEL_29:

        v44 = v80;
        goto LABEL_43;
      }
      v45 = (void *)MEMORY[0x227676638]();
      v46 = self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        obja = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v75 = v45;
        v48 = v24;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "UUIDString");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v96 = v82;
        v97 = 2112;
        v98 = obja;
        v99 = 2112;
        v100 = v70;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Attempting to configure targets for a controller %@/%@ that is not configured with a home", buf, 0x20u);

        v24 = v48;
        v45 = v75;

      }
      objc_autoreleasePoolPop(v45);
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v50, 0);

      }
      goto LABEL_54;
    }
    v34 = (void *)*MEMORY[0x24BDD4D88];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD4D88]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      objc_msgSend(v6, "objectForKey:", v34);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        v20 = 0;
        v21 = 0;
        if (v19)
          goto LABEL_9;
LABEL_47:

        v9 = v83;
        goto LABEL_48;
      }
      v20 = 0;
      v13 = 0;
LABEL_55:
      v21 = 0;
      v14 = 0;
      goto LABEL_47;
    }
    v13 = v34;
    objc_msgSend(v6, "hmf_UUIDForKey:", v13);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryWithUUID:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v37;
    if (v37)
    {
      if (!v9)
      {
        v54 = (void *)MEMORY[0x227676638]();
        v55 = self;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "uuid");
          objb = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(objb, "UUIDString");
          v71 = v55;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uuid");
          v76 = v54;
          v57 = v20;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "UUIDString");
          *(_DWORD *)buf = 138544130;
          v96 = v79;
          v97 = 2112;
          v98 = v63;
          v99 = 2112;
          v100 = v61;
          v101 = 2112;
          v102 = objc_claimAutoreleasedReturnValue();
          v59 = (void *)v102;
          _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Attempting to remove target %@ for a controller %@/%@ that is not configured with a home", buf, 0x2Au);

          v20 = v57;
          v54 = v76;

          v55 = v71;
        }

        objc_autoreleasePoolPop(v54);
        if (v7)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v60, 0);

        }
LABEL_54:
        v20 = 0;
        goto LABEL_55;
      }
      v62 = (void *)v37;
      objc_msgSend(v9, "uuid");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v36;
      v78 = identifierForTargetWithUUID(v36, v38);

      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      -[HMDTargetControllerManager configuredTargets](self, "configuredTargets");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      if (v74)
      {
        v69 = *(_QWORD *)v86;
        v81 = v13;
LABEL_21:
        v39 = 0;
        while (1)
        {
          if (*(_QWORD *)v86 != v69)
            objc_enumerationMutation(obj);
          v40 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v39);
          objc_msgSend(v40, "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v78);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v41, "isEqual:", v42);

          if ((v43 & 1) != 0)
            break;
          ++v39;
          v13 = v81;
          if (v74 == v39)
          {
            v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
            if (v74)
              goto LABEL_21;
            goto LABEL_27;
          }
        }
        v51 = v40;

        v13 = v81;
        if (!v51)
          goto LABEL_40;
        v93 = v62;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v93, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v51;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0;
        -[HMDTargetControllerManager _dataForRemoveTargets:outError:](self, "_dataForRemoveTargets:outError:", v52, &v84);
        v53 = v51;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v84;

        v13 = v81;
        goto LABEL_42;
      }
LABEL_27:

LABEL_40:
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = 0;
    }
    else
    {
      v62 = 0;
      v64 = v36;
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = 0;
LABEL_42:

    v44 = v64;
LABEL_43:

    if (v19)
      goto LABEL_9;
    goto LABEL_44;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16, 0);

  }
LABEL_48:

}

- (void)_configureTargetAccessories:(id)a3 reason:(id)a4 targetAccessories:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDTargetControllerManager controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5A48], *MEMORY[0x24BDD6C68]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_initWeak(&location, self);
    -[HMDTargetControllerManager workQueue](self, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __99__HMDTargetControllerManager__configureTargetAccessories_reason_targetAccessories_responseHandler___block_invoke;
    v18[3] = &unk_24E797698;
    objc_copyWeak(&v20, &location);
    v19 = v13;
    objc_msgSend(v14, "writeValue:toCharacteristic:queue:completion:", v10, v15, v16, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v13 + 2))(v13, v17, 0);

  }
}

- (HMDHAPAccessory)controller
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setConfiguredTargets:(id)a3
{
  objc_storeStrong((id *)&self->_configuredTargets, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)logID
{
  return self->_logID;
}

- (unsigned)maximumTargets
{
  return self->_maximumTargets;
}

- (void)setMaximumTargets:(unsigned __int8)a3
{
  self->_maximumTargets = a3;
}

- (BOOL)configurationRefreshed
{
  return self->_configurationRefreshed;
}

- (void)setConfigurationRefreshed:(BOOL)a3
{
  self->_configurationRefreshed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_storeStrong((id *)&self->_configuredTargets, 0);
  objc_destroyWeak((id *)&self->_controller);
}

void __99__HMDTargetControllerManager__configureTargetAccessories_reason_targetAccessories_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v8 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v8, 0);

}

uint64_t __69__HMDTargetControllerManager_handleConfigureTargets_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConfigureTargets:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __44__HMDTargetControllerManager_updateTargets___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  HMDTargetConfiguration *v25;
  void *v26;
  HMDTargetConfiguration *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  id obj;
  id obja;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  void *v89;
  _BYTE v90[128];
  HMDTargetConfiguration *v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  _BYTE v98[128];
  uint64_t v99;

  v1 = a1;
  v99 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "targetUUIDs");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(v1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v5);

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v6 = v4;
  v70 = v2;
  v73 = v6;
  v76 = v1;
  v79 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
  if (v79)
  {
    obj = *(id *)v86;
    do
    {
      for (i = 0; i != v79; ++i)
      {
        if (*(id *)v86 != obj)
          objc_enumerationMutation(v6);
        v8 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v8);
        if (v9)
        {
          objc_msgSend(v2, "accessoryWithUUID:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            if (objc_msgSend(v10, "isCurrentAccessory"))
            {
              v12 = (void *)MEMORY[0x227676638]();
              v13 = *(id *)(v1 + 32);
              HMFGetOSLogHandle();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "shortDescription");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v93 = v15;
                v94 = 2112;
                v95 = v16;
                _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@(Update) Adding current target accessory %@", buf, 0x16u);

                v1 = v76;
              }

              objc_autoreleasePoolPop(v12);
              objc_msgSend(v11, "configureTargetController:", v74);
            }
            else
            {
              v25 = [HMDTargetConfiguration alloc];
              objc_msgSend(*(id *)(v1 + 32), "buttonConfiguration");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = -[HMDTargetConfiguration initWithAccessory:buttonConfiguration:](v25, "initWithAccessory:buttonConfiguration:", v11, v26);

              v1 = v76;
              v28 = (void *)MEMORY[0x227676638]();
              v29 = *(id *)(v76 + 32);
              HMFGetOSLogHandle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "name");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "uuid");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "UUIDString");
                v71 = v28;
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v93 = v31;
                v94 = 2112;
                v95 = v32;
                v96 = 2112;
                v97 = v34;
                _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@(Update) Adding target accessory %@/%@", buf, 0x20u);

                v2 = v70;
                v28 = v71;

                v1 = v76;
              }

              objc_autoreleasePoolPop(v28);
              v35 = *(void **)(v1 + 32);
              v91 = v27;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "_addTargets:", v36);

              v6 = v73;
            }
          }
          else
          {
            v21 = (void *)MEMORY[0x227676638]();
            v22 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v93 = v24;
              v94 = 2112;
              v95 = v8;
              _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot look up target accessory from UUID %@ to add", buf, 0x16u);

              v1 = v76;
            }

            objc_autoreleasePoolPop(v21);
          }

        }
        else
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = *(id *)(v1 + 32);
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v93 = v20;
            v94 = 2112;
            v95 = v8;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Incorrectly formatted target UUID %@ to add", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
        }

      }
      v79 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
    }
    while (v79);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v69);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(v1 + 40));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minusSet:", v38);

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obja = v37;
  v80 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  if (v80)
  {
    v39 = *(_QWORD *)v82;
    v75 = *(_QWORD *)v82;
    while (2)
    {
      for (j = 0; j != v80; ++j)
      {
        if (*(_QWORD *)v82 != v39)
          objc_enumerationMutation(obja);
        v41 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
        v42 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v41);
        if (v42)
        {
          v43 = (void *)v42;
          objc_msgSend(v2, "accessoryWithUUID:", v42);
          v44 = objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            v45 = (void *)v44;
            objc_msgSend(*(id *)(v1 + 32), "targetConfigurationMatchingAccessory:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)MEMORY[0x227676638]();
            v48 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = os_log_type_enabled(v49, OS_LOG_TYPE_INFO);
            if (!v46)
            {
              if (v50)
              {
                HMFGetLogIdentifier();
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "name");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "uuid");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "UUIDString");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v93 = v65;
                v94 = 2112;
                v95 = v66;
                v96 = 2112;
                v97 = v68;
                _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@Attempt to remove a target %@/%@ that cannot be looked up in target controller manager", buf, 0x20u);

                v2 = v70;
              }

              objc_autoreleasePoolPop(v47);
              goto LABEL_47;
            }
            if (v50)
            {
              HMFGetLogIdentifier();
              v72 = v47;
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "name");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "uuid");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "UUIDString");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v93 = v51;
              v94 = 2112;
              v95 = v52;
              v96 = 2112;
              v97 = v54;
              _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@(Update) Removing target accessory %@/%@", buf, 0x20u);

              v2 = v70;
              v1 = v76;

              v47 = v72;
            }

            objc_autoreleasePoolPop(v47);
            v55 = *(void **)(v1 + 32);
            v89 = v46;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "_removeTargets:", v56);

            v39 = v75;
          }
          else
          {
            v61 = (void *)MEMORY[0x227676638]();
            v62 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v93 = v64;
              v94 = 2112;
              v95 = v41;
              _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@Cannot look up target accessory from UUID %@ to remove", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v61);

          }
        }
        else
        {
          v57 = (void *)MEMORY[0x227676638]();
          v58 = *(id *)(v1 + 32);
          HMFGetOSLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v93 = v60;
            v94 = 2112;
            v95 = v41;
            _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Incorrectly formatted target UUID %@ to remove", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v57);
        }
      }
      v80 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      if (v80)
        continue;
      break;
    }
  }
LABEL_47:

}

void __50__HMDTargetControllerManager_autoConfigureTargets__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  HMDTargetConfiguration *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("autoConfigureNewTargetControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Preference set to auto-configure existing targets when new target controller is added - configuring them...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v9, "home", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v17, "supportsTargetControl"))
          {
            v18 = -[HMDTargetConfiguration initWithAccessory:buttonConfiguration:]([HMDTargetConfiguration alloc], "initWithAccessory:buttonConfiguration:", v17, 0);
            objc_msgSend(v10, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v14);
    }

    v19 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "_addTargets:", v10));
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Saving targetUUIDs after auto-configuration of targets - %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 32), "_saveTargetUUIDs");

  }
}

uint64_t __70__HMDTargetControllerManager_registerForActiveIdentifierNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForActiveIdentifierNotifications");
}

void __71__HMDTargetControllerManager__registerForActiveIdentifierNotifications__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleActiveIdentifierReadResponses:", v5);

}

void __69__HMDTargetControllerManager_acknowledgeTargetControlService_active___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  const __CFString *v21;
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
  NSObject *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v1 = *(id *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v1, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v1, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    v9 = *MEMORY[0x24BDD57A8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v11, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v9);

        if (v13)
          objc_msgSend(v4, "addObject:", v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  if (objc_msgSend(v14, "count"))
  {
    v15 = a1;
    objc_msgSend(*(id *)(a1 + 40), "controller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 48))
        v21 = CFSTR("Registering");
      else
        v21 = CFSTR("Deregistering");
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "instanceID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v43 = v20;
      v44 = 2112;
      v45 = v21;
      v46 = 2112;
      v47 = v23;
      v48 = 2112;
      v49 = v24;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@%@ for notifications from event characteristics on controller service %@/%@", buf, 0x2Au);

      v15 = a1;
    }

    objc_autoreleasePoolPop(v17);
    objc_msgSend(v16, "enableNotification:forCharacteristics:message:clientIdentifier:", *(unsigned __int8 *)(v15 + 48), v14, 0, CFSTR("com.apple.HomeKitDaemon.targetControl"));
    if (*(_BYTE *)(v15 + 48))
    {
      objc_msgSend(*(id *)(v15 + 32), "findCharacteristicWithType:", *MEMORY[0x24BDD5770]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        if (*(_BYTE *)(v15 + 48))
          v26 = &unk_24E96B090;
        else
          v26 = 0;
        +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v25, v26, 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v27;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v15 + 40), "workQueue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "writeCharacteristicValues:source:queue:completionHandler:", v28, 7, v29, 0);

      }
      else
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = *(id *)(v15 + 40);
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "name");
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v15 + 32), "instanceID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v33;
          v44 = 2112;
          v45 = v34;
          v46 = 2112;
          v47 = v35;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Unable to look up active characteirstic in controller %@ service %@ for active selection acknowledgement", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v30);
      }

    }
  }

}

void __43__HMDTargetControllerManager__resetTargets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      v9 = "%{public}@Failed to write request for resetting targets";
LABEL_6:
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);

    }
  }
  else if (v7)
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    v9 = "%{public}@Successfully resetting targets";
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __52__HMDTargetControllerManager_removeTargetAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeTargets:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_saveTargetUUIDs");
}

void __45__HMDTargetControllerManager__removeTargets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v18 = 138543618;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to write request for removing targets %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    _parseTargetList(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully removed targets %@ - response %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v13);

  }
}

void __69__HMDTargetControllerManager_addTargetAccessory_buttonConfiguration___block_invoke(uint64_t a1)
{
  HMDTargetConfiguration *v2;
  HMDTargetConfiguration *v3;
  uint64_t v4;
  HMDTargetConfiguration *v5;
  void *v6;
  void *v7;
  id v8;
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
  HMDTargetConfiguration *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = [HMDTargetConfiguration alloc];
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = -[HMDTargetConfiguration initWithAccessory:buttonConfiguration:](v2, "initWithAccessory:buttonConfiguration:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "buttonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HMDTargetConfiguration initWithAccessory:buttonConfiguration:](v3, "initWithAccessory:buttonConfiguration:", v4, v6);

  }
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetConfiguration buttonConfiguration](v5, "buttonConfiguration");
    v19 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    buttonConfigurationAsString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFObject shortDescription](v5, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding target accessory %@/%@ with button configuration %@ - target configuration %@", buf, 0x34u);

    v7 = v19;
  }

  objc_autoreleasePoolPop(v7);
  v16 = *(void **)(a1 + 48);
  v20 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_addTargets:", v17);

  objc_msgSend(*(id *)(a1 + 48), "_saveTargetUUIDs");
}

void __42__HMDTargetControllerManager__addTargets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v19 = 138543874;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to write request for adding targets %@ - error %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    _parseTargetList(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "configuredTargets");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully added targets %@ configuredTargets %@ - response %@", (uint8_t *)&v19, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);

  }
}

void __77__HMDTargetControllerManager_updateTargetAccessory_name_buttonConfiguration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "targetConfigurationMatchingAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateName:buttonConfiguration:target:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2);

}

void __69__HMDTargetControllerManager__updateName_buttonConfiguration_target___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      buttonConfigurationAsString(*(void **)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to write request for updating %@/%@ with name %@  buttonConfiguration %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    _parseTargetList(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v14;
      v22 = v15;
      v23 = v16;
      v24 = *(_QWORD *)(a1 + 48);
      buttonConfigurationAsString(*(void **)(a1 + 56));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v24;
      v16 = v23;
      v15 = v22;
      v14 = v26;
      v35 = 2112;
      v36 = v25;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully updated %@/%@ with name %@  buttonConfiguration %@ - response %@", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v16);

  }
}

void __65__HMDTargetControllerManager_updateButtonConfigurationForTarget___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "configuredTargets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "buttonConfiguration");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setButtonConfiguration:", v11);

          v12 = (void *)MEMORY[0x227676638]();
          v13 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v21 = v15;
            v22 = 2112;
            v23 = v7;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Updated the button configuration for target %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v12);
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

void __64__HMDTargetControllerManager__listTargetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = WeakRetained == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if (v12)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v12, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;

      _parseTargetList(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v10, v9);

    }
  }

}

void __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "configurationRefreshed"))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 32), "maximumTargets");
      v7 = objc_msgSend(*(id *)(a1 + 32), "ticksPerSecond");
      objc_msgSend(*(id *)(a1 + 32), "buttonConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      buttonConfigurationAsString(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544130;
      v13 = v5;
      v14 = 2048;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying supported configuration: Maximum Targets: %lu  Ticks Per Second: %lu  Buttons: %@", (uint8_t *)&v12, 0x2Au);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "_notifyConfigurationRefresh:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v11)
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v11);
  }
  return result;
}

void __72__HMDTargetControllerManager__readSupportedConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  int v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "characteristic");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = WeakRetained;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = v12;
          v61 = 2112;
          v62 = (unint64_t)v13;
          v63 = 2112;
          v64 = (uint64_t)v7;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Error %@ response for reading characteristic %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v9);
        v14 = *(_QWORD *)(a1 + 40);
        if (!v14)
          goto LABEL_40;
        objc_msgSend(v5, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
      }
      else
      {
        objc_msgSend(v7, "type");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDD5A00]);

        if (v27)
        {
          objc_msgSend(v7, "value");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = v28;
          else
            v29 = 0;
          v30 = v29;

          v31 = objc_msgSend(WeakRetained, "_parseSupportedTargetConfiguration:", v30);
          if (v31)
          {
            v32 = v31;
            if (v31 == -6727)
            {
              v33 = (void *)MEMORY[0x227676638]();
              v34 = WeakRetained;
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v60 = v36;
                _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@No data to parse for supported configuration", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v33);
              v37 = (void *)MEMORY[0x24BDD1540];
              v38 = 74;
            }
            else
            {
              v49 = (void *)MEMORY[0x227676638]();
              v50 = WeakRetained;
              HMFGetOSLogHandle();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v58 = v49;
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v60 = v52;
                v61 = 2048;
                v62 = v32;
                _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Parsing supported configuration data failed with error %lu", buf, 0x16u);

                v49 = v58;
              }

              objc_autoreleasePoolPop(v49);
              v37 = (void *)MEMORY[0x24BDD1540];
              v38 = 50;
            }
            objc_msgSend(v37, "hmErrorWithCode:", v38);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = (void *)MEMORY[0x227676638]();
            v45 = WeakRetained;
            HMFGetOSLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v45, "maximumTargets");
              v54 = objc_msgSend(v45, "ticksPerSecond");
              objc_msgSend(v45, "buttonConfiguration");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              buttonConfigurationAsString(v56);
              v57 = v44;
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v60 = v47;
              v61 = 2048;
              v62 = v55;
              v63 = 2048;
              v64 = v54;
              v65 = 2112;
              v66 = v48;
              _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Refreshed supported configuration: Maximum Targets: %lu  Ticks Per Second: %lu  Buttons: %@", buf, 0x2Au);

              v44 = v57;
            }

            objc_autoreleasePoolPop(v44);
            v15 = 0;
          }

        }
        else
        {
          v39 = (void *)MEMORY[0x227676638]();
          v40 = WeakRetained;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            v60 = v42;
            v61 = 2112;
            v62 = v43;
            v63 = 2112;
            v64 = (uint64_t)v7;
            _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Got unexpected response - attempting to read %@, got %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v39);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 74);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v53 = *(_QWORD *)(a1 + 40);
        if (v53)
          (*(void (**)(uint64_t, void *))(v53 + 16))(v53, v15);
      }

LABEL_40:
      goto LABEL_41;
    }
    v22 = (void *)MEMORY[0x227676638]();
    v23 = WeakRetained;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No responses refreshing controller configuration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = 59;
      goto LABEL_16;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Accessory not found for reading supported target configuration characteristic", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = 2;
LABEL_16:
      objc_msgSend(v20, "hmErrorWithCode:", v21);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v5);
LABEL_41:

    }
  }

}

uint64_t __65__HMDTargetControllerManager_refreshConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshConfigurationWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __49__HMDTargetControllerManager___accessoryRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  id obja;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDAccessoryNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v71 = v9;
    v72 = 2112;
    v73 = v10;
    v74 = 2112;
    v75 = (uint64_t)v12;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that an accessory %@/%@ has been removed from the home", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 40), "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller has been removed from the home - invalidating...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
  else if ((objc_msgSend(v5, "supportsTargetControl") & 1) != 0)
  {
    objc_msgSend(v13, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v58 = v13;
      objc_msgSend(v5, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v21;
      objc_msgSend(v21, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = identifierForTargetWithUUID(v22, v23);

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "configuredTargets");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v65;
        while (2)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v65 != v27)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v29, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v24);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "isEqual:", v31);

            if (v32)
            {
              v40 = (void *)MEMORY[0x227676638]();
              v41 = *(id *)(a1 + 40);
              HMFGetOSLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "name");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "uuid");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "UUIDString");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v71 = v43;
                v72 = 2112;
                v73 = v44;
                v74 = 2112;
                v75 = (uint64_t)v46;
                _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Received notification that target accessory %@/%@ has been removed", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v40);
              v47 = *(void **)(a1 + 40);
              v68 = v29;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "_removeTargets:", v48);

              objc_msgSend(*(id *)(a1 + 40), "_saveTargetUUIDs");
              goto LABEL_27;
            }
          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
          if (v26)
            continue;
          break;
        }
      }
LABEL_27:

      v13 = v58;
      v21 = v61;
    }
    else
    {
      v49 = (void *)MEMORY[0x227676638]();
      v50 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uuid");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "UUIDString");
        v53 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        obja = v49;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "UUIDString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v71 = v59;
        v72 = 2112;
        v73 = v52;
        v74 = 2112;
        v75 = v53;
        v57 = (void *)v53;
        v76 = 2112;
        v77 = v54;
        v78 = 2112;
        v79 = v56;
        v21 = 0;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Attempting to process accessory %@/%@ removal for a controller %@/%@ that is not configured with a home", buf, 0x34u);

        v49 = obja;
      }

      objc_autoreleasePoolPop(v49);
    }

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "UUIDString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v71 = v36;
      v72 = 2112;
      v73 = v37;
      v74 = 2112;
      v75 = (uint64_t)v39;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Removed accessory %@/%@ does not support target control - ignoring", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v33);
  }

}

void __53__HMDTargetControllerManager___accessoryNameUpdated___block_invoke(uint64_t a1)
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
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

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
    *(_DWORD *)buf = 138543874;
    v69 = v8;
    v70 = 2112;
    v71 = (uint64_t)v9;
    v72 = 2112;
    v73 = (uint64_t)v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification that the name of an accessory %@/%@ has been updated", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 40), "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v13;
    objc_msgSend(v13, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = identifierForTargetWithUUID(v14, v15);

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "configuredTargets");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v65;
      v61 = a1;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v65 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqual:", v24);

          if (v25)
          {
            v26 = (void *)MEMORY[0x227676638]();
            v27 = v61;
            v28 = *(id *)(v61 + 40);
            HMFGetOSLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "uuid");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "UUIDString");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "name");
              v33 = v26;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v69 = v30;
              v70 = 2112;
              v71 = (uint64_t)v32;
              v72 = 2112;
              v73 = (uint64_t)v34;
              _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Received notification that the name of target accessory %@ has been updated to %@", buf, 0x20u);

              v26 = v33;
              v27 = v61;

            }
            objc_autoreleasePoolPop(v26);
            objc_msgSend(v22, "name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "name");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = HMFEqualObjects();

            if ((v37 & 1) == 0)
            {
              v38 = (void *)MEMORY[0x227676638]();
              v39 = *(id *)(v27 + 40);
              HMFGetOSLogHandle();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "name");
                v41 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "uuid");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v38;
                objc_msgSend(v59, "UUIDString");
                v42 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "name");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v69 = v58;
                v70 = 2112;
                v44 = (void *)v41;
                v71 = v41;
                v72 = 2112;
                v73 = v42;
                v45 = (void *)v42;
                v74 = 2112;
                v75 = v43;
                _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Updating the name of target accessory %@/%@ to %@", buf, 0x2Au);

                v38 = v60;
              }

              objc_autoreleasePoolPop(v38);
              objc_msgSend(v4, "name");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setName:", v46);

              v47 = *(void **)(v27 + 40);
              objc_msgSend(v4, "name");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "_updateName:buttonConfiguration:target:", v48, 0, v22);

            }
            goto LABEL_22;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_22:

    v13 = v62;
  }
  else
  {
    v49 = (void *)MEMORY[0x227676638]();
    v50 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "controller");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "controller");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "uuid");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "UUIDString");
      v63 = v49;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v69 = v52;
      v70 = 2112;
      v71 = (uint64_t)v54;
      v72 = 2112;
      v73 = (uint64_t)v57;
      _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Attempting to process accessory name update with a controller %@/%@ that is not configured with a home", buf, 0x20u);

      v49 = v63;
    }

    objc_autoreleasePoolPop(v49);
  }

}

void __51__HMDTargetControllerManager___accessoryConnected___block_invoke(uint64_t a1)
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

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
    *(_DWORD *)buf = 138543874;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Connected to accessory %@/%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v12 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "controller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (v18)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Connected to controller - refreshing the supported target configuration and auditing the list of targets", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      v23 = *(void **)(a1 + 40);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __51__HMDTargetControllerManager___accessoryConnected___block_invoke_46;
      v24[3] = &unk_24E799B48;
      objc_copyWeak(&v25, (id *)buf);
      objc_msgSend(v23, "_refreshConfigurationWithCompletion:", v24);
      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __51__HMDTargetControllerManager___accessoryConnected___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to refresh the supported target configuration - error %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __54__HMDTargetControllerManager___accessoryDisconnected___block_invoke(uint64_t a1)
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

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
    v23 = 138543874;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Disconnected from accessory %@/%@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v12 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "controller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (v18)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Disconnected from controller - marking configuation as stale", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(*(id *)(a1 + 40), "setConfigurationRefreshed:", 0);
    }
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_77328 != -1)
    dispatch_once(&logCategory__hmf_once_t6_77328, &__block_literal_global_77329);
  return (id)logCategory__hmf_once_v7_77330;
}

void __41__HMDTargetControllerManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_77330;
  logCategory__hmf_once_v7_77330 = v0;

}

@end
