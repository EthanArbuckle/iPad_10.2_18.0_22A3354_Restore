@implementation HMDTargetControlManager

- (HMDTargetControlManager)init
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

- (HMDTargetControlManager)initWithTargetAccessory:(id)a3 controllers:(id)a4
{
  id v6;
  id v7;
  HMDTargetControlManager *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  id v14;
  uint64_t v15;
  NSMutableArray *configuredControllers;
  uint64_t v17;
  NSMutableArray *activeControlServices;
  uint64_t v19;
  NSMutableArray *eventReceivers;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *logID;
  void *v27;
  HMDTargetControlManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
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
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  HMDTargetControlManager *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  HMDTargetControlManager *v56;
  void *v57;
  void *v58;
  void *v60;
  HMDTargetControlManager *v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *context;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
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
  v71.receiver = self;
  v71.super_class = (Class)HMDTargetControlManager;
  v8 = -[HMDTargetControlManager init](&v71, sel_init);
  if (v8)
  {
    HMDispatchQueueNameString();
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v8->_targetAccessory, v6);
    if (v7)
      v14 = v7;
    else
      v14 = (id)MEMORY[0x24BDBD1A8];
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    configuredControllers = v8->_configuredControllers;
    v8->_configuredControllers = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    activeControlServices = v8->_activeControlServices;
    v8->_activeControlServices = (NSMutableArray *)v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    eventReceivers = v8->_eventReceivers;
    v8->_eventReceivers = (NSMutableArray *)v19;

    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@/%@"), v22, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    logID = v8->_logID;
    v8->_logID = (NSString *)v25;

    v27 = (void *)MEMORY[0x227676638]();
    v61 = v8;
    v28 = v8;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v30;
      v74 = 2112;
      v75 = v7;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Initializing target control manager with controllers %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v28, sel___targetAccessoryConfiguredForControl_, CFSTR("HMDTargetAccessoryConfiguredNotificationKey"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v28, sel___targetAccessoryUnconfiguredForControl_, CFSTR("HMDTargetAccessoryUnconfiguredNotificationKey"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v28, sel___controllerRefreshedConfiguration_, CFSTR("HMDTargetControllerAccessoryConfigurationUpdatedNotificationKey"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v28, sel___accessoryNameUpdated_, CFSTR("HMDAccessoryNameUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v28, sel___activeSelectionChanged_, CFSTR("HMDTargetControlServiceSelectedNotificationKey"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v28, sel___activeSelectionReset_, CFSTR("HMDTargetControlServiceDeselectedNotificationKey"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v28, sel___accessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v28, sel___accessoryUnconfigured_, CFSTR("HMDAccessoryDisconnectedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v28, sel___characteristicsEventsReceived_, *MEMORY[0x24BE1B490], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:selector:name:object:", v28, sel___accessoryAdded_, CFSTR("HMDNotificationHomeAddedAccessory"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v28, sel___accessoryRemoved_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v28, sel___serviceRemoved_, CFSTR("HMDHomeServiceRemovedNotification"), 0);

    v62 = v6;
    objc_msgSend(v6, "home");
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "accessories");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v68;
      v63 = v43;
      v64 = v7;
      do
      {
        v47 = 0;
        v65 = v45;
        do
        {
          if (*(_QWORD *)v68 != v46)
            objc_enumerationMutation(v43);
          v48 = *(id *)(*((_QWORD *)&v67 + 1) + 8 * v47);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v49 = v48;
          else
            v49 = 0;
          v50 = v49;

          if (objc_msgSend(v50, "supportsTargetController")
            && (objc_msgSend(v7, "containsObject:", v50) & 1) == 0)
          {
            context = (void *)MEMORY[0x227676638]();
            v51 = v28;
            HMFGetOSLogHandle();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "name");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "uuid");
              v55 = v46;
              v56 = v28;
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "UUIDString");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v73 = v53;
              v74 = 2112;
              v75 = v54;
              v76 = 2112;
              v77 = v58;
              _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Adding %@/%@ as a configured controller", buf, 0x20u);

              v28 = v56;
              v46 = v55;

              v45 = v65;
              v43 = v63;

              v7 = v64;
            }

            objc_autoreleasePoolPop(context);
            -[HMDTargetControlManager _addController:](v51, "_addController:", v50);
            -[HMDTargetControlManager __getOrCreateEventReceiver:](v51, "__getOrCreateEventReceiver:", v50);

          }
          ++v47;
        }
        while (v45 != v47);
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      }
      while (v45);
    }

    v8 = v61;
    v6 = v62;
  }

  return v8;
}

- (void)invalidate
{
  void *v3;
  HMDTargetControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating target control manager", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", v4);

  -[HMDTargetControlManager siriServer](v4, "siriServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDTargetControlManager siriServer](v4, "siriServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager targetAccessory](v4, "targetAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTargetableAccessory:withControllers:", v10, MEMORY[0x24BDBD1A8]);

    -[HMDTargetControlManager setSiriServer:](v4, "setSiriServer:", 0);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDTargetControlManager activeControlServices](v4, "activeControlServices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[HMDTargetControlManager _handleTargetControlServiceDeselection:](v4, "_handleTargetControlServiceDeselection:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDTargetControlManager configuredControllers](v4, "configuredControllers", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[HMDTargetControlManager _targetAccessoryUnconfiguredWithController:](v4, "_targetAccessoryUnconfiguredWithController:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++));
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDTargetControlManager targetAccessory](self, "targetAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableArray)configuredControllers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_configuredControllers, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (void)_addController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_configuredControllers, "addObject:", v10);
  os_unfair_lock_unlock(&self->_lock);
  -[HMDTargetControlManager siriServer](self, "siriServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[HMDSiriServer sharedSiriServer](HMDSiriServer, "sharedSiriServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager setSiriServer:](self, "setSiriServer:", v5);

  }
  -[HMDTargetControlManager siriServer](self, "siriServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDTargetControlManager siriServer](self, "siriServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager targetAccessory](self, "targetAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager configuredControllers](self, "configuredControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTargetableAccessory:withControllers:", v8, v9);

  }
}

