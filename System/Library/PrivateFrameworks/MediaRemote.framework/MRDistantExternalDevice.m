@implementation MRDistantExternalDevice

+ (id)serviceInterface
{
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE306288);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getPersonalOutputDevices_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getExternalOutputContextWithCompletion_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getDeviceInfoWithCompletion_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_setSubscribedPlayerPaths_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_setListeningMode_outputDeviceUID_completion_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_setOutputDeviceVolume_outputDeviceUID_details_completion_, 2, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_adjustOutputDeviceVolume_outputDeviceUID_details_completion_, 2, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_muteOutputDeviceVolume_outputDeviceUID_details_completion_, 2, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_requestGroupSessionWithDetails_completion_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_requestGroupSessionWithDetails_completion_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_requestGroupSessionWithDetails_completion_, 1, 1);

  return v2;
}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2CF598);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_hostedExternalDeviceDeviceInfoDidChange_, 0, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7, v11[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_discoveryOutputDevicesChanged_forConfiguration_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_discoveryOutputDevicesChanged_forConfiguration_, 1, 0);

  return v2;
}

- (MRDistantExternalDevice)initWithExternalDeviceListenerEndpoint:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  MRDistantExternalDevice *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialQueue;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *workerQueue;
  MRAVDistantEndpoint *v19;
  void *v20;
  uint64_t v21;
  MRAVDistantEndpoint *distantEndpoint;
  void *v23;
  void *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MRDistantExternalDevice;
  v8 = -[MRExternalDevice _init](&v26, sel__init);
  if (v8)
  {
    v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.mediaremote.%@.serialQueue"), objc_opt_class()));
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v12;

    v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.mediaremote.%@.workerQueue"), objc_opt_class()));
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    workerQueue = v8->_workerQueue;
    v8->_workerQueue = (OS_dispatch_queue *)v17;

    v19 = [MRAVDistantEndpoint alloc];
    objc_msgSend(v7, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MRAVDistantEndpoint initWithDescriptor:](v19, "initWithDescriptor:", v20);
    distantEndpoint = v8->_distantEndpoint;
    v8->_distantEndpoint = (MRAVDistantEndpoint *)v21;

    v8->_distantEndpointLock._os_unfair_lock_opaque = 0;
    v8->_deviceNotifications = 15;
    v8->_connectionState = 3;
    v8->_connectionOptions = 0;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v6);
    -[MRDistantExternalDevice setHostedExternalDeviceConnection:](v8, "setHostedExternalDeviceConnection:", v23);

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addDistantExternalDevice:", v8);

  }
  return v8;
}

- (void)setHostedExternalDeviceConnection:(id)a3
{
  id v5;
  id *p_hostedExternalDeviceConnection;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t deviceNotifications;
  unint64_t callbacks;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  uint8_t buf[4];
  MRDistantExternalDevice *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_initWeak(&location, self);
  p_hostedExternalDeviceConnection = (id *)&self->_hostedExternalDeviceConnection;
  if (self->_hostedExternalDeviceConnection)
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v8 = *p_hostedExternalDeviceConnection;
    *(_DWORD *)buf = 138544130;
    v29 = self;
    v30 = 2114;
    v31 = CFSTR("HostedExternalDeviceConnection");
    v32 = 2112;
    v33 = v8;
    v34 = 2112;
    v35 = v5;
    v9 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
    v10 = v7;
    v11 = 42;
  }
  else
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 138543874;
    v29 = self;
    v30 = 2114;
    v31 = CFSTR("HostedExternalDeviceConnection");
    v32 = 2112;
    v33 = v5;
    v9 = "Set: %{public}@ setting %{public}@ to <%@>";
    v10 = v7;
    v11 = 32;
  }
  _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  if (v5)
  {
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __61__MRDistantExternalDevice_setHostedExternalDeviceConnection___block_invoke;
    v25[3] = &unk_1E30C6AA0;
    objc_copyWeak(&v26, &location);
    v13 = (void *)MEMORY[0x194036C44](v25);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __61__MRDistantExternalDevice_setHostedExternalDeviceConnection___block_invoke_2;
    v23[3] = &unk_1E30C6AA0;
    objc_copyWeak(&v24, &location);
    v14 = (void *)MEMORY[0x194036C44](v23);
    objc_storeStrong((id *)&self->_hostedExternalDeviceConnection, a3);
    objc_msgSend((id)objc_opt_class(), "serviceInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_hostedExternalDeviceConnection, "setRemoteObjectInterface:", v15);

    objc_msgSend((id)objc_opt_class(), "clientInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_hostedExternalDeviceConnection, "setExportedInterface:", v16);

    objc_msgSend(*p_hostedExternalDeviceConnection, "exportedInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "protocol");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRWeakProxy weakProxyWithObject:protocol:](MRWeakProxy, "weakProxyWithObject:protocol:", self, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_hostedExternalDeviceConnection, "setExportedObject:", v19);

    objc_msgSend(*p_hostedExternalDeviceConnection, "setInvalidationHandler:", v13);
    objc_msgSend(*p_hostedExternalDeviceConnection, "setInterruptionHandler:", v14);
    objc_msgSend(*p_hostedExternalDeviceConnection, "resume");
    deviceNotifications = self->_deviceNotifications;
    if (deviceNotifications)
      -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:]((uint64_t)self, deviceNotifications);
    callbacks = self->_callbacks;
    if (callbacks)
      -[MRDistantExternalDevice _updateHostedDeviceDesiredCallbacks:]((uint64_t)self, callbacks);
    if (self->_subscribedPlayerPaths)
      -[MRDistantExternalDevice setSubscribedPlayerPaths:](self, "setSubscribedPlayerPaths:");

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
  }
  else
  {
    objc_msgSend(*p_hostedExternalDeviceConnection, "invalidate");
    v22 = *p_hostedExternalDeviceConnection;
    *p_hostedExternalDeviceConnection = 0;

  }
  objc_destroyWeak(&location);

}

void __61__MRDistantExternalDevice_setHostedExternalDeviceConnection___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 1, CFSTR("xpc invalidation"));
    -[MRDistantExternalDevice _disconnectWithError:]((uint64_t)WeakRetained, v1);

  }
}

- (void)_disconnectWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__MRDistantExternalDevice__disconnectWithError___block_invoke;
    v6[3] = &unk_1E30C5F40;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __61__MRDistantExternalDevice_setHostedExternalDeviceConnection___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 1, CFSTR("xpc interruption"));
    -[MRDistantExternalDevice _disconnectWithError:]((uint64_t)WeakRetained, v1);

  }
}

- (void)_updateHostedDeviceDesiredNotifications:(uint64_t)a1
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (a1)
  {
    -[MRDistantExternalDevice _nullableHostedExternalDeviceConnection](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = *(NSObject **)(a1 + 56);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __67__MRDistantExternalDevice__updateHostedDeviceDesiredNotifications___block_invoke;
      v7[3] = &unk_1E30C78E0;
      v8 = v4;
      v9 = a2;
      dispatch_async(v6, v7);

    }
  }
}

- (void)_updateHostedDeviceDesiredCallbacks:(uint64_t)a1
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (a1)
  {
    -[MRDistantExternalDevice _nullableHostedExternalDeviceConnection](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = *(NSObject **)(a1 + 56);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __63__MRDistantExternalDevice__updateHostedDeviceDesiredCallbacks___block_invoke;
      v7[3] = &unk_1E30C78E0;
      v8 = v4;
      v9 = a2;
      dispatch_async(v6, v7);

    }
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 123);
  -[MRDistantExternalDevice _onSerialQueue_callAllPendingCompletionsWithError:]((uint64_t)self, v3);
  -[NSXPCConnection setInvalidationHandler:](self->_hostedExternalDeviceConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_hostedExternalDeviceConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_hostedExternalDeviceConnection, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDistantExternalDevice:", self);

  v6.receiver = self;
  v6.super_class = (Class)MRDistantExternalDevice;
  -[MRDistantExternalDevice dealloc](&v6, sel_dealloc);
}

- (void)_onSerialQueue_callAllPendingCompletionsWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 168), "copy");
    objc_msgSend(*(id *)(a1 + 168), "removeAllObjects");
    v5 = 0x1E0CB3000uLL;
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Calling batched completions %@"), v4);
      _MRLogForCategory(0xAuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "requestID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = CFSTR("DistantExternalDevice.connectWithOptions");
        v34 = 2114;
        v35 = v9;
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

      }
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v4;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v15 = qos_class_self();
          if (objc_msgSend(v14, "qos") != (_DWORD)v15)
          {
            v16 = (void *)objc_msgSend(objc_alloc(*(Class *)(v5 + 2368)), "initWithFormat:", CFSTR("priority degraded from %u -> %u"), objc_msgSend(v14, "qos"), v15);
            _MRLogForCategory(0xAuLL);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "requestID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v33 = CFSTR("DistantExternalDevice.connectWithOptions");
              v34 = 2114;
              v35 = v18;
              v36 = 2112;
              v37 = v16;
              _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

            }
          }
          _MRLogForCategory(0xAuLL);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v3)
          {
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              goto LABEL_21;
            objc_msgSend(v14, "requestID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "startDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "timeIntervalSinceDate:", v23);
            *(_DWORD *)buf = 138544130;
            v33 = CFSTR("DistantExternalDevice.connectWithOptions");
            v34 = 2114;
            v35 = v21;
            v36 = 2114;
            v37 = v3;
            v38 = 2048;
            v39 = v24;
            _os_log_error_impl(&dword_193827000, v20, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
          }
          else
          {
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              goto LABEL_21;
            objc_msgSend(v14, "requestID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "startDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "timeIntervalSinceDate:", v23);
            *(_DWORD *)buf = 138543874;
            v33 = CFSTR("DistantExternalDevice.connectWithOptions");
            v34 = 2114;
            v35 = v21;
            v36 = 2048;
            v37 = v25;
            _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
          }

          v5 = 0x1E0CB3000;
LABEL_21:

          objc_msgSend(v14, "completion");
          v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v26)[2](v26, v3);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v11);
    }

  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[MRDistantExternalDevice distantEndpoint](self, "distantEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFString *)MRExternalDeviceConnectionStateCopyDescription(self->_connectionState);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ (%@)>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  void *v3;
  NSObject *serialQueue;
  id v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  -[MRDistantExternalDevice distantEndpoint](self, "distantEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MRDistantExternalDevice_debugDescription__block_invoke;
  block[3] = &unk_1E30C74D0;
  v9 = v3;
  v10 = &v11;
  block[4] = self;
  v5 = v3;
  dispatch_sync(serialQueue, block);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSString *)v6;
}

