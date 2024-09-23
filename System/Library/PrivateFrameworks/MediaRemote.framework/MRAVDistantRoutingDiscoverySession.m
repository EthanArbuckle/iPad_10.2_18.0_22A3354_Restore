@implementation MRAVDistantRoutingDiscoverySession

uint64_t __51__MRAVDistantRoutingDiscoverySession_discoveryMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 148);
  return result;
}

void __84__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpointsWithEndpoints___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
}

void __55__MRAVDistantRoutingDiscoverySession_setDiscoveryMode___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  CFStringRef v7;
  double v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  CFStringRef v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  CFStringRef v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 148) != *(_DWORD *)(a1 + 56))
  {
    v3 = *(_QWORD *)(v1 + 152);
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(a1 + 56));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "timeIntervalSinceNow");
        v17 = 138412802;
        v18 = v6;
        v19 = 2112;
        v20 = v7;
        v21 = 2048;
        v22 = -v8;
        v9 = "[DistantDiscoverySession] %@ - Discovery mode changed to: %@ after %lf seconds";
        v10 = v4;
        v11 = 32;
LABEL_7:
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v11);
      }
    }
    else if (v5)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(a1 + 56));
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v9 = "[DistantDiscoverySession] %@ - Discovery mode changed to: %@";
      v10 = v4;
      v11 = 22;
      goto LABEL_7;
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 148) = *(_DWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 152);
    *(_QWORD *)(v15 + 152) = v14;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 188);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __49__MRAVDistantRoutingDiscoverySession_description__block_invoke(uint64_t a1)
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
  MRMediaRemoteEndpointFeaturesDescription(*(_DWORD *)(v4 + 144));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 148));
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p> (%@ - %@)"), v3, v4, v9, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

id __56__MRAVDistantRoutingDiscoverySession__resolveEndpoints___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "connectionType") == 1)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_shouldAddLocalEndpoint"))
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "localEndpoint");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
LABEL_7:

  return v5;
}

id __63__MRAVDistantRoutingDiscoverySession__resolveDistantEndpoints___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "connectionType") == 1)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_shouldAddLocalEndpoint"))
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "distantLocalEndpoint");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (MRAVDistantEndpoint)distantLocalEndpoint
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
  v7 = __Block_byref_object_copy__17;
  v8 = __Block_byref_object_dispose__17;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVDistantEndpoint *)v2;
}

- (BOOL)_shouldAddLocalEndpoint
{
  void *v2;
  BOOL v3;

  +[MRAVClusterController sharedController](MRAVClusterController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clusterStatus") != 2;

  return v3;
}

- (MRAVLocalEndpoint)localEndpoint
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
  v7 = __Block_byref_object_copy__17;
  v8 = __Block_byref_object_dispose__17;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVLocalEndpoint *)v2;
}

void __51__MRAVDistantRoutingDiscoverySession_localEndpoint__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 216));
}

void __54__MRAVDistantRoutingDiscoverySession_distantEndpoints__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31[2];
  _QWORD v32[5];
  id v33[2];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (v3 != v2)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) == 0;
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v6)
        goto LABEL_8;
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v35 = v14;
      v36 = 2112;
      v37 = v15;
      v11 = "[DistantDiscoverySession] %@ Hosted routing connection set to %@";
      v12 = v5;
      v13 = 22;
    }
    else
    {
      if (!v6)
        goto LABEL_8;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(v7 + 208);
      objc_msgSend(*(id *)(v7 + 192), "timeIntervalSinceNow");
      *(_DWORD *)buf = 138413058;
      v35 = v7;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v8;
      v40 = 2048;
      v41 = -v10;
      v11 = "[DistantDiscoverySession] %@ Hosted routing connection set from %@ to %@ after %lf seconds";
      v12 = v5;
      v13 = 42;
    }
    _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_8:

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = v16;

    v18 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v18 + 208))
    {
      objc_initWeak((id *)buf, (id)v18);
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
      v20 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_83;
      v32[3] = &unk_1E30C9EB0;
      objc_copyWeak(v33, (id *)buf);
      v21 = *(_QWORD *)(a1 + 32);
      v33[1] = v19;
      v32[4] = v21;
      v22 = (void *)MEMORY[0x194036C44](v32);
      v30[0] = v20;
      v30[1] = 3221225472;
      v30[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_85;
      v30[3] = &unk_1E30C9ED8;
      objc_copyWeak(v31, (id *)buf);
      v31[1] = v19;
      v23 = (void *)MEMORY[0x194036C44](v30);
      objc_msgSend((id)objc_opt_class(), "serviceInterface");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setRemoteObjectInterface:", v24);

      objc_msgSend((id)objc_opt_class(), "clientInterface");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setExportedInterface:", v25);

      v26 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(v26 + 208), "exportedInterface");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "protocol");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[MRWeakProxy weakProxyWithObject:protocol:](MRWeakProxy, "weakProxyWithObject:protocol:", v26, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setExportedObject:", v29);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setInvalidationHandler:", v22);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setInterruptionHandler:", v23);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "resume");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 188) = 1;

      objc_destroyWeak(v31);
      objc_destroyWeak(v33);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      *(_BYTE *)(v18 + 188) = 0;
    }
  }
}