- (void)_removeController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_configuredControllers, "removeObject:", v8);
  os_unfair_lock_unlock(&self->_lock);
  -[HMDTargetControlManager siriServer](self, "siriServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDTargetControlManager siriServer](self, "siriServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager targetAccessory](self, "targetAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager configuredControllers](self, "configuredControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTargetableAccessory:withControllers:", v6, v7);

  }
}

- (NSMutableArray)activeControlServices
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_activeControlServices, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (void)addControlService:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_activeControlServices, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeControlService:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_activeControlServices, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSMutableArray)eventReceivers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_eventReceivers, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (void)addReceiver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_eventReceivers, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeReceiver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_eventReceivers, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)addTargetControllers:(id)a3
{
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMDTargetControlManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDTargetControlManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  uint64_t v33;
  HMDTargetControlManager *v34;
  id obj;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = a3;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v40)
  {
    v5 = *(_QWORD *)v43;
    *(_QWORD *)&v4 = 138543874;
    v32 = v4;
    v33 = *(_QWORD *)v43;
    v34 = self;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v43 != v5)
          objc_enumerationMutation(obj);
        v7 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;

        if (v9)
        {
          -[HMDTargetControlManager __getOrCreateEventReceiver:](self, "__getOrCreateEventReceiver:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "targetControllerTicksPerSecond");
          if (v11)
          {
            v12 = v11;
            if (objc_msgSend(v10, "ticksPerSecond") != v11)
              objc_msgSend(v10, "setTicksPerSecond:", v12);
          }
          objc_msgSend(v9, "targetControllerButtonConfiguration", v32);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDTargetControlManager __selectButtonConfiguration:receiver:](self, "__selectButtonConfiguration:receiver:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)MEMORY[0x227676638]();
          v16 = self;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v39 = v14;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDTargetControlManager targetAccessory](v16, "targetAccessory");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "name");
            v37 = v15;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "name");
            v38 = v10;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "UUIDString");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            buttonConfigurationAsString(v39);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v47 = v18;
            v48 = 2112;
            v49 = v19;
            v50 = 2112;
            v51 = v20;
            v52 = 2112;
            v53 = v22;
            v54 = 2112;
            v55 = v23;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Adding target %@ to controller %@/%@ with button configuration %@", buf, 0x34u);

            v10 = v38;
            v15 = v37;

            self = v34;
            v5 = v33;

            v14 = v39;
          }

          objc_autoreleasePoolPop(v15);
          -[HMDTargetControlManager targetAccessory](v16, "targetAccessory");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addTarget:buttonConfiguration:", v24, v14);

          objc_msgSend(v9, "registerForActiveIdentifierNotifications");
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
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(0, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(0, "uuid");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "UUIDString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v47 = v28;
            v48 = 2112;
            v49 = v29;
            v50 = 2112;
            v51 = v31;
            _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Attempt to add a target controller %@/%@ that is not a HAP accessory", buf, 0x20u);

            self = v34;
            v5 = v33;

          }
          objc_autoreleasePoolPop(v25);
        }

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v40);
  }

}

