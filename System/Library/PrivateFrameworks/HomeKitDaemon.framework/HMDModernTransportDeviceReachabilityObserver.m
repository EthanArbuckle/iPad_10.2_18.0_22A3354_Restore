@implementation HMDModernTransportDeviceReachabilityObserver

- (HMDModernTransportDeviceReachabilityObserver)init
{
  void *v3;
  HMDDate *v4;
  HMDModernTransportDeviceReachabilityObserver *v5;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc_init(HMDDate);
  v5 = -[HMDModernTransportDeviceReachabilityObserver initWithTimerProvider:dateProvider:](self, "initWithTimerProvider:dateProvider:", v3, v4);

  return v5;
}

- (HMDModernTransportDeviceReachabilityObserver)initWithTimerProvider:(id)a3 dateProvider:(id)a4
{
  id v7;
  id v8;
  HMDModernTransportDeviceReachabilityObserver *v9;
  uint64_t v10;
  NSMapTable *deviceToListenersMap;
  uint64_t v12;
  NSMutableArray *devicesWithPendingUnreachability;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDModernTransportDeviceReachabilityObserver;
  v9 = -[HMDModernTransportDeviceReachabilityObserver init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    deviceToListenersMap = v9->_deviceToListenersMap;
    v9->_deviceToListenersMap = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    devicesWithPendingUnreachability = v9->_devicesWithPendingUnreachability;
    v9->_devicesWithPendingUnreachability = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_timerProvider, a3);
    objc_storeStrong((id *)&v9->_dateProvider, a4);
  }

  return v9;
}

- (void)addListener:(id)a3 forDeviceAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDModernTransportDeviceReachabilityObserver *v9;
  NSObject *v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  NSMapTable *deviceToListenersMap;
  NSMapTable *v14;
  void *v15;
  HMDModernTransportDeviceReachabilityObserverListenerContext *v16;
  NSMapTable *v17;
  NSMapTable *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
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
    v21 = 138543874;
    v22 = v11;
    v23 = 2048;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding listener %p for address: %@", (uint8_t *)&v21, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  if (v9)
    deviceToListenersMap = v9->_deviceToListenersMap;
  else
    deviceToListenersMap = 0;
  v14 = deviceToListenersMap;
  objc_msgSend(v7, "idsIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v14, "objectForKey:", v15);
  v16 = (HMDModernTransportDeviceReachabilityObserverListenerContext *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v16 = -[HMDModernTransportDeviceReachabilityObserverListenerContext initWithAddress:]([HMDModernTransportDeviceReachabilityObserverListenerContext alloc], "initWithAddress:", v7);
    if (v9)
      v17 = v9->_deviceToListenersMap;
    else
      v17 = 0;
    v18 = v17;
    objc_msgSend(v7, "idsIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v18, "setObject:forKey:", v16, v19);

  }
  -[HMDModernTransportDeviceReachabilityObserverListenerContext listeners](v16, "listeners");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeListener:(id)a3 forDeviceAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDModernTransportDeviceReachabilityObserver *v9;
  NSObject *v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  NSMapTable *deviceToListenersMap;
  NSMapTable *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSMapTable *v20;
  NSMapTable *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
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
    v23 = 138543874;
    v24 = v11;
    v25 = 2048;
    v26 = v6;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing listener %p for address: %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  if (v9)
    deviceToListenersMap = v9->_deviceToListenersMap;
  else
    deviceToListenersMap = 0;
  v14 = deviceToListenersMap;
  objc_msgSend(v7, "idsIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "listeners");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObject:", v6);

    objc_msgSend(v16, "listeners");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") == 0;

    if (v19)
    {
      -[HMDModernTransportDeviceReachabilityObserver _clearUnreachablePendingForContext:](v9, "_clearUnreachablePendingForContext:", v16);
      if (v9)
        v20 = v9->_deviceToListenersMap;
      else
        v20 = 0;
      v21 = v20;
      objc_msgSend(v7, "idsIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](v21, "removeObjectForKey:", v22);

    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)isDeviceAddressReachable:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMapTable *deviceToListenersMap;
  NSMapTable *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    deviceToListenersMap = self->_deviceToListenersMap;
  else
    deviceToListenersMap = 0;
  v7 = deviceToListenersMap;
  objc_msgSend(v4, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "reachability");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)_evaluateDebounceTimer
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self || !self->_debounceTimer)
  {
    -[NSMutableArray firstObject](self->_devicesWithPendingUnreachability, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HMDDateProvider timeIntervalSince1970](self->_dateProvider, "timeIntervalSince1970");
      v4 = v3;
      objc_msgSend(v8, "unreachableStartTime");
      v6 = v5 + 20.0 - v4;
      if (v6 <= 0.01)
        v6 = 0.01;
      -[HMDTimerProvider timerWithTimeInterval:options:](self->_timerProvider, "timerWithTimeInterval:options:", 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_debounceTimer, v7);

      -[HMFTimer setDelegate:](self->_debounceTimer, "setDelegate:", self);
      -[HMFTimer resume](self->_debounceTimer, "resume");
    }

  }
}

