@implementation MRAVConcreteRoutingDiscoverySession

BOOL __76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceType") == 3;
}

void __50__MRAVConcreteRoutingDiscoverySession_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  MRMediaRemoteEndpointFeaturesDescription(*(_DWORD *)(v4 + 160));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 164));
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p> (%@ - %@)"), v3, v4, v9, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

MRAVConcreteOutputDevice *__76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  MRAVConcreteOutputDevice *v4;
  _BOOL4 IsAVOutputDeviceLocal;

  v3 = a2;
  v4 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:]([MRAVConcreteOutputDevice alloc], "initWithAVOutputDevice:sourceInfo:", v3, *(_QWORD *)(a1 + 32));
  IsAVOutputDeviceLocal = MROutputDeviceIsAVOutputDeviceLocal(v3);

  if (IsAVOutputDeviceLocal)
    -[MRAVConcreteOutputDevice setAirPlayGroupID:](v4, "setAirPlayGroupID:", *(_QWORD *)(a1 + 40));
  return v4;
}

void __65__MRAVConcreteRoutingDiscoverySession_setAvailableOutputDevices___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 40));
}

uint64_t __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 192) = 0;
  return result;
}

void __76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

uint64_t __52__MRAVConcreteRoutingDiscoverySession_discoveryMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 164);
  return result;
}

void __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 136);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke_3;
  block[3] = &unk_1E30C5CA8;
  block[4] = v2;
  dispatch_sync(v3, block);
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reload");
}

- (void)_availableOutputDevicesDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  _MRLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MRAVConcreteRoutingDiscoverySession _availableOutputDevicesDidChangeNotification:].cold.1((uint64_t)v4, v5);

  -[MRAVConcreteRoutingDiscoverySession _scheduleAvailableOutputDevicesReload](self, "_scheduleAvailableOutputDevicesReload");
}

- (void)_scheduleAvailableOutputDevicesReload
{
  msv_dispatch_sync_on_queue();
}

- (void)_onQueue_reload
{
  void *v3;
  id v4;

  -[MRAVConcreteRoutingDiscoverySession _onQueue_reloadAvailableOutputDevices](self, "_onQueue_reloadAvailableOutputDevices");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteRoutingDiscoverySession setAvailableOutputDevices:](self, "setAvailableOutputDevices:", v4);
  -[MRAVConcreteRoutingDiscoverySession availableOutputDevices](self, "availableOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVRoutingDiscoverySession notifyOutputDevicesChanged:](self, "notifyOutputDevicesChanged:", v3);

}

- (NSArray)availableOutputDevices
{
  NSObject *serialQueue;
  uint64_t v4;
  void *v5;
  NSObject *reloadQueue;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__53;
  v17 = __Block_byref_object_dispose__53;
  v18 = 0;
  serialQueue = self->_serialQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke;
  block[3] = &unk_1E30C5D20;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(serialQueue, block);
  v5 = (void *)v14[5];
  if (!v5)
  {
    reloadQueue = self->_reloadQueue;
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke_2;
    v11[3] = &unk_1E30C5CA8;
    v11[4] = self;
    dispatch_sync(reloadQueue, v11);
    v7 = self->_serialQueue;
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke_3;
    v10[3] = &unk_1E30C5D20;
    v10[4] = self;
    v10[5] = &v13;
    dispatch_sync(v7, v10);
    v5 = (void *)v14[5];
  }
  v8 = v5;
  _Block_object_dispose(&v13, 8);

  return (NSArray *)v8;
}

- (void)setAvailableOutputDevices:(id)a3
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
  block[2] = __65__MRAVConcreteRoutingDiscoverySession_setAvailableOutputDevices___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (unsigned)discoveryMode
{
  NSObject *serialQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__MRAVConcreteRoutingDiscoverySession_discoveryMode__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_onQueue_reloadAvailableOutputDevices
{
  NSObject *serialQueue;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  MRAVOutputDeviceSourceInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  MRAVOutputDeviceSourceInfo *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  MRAVOutputDeviceSourceInfo *v21;
  id v22;
  _QWORD block[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_reloadQueue);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__53;
  v28 = __Block_byref_object_dispose__53;
  v29 = 0;
  serialQueue = self->_serialQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke;
  block[3] = &unk_1E30C5D20;
  block[4] = self;
  block[5] = &v24;
  dispatch_sync(serialQueue, block);
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)v25[5], "availableOutputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  objc_msgSend((Class)getAVOutputDeviceClass_1[0](), "sharedLocalDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

  v9 = self->_routingContextUID;
  if (!v9)
  {
    objc_msgSend((id)v25[5], "targetAudioSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "routingContextUID");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_112);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:]([MRAVOutputDeviceSourceInfo alloc], "initWithRoutingContextUID:multipleBuiltInDevices:", v9, (unint64_t)objc_msgSend(v11, "count") > 1);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRDeviceInfoRequest cachedDeviceInfoForOrigin:](MRDeviceInfoRequest, "cachedDeviceInfoForOrigin:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "airPlayGroupUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke_3;
  v20[3] = &unk_1E30D0470;
  v16 = v12;
  v21 = v16;
  v17 = v15;
  v22 = v17;
  objc_msgSend(v7, "msv_compactMap:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v24, 8);
  return v18;
}

- (NSArray)availableEndpoints
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

uint64_t __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reload");
}

void __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 192))
  {
    *(_BYTE *)(v1 + 192) = 1;
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke_2;
    block[3] = &unk_1E30C5CA8;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

- (id)description
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
  v7 = __Block_byref_object_copy__53;
  v8 = __Block_byref_object_dispose__53;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteRoutingDiscoverySession setDiscoveryMode:forClientIdentifiers:](self, "setDiscoveryMode:forClientIdentifiers:", v3, v5);

}

