@implementation HUNearbyController

+ (HUNearbyController)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_12);
  return (HUNearbyController *)(id)sharedInstance_NearbyController_0;
}

void __36__HUNearbyController_sharedInstance__block_invoke()
{
  HUNearbyController *v0;
  void *v1;

  v0 = objc_alloc_init(HUNearbyController);
  v1 = (void *)sharedInstance_NearbyController_0;
  sharedInstance_NearbyController_0 = (uint64_t)v0;

}

- (HUNearbyController)init
{
  HUNearbyController *v2;
  HUNearbyController *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *availableDevices;
  NSArray *v16;
  NSArray *availableWatches;
  id v18;
  void *v19;
  uint64_t v20;
  AXDispatchTimer *startTimer;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUNearbyController;
  v2 = -[HUNearbyController init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_syncLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("hu_nearby_updates_queue", v5);
    -[HUNearbyController setNearbyUpdatesQueue:](v3, "setNearbyUpdatesQueue:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[HUNearbyController nearbyUpdatesQueue](v3, "nearbyUpdatesQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithTargetSerialQueue:", v8);
    -[HUNearbyController setNearbyHysteresisTimer:](v3, "setNearbyHysteresisTimer:", v9);

    v3->_shouldPublishNearbyUpdates = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyController setDomainQueues:](v3, "setDomainQueues:", v10);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyController setRegisteredDomains:](v3, "setRegisteredDomains:", v11);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyController setLoggingUpdates:](v3, "setLoggingUpdates:", v12);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyController setMessageUpdates:](v3, "setMessageUpdates:", v13);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyController setDiscoveryUpdates:](v3, "setDiscoveryUpdates:", v14);

    availableDevices = v3->_availableDevices;
    v16 = (NSArray *)MEMORY[0x1E0C9AA60];
    v3->_availableDevices = (NSArray *)MEMORY[0x1E0C9AA60];

    availableWatches = v3->_availableWatches;
    v3->_availableWatches = v16;

    v18 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[HUNearbyController nearbyUpdatesQueue](v3, "nearbyUpdatesQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithTargetSerialQueue:", v19);
    startTimer = v3->_startTimer;
    v3->_startTimer = (AXDispatchTimer *)v20;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v3->_startTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }
  return v3;
}

- (NSArray)availableDevices
{
  return self->_availableDevices;
}

- (void)setAvailableDevices:(id)a3
{
  NSArray *v5;
  NSArray *availableWatches;
  id v7;

  objc_storeStrong((id *)&self->_availableDevices, a3);
  v7 = a3;
  -[NSArray ax_filteredArrayUsingBlock:](self->_availableDevices, "ax_filteredArrayUsingBlock:", &__block_literal_global_30);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableWatches = self->_availableWatches;
  self->_availableWatches = v5;

}

uint64_t __42__HUNearbyController_setAvailableDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isWatch");
}

- (NSArray)availableWatches
{
  return self->_availableWatches;
}

- (id)nearbyDevices
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__HUNearbyController_nearbyDevices__block_invoke;
  v6[3] = &unk_1EA8E90D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__HUNearbyController_nearbyDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "availableDevices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)logMessage:(id)a3
{
  -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, a3);
}

- (void)logMessageWithDomain:(id)a3 message:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:locale:arguments:", v7, 0, &v15);

  if (v5)
  {
    v10 = v5;
    v11 = v8;
    AX_PERFORM_WITH_LOCK();

  }
  else
  {
    HCLogHearingNearby();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

  }
}

void __51__HUNearbyController_logMessageWithDomain_message___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__HUNearbyController_logMessageWithDomain_message___block_invoke_2;
  v3[3] = &unk_1EA8E8708;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __51__HUNearbyController_logMessageWithDomain_message___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0EB808](a3);
  if (v4)
  {
    v5 = v4;
    v4[2](v4, *(_QWORD *)(a1 + 32));
    v4 = (void (**)(_QWORD, _QWORD))v5;
  }

}