- (void)_setUnreachablePendingForContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDModernTransportDeviceReachabilityObserver *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((-[NSMutableArray containsObject:](self->_devicesWithPendingUnreachability, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(v4, "reachability");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = (void *)v5,
          objc_msgSend(v4, "reachability"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "BOOLValue"),
          v7,
          v6,
          v8))
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "address");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Device address %@ reported unreachable.  Debouncing reachability", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDDateProvider timeIntervalSince1970](v10->_dateProvider, "timeIntervalSince1970");
      objc_msgSend(v4, "setUnreachableStartTime:");
      -[NSMutableArray addObject:](self->_devicesWithPendingUnreachability, "addObject:", v4);
      -[HMDModernTransportDeviceReachabilityObserver _evaluateDebounceTimer](v10, "_evaluateDebounceTimer");
    }
  }

}

- (void)_clearUnreachablePendingForContext:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *devicesWithPendingUnreachability;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_assert_owner(p_lock);
  objc_msgSend(v6, "setUnreachableStartTime:", 0.0);
  if (self)
    devicesWithPendingUnreachability = self->_devicesWithPendingUnreachability;
  else
    devicesWithPendingUnreachability = 0;
  -[NSMutableArray removeObject:](devicesWithPendingUnreachability, "removeObject:", v6);

}

- (void)transport:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  HMDModernTransportDeviceReachabilityObserver *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  NSMapTable *deviceToListenersMap;
  NSMapTable *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  _BYTE v24[22];
  __int16 v25;
  id v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("unreachable");
    *(_DWORD *)v24 = 138543874;
    *(_QWORD *)&v24[4] = v13;
    *(_WORD *)&v24[12] = 2112;
    if (v5)
      v14 = CFSTR("reachable");
    *(_QWORD *)&v24[14] = v14;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Device with idsIdentifier reporting %@: %@ ", v24, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  os_unfair_lock_lock_with_options();
  if (v11)
    deviceToListenersMap = v11->_deviceToListenersMap;
  else
    deviceToListenersMap = 0;
  v16 = deviceToListenersMap;
  -[NSMapTable objectForKey:](v16, "objectForKey:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_13;
  if (!v5)
  {
    -[HMDModernTransportDeviceReachabilityObserver _setUnreachablePendingForContext:](v11, "_setUnreachablePendingForContext:", v17);
LABEL_13:

    os_unfair_lock_unlock(&v11->_lock);
    goto LABEL_14;
  }
  -[HMDModernTransportDeviceReachabilityObserver _clearUnreachablePendingForContext:](v11, "_clearUnreachablePendingForContext:", v17);
  objc_msgSend(v17, "reachability");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v17, "reachability");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if ((v20 & 1) != 0)
      goto LABEL_13;
  }
  objc_msgSend(v17, "setReachability:", MEMORY[0x24BDBD1C8], *(_OWORD *)v24);
  objc_msgSend(v17, "address");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "listeners");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v11->_lock);
  -[HMDModernTransportDeviceReachabilityObserver _notifyListeners:address:isReachable:](v11, "_notifyListeners:address:isReachable:", v23, v21, 1);

