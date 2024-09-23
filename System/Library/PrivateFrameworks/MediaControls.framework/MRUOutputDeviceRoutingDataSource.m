@implementation MRUOutputDeviceRoutingDataSource

- (MRUOutputDeviceRoutingDataSource)init
{
  return (MRUOutputDeviceRoutingDataSource *)-[MRUOutputDeviceRoutingDataSource _initWithEndpointRoute:](self, "_initWithEndpointRoute:", 0);
}

- (id)_initWithEndpointRoute:(id)a3
{
  id v5;
  MRUOutputDeviceRoutingDataSource *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *discoverySessionQueue;
  void *SharedAudioPresentationContext;
  uint64_t v12;
  MPMRAVOutputContextWrapper *applicationOutputContext;
  NSObject *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  MRUOutputDeviceRoutingDataSource *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRUOutputDeviceRoutingDataSource;
  v6 = -[MPAVRoutingDataSource init](&v17, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVOutputDeviceRoutingDataSource/serialQueue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.MediaPlayer.MPAVOutputDeviceRoutingDataSource/discoverySessionQueue", 0);
    discoverySessionQueue = v6->_discoverySessionQueue;
    v6->_discoverySessionQueue = (OS_dispatch_queue *)v9;

    v6->_attemptedToInitializeAppOutputContext = 0;
    v6->_shouldSourceOutputDevicesFromAVODDS = 1;
    v6->_supportsMultipleSelection = 1;
    v6->_supportsQueueHandoff = 1;
    objc_storeStrong((id *)&v6->_endpointRoute, a3);
    SharedAudioPresentationContext = (void *)MRAVOutputContextGetSharedAudioPresentationContext();
    if (SharedAudioPresentationContext)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC23B0]), "initWithMRAVOutputContext:", SharedAudioPresentationContext);
      applicationOutputContext = v6->_applicationOutputContext;
      v6->_applicationOutputContext = (MPMRAVOutputContextWrapper *)v12;

      SharedAudioPresentationContext = (void *)MRAVOutputContextCopyUniqueIdentifier();
    }
    MCLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = SharedAudioPresentationContext;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "Created new application output context: %{public}@ for data source: %{public}@", buf, 0x16u);
    }

    -[MRUOutputDeviceRoutingDataSource _registerNotifications](v6, "_registerNotifications");
    -[MRUOutputDeviceRoutingDataSource _generateDiscoverySession](v6, "_generateDiscoverySession");
    -[MRUOutputDeviceRoutingDataSource hearingAidReachabilityDidChange](v6, "hearingAidReachabilityDidChange");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_MRUHearingDevicesDidChangeNotification, (CFStringRef)*MEMORY[0x1E0D2F9C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v6;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  MRUOutputDeviceRoutingDataSource *v9;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __43__MRUOutputDeviceRoutingDataSource_dealloc__block_invoke;
  v8 = &unk_1E5818C88;
  v9 = self;
  msv_dispatch_sync_on_queue();
  -[MRUOutputDeviceRoutingDataSource _unregisterNotifications](self, "_unregisterNotifications");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D2F9C0], 0);
  v4.receiver = self;
  v4.super_class = (Class)MRUOutputDeviceRoutingDataSource;
  -[MPAVRoutingDataSource dealloc](&v4, sel_dealloc);
}

uint64_t __43__MRUOutputDeviceRoutingDataSource_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "removeOutputDevicesChangedCallback:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setDiscoveryMode:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "removeEndpointsChangedCallback:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setDiscoveryMode:", 0);
}

- (MPMRAVOutputContextWrapper)applicationOutputContext
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__MRUOutputDeviceRoutingDataSource_applicationOutputContext__block_invoke;
  v5[3] = &unk_1E581AC18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPMRAVOutputContextWrapper *)v3;
}

void __60__MRUOutputDeviceRoutingDataSource_applicationOutputContext__block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(*(id *)(a1 + 32), "endpoint"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v1, "isLocalEndpoint")))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v4)

}

- (NSString)routingContextUID
{
  id v2;
  void *v3;

  -[MRUOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "unwrappedValue");
  v3 = (void *)MRAVOutputContextCopyUniqueIdentifier();

  return (NSString *)v3;
}

- (void)setRoutingContextUID:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSObject *serialQueue;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  MRUOutputDeviceRoutingDataSource *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  MRUOutputDeviceRoutingDataSource *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MCLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v7;
    v19 = 2048;
    v20 = self;
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> setting routing context UID = %{public}@", buf, 0x20u);

  }
  serialQueue = self->_serialQueue;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __57__MRUOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke;
  v14 = &unk_1E5818CB0;
  v15 = self;
  v16 = v4;
  v9 = v4;
  dispatch_sync(serialQueue, &v11);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], self);
  objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x1E0CC1CF0], self);

}

void __57__MRUOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t RoutingContext;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;

  objc_msgSend((id)objc_opt_class(), "_globalAudioSessionLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");
  RoutingContext = MRAVOutputContextCreateRoutingContext();
  if (RoutingContext)
  {
    v6 = (const void *)RoutingContext;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC23B0]), "initWithMRAVOutputContext:", RoutingContext);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 144);
    *(_QWORD *)(v8 + 144) = v7;

    CFRelease(v6);
  }
  objc_msgSend(v4, "unlock");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(v10 + 72);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__MRUOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke_2;
  v13[3] = &unk_1E5818CB0;
  v13[4] = v10;
  v14 = v11;
  dispatch_async(v12, v13);

}

uint64_t __57__MRUOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRoutingContextUID:", *(_QWORD *)(a1 + 40));
}

- (void)setEndpointRoute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = a3;
  msv_dispatch_sync_on_queue();
  if (*((_BYTE *)v8 + 24))
  {
    -[MRUOutputDeviceRoutingDataSource setDidReceiveDiscoveryResults:](self, "setDidReceiveDiscoveryResults:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CC1CD8];
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CC1CD8], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__personalRoutesDidChange, v6, v4);
    objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], self);
    objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0CC1CF0], self);
    -[MRUOutputDeviceRoutingDataSource _generateDiscoverySession](self, "_generateDiscoverySession");

  }
  _Block_object_dispose(&v7, 8);

}