- (id)descriptionForIDSDevice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)IDSCopyIDForDevice();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ [%@] - [%@]"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)descriptionForPriority:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Default");
  if (a3 == 2)
    v3 = CFSTR("NoWake");
  if (a3 == 1)
    return CFSTR("High");
  else
    return (id)v3;
}

- (void)logIDSDevices:(id)a3 withTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[HUNearbyController descriptionForIDSDevice:](self, "descriptionForIDSDevice:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("%@ count: %@, %@"), v7, v15, v8);

}

- (void)logNearbyDevices:(id)a3 withTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("%@ count: %@, %@"), v7, v15, v8);

}

- (void)discoverNearbyDevicesWithDomain:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__HUNearbyController_discoverNearbyDevicesWithDomain___block_invoke;
    v6[3] = &unk_1EA8E81F8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __54__HUNearbyController_discoverNearbyDevicesWithDomain___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "registeredDomains");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (!v4[5])
    {
      objc_msgSend(v4, "start");
      v4 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v4, "registeredDomains");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));

  }
}

- (void)stopDiscoveringDevicesWithDomain:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__HUNearbyController_stopDiscoveringDevicesWithDomain___block_invoke;
    v6[3] = &unk_1EA8E81F8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __55__HUNearbyController_stopDiscoveringDevicesWithDomain___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "registeredDomains");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "registeredDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (void)start
{
  void *v3;
  IDSService *v4;
  IDSService *service;
  id v6;
  IDSService *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD block[5];

  if (!self->_service)
  {
    if (objc_msgSend(MEMORY[0x1E0D2F990], "isProtectedDataAvailable"))
    {
      +[HUNearbySettings timeStamp](HUNearbySettings, "timeStamp");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("IDS Start at %@"), v3);

      v4 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.hearing"));
      service = self->_service;
      self->_service = v4;

      v6 = objc_alloc_init(MEMORY[0x1E0D34370]);
      objc_msgSend(v6, "setWantsCrossAccountMessaging:", 0);
      v7 = self->_service;
      -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSService addDelegate:withDelegateProperties:queue:](v7, "addDelegate:withDelegateProperties:queue:", self, v6, v8);

      v9 = dispatch_time(0, 1000000000);
      -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __27__HUNearbyController_start__block_invoke;
      block[3] = &unk_1EA8E8220;
      block[4] = self;
      dispatch_after(v9, v10, block);

    }
    else
    {
      -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("Waiting IDS Start"));
      objc_initWeak(&location, self);
      -[HUNearbyController startTimer](self, "startTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __27__HUNearbyController_start__block_invoke_2;
      v12[3] = &unk_1EA8E81D0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v11, "afterDelay:processBlock:", v12, 0.5);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __27__HUNearbyController_start__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[5];
  objc_msgSend(v2, "devices");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "service:devicesChanged:", v2, v3);

}

void __27__HUNearbyController_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "start");

}