void __77__MRAVConcreteRoutingDiscoverySession_setDiscoveryMode_forClientIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  CFStringRef v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  CFStringRef v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 164);
  v4 = *(_DWORD *)(a1 + 48);
  v5 = objc_msgSend(*(id *)(a1 + 40), "isEqualToSet:", *(_QWORD *)(v2 + 208));
  if (v3 != v4 || (v5 & 1) == 0)
  {
    if (v3 != v4)
    {
      _MRLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(a1 + 48));
        v13 = 138412546;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[AVDiscoverySession] %@ - Discovery mode changed to: %@", (uint8_t *)&v13, 0x16u);
      }

    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 164) = *(_DWORD *)(a1 + 48);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v10 = *(_DWORD *)(a1 + 48) - 1;
    if (v10 > 2)
      v11 = 0;
    else
      v11 = qword_193ADAC60[v10];
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDiscoveryMode:forClientIdentifiers:", v11, v12);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
  }
}

- (void)setDiscoveryMode:(unsigned int)a3 forClientIdentifiers:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MRAVConcreteRoutingDiscoverySession_setDiscoveryMode_forClientIdentifiers___block_invoke;
  block[3] = &unk_1E30C7610;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(serialQueue, block);

}

- (MRAVConcreteRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  id v4;
  MRAVConcreteRoutingDiscoverySession *v5;
  uint64_t v6;
  NSString *routingContextUID;
  objc_class *v8;
  const char *Name;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  id v13;
  objc_class *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *reloadQueue;
  uint64_t v20;
  AVOutputDeviceDiscoverySession *avDiscoverySession;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[4];
  MRAVConcreteRoutingDiscoverySession *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MRAVConcreteRoutingDiscoverySession;
  v5 = -[MRAVRoutingDiscoverySession initWithConfiguration:](&v29, sel_initWithConfiguration_, v4);
  if (v5)
  {
    v5->_endpointFeatures = objc_msgSend(v4, "features");
    objc_msgSend(v4, "routingContextUID");
    v6 = objc_claimAutoreleasedReturnValue();
    routingContextUID = v5->_routingContextUID;
    v5->_routingContextUID = (NSString *)v6;

    v5->_discoveryMode = 0;
    v5->_targetAudioSessionID = 0;
    v5->_clientProvidedTargetAudioSessionID = objc_msgSend(v4, "targetAudioSessionID");
    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(Name, v10);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = (objc_class *)objc_opt_class();
    v15 = objc_retainAutorelease((id)objc_msgSend(v13, "initWithFormat:", CFSTR("%s.reloadQueue"), class_getName(v14)));
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    reloadQueue = v5->_reloadQueue;
    v5->_reloadQueue = (OS_dispatch_queue *)v18;

    v20 = objc_msgSend(objc_alloc((Class)getAVOutputDeviceDiscoverySessionClass_0[0]()), "initWithDeviceFeatures:", v5->_endpointFeatures & 0xF);
    avDiscoverySession = v5->_avDiscoverySession;
    v5->_avDiscoverySession = (AVOutputDeviceDiscoverySession *)v20;

    if (v5->_clientProvidedTargetAudioSessionID)
    {
      v22 = v5->_serialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__MRAVConcreteRoutingDiscoverySession_initWithConfiguration___block_invoke;
      block[3] = &unk_1E30C5CA8;
      v28 = v5;
      dispatch_async(v22, block);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    getAVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification_0[0]();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v5, sel__availableOutputDevicesDidChangeNotification_, v24, v5->_avDiscoverySession);

    getAVOutputContextOutputDeviceDidChangeNotification_0[0]();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v5, sel__availableOutputDevicesDidChangeNotification_, v25, 0);

    objc_msgSend(v23, "addObserver:selector:name:object:", v5, sel__deviceInfoDidChange_, CFSTR("kMRDeviceInfoDidChangeNotification"), 0);
  }

  return v5;
}

- (BOOL)devicePresenceDetected
{
  void *v2;
  BOOL v3;

  -[MRAVConcreteRoutingDiscoverySession availableOutputDevices](self, "availableOutputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

void __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReportedClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_virtualOutputDevices, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_avDiscoverySession, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

uint64_t __61__MRAVConcreteRoutingDiscoverySession_initWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_setTargetAudioSessionID:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 172));
}

- (unsigned)endpointFeatures
{
  return self->_endpointFeatures;
}