void __53__MRUOutputDeviceRoutingDataSource_setEndpointRoute___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  char v4;
  id v5;

  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  v2 = *(id *)(a1 + 40);
  if (v5 == v2)
  {

  }
  else
  {
    v3 = v5;
    v4 = objc_msgSend(v3, "isEqual:", v2);

    if ((v4 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (void)setTargetSessionID:(unsigned int)a3
{
  NSObject *discoverySessionQueue;
  _QWORD v4[5];
  unsigned int v5;

  if (self->_targetSessionID != a3)
  {
    self->_targetSessionID = a3;
    discoverySessionQueue = self->_discoverySessionQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__MRUOutputDeviceRoutingDataSource_setTargetSessionID___block_invoke;
    v4[3] = &unk_1E581A1B0;
    v4[4] = self;
    v5 = a3;
    dispatch_async(discoverySessionQueue, v4);
  }
}

uint64_t __55__MRUOutputDeviceRoutingDataSource_setTargetSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setTargetAudioSessionID:", *(unsigned int *)(a1 + 40));
}

- (MRAVEndpoint)endpoint
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVEndpoint *)v2;
}

void __44__MRUOutputDeviceRoutingDataSource_endpoint__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "endpointWrapper");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "unwrappedValue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (MPAVEndpointRoute)endpointRoute
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPAVEndpointRoute *)v2;
}

void __49__MRUOutputDeviceRoutingDataSource_endpointRoute__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 168));
}

- (BOOL)supportsMultipleSelection
{
  return self->_supportsMultipleSelection;
}

- (MRAVOutputDevice)predictedDevice
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVOutputDevice *)v2;
}

void __51__MRUOutputDeviceRoutingDataSource_predictedDevice__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

- (void)setPredictedDevice:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MRUOutputDeviceRoutingDataSource_setPredictedDevice___block_invoke;
  block[3] = &unk_1E5818CB0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __55__MRUOutputDeviceRoutingDataSource_setPredictedDevice___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
  v3 = *(id *)(a1 + 40);
  if (v2 == v3)
  {

  }
  else
  {
    v4 = v3;
    v5 = v2;
    v6 = objc_msgSend(v5, "isEqual:", v4);

    if ((v6 & 1) == 0)
    {
      MCLogCategoryDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_opt_class();
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v12 = 138543874;
        v13 = v8;
        v14 = 2048;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        v11 = v8;
        _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Setting predicted device: %@", (uint8_t *)&v12, 0x20u);

      }
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
}

- (BOOL)didReceiveDiscoveryResults
{
  NSObject *discoverySessionQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  discoverySessionQueue = self->_discoverySessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__MRUOutputDeviceRoutingDataSource_didReceiveDiscoveryResults__block_invoke;
  v5[3] = &unk_1E581AC18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(discoverySessionQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__MRUOutputDeviceRoutingDataSource_didReceiveDiscoveryResults__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 129);
  return result;
}

- (void)setDidReceiveDiscoveryResults:(BOOL)a3
{
  NSObject *discoverySessionQueue;
  _QWORD v4[5];
  BOOL v5;

  discoverySessionQueue = self->_discoverySessionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__MRUOutputDeviceRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke;
  v4[3] = &unk_1E5818D00;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(discoverySessionQueue, v4);
}

uint64_t __66__MRUOutputDeviceRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 129) = *(_BYTE *)(result + 40);
  return result;
}

- (NSString)hearingDeviceName
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MRUOutputDeviceRoutingDataSource_hearingDeviceName__block_invoke;
  v5[3] = &unk_1E581AC18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __53__MRUOutputDeviceRoutingDataSource_hearingDeviceName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setHearingDeviceName:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MRUOutputDeviceRoutingDataSource_setHearingDeviceName___block_invoke;
  block[3] = &unk_1E5818CB0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __57__MRUOutputDeviceRoutingDataSource_setHearingDeviceName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 176);
    *(_QWORD *)(v3 + 176) = v2;

  }
}

- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C508]), "initWithEndpointFeatures:", 1);
  objc_msgSend(v3, "setTargetAudioSessionID:", -[MRUOutputDeviceRoutingDataSource targetSessionID](self, "targetSessionID"));
  return (MRAVRoutingDiscoverySessionConfiguration *)v3;
}

- (void)setDiscoverySession:(id)a3
{
  id v5;
  NSObject *serialQueue;
  uint64_t v7;
  id v8;
  MRAVRoutingDiscoverySession *discoverySession;
  id v10;
  void *v11;
  id callbackToken;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  _QWORD block[5];
  id v18;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  -[MRAVRoutingDiscoverySession removeOutputDevicesChangedCallback:](self->_discoverySession, "removeOutputDevicesChangedCallback:", self->_callbackToken);
  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_discoverySession, "setDiscoveryMode:", 0);
  serialQueue = self->_serialQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke;
  block[3] = &unk_1E5818CB0;
  block[4] = self;
  v8 = v5;
  v18 = v8;
  dispatch_sync(serialQueue, block);
  objc_storeStrong((id *)&self->_discoverySession, a3);
  self->_devicePresenceDetected = -[MRAVRoutingDiscoverySession devicePresenceDetected](self->_discoverySession, "devicePresenceDetected");
  self->_didReceiveDiscoveryResults = 0;
  objc_initWeak(&location, self);
  discoverySession = self->_discoverySession;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_2;
  v13[3] = &unk_1E581BBC0;
  objc_copyWeak(&v15, &location);
  v10 = v8;
  v14 = v10;
  -[MRAVRoutingDiscoverySession addOutputDevicesChangedCallback:](discoverySession, "addOutputDevicesChangedCallback:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  callbackToken = self->_callbackToken;
  self->_callbackToken = v11;

  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_discoverySession, "setDiscoveryMode:", MPAVMRRouteDiscoveryModeFromDiscoveryMode());
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  if (v2)
  {
    objc_msgSend(v2, "unwrappedValue");
    v3 = (id)MRAVOutputContextCopyUniqueIdentifier();
    objc_msgSend(*(id *)(a1 + 40), "setRoutingContextUID:", v3);

  }
}

void __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v8 = WeakRetained;
    v9 = *(id *)(a1 + 32);
    v6 = v3;
    v10 = v6;
    msv_dispatch_sync_on_queue();
    if (*((_BYTE *)v12 + 24))
      objc_msgSend(v5, "_outputDevicesDidChange:", v6, v7, 3221225472, __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_3, &unk_1E581BB98, v8, v9, v6, &v11);

    _Block_object_dispose(&v11, 8);
  }

}