- (void)stop
{
  void *v3;
  IDSService *service;
  NSArray *availableDevices;
  NSArray *v6;
  NSArray *availableWatches;
  id v8;

  +[HUNearbySettings timeStamp](HUNearbySettings, "timeStamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("IDS Stop at %@"), v3);

  service = self->_service;
  self->_service = 0;

  availableDevices = self->_availableDevices;
  v6 = (NSArray *)MEMORY[0x1E0C9AA60];
  self->_availableDevices = (NSArray *)MEMORY[0x1E0C9AA60];

  availableWatches = self->_availableWatches;
  self->_availableWatches = v6;

  -[HUNearbyController startTimer](self, "startTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

}

- (id)nearbyDeviceWithIdentifier:(id)a3 justCreated:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, uint64_t, _BYTE *);
  void *v33;
  HUNearbyController *v34;
  id v35;
  uint64_t *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v6 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__4;
  v45 = __Block_byref_object_dispose__4;
  v46 = 0;
  -[HUNearbyController availableDevices](self, "availableDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke;
  v39[3] = &unk_1EA8E9C28;
  v9 = v6;
  v40 = v9;
  v10 = objc_msgSend(v7, "indexOfObjectPassingTest:", v39);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("Device not found by ID, asking IDS service"));
    -[HUNearbyController service](self, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceForFromID:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HUNearbyController availableDevices](self, "availableDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v8;
      v37[1] = 3221225472;
      v37[2] = __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke_2;
      v37[3] = &unk_1EA8E9C28;
      v12 = v12;
      v38 = v12;
      v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", v37);

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("Device not found. Creating from idsDevice"));
        +[HUNearbyDevice nearbyDeviceWithIDSDevice:](HUNearbyDevice, "nearbyDeviceWithIDSDevice:", v12);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v42[5];
        v42[5] = v15;

        -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("Added device %@"), v42[5]);
        if (a4 && v42[5])
          *a4 = 1;
      }
      else
      {
        -[HUNearbyController availableDevices](self, "availableDevices");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndex:", v14);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v42[5];
        v42[5] = v26;

      }
      v24 = v38;
    }
    else
    {
      -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("Device not found. Creating."));
      -[HUNearbyController service](self, "service");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "devices");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v8;
      v31 = 3221225472;
      v32 = __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke_3;
      v33 = &unk_1EA8E9C50;
      v34 = self;
      v21 = v9;
      v35 = v21;
      v36 = &v41;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", &v30);

      if (!v42[5])
      {
        +[HUNearbyDevice nearbyDeviceWithIDSIdentifier:](HUNearbyDevice, "nearbyDeviceWithIDSIdentifier:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v42[5];
        v42[5] = v22;

        -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("Added device with just identifier %@"), v42[5], v30, v31, v32, v33, v34);
      }
      if (a4 && v42[5])
        *a4 = 1;
      v24 = v35;
    }

  }
  else
  {
    -[HUNearbyController availableDevices](self, "availableDevices");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v42[5];
    v42[5] = v17;

  }
  v28 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  return v28;
}

uint64_t __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "equalsToIdentifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "idsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIDOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIDOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

void __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "descriptionForIDSDevice:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMessageWithDomain:message:", 0, CFSTR("Checking %@ - %@"), v7, v8);

  objc_msgSend(v15, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {

LABEL_4:
    +[HUNearbyDevice nearbyDeviceWithIDSDevice:](HUNearbyDevice, "nearbyDeviceWithIDSDevice:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(*(id *)(a1 + 32), "logMessageWithDomain:message:", 0, CFSTR("Added device %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    *a4 = 1;
    goto LABEL_5;
  }
  v10 = (void *)IDSCopyIDForDevice();
  v11 = objc_msgSend(v10, "containsString:", *(_QWORD *)(a1 + 40));

  if (v11)
    goto LABEL_4;
LABEL_5:

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  char v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v21 = 0;
  v10 = a5;
  -[HUNearbyController nearbyDeviceWithIdentifier:justCreated:](self, "nearbyDeviceWithIdentifier:justCreated:", v9, &v21);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v21)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("Incoming message creating: %@"), v11);
    -[HUNearbyController availableDevices](self, "availableDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyController setAvailableDevices:](self, "setAvailableDevices:", v15);

    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyController nearbyDevicesDidUpdateWithNewDevices:forDomain:](self, "nearbyDevicesDidUpdateWithNewDevices:forDomain:", v16, 0);

  }
  -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("Incoming message %@ - %@ - %@"), v9, v10, v12);
  +[HUUtilities objectFromXDCObject:](HUUtilities, "objectFromXDCObject:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke;
  v19[3] = &unk_1EA8E9CF0;
  v19[4] = self;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v19);

}