+ (id)serviceInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3062E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getAvailableEndpointsWithCompletion_, 0, 1);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getAvailableOutputDevicesWithCompletion_, 0, 1);

  return v2;
}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2DF600);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_availableEndpointsDidChange_, 0, 0);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_availableOutputDevicesDidChange_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_configurationWithCompletion_, 0, 1);

  return v2;
}

void __58__MRAVDistantRoutingDiscoverySession_distantLocalEndpoint__block_invoke(uint64_t a1)
{
  void *v2;
  MRAVDistantEndpoint *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  if (!v2)
  {
    v3 = [MRAVDistantEndpoint alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MRAVDistantEndpoint initWithDescriptor:](v3, "initWithDescriptor:", v4);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 224);
    *(_QWORD *)(v6 + 224) = v5;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __62__MRAVDistantRoutingDiscoverySession__hostedRoutingConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 188))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v1 + 208));
}

void __92__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevicesWithOutputDevices___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 168);
  *(_QWORD *)(v3 + 168) = v2;

}

void __70__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *WeakRetained;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
      -[NSObject _reloadAvailableDistantEndpointsWithEndpoints:](WeakRetained, "_reloadAvailableDistantEndpointsWithEndpoints:", v5);
  }
  else
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __70__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpoints__block_invoke_cold_1();
  }

}

- (void)_reloadAvailableDistantOutputDevicesWithOutputDevices:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  MRAVDistantRoutingDiscoverySession *v11;
  id v12;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __92__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevicesWithOutputDevices___block_invoke;
  v10 = &unk_1E30C5F40;
  v11 = self;
  v12 = v4;
  v6 = v4;
  dispatch_async(serialQueue, &v7);
  -[MRAVRoutingDiscoverySession notifyOutputDevicesChanged:](self, "notifyOutputDevicesChanged:", v6, v7, v8, v9, v10, v11);

}

- (void)_reloadAvailableDistantEndpointsWithEndpoints:(id)a3
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
  block[2] = __84__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpointsWithEndpoints___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  -[MRAVDistantRoutingDiscoverySession _notifyEndpointsChanged](self, "_notifyEndpointsChanged");

}