LABEL_14:
}

- (void)_notifyListeners:(id)a3 address:(id)a4 isReachable:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  HMDModernTransportDeviceReachabilityObserver *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("unreachable");
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      v29 = 2112;
      if (v5)
        v15 = CFSTR("reachable");
      v30 = v15;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying listeners that device address is %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "modernTransportDeviceReachabilityObserverDidUpdate:isReachable:", v9, v5, (_QWORD)v22);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v21;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot notify listeners for reachability change with nil address", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)_serviceExpiredUnreachableDevices
{
  void *v3;
  NSMutableArray *devicesWithPendingUnreachability;
  NSMutableArray *v5;
  void *v6;
  HMDDateProvider *dateProvider;
  HMDDateProvider *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  HMDModernTransportDeviceReachabilityObserver *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSMapTable *deviceToListenersMap;
  NSMapTable *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  NSMutableArray *v30;
  uint64_t v31;
  _QWORD v32[5];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMDModernTransportDeviceReachabilityObserver setDebounceTimer:]((uint64_t)self, 0);
  if (self)
    devicesWithPendingUnreachability = self->_devicesWithPendingUnreachability;
  else
    devicesWithPendingUnreachability = 0;
  v5 = devicesWithPendingUnreachability;
  -[NSMutableArray firstObject](v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    dateProvider = self->_dateProvider;
  else
    dateProvider = 0;
  v8 = dateProvider;
  -[HMDDateProvider timeIntervalSince1970](v8, "timeIntervalSince1970");
  v10 = v9;

  if (v6)
  {
    v11 = MEMORY[0x24BDBD1C0];
    do
    {
      v12 = objc_msgSend(v6, "unreachableStartTime");
      if (v13 + 20.0 - v10 > 0.01)
        break;
      v14 = (void *)MEMORY[0x227676638](v12);
      v15 = self;
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "address");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v17;
        v35 = 2112;
        v36 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Unreachable Debounce timer did fire for device address %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      if (self)
        v19 = v15->_devicesWithPendingUnreachability;
      else
        v19 = 0;
      v20 = v19;
      -[NSMutableArray removeObjectAtIndex:](v20, "removeObjectAtIndex:", 0);

      objc_msgSend(v6, "setReachability:", v11);
      if (self)
        deviceToListenersMap = v15->_deviceToListenersMap;
      else
        deviceToListenersMap = 0;
      v22 = deviceToListenersMap;
      objc_msgSend(v6, "address");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "idsIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](v22, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v6, "listeners");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "address");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v27, v28);

      }
      v29 = self ? v15->_devicesWithPendingUnreachability : 0;
      v30 = v29;
      -[NSMutableArray firstObject](v30, "firstObject");
      v31 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v31;
    }
    while (v31);
  }
  -[HMDModernTransportDeviceReachabilityObserver _evaluateDebounceTimer](self, "_evaluateDebounceTimer");

  os_unfair_lock_unlock(&self->_lock);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __81__HMDModernTransportDeviceReachabilityObserver__serviceExpiredUnreachableDevices__block_invoke;
  v32[3] = &unk_24E774FC0;
  v32[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v32);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_devicesWithPendingUnreachability, 0);
  objc_storeStrong((id *)&self->_deviceToListenersMap, 0);
}

- (void)setDebounceTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

uint64_t __81__HMDModernTransportDeviceReachabilityObserver__serviceExpiredUnreachableDevices__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyListeners:address:isReachable:", a3, a2, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12 != -1)
    dispatch_once(&logCategory__hmf_once_t12, &__block_literal_global_8317);
  return (id)logCategory__hmf_once_v13;
}

void __59__HMDModernTransportDeviceReachabilityObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13;
  logCategory__hmf_once_v13 = v0;

}

@end