void __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a2;
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  v32 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_2;
  v23 = &unk_1EA8E9C78;
  v26 = &v27;
  v24 = v7;
  v25 = v5;
  AX_PERFORM_WITH_LOCK();
  objc_msgSend(*(id *)(a1 + 32), "domainQueues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)v28[5];
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_3;
  v15[3] = &unk_1EA8E9CC8;
  v12 = v10;
  v16 = v12;
  v17 = *(id *)(a1 + 40);
  v13 = v6;
  v18 = v13;
  v14 = v25;
  v19 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

  _Block_object_dispose(&v27, 8);
}

void __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "messageUpdates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = v4;
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_4;
    block[3] = &unk_1EA8E9CA0;
    v16 = v4;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    dispatch_async(v6, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  +[HUNearbySettings sharedInstance](HUNearbySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "idsDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "deviceType");
  objc_msgSend(*(id *)(a1 + 40), "deviceTypeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incomingIDSMessage:domain:deviceType:deviceTypeDescription:", v9, v8, v11, v12);

}

uint64_t __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  if (!a5 || a7 || !a6)
    -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("IDS didSendWithSuccess GUID %@, success %d, error: %@"), a5, a6, a7);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  -[HUNearbyController logIDSDevices:withTitle:](self, "logIDSDevices:withTitle:", a4, CFSTR("Connected devices changed"));
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5;

  v5 = a4;
  -[HUNearbyController logIDSDevices:withTitle:](self, "logIDSDevices:withTitle:", v5, CFSTR("Devices changed"));
  -[HUNearbyController processIDSDevices:](self, "processIDSDevices:", v5);

}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  -[HUNearbyController logIDSDevices:withTitle:](self, "logIDSDevices:withTitle:", a4, CFSTR("Nearby devices changed"));
}

- (void)processIDSDevices:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HUNearbyController logIDSDevices:withTitle:](self, "logIDSDevices:withTitle:", v4, CFSTR("Process IDS Devices"));
  -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HUNearbyController_processIDSDevices___block_invoke;
  v7[3] = &unk_1EA8E81F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__HUNearbyController_processIDSDevices___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;
  _QWORD v15[5];
  id v16;
  id v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldPublishNearbyUpdates");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "logMessageWithDomain:message:", 0, CFSTR("Publishing updates"));
    objc_msgSend(*(id *)(a1 + 32), "setHasPendingNearbyUpdates:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setShouldPublishNearbyUpdates:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__HUNearbyController_processIDSDevices___block_invoke_2;
    v15[3] = &unk_1EA8E9D18;
    v6 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v5;
    v17 = v4;
    v7 = v4;
    v8 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
    objc_msgSend(*(id *)(a1 + 32), "setAvailableDevices:", v7);
    objc_msgSend(*(id *)(a1 + 32), "nearbyDevicesDidUpdateWithNewDevices:forDomain:", v8, 0);
    objc_msgSend(*(id *)(a1 + 32), "logNearbyDevices:withTitle:", v7, CFSTR("Saved devices"));

  }
  else
  {
    objc_msgSend(v3, "logMessageWithDomain:message:", 0, CFSTR("Pending updates. Skipping for now."));
    objc_msgSend(*(id *)(a1 + 32), "setHasPendingNearbyUpdates:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "nearbyHysteresisTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPending");

  if ((v10 & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "nearbyHysteresisTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__HUNearbyController_processIDSDevices___block_invoke_3;
    v12[3] = &unk_1EA8E95E8;
    objc_copyWeak(&v13, &location);
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "afterDelay:processBlock:", v12, 60.0);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __40__HUNearbyController_processIDSDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a2;
  objc_msgSend(v3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "descriptionForIDSDevice:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logMessageWithDomain:message:", 0, CFSTR("IDS device uniqueID is nil %@"), v6);

  }
  v10 = 0;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nearbyDeviceWithIdentifier:justCreated:", v8, &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(*(id *)(a1 + 40), "hcSafeAddObject:", v9);
  objc_msgSend(*(id *)(a1 + 48), "hcSafeAddObject:", v9);

}

void __40__HUNearbyController_processIDSDevices___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setShouldPublishNearbyUpdates:", 1);

  v4 = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(v4, "hasPendingNearbyUpdates");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "logMessageWithDomain:message:", 0, CFSTR("Nearby Hysteresis Timer fired"));
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "devices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service:devicesChanged:", v6, v9);

  }
}