void *__56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *result;

  v2 = *(void **)(a1 + 40);
  result = *(void **)(*(_QWORD *)(a1 + 32) + 240);
  if (result == v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = objc_msgSend(result, "devicePresenceDetected");
    result = (void *)objc_msgSend(*(id *)(a1 + 48), "count");
    if (result)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 129) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (void)setCompanionDiscoverySession:(id)a3
{
  id v5;
  MRAVRoutingDiscoverySession *companionDiscoverySession;
  void *v7;
  id companionCallbackToken;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  -[MRAVRoutingDiscoverySession removeEndpointsChangedCallback:](self->_companionDiscoverySession, "removeEndpointsChangedCallback:", self->_companionCallbackToken);
  objc_storeStrong((id *)&self->_companionDiscoverySession, a3);
  self->_didFindCompanion = 0;
  objc_initWeak(&location, self);
  companionDiscoverySession = self->_companionDiscoverySession;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __65__MRUOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke;
  v12 = &unk_1E581BBE8;
  objc_copyWeak(&v13, &location);
  -[MRAVRoutingDiscoverySession addEndpointsChangedCallback:](companionDiscoverySession, "addEndpointsChangedCallback:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  companionCallbackToken = self->_companionCallbackToken;
  self->_companionCallbackToken = v7;

  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_companionDiscoverySession, "setDiscoveryMode:", 3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __65__MRUOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          if (!WeakRetained[96]
            && objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isCompanionEndpoint"))
          {
            msv_dispatch_sync_on_queue();
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

void __65__MRUOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "discoverySessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDiscoverySession:", v4);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  NSObject *discoverySessionQueue;
  _QWORD v4[6];

  discoverySessionQueue = self->_discoverySessionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__MRUOutputDeviceRoutingDataSource_setDiscoveryMode___block_invoke;
  v4[3] = &unk_1E5819110;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(discoverySessionQueue, v4);
}

uint64_t __53__MRUOutputDeviceRoutingDataSource_setDiscoveryMode___block_invoke(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = *(_QWORD *)(a1 + 40);
  v2 = MPAVMRRouteDiscoveryModeFromDiscoveryMode();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setDiscoveryMode:", v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setDiscoveryMode:", v2);
}

- (int64_t)discoveryMode
{
  NSObject *discoverySessionQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  discoverySessionQueue = self->_discoverySessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MRUOutputDeviceRoutingDataSource_discoveryMode__block_invoke;
  v5[3] = &unk_1E581AC18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(discoverySessionQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRUOutputDeviceRoutingDataSource_discoveryMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 152);
  return result;
}

- (id)getRoutesForCategory:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  NSObject *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t ii;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t jj;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t kk;
  id v77;
  id v78;
  char v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t mm;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  char v94;
  id v95;
  void *v96;
  NSObject *serialQueue;
  id v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  id v108;
  uint64_t v110;
  id v111;
  id v112;
  void *v113;
  char v114;
  id v115;
  id v116;
  void *v117;
  id obj;
  id v119;
  id v120;
  MRUOutputDeviceRoutingDataSource *v121;
  void *v122;
  id v123;
  id v124;
  void *v125;
  _QWORD block[5];
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  char v132;
  _QWORD aBlock[5];
  id v134;
  id v135;
  __int128 *p_buf;
  uint64_t v137;
  char v138;
  char v139;
  char v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
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
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  uint64_t v177;
  uint64_t v178;
  void (*v179)(uint64_t);
  void *v180;
  MRUOutputDeviceRoutingDataSource *v181;
  id v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t (*v187)(uint64_t, uint64_t);
  void (*v188)(uint64_t);
  id v189;
  __int128 buf;
  uint64_t v191;
  char v192;
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  uint64_t v201;
  _BYTE v202[128];
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  v111 = a3;
  v112 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v121 = self;
  -[MRUOutputDeviceRoutingDataSource endpointRoute](self, "endpointRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource applicationOutputContext](v121, "applicationOutputContext");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = 0;
  v185 = &v184;
  v186 = 0x3032000000;
  v187 = __Block_byref_object_copy__1;
  v188 = __Block_byref_object_dispose__1;
  v189 = 0;
  v177 = MEMORY[0x1E0C809B0];
  v178 = 3221225472;
  v179 = __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke;
  v180 = &unk_1E5819700;
  v183 = &v184;
  v181 = v121;
  v5 = v4;
  v182 = v5;
  msv_dispatch_sync_on_queue();
  v113 = v5;
  if (objc_msgSend(v5, "isPhoneRoute"))
  {
    v124 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v6 = (id)v185[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v173, v202, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v174;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v174 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i);
          objc_msgSend(v10, "groupID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRUOutputDeviceRoutingDataSource endpoint](v121, "endpoint");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "groupLeader");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "groupID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v11, "isEqualToString:", v14);

          if (v15)
            objc_msgSend(v124, "addObject:", v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v173, v202, 16);
      }
      while (v7);
    }

    v16 = (void *)objc_msgSend(v124, "copy");
    goto LABEL_12;
  }
  if (v5)
  {
    objc_msgSend(v5, "endpointObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resolvedOutputDevices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v113, "isDeviceRoute") ^ 1;
  }
  else
  {
    if (v122)
    {
      objc_msgSend(objc_retainAutorelease(v122), "unwrappedValue");
      v16 = (void *)MRAVOutputContextCopyOutputDevices();
LABEL_12:
      v17 = 0;
      goto LABEL_15;
    }
    v16 = 0;
    v17 = 1;
  }
LABEL_15:
  v116 = objc_retainAutorelease(v122);
  objc_msgSend(v116, "unwrappedValue");
  v19 = MRAVOutputContextCopyPredictedOutputDevice();
  v117 = (void *)v19;
  if (v19)
  {
    v201 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v201, 1);
    v20 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v20;
  }
  -[MRUOutputDeviceRoutingDataSource setPredictedDevice:](v121, "setPredictedDevice:");
  v21 = objc_msgSend(v16, "count");
  v119 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v110 = v21;
  if (v17)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v23 = v16;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v169, v200, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v170;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v170 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * j);
          objc_msgSend(v27, "logicalDeviceID", v110, v111);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "isProxyGroupPlayer") && objc_msgSend(v28, "length"))
            objc_msgSend(v22, "addObject:", v28);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v169, v200, 16);
      }
      while (v24);
    }

    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    v29 = v23;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v165, v199, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v166;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v166 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * k);
          objc_msgSend(v33, "uid", v110);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          MRComputeBaseRouteUID();
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "logicalDeviceID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35
            && (objc_msgSend(v33, "isProxyGroupPlayer") & 1) == 0
            && (!objc_msgSend(v36, "length") || (objc_msgSend(v22, "containsObject:", v36) & 1) == 0))
          {
            objc_msgSend(v119, "addObject:", v35);
          }

        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v165, v199, 16);
      }
      while (v30);
    }

  }
  else
  {
    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    v22 = v16;
    v37 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v161, v198, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v162;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v162 != v38)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * m), "uid", v110, v111);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          MRComputeBaseRouteUID();
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            objc_msgSend(v119, "addObject:", v41);

        }
        v37 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v161, v198, 16);
      }
      while (v37);
    }
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  obj = v16;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v197, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v158;
    while (2)
    {
      for (n = 0; n != v42; ++n)
      {
        if (*(_QWORD *)v158 != v43)
          objc_enumerationMutation(obj);
        v45 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * n);
        objc_msgSend(v45, "uid", v110);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        MRComputeBaseRouteUID();
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v47)
        {
          MCLogCategoryDefault();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v45;
            _os_log_impl(&dword_1AA991000, v49, OS_LOG_TYPE_DEFAULT, "Found picked device with nil UID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          v48 = 0;
          goto LABEL_62;
        }

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v197, 16);
      if (v42)
        continue;
      break;
    }
  }
  v48 = 1;
