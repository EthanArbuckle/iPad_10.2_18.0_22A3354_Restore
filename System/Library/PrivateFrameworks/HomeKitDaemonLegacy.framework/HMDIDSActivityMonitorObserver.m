@implementation HMDIDSActivityMonitorObserver

- (HMDIDSActivityMonitorObserver)initWithActivityMonitor:(id)a3
{
  id v5;
  HMDIDSActivityMonitorObserver *v6;
  HMDIDSActivityMonitorObserver *v7;
  uint64_t v8;
  NSMutableDictionary *subactivityToDelegatesMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDIDSActivityMonitorObserver;
  v6 = -[HMDIDSActivityMonitorObserver init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityMonitor, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    subactivityToDelegatesMap = v7->_subactivityToDelegatesMap;
    v7->_subactivityToDelegatesMap = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)configureWithDataSource:(id)a3
{
  id v4;
  void *v5;
  HMDIDSActivityMonitorObserver *v6;
  SEL v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[HMDIDSActivityMonitorObserver dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[HMDIDSActivityMonitorObserver setDataSource:](self, "setDataSource:", v10);

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v6 = (HMDIDSActivityMonitorObserver *)_HMFPreconditionFailure();
  -[HMDIDSActivityMonitorObserver addObserver:forSubActivity:](v6, v7, v8, v9);
}

- (void)addObserver:(id)a3 forSubActivity:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  v7 = -[NSMutableDictionary count](self->_subactivityToDelegatesMap, "count");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_subactivityToDelegatesMap, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subactivityToDelegatesMap, "setObject:forKeyedSubscript:", v8, v6);
  }
  objc_msgSend(v8, "addObject:", v10);

  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    -[HMDIDSActivityMonitorObserver activityMonitor](self, "activityMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "listenWithDelegate:", self);

  }
}

- (void)removeObserver:(id)a3 forSubActivity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_subactivityToDelegatesMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "removeObject:", v9);
    if (!objc_msgSend(v8, "count"))
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subactivityToDelegatesMap, "setObject:forKeyedSubscript:", 0, v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)startObservingPresenceForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDIDSActivityMonitorObserver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDIDSActivityMonitorObserver dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@startObservingPresenceForDevice: called before configureWithDataSource:", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  -[HMDIDSActivityMonitorObserver dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startObservingDevice:subActivity:", v4, *MEMORY[0x1E0D33DB0]);

}

- (void)stopObservingPresenceForDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDIDSActivityMonitorObserver dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopObservingDevice:subActivity:", v4, *MEMORY[0x1E0D33DB0]);

}

- (void)activityMonitor:(id)a3 didReceiveActivityUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *subactivityToDelegatesMap;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDIDSActivityMonitorObserver *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  HMDIDSActivityMonitorObserver *v24;
  NSObject *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceForPushToken:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    os_unfair_lock_lock_with_options();
    subactivityToDelegatesMap = self->_subactivityToDelegatesMap;
    objc_msgSend(v7, "subActivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](subactivityToDelegatesMap, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v18;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying delegates of IDS Activity update: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v14;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v28;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22++), "observer:didUpdateDevice:isOnline:", v16, v10, objc_msgSend(v7, "isDeviceOnline", (_QWORD)v27));
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v26;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Received IDS Activity update for unkonwn device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDIDSActivityMonitorObserver activityMonitor](self, "activityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDIDSActivityMonitor)activityMonitor
{
  return (HMDIDSActivityMonitor *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)subactivityToDelegatesMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (HMDIDSActivityMonitorObserverRegistrationManager)dataSource
{
  return (HMDIDSActivityMonitorObserverRegistrationManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_subactivityToDelegatesMap, 0);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_132491 != -1)
    dispatch_once(&logCategory__hmf_once_t17_132491, &__block_literal_global_133);
  return (id)logCategory__hmf_once_v18_132492;
}

void __44__HMDIDSActivityMonitorObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18_132492;
  logCategory__hmf_once_v18_132492 = v0;

}

@end