- (void)nearbyDevicesDidUpdateWithNewDevices:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HUNearbyController *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  HUNearbyController *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  -[HUNearbyController logNearbyDevices:withTitle:](self, "logNearbyDevices:withTitle:", v6, CFSTR("New devices"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke;
  v19 = &unk_1EA8E90D8;
  v20 = self;
  v21 = &v22;
  AX_PERFORM_WITH_LOCK();
  v9 = (void *)v23[5];
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_2;
  v12[3] = &unk_1EA8E9D68;
  v10 = v7;
  v13 = v10;
  v14 = self;
  v11 = v6;
  v15 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  _Block_object_dispose(&v22, 8);
}

void __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "discoveryUpdates");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a2;
  v5 = a3;
  if (!*(_QWORD *)(a1 + 32) || objc_msgSend(v9, "isEqualToString:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "domainQueues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_3;
    v10[3] = &unk_1EA8E9D40;
    v11 = v7;
    v12 = *(id *)(a1 + 48);
    v8 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_4;
    v7[3] = &unk_1EA8E86E0;
    v9 = v4;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v6, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 40));
  }

}

uint64_t __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", 0, CFSTR("activeAccountsChanged: %@"), a4);
}

- (void)sendMessage:(id)a3 toDevicesWithDomain:(id)a4 withPriority:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__HUNearbyController_sendMessage_toDevicesWithDomain_withPriority___block_invoke;
  v13[3] = &unk_1EA8E8780;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __67__HUNearbyController_sendMessage_toDevicesWithDomain_withPriority___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  objc_msgSend(v2, "availableDevices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMessage:withDomain:toDevices:withPriority:", v3, v4, v5, a1[7]);

}

- (void)sendMessage:(id)a3 toWatchDevicesWithDomain:(id)a4 withPriority:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__HUNearbyController_sendMessage_toWatchDevicesWithDomain_withPriority___block_invoke;
  v13[3] = &unk_1EA8E8780;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __72__HUNearbyController_sendMessage_toWatchDevicesWithDomain_withPriority___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  objc_msgSend(v2, "availableWatches");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMessage:withDomain:toDevices:withPriority:", v3, v4, v5, a1[7]);

}

- (void)sendMessage:(id)a3 toDevicesWithDomain:(id)a4 excludingState:(id)a5 withPriority:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HUNearbyController_sendMessage_toDevicesWithDomain_excludingState_withPriority___block_invoke;
  block[3] = &unk_1EA8E9DB8;
  block[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  v21 = a6;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  dispatch_async(v13, block);

}

void __82__HUNearbyController_sendMessage_toDevicesWithDomain_excludingState_withPriority___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "availableDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __82__HUNearbyController_sendMessage_toDevicesWithDomain_excludingState_withPriority___block_invoke_2;
  v7 = &unk_1EA8E9D90;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sendMessage:withDomain:toDevices:withPriority:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 64), v4, v5, v6, v7);
}

uint64_t __82__HUNearbyController_sendMessage_toDevicesWithDomain_excludingState_withPriority___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "stateForDomain:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40)) ^ 1;

  return v4;
}

- (void)sendMessage:(id)a3 toWatchDevicesWithDomain:(id)a4 excludingState:(id)a5 withPriority:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HUNearbyController_sendMessage_toWatchDevicesWithDomain_excludingState_withPriority___block_invoke;
  block[3] = &unk_1EA8E9DB8;
  block[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  v21 = a6;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  dispatch_async(v13, block);

}

void __87__HUNearbyController_sendMessage_toWatchDevicesWithDomain_excludingState_withPriority___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "availableWatches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __87__HUNearbyController_sendMessage_toWatchDevicesWithDomain_excludingState_withPriority___block_invoke_2;
  v7 = &unk_1EA8E9D90;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sendMessage:withDomain:toDevices:withPriority:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 64), v4, v5, v6, v7);
}