LABEL_62:

  v50 = objc_alloc(MEMORY[0x1E0C99E20]);
  v51 = (void *)objc_msgSend(v50, "initWithCapacity:", objc_msgSend((id)v185[5], "count"));
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v52 = (id)v185[5];
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v153, v196, 16);
  if (v53)
  {
    v125 = 0;
    v54 = *(_QWORD *)v154;
    do
    {
      for (ii = 0; ii != v53; ++ii)
      {
        if (*(_QWORD *)v154 != v54)
          objc_enumerationMutation(v52);
        v56 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * ii);
        if (objc_msgSend(v56, "isLocalDevice", v110))
        {
          v57 = v56;

          v125 = v57;
        }
        objc_msgSend(v56, "uid");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        MRComputeBaseRouteUID();
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (v59)
        {
          objc_msgSend(v51, "addObject:", v59);
        }
        else
        {
          MCLogCategoryDefault();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v56;
            _os_log_impl(&dword_1AA991000, v60, OS_LOG_TYPE_DEFAULT, "Found discovery device with nil UID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          v48 = 0;
        }

      }
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v153, v196, 16);
    }
    while (v53);
  }
  else
  {
    v125 = 0;
  }

  -[MRUOutputDeviceRoutingDataSource _setShouldSourceOutputDevicesFromAVODDS:](v121, "_setShouldSourceOutputDevicesFromAVODDS:", (objc_msgSend((id)v185[5], "count") != 0) & v48);
  if (v121->_shouldSourceOutputDevicesFromAVODDS)
  {
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v62 = obj;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v149, v195, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v150;
      do
      {
        for (jj = 0; jj != v63; ++jj)
        {
          if (*(_QWORD *)v150 != v64)
            objc_enumerationMutation(v62);
          v66 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * jj);
          objc_msgSend(v66, "uid", v110);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          MRComputeBaseRouteUID();
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v51, "containsObject:", v68) & 1) == 0)
            objc_msgSend(v61, "addObject:", v66);

        }
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v149, v195, 16);
      }
      while (v63);
    }

    v69 = objc_msgSend(v61, "count");
    v70 = (void *)v185[5];
    if (v69)
    {
      v71 = (void *)objc_msgSend(v70, "mutableCopy");
      objc_msgSend(v71, "arrayByAddingObjectsFromArray:", v61);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_110:
      v114 = 0;
      goto LABEL_111;
    }
    v77 = v70;
LABEL_109:
    v72 = v77;
    goto LABEL_110;
  }
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v73 = obj;
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v145, v194, 16);
  if (v74)
  {
    v75 = *(_QWORD *)v146;
    while (2)
    {
      for (kk = 0; kk != v74; ++kk)
      {
        if (*(_QWORD *)v146 != v75)
          objc_enumerationMutation(v73);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * kk), "isLocalDevice", v110) & 1) != 0)
        {
          v114 = 1;
          goto LABEL_101;
        }
      }
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v145, v194, 16);
      if (v74)
        continue;
      break;
    }
  }
  v114 = 0;
LABEL_101:

  v78 = v73;
  v61 = v78;
  if (v125)
    v79 = v114;
  else
    v79 = 1;
  if ((v79 & 1) == 0)
  {
    objc_msgSend(v78, "arrayByAddingObject:");
    v77 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_109;
  }
  v72 = v78;
LABEL_111:
  v80 = objc_alloc(MEMORY[0x1E0C99E08]);
  v81 = (void *)objc_msgSend(v80, "initWithCapacity:", objc_msgSend((id)v185[5], "count"));
  v82 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v83 = (void *)objc_msgSend(v82, "initWithCapacity:", objc_msgSend((id)v185[5], "count"));
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v123 = v72;
  v84 = 0;
  v85 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v141, v193, 16);
  if (!v85)
    goto LABEL_125;
  v86 = *(_QWORD *)v142;
  do
  {
    for (mm = 0; mm != v85; ++mm)
    {
      if (*(_QWORD *)v142 != v86)
        objc_enumerationMutation(v123);
      v88 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * mm);
      objc_msgSend(v88, "logicalDeviceID", v110);
      v89 = objc_claimAutoreleasedReturnValue();
      v90 = (void *)v89;
      if ((v84 & 1) != 0)
      {
        v84 = 1;
        if (!v89)
          goto LABEL_122;
      }
      else
      {
        v84 = objc_msgSend(v88, "isPickedOnPairedDevice");
        if (!v90)
        {
LABEL_122:
          objc_msgSend(v83, "addObject:", v88);
          goto LABEL_123;
        }
      }
      objc_msgSend(v81, "objectForKey:", v90);
      v91 = (id)objc_claimAutoreleasedReturnValue();
      if (!v91)
      {
        v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v81, "setObject:forKey:", v91, v90);
      }
      objc_msgSend(v91, "addObject:", v88);

LABEL_123:
    }
    v85 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v141, v193, 16);
  }
  while (v85);
LABEL_125:

  v92 = v113;
  v93 = v92;
  if (v92)
    v94 = objc_msgSend(v92, "isDeviceRoute");
  else
    v94 = 1;

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v191 = 0x2020000000;
  v192 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_14;
  aBlock[3] = &unk_1E581BC38;
  aBlock[4] = v121;
  v138 = v94;
  v139 = v84;
  p_buf = &buf;
  v137 = v110;
  v120 = v119;
  v134 = v120;
  v140 = v114;
  v95 = v112;
  v135 = v95;
  v96 = _Block_copy(aBlock);
  serialQueue = v121->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_3;
  block[3] = &unk_1E581BCA0;
  block[4] = v121;
  v98 = v95;
  v127 = v98;
  v99 = v81;
  v128 = v99;
  v100 = v96;
  v131 = v100;
  v101 = v83;
  v129 = v101;
  v115 = v111;
  v130 = v115;
  v132 = v94;
  dispatch_sync(serialQueue, block);
  v102 = -[MPAVRoutingDataSource filterMode](v121, "filterMode");
  switch(v102)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_20);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "filteredArrayUsingPredicate:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v104, "mutableCopy");