- (void)__targetAccessoryConfiguredForControl:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDTargetControlManager___targetAccessoryConfiguredForControl___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__targetAccessoryUnconfiguredForControl:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__HMDTargetControlManager___targetAccessoryUnconfiguredForControl___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)__selectButtonConfiguration:(id)a3 receiver:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HMDTargetControlManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  void *v25;
  HMDTargetButtonConfiguration *v26;
  void *v27;
  HMDTargetButtonConfiguration *v28;
  uint64_t v29;
  HMDTargetButtonConfiguration *v30;
  HMDTargetButtonConfiguration *v31;
  HMDTargetButtonConfiguration *v32;
  HMDTargetButtonConfiguration *v33;
  HMDTargetButtonConfiguration *v34;
  HMDTargetButtonConfiguration *v35;
  HMDTargetButtonConfiguration *v36;
  HMDTargetButtonConfiguration *v37;
  HMDTargetButtonConfiguration *v38;
  HMDTargetButtonConfiguration *v39;
  HMDTargetButtonConfiguration *v40;
  HMDTargetButtonConfiguration *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDTargetControlManager *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDTargetControlManager *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = 0;
  if (v7 && v8)
  {
    mapButtonConfigurationForTVReceiver(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      buttonConfigurationAsString(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v14;
      v59 = 2112;
      v60 = v15;
      v61 = 2112;
      v62 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Supported button configuration %@  Mapped supported button set: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    if (v10)
    {
      v51 = v12;
      v52 = v10;
      +[THAController selectButtonConfiguration:supportsSiri:](THAController, "selectButtonConfiguration:supportsSiri:", v10, objc_msgSend(v7, "supportsSiri"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateSelectedButtons:", v16);
      v17 = v16;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v17, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v54;
        do
        {
          v23 = v19;
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v54 != v22)
              objc_enumerationMutation(v23);
            v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            switch(objc_msgSend(v25, "type"))
            {
              case 1:
                v26 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v26;
                v29 = 1;
                goto LABEL_24;
              case 2:
                v31 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v31;
                v29 = 3;
                goto LABEL_24;
              case 3:
                v32 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v32;
                v29 = 6;
                goto LABEL_24;
              case 4:
                v33 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v33;
                v29 = 8;
                goto LABEL_24;
              case 5:
                v34 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v34;
                v29 = 5;
                goto LABEL_24;
              case 6:
                v35 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v35;
                v29 = 7;
                goto LABEL_24;
              case 7:
                v36 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v36;
                v29 = 4;
                goto LABEL_24;
              case 8:
                v37 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v37;
                v29 = 2;
                goto LABEL_24;
              case 9:
                v38 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v38;
                v29 = 9;
                goto LABEL_24;
              case 10:
                v39 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v39;
                v29 = 10;
                goto LABEL_24;
              case 11:
                v40 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v40;
                v29 = 12;
                goto LABEL_24;
              case 12:
                v30 = [HMDTargetButtonConfiguration alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v25, "identifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v30;
                v29 = 11;
LABEL_24:
                v41 = -[HMDTargetButtonConfiguration initWithType:identifier:name:](v28, "initWithType:identifier:name:", v29, v27, 0);

                if (v41)
                {
                  objc_msgSend(v18, "addObject:", v41);

                }
                break;
              default:
                continue;
            }
          }
          v19 = v23;
          v21 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
        }
        while (v21);
      }

      v42 = (void *)objc_msgSend(v18, "copy");
      v43 = (void *)objc_msgSend(v42, "mutableCopy");

      v44 = (void *)MEMORY[0x227676638]();
      v45 = v51;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "allObjects");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        buttonConfigurationAsString(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v47;
        v59 = 2112;
        v60 = v19;
        v61 = 2112;
        v62 = v49;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Selected button set %@, Mapped and augmented button configuration: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v44);
      v9 = (void *)objc_msgSend(v43, "copy");

      v10 = v52;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)_targetAccessoryRefreshConfigurationWithController:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  HMDTargetControlManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDTargetControlManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  HMDTargetControlManager *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  HMDTargetControlManager *v49;
  NSObject *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDTargetControlManager *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDTargetControlManager *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "supportsSiri");
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v75 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v15 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v83 = v12;
    v84 = 2112;
    v85 = v13;
    v86 = 2112;
    v87 = v14;
    v88 = 2112;
    v89 = v17;
    v90 = 2112;
    v91 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling configuration refresh from controller (supportsSiri %@) %@/%@: %@", buf, 0x34u);

    v10 = v15;
    v9 = v75;

  }
  objc_autoreleasePoolPop(v9);
  -[HMDTargetControlManager __getOrCreateEventReceiver:](v10, "__getOrCreateEventReceiver:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSupportsSiri:", v8);
  objc_msgSend(v7, "hmf_numberForKey:", CFSTR("ticksPerSecond"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = objc_msgSend(v18, "ticksPerSecond");
    if (v20 != objc_msgSend(v19, "unsignedLongValue"))
      objc_msgSend(v18, "setTicksPerSecond:", objc_msgSend(v19, "unsignedLongValue"));
  }
  -[HMDTargetControlManager targetAccessory](v10, "targetAccessory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "home");
  v22 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v22;
  v76 = v21;
  if (v22)
  {
    v23 = (void *)v22;
    v72 = v19;
    v68 = v6;
    objc_msgSend(v21, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = identifierForTargetWithUUID(v24, v25);

    objc_msgSend(v7, "hmf_arrayForKey:", CFSTR("buttonConfiguration"));
    v66 = v10;
    v67 = v18;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager __selectButtonConfiguration:receiver:](v10, "__selectButtonConfiguration:receiver:");
    v70 = v7;
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_arrayForKey:", CFSTR("targetConfiguration"));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v78;
LABEL_9:
      v31 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v31);
        objc_msgSend(v32, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v26);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "isEqual:", v34);

        if ((v35 & 1) != 0)
          break;
        if (v29 == ++v31)
        {
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
          if (v29)
            goto LABEL_9;
          goto LABEL_15;
        }
      }
      v36 = v32;

      v21 = v76;
      if (!v36)
        goto LABEL_19;
      objc_msgSend(v36, "name");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "name");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqualToString:", v38);

      v19 = v72;
      if ((v39 & 1) != 0)
      {
        v40 = 0;
      }
      else
      {
        objc_msgSend(v76, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)MEMORY[0x227676638]();
        v58 = v66;
        HMFGetOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "name");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v83 = v60;
          v84 = 2112;
          v85 = v61;
          v86 = 2112;
          v87 = v40;
          _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Target name in the controller configuration %@ is stale - updating to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v57);
      }
      v18 = v67;
      v62 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v36, "buttonConfiguration");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setWithArray:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v68;
      v21 = v76;
      if (v40 || (HMFEqualObjects() & 1) == 0)
      {
        objc_msgSend(v71, "allObjects");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "updateTarget:name:buttonConfiguration:", v76, v40, v65);

      }
      objc_msgSend(v68, "registerForActiveIdentifierNotifications");

    }
    else
    {
LABEL_15:

      v21 = v76;
LABEL_19:
      v41 = (void *)MEMORY[0x227676638]();
      v42 = v66;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      v19 = v72;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uuid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "UUIDString");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v83 = v44;
        v84 = 2112;
        v85 = v45;
        v86 = 2112;
        v87 = v47;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Target %@/%@ does not exist in controller configuration - for now, not adding", buf, 0x20u);

        v21 = v76;
      }

      objc_autoreleasePoolPop(v41);
      v6 = v68;
    }

    v7 = v70;
  }
  else
  {
    v48 = (void *)MEMORY[0x227676638]();
    v49 = v10;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v73 = v19;
      v52 = v7;
      v53 = v6;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uuid");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "UUIDString");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v83 = v51;
      v84 = 2112;
      v85 = v54;
      v86 = 2112;
      v87 = v56;
      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Attempting to process configuration refresh for target accessory %@/%@ that is not configured with a home", buf, 0x20u);

      v6 = v53;
      v7 = v52;
      v19 = v73;

      v21 = v76;
    }

    objc_autoreleasePoolPop(v48);
  }

}

