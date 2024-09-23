@implementation IRProximityProvider

- (IRProximityProvider)init
{
  IRProximityProvider *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IRCMPDRFenceBridge *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IRProximityProvider;
  v2 = -[IRProximityProvider init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRProximityProvider setObservers:](v2, "setObservers:", v3);

    v4 = (void *)objc_opt_new();
    -[IRProximityProvider setCachedNearbyDevices:](v2, "setCachedNearbyDevices:", v4);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.intelligentroutingd.proximityprovider", v5);
    -[IRProximityProvider setQueue:](v2, "setQueue:", v6);

    v7 = (void *)objc_opt_new();
    -[IRProximityProvider setRetryCountPerProximityType:](v2, "setRetryCountPerProximityType:", v7);

    -[IRProximityProvider retryCountPerProximityType](v2, "retryCountPerProximityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_25105EBA0, CFSTR("NIHomeDevice"));

    -[IRProximityProvider retryCountPerProximityType](v2, "retryCountPerProximityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_25105EBA0, CFSTR("NIDevicePresence"));

    -[IRProximityProvider retryCountPerProximityType](v2, "retryCountPerProximityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_25105EBA0, CFSTR("ProxControl"));

    v11 = (void *)objc_opt_new();
    -[IRProximityProvider setProximityBridges:](v2, "setProximityBridges:", v11);

    v12 = -[IRCMPDRFenceBridge initWithFenceIdentifier:]([IRCMPDRFenceBridge alloc], "initWithFenceIdentifier:", CFSTR("uwb.suspend"));
    -[IRProximityProvider setUwbFenceBridge:](v2, "setUwbFenceBridge:", v12);

  }
  return v2;
}

- (void)_filterDevicesWithNearbyDevice:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[IRProximityProvider queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v13, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v13, "idsIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("invalid-no-match");
  }
  objc_msgSend(v13, "mediaRemoteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v13, "mediaRemoteIdentifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("invalid-no-match");
  }
  objc_msgSend(v13, "proximityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("NOT ((%K = %@ OR %K = %@)AND %K = %@)"), CFSTR("idsIdentifier"), v7, CFSTR("mediaRemoteIdentifier"), v9, CFSTR("proximityType"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  if (v6)

  -[IRProximityProvider cachedNearbyDevices](self, "cachedNearbyDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filterUsingPredicate:", v11);

}

- (void)_setupNIDevicePresenceBridgeIfNeeded
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_ERROR, "#proximity-provider, [ErrorId - NI presence config error] NIConfiguration error while setting up NI presence: %@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

- (void)_setupNIHomeDeviceObserverBridgeIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  IRNearbyInteractionBridge *v9;
  id v10;
  IRNearbyInteractionBridge *v11;
  void *v12;
  id location;
  uint8_t buf[16];

  -[IRProximityProvider proximityBridges](self, "proximityBridges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NIHomeDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_INFO, "#proximity-provider, Starting NI home device observer session", buf, 2u);
    }
    v6 = objc_alloc(MEMORY[0x24BDDFE18]);
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_msgSend(v6, "initWithRegions:", v7);

    objc_msgSend(v8, "setAllowedDevices:", 2);
    objc_msgSend(v8, "setAnchor:", 1);
    objc_initWeak(&location, self);
    v9 = [IRNearbyInteractionBridge alloc];
    v10 = objc_loadWeakRetained(&location);
    v11 = -[IRNearbyInteractionBridge initWithDelegate:NIConfiguration:observer:name:](v9, "initWithDelegate:NIConfiguration:observer:name:", v10, v8, 1, CFSTR("NIHomeDevice"));

    -[IRNearbyInteractionBridge setTrackUpdates:](v11, "setTrackUpdates:", 1);
    -[IRProximityProvider proximityBridges](self, "proximityBridges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("NIHomeDevice"));

    objc_destroyWeak(&location);
  }
}

- (void)_setupProxControlSessionIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  IRProxcontrolBridge *v6;
  id v7;
  IRProxcontrolBridge *v8;
  void *v9;
  id location;
  uint8_t buf[16];

  -[IRProximityProvider proximityBridges](self, "proximityBridges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ProxControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_INFO, "#proximity-provider, Starting prox control session", buf, 2u);
    }
    objc_initWeak(&location, self);
    v6 = [IRProxcontrolBridge alloc];
    v7 = objc_loadWeakRetained(&location);
    v8 = -[IRProxcontrolBridge initWithDelegate:name:](v6, "initWithDelegate:name:", v7, CFSTR("ProxControl"));
    -[IRProximityProvider proximityBridges](self, "proximityBridges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("ProxControl"));

    objc_destroyWeak(&location);
  }
}