uint64_t __43__MRDistantExternalDevice_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v2 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 248);
  objc_msgSend(*(id *)(a1 + 40), "debugName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "initWithFormat:", CFSTR("<%@:%p {\n hostedExternalDeviceConnection = %@\n endpoint = %@\n"), v3, v4, v5, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v11 = (__CFString *)MRExternalDeviceConnectionStateCopyDescription(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(v10, "appendFormat:", CFSTR(" %@"), v11);

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 96);
  if (v13)
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v13, "timeIntervalSinceNow");
    objc_msgSend(v14, "appendFormat:", CFSTR("(%@ %f seconds ago)\n"), v13, -v15);
    v12 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v12 + 184))
  {
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v17 = *(void **)(v12 + 112);
    objc_msgSend(v17, "timeIntervalSinceNow");
    objc_msgSend(v16, "appendFormat:", CFSTR(" attemptedToConnect=YES (%@ %lf seconds ago)\n"), v17, -v18);
    v12 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v12 + 128))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendString:", CFSTR(" attemptedToConnectWhileInvalid=YES\n"));
    v12 = *(_QWORD *)(a1 + 32);
  }
  v19 = *(_QWORD *)(v12 + 120);
  if (v19)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR(" customOrigin=%@\n"), v19);
    v12 = *(_QWORD *)(a1 + 32);
  }
  v20 = *(void **)(v12 + 144);
  if (v20)
  {
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v20, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mr_formattedDebugDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendFormat:", CFSTR(" externalOutputContext=%@\n"), v23);

    v12 = *(_QWORD *)(a1 + 32);
  }
  if (objc_msgSend(*(id *)(v12 + 168), "count"))
  {
    v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "mr_formattedDebugDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("  pendingCompletions = %@"), v25);

  }
  v26 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  if (v26)
  {
    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v26, "mr_formattedDebugDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appendFormat:", CFSTR(" externalOutputContext debug=%@\n"), v28);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendString:", CFSTR("}>"));
}

- (MRAVDistantEndpoint)distantEndpoint
{
  os_unfair_lock_s *p_distantEndpointLock;
  MRAVDistantEndpoint *v4;

  p_distantEndpointLock = &self->_distantEndpointLock;
  os_unfair_lock_lock(&self->_distantEndpointLock);
  v4 = self->_distantEndpoint;
  os_unfair_lock_unlock(p_distantEndpointLock);
  return v4;
}

- (void)setDistantEndpoint:(id)a3
{
  MRAVDistantEndpoint *v4;
  MRAVDistantEndpoint *distantEndpoint;
  MRAVDistantEndpoint *v6;

  v4 = (MRAVDistantEndpoint *)a3;
  os_unfair_lock_lock(&self->_distantEndpointLock);
  distantEndpoint = self->_distantEndpoint;
  self->_distantEndpoint = v4;
  v6 = v4;

  os_unfair_lock_unlock(&self->_distantEndpointLock);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  void *v2;
  void *v3;

  -[MRDistantExternalDevice _nullableHostedExternalDeviceConnection]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (id)_nullableHostedExternalDeviceConnection
{
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  if (!a1)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__5;
  v7 = __Block_byref_object_dispose__5;
  v8 = 0;
  msv_dispatch_sync_on_queue();
  v1 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v1;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[MRDistantExternalDevice _hostedExternalDeviceConnection](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_hostedExternalDeviceConnection
{
  if (a1)
  {
    -[MRDistantExternalDevice _hostedExternalDeviceConnectionWithError:]((uint64_t)a1, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)name
{
  void *v2;
  void *v3;

  -[MRDistantExternalDevice distantEndpoint](self, "distantEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hostName
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (id)uid
{
  void *v2;
  void *v3;

  -[MRDistantExternalDevice deviceInfo](self, "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "WHAIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsNowPlayingNotifications
{
  return -[MRDistantExternalDevice deviceNotifications]((uint64_t)self) & 1;
}

- (uint64_t)deviceNotifications
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MRDistantExternalDevice_deviceNotifications__block_invoke;
  v4[3] = &unk_1E30C5D20;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setWantsNowPlayingNotifications:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__MRDistantExternalDevice_setWantsNowPlayingNotifications___block_invoke;
  v4[3] = &unk_1E30C74F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __59__MRDistantExternalDevice_setWantsNowPlayingNotifications___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(a1 + 40);
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)wantsNowPlayingArtworkNotifications
{
  return 0;
}

- (BOOL)wantsVolumeNotifications
{
  return ((unint64_t)-[MRDistantExternalDevice deviceNotifications]((uint64_t)self) >> 1) & 1;
}

- (void)setWantsVolumeNotifications:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__MRDistantExternalDevice_setWantsVolumeNotifications___block_invoke;
  v4[3] = &unk_1E30C74F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __55__MRDistantExternalDevice_setWantsVolumeNotifications___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFFDLL | -*(unsigned __int8 *)(a1 + 40) & 2;
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)wantsOutputDeviceNotifications
{
  return ((unint64_t)-[MRDistantExternalDevice deviceNotifications]((uint64_t)self) >> 2) & 1;
}

- (void)setWantsOutputDeviceNotifications:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__MRDistantExternalDevice_setWantsOutputDeviceNotifications___block_invoke;
  v4[3] = &unk_1E30C74F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __61__MRDistantExternalDevice_setWantsOutputDeviceNotifications___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFFBLL | -*(unsigned __int8 *)(a1 + 40) & 4;
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)wantsEndpointChangeNotifications
{
  return ((unint64_t)-[MRDistantExternalDevice deviceNotifications]((uint64_t)self) >> 3) & 1;
}

- (void)setWantsEndpointChangeNotifications:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__MRDistantExternalDevice_setWantsEndpointChangeNotifications___block_invoke;
  v4[3] = &unk_1E30C74F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __63__MRDistantExternalDevice_setWantsEndpointChangeNotifications___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFF7 | -*(unsigned __int8 *)(a1 + 40) & 8;
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)wantsSystemEndpointNotifications
{
  return ((unint64_t)-[MRDistantExternalDevice deviceNotifications]((uint64_t)self) >> 4) & 1;
}

- (void)setWantsSystemEndpointNotifications:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__MRDistantExternalDevice_setWantsSystemEndpointNotifications___block_invoke;
  v4[3] = &unk_1E30C74F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __63__MRDistantExternalDevice_setWantsSystemEndpointNotifications___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFEFLL | -*(unsigned __int8 *)(a1 + 40) & 0x10;
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (id)subscribedPlayerPaths
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MRDistantExternalDevice_subscribedPlayerPaths__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__MRDistantExternalDevice_subscribedPlayerPaths__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSubscribedPlayerPaths:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MRDistantExternalDevice_setSubscribedPlayerPaths___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __52__MRDistantExternalDevice_setSubscribedPlayerPaths___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__MRDistantExternalDevice_setSubscribedPlayerPaths___block_invoke_2;
  v8[3] = &unk_1E30C5F40;
  v8[4] = v5;
  v9 = v6;
  dispatch_async(v7, v8);

}

void __52__MRDistantExternalDevice_setSubscribedPlayerPaths___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubscribedPlayerPaths:", *(_QWORD *)(a1 + 40));

}

- (unsigned)connectionState
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
  v5[2] = __42__MRDistantExternalDevice_connectionState__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__MRDistantExternalDevice_connectionState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

- (void)setExternalOutputContext:(id)a3
{
  MRExternalOutputContextDataSource *v6;
  MRExternalOutputContextDataSource **p_externalOutputContext;
  MRExternalOutputContextDataSource *externalOutputContext;
  NSObject *v9;
  int v10;
  MRExternalOutputContextDataSource *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  MRDistantExternalDevice *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (MRExternalOutputContextDataSource *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  p_externalOutputContext = &self->_externalOutputContext;
  externalOutputContext = self->_externalOutputContext;
  if (externalOutputContext != v6)
  {
    if (v6 && externalOutputContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRDistantExternalDevice.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(externalOutputContext && _externalOutputContext)"));

    }
    objc_storeStrong((id *)&self->_externalOutputContext, a3);
    if (*p_externalOutputContext)
    {
      MRLogCategoryDiscoveryOversize();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = MSVDeviceOSIsInternalInstall();
        v11 = *p_externalOutputContext;
        if (v10)
          -[MROutputContextDataSource debugDescription](v11, "debugDescription");
        else
          -[MROutputContextDataSource description](v11, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = self;
        v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRDistantExternalDevice] Distant external device %{public}@ initialized externalOutputContext: %{public}@", buf, 0x16u);

      }
    }
  }

}

- (MRExternalOutputContextDataSource)externalOutputContext
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MRDistantExternalDevice_externalOutputContext__block_invoke;
  v5[3] = &unk_1E30C5F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRExternalOutputContextDataSource *)v3;
}

void __48__MRDistantExternalDevice_externalOutputContext__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104) == 2 && !*(_QWORD *)(v2 + 144))
  {
    v3 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__MRDistantExternalDevice_externalOutputContext__block_invoke_2;
    v7[3] = &unk_1E30C6918;
    v7[4] = v2;
    -[MRDistantExternalDevice _synchronousObjectProxyWithErrorHandler:]((void *)v2, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __48__MRDistantExternalDevice_externalOutputContext__block_invoke_194;
    v6[3] = &unk_1E30C7520;
    v6[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "getExternalOutputContextWithCompletion:", v6);

    +[MRDistantExternalDevice _notificationSerialQueue]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setNotificationQueue:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setExternalOutputContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 144));
}