uint64_t __87__HUNearbyController_sendMessage_toWatchDevicesWithDomain_excludingState_withPriority___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "stateForDomain:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40)) ^ 1;

  return v4;
}

- (void)sendMessage:(id)a3 withDomain:(id)a4 toDevices:(id)a5 withPriority:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  HUNearbyController *v23;
  unint64_t v24;
  int v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v12, "count") && objc_msgSend(v11, "length") && objc_msgSend(v10, "count"))
  {
    -[HUNearbyController descriptionForPriority:](self, "descriptionForPriority:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sendMessage_withDomain_toDevices_withPriority__MessageCount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyController logMessageWithDomain:message:](self, "logMessageWithDomain:message:", v11, CFSTR("IDS Sending(%@) %@ to %@ with %@, priority: %@"), v14, v10, v12, v11, v13);

    v15 = sendMessage_withDomain_toDevices_withPriority__MessageCount++;
    -[HUNearbyController nearbyUpdatesQueue](self, "nearbyUpdatesQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HUNearbyController_sendMessage_withDomain_toDevices_withPriority___block_invoke;
    block[3] = &unk_1EA8E9E08;
    v19 = v10;
    v24 = a6;
    v20 = v11;
    v21 = v13;
    v22 = v12;
    v23 = self;
    v25 = v15;
    v17 = v13;
    dispatch_async(v16, block);

  }
}

void __68__HUNearbyController_sendMessage_withDomain_toDevices_withPriority___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  +[HUNearbySettings sharedInstance](HUNearbySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentIDSMessage:domain:priority:priorityDescription:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 56);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__HUNearbyController_sendMessage_withDomain_toDevices_withPriority___block_invoke_2;
  v19[3] = &unk_1EA8E9DE0;
  v5 = v3;
  v20 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v19);
  v6 = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 72) == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34190]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EA8FFC38, *MEMORY[0x1E0D341A0]);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 64), "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUUtilities XDCObjectFromObject:](HUUtilities, "XDCObjectFromObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(*(_QWORD *)(a1 + 72) - 1) >= 2)
    v11 = 200;
  else
    v11 = 300;
  v17 = 0;
  v18 = 0;
  objc_msgSend(v9, "sendMessage:toDestinations:priority:options:identifier:error:", v10, v5, v11, v8, &v18, &v17);
  v12 = v18;
  v13 = v17;

  if (v13)
    objc_msgSend(*(id *)(a1 + 64), "logMessageWithDomain:message:", *(_QWORD *)(a1 + 40), CFSTR("Error sending %@"), v13);
  if (v12)
  {
    v14 = *(void **)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logMessageWithDomain:message:", v15, CFSTR("IDS sent message: %@, GUID: %@"), v16, v12);

  }
}

void __68__HUNearbyController_sendMessage_withDomain_toDevices_withPriority___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)registerBlock:(id)a3 forKey:(id)a4 withUpdateGroup:(id)a5 forDomain:(id)a6 withListener:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (v15)
  {
    v17 = v15;
    v18 = v13;
    v19 = v14;
    v20 = v11;
    v21 = v12;
    AX_PERFORM_WITH_LOCK();

  }
}

void __82__HUNearbyController_registerBlock_forKey_withUpdateGroup_forDomain_withListener___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  HUNearbyListenerHelper *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(void **)(a1 + 56);
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v2, "setObject:forKey:", v4, v6);

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUNearbyControllerDestructionHelperKey);
    v5 = (HUNearbyListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = -[HUNearbyListenerHelper initWithListenerAddress:andDelegate:]([HUNearbyListenerHelper alloc], "initWithListenerAddress:andDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUNearbyControllerDestructionHelperKey, v5, (void *)1);
    }
    -[HUNearbyListenerHelper addKey:forDomain:](v5, "addKey:forDomain:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(v2, "removeObjectForKey:", v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v2, *(_QWORD *)(a1 + 48));

}

- (void)registerQueue:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HUNearbyController domainQueues](self, "domainQueues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)registerLoggingBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = (id)MEMORY[0x1DF0EB808](a3);
  -[HUNearbyController registerBlock:forKey:withUpdateGroup:forDomain:withListener:](self, "registerBlock:forKey:withUpdateGroup:forDomain:withListener:", v10, CFSTR("HUNearbyControllerLoggingKey"), self->_loggingUpdates, v9, v8);

}