- (void)__controllerRefreshedConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDTargetControlManager___controllerRefreshedConfiguration___block_invoke;
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
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMDTargetControlManager___accessoryNameUpdated___block_invoke;
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
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDTargetControlManager___accessoryConnected___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__accessoryDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__HMDTargetControlManager___accessoryDisconnected___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__accessoryAdded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__HMDTargetControlManager___accessoryAdded___block_invoke;
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
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDTargetControlManager___accessoryRemoved___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__serviceRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDTargetControlManager *v9;

  v4 = a3;
  -[HMDTargetControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__HMDTargetControlManager___serviceRemoved___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)__getOrCreateEventReceiver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  THAController *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  THAController *v16;
  void *v17;
  HMDTargetControlManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMDTargetControlManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  THAController *v35;
  void *v36;
  void *v38;
  unsigned int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = identifierForTargetWithUUID(v6, v7);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[HMDTargetControlManager eventReceivers](self, "eventReceivers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (!v10)
    {

LABEL_17:
      v24 = objc_msgSend(v4, "supportsSiri");
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v39 = v24;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v38 = v25;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUIDString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v45 = v28;
        v46 = 2112;
        v47 = v29;
        v48 = 2112;
        v49 = v30;
        v50 = 2112;
        v51 = v32;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Creating an event receiver (supportsSiri: %@) to handle events from controller %@/%@", buf, 0x2Au);

        v25 = v38;
        v24 = v39;

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(v4, "targetControllerButtonConfiguration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      mapButtonConfigurationForTVReceiver(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = [THAController alloc];
      objc_msgSend(v4, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[THAController initWithName:identifier:ticksPerSecond:supportedButtons:supportsSiri:](v35, "initWithName:identifier:ticksPerSecond:supportedButtons:supportsSiri:", v36, v8, objc_msgSend(v4, "targetControllerTicksPerSecond"), v34, v24);

      -[HMDTargetControlManager addReceiver:](v26, "addReceiver:", v12);
      -[THAController setConnected:](v12, "setConnected:", objc_msgSend(v4, "isReachable"));

      goto LABEL_20;
    }
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v15, "identifier") == (_DWORD)v8)
        {
          v16 = v15;

          v12 = v16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v11);

    if (!v12)
      goto LABEL_17;
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
      objc_msgSend(v4, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v20;
      v46 = 2112;
      v47 = v21;
      v48 = 2112;
      v49 = v23;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Attempting to lookup or create an event receiver for a configured controller %@/%@ that is not configured with a home", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v12 = 0;
  }
LABEL_20:

  return v12;
}

- (void)_handleButtonEvent:(id)a3 fromControlService:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDTargetControlManager *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  HMDTargetControlManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  HMDTargetControlManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  THAButtonEvent *v53;
  void *v54;
  HMDTargetControlManager *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  HMDTargetControlManager *v62;
  NSObject *v63;
  void *v64;
  HMDTargetControlManager *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  HMDTargetControlManager *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  HMDTargetControlManager *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  unint64_t v92;
  unsigned int v93;
  void *v94;
  void *v95;
  void *v96;
  unsigned __int8 UInt64;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  int v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t v107[128];
  uint8_t buf[4];
  uint64_t v109;
  __int16 v110;
  unint64_t v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  void *v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  v102 = 0;
  objc_msgSend(v7, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTargetControlManager targetAccessory](self, "targetAccessory");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  UInt64 = TLV8GetUInt64();
  v92 = TLV8GetUInt64();
  v91 = TLV8GetUInt64();
  v93 = TLV8GetUInt64();
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v96 = v9;
  v94 = v10;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("Up");
    if (v92 == 1)
      v16 = CFSTR("Down");
    v90 = (void *)v14;
    objc_msgSend(v7, "accessory", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "instanceID");
    v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v109 = v15;
    v110 = 2048;
    v111 = UInt64;
    v112 = 2112;
    v113 = v89;
    v114 = 2048;
    v115 = v91;
    v116 = 2048;
    v117 = v93;
    v118 = 2112;
    v119 = v18;
    v120 = 2112;
    v121 = v20;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Button %lu changed to '%@' with timestamp %lu for target %lu from control service %@/%@", buf, 0x48u);

    v7 = v19;
    v10 = v94;
    v9 = v96;

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    objc_msgSend(v9, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = identifierForTargetWithUUID(v21, v22);

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    -[HMDTargetControlManager eventReceivers](v12, "eventReceivers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
    if (v25)
    {
      v26 = v25;
      v27 = v8;
      v28 = v7;
      v29 = 0;
      v30 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v99 != v30)
            objc_enumerationMutation(v24);
          v32 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          if (objc_msgSend(v32, "identifier") == v23)
          {
            v33 = v32;

            v29 = v33;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
      }
      while (v26);

      v7 = v28;
      v8 = v27;
      if (v29)
      {
        objc_msgSend(v95, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "home");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = identifierForTargetWithUUID(v34, v36);

        if (v37 == v93)
        {
          if (v92 >= 2)
          {
            v38 = (void *)MEMORY[0x227676638]();
            v39 = v12;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "name");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "uuid");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "UUIDString");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v109 = (uint64_t)v41;
              v110 = 2048;
              v111 = v92;
              v112 = 2112;
              v113 = (uint64_t)v42;
              v114 = 2112;
              v115 = (uint64_t)v44;
              _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Invalid buttonState %lu for controller %@/%@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v38);
            v45 = 1;
LABEL_64:
            v9 = v96;
            +[HMDTargetControllerErrorEvent errorEventWithErrorType:accessory:](HMDTargetControllerErrorEvent, "errorEventWithErrorType:accessory:", v45, v96);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "submitLogEvent:", v87);

            v53 = 0;
            goto LABEL_37;
          }
          v65 = v12;
          v29 = v29;
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          objc_msgSend(v29, "selectedButtons");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
          if (v67)
          {
            v68 = v67;
            v69 = *(_QWORD *)v104;
LABEL_41:
            v70 = 0;
            while (1)
            {
              if (*(_QWORD *)v104 != v69)
                objc_enumerationMutation(v66);
              v71 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v70);
              if (objc_msgSend(v71, "identifier") == UInt64)
                break;
              if (v68 == ++v70)
              {
                v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
                if (v68)
                  goto LABEL_41;
                v53 = 0;
                goto LABEL_53;
              }
            }
            v72 = v71;

            if (v72)
            {
              v53 = objc_alloc_init(THAButtonEvent);
              -[THAButtonEvent setButton:](v53, "setButton:", v72);
              if (v92)
                v73 = 1;
              else
                v73 = 2;
              -[THAButtonEvent setState:](v53, "setState:", v73);
              -[THAButtonEvent setTimestamp:](v53, "setTimestamp:", (double)(unint64_t)v91 / (double)(unint64_t)objc_msgSend(v29, "ticksPerSecond"));
              v66 = v72;
LABEL_53:
              v8 = v27;
              goto LABEL_55;
            }

            v8 = v27;
            goto LABEL_61;
          }
          v53 = 0;