void __48__MRDistantExternalDevice_externalOutputContext__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 64);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__MRDistantExternalDevice_externalOutputContext__block_invoke_3;
    v7[3] = &unk_1E30C5F40;
    v7[4] = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __48__MRDistantExternalDevice_externalOutputContext__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %{public}@ failed to fetch externalOutputContext: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

- (id)_synchronousObjectProxyWithErrorHandler:(void *)a1
{
  void (**v3)(id, id);
  void *v4;
  id v5;
  void *v7;
  _QWORD v8[5];
  void (**v9)(id, id);
  id v10;

  v3 = a2;
  if (a1)
  {
    v10 = 0;
    -[MRDistantExternalDevice _hostedExternalDeviceConnectionWithError:]((uint64_t)a1, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v5)
    {
      v3[2](v3, v5);
    }
    else
    {
      if (v4)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __67__MRDistantExternalDevice__synchronousObjectProxyWithErrorHandler___block_invoke;
        v8[3] = &unk_1E30C75E8;
        v8[4] = a1;
        v9 = v3;
        objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
        a1 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 24, CFSTR("Attempting to query nil distantEndpointConnection"));
      v3[2](v3, v7);

    }
    a1 = 0;
LABEL_7:

  }
  return a1;
}

void __48__MRDistantExternalDevice_externalOutputContext__block_invoke_194(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)_notificationSerialQueue
{
  objc_opt_self();
  if (_notificationSerialQueue___once != -1)
    dispatch_once(&_notificationSerialQueue___once, &__block_literal_global_21);
  return (id)_notificationSerialQueue___notificationSerialQueue;
}

- (id)groupSessionToken
{
  void *v2;
  void *v3;

  -[MRDistantExternalDevice deviceInfo](self, "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupSessionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPaired
{
  return 1;
}

- (BOOL)isUsingSystemPairing
{
  return 1;
}

- (unint64_t)callbacks
{
  NSObject *serialQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__MRDistantExternalDevice_callbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__MRDistantExternalDevice_callbacks__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

uint64_t __46__MRDistantExternalDevice_deviceNotifications__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (void)setDeviceInfo:(id)a3
{
  id v5;
  MRDeviceInfo *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v6 = self->_deviceInfo;
  objc_storeStrong((id *)&self->_deviceInfo, a3);
  if (!-[MRDeviceInfo isEqual:](v6, "isEqual:", v5))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("MRExternalDevicePreviousDeviceInfoUserInfoKey"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("MRExternalDeviceDeviceInfoUserInfoKey"));
    +[MRDistantExternalDevice _notificationSerialQueue]();
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__MRDistantExternalDevice_setDeviceInfo___block_invoke;
    v10[3] = &unk_1E30C5F40;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    dispatch_async(v8, v10);

  }
}

void __41__MRDistantExternalDevice_setDeviceInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MRExternalDeviceDeviceInfoDidChangeNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (MRDeviceInfo)deviceInfo
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke;
  v5[3] = &unk_1E30C5F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDeviceInfo *)v3;
}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[22];
  if (!v3)
  {
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke_2;
    v7[3] = &unk_1E30C6918;
    v7[4] = v2;
    -[MRDistantExternalDevice _synchronousObjectProxyWithErrorHandler:](v2, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke_198;
    v6[3] = &unk_1E30C7548;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "getDeviceInfoWithCompletion:", v6);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) |= 0x20uLL;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isCompanion"))
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) |= 0x10uLL;
    -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 64);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke_3;
    v7[3] = &unk_1E30C5F40;
    v7[4] = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %{public}@ failed to fetch deviceInfo: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke_198(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_storeStrong((id *)(v5 + 176), a2);
  }
  else
  {
    v6 = *(NSObject **)(v5 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke_2_199;
    block[3] = &unk_1E30C5CA8;
    block[4] = v5;
    dispatch_async(v6, block);
  }

}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke_2_199(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %p failed to fetch deviceInfo", (uint8_t *)&v4, 0xCu);
  }

}

- (id)supportedMessages
{
  MRSupportedProtocolMessages *v3;
  void *v4;
  MRSupportedProtocolMessages *v5;

  v3 = [MRSupportedProtocolMessages alloc];
  -[MRDistantExternalDevice deviceInfo](self, "deviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRSupportedProtocolMessages initWithLastSupportedMessageType:](v3, "initWithLastSupportedMessageType:", objc_msgSend(v4, "lastSupportedProtocolMessageType"));

  return v5;
}

- (id)customOrigin
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke;
  v5[3] = &unk_1E30C5F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[15];
  if (!v3)
  {
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke_2;
    v7[3] = &unk_1E30C6918;
    v7[4] = v2;
    -[MRDistantExternalDevice _synchronousObjectProxyWithErrorHandler:](v2, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke_202;
    v6[3] = &unk_1E30C7570;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "getCustomOriginDataWithCompletion:", v6);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 64);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke_3;
    v7[3] = &unk_1E30C5F40;
    v7[4] = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %{public}@ failed to fetch custom origin data: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

void __39__MRDistantExternalDevice_customOrigin__block_invoke_202(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  MROrigin *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = -[MROrigin initWithData:]([MROrigin alloc], "initWithData:", v5);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 120);
    *(_QWORD *)(v9 + 120) = v8;

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke_2_204;
    v13[3] = &unk_1E30C5F40;
    v13[4] = v11;
    v14 = v6;
    dispatch_async(v12, v13);

  }
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke_2_204(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 134218242;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %p failed to fetch custom origin data: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  NSObject *v36;
  NSObject *v37;
  dispatch_queue_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  MRExternalDeviceConnectionDetails *v45;
  void *v46;
  NSObject *serialQueue;
  id v48;
  MRExternalDeviceConnectionDetails *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  MRDistantExternalDevice *v57;
  unsigned int v58;
  _QWORD v59[5];
  MRExternalDeviceConnectionDetails *v60;
  id v61;
  unsigned int v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  dispatch_queue_t v67;
  id v68;
  int v69;
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v56 = a5;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a4;
  objc_msgSend(v9, "now");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v11)
    v12 = v11;
  else
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v12;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MRExternalDeviceConnectionCorrelationIDUserInfoKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("MRExternalDeviceConnectionCorrelationIDUserInfoKey"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("MRExternalDeviceConnectionCorrelationIDUserInfoKey"));

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MRExternalDeviceConnectionReasonUserInfoKey"));
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MRExternalDeviceConnectionCorrelationIDUserInfoKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRDistantExternalDevice.m"), 644, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uid"));

    if (v17)
      goto LABEL_12;
  }
  _MRLogForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[MRDistantExternalDevice connectWithOptions:userInfo:completion:].cold.1((uint64_t)v18, v19, v20);

  v17 = CFSTR("unspecified");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("unspecified"), CFSTR("MRExternalDeviceConnectionReasonUserInfoKey"));