- (BOOL)onlyDiscoversBluetoothDevices
{
  return -[AVOutputDeviceDiscoverySession onlyDiscoversBluetoothDevices](self->_avDiscoverySession, "onlyDiscoversBluetoothDevices");
}

- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3
{
  -[AVOutputDeviceDiscoverySession setOnlyDiscoversBluetoothDevices:](self->_avDiscoverySession, "setOnlyDiscoversBluetoothDevices:", a3);
}

- (NSSet)lastReportedClientIdentifiers
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
  v9 = __Block_byref_object_copy__53;
  v10 = __Block_byref_object_dispose__53;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__MRAVConcreteRoutingDiscoverySession_lastReportedClientIdentifiers__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __68__MRAVConcreteRoutingDiscoverySession_lastReportedClientIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unsigned)targetAudioSessionID
{
  NSObject *serialQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MRAVConcreteRoutingDiscoverySession_targetAudioSessionID__block_invoke;
  v5[3] = &unk_1E30C5F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__MRAVConcreteRoutingDiscoverySession_targetAudioSessionID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 168);
  if (!v3)
  {
    objc_msgSend(*(id *)(v2 + 152), "targetAudioSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) = objc_msgSend(v4, "opaqueSessionID");

    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (void)setTargetAudioSessionID:(unsigned int)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  unsigned int v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__MRAVConcreteRoutingDiscoverySession_setTargetAudioSessionID___block_invoke;
  v4[3] = &unk_1E30C9E38;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

uint64_t __63__MRAVConcreteRoutingDiscoverySession_setTargetAudioSessionID___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 168) != v2)
  {
    *(_DWORD *)(v1 + 172) = v2;
    return objc_msgSend(*(id *)(result + 32), "_onQueue_setTargetAudioSessionID:", *(unsigned int *)(result + 40));
  }
  return result;
}

- (id)routingContextUID
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
  v9 = __Block_byref_object_copy__53;
  v10 = __Block_byref_object_dispose__53;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVConcreteRoutingDiscoverySession_routingContextUID__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__MRAVConcreteRoutingDiscoverySession_routingContextUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setRoutingContextUID:(id)a3
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
  block[2] = __60__MRAVConcreteRoutingDiscoverySession_setRoutingContextUID___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void *__60__MRAVConcreteRoutingDiscoverySession_setRoutingContextUID___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 176) != result)
  {
    v4 = objc_msgSend(result, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 176);
    *(_QWORD *)(v5 + 176) = v4;

    return (void *)objc_msgSend(*(id *)(a1 + 32), "_scheduleReload");
  }
  return result;
}

- (id)debugDescription
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
  v7 = __Block_byref_object_copy__53;
  v8 = __Block_byref_object_dispose__53;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __55__MRAVConcreteRoutingDiscoverySession_debugDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MRAVOutputDeviceSourceInfo *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  MRAVOutputDeviceSourceInfo *v15;
  _QWORD v16[4];
  MRAVOutputDeviceSourceInfo *v17;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@\n"), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  if (v7)
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v7, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("AVDiscoverySession=%@\n"), v9);

    v10 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:]([MRAVOutputDeviceSourceInfo alloc], "initWithRoutingContextUID:multipleBuiltInDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), 0);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(v11 + 152), "availableOutputDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__MRAVConcreteRoutingDiscoverySession_debugDescription__block_invoke_2;
    v16[3] = &unk_1E30D0498;
    v17 = v10;
    v15 = v10;
    objc_msgSend(v13, "msv_compactMap:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("available devices=%@\n"), v14);

  }
}

id __55__MRAVConcreteRoutingDiscoverySession_debugDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MRAVConcreteOutputDevice *v4;
  void *v5;

  v3 = a2;
  v4 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:]([MRAVConcreteOutputDevice alloc], "initWithAVOutputDevice:sourceInfo:", v3, *(_QWORD *)(a1 + 32));

  -[MRAVOutputDevice descriptor](v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_onQueue_setTargetAudioSessionID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  objc_msgSend((Class)getAVAudioSessionClass_3[0](), "retrieveSessionWithID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AVOutputDeviceDiscoverySession setTargetAudioSession:](self->_avDiscoverySession, "setTargetAudioSession:", v5);
  }
  else
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MRAVConcreteRoutingDiscoverySession _onQueue_setTargetAudioSessionID:].cold.1(v3, v6);

    -[AVOutputDeviceDiscoverySession setTargetAudioSession:](self->_avDiscoverySession, "setTargetAudioSession:", 0);
    LODWORD(v3) = 0;
  }
  self->_targetAudioSessionID = v3;
  -[MRAVConcreteRoutingDiscoverySession _scheduleReload](self, "_scheduleReload");

}

- (NSArray)virtualOutputDevices
{
  return self->_virtualOutputDevices;
}

- (void)setLastReportedClientIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedClientIdentifiers, a3);
}

- (void)_availableOutputDevicesDidChangeNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_193827000, a2, OS_LOG_TYPE_DEBUG, "[AVDiscoverySession] Output devices did change notification received. Reloading available endpoints and output devices. %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_onQueue_setTargetAudioSessionID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[AVDiscoverySession] No audio session found for ID %u. Will target active session.", (uint8_t *)v2, 8u);
}

@end