LABEL_55:

          if (!v53)
          {
LABEL_61:
            v80 = (void *)MEMORY[0x227676638]();
            v81 = v65;
            HMFGetOSLogHandle();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "accessory");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "name");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "instanceID");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v109 = (uint64_t)v83;
              v110 = 2112;
              v111 = (unint64_t)v85;
              v112 = 2112;
              v113 = (uint64_t)v86;
              v114 = 2048;
              v115 = UInt64;
              _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_INFO, "%{public}@Received an event from control service %@/%@ for a button id %lu that is not mapped into the receiver's selected buttons", buf, 0x2Au);

              v7 = v28;
            }

            objc_autoreleasePoolPop(v80);
            v45 = 0;
            goto LABEL_64;
          }
          if ((objc_msgSend(v29, "dispatchButtonEvent:", v53) & 1) == 0)
          {
            v74 = (void *)MEMORY[0x227676638]();
            v75 = v65;
            HMFGetOSLogHandle();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              -[THAButtonEvent button](v53, "button");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = objc_msgSend(v78, "type");
              *(_DWORD *)buf = 138543874;
              v109 = (uint64_t)v77;
              v110 = 2048;
              v111 = UInt64;
              v8 = v27;
              v112 = 2048;
              v113 = v79;
              _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_INFO, "%{public}@Received an event for button with ID %lu/type %lu - consuming in HomeKit layer", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v74);
          }
        }
        else
        {
          v61 = (void *)MEMORY[0x227676638]();
          v62 = v12;
          HMFGetOSLogHandle();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v109 = (uint64_t)v64;
            v110 = 2048;
            v111 = v93;
            v112 = 2048;
            v113 = v37;
            _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@Event targetID %lu does not match our target identifier %lu - treating as deselection to avoid receiving additional events", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v61);
          -[HMDTargetControlManager _handleTargetControlServiceDeselection:](v62, "_handleTargetControlServiceDeselection:", v7);
          v53 = 0;
        }
LABEL_36:
        v9 = v96;
LABEL_37:
        v10 = v94;
        goto LABEL_38;
      }
    }
    else
    {

    }
    v54 = (void *)MEMORY[0x227676638]();
    v55 = v12;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "name");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "uuid");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "UUIDString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v109 = (uint64_t)v57;
      v110 = 2112;
      v111 = (unint64_t)v58;
      v112 = 2112;
      v113 = (uint64_t)v60;
      _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@No event receiver set up for controller %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v54);
    v53 = 0;
    v29 = 0;
    goto LABEL_36;
  }
  v46 = (void *)MEMORY[0x227676638]();
  v47 = v12;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "UUIDString");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v109 = (uint64_t)v49;
    v110 = 2112;
    v111 = (unint64_t)v50;
    v112 = 2112;
    v113 = (uint64_t)v52;
    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Attempting to lookup or create an event receiver for a configured controller %@/%@ that is not configured with a home", buf, 0x20u);

    v10 = 0;
    v9 = v96;

  }
  objc_autoreleasePoolPop(v46);
  v53 = 0;
  v29 = 0;
LABEL_38:

}

- (void)__characteristicsEventsReceived:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  HMDTargetControlManager *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  HMDTargetControlManager *v34;
  void *v35;
  void *context;
  void *v37;
  HMDTargetControlManager *v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
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
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  objc_msgSend(v31, "userInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hmf_arrayForKey:", *MEMORY[0x24BE1B498]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTargetControlManager activeControlServices](self, "activeControlServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  -[HMDTargetControlManager targetAccessory](self, "targetAccessory");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v6)
  {
    v7 = v6;
    v41 = *(_QWORD *)v44;
    v8 = *MEMORY[0x24BDD6C60];
    v39 = *MEMORY[0x24BDD57A8];
    v37 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v42, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serverIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accessoryInstanceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hapAccessoryWithIdentifier:instanceID:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "serviceInstanceID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "findService:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", v8))
        {
          v18 = objc_msgSend(v5, "containsObject:", v16);

          if (!v18)
            goto LABEL_19;
          objc_msgSend(v10, "characteristicInstanceID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "findCharacteristic:", v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v39);

          if (v21)
          {
            objc_msgSend(v10, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v23 = v22;
            else
              v23 = 0;
            v24 = v23;

            if (v24)
            {
              -[HMDTargetControlManager _handleButtonEvent:fromControlService:](v38, "_handleButtonEvent:fromControlService:", v24, v16);
            }
            else
            {
              context = (void *)MEMORY[0x227676638]();
              v25 = v38;
              HMFGetOSLogHandle();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "value");
                v34 = v25;
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "accessory");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "name");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "instanceID");
                v28 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v48 = v35;
                v49 = 2112;
                v50 = v32;
                v51 = 2112;
                v52 = v27;
                v53 = 2112;
                v54 = v28;
                v29 = (void *)v28;
                _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Button event data not NSData but %@ from control service %@/%@", buf, 0x2Au);

                v25 = v34;
              }

              objc_autoreleasePoolPop(context);
            }

            v5 = v37;
          }
        }

LABEL_19:
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v7);
  }

}