- (void)_notifyEndpointsChanged
{
  NSObject *serialQueue;
  _QWORD block[7];
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

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  v16 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__17;
  v9 = __Block_byref_object_dispose__17;
  v10 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRAVDistantRoutingDiscoverySession__notifyEndpointsChanged__block_invoke;
  block[3] = &unk_1E30C9F28;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v5;
  dispatch_sync(serialQueue, block);
  -[MRAVRoutingDiscoverySession notifyAvailableEndpointsChanged:discoveredEndpoints:](self, "notifyAvailableEndpointsChanged:discoveredEndpoints:", v12[5], v6[5]);
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

- (unsigned)discoveryMode
{
  _QWORD v4[3];
  int v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v5 = 0;
  msv_dispatch_sync_on_queue();
  LODWORD(self) = self->_discoveryMode;
  _Block_object_dispose(v4, 8);
  return self;
}

void __61__MRAVDistantRoutingDiscoverySession__notifyEndpointsChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "availableEndpoints");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "distantEndpoints");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)availableEndpoints
{
  void *v3;
  void *v4;

  -[MRAVDistantRoutingDiscoverySession distantEndpoints](self, "distantEndpoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVDistantRoutingDiscoverySession _resolveEndpoints:](self, "_resolveEndpoints:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)distantEndpoints
{
  void *v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = 0;
  v5 = MEMORY[0x1E0C809B0];
  msv_dispatch_sync_on_queue();
  -[MRAVDistantRoutingDiscoverySession _resolveDistantEndpoints:](self, "_resolveDistantEndpoints:", v8[5], v5, 3221225472, __54__MRAVDistantRoutingDiscoverySession_distantEndpoints__block_invoke, &unk_1E30C5D20, self, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v3;
}

- (id)_resolveDistantEndpoints:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__MRAVDistantRoutingDiscoverySession__resolveDistantEndpoints___block_invoke;
  v4[3] = &unk_1E30C9F78;
  v4[4] = self;
  objc_msgSend(a3, "msv_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_resolveEndpoints:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MRAVDistantRoutingDiscoverySession__resolveEndpoints___block_invoke;
  v4[3] = &unk_1E30C9F78;
  v4[4] = self;
  objc_msgSend(a3, "msv_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)distantOutputDevices
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
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__MRAVDistantRoutingDiscoverySession_distantOutputDevices__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __74__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *WeakRetained;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
      -[NSObject _reloadAvailableDistantOutputDevicesWithOutputDevices:](WeakRetained, "_reloadAvailableDistantOutputDevicesWithOutputDevices:", v5);
  }
  else
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __74__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevices__block_invoke_cold_1();
  }

}

uint64_t __60__MRAVDistantRoutingDiscoverySession_initWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForPerRoutingContextNotifications");
}

void __78__MRAVDistantRoutingDiscoverySession__reloadHostedRoutingServiceDiscoveryMode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __78__MRAVDistantRoutingDiscoverySession__reloadHostedRoutingServiceDiscoveryMode__block_invoke_cold_1();

  }
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  NSObject *serialQueue;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  unsigned int v10;
  _QWORD block[7];
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MRAVDistantRoutingDiscoverySession_setDiscoveryMode___block_invoke;
  block[3] = &unk_1E30C9E10;
  v12 = a3;
  block[4] = self;
  block[5] = &v13;
  block[6] = &v17;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v18 + 24))
  {
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __55__MRAVDistantRoutingDiscoverySession_setDiscoveryMode___block_invoke_79;
    v9[3] = &unk_1E30C9E38;
    v9[4] = self;
    v10 = a3;
    v7 = MEMORY[0x194036C44](v9);
    v8 = (void *)v7;
    if (*((_BYTE *)v14 + 24))
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    else
      -[MRAVDistantRoutingDiscoverySession _initializeHostedRoutingConnectionWithCompletion:](self, "_initializeHostedRoutingConnectionWithCompletion:", v7);

  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

- (MRAVDistantRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  id v4;
  MRAVDistantRoutingDiscoverySession *v5;
  objc_class *v6;
  const char *Name;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  uint64_t v11;
  NSString *routingContextUID;
  NSObject *v13;
  MRAVDistantRoutingDiscoverySession *v14;
  _QWORD block[4];
  MRAVDistantRoutingDiscoverySession *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRAVDistantRoutingDiscoverySession;
  v5 = -[MRAVRoutingDiscoverySession initWithConfiguration:](&v18, sel_initWithConfiguration_, v4);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(Name, v8);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v9;

    v5->_discoveryMode = 0;
    objc_msgSend(v4, "routingContextUID");
    v11 = objc_claimAutoreleasedReturnValue();
    routingContextUID = v5->_routingContextUID;
    v5->_routingContextUID = (NSString *)v11;

    v5->_endpointFeatures = objc_msgSend(v4, "features");
    v13 = v5->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MRAVDistantRoutingDiscoverySession_initWithConfiguration___block_invoke;
    block[3] = &unk_1E30C5CA8;
    v14 = v5;
    v17 = v14;
    dispatch_sync(v13, block);
    -[MRAVDistantRoutingDiscoverySession _initializeHostedRoutingConnectionWithCompletion:](v14, "_initializeHostedRoutingConnectionWithCompletion:", 0);

  }
  return v5;
}

- (void)_initializeHostedRoutingConnectionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned int endpointFeatures;
  qos_class_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MRGetSharedService();
  endpointFeatures = self->_endpointFeatures;
  v7 = qos_class_self();
  dispatch_get_global_queue(v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke;
  v10[3] = &unk_1E30C9F00;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v10[4] = self;
  v11 = v9;
  MRMediaRemoteServiceGetHostedRoutingXPCEndpoint(v5, endpointFeatures, v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_registerForPerRoutingContextNotifications
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  NSArray *notificationTokens;
  MRAVDistantEndpoint *distantLocalEndpoint;
  MRAVLocalEndpoint *v11;
  MRAVLocalEndpoint *localEndpoint;
  void *v13;
  void *v14;
  MRAVLocalEndpoint *v15;
  id v16;
  void *v17;
  void *v18;
  MRAVLocalEndpoint *v19;
  id v20;
  void *v21;
  void *v22;
  MRAVLocalEndpoint *v23;
  id v24;
  void *v25;
  NSArray *v26;
  NSArray *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = self->_notificationTokens;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObserver:", v7);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v4);
  }

  notificationTokens = self->_notificationTokens;
  self->_notificationTokens = 0;

  distantLocalEndpoint = self->_distantLocalEndpoint;
  self->_distantLocalEndpoint = 0;

  +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", self->_routingContextUID);
  v11 = (MRAVLocalEndpoint *)objc_claimAutoreleasedReturnValue();
  localEndpoint = self->_localEndpoint;
  self->_localEndpoint = v11;

  objc_initWeak(&location, self);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke;
  v34[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v35, &location);
  v13 = (void *)MEMORY[0x194036C44](v34);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_localEndpoint;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_3;
  v32[3] = &unk_1E30C9DE8;
  v16 = v13;
  v33 = v16;
  objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", CFSTR("MRAVEndpointDidAddOutputDeviceNotification"), v15, 0, v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_localEndpoint;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_4;
  v30[3] = &unk_1E30C9DE8;
  v20 = v16;
  v31 = v20;
  objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", CFSTR("MRAVEndpointDidRemoveOutputDeviceNotification"), v19, 0, v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self->_localEndpoint;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_5;
  v28[3] = &unk_1E30C9DE8;
  v24 = v20;
  v29 = v24;
  objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", CFSTR("MRAVEndpointDidChangeOutputDeviceNotification"), v23, 0, v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v17, v21, v25, 0);
  v27 = self->_notificationTokens;
  self->_notificationTokens = v26;

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (v5 && WeakRetained)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
    objc_msgSend(v8, "_setEndpoint:", v5);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v8);
    objc_msgSend(v7, "setHostedRoutingSessionConnection:", v9);
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(void))(v10 + 16))();

    goto LABEL_18;
  }
  _MRLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (a3 && v7)
  {
    if (v12)
      __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_1();
LABEL_16:

    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(void))(v14 + 16))();
    goto LABEL_18;
  }
  if (!v7)
  {
    if (v12)
      __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_3();
    goto LABEL_16;
  }
  if (v12)
    __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_2();

  v13 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v7, "_reloadAvailableDistantEndpointsWithEndpoints:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v7, "_reloadAvailableDistantOutputDevicesWithOutputDevices:", v13);
  objc_msgSend(v7, "_initializeHostedRoutingConnectionWithCompletion:", *(_QWORD *)(a1 + 40));
LABEL_18:

}

- (void)setHostedRoutingSessionConnection:(id)a3
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
  block[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  -[MRAVDistantRoutingDiscoverySession _reloadHostedRoutingServiceDiscoveryMode](self, "_reloadHostedRoutingServiceDiscoveryMode");
  -[MRAVDistantRoutingDiscoverySession _reloadAvailableDistantEndpoints](self, "_reloadAvailableDistantEndpoints");
  -[MRAVDistantRoutingDiscoverySession _reloadAvailableDistantOutputDevices](self, "_reloadAvailableDistantOutputDevices");

}