LABEL_134:
      v106 = (void *)v105;

      goto LABEL_136;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_22);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "filteredArrayUsingPredicate:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v104, "mutableCopy");
      goto LABEL_134;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_21);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "filteredArrayUsingPredicate:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v104, "mutableCopy");
      goto LABEL_134;
  }
  v106 = v98;
LABEL_136:
  -[MRUOutputDeviceRoutingDataSource addHearingAidRouteIfNeededToRoutes:](v121, "addHearingAidRouteIfNeededToRoutes:", v106, v110);
  v107 = v130;
  v108 = v106;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v184, 8);

  return v108;
}

void __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
  objc_msgSend(*(id *)(a1 + 40), "endpointObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableOutputDevicesForEndpoint:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsMultipleSelection") & 1) == 0)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_2;
    v22[3] = &unk_1E581BC10;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v3, "sortedArrayUsingComparator:", v22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC22F8]), "initWithOutputDevices:", v4);
  v8 = v7;
  if (*(_BYTE *)(a1 + 72)
    || (objc_msgSend(v7, "isDeviceRoute") & 1) == 0 && objc_msgSend(v8, "isSmartAudio"))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 128))
    {
      if (*(_BYTE *)(a1 + 73))
      {
        v9 = objc_msgSend(v8, "isPickedOnPairedDevice");
      }
      else if (*(_QWORD *)(a1 + 64)
             || !objc_msgSend(v8, "isDeviceRoute")
             || (v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), *(_BYTE *)(v10 + 24)))
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v8, "outputDevices", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "uid");
              v16 = objc_claimAutoreleasedReturnValue();
              MRComputeBaseRouteUID();
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              LOBYTE(v16) = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v17);
              if ((v16 & 1) != 0)
              {

                goto LABEL_25;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
            if (v13)
              continue;
            break;
          }
        }

        v9 = 0;
      }
      else
      {
        v9 = 1;
        *(_BYTE *)(v10 + 24) = 1;
      }
    }
    else if (objc_msgSend(v8, "isDeviceRoute"))
    {
      v9 = *(_BYTE *)(a1 + 74) != 0;
    }
    else
    {
LABEL_25:
      v9 = 1;
    }
    objc_msgSend(v8, "setPicked:", v9);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  }

}

uint64_t __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(a2, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRComputeBaseRouteUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MRComputeBaseRouteUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
  v11 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9);
  if (!v10 || v11)
  {
    if ((v10 | v11 ^ 1) == 1)
      v12 = objc_msgSend(v7, "compare:", v9);
    else
      v12 = 1;
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

void __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v10 = objc_alloc(MEMORY[0x1E0CC22F8]);
        v48 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithOutputDevices:", v11);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v6);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "objectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v15);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = *(id *)(a1 + 56);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(a1 + 72);
        v45 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1, (_QWORD)v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v20);
  }

  v25 = *(void **)(a1 + 64);
  if (v25)
  {
    v26 = v25;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activeAudioCategory");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;
  if (*(_BYTE *)(a1 + 80) && objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0C89698]))
  {
    v28 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_39);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "filterUsingPredicate:", v29);

  }
  v30 = objc_msgSend(*(id *)(a1 + 40), "copy", (_QWORD)v33);
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(v31 + 120);
  *(_QWORD *)(v31 + 120) = v30;

}

BOOL __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "routeSubtype") != 1;
}

uint64_t __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isTVRoute") & 1) != 0 || (objc_msgSend(v2, "isAppleTVRoute") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "containsDeviceWithSubtype:", 18) ^ 1;

  return v3;
}

uint64_t __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSmartAudio");
}

uint64_t __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isTVRoute") & 1) != 0 || (objc_msgSend(v2, "isAppleTVRoute") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "containsDeviceWithSubtype:", 18);

  return v3;
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD block[5];
  id v50;
  id v51;
  id v52;
  dispatch_queue_t v53;
  id v54;
  id v55;
  _QWORD aBlock[5];
  id v57;
  id v58;
  id location;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a4;
  v9 = a5;
  -[MRUOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    objc_msgSend(v10, "outputDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke;
    aBlock[3] = &unk_1E581BD70;
    v36 = &v58;
    objc_copyWeak(&v58, &location);
    aBlock[4] = self;
    v13 = v9;
    v57 = v13;
    v39 = _Block_copy(aBlock);
    dispatch_get_global_queue(21, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outputDevices");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUOutputDeviceRoutingDataSource endpointRoute](self, "endpointRoute");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && (-[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint", &v58, v37, v38),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isLocalEndpoint"),
          v17,
          v16,
          (v18 & 1) == 0))
    {
      if (self->_supportsQueueHandoff
        || (objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            -[MRUOutputDeviceRoutingDataSource presentingAppBundleID](self, "presentingAppBundleID"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = objc_msgSend(v30, "activeActivityExistsForBundle:", v31),
            v31,
            v30,
            v32))
      {
        -[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "outputDevices");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "migrateToOrSetOutputDevices:initiator:withReplyQueue:completion:", v33, self->_initiator, v14, v39);

      }
      else
      {
        -[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "outputDevices");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setOutputDevices:initiator:withReplyQueue:completion:", v35, self->_initiator, v14, v39);

      }
    }
    else if (v42)
    {
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_3;
      block[3] = &unk_1E581BDE8;
      v55 = v39;
      block[4] = self;
      v50 = v38;
      v51 = v42;
      v52 = v37;
      v53 = v14;
      v54 = v10;
      dispatch_async(v53, block);

      v19 = v55;
    }
    else
    {
      if (!v13)
      {
LABEL_29:

        objc_destroyWeak(v36);
        objc_destroyWeak(&location);

        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CC1CE8], 5, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v13 + 2))(v13, v19);
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v42;
    if (v42)
    {
      v40 = v8;
      objc_msgSend(v40, "endpointWrapper");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "unwrappedValue");
      v22 = (void *)MRAVEndpointCopyOutputDevices();

      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v24 = v22;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v46 != v26)
              objc_enumerationMutation(v24);
            v28 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
            MRComputeBaseRouteUID();
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
              objc_msgSend(v23, "addObject:", v29);

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
        }
        while (v25);
      }

      MRAVReconnaissanceSessionCreateWithEndpointFeatures();
      v43 = v42;
      v44 = v9;
      MRAVReconnaissanceSessionBeginSearch();

      goto LABEL_30;
    }
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CC1CE8], 5, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v34);