- (void)_targetAccessoryConfiguredWithController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HMDTargetControlManager *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  v4 = a3;
  -[HMDTargetControlManager configuredControllers](self, "configuredControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTargetControlManager targetAccessory](v8, "targetAccessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Controller %@ already configured for controlling target accessory %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding controller %@ to the list of configuredControllers and registering for notifications ", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDTargetControlManager _addController:](v8, "_addController:", v4);
    -[HMDTargetControlManager __getOrCreateEventReceiver:](v8, "__getOrCreateEventReceiver:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConnected:", objc_msgSend(v4, "isReachable"));

  }
  objc_msgSend(v4, "registerForActiveIdentifierNotifications");

}

- (void)_targetAccessoryUnconfiguredWithController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  HMDTargetControlManager *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  HMDTargetControlManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  HMDTargetControlManager *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTargetControlManager configuredControllers](self, "configuredControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);
  v7 = (void *)MEMORY[0x227676638]();
  v46 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v10;
      v54 = 2112;
      v55 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing controller %@ from list of controllers", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDTargetControlManager _removeController:](v46, "_removeController:", v4);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTargetControlManager targetAccessory](v46, "targetAccessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v12;
      v54 = 2112;
      v55 = v13;
      v56 = 2112;
      v57 = v15;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Controller %@ is not configured for controlling target accessory %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(v4, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v43 = v5;
    objc_msgSend(v4, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v16;
    objc_msgSend(v16, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = identifierForTargetWithUUID(v17, v18);

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[HMDTargetControlManager eventReceivers](v46, "eventReceivers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v48;
      do
      {
        v24 = 0;
        v44 = v22;
        do
        {
          if (*(_QWORD *)v48 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v24);
          if (objc_msgSend(v25, "identifier") == (_DWORD)v19)
          {
            v26 = (void *)MEMORY[0x227676638]();
            v27 = v46;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v45 = v26;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "name");
              v30 = v23;
              v31 = v20;
              v32 = v19;
              v33 = v4;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v29;
              v54 = 2112;
              v55 = v34;
              _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Removing receiver %@ from list of receivers", buf, 0x16u);

              v4 = v33;
              v19 = v32;
              v20 = v31;
              v23 = v30;
              v22 = v44;

              v26 = v45;
            }

            objc_autoreleasePoolPop(v26);
            -[HMDTargetControlManager removeReceiver:](v27, "removeReceiver:", v25);
          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v22);
    }

    v16 = v42;
    v5 = v43;
  }
  else
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v46;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "UUIDString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v38;
      v54 = 2112;
      v55 = v39;
      v56 = 2112;
      v57 = v41;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Attempting to lookup or create an event receiver for a %@/%@ that is not configured with a home", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v35);
  }

}

- (void)_handleControllerDisconnected:(id)a3
{
  id v4;
  void *v5;
  HMDTargetControlManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
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
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager targetAccessory](v6, "targetAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller %@ for target accessory %@ is disconnected - marking as deselected for target control", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "services", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    v16 = *MEMORY[0x24BDD6C60];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v18, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v16);

        if (v20)
        {
          -[HMDTargetControlManager removeControlService:](v6, "removeControlService:", v18);
          -[HMDTargetControlManager __getOrCreateEventReceiver:](v6, "__getOrCreateEventReceiver:", v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setConnected:", 0);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

}

- (void)_handleTargetControlServiceSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDTargetControlManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Tracking controller %@ service %@ for active selection", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDTargetControlManager addControlService:](v7, "addControlService:", v4);
  -[HMDTargetControlManager __getOrCreateEventReceiver:](v7, "__getOrCreateEventReceiver:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelected:", 1);
  objc_msgSend(v5, "acknowledgeTargetControlService:active:", v4, 1);

}

- (void)_handleTargetControlServiceDeselection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  HMDTargetControlManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTargetControlManager activeControlServices](self, "activeControlServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD6C60]) & 1) != 0)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "containsObject:", v4);

    if ((v7 & 1) == 0)
      goto LABEL_7;
  }
  objc_msgSend(v4, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "instanceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification that control service %@/%@  is not actively controlling this target accessory", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDTargetControlManager removeControlService:](v10, "removeControlService:", v4);
  -[HMDTargetControlManager __getOrCreateEventReceiver:](v10, "__getOrCreateEventReceiver:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelected:", 0);
  objc_msgSend(v8, "acknowledgeTargetControlService:active:", v4, 0);

LABEL_7:
}

- (void)__activeSelectionChanged:(id)a3
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
  HMDTargetControlManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDTargetControlManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  HMDTargetControlManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDTargetControlManager *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  HMDTargetControlManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTargetControlManager configuredControllers](self, "configuredControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_numberForKey:", CFSTR("activeIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v60 = v4;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v56 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTargetControlManager configuredControllers](v13, "configuredControllers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v62 = v15;
    v63 = 2112;
    v64 = v17;
    v65 = 2112;
    v66 = (uint64_t)v18;
    v67 = 2112;
    v68 = v19;
    v69 = 2112;
    v70 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller %@ service %@ changed active selection - configuredControllers %@  identifier %@", buf, 0x34u);

    v11 = v16;
    v9 = v56;
    v4 = v60;
  }

  objc_autoreleasePoolPop(v12);
  if (objc_msgSend(v9, "containsObject:", v8) && v11)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v13;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v62 = v23;
      v63 = 2112;
      v64 = v24;
      v65 = 2112;
      v66 = (uint64_t)v25;
      v67 = 2112;
      v68 = v11;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ changed active selection to %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDTargetControlManager targetAccessory](v21, "targetAccessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "home");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v11;
    if (v27)
    {
      v28 = objc_msgSend(v11, "unsignedIntegerValue");
      objc_msgSend(v26, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = identifierForTargetWithUUID(v29, v30);

      -[HMDTargetControlManager activeControlServices](v21, "activeControlServices");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "containsObject:", v7))
      {
        if (v31 != v28)
        {
          v33 = (void *)MEMORY[0x227676638]();
          v34 = v21;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v57 = v32;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name");
            v52 = v33;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "name");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v62 = v36;
            v63 = 2112;
            v64 = v37;
            v65 = 2112;
            v66 = (uint64_t)v38;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ has deselected this target accessory", buf, 0x20u);

            v33 = v52;
            v32 = v57;
          }

          objc_autoreleasePoolPop(v33);
          -[HMDTargetControlManager _handleTargetControlServiceDeselection:](v34, "_handleTargetControlServiceDeselection:", v7);
        }
      }
      else if (v31 == v28)
      {
        v46 = (void *)MEMORY[0x227676638]();
        v47 = v21;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v59 = v32;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v54 = v46;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "name");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = v49;
          v63 = 2112;
          v64 = v50;
          v65 = 2112;
          v66 = (uint64_t)v51;
          _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ has selected this target accessory", buf, 0x20u);

          v46 = v54;
          v32 = v59;
        }

        objc_autoreleasePoolPop(v46);
        -[HMDTargetControlManager _handleTargetControlServiceSelection:](v47, "_handleTargetControlServiceSelection:", v7);
      }

    }
    else
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v21;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "name");
        v58 = v39;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "uuid");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "UUIDString");
        v44 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v53;
        v63 = 2112;
        v64 = v42;
        v65 = 2112;
        v66 = v44;
        v45 = (void *)v44;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Attempting to process active selection change for a target %@/%@ that is not configured with a home", buf, 0x20u);

        v39 = v58;
      }

      objc_autoreleasePoolPop(v39);
    }

    v4 = v60;
    v11 = v55;
  }

}