- (void)_reloadAvailableDistantOutputDevices
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[MRAVDistantRoutingDiscoverySession _hostedRoutingConnection](self, "_hostedRoutingConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevices__block_invoke;
  v5[3] = &unk_1E30C9F50;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "getAvailableOutputDevicesWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_reloadAvailableDistantEndpoints
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[MRAVDistantRoutingDiscoverySession _hostedRoutingConnection](self, "_hostedRoutingConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpoints__block_invoke;
  v5[3] = &unk_1E30C9F50;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "getAvailableEndpointsWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_reloadHostedRoutingServiceDiscoveryMode
{
  void *v3;
  id v4;

  -[MRAVDistantRoutingDiscoverySession _hostedRoutingConnection](self, "_hostedRoutingConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDiscoveryMode:withCompletion:", -[MRAVDistantRoutingDiscoverySession discoveryMode](self, "discoveryMode"), &__block_literal_global_103_0);

}

- (id)_hostedRoutingConnection
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
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__MRAVDistantRoutingDiscoverySession__hostedRoutingConnection__block_invoke;
  v5[3] = &unk_1E30C5F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSString)description
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
  v7 = __Block_byref_object_copy__17;
  v8 = __Block_byref_object_dispose__17;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __58__MRAVDistantRoutingDiscoverySession_distantOutputDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2(uint64_t result)
{
  id *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  dispatch_time_t v20;
  qos_class_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD block[4];
  id v27;

  v1 = (id *)(result + 32);
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 208) == *(_QWORD *)(result + 48))
  {
    v2 = result;
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_cold_2((uint64_t)v1, v3, v4, v5, v6, v7, v8, v9);

    v10 = (void *)*((_QWORD *)*v1 + 26);
    *((_QWORD *)*v1 + 26) = 0;

    *((_BYTE *)*v1 + 188) = 0;
    if (*((_DWORD *)*v1 + 37)
      || (objc_msgSend(*(id *)(v2 + 40), "configuration"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "alwaysAllowUpdates"),
          v11,
          v12))
    {
      _MRLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_cold_1((uint64_t)v1, v13, v14, v15, v16, v17, v18, v19);

      v20 = dispatch_time(0, 1000000000);
      v21 = qos_class_self();
      dispatch_get_global_queue(v21, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_84;
      block[3] = &unk_1E30C5CA8;
      v27 = *v1;
      dispatch_after(v20, v22, block);

    }
    v23 = (void *)*((_QWORD *)*v1 + 20);
    *((_QWORD *)*v1 + 20) = 0;

    v24 = (void *)*((_QWORD *)*v1 + 21);
    *((_QWORD *)*v1 + 21) = 0;

    v25 = MEMORY[0x1E0C9AA60];
    objc_msgSend(*v1, "notifyEndpointsChanged:", MEMORY[0x1E0C9AA60]);
    return objc_msgSend(*v1, "notifyOutputDevicesChanged:", v25);
  }
  return result;
}

void __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = WeakRetained[17];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_2;
    block[3] = &unk_1E30C5CA8;
    block[4] = v3;
    dispatch_sync(v2, block);
    objc_msgSend(v3, "_notifyEndpointsChanged");
    WeakRetained = v3;
  }

}

void __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 224);
  *(_QWORD *)(v1 + 224) = 0;

}

uint64_t __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_hostedRoutingSessionConnection, "invalidate");
  notify_cancel(self->_serviceResetNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)MRAVDistantRoutingDiscoverySession;
  -[MRAVDistantRoutingDiscoverySession dealloc](&v3, sel_dealloc);
}

- (unsigned)endpointFeatures
{
  return self->_endpointFeatures;
}

uint64_t __55__MRAVDistantRoutingDiscoverySession_setDiscoveryMode___block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_reloadHostedRoutingServiceDiscoveryMode");
  if (*(_DWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_reloadAvailableDistantEndpoints");
    return objc_msgSend(*(id *)(a1 + 32), "_reloadAvailableDistantOutputDevices");
  }
  return result;
}

- (BOOL)devicePresenceDetected
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MRAVDistantRoutingDiscoverySession _hostedRoutingConnection](self, "_hostedRoutingConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_81;
  v5[3] = &unk_1E30C9E60;
  v5[4] = &v6;
  objc_msgSend(v3, "getDevicePresenceDetectedWithCompletion:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_cold_1();

  }
}

void __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_81(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

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
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__MRAVDistantRoutingDiscoverySession_routingContextUID__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__MRAVDistantRoutingDiscoverySession_routingContextUID__block_invoke(uint64_t a1)
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
  block[2] = __59__MRAVDistantRoutingDiscoverySession_setRoutingContextUID___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  -[MRAVDistantRoutingDiscoverySession _reloadAvailableDistantEndpoints](self, "_reloadAvailableDistantEndpoints");

}