LABEL_30:
      v20 = v42;
    }
  }
  else
  {
    v20 = v42;
    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = WeakRetained;
  msv_dispatch_on_main_queue();

}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0CC1CF0], *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && !*(_QWORD *)(a1 + 48))
  {
    +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "donatingAppBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v2, v4, objc_msgSend(*(id *)(a1 + 40), "isDonatingAppEligible"), CFSTR("setPickedRoute"));

  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 48));

}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD aBlock[4];
  id v9;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_4;
  aBlock[3] = &unk_1E581BD98;
  v9 = *(id *)(a1 + 80);
  v2 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_detachableDevicesInOutputDevices:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "unwrappedValue");
    v7 = v2;
    v5 = v3;
    v6 = *(id *)(a1 + 64);
    MRAVOutputContextSetOutputDevicesWithInitiator();

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 72), "isDeviceSpeakerRoute"))
    {
      objc_msgSend(*(id *)(a1 + 32), "predictedDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        objc_msgSend(*(id *)(a1 + 32), "_resetPredictedOutputDevice");
    }
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "unwrappedValue");
    MRAVOutputContextSetOutputDevicesWithInitiator();
  }

}

uint64_t __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "createGroupFromOutputDevices:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "unwrappedValue");
    dispatch_get_global_queue(21, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(a1 + 48);
    MRAVOutputContextSetOutputDevicesWithInitiator();

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));

}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    MCLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = a2;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_ERROR, "picked endpoint route, set devices: %{public}@", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(id *)(a1 + 40);
    MRAVEndpointUpdateActiveSystemEndpointWithReason();

  }
}

uint64_t __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_32(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    MCLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = a2;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_ERROR, "picked endpoint route, clear system endpoint: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", *MEMORY[0x1E0CC1CF0], *(_QWORD *)(a1 + 32));
    -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], *(_QWORD *)(a1 + 32));
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)createGroupFromOutputDevices:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "uid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  v17 = (void *)MEMORY[0x1E0D4C4D0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__MRUOutputDeviceRoutingDataSource_createGroupFromOutputDevices_queue_completion___block_invoke;
  v19[3] = &unk_1E581BE88;
  v20 = v9;
  v18 = v9;
  objc_msgSend(v17, "createEndpointWithOutputDeviceUIDs:queue:completion:", v10, v8, v19);

}

uint64_t __82__MRUOutputDeviceRoutingDataSource_createGroupFromOutputDevices_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addRouteToGroup:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUOutputDeviceRoutingDataSource addRoutesToGroup:completion:](self, "addRoutesToGroup:completion:", v9, v7, v10, v11);
}

- (void)addRoutesToGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  MRUOutputDeviceRoutingDataSource *v22;
  id v23;

  v6 = a4;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __64__MRUOutputDeviceRoutingDataSource_addRoutesToGroup_completion___block_invoke;
  v21 = &unk_1E581BEB0;
  v22 = self;
  v7 = v6;
  v23 = v7;
  v8 = a3;
  v9 = _Block_copy(&v18);
  -[MRUOutputDeviceRoutingDataSource outputDevicesForRoutes:](self, "outputDevicesForRoutes:", v8, v18, v19, v20, v21, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  LODWORD(v10) = -[MRUOutputDeviceRoutingDataSource _shouldAddPredictedDeviceToOuputDevices:](self, "_shouldAddPredictedDeviceToOuputDevices:", v8);
  if ((_DWORD)v10)
  {
    -[MRUOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  dispatch_get_global_queue(21, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_supportsQueueHandoff
    || (objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MRUOutputDeviceRoutingDataSource presentingAppBundleID](self, "presentingAppBundleID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v14, "activeActivityExistsForBundle:", v15),
        v15,
        v14,
        v16))
  {
    -[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "migrateToOrAddOutputDevices:initiator:withReplyQueue:completion:", v11, self->_initiator, v13, v9);
  }
  else
  {
    -[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addOutputDevices:initiator:withReplyQueue:completion:", v11, self->_initiator, v13, v9);
  }

}

void __64__MRUOutputDeviceRoutingDataSource_addRoutesToGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0CC1CF0], *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && v4)
  {
    +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "donatingAppBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v4, v6, objc_msgSend(*(id *)(a1 + 32), "isDonatingAppEligible"), CFSTR("addRoutesToGroup"));

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (void)removeRouteFromGroup:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUOutputDeviceRoutingDataSource removeRoutesFromGroup:completion:](self, "removeRoutesFromGroup:completion:", v9, v7, v10, v11);
}

- (void)removeRoutesFromGroup:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  unint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  MRUOutputDeviceRoutingDataSource *v25;
  void *v26;
  void *v27;
  void (**v28)(id, _QWORD);
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[5];
  void (**v39)(id, _QWORD);
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[MRUOutputDeviceRoutingDataSource outputDevicesForRoutes:](self, "outputDevicesForRoutes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRUOutputDeviceRoutingDataSource _isRemovingPredictedDevice:](self, "_isRemovingPredictedDevice:", v7))
  {
    -[MRUOutputDeviceRoutingDataSource _resetPredictedOutputDevice](self, "_resetPredictedOutputDevice");
    v6[2](v6, 0);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke;
    aBlock[3] = &unk_1E581BE10;
    aBlock[4] = self;
    v28 = v6;
    v39 = v6;
    v8 = _Block_copy(aBlock);
    dispatch_get_global_queue(21, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = v7;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v11)
    {
      v24 = v8;
      v25 = self;
      v26 = v7;
      v12 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "uid", v24, v25, v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "designatedGroupLeader");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "isEqualToString:", v17);

          if (v18)
          {
            v11 = v14;
            goto LABEL_13;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v11)
          continue;
        break;
      }
LABEL_13:
      self = v25;
      v7 = v26;
      v8 = v24;
    }

    v19 = (void *)objc_msgSend(v10, "mutableCopy");
    v20 = objc_msgSend(v10, "count");
    if (v11 && v20 >= 2)
      objc_msgSend(v19, "removeObject:", v11);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_3;
    block[3] = &unk_1E581BF00;
    block[4] = self;
    v30 = v19;
    v31 = v27;
    v32 = v10;
    v33 = v8;
    v21 = v8;
    v22 = v27;
    v23 = v19;
    dispatch_async(v22, block);

    v6 = v28;
  }

}