- (void)__activeSelectionReset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDTargetControlManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDTargetControlManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDTargetControlManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    v34 = 2112;
    v35 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller %@ service %@ reset its active selection", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDTargetControlManager configuredControllers](v10, "configuredControllers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "containsObject:", v8))
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v10;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ has reset its active selection", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDTargetControlManager activeControlServices](v17, "activeControlServices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "containsObject:", v7))
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v17;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "name");
        v29 = v23;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        v34 = 2112;
        v35 = v28;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Received notification that a configured controller %@ service %@ has deselected this target accessory", buf, 0x20u);

        v23 = v29;
      }

      objc_autoreleasePoolPop(v23);
      -[HMDTargetControlManager _handleTargetControlServiceDeselection:](v24, "_handleTargetControlServiceDeselection:", v7);
    }

  }
}

- (HMDAccessory)targetAccessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_targetAccessory);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)logID
{
  return self->_logID;
}

- (HMDSiriServer)siriServer
{
  return self->_siriServer;
}

- (void)setSiriServer:(id)a3
{
  objc_storeStrong((id *)&self->_siriServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriServer, 0);
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_eventReceivers, 0);
  objc_storeStrong((id *)&self->_activeControlServices, 0);
  objc_storeStrong((id *)&self->_configuredControllers, 0);
  objc_destroyWeak((id *)&self->_targetAccessory);
}

void __44__HMDTargetControlManager___serviceRemoved___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
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
  int v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
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
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v1 = a1;
  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDServiceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(v1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instanceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v41 = v1;
    v42 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v14 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v46 = v10;
    v47 = 2112;
    v48 = v11;
    v49 = 2112;
    v50 = v12;
    v51 = 2112;
    v52 = v13;
    v53 = 2112;
    v54 = v16;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification that a service %@/%@ has been removed from the accessory %@/%@", buf, 0x34u);

    v7 = v14;
    v1 = v41;
    v5 = v42;

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v5, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD6C68]);

  if (v18)
  {
    objc_msgSend(*(id *)(v1 + 40), "configuredControllers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsObject:", v6);

    if (v20)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = *(id *)(v1 + 40);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "instanceID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v43 = v6;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v46 = v24;
        v47 = 2112;
        v48 = v25;
        v49 = 2112;
        v50 = v26;
        v51 = 2112;
        v52 = v28;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Received notification target configuration service %@ of controller %@/%@ has been removed - treating as unconfiguration", buf, 0x2Au);

        v6 = v43;
      }

      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(v1 + 40), "_targetAccessoryUnconfiguredWithController:", v6);
    }
  }
  else
  {
    objc_msgSend(v5, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BDD6C60]);

    if (v30)
    {
      objc_msgSend(*(id *)(v1 + 40), "configuredControllers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "containsObject:", v6);

      if (v32)
      {
        v33 = (void *)MEMORY[0x227676638]();
        v34 = *(id *)(v1 + 40);
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "instanceID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "name");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "UUIDString");
          v44 = v6;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v46 = v36;
          v47 = 2112;
          v48 = v37;
          v49 = 2112;
          v50 = v38;
          v51 = 2112;
          v52 = v40;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Received notification target control service %@ of controller %@/%@ has been removed - treating as deselection", buf, 0x2Au);

          v6 = v44;
        }

        objc_autoreleasePoolPop(v33);
        objc_msgSend(*(id *)(v1 + 40), "_handleTargetControlServiceDeselection:", v5);
      }
    }
  }

}

void __46__HMDTargetControlManager___accessoryRemoved___block_invoke(uint64_t a1)
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
  id v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  NSObject *v44;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
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
    v63 = v9;
    v64 = 2112;
    v65 = v10;
    v66 = 2112;
    v67 = v12;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that an accessory %@/%@ has been removed from the home", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v13 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "configuredControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v15);

    if (v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v63 = v21;
        v64 = 2112;
        v65 = v22;
        v66 = 2112;
        v67 = v24;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller %@/%@ has been removed", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(*(id *)(a1 + 40), "_handleControllerDisconnected:", v15);
      objc_msgSend(*(id *)(a1 + 40), "_removeController:", v15);
      objc_msgSend(v15, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        v49 = (void *)MEMORY[0x227676638]();
        v50 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uuid");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "UUIDString");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v52;
          v64 = 2112;
          v65 = v53;
          v66 = 2112;
          v67 = v55;
          _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Removed controller %@/%@ is not configured with a home", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v49);
        goto LABEL_34;
      }
      objc_msgSend(v15, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = identifierForTargetWithUUID(v26, v27);

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "eventReceivers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v30)
      {
        v31 = v30;
        v56 = v25;
        v32 = 0;
        v33 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v58 != v33)
              objc_enumerationMutation(v29);
            v35 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            if (objc_msgSend(v35, "identifier") == v28)
            {
              v36 = v35;

              v32 = v36;
            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v31);

        v25 = v56;
        if (!v32)
          goto LABEL_34;
        objc_msgSend(*(id *)(a1 + 40), "eventReceivers");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "removeObject:", v32);

      }
      else
      {
        v32 = v29;
      }