- (void)_invalidateBridge:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IRProximityProvider proximityBridges](self, "proximityBridges");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "invalidate");
}

- (void)_setupAndRunBridge:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("NIDevicePresence")))
  {
    -[IRProximityProvider _setupNIDevicePresenceBridgeIfNeeded](self, "_setupNIDevicePresenceBridgeIfNeeded");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("NIHomeDevice")))
  {
    -[IRProximityProvider _setupNIHomeDeviceObserverBridgeIfNeeded](self, "_setupNIHomeDeviceObserverBridgeIfNeeded");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ProxControl")))
  {
    -[IRProximityProvider _setupProxControlSessionIfNeeded](self, "_setupProxControlSessionIfNeeded");
  }
  -[IRProximityProvider proximityBridges](self, "proximityBridges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "run");

}

- (void)_invalidateAndNullifyAllBridges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_proximityBridges, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[IRProximityProvider proximityBridges](self, "proximityBridges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)_setupAndRunAllBridges
{
  -[IRProximityProvider _setupAndRunBridge:](self, "_setupAndRunBridge:", CFSTR("NIDevicePresence"));
  -[IRProximityProvider _setupAndRunBridge:](self, "_setupAndRunBridge:", CFSTR("NIHomeDevice"));
  -[IRProximityProvider _setupAndRunBridge:](self, "_setupAndRunBridge:", CFSTR("ProxControl"));
}

- (void)_resetRetryCount:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IRProximityProvider retryCountPerProximityType](self, "retryCountPerProximityType");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_25105EBA0, v4);

}

- (void)_incrementRetryCount:(id)a3
{
  void *v4;
  NSMutableDictionary *retryCountPerProximityType;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  retryCountPerProximityType = self->_retryCountPerProximityType;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](retryCountPerProximityType, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRProximityProvider retryCountPerProximityType](self, "retryCountPerProximityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)_removeAllDevicesForProximityType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IRProximityProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K = %@)"), CFSTR("proximityType"), v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[IRProximityProvider cachedNearbyDevices](self, "cachedNearbyDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterUsingPredicate:", v9);

  -[IRProximityProvider observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRProximityProvider cachedNearbyDevices](self, "cachedNearbyDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRProximityProvider _updateObservers:withDevices:andProvider:](self, "_updateObservers:withDevices:andProvider:", v7, v8, self);

}

- (void)_removeAllUwbDevicesAndClearFence
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[IRProximityProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRProximityProvider setFreezeDateNIHomeDevice:](self, "setFreezeDateNIHomeDevice:", 0);
  -[IRProximityProvider _removeAllDevicesForProximityType:](self, "_removeAllDevicesForProximityType:", CFSTR("NIHomeDevice"));
  -[IRProximityProvider _removeAllDevicesForProximityType:](self, "_removeAllDevicesForProximityType:", CFSTR("ProxControl"));
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Removing All Uwb Devices", v6, 2u);
  }
  -[IRProximityProvider uwbFenceBridge](self, "uwbFenceBridge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearFence");

}