LABEL_12:
  -[MRDistantExternalDevice distantEndpoint](self, "distantEndpoint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  v23 = objc_opt_class();
  objc_msgSend(v21, "uniqueIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v21;
  objc_msgSend(v21, "designatedGroupLeader");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = self;
  v27 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@:%p<%@(%@)>"), v23, self, v24, v26);

  if ((a3 & 1) != 0)
  {
    v28 = (__CFString *)MRExternalDeviceConnectOptionsCopyDescription(a3);
    objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("(%@)"), v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v29;
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("DistantExternalDevice.connectWithOptions"), v18);
  v31 = v30;
  if (v27)
    objc_msgSend(v30, "appendFormat:", CFSTR(" for %@"), v27);
  if (v17)
    objc_msgSend(v31, "appendFormat:", CFSTR(" because %@"), v17);
  v58 = a3;
  _MRLogForCategory(0xAuLL);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v71 = v31;
    _os_log_impl(&dword_193827000, v32, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v33 = qos_class_self();
  v34 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.mediaremote.distantExternalDevice.connect.%@"), v18));
  v53 = v31;
  v35 = (const char *)objc_msgSend(v34, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v36 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v36, (dispatch_qos_class_t)v33, 0);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = dispatch_queue_create(v35, v37);

  v39 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke;
  v63[3] = &unk_1E30C7598;
  v69 = v33;
  v64 = v18;
  v65 = v27;
  v67 = v38;
  v68 = v56;
  v66 = v55;
  v52 = v38;
  v40 = v56;
  v41 = v55;
  v42 = v27;
  v43 = v18;
  v44 = (void *)MEMORY[0x194036C44](v63);
  v45 = objc_alloc_init(MRExternalDeviceConnectionDetails);
  -[MRExternalDeviceConnectionDetails setStartDate:](v45, "setStartDate:", v41);
  -[MRExternalDeviceConnectionDetails setRequestID:](v45, "setRequestID:", v43);
  -[MRExternalDeviceConnectionDetails setReason:](v45, "setReason:", v17);
  -[MRExternalDeviceConnectionDetails setQos:](v45, "setQos:", v33);
  v46 = (void *)objc_msgSend(v44, "copy");
  -[MRExternalDeviceConnectionDetails setCompletion:](v45, "setCompletion:", v46);

  serialQueue = v57->_serialQueue;
  v59[0] = v39;
  v59[1] = 3221225472;
  v59[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_2;
  v59[3] = &unk_1E30C75C0;
  v59[4] = v57;
  v60 = v45;
  v62 = v58;
  v61 = v13;
  v48 = v13;
  v49 = v45;
  MRCreateDonatedQosBlock(v59);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(serialQueue, v50);

}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  id v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("qos: %u->%u"), *(unsigned int *)(a1 + 72), qos_class_self());
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v30 = CFSTR("DistantExternalDevice.connectWithOptions");
    v31 = 2114;
    v32 = v6;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v3)
  {
    v15 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v15)
        goto LABEL_16;
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v30 = CFSTR("DistantExternalDevice.connectWithOptions");
      v31 = 2114;
      v32 = v16;
      v33 = 2114;
      v34 = v17;
      v35 = 2048;
      v36 = v18;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v20 = v9;
      v21 = 42;
    }
    else
    {
      if (!v15)
        goto LABEL_16;
      v22 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      v30 = CFSTR("DistantExternalDevice.connectWithOptions");
      v31 = 2114;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v20 = v9;
      v21 = 32;
    }
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_15;
  }
  v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v10)
      goto LABEL_16;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544386;
    v30 = CFSTR("DistantExternalDevice.connectWithOptions");
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v3;
    v35 = 2114;
    v36 = v12;
    v37 = 2048;
    v38 = v14;
    _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_15:

    goto LABEL_16;
  }
  if (v10)
    __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_cold_1();
LABEL_16:

  v24 = *(void **)(a1 + 64);
  if (v24)
  {
    v25 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_228;
    block[3] = &unk_1E30C6568;
    v28 = v24;
    v27 = v3;
    dispatch_async(v25, block);

  }
}

uint64_t __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_228(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 168);
    *(_QWORD *)(v4 + 168) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  v6 = *(_DWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_3;
  v10[3] = &unk_1E30C6918;
  v10[4] = v9;
  -[MRDistantExternalDevice _onSerialQueue_prepareToConnectWithOptions:userInfo:connectionAttemptDetails:connectionHandler:](v9, v6, v7, v8, v10);
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_4;
  v8[3] = &unk_1E30C5F40;
  v8[4] = v4;
  v9 = v3;
  v6 = v3;
  MRCreateDonatedQosBlock(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v7);

}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_5;
  v5[3] = &unk_1E30C5F40;
  v5[4] = v1;
  v6 = v2;
  MRCreateDonatedQosBlock(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, v4);

}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  unsigned int v3;

  -[MRDistantExternalDevice _onSerialQueue_callAllPendingCompletionsWithError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  if (v2)
    v3 = 3;
  else
    v3 = 2;
  -[MRDistantExternalDevice _onSerialQueue_handleConnectionStateDidChange:withError:](*(_QWORD *)(a1 + 32), v3, v2);
}

- (void)_onSerialQueue_handleConnectionStateDidChange:(void *)a3 withError:
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  __CFString *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  unsigned int v28;
  _QWORD block[4];
  id v30;
  id v31;
  unsigned int v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    if (a2 == 3 && *(_QWORD *)(a1 + 248))
      objc_msgSend((id)a1, "setHostedExternalDeviceConnection:", 0);
    if (!*(_QWORD *)(a1 + 248))
      objc_msgSend((id)a1, "setDeviceInfo:", 0);
    if (*(_DWORD *)(a1 + 104) != a2)
    {
      MRLogCategoryConnections();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v8 = (__CFString *)MRExternalDeviceConnectionStateCopyDescription(a2);
          *(_DWORD *)buf = 138543874;
          v34 = a1;
          v35 = 2114;
          v36 = v8;
          v37 = 2114;
          v38 = v5;
          v9 = "[MRDistantExternalDevice] Hosted external device connection for distant device %{public}@ state did chang"
               "e to %{public}@ with error %{public}@";
          v10 = v7;
          v11 = OS_LOG_TYPE_ERROR;
          v12 = 32;
LABEL_13:
          _os_log_impl(&dword_193827000, v10, v11, v9, buf, v12);

        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (__CFString *)MRExternalDeviceConnectionStateCopyDescription(a2);
        *(_DWORD *)buf = 138543618;
        v34 = a1;
        v35 = 2114;
        v36 = v8;
        v9 = "[MRDistantExternalDevice] Hosted external device connection for distant device %{public}@ state did change to %{public}@";
        v10 = v7;
        v11 = OS_LOG_TYPE_DEFAULT;
        v12 = 22;
        goto LABEL_13;
      }

      if ((a2 & 0xFFFFFFFE) == 2)
      {
        *(_DWORD *)(a1 + 160) = 0;
        -[MRDistantExternalDevice _onSerialQueue_callAllPendingCompletionsWithError:](a1, 0);
      }
      v13 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

      v14 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = 0;

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v15;

      *(_DWORD *)(a1 + 104) = a2;
      objc_msgSend((id)a1, "connectionStateCallback");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");

      objc_msgSend((id)a1, "connectionStateCallbackQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v19;
      }
      else
      {
        v21 = MEMORY[0x1E0C80D38];
        v22 = MEMORY[0x1E0C80D38];
      }

      v23 = MEMORY[0x1E0C809B0];
      if (v18)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __83__MRDistantExternalDevice__onSerialQueue_handleConnectionStateDidChange_withError___block_invoke;
        block[3] = &unk_1E30C7638;
        v31 = v18;
        v32 = a2;
        v30 = v5;
        dispatch_async(v21, block);

      }
      +[MRDistantExternalDevice _notificationSerialQueue]();
      v24 = objc_claimAutoreleasedReturnValue();
      v25[0] = v23;
      v25[1] = 3221225472;
      v25[2] = __83__MRDistantExternalDevice__onSerialQueue_handleConnectionStateDidChange_withError___block_invoke_2;
      v25[3] = &unk_1E30C7610;
      v28 = a2;
      v26 = v5;
      v27 = a1;
      dispatch_async(v24, v25);

    }
  }

}

- (void)_onSerialQueue_prepareToConnectWithOptions:(void *)a3 userInfo:(void *)a4 connectionAttemptDetails:(void *)a5 connectionHandler:
{
  id v8;
  id v9;
  id v10;
  MRBlockGuard *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  MRBlockGuard *v19;
  MRBlockGuard *v20;
  void (**v21)(_QWORD, _QWORD);
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD);
  id v30;
  __CFString *v31;
  NSObject *v32;
  void *v33;
  id v35;
  _QWORD v36[4];
  id v37;
  void (**v38)(_QWORD, _QWORD);
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  MRBlockGuard *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  const __CFString *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (a1)
  {
    v35 = v8;
    v11 = [MRBlockGuard alloc];
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v9, "requestID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@<%@:%@>"), CFSTR("DistantExternalDevice.connectWithOptions"), v13, v14);
    v16 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke;
    v44[3] = &unk_1E30C6798;
    v17 = v10;
    v18 = v10;
    v45 = v18;
    v19 = -[MRBlockGuard initWithTimeout:reason:handler:](v11, "initWithTimeout:reason:handler:", v15, v44, 30.0);

    v41[0] = v16;
    v41[1] = 3221225472;
    v41[2] = __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_2;
    v41[3] = &unk_1E30C75E8;
    v20 = v19;
    v42 = v20;
    v43 = v18;
    v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v41);
    v22 = *(_DWORD *)(a1 + 104);
    if (v22 == 1)
    {
      if ((a2 & 1) == 0 || (*(_DWORD *)(a1 + 160) & 1) != 0)
      {
        v31 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Connection already in progress, batching connection attempt %@"), *(_QWORD *)(a1 + 168));
        _MRLogForCategory(0xAuLL);
        v32 = objc_claimAutoreleasedReturnValue();
        v10 = v17;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "requestID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = CFSTR("DistantExternalDevice.connectWithOptions");
          v48 = 2114;
          v49 = v33;
          v50 = 2112;
          v51 = v31;
          _os_log_impl(&dword_193827000, v32, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

        }
        -[MSVBlockGuard disarm](v20, "disarm");

        goto LABEL_16;
      }
      _MRLogForCategory(0xAuLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "requestID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = CFSTR("DistantExternalDevice.connectWithOptions");
        v48 = 2114;
        v49 = v26;
        v50 = 2112;
        v51 = CFSTR("AuthUpgrade required");
        _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

      }
      v10 = v17;
    }
    else
    {
      v10 = v17;
      if (v22 == 2)
      {
        _MRLogForCategory(0xAuLL);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "requestID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = CFSTR("DistantExternalDevice.connectWithOptions");
          v48 = 2114;
          v49 = v24;
          v50 = 2112;
          v51 = CFSTR("Already Connected");
          _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

        }
        v21[2](v21, 0);
LABEL_16:
        v8 = v35;
        goto LABEL_17;
      }
    }
    *(_BYTE *)(a1 + 184) = 1;
    objc_msgSend(v9, "startDate");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = v27;

    *(_DWORD *)(a1 + 160) = a2;
    -[MRDistantExternalDevice _onSerialQueue_handleConnectionStateDidChange:withError:](a1, 1u, 0);
    v39[0] = v16;
    v39[1] = 3221225472;
    v39[2] = __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_240;
    v39[3] = &unk_1E30C75E8;
    v39[4] = a1;
    v29 = v21;
    v40 = v29;
    -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:]((void *)a1, v39);
    v36[0] = v16;
    v36[1] = 3221225472;
    v36[2] = __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_2_241;
    v36[3] = &unk_1E30C75E8;
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v38 = v29;
    v30 = v37;
    v8 = v35;
    objc_msgSend(v30, "connectWithOptions:userInfo:completion:", a2, v35, v36);

