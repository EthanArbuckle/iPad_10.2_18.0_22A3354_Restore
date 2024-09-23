@implementation MRAVExternalRoutingDiscoverySession

- (MRAVExternalRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  id v6;
  MRAVExternalRoutingDiscoverySession *v7;
  void *v8;
  MRAVLightweightReconnaissanceSession *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MRAVExternalRoutingDiscoverySession;
  v7 = -[MRAVRoutingDiscoverySession initWithConfiguration:](&v20, sel_initWithConfiguration_, v6);
  if (v7)
  {
    objc_msgSend(v6, "outputDeviceUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MRAVExternalRoutingDiscoverySession.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.outputDeviceUID"));

    }
    objc_storeStrong((id *)&v7->_configuration, a3);
    objc_initWeak(&location, v7);
    v9 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__MRAVExternalRoutingDiscoverySession_initWithConfiguration___block_invoke;
    v17[3] = &unk_1E30C6FB0;
    v18 = v6;
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __61__MRAVExternalRoutingDiscoverySession_initWithConfiguration___block_invoke_2;
    v15[3] = &unk_1E30C6FD8;
    objc_copyWeak(&v16, &location);
    -[MRAVLightweightReconnaissanceSession searchEndpointsWithPredicate:timeout:reason:queue:completion:](v9, "searchEndpointsWithPredicate:timeout:reason:queue:completion:", v17, CFSTR("MRAVExternalRoutingDiscoverySession"), v11, v15, 7.0);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __61__MRAVExternalRoutingDiscoverySession_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "designatedGroupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canBeAirPlayReceiver");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "outputDeviceUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "containsOutputDeviceWithUID:", v6);
  }
  else
  {
    objc_msgSend(v3, "designatedGroupLeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "outputDeviceUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  return v7;
}

void __61__MRAVExternalRoutingDiscoverySession_initWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setDestination:", v3);

}

- (id)description
{
  MRAVExternalRoutingDiscoverySession *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  MRMediaRemoteEndpointFeaturesDescription(-[MRAVExternalRoutingDiscoverySession endpointFeatures](v2, "endpointFeatures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v2->_discoveryMode);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (%@ - %@)"), v4, v2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v7;
}

- (id)debugDescription
{
  MRAVExternalRoutingDiscoverySession *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MRAVExternalRoutingDiscoverySession description](v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVExternalRoutingDiscoverySession availableOutputDevices](v2, "availableOutputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_externalDeviceDiscoveryToken)
    -[MRExternalDevice unregisterDiscoveryToken:](self->_externalDevice, "unregisterDiscoveryToken:");
  v3.receiver = self;
  v3.super_class = (Class)MRAVExternalRoutingDiscoverySession;
  -[MRAVExternalRoutingDiscoverySession dealloc](&v3, sel_dealloc);
}

- (unsigned)discoveryMode
{
  MRAVExternalRoutingDiscoverySession *v2;
  unsigned int discoveryMode;

  v2 = self;
  objc_sync_enter(v2);
  discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3;
  MRAVExternalRoutingDiscoverySession *obj;

  v3 = *(_QWORD *)&a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_discoveryMode != (_DWORD)v3)
  {
    obj->_discoveryMode = v3;
    -[MRExternalDevice setDiscoveryMode:forToken:](obj->_externalDevice, "setDiscoveryMode:forToken:", v3, obj->_externalDeviceDiscoveryToken);
  }
  objc_sync_exit(obj);

}