- (void)_inspectNearbyDevicesAndSetPedestrianFenceSessionState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRProximityProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[IRProximityProvider _isPdedestrianFenceAvailable](self, "_isPdedestrianFenceAvailable"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "proximityType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = +[IRProximityProvider isUWBProximityType:](IRProximityProvider, "isUWBProximityType:", v10);

          if (v11)
          {
            LODWORD(v7) = 1;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    v12 = -[IRProximityProvider isUwbFenceSessionStarted](self, "isUwbFenceSessionStarted");
    if ((v7 & 1) == 0 && v12)
    {
      -[IRProximityProvider uwbFenceBridge](self, "uwbFenceBridge");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endSession");

      -[IRProximityProvider setIsUwbFenceSessionStarted:](self, "setIsUwbFenceSessionStarted:", 0);
      v14 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Ending fence session", v17, 2u);
      }
    }
    if (!-[IRProximityProvider isUwbFenceSessionStarted](self, "isUwbFenceSessionStarted")
      && ((v7 ^ 1) & 1) == 0)
    {
      -[IRProximityProvider uwbFenceBridge](self, "uwbFenceBridge");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "startSession");

      -[IRProximityProvider setIsUwbFenceSessionStarted:](self, "setIsUwbFenceSessionStarted:", 1);
      v16 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_23FFBA000, v16, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Starting fence session", v17, 2u);
      }
    }
  }

}

- (BOOL)_isPdedestrianFenceAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  +[IRPreferences shared](IRPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uwbSuspendPedestrianFenceEnable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = +[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable");
  else
    v4 = 0;

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  IRProximityProvider *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__IRProximityProvider_addObserver___block_invoke;
  v7[3] = &unk_2510442C0;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__IRProximityProvider_addObserver___block_invoke(id *a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  IRNearbyDeviceContainerDO *v8;
  void *v9;
  void *v10;
  void *v11;
  IRNearbyDeviceContainerDO *v12;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained + 5;
    if ((objc_msgSend(WeakRetained[5], "containsObject:", a1[4]) & 1) == 0)
    {
      v5 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
        __35__IRProximityProvider_addObserver___block_invoke_cold_1((uint64_t)(v3 + 5), v5);
      objc_msgSend(*v4, "addObject:", a1[4]);
      objc_msgSend(*v4, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 == 1)
        objc_msgSend(v3, "_setupAndRunAllBridges");
      v8 = [IRNearbyDeviceContainerDO alloc];
      objc_msgSend(a1[5], "freezeDateNIHomeDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");
      v11 = (void *)objc_msgSend(v3[4], "copy");
      v12 = -[IRNearbyDeviceContainerDO initWithFreezeDateNIHomeDevice:nearbyDevices:](v8, "initWithFreezeDateNIHomeDevice:nearbyDevices:", v10, v11);

      objc_msgSend(a1[4], "provider:didUpdateNearbyDevices:", a1[5], v12);
    }
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  IRProximityProvider *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__IRProximityProvider_removeObserver___block_invoke;
  v7[3] = &unk_2510442C0;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__IRProximityProvider_removeObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained + 5;
    if (objc_msgSend(WeakRetained[5], "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", *(_QWORD *)(a1 + 32));
      v5 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
        __38__IRProximityProvider_removeObserver___block_invoke_cold_1((uint64_t)(v3 + 5), v5);
      objc_msgSend(*v4, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (!v7)
        objc_msgSend(v3, "_invalidateAndNullifyAllBridges");
    }
  }

}

- (void)_updateObservers:(id)a3 withDevices:(id)a4 andProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  IRNearbyDeviceContainerDO *v11;
  void *v12;
  void *v13;
  void *v14;
  IRNearbyDeviceContainerDO *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IRProximityProvider _inspectNearbyDevicesAndSetPedestrianFenceSessionState:](self, "_inspectNearbyDevicesAndSetPedestrianFenceSessionState:", v9);
  v11 = [IRNearbyDeviceContainerDO alloc];
  -[IRProximityProvider freezeDateNIHomeDevice](self, "freezeDateNIHomeDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  v14 = (void *)objc_msgSend(v9, "copy");
  v15 = -[IRNearbyDeviceContainerDO initWithFreezeDateNIHomeDevice:nearbyDevices:](v11, "initWithFreezeDateNIHomeDevice:nearbyDevices:", v13, v14);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "provider:didUpdateNearbyDevices:", v10, v15, (_QWORD)v21);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }

}