LABEL_17:
  }

}

uint64_t __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_240(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  -[MRDistantExternalDevice _disconnectWithError:](v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_remoteObjectProxyWithErrorHandler:(void *)a1
{
  void (**v3)(id, id);
  void *v4;
  id v5;
  void *v7;
  _QWORD v8[5];
  void (**v9)(id, id);
  id v10;

  v3 = a2;
  if (a1)
  {
    v10 = 0;
    -[MRDistantExternalDevice _hostedExternalDeviceConnectionWithError:]((uint64_t)a1, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v5)
    {
      v3[2](v3, v5);
    }
    else
    {
      if (v4)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke;
        v8[3] = &unk_1E30C75E8;
        v8[4] = a1;
        v9 = v3;
        objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
        a1 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 24, CFSTR("Attempting to query nil distantEndpointConnection"));
      v3[2](v3, v7);

    }
    a1 = 0;
LABEL_7:

  }
  return a1;
}

void __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_2_241(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v5 = *(id *)(a1 + 32);
  v4(v3, a2);

}

- (void)disconnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *workerQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MRLogCategoryConnections();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Client called disconnect on shared connection with error %@", buf, 0xCu);
  }

  workerQueue = self->_workerQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__MRDistantExternalDevice_disconnect___block_invoke;
  v8[3] = &unk_1E30C5F40;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(workerQueue, v8);

}

void __38__MRDistantExternalDevice_disconnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MRDistantExternalDevice_disconnect___block_invoke_2;
  v4[3] = &unk_1E30C6918;
  v4[4] = v2;
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disconnect:", *(_QWORD *)(a1 + 40));

}

void __38__MRDistantExternalDevice_disconnect___block_invoke_2(uint64_t a1, void *a2)
{
  -[MRDistantExternalDevice _disconnectWithError:](*(_QWORD *)(a1 + 32), a2);
}

- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRDistantExternalDevice_setConnectionStateCallback_withQueue___block_invoke;
  block[3] = &unk_1E30C6B98;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

uint64_t __64__MRDistantExternalDevice_setConnectionStateCallback_withQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connectionStateCallback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);

    if (v3)
    {
      MRLogCategoryConnections();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Overwriting distant external device ConnectionStateCallback for %@", (uint8_t *)&v7, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setConnectionStateCallback:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setConnectionStateCallbackQueue:", *(_QWORD *)(a1 + 40));
}

- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MRDistantExternalDevice_setCustomDataCallback_withQueue___block_invoke;
  block[3] = &unk_1E30C6B98;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

void __59__MRDistantExternalDevice_setCustomDataCallback_withQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "customDataCallback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);

    if (v3)
    {
      MRLogCategoryConnections();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Overwriting distant external device CustomDataCallback for %@", (uint8_t *)&v6, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setCustomDataCallback:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setCustomDataCallbackQueue:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) & 0xFFFFFFFFFFFFFFFELL | (*(_QWORD *)(a1 + 48) != 0);
  -[MRDistantExternalDevice _updateHostedDeviceDesiredCallbacks:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)setVolumeCallback:(id)a3 withQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MRDistantExternalDevice_setVolumeCallback_withQueue___block_invoke;
  block[3] = &unk_1E30C6B98;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(serialQueue, block);

}

uint64_t __55__MRDistantExternalDevice_setVolumeCallback_withQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "volumeCallback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);

    if (v3)
    {
      MRLogCategoryConnections();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Overwriting distant external device VolumeCallback for %@", (uint8_t *)&v7, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setVolumeCallback:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setVolumeCallbackQueue:", *(_QWORD *)(a1 + 40));
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  id v6;
  NSObject *workerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRDistantExternalDevice_setDiscoveryMode_forConfiguration___block_invoke;
  block[3] = &unk_1E30C7610;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workerQueue, block);

}

void __61__MRDistantExternalDevice_setDiscoveryMode_forConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  -[MRDistantExternalDevice _hostedExternalDeviceConnection](*(void **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoveryMode:forConfiguration:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  NSObject *workerQueue;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke;
  v21[3] = &unk_1E30C7098;
  v22 = v9;
  v23 = v10;
  v12 = v10;
  v13 = v9;
  v14 = (void *)MEMORY[0x194036C44](v21);
  workerQueue = self->_workerQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_3;
  block[3] = &unk_1E30C6B98;
  v19 = v8;
  v20 = v14;
  block[4] = self;
  v16 = v8;
  v17 = v14;
  dispatch_async(workerQueue, block);

}

void __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_4;
  v4[3] = &unk_1E30C6798;
  v5 = *(id *)(a1 + 48);
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestGroupSessionWithDetails:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__MRDistantExternalDevice_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke;
  v19[3] = &unk_1E30C7660;
  v11 = v9;
  v20 = v11;
  v12 = v10;
  v21 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v19);
  -[MRDistantExternalDevice externalOutputContext](self, "externalOutputContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v18 = 0;
    v16 = objc_msgSend(v14, "volumeControlCapabilitiesForOutputDeviceUID:error:", v8, &v18);
    v17 = v18;
  }
  else
  {
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 121);
    v16 = 0;
  }
  ((void (**)(_QWORD, uint64_t, id))v13)[2](v13, v16, v17);

}

void __82__MRDistantExternalDevice_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  int v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MRDistantExternalDevice_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C7638;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __82__MRDistantExternalDevice_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  NSObject *workerQueue;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD block[5];
  id v42;
  id v43;
  id v44;
  float v45;
  _QWORD v46[4];
  id v47;
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  float v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v39 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDistantExternalDevice distantEndpoint](self, "distantEndpoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18 = objc_opt_class();
  objc_msgSend(v16, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v16;
  objc_msgSend(v16, "designatedGroupLeader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@:%p<%@(%@)>"), v18, self, v19, v21);

  v23 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v12, "requestID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("DistantExternalDevice.setOutputDeviceVolume"), v24);

  if (v22)
    objc_msgSend(v25, "appendFormat:", CFSTR(" for %@"), v22);
  _MRLogForCategory(0xAuLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v25;
    _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v27 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke;
  v46[3] = &unk_1E30C7688;
  v53 = a3;
  v47 = v22;
  v48 = CFSTR("DistantExternalDevice.setOutputDeviceVolume");
  v28 = v25;
  v29 = v12;
  v49 = v29;
  v50 = v15;
  v51 = v13;
  v52 = v14;
  v30 = v14;
  v31 = v13;
  v32 = v15;
  v33 = v22;
  v34 = (void *)MEMORY[0x194036C44](v46);
  workerQueue = self->_workerQueue;
  block[0] = v27;
  block[1] = 3221225472;
  block[2] = __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C76B0;
  v45 = a3;
  block[4] = self;
  v42 = v39;
  v43 = v29;
  v44 = v34;
  v36 = v29;
  v37 = v39;
  v38 = v34;
  dispatch_async(workerQueue, block);

}

void __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v14)
      {
        if (!v15)
          goto LABEL_21;
        v24 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v42 = v24;
        v43 = 2114;
        v44 = v9;
        v45 = 2114;
        v46 = v25;
        v47 = 2048;
        v48 = v26;
        v27 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v28 = v6;
        v29 = 42;
      }
      else
      {
        if (!v15)
          goto LABEL_21;
        v33 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        v42 = v33;
        v43 = 2114;
        v44 = v9;
        v45 = 2048;
        v46 = v34;
        v27 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v28 = v6;
        v29 = 32;
      }
      _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      goto LABEL_20;
    }
    if (v14)
    {
      if (!v15)
        goto LABEL_21;
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = *(_DWORD *)(a1 + 80);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v42 = v16;
      v43 = 2114;
      v44 = v9;
      v45 = 2112;
      v46 = v11;
      v47 = 2114;
      v48 = v18;
      v49 = 2048;
      v50 = v20;
      v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v22 = v6;
      v23 = 52;
    }
    else
    {
      if (!v15)
        goto LABEL_21;
      v30 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = *(_DWORD *)(a1 + 80);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v42 = v30;
      v43 = 2114;
      v44 = v9;
      v45 = 2112;
      v46 = v11;
      v47 = 2048;
      v48 = v32;
      v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v22 = v6;
      v23 = 42;
    }
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);

    goto LABEL_20;
  }
  v5 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v42 = v8;
      v43 = 2114;
      v44 = v9;
      v45 = 2114;
      v46 = v3;
      v47 = 2114;
      v48 = v10;
      v49 = 2048;
      v50 = v12;
      _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    }
  }
  else if (v7)
  {
    __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_cold_1();
  }
LABEL_21:

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_247;
  v38[3] = &unk_1E30C6568;
  v35 = *(NSObject **)(a1 + 64);
  v36 = *(id *)(a1 + 72);
  v39 = v3;
  v40 = v36;
  v37 = v3;
  dispatch_async(v35, v38);

}

