@implementation HMDBonjourBrowserHelper

- (HMDBonjourBrowserHelper)initWithServicesOfTypes:(id)a3 browsingTimeInterval:(double)a4 browsingPeriodicity:(double)a5 workQueue:(id)a6
{
  id v11;
  id v12;
  HMDBonjourBrowserHelper *v13;
  uint64_t v14;
  NSMutableDictionary *internalDiscoveredServices;
  uint64_t v16;
  NSMutableArray *browsers;
  uint64_t v18;
  NSMutableArray *browsingCompletions;
  HMDBonjourBrowserHelper *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (a4 > 0.0 && objc_msgSend(v11, "count"))
  {
    v25.receiver = self;
    v25.super_class = (Class)HMDBonjourBrowserHelper;
    v13 = -[HMDBonjourBrowserHelper init](&v25, sel_init);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = objc_claimAutoreleasedReturnValue();
      internalDiscoveredServices = v13->_internalDiscoveredServices;
      v13->_internalDiscoveredServices = (NSMutableDictionary *)v14;

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v16 = objc_claimAutoreleasedReturnValue();
      browsers = v13->_browsers;
      v13->_browsers = (NSMutableArray *)v16;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v18 = objc_claimAutoreleasedReturnValue();
      browsingCompletions = v13->_browsingCompletions;
      v13->_browsingCompletions = (NSMutableArray *)v18;

      objc_storeStrong((id *)&v13->_serviceTypes, a3);
      v13->_browsingInterval = a4;
      v13->_browsingPeriodicity = a5;
      objc_storeStrong((id *)&v13->_workQueue, a6);
      v13->_state = 0;
    }
    self = v13;
    v20 = self;
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Browsing interval or types count must be greater than 0", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (void)startWithBrowsingCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBonjourBrowserHelper workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HMDBonjourBrowserHelper_startWithBrowsingCompletion___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_startBrowsers
{
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *internalDiscoveredServices;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSArray *obj;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMDBonjourBrowserHelper workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock_with_options();
  if (self->_state == 1)
  {
    os_unfair_lock_unlock(&self->_lock);
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  internalDiscoveredServices = self->_internalDiscoveredServices;
  self->_internalDiscoveredServices = v4;

  self->_state = 1;
  v6 = self->_serviceTypes;
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
    return 0;
  -[HMDBonjourBrowserHelper browsingInterval](self, "browsingInterval");
  -[HMDBonjourBrowserHelper _updateTimerWithTimeout:](self, "_updateTimerWithTimeout:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28620]), "initWithDomain:serviceType:", CFSTR("local."), v11);
        objc_msgSend(v12, "setDelegate:", self);
        -[HMDBonjourBrowserHelper _addBrowser:](self, "_addBrowser:", v12);
        objc_initWeak(&location, self);
        v16[0] = v9;
        v16[1] = 3221225472;
        v16[2] = __41__HMDBonjourBrowserHelper__startBrowsers__block_invoke;
        v16[3] = &unk_1E89BCB20;
        objc_copyWeak(&v18, &location);
        v16[4] = v11;
        v13 = v12;
        v17 = v13;
        objc_msgSend(v13, "startBrowsingWithCompletionHandler:", v16);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);

        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return 1;
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDBonjourBrowserHelper workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HMDBonjourBrowserHelper_stop__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_stopBrowsers
{
  NSObject *v3;
  char v4;
  unint64_t v5;
  NSMutableDictionary *internalDiscoveredServices;
  NSDictionary *v7;
  NSDictionary *latestDiscoveredServices;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  HMDBonjourBrowserHelper *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[HMDBonjourBrowserHelper workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock_with_options();
  if (self->_state == 1 && self->_browsingPeriodicity > 0.0)
  {
    v4 = 1;
    v5 = 2;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  self->_state = v5;
  internalDiscoveredServices = self->_internalDiscoveredServices;
  if (internalDiscoveredServices)
  {
    v7 = (NSDictionary *)-[NSMutableDictionary copy](internalDiscoveredServices, "copy");
    latestDiscoveredServices = self->_latestDiscoveredServices;
    self->_latestDiscoveredServices = v7;

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = self->_internalDiscoveredServices;
  self->_internalDiscoveredServices = v9;

  v11 = (void *)-[NSMutableArray copy](self->_browsers, "copy");
  -[NSMutableArray removeAllObjects](self->_browsers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  if ((v4 & 1) != 0)
  {
    -[HMDBonjourBrowserHelper browsingPeriodicity](self, "browsingPeriodicity");
    v12 = (void *)MEMORY[0x1D17BA0A0](-[HMDBonjourBrowserHelper _updateTimerWithTimeout:](self, "_updateTimerWithTimeout:"));
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB37E8];
      -[HMDBonjourBrowserHelper browsingPeriodicity](v13, "browsingPeriodicity");
      objc_msgSend(v16, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v15;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Waiting to restart browsing after: %@ seconds", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v32;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21++), "stopBrowsing");
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v19);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDBonjourBrowserHelper browsingCompletions](self, "browsingCompletions", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v22);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v25++) + 16))();
      }
      while (v23 != v25);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v23);
  }

  -[HMDBonjourBrowserHelper browsingCompletions](self, "browsingCompletions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeAllObjects");

}