- (void)didUpdateNearbyDevice:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *queue;
  _QWORD block[4];
  id v12;
  id v13;
  IRProximityProvider *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "mediaRemoteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_4:
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__IRProximityProvider_didUpdateNearbyDevice_withName___block_invoke;
    block[3] = &unk_2510442E8;
    objc_copyWeak(&v15, &location);
    v12 = v7;
    v13 = v6;
    v14 = self;
    dispatch_async(queue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    goto LABEL_5;
  }
  objc_msgSend(v6, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_4;
LABEL_5:

}

void __54__IRProximityProvider_didUpdateNearbyDevice_withName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_resetRetryCount:", *(_QWORD *)(a1 + 32));
    v4 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      __54__IRProximityProvider_didUpdateNearbyDevice_withName___block_invoke_cold_1(a1, v4, v5);
    objc_msgSend(v3, "_filterDevicesWithNearbyDevice:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "cachedNearbyDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

    v7 = *(void **)(a1 + 48);
    objc_msgSend(v3, "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedNearbyDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateObservers:withDevices:andProvider:", v8, v9, v3);

  }
}

- (void)didBridgeRunSuccesfully:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__IRProximityProvider_didBridgeRunSuccesfully___block_invoke;
  block[3] = &unk_251044310;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

void __47__IRProximityProvider_didBridgeRunSuccesfully___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_23FFBA000, v2, OS_LOG_TYPE_INFO, "#proximity-provider, Bridge RunSuccesfully: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didBridgeFail:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__IRProximityProvider_didBridgeFail___block_invoke;
  block[3] = &unk_251044338;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__IRProximityProvider_didBridgeFail___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_INFO, "#proximity-provider, Bridge failed: %@", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(WeakRetained, "_incrementRetryCount:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "_invalidateBridge:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "_removeAllDevicesForProximityType:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained[7], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRPreferences shared](IRPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proximitySessionRetryCountThreshold");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isLessThanOrEqualTo:", v7);

    if (v8)
      objc_msgSend(WeakRetained, "_setupAndRunBridge:", *(_QWORD *)(a1 + 32));
  }

}

- (void)didInvalidateAllDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IRProximityProvider queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__IRProximityProvider_didInvalidateAllDevices___block_invoke;
  v7[3] = &unk_251044360;
  v8 = v4;
  v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);

}

uint64_t __47__IRProximityProvider_didInvalidateAllDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_removeAllDevicesForProximityType:", *(_QWORD *)(a1 + 32));
}

- (void)didRemoveDevice:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_4:
    -[IRProximityProvider queue](self, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __48__IRProximityProvider_didRemoveDevice_withName___block_invoke;
    v11[3] = &unk_251044388;
    v12 = v7;
    v13 = v6;
    IRDispatchAsyncWithStrongSelf(v10, self, v11);

    goto LABEL_5;
  }
  objc_msgSend(v6, "mediaRemoteIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_4;
LABEL_5:

}

void __48__IRProximityProvider_didRemoveDevice_withName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "freezeDateNIHomeDevice");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        v6 = +[IRProximityProvider isUWBProximityType:](IRProximityProvider, "isUWBProximityType:", *(_QWORD *)(a1 + 32)), v5, v6))
  {
    v7 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Bridge %@ removed device %@, device frozen since fence active", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v3, "_filterDevicesWithNearbyDevice:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedNearbyDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateObservers:withDevices:andProvider:", v10, v11, v3);

    v12 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      __48__IRProximityProvider_didRemoveDevice_withName___block_invoke_cold_1((uint64_t)v3, v12, v13);
  }

}

- (void)didBridgeSuspendStartedWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  IRProximityProvider *v9;

  v4 = a3;
  -[IRProximityProvider queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke;
  v7[3] = &unk_251044388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);

}

void __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", CFSTR("NIHomeDevice"))
    && objc_msgSend(v3, "_isPdedestrianFenceAvailable")
    && (objc_msgSend(v3, "isUwbFenceSessionStarted") & 1) != 0)
  {
    objc_msgSend(v3, "uwbFenceBridge");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearFence");

    +[IRPreferences shared](IRPreferences, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uwbSuspendPedestrianFenceRadiusMeters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    v9 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = v9;
      LODWORD(v13) = v8;
      objc_msgSend(v11, "numberWithFloat:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_23FFBA000, v12, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Setting PDR Fence for bridge %@, with radius:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFreezeDateNIHomeDevice:", v15);

    objc_initWeak((id *)buf, v3);
    objc_msgSend(v3, "uwbFenceBridge");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke_42;
    v27[3] = &unk_251043FF8;
    objc_copyWeak(&v28, (id *)buf);
    LODWORD(v17) = v8;
    objc_msgSend(v16, "setFence:withCompletion:", v27, v17);

    v18 = *(void **)(a1 + 40);
    objc_msgSend(v3, "observers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedNearbyDevices");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_updateObservers:withDevices:andProvider:", v19, v20, v3);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(v3, "_removeAllDevicesForProximityType:", *(_QWORD *)(a1 + 32));
    v21 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = (void *)MEMORY[0x24BDD16E0];
      v24 = v21;
      objc_msgSend(v23, "numberWithBool:", objc_msgSend(v3, "isUwbFenceSessionStarted"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v22;
      v31 = 2112;
      v32 = v25;
      v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_23FFBA000, v24, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Bridge suspended without setting fence, name:%@, isFenceSessionStarted:%@, isFenceAvailable:%@", buf, 0x20u);

    }
  }

}

void __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke_42(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23FFBA000, v2, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Fence completion called", v6, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IRDispatchAsyncWithStrongSelf(v5, v4, &__block_literal_global_6);

  }
}

uint64_t __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke_43(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_removeAllUwbDevicesAndClearFence");
}

- (void)didBridgeSuspendEndedWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  IRProximityProvider *v9;

  v4 = a3;
  -[IRProximityProvider queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__IRProximityProvider_didBridgeSuspendEndedWithName___block_invoke;
  v7[3] = &unk_251044388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);

}

void __53__IRProximityProvider_didBridgeSuspendEndedWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_INFO, "#proximity-provider, Bridge session suspend ended: %@", (uint8_t *)&v8, 0xCu);
  }
  if (+[IRProximityProvider isUWBProximityType:](IRProximityProvider, "isUWBProximityType:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "_removeAllUwbDevicesAndClearFence");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("NIDevicePresence")))
  {
    objc_msgSend(*(id *)(a1 + 40), "proximityBridges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "run");

  }
}

+ (BOOL)isUWBProximityType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("ProxControl")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqual:", CFSTR("NIHomeDevice"));

  return v4;
}

+ (BOOL)isBLEProximityType:(id)a3
{
  return objc_msgSend(a3, "isEqual:", CFSTR("NIDevicePresence"));
}

+ (BOOL)didContainer:(id)a3 changeWithUpdatetContainer:(id)a4 andRangeThreshold:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  double v26;
  _QWORD v27[4];
  id v28;
  id v29;
  double v30;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nearbyDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __81__IRProximityProvider_didContainer_changeWithUpdatetContainer_andRangeThreshold___block_invoke;
  v27[3] = &unk_2510443F0;
  v28 = v9;
  v30 = a5;
  v14 = v11;
  v29 = v14;
  v15 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v27);

  objc_msgSend(v8, "nearbyDevices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v13;
  v21 = 3221225472;
  v22 = __81__IRProximityProvider_didContainer_changeWithUpdatetContainer_andRangeThreshold___block_invoke_2;
  v23 = &unk_2510443F0;
  v26 = a5;
  v24 = v10;
  v25 = v14;
  v17 = v14;
  v18 = v10;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v20);

  LODWORD(v14) = objc_msgSend(v15, "isEqualToSet:", v18, v20, v21, v22, v23) ^ 1;
  return (char)v14;
}