uint64_t __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_247(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  id v3;

  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v3, "setOutputDeviceVolume:outputDeviceUID:details:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2);

}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, float);
  void *v14;
  void *v15;
  float v16;
  float v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __63__MRDistantExternalDevice_outputDeviceVolume_queue_completion___block_invoke;
  v20[3] = &unk_1E30C76D8;
  v11 = v9;
  v21 = v11;
  v12 = v10;
  v22 = v12;
  v13 = (void (**)(_QWORD, _QWORD, float))MEMORY[0x194036C44](v20);
  -[MRDistantExternalDevice externalOutputContext](self, "externalOutputContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v19 = 0;
    objc_msgSend(v14, "volumeForOutputDeviceUID:error:", v8, &v19);
    v17 = v16;
    v18 = v19;
  }
  else
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 121);
    v17 = 0.0;
  }
  ((void (**)(_QWORD, id, float))v13)[2](v13, v18, v17);

}

void __63__MRDistantExternalDevice_outputDeviceVolume_queue_completion___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  float v12;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRDistantExternalDevice_outputDeviceVolume_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C7638;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a3;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __63__MRDistantExternalDevice_outputDeviceVolume_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(float *)(a1 + 48));
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  NSObject *workerQueue;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v39;
  void *v40;
  _QWORD block[5];
  id v42;
  id v43;
  id v44;
  int64_t v45;
  _QWORD v46[4];
  id v47;
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int64_t v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v39 = a4;
  v11 = a5;
  v37 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDistantExternalDevice distantEndpoint](self, "distantEndpoint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = objc_opt_class();
  objc_msgSend(v14, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v14;
  objc_msgSend(v14, "designatedGroupLeader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@:%p<%@(%@)>"), v16, self, v17, v19);

  v21 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v11, "requestID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("DistantExternalDevice.adjustOutputDeviceVolume"), v22);

  if (v20)
    objc_msgSend(v23, "appendFormat:", CFSTR(" for %@"), v20);
  _MRLogForCategory(0xAuLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v23;
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v25 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke;
  v46[3] = &unk_1E30C7700;
  v53 = a3;
  v47 = v20;
  v48 = CFSTR("DistantExternalDevice.adjustOutputDeviceVolume");
  v36 = v23;
  v26 = v11;
  v49 = v26;
  v50 = v13;
  v51 = v37;
  v52 = v12;
  v27 = v12;
  v28 = v37;
  v29 = v13;
  v30 = v20;
  v31 = (void *)MEMORY[0x194036C44](v46);
  workerQueue = self->_workerQueue;
  block[0] = v25;
  block[1] = 3221225472;
  block[2] = __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C7728;
  v44 = v31;
  v45 = a3;
  block[4] = self;
  v42 = v39;
  v43 = v26;
  v33 = v26;
  v34 = v39;
  v35 = v31;
  dispatch_async(workerQueue, block);

}

void __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    MRMediaRemoteVolumeControlAdjustmentDescription(*(_QWORD *)(a1 + 80));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v13)
      {
        if (!v14)
          goto LABEL_21;
        v24 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v41 = v24;
        v42 = 2114;
        v43 = v8;
        v44 = 2114;
        v45 = v25;
        v46 = 2048;
        v47 = v26;
        v27 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v28 = v5;
        v29 = 42;
      }
      else
      {
        if (!v14)
          goto LABEL_21;
        v32 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        v41 = v32;
        v42 = 2114;
        v43 = v8;
        v44 = 2048;
        v45 = v33;
        v27 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v28 = v5;
        v29 = 32;
      }
      _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      goto LABEL_20;
    }
    if (v13)
    {
      if (!v14)
        goto LABEL_21;
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MRMediaRemoteVolumeControlAdjustmentDescription(*(_QWORD *)(a1 + 80));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v41 = v15;
      v42 = 2114;
      v43 = v16;
      v44 = 2112;
      v45 = v17;
      v46 = 2114;
      v47 = v18;
      v48 = 2048;
      v49 = v20;
      v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v22 = v5;
      v23 = 52;
    }
    else
    {
      if (!v14)
        goto LABEL_21;
      v30 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MRMediaRemoteVolumeControlAdjustmentDescription(*(_QWORD *)(a1 + 80));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v41 = v30;
      v42 = 2114;
      v43 = v16;
      v44 = 2112;
      v45 = v17;
      v46 = 2048;
      v47 = v31;
      v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v22 = v5;
      v23 = 42;
    }
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);

    goto LABEL_21;
  }
  v4 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v41 = v7;
      v42 = 2114;
      v43 = v8;
      v44 = 2114;
      v45 = v3;
      v46 = 2114;
      v47 = v9;
      v48 = 2048;
      v49 = v11;
      _os_log_error_impl(&dword_193827000, v5, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    }
  }
  else if (v6)
  {
    __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_cold_1();
  }
LABEL_21:

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_251;
  v37[3] = &unk_1E30C6568;
  v34 = *(NSObject **)(a1 + 64);
  v35 = *(id *)(a1 + 72);
  v38 = v3;
  v39 = v35;
  v36 = v3;
  dispatch_async(v34, v37);

}

uint64_t __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_251(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustOutputDeviceVolume:outputDeviceUID:details:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  NSObject *workerQueue;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v39;
  void *v40;
  _QWORD block[5];
  id v42;
  id v43;
  id v44;
  BOOL v45;
  _QWORD v46[4];
  id v47;
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  BOOL v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v39 = a4;
  v11 = a5;
  v37 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDistantExternalDevice distantEndpoint](self, "distantEndpoint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = objc_opt_class();
  objc_msgSend(v14, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v14;
  objc_msgSend(v14, "designatedGroupLeader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@:%p<%@(%@)>"), v16, self, v17, v19);

  v21 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v11, "requestID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("DistantExternalDevice.muteOutputDeviceVolume"), v22);

  if (v20)
    objc_msgSend(v23, "appendFormat:", CFSTR(" for %@"), v20);
  _MRLogForCategory(0xAuLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v23;
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v25 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke;
  v46[3] = &unk_1E30C7750;
  v53 = a3;
  v47 = v20;
  v48 = CFSTR("DistantExternalDevice.muteOutputDeviceVolume");
  v36 = v23;
  v26 = v11;
  v49 = v26;
  v50 = v13;
  v51 = v37;
  v52 = v12;
  v27 = v12;
  v28 = v37;
  v29 = v13;
  v30 = v20;
  v31 = (void *)MEMORY[0x194036C44](v46);
  workerQueue = self->_workerQueue;
  block[0] = v25;
  block[1] = 3221225472;
  block[2] = __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C7778;
  v45 = a3;
  block[4] = self;
  v42 = v39;
  v43 = v26;
  v44 = v31;
  v33 = v26;
  v34 = v39;
  v35 = v31;
  dispatch_async(workerQueue, block);

}

void __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v13)
      {
        if (!v14)
          goto LABEL_21;
        v22 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v39 = v22;
        v40 = 2114;
        v41 = v8;
        v42 = 2114;
        v43 = v23;
        v44 = 2048;
        v45 = v24;
        v25 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v26 = v5;
        v27 = 42;
      }
      else
      {
        if (!v14)
          goto LABEL_21;
        v30 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "requestID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        v39 = v30;
        v40 = 2114;
        v41 = v8;
        v42 = 2048;
        v43 = v31;
        v25 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v26 = v5;
        v27 = 32;
      }
      _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_20;
    }
    if (v13)
    {
      if (!v14)
        goto LABEL_21;
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v39 = v15;
      v40 = 2114;
      v41 = v8;
      v42 = 2112;
      v43 = v10;
      v44 = 2114;
      v45 = v16;
      v46 = 2048;
      v47 = v18;
      v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v20 = v5;
      v21 = 52;
    }
    else
    {
      if (!v14)
        goto LABEL_21;
      v28 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v39 = v28;
      v40 = 2114;
      v41 = v8;
      v42 = 2112;
      v43 = v10;
      v44 = 2048;
      v45 = v29;
      v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v20 = v5;
      v21 = 42;
    }
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);

    goto LABEL_20;
  }
  v4 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "requestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v39 = v7;
      v40 = 2114;
      v41 = v8;
      v42 = 2114;
      v43 = v3;
      v44 = 2114;
      v45 = v9;
      v46 = 2048;
      v47 = v11;
      _os_log_error_impl(&dword_193827000, v5, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    }
  }
  else if (v6)
  {
    __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_cold_1();
  }
LABEL_21:

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_254;
  v35[3] = &unk_1E30C6568;
  v32 = *(NSObject **)(a1 + 64);
  v33 = *(id *)(a1 + 72);
  v36 = v3;
  v37 = v33;
  v34 = v3;
  dispatch_async(v32, v35);

}

uint64_t __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_254(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "muteOutputDeviceVolume:outputDeviceUID:details:completion:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSObject *workerQueue;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke;
  v26[3] = &unk_1E30C75E8;
  v27 = v12;
  v28 = v13;
  v15 = v13;
  v16 = v12;
  v17 = (void *)MEMORY[0x194036C44](v26);
  workerQueue = self->_workerQueue;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke_3;
  v22[3] = &unk_1E30C77A0;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v17;
  v19 = v11;
  v20 = v10;
  v21 = v17;
  dispatch_async(workerQueue, v22);

}

void __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E30C6568;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setListeningMode:outputDeviceUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  NSObject *workerQueue;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke;
  v24[3] = &unk_1E30C75E8;
  v25 = v11;
  v26 = v12;
  v14 = v12;
  v15 = v11;
  v16 = (void *)MEMORY[0x194036C44](v24);
  workerQueue = self->_workerQueue;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_3;
  v20[3] = &unk_1E30C77C8;
  v21 = v10;
  v22 = v16;
  v23 = a3;
  v20[4] = self;
  v18 = v10;
  v19 = v16;
  dispatch_async(workerQueue, v20);

}