- (unsigned)endpointFeatures
{
  MRAVExternalRoutingDiscoverySession *v2;
  unsigned int v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[MRAVRoutingDiscoverySessionConfiguration features](v2->_configuration, "features");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)devicePresenceDetected
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((-[MRAVExternalRoutingDiscoverySession endpointFeatures](self, "endpointFeatures") & 1) != 0)
  {
    -[MRAVExternalRoutingDiscoverySession availableOutputDevices](self, "availableOutputDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = v4;
    v3 = objc_msgSend(v4, "count") != 0;

    return v3;
  }
  if ((-[MRAVExternalRoutingDiscoverySession endpointFeatures](self, "endpointFeatures") & 8) != 0)
  {
    -[MRAVExternalRoutingDiscoverySession availableEndpoints](self, "availableEndpoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  return 0;
}

- (void)setDestination:(id)a3
{
  id v5;
  MRAVExternalRoutingDiscoverySession *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_destination, a3);
  if (v5)
  {
    v10 = CFSTR("MREndpointConnectionReasonUserInfoKey");
    v11[0] = CFSTR("MRAVExternalRoutingDiscoverySession");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__MRAVExternalRoutingDiscoverySession_setDestination___block_invoke;
    v8[3] = &unk_1E30C7000;
    v8[4] = v6;
    v9 = v5;
    objc_msgSend(v9, "connectToExternalDeviceWithUserInfo:completion:", v7, v8);

  }
  else
  {
    -[MRAVExternalRoutingDiscoverySession setExternalDevice:](v6, "setExternalDevice:", 0);
  }
  objc_sync_exit(v6);

}

void __54__MRAVExternalRoutingDiscoverySession_setDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = *(void **)(a1 + 40);
  if (v4 == *(void **)(*(_QWORD *)(a1 + 32) + 160))
  {
    objc_msgSend(v4, "externalDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExternalDevice:", v5);

  }
  objc_sync_exit(v3);

}

- (id)destinationOutputDeviceUID
{
  MRAVExternalRoutingDiscoverySession *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[MRAVRoutingDiscoverySessionConfiguration outputDeviceUID](v2->_configuration, "outputDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)setExternalDevice:(id)a3
{
  id v5;
  void *v6;
  id externalDeviceDiscoveryToken;
  MRExternalDevice *externalDevice;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v5 = a3;
  if (self->_externalDeviceDiscoveryToken)
    -[MRExternalDevice unregisterDiscoveryToken:](self->_externalDevice, "unregisterDiscoveryToken:");
  objc_storeStrong((id *)&self->_externalDevice, a3);
  objc_initWeak(&location, self);
  -[MRExternalDevice registerDiscoveryTokenForConfiguration:](self->_externalDevice, "registerDiscoveryTokenForConfiguration:", self->_configuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  externalDeviceDiscoveryToken = self->_externalDeviceDiscoveryToken;
  self->_externalDeviceDiscoveryToken = v6;

  externalDevice = self->_externalDevice;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __57__MRAVExternalRoutingDiscoverySession_setExternalDevice___block_invoke;
  v12 = &unk_1E30C7050;
  objc_copyWeak(&v13, &location);
  -[MRExternalDevice setDiscoveryOutputDevicesChangedCallback:forToken:](externalDevice, "setDiscoveryOutputDevicesChangedCallback:forToken:", &v9, self->_externalDeviceDiscoveryToken);
  -[MRExternalDevice setDiscoveryMode:forToken:](self->_externalDevice, "setDiscoveryMode:forToken:", self->_discoveryMode, self->_externalDeviceDiscoveryToken, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __57__MRAVExternalRoutingDiscoverySession_setExternalDevice___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__MRAVExternalRoutingDiscoverySession_setExternalDevice___block_invoke_2;
    v7[3] = &unk_1E30C7028;
    v7[4] = WeakRetained;
    objc_msgSend(v6, "msv_map:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notifyOutputDevicesChanged:", v5);

  }
}

MRAVDistantOutputDevice *__57__MRAVExternalRoutingDiscoverySession_setExternalDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MRAVDistantOutputDevice *v10;

  v3 = a2;
  if ((objc_msgSend(v3, "isLocalDevice") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "destinationOutputDeviceUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputDeviceWithUID:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLocalDevice"))
    objc_msgSend(v7, "setIsGroupable:", objc_msgSend(v3, "isGroupable"));
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "designatedGroupLeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransportType:", objc_msgSend(v9, "transportType"));

  v10 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v7);
  return v10;
}

- (MRAVEndpoint)destination
{
  return self->_destination;
}

- (MRExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong(&self->_externalDeviceDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