void __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!a2 && v5)
  {
    +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "donatingAppBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v6, v8, objc_msgSend(*(id *)(a1 + 32), "isDonatingAppEligible"), CFSTR("removeRoutesFromGroup"));

  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v11 = v9;
    v10 = v4;
    msv_dispatch_on_main_queue();

  }
}

uint64_t __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1[4], "endpointRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointWrapper");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "unwrappedValue");
  v4 = a1[7];
  v5 = a1[6];
  v6 = a1[8];
  MRAVEndpointRemoveOutputDevicesWithInitiator();

}

void __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0CC1CF0], *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_detachableDevicesInOutputDevices:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 || !objc_msgSend(v4, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "createGroupFromOutputDevices:queue:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (BOOL)routeIsLeaderOfEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v4, "isGroupLeader")
    && (-[MRUOutputDeviceRoutingDataSource endpointRoute](self, "endpointRoute"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    -[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outputDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "outputDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v9, "intersectsSet:", v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_endpointsDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:", v6, self);
}

- (void)_outputDevicesDidChangeNotification:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], self);

}

- (void)_routeStatusDidChangeNotification:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v17 = objc_alloc_init(v4);
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CD98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("RouteUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CDA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource _outputDeviceRouteWithUID:](self, "_outputDeviceRouteWithUID:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    objc_msgSend(v17, "setObject:forKey:", v10, *MEMORY[0x1E0CC1D08]);
    v13 = objc_msgSend(v9, "integerValue");
    if ((unint64_t)(v13 - 2) <= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CC1CE8], v13, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v17, "setObject:forKey:", v14, *MEMORY[0x1E0CC1CF8]);

      }
    }
  }
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:", *MEMORY[0x1E0CC1D00], self, v17);

  }
}

- (id)outputDevicesForRoutes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "outputDevices", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_detachableDevicesInOutputDevices:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "msv_filter:", &__block_literal_global_44_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRUOutputDeviceRoutingDataSource _shouldDetachOutputDevicesToGroup:](self, "_shouldDetachOutputDevicesToGroup:", v4))
  {
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

uint64_t __70__MRUOutputDeviceRoutingDataSource__detachableDevicesInOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEligibleForWHAPlayback");
}

- (BOOL)_shouldDetachOutputDevicesToGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_detachesRoutesToGroup)
  {
    -[MRUOutputDeviceRoutingDataSource endpointRoute](self, "endpointRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpointWrapper");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "unwrappedValue");
    MRAVEndpointGetDesignatedGroupLeader();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "containsObject:", v7) & 1) == 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        v12 = 1;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v12 &= objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "isGroupable", (_QWORD)v16);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);

        if ((v12 & 1) == 0)
          goto LABEL_11;
      }
      else
      {

      }
      v14 = (unint64_t)objc_msgSend(v8, "count", (_QWORD)v16) > 1;
      goto LABEL_15;
    }
LABEL_11:
    v14 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (BOOL)_shouldAddPredictedDeviceToOuputDevices:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");

  if (v6 == 1)
    v7 = objc_msgSend(v5, "isSplitterCapable");
  else
    v7 = 0;
  -[MRUOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsBluetoothSharing");

  objc_msgSend(v5, "routeUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v7)
    v14 = v9 & (v13 ^ 1);
  else
    v14 = 0;

  return v14;
}

- (BOOL)_isRemovingPredictedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_globalAudioSessionLock
{
  if (_globalAudioSessionLock___once != -1)
    dispatch_once(&_globalAudioSessionLock___once, &__block_literal_global_45);
  return (id)_globalAudioSessionLock___globalAudioSessionLock;
}

void __59__MRUOutputDeviceRoutingDataSource__globalAudioSessionLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)_globalAudioSessionLock___globalAudioSessionLock;
  _globalAudioSessionLock___globalAudioSessionLock = (uint64_t)v0;

}

- (void)_registerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__outputDevicesDidChangeNotification_, *MEMORY[0x1E0D4C690], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__routeStatusDidChangeNotification_, *MEMORY[0x1E0D4CDA0], 0);

}

- (void)_unregisterNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4C690], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4CDA0], 0);

}

- (void)_personalRoutesDidChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], self);

}

- (void)_outputDevicesDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0CC1D10], self);

}

- (id)_outputDeviceRouteWithUID:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MRUOutputDeviceRoutingDataSource__outputDeviceRouteWithUID___block_invoke;
  block[3] = &unk_1E581BB70;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__MRUOutputDeviceRoutingDataSource__outputDeviceRouteWithUID___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
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
  v2 = *(id *)(a1[4] + 120);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "routeUID", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

        if (v9)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_setShouldSourceOutputDevicesFromAVODDS:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  if (self->_shouldSourceOutputDevicesFromAVODDS != a3)
  {
    v3 = a3;
    self->_shouldSourceOutputDevicesFromAVODDS = a3;
    MCLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v9 = 0;
        v6 = "Output device UIDs determined to be available. Output devices from AVODDS will no longer be ignored.";
        v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else if (v5)
    {
      v8 = 0;
      v6 = "Output device UIDs determined to be unavailable. Output devices from AVODDS will be ignored.";
      v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }

  }
}

- (void)_onDiscoverySessionQueue_generateDiscoverySession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  -[MRUOutputDeviceRoutingDataSource endpoint](self, "endpoint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isCompanionEndpoint"))
  {
    -[MRUOutputDeviceRoutingDataSource discoverySessionConfiguration](self, "discoverySessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D4C500];
    -[MRUOutputDeviceRoutingDataSource discoverySessionConfiguration](self, "discoverySessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
  }
  objc_msgSend(v4, "discoverySessionWithConfiguration:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setDiscoverySession:](self, "setDiscoverySession:", v6);

}

- (void)_generateDiscoverySession
{
  NSObject *discoverySessionQueue;
  _QWORD block[5];

  discoverySessionQueue = self->_discoverySessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRUOutputDeviceRoutingDataSource__generateDiscoverySession__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(discoverySessionQueue, block);
}

uint64_t __61__MRUOutputDeviceRoutingDataSource__generateDiscoverySession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDiscoverySessionQueue_generateDiscoverySession");
}

- (void)_onDiscoverySessionQueue_generateCompanionDiscoverySession
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C508]), "initWithEndpointFeatures:", 8);
  objc_msgSend(MEMORY[0x1E0D4C500], "discoverySessionWithConfiguration:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setCompanionDiscoverySession:](self, "setCompanionDiscoverySession:", v3);

}