- (void)registerDiscoveryBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = (id)MEMORY[0x1DF0EB808](a3);
  -[HUNearbyController registerBlock:forKey:withUpdateGroup:forDomain:withListener:](self, "registerBlock:forKey:withUpdateGroup:forDomain:withListener:", v10, CFSTR("HUNearbyControllerDiscoveryKey"), self->_discoveryUpdates, v9, v8);

}

- (void)registerMessageBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = (id)MEMORY[0x1DF0EB808](a3);
  -[HUNearbyController registerBlock:forKey:withUpdateGroup:forDomain:withListener:](self, "registerBlock:forKey:withUpdateGroup:forDomain:withListener:", v10, CFSTR("HUNearbyControllerMessageKey"), self->_messageUpdates, v9, v8);

}

- (OS_dispatch_queue)nearbyUpdatesQueue
{
  return self->_nearbyUpdatesQueue;
}

- (void)setNearbyUpdatesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyUpdatesQueue, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSMutableDictionary)domainQueues
{
  return self->_domainQueues;
}

- (void)setDomainQueues:(id)a3
{
  objc_storeStrong((id *)&self->_domainQueues, a3);
}

- (NSMutableArray)registeredDomains
{
  return self->_registeredDomains;
}

- (void)setRegisteredDomains:(id)a3
{
  objc_storeStrong((id *)&self->_registeredDomains, a3);
}

- (NSMutableDictionary)loggingUpdates
{
  return self->_loggingUpdates;
}

- (void)setLoggingUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_loggingUpdates, a3);
}

- (NSMutableDictionary)messageUpdates
{
  return self->_messageUpdates;
}

- (void)setMessageUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_messageUpdates, a3);
}

- (NSMutableDictionary)discoveryUpdates
{
  return self->_discoveryUpdates;
}

- (void)setDiscoveryUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryUpdates, a3);
}

- (AXDispatchTimer)nearbyHysteresisTimer
{
  return self->_nearbyHysteresisTimer;
}

- (void)setNearbyHysteresisTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyHysteresisTimer, a3);
}

- (BOOL)shouldPublishNearbyUpdates
{
  return self->_shouldPublishNearbyUpdates;
}

- (void)setShouldPublishNearbyUpdates:(BOOL)a3
{
  self->_shouldPublishNearbyUpdates = a3;
}

- (BOOL)hasPendingNearbyUpdates
{
  return self->_hasPendingNearbyUpdates;
}

- (void)setHasPendingNearbyUpdates:(BOOL)a3
{
  self->_hasPendingNearbyUpdates = a3;
}

- (AXDispatchTimer)startTimer
{
  return self->_startTimer;
}

- (void)setStartTimer:(id)a3
{
  objc_storeStrong((id *)&self->_startTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTimer, 0);
  objc_storeStrong((id *)&self->_nearbyHysteresisTimer, 0);
  objc_storeStrong((id *)&self->_discoveryUpdates, 0);
  objc_storeStrong((id *)&self->_messageUpdates, 0);
  objc_storeStrong((id *)&self->_loggingUpdates, 0);
  objc_storeStrong((id *)&self->_registeredDomains, 0);
  objc_storeStrong((id *)&self->_domainQueues, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_nearbyUpdatesQueue, 0);
  objc_storeStrong((id *)&self->_availableWatches, 0);
  objc_storeStrong((id *)&self->_availableDevices, 0);
}

@end