void __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E30C6568;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConversationDetectionEnabled:outputDeviceUID:completion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  NSObject *workerQueue;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke;
  v21[3] = &unk_1E30C75E8;
  v22 = v9;
  v23 = v10;
  v12 = v10;
  v13 = v9;
  v14 = (void *)MEMORY[0x194036C44](v21);
  workerQueue = self->_workerQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_3;
  block[3] = &unk_1E30C6B98;
  v19 = v8;
  v20 = v14;
  block[4] = self;
  v16 = v8;
  v17 = v14;
  dispatch_async(workerQueue, block);

}

void __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_2;
  v7[3] = &unk_1E30C6568;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifyTopologyWithRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  NSObject *workerQueue;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke;
  v21[3] = &unk_1E30C7098;
  v22 = v9;
  v23 = v10;
  v12 = v10;
  v13 = v9;
  v14 = (void *)MEMORY[0x194036C44](v21);
  workerQueue = self->_workerQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_3;
  block[3] = &unk_1E30C6B98;
  v19 = v8;
  v20 = v14;
  block[4] = self;
  v16 = v8;
  v17 = v14;
  dispatch_async(workerQueue, block);

}

void __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_4;
  v4[3] = &unk_1E30C6798;
  v5 = *(id *)(a1 + 48);
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createHostedEndpointWithOutputDeviceUIDs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendCustomData:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[MRDistantExternalDevice _hostedExternalDeviceConnection](self);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendCustomData:withName:", v7, v6);

}

- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *workerQueue;
  id v15;
  _QWORD block[5];
  id v17;
  double v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke;
  v19[3] = &unk_1E30C75E8;
  v20 = v9;
  v21 = v8;
  v11 = v8;
  v12 = v9;
  v13 = (void *)MEMORY[0x194036C44](v19);
  workerQueue = self->_workerQueue;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke_3;
  block[3] = &unk_1E30C77F0;
  block[4] = self;
  v17 = v13;
  v18 = a3;
  v15 = v13;
  dispatch_async(workerQueue, block);

}

void __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke_2;
  v7[3] = &unk_1E30C6568;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke_3(uint64_t a1)
{
  id v2;

  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pingWithTimeout:callback:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)sendButtonEvent:(_MRHIDButtonEvent)a3
{
  NSObject *workerQueue;
  _QWORD block[5];
  _MRHIDButtonEvent v5;

  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MRDistantExternalDevice_sendButtonEvent___block_invoke;
  block[3] = &unk_1E30C7818;
  block[4] = self;
  v5 = a3;
  dispatch_async(workerQueue, block);
}

void __43__MRDistantExternalDevice_sendButtonEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  -[MRDistantExternalDevice _hostedExternalDeviceConnection](*(void **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendButtonEventWithUsagePage:usage:down:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned __int8 *)(a1 + 48));

}

- (id)personalOutputDevices
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v2 = MEMORY[0x1E0C809B0];
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MRDistantExternalDevice_personalOutputDevices__block_invoke;
  v7[3] = &unk_1E30C6918;
  v7[4] = self;
  -[MRDistantExternalDevice _synchronousObjectProxyWithErrorHandler:](self, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __48__MRDistantExternalDevice_personalOutputDevices__block_invoke_255;
  v6[3] = &unk_1E30C7840;
  v6[4] = &v8;
  objc_msgSend(v3, "getPersonalOutputDevices:", v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __48__MRDistantExternalDevice_personalOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MRDistantExternalDevice_personalOutputDevices__block_invoke_2;
  v7[3] = &unk_1E30C5F40;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __48__MRDistantExternalDevice_personalOutputDevices__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %{public}@ failed to fetch personalOutputDevices: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

void __48__MRDistantExternalDevice_personalOutputDevices__block_invoke_255(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4
{
  id v6;
  NSObject *workerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MRDistantExternalDevice_hostedExternalDeviceConnectionStateDidChange_withError___block_invoke;
  block[3] = &unk_1E30C7610;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workerQueue, block);

}

void __82__MRDistantExternalDevice_hostedExternalDeviceConnectionStateDidChange_withError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  int v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __82__MRDistantExternalDevice_hostedExternalDeviceConnectionStateDidChange_withError___block_invoke_2;
  block[3] = &unk_1E30C7610;
  block[1] = 3221225472;
  block[4] = v1;
  v6 = *(_DWORD *)(a1 + 48);
  v5 = v2;
  dispatch_async(v3, block);

}

void __82__MRDistantExternalDevice_hostedExternalDeviceConnectionStateDidChange_withError___block_invoke_2(uint64_t a1)
{
  -[MRDistantExternalDevice _onSerialQueue_handleConnectionStateDidChange:withError:](*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48), *(void **)(a1 + 40));
}

- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3
{
  id v4;
  NSObject *workerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MRDistantExternalDevice_hostedExternalDeviceDeviceInfoDidChange___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workerQueue, v7);

}

void __67__MRDistantExternalDevice_hostedExternalDeviceDeviceInfoDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v11 = v3;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %{public}@ deviceInfo did change to \"%{public}@\", buf, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MRDistantExternalDevice_hostedExternalDeviceDeviceInfoDidChange___block_invoke_257;
  v8[3] = &unk_1E30C5F40;
  v8[4] = v5;
  v9 = v6;
  dispatch_async(v7, v8);

}

uint64_t __67__MRDistantExternalDevice_hostedExternalDeviceDeviceInfoDidChange___block_invoke_257(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceInfo:", *(_QWORD *)(a1 + 40));
}

- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  NSObject *workerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke;
  block[3] = &unk_1E30C7328;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workerQueue, block);

}

void __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "length");
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v12 = v3;
    v13 = 2048;
    v14 = v4;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %{public}@ did receive %llu bytes of custom data for name %{public}@", buf, 0x20u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke_258;
  block[3] = &unk_1E30C7328;
  block[4] = v6;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  dispatch_async(v7, block);

}

void __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke_258(id *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  objc_msgSend(a1[4], "customDataCallbackQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
  }

  objc_msgSend(a1[4], "customDataCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke_2;
    block[3] = &unk_1E30C6658;
    v11 = v7;
    v9 = a1[5];
    v10 = a1[6];
    dispatch_async(v4, block);

  }
}

uint64_t __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)hostedExternalDeviceEndpointDidChange:(id)a3
{
  id v4;
  NSObject *workerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MRDistantExternalDevice_hostedExternalDeviceEndpointDidChange___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workerQueue, v7);

}

void __65__MRDistantExternalDevice_hostedExternalDeviceEndpointDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  MRAVDistantEndpoint *v5;
  void *v6;
  MRAVDistantEndpoint *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v13 = v3;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p endpoint did change to %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setDistantExternalDevice:", *(_QWORD *)(a1 + 32));
  v5 = [MRAVDistantEndpoint alloc];
  objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRAVDistantEndpoint initWithDescriptor:](v5, "initWithDescriptor:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setDistantEndpoint:", v7);

  +[MRDistantExternalDevice _notificationSerialQueue]();
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__MRDistantExternalDevice_hostedExternalDeviceEndpointDidChange___block_invoke_259;
  v10[3] = &unk_1E30C5F40;
  v9 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v9;
  dispatch_async(v8, v10);

}

void __65__MRDistantExternalDevice_hostedExternalDeviceEndpointDidChange___block_invoke_259(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("kMRExternalDeviceEndpointUserInfoKeyEndpoint");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("kMRExternalDeviceEndpointDidChangeNotification"), v4, v5);

}

- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4
{
  id v6;
  NSObject *workerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MRDistantExternalDevice_hostedExternalDeviceVolumeCapabilitiesDidChange_forOutputDevice___block_invoke;
  block[3] = &unk_1E30C7610;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workerQueue, block);

}

void __91__MRDistantExternalDevice_hostedExternalDeviceVolumeCapabilitiesDidChange_forOutputDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  int v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(*(_DWORD *)(a1 + 48));
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "distantEndpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);

    *(_DWORD *)buf = 134218754;
    v16 = v3;
    v17 = 2114;
    v18 = v4;
    v19 = 2114;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p volume capabilities did change to %{public}@ for endpoint %{public}@ for output device %{public}@", buf, 0x2Au);

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(v9 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__MRDistantExternalDevice_hostedExternalDeviceVolumeCapabilitiesDidChange_forOutputDevice___block_invoke_261;
  block[3] = &unk_1E30C7610;
  block[1] = 3221225472;
  block[4] = v9;
  v14 = *(_DWORD *)(a1 + 48);
  v13 = v10;
  dispatch_async(v11, block);

}

void __91__MRDistantExternalDevice_hostedExternalDeviceVolumeCapabilitiesDidChange_forOutputDevice___block_invoke_261(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v2 = *(unsigned int *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateVolumeControlCapabilities:outputDeviceUID:", v2, v3);

}

- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4
{
  id v6;
  NSObject *workerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  float v11;

  v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke;
  block[3] = &unk_1E30C7610;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workerQueue, block);

}

void __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  int v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(float *)(a1 + 48);
    objc_msgSend(v3, "distantEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v14 = v3;
    v15 = 2048;
    v16 = v4;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p volume did change to %f for endpoint %{public}@ for output device  %{public}@", buf, 0x2Au);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke_262;
  block[3] = &unk_1E30C7610;
  block[1] = 3221225472;
  block[4] = v7;
  v12 = *(_DWORD *)(a1 + 48);
  v11 = v8;
  dispatch_async(v9, block);

}