- (unint64_t)discoveredServicesCountForServiceType:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSDictionary *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = self->_latestDiscoveredServices;
  if (!v6)
  {
    if (-[NSMutableDictionary count](self->_internalDiscoveredServices, "count"))
      v6 = (NSDictionary *)-[NSMutableDictionary copy](self->_internalDiscoveredServices, "copy");
    else
      v6 = 0;
  }
  -[NSDictionary objectForKey:](v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)isStarted
{
  HMDBonjourBrowserHelper *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_addBrowser:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_browsers, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_removeBrowser:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_browsers, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_updateTimerWithTimeout:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDBonjourBrowserHelper workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBonjourBrowserHelper timer](self, "timer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDBonjourBrowserHelper timer](self, "timer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suspend");

    -[HMDBonjourBrowserHelper setTimer:](self, "setTimer:", 0);
  }
  if (a3 > 0.0)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, a3);
    objc_msgSend(v9, "setDelegate:", self);
    -[HMDBonjourBrowserHelper workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegateQueue:", v8);

    objc_msgSend(v9, "resume");
    -[HMDBonjourBrowserHelper setTimer:](self, "setTimer:", v9);

  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;

  v4 = a3;
  -[HMDBonjourBrowserHelper workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBonjourBrowserHelper timer](self, "timer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = -[HMDBonjourBrowserHelper state](self, "state");
    if (v7 == 2)
    {
      -[HMDBonjourBrowserHelper _startBrowsers](self, "_startBrowsers");
    }
    else if (v7 == 1)
    {
      -[HMDBonjourBrowserHelper _stopBrowsers](self, "_stopBrowsers");
    }
  }
}

- (void)netServiceBrowser:(id)a3 didAddService:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  NSMutableDictionary *internalDiscoveredServices;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      internalDiscoveredServices = self->_internalDiscoveredServices;
      objc_msgSend(v6, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](internalDiscoveredServices, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      objc_msgSend(v6, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      v17 = self->_internalDiscoveredServices;
      objc_msgSend(v6, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v15, v18);

    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  NSMutableDictionary *internalDiscoveredServices;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      internalDiscoveredServices = self->_internalDiscoveredServices;
      objc_msgSend(v6, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](internalDiscoveredServices, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      objc_msgSend(v6, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObject:", v16);

      v17 = self->_internalDiscoveredServices;
      objc_msgSend(v6, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v15, v18);

    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDBonjourBrowserHelper *v9;
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
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "serviceType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedInteger:", -[HMDBonjourBrowserHelper discoveredServicesCountForServiceType:](v9, "discoveredServicesCountForServiceType:", v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopped browsing for services of type: %@ with error: %@. Found %@ servcies.", (uint8_t *)&v16, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (double)browsingInterval
{
  return self->_browsingInterval;
}

- (void)setBrowsingInterval:(double)a3
{
  self->_browsingInterval = a3;
}

- (double)browsingPeriodicity
{
  return self->_browsingPeriodicity;
}

- (void)setBrowsingPeriodicity:(double)a3
{
  self->_browsingPeriodicity = a3;
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_serviceTypes, a3);
}

- (NSMutableArray)browsers
{
  return self->_browsers;
}

- (void)setBrowsers:(id)a3
{
  objc_storeStrong((id *)&self->_browsers, a3);
}

- (NSDictionary)latestDiscoveredServices
{
  return self->_latestDiscoveredServices;
}

- (void)setLatestDiscoveredServices:(id)a3
{
  objc_storeStrong((id *)&self->_latestDiscoveredServices, a3);
}

- (NSMutableDictionary)internalDiscoveredServices
{
  return self->_internalDiscoveredServices;
}

- (void)setInternalDiscoveredServices:(id)a3
{
  objc_storeStrong((id *)&self->_internalDiscoveredServices, a3);
}

- (NSMutableArray)browsingCompletions
{
  return self->_browsingCompletions;
}

- (void)setBrowsingCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_browsingCompletions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsingCompletions, 0);
  objc_storeStrong((id *)&self->_internalDiscoveredServices, 0);
  objc_storeStrong((id *)&self->_latestDiscoveredServices, 0);
  objc_storeStrong((id *)&self->_browsers, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

uint64_t __31__HMDBonjourBrowserHelper_stop__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_stopBrowsers");
    objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_updateTimerWithTimeout:", 0.0);
  }
  return result;
}

void __41__HMDBonjourBrowserHelper__startBrowsers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "browsingInterval");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting browsing for services of type: %@ with error: %@ for %@ seconds", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  if (v3)
    objc_msgSend(v6, "_removeBrowser:", *(_QWORD *)(a1 + 40));

}

void __55__HMDBonjourBrowserHelper_startWithBrowsingCompletion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isStarted") & 1) != 0)
  {
    if (!*(_QWORD *)(a1 + 40))
      return;
    goto LABEL_6;
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "_startBrowsers");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v3 + 16))(v3);
      goto LABEL_9;
    }
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "browsingCompletions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v5, "addObject:", v4);

LABEL_9:
  }
}

@end