- (void)_resetPredictedOutputDevice
{
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  MCLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "Reset predicted outputDevice", v6, 2u);
  }

  -[MRUOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "unwrappedValue");
  MRAVOutputContextResetPredictedOutputDevice();
  -[MRAVRoutingDiscoverySession availableOutputDevices](self->_discoverySession, "availableOutputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource _outputDevicesDidChange:](self, "_outputDevicesDidChange:", v5);

}

- (id)_stateDumpObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = CFSTR("predictedDevice");
  -[MRUOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<NONE>");
  v18[1] = v6;
  v17[2] = CFSTR("AVOutputContext.predictedDevice");
  -[MRUOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "unwrappedValue");
  v8 = MRAVOutputContextCopyPredictedOutputDevice();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<NONE>");
  v18[2] = v10;
  v17[3] = CFSTR("AVOutputContext.outputDeviceUIDs");
  -[MRUOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "unwrappedValue");
  v12 = MRAVOutputContextCopyOutputDevices();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<NONE>");
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)addHearingAidRouteIfNeededToRoutes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  MPAVOutputDeviceRoute *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  MPAVOutputDeviceRoute *hearingDeviceRoute;
  MPAVOutputDeviceRoute *v24;
  MRUVirtualHearingAidRoute *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRUOutputDeviceRoutingDataSource hearingDeviceName](self, "hearingDeviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mediaremote"));
    v7 = v5;
    v26 = v6;
    v8 = objc_msgSend(v6, "BOOLForKey:", CFSTR("AccessibilityHearingShowVirtualRoute"));
    v9 = (uint64_t)v7;
    if (v8)
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(" Virtual"));
      v9 = objc_claimAutoreleasedReturnValue();

    }
    v27 = (void *)v9;
    v28 = v4;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = (MPAVOutputDeviceRoute *)v4;
    v11 = -[MPAVOutputDeviceRoute countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "outputDevice");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v7);

          if ((v17 & 1) != 0)
          {
            hearingDeviceRoute = self->_hearingDeviceRoute;
            self->_hearingDeviceRoute = 0;

            v22 = v26;
            v20 = v27;
            goto LABEL_17;
          }
        }
        v12 = -[MPAVOutputDeviceRoute countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v12)
          continue;
        break;
      }
    }

    -[MPAVOutputDeviceRoute outputDevice](self->_hearingDeviceRoute, "outputDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;
    v21 = objc_msgSend(v19, "isEqualToString:", v27);

    if ((v21 & 1) != 0)
    {
      v4 = v28;
      v22 = v26;
    }
    else
    {
      v25 = -[MRUVirtualHearingAidRoute initWithHearingDeviceName:]([MRUVirtualHearingAidRoute alloc], "initWithHearingDeviceName:", v27);
      v10 = self->_hearingDeviceRoute;
      self->_hearingDeviceRoute = &v25->super;
      v22 = v26;
LABEL_17:

      v4 = v28;
    }

  }
  else
  {
    v24 = self->_hearingDeviceRoute;
    self->_hearingDeviceRoute = 0;

  }
  if (self->_hearingDeviceRoute)
    objc_msgSend(v4, "addObject:");

}

- (void)hearingAidReachabilityDidChange
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MRUOutputDeviceRoutingDataSource_hearingAidReachabilityDidChange__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(v3, block);

}

void __67__MRUOutputDeviceRoutingDataSource_hearingAidReachabilityDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  nameOfHearingDeviceReachableForAudioHandoff();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v2;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "Reachable for handoff hearingDeviceName: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__MRUOutputDeviceRoutingDataSource_hearingAidReachabilityDidChange__block_invoke_74;
  v5[3] = &unk_1E5818CB0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __67__MRUOutputDeviceRoutingDataSource_hearingAidReachabilityDidChange__block_invoke_74(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setHearingDeviceName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "hearingAidDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "hearingAidDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hearingAidReachabilityDidChange");

  }
}

- (void)setApplicationOutputContext:(id)a3
{
  objc_storeStrong((id *)&self->_applicationOutputContext, a3);
}

- (void)setSupportsMultipleSelection:(BOOL)a3
{
  self->_supportsMultipleSelection = a3;
}

- (BOOL)devicePresenceDetected
{
  return self->_devicePresenceDetected;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

- (BOOL)detachesRoutesToGroup
{
  return self->_detachesRoutesToGroup;
}

- (void)setDetachesRoutesToGroup:(BOOL)a3
{
  self->_detachesRoutesToGroup = a3;
}

- (BOOL)supportsQueueHandoff
{
  return self->_supportsQueueHandoff;
}

- (void)setSupportsQueueHandoff:(BOOL)a3
{
  self->_supportsQueueHandoff = a3;
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void)setPresentingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)nowPlayingAppBundleID
{
  return self->_nowPlayingAppBundleID;
}

- (void)setNowPlayingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setVisibleMediaApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)donatingAppBundleID
{
  return self->_donatingAppBundleID;
}

- (void)setDonatingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isDonatingAppEligible
{
  return self->_donatingAppEligible;
}

- (void)setDonatingAppEligible:(BOOL)a3
{
  self->_donatingAppEligible = a3;
}

- (NSString)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_initiator, a3);
}

- (MRUOutputDeviceRoutingDataSourceObserver)hearingAidDelegate
{
  return (MRUOutputDeviceRoutingDataSourceObserver *)objc_loadWeakRetained((id *)&self->_hearingAidDelegate);
}

- (void)setHearingAidDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hearingAidDelegate, a3);
}

- (MRAVRoutingDiscoverySession)companionDiscoverySession
{
  return self->_companionDiscoverySession;
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (MPAVOutputDeviceRoute)hearingDeviceRoute
{
  return self->_hearingDeviceRoute;
}

- (void)setHearingDeviceRoute:(id)a3
{
  objc_storeStrong((id *)&self->_hearingDeviceRoute, a3);
}

- (BOOL)subscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hearingDeviceRoute, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_companionDiscoverySession, 0);
  objc_destroyWeak((id *)&self->_hearingAidDelegate);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_donatingAppBundleID, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_nowPlayingAppBundleID, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_hearingDeviceName, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_storeStrong((id *)&self->_predictedDevice, 0);
  objc_storeStrong((id *)&self->_applicationOutputContext, 0);
  objc_storeStrong((id *)&self->_outputDeviceRoutes, 0);
  objc_storeStrong(&self->_callbackToken, 0);
  objc_storeStrong(&self->_companionCallbackToken, 0);
  objc_storeStrong((id *)&self->_discoverySessionQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