void __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke_262(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v3 = *(_DWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = v3;
  objc_msgSend(v2, "updateVolume:outputDeviceUID:", v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "volumeCallbackQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
  }

  objc_msgSend(*(id *)(a1 + 32), "volumeCallback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke_2;
    v15[3] = &unk_1E30C7868;
    v12 = v11;
    v18 = *(_DWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v17 = v12;
    v15[4] = v13;
    v16 = v14;
    dispatch_async(v8, v15);

  }
}

void __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  float v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(float *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "distantEndpoint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, float))(v2 + 16))(v2, v4, v5, v3);

}

- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4
{
  id v6;
  NSObject *workerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MRDistantExternalDevice_hostedExternalDeviceIsMutedDidChange_forOutputDevice___block_invoke;
  block[3] = &unk_1E30C7890;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workerQueue, block);

}

void __80__MRDistantExternalDevice_hostedExternalDeviceIsMutedDidChange_forOutputDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  char v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(v3, "distantEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v14 = v3;
    v15 = 1024;
    v16 = v4;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p volume isMuted did change to %{BOOL}u for endpoint %{public}@ for output device %{public}@", buf, 0x26u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __80__MRDistantExternalDevice_hostedExternalDeviceIsMutedDidChange_forOutputDevice___block_invoke_263;
  block[3] = &unk_1E30C7890;
  block[1] = 3221225472;
  block[4] = v7;
  v12 = *(_BYTE *)(a1 + 48);
  v11 = v8;
  dispatch_async(v9, block);

}

void __80__MRDistantExternalDevice_hostedExternalDeviceIsMutedDidChange_forOutputDevice___block_invoke_263(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateVolumeMuted:outputDeviceUID:", v2, v3);

}

- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3
{
  id v4;
  NSObject *workerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__MRDistantExternalDevice_hostedExternalDeviceDidAddOutputDevice___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workerQueue, v7);

}

void __66__MRDistantExternalDevice_hostedExternalDeviceDidAddOutputDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "distantEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p did add outputDevice %{public}@ for endpoint %{public}@", buf, 0x20u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__MRDistantExternalDevice_hostedExternalDeviceDidAddOutputDevice___block_invoke_264;
  v9[3] = &unk_1E30C5F40;
  v9[4] = v6;
  v10 = v7;
  dispatch_async(v8, v9);

}

void __66__MRDistantExternalDevice_hostedExternalDeviceDidAddOutputDevice___block_invoke_264(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateOutputDevices:", v2);

}

- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3
{
  id v4;
  NSObject *workerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MRDistantExternalDevice_hostedExternalDeviceDidChangeOutputDevice___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workerQueue, v7);

}

void __69__MRDistantExternalDevice_hostedExternalDeviceDidChangeOutputDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "distantEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p did change outputDevice %{public}@ for endpoint %{public}@", buf, 0x20u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__MRDistantExternalDevice_hostedExternalDeviceDidChangeOutputDevice___block_invoke_265;
  v9[3] = &unk_1E30C5F40;
  v9[4] = v6;
  v10 = v7;
  dispatch_async(v8, v9);

}

void __69__MRDistantExternalDevice_hostedExternalDeviceDidChangeOutputDevice___block_invoke_265(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateOutputDevices:", v2);

}

- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3
{
  id v4;
  NSObject *workerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MRDistantExternalDevice_hostedExternalDeviceDidRemoveOutputDevice___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workerQueue, v7);

}

void __69__MRDistantExternalDevice_hostedExternalDeviceDidRemoveOutputDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "distantEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p did remove outputDevice %{public}@ for endpoint %{public}@", buf, 0x20u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__MRDistantExternalDevice_hostedExternalDeviceDidRemoveOutputDevice___block_invoke_266;
  v9[3] = &unk_1E30C5F40;
  v9[4] = v6;
  v10 = v7;
  dispatch_async(v8, v9);

}

void __69__MRDistantExternalDevice_hostedExternalDeviceDidRemoveOutputDevice___block_invoke_266(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeOutputDevices:", v3);

}

- (void)discoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  MRDistantExternalDevice *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  MRLogCategoryConnections();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[MRDistantExternalDevice distantEndpoint](self, "distantEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = self;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p discoveryOutputDevicesChanged for configuration %{public}@ for endpoint %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[MRExternalDevice notifyDiscoveryOutputDevicesChanged:forConfiguration:](self, "notifyDiscoveryOutputDevicesChanged:forConfiguration:", v7, v6);

}

void __51__MRDistantExternalDevice__notificationSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaRemote.MRDistantExternalDevice.NotificationQueue", v2);
  v1 = (void *)_notificationSerialQueue___notificationSerialQueue;
  _notificationSerialQueue___notificationSerialQueue = (uint64_t)v0;

}

void __66__MRDistantExternalDevice__nullableHostedExternalDeviceConnection__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 248));
}

- (id)_hostedExternalDeviceConnectionWithError:(uint64_t)a1
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!a1)
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  msv_dispatch_sync_on_queue();
  if (a2)
    *a2 = objc_retainAutorelease((id)v12[5]);
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
  return v3;
}

void __68__MRDistantExternalDevice__hostedExternalDeviceConnectionWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
  if (!v2)
  {
    v3 = (void *)MRGetSharedService();
    objc_msgSend(*(id *)(a1 + 32), "distantEndpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    MRMediaRemoteServiceGetExternalDevice(v3, v5, &obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v6 + 40), obj);

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v7);
      objc_msgSend(*(id *)(a1 + 32), "setHostedExternalDeviceConnection:", v8);

    }
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
}

void __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqualToString:](v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
LABEL_5:

    goto LABEL_6;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 == 4099)
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke_cold_1();
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __67__MRDistantExternalDevice__synchronousObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqualToString:](v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
LABEL_5:

    goto LABEL_6;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 == 4099)
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke_cold_1();
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __48__MRDistantExternalDevice__disconnectWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MRDistantExternalDevice__disconnectWithError___block_invoke_2;
  v4[3] = &unk_1E30C5F40;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __48__MRDistantExternalDevice__disconnectWithError___block_invoke_2(uint64_t a1)
{
  -[MRDistantExternalDevice _onSerialQueue_handleConnectionStateDidChange:withError:](*(_QWORD *)(a1 + 32), 3u, *(void **)(a1 + 40));
}

uint64_t __83__MRDistantExternalDevice__onSerialQueue_handleConnectionStateDidChange_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __83__MRDistantExternalDevice__onSerialQueue_handleConnectionStateDidChange_withError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("kMRExternalDeviceConnectionStateUserInfoKey"));

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x1E0CB3388]);
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("kMRExternalDeviceConnectionStateDidChangeNotification"), *(_QWORD *)(a1 + 40), v2);

}

void __63__MRDistantExternalDevice__updateHostedDeviceDesiredCallbacks___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRegisteredCallbacks:", *(_QWORD *)(a1 + 40));

}

void __67__MRDistantExternalDevice__updateHostedDeviceDesiredNotifications___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNotifications:", *(_QWORD *)(a1 + 40));

}

- (BOOL)hasEverAttemptedToConnect
{
  return self->_hasEverAttemptedToConnect;
}

- (unint64_t)notifications
{
  return self->_notifications;
}

- (id)connectionStateCallback
{
  return self->_connectionStateCallback;
}

- (void)setConnectionStateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (OS_dispatch_queue)connectionStateCallbackQueue
{
  return self->_connectionStateCallbackQueue;
}

- (void)setConnectionStateCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionStateCallbackQueue, a3);
}

- (id)customDataCallback
{
  return self->_customDataCallback;
}

- (void)setCustomDataCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (OS_dispatch_queue)customDataCallbackQueue
{
  return self->_customDataCallbackQueue;
}

- (void)setCustomDataCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_customDataCallbackQueue, a3);
}

- (id)volumeCallback
{
  return self->_volumeCallback;
}

- (void)setVolumeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (OS_dispatch_queue)volumeCallbackQueue
{
  return self->_volumeCallbackQueue;
}

- (void)setVolumeCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_volumeCallbackQueue, a3);
}

- (NSXPCConnection)hostedExternalDeviceConnection
{
  return self->_hostedExternalDeviceConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedExternalDeviceConnection, 0);
  objc_storeStrong((id *)&self->_volumeCallbackQueue, 0);
  objc_storeStrong(&self->_volumeCallback, 0);
  objc_storeStrong((id *)&self->_customDataCallbackQueue, 0);
  objc_storeStrong(&self->_customDataCallback, 0);
  objc_storeStrong((id *)&self->_connectionStateCallbackQueue, 0);
  objc_storeStrong(&self->_connectionStateCallback, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_pendingConnectionAttempts, 0);
  objc_storeStrong((id *)&self->_distantEndpoint, 0);
  objc_storeStrong((id *)&self->_externalOutputContext, 0);
  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
  objc_storeStrong((id *)&self->_customOrigin, 0);
  objc_storeStrong((id *)&self->_hasEverAttemptedToConnectDate, 0);
  objc_storeStrong((id *)&self->_connectionStateDate, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

- (void)connectWithOptions:(uint64_t)a1 userInfo:(NSObject *)a2 completion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = CFSTR("DistantExternalDevice.connectWithOptions");
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4_0(&dword_193827000, a2, a3, "No reason provided for %@<%@>", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSinceDate:", *(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_1(&dword_193827000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0();
}

void __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4();
  objc_msgSend(*(id *)(v1 + 48), "requestID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_193827000, v5, v6, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0();
}

void __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_193827000, v0, (uint64_t)v0, "%@ %@ in distantExternalDevice", v1);
  OUTLINED_FUNCTION_8();
}

@end