void __81__IRProximityProvider_didContainer_changeWithUpdatetContainer_andRangeThreshold___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "range");
  v7 = (id)objc_msgSend(v4, "copyWithReplacementRange:", dbl_240033FE0[v5 < *(double *)(a1 + 48)]);

  v6 = (void *)objc_msgSend(v7, "copyWithReplacementMeasurementDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v6);

}

void __81__IRProximityProvider_didContainer_changeWithUpdatetContainer_andRangeThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "range");
  v7 = (id)objc_msgSend(v4, "copyWithReplacementRange:", dbl_240033FE0[v5 < *(double *)(a1 + 48)]);

  v6 = (void *)objc_msgSend(v7, "copyWithReplacementMeasurementDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v6);

}

- (NSMutableDictionary)proximityBridges
{
  return self->_proximityBridges;
}

- (void)setProximityBridges:(id)a3
{
  objc_storeStrong((id *)&self->_proximityBridges, a3);
}

- (IRCMPDRFenceBridge)uwbFenceBridge
{
  return self->_uwbFenceBridge;
}

- (void)setUwbFenceBridge:(id)a3
{
  objc_storeStrong((id *)&self->_uwbFenceBridge, a3);
}

- (NSMutableSet)cachedNearbyDevices
{
  return self->_cachedNearbyDevices;
}

- (void)setCachedNearbyDevices:(id)a3
{
  objc_storeStrong((id *)&self->_cachedNearbyDevices, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)retryCountPerProximityType
{
  return self->_retryCountPerProximityType;
}

- (void)setRetryCountPerProximityType:(id)a3
{
  objc_storeStrong((id *)&self->_retryCountPerProximityType, a3);
}

- (BOOL)isUwbFenceSessionStarted
{
  return self->_isUwbFenceSessionStarted;
}

- (void)setIsUwbFenceSessionStarted:(BOOL)a3
{
  self->_isUwbFenceSessionStarted = a3;
}

- (NSDate)freezeDateNIHomeDevice
{
  return self->_freezeDateNIHomeDevice;
}

- (void)setFreezeDateNIHomeDevice:(id)a3
{
  objc_storeStrong((id *)&self->_freezeDateNIHomeDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freezeDateNIHomeDevice, 0);
  objc_storeStrong((id *)&self->_retryCountPerProximityType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedNearbyDevices, 0);
  objc_storeStrong((id *)&self->_uwbFenceBridge, 0);
  objc_storeStrong((id *)&self->_proximityBridges, 0);
}

void __35__IRProximityProvider_addObserver___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v3 = OUTLINED_FUNCTION_2_0(a1, a2);
  objc_msgSend(v2, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134217984;
  v7 = objc_msgSend(v4, "count");
  OUTLINED_FUNCTION_0_2(&dword_23FFBA000, v3, v5, "#proximity-provider, Add observer, num observers before = %lu", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_0();
}

void __38__IRProximityProvider_removeObserver___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v3 = OUTLINED_FUNCTION_2_0(a1, a2);
  v5 = 134217984;
  v6 = objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_0_2(&dword_23FFBA000, v3, v4, "#proximity-provider, Removing observer, num observers after = %lu", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_0();
}

void __54__IRProximityProvider_didUpdateNearbyDevice_withName___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_23FFBA000, a2, a3, "#proximity-provider, Bridge updated device: %@", (uint8_t *)&v4);
}

void __48__IRProximityProvider_didRemoveDevice_withName___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_23FFBA000, a2, a3, "#proximity-provider, Updated cached nearby devices: %@", (uint8_t *)&v4);
}

@end