uint64_t __59__MRAVDistantRoutingDiscoverySession_setRoutingContextUID___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[22] != *(_QWORD *)(a1 + 40))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 176);
    *(_QWORD *)(v4 + 176) = v3;

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_registerForPerRoutingContextNotifications");
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_83(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained[17];
    block[1] = 3221225472;
    block[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2;
    block[3] = &unk_1E30C9E88;
    v7 = WeakRetained;
    block[0] = MEMORY[0x1E0C809B0];
    v4 = WeakRetained;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v10 = v6;
    v11 = v5;
    dispatch_sync(v3, block);

    WeakRetained = v7;
  }

}

uint64_t __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeHostedRoutingConnectionWithCompletion:", 0);
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_85(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[17];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_3;
    v7[3] = &unk_1E30C78E0;
    v5 = WeakRetained;
    v6 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    v9 = v6;
    dispatch_async(v4, v7);

  }
}

uint64_t __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = result + 32;
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 208) == *(_QWORD *)(result + 40))
  {
    _MRLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_3_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

    return objc_msgSend(*(id *)(*(_QWORD *)v1 + 208), "invalidate");
  }
  return result;
}

- (NSString)debugDescription
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
  v7 = __Block_byref_object_copy__17;
  v8 = __Block_byref_object_dispose__17;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __54__MRAVDistantRoutingDiscoverySession_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "msv_map:", &__block_literal_global_91_1);
  v2 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = (id)v2;
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  MRMediaRemoteEndpointFeaturesDescription(*(_DWORD *)(v4 + 144));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 148));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "timeIntervalSinceNow");
  v8 = -v7;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v9 + 176);
  objc_msgSend(*(id *)(v9 + 168), "mr_formattedDebugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mr_formattedDebugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v13 + 188))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v15 = *(_QWORD *)(v13 + 208);
  objc_msgSend(*(id *)(v13 + 192), "timeIntervalSinceNow");
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p> (%@)\n  discoveryMode = %@ (%lf seconds ago)\n  routingContext = %@\n  outputDevices = %@\n  endpoints = %@\n  hostedRoutingConnectionDidInitialize = %@\n  connection = %@ (%lf seconds ago)\n}>"), v3, v4, v5, v6, *(_QWORD *)&v8, v10, v11, v12, v14, v15, -v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

}

id __54__MRAVDistantRoutingDiscoverySession_debugDescription__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "debugName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@"), v5);
  return v6;
}

- (void)configurationWithCompletion:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[MRAVRoutingDiscoverySession configuration](self, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSXPCConnection)hostedRoutingSessionConnection
{
  return self->_hostedRoutingSessionConnection;
}

- (void)setLocalEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_localEndpoint, a3);
}

- (void)setDistantLocalEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_distantLocalEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distantLocalEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_hostedRoutingSessionConnection, 0);
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  objc_storeStrong((id *)&self->_hostedRoutingConnectionDate, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_distantOutputDevices, 0);
  objc_storeStrong((id *)&self->_distantEndpoints, 0);
  objc_storeStrong((id *)&self->_discoveryModeDate, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[DistantDiscoverySession] Failed to retrieve endpoint availability state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[DistantDiscoverySession] %@ Hosted routing connection invalidated, attemping to reconnect...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[DistantDiscoverySession] %@ Hosted routing connection invalidated...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[DistantDiscoverySession] %@ Hosted routing connection interrupted, invalidating...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_193827000, v0, v1, "[DistantDiscoverySession] %@ ERROR: Failed to fetch hosted routing XPC endpoint. %{public}@");
  OUTLINED_FUNCTION_8();
}

void __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_193827000, v0, v1, "[DistantDiscoverySession] %@ ERROR: Failed to fetch hosted routing XPC endpoint. Will retry. %{public}@");
  OUTLINED_FUNCTION_8();
}

void __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[DistantDiscoverySession] ERROR: Failed to fetch hosted routing XPC endpoint. Will not retry since routing discovery session went away. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __78__MRAVDistantRoutingDiscoverySession__reloadHostedRoutingServiceDiscoveryMode__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[DistantDiscoverySession] Error setting discovery mode on hosted routing session. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __70__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpoints__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[DistantDiscoverySession] Error fetching distant endpoints from hosted routing session: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __74__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevices__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[DistantDiscoverySession] Error fetching distant output devices from hosted routing session: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