LABEL_34:
    }
  }
  else
  {
    objc_msgSend(v13, "uuid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "targetAccessory");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "uuid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v38, "isEqual:", v40);

    if (v41)
    {
      v42 = (void *)MEMORY[0x227676638]();
      v43 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "UUIDString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v63 = v45;
        v64 = 2112;
        v65 = v46;
        v66 = 2112;
        v67 = v48;
        _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Received notification that this target accessory  %@/%@ has been removed - invalidating...", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v42);
      objc_msgSend(*(id *)(a1 + 40), "invalidate");
    }
  }

}

void __44__HMDTargetControlManager___accessoryAdded___block_invoke(uint64_t a1)
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
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDNotificationAddedAccessoryKey"));
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
    objc_msgSend(v5, "supportsTargetController");
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that an accessory %@/%@ (supportsTargetController %@) has been added to the home", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);

}

void __51__HMDTargetControlManager___accessoryDisconnected___block_invoke(uint64_t a1)
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
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
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
    v24 = 138543874;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Disconnected from accessory %@/%@", (uint8_t *)&v24, 0x20u);

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
    objc_msgSend(*(id *)(a1 + 40), "configuredControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v14);

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
        objc_msgSend(v12, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "targetAccessory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v20;
        v26 = 2112;
        v27 = v21;
        v28 = 2112;
        v29 = v23;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Disconnected from controller %@ for target accessory %@", (uint8_t *)&v24, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 40), "_handleControllerDisconnected:", v14);
    }
  }

}

void __48__HMDTargetControlManager___accessoryConnected___block_invoke(uint64_t a1)
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
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
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
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
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
    v25 = 138543874;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Connected to accessory %@/%@", (uint8_t *)&v25, 0x20u);

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
    objc_msgSend(*(id *)(a1 + 40), "configuredControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v14);

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
        objc_msgSend(v12, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "targetAccessory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = v20;
        v27 = 2112;
        v28 = v21;
        v29 = 2112;
        v30 = v23;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Connected to controller %@ for target accessory %@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 40), "__getOrCreateEventReceiver:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConnected:", 1);

    }
  }

}

void __50__HMDTargetControlManager___accessoryNameUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (!v4 || !objc_msgSend(v4, "supportsTargetController"))
    goto LABEL_18;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Attempting to process name update for a controller %@/%@ that is not configured with a home", (uint8_t *)&v29, 0x20u);

    }
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 40), "configuredControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v7 & 1) == 0)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "configuredControllers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138544130;
      v30 = v24;
      v31 = 2112;
      v32 = v25;
      v33 = 2112;
      v34 = v27;
      v35 = 2112;
      v36 = v28;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Controller %@/%@ that has updated its name not one of the configured controllers %@", (uint8_t *)&v29, 0x2Au);

    }
LABEL_17:
    objc_autoreleasePoolPop(v8);
    goto LABEL_18;
  }
  if (v11)
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received notification that the name of a controller %@/%@ has been updated", (uint8_t *)&v29, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 40), "__getOrCreateEventReceiver:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setName:", v17);

LABEL_18:
}

void __62__HMDTargetControlManager___controllerRefreshedConfiguration___block_invoke(uint64_t a1)
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
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
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
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v11;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification that a controller %@/%@ has refreshed its configuration - userInfo %@", (uint8_t *)&v25, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "configuredControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v4);

    if ((v14 & 1) != 0)
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_targetAccessoryRefreshConfigurationWithController:userInfo:", v4, v16);

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "configuredControllers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138544130;
        v26 = v20;
        v27 = 2112;
        v28 = v21;
        v29 = 2112;
        v30 = v23;
        v31 = 2112;
        v32 = v24;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Controller %@/%@ that has refreshed its configuration not one of the configured controllers %@", (uint8_t *)&v25, 0x2Au);

      }
      objc_autoreleasePoolPop(v17);
    }
  }

}

void __67__HMDTargetControlManager___targetAccessoryUnconfiguredForControl___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_arrayForKey:", CFSTR("HMDTargetAccessoriesUUIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification that target accessories %@ have been unconfigured for control by controller %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "targetAccessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "containsObject:", v13);

  if (v14)
  {
    v15 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
      objc_msgSend(*(id *)(a1 + 40), "_targetAccessoryUnconfiguredWithController:", v17);

  }
}

void __65__HMDTargetControlManager___targetAccessoryConfiguredForControl___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
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
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
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

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_arrayForKey:", CFSTR("HMDTargetAccessoriesUUIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 40);
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
    v24 = 138544130;
    v25 = v10;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification that target accessories %@ have been configured for control by controller %@/%@", (uint8_t *)&v24, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "targetAccessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v6, "containsObject:", v15);

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
        objc_msgSend(v4, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v20;
        v26 = 2112;
        v27 = v21;
        v28 = 2112;
        v29 = v23;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Received notification that this target has been configured for control by controller %@/%@", (uint8_t *)&v24, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 40), "_targetAccessoryConfiguredWithController:", v4);
    }
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_123566 != -1)
    dispatch_once(&logCategory__hmf_once_t4_123566, &__block_literal_global_123567);
  return (id)logCategory__hmf_once_v5_123568;
}

void __38__HMDTargetControlManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_123568;
  logCategory__hmf_once_v5_123568 = v0;

}

@end
