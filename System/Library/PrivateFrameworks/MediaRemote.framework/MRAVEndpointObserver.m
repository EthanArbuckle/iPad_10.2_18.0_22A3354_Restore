@implementation MRAVEndpointObserver

- (MRAVEndpointObserver)initWithOutputDeviceUID:(id)a3
{
  return -[MRAVEndpointObserver initWithOutputDeviceUID:label:callback:](self, "initWithOutputDeviceUID:label:callback:", a3, CFSTR("None Specified"), 0);
}

- (MRAVEndpointObserver)initWithOutputDeviceUID:(id)a3 label:(id)a4 callback:(id)a5
{
  id v9;
  id v10;
  id v11;
  MRAVEndpointObserver *v12;
  MRAVEndpointObserver *v13;
  uint64_t v14;
  id endpointChangedCallback;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MRAVEndpointObserver;
  v12 = -[MRAVEndpointObserver init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_outputDeviceUID, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    v14 = objc_msgSend(v11, "copy");
    endpointChangedCallback = v13->_endpointChangedCallback;
    v13->_endpointChangedCallback = (id)v14;

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEndpointObserver:", v13);

  }
  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  MRAVEndpointObserver *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRAVEndpointObserver] Dealloc %@", buf, 0xCu);
  }

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEndpointObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)MRAVEndpointObserver;
  -[MRAVEndpointObserver dealloc](&v5, sel_dealloc);
}

- (id)description
{
  id v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  if (self->_didBegin)
    v5 = &stru_1E30D5AF8;
  else
    v5 = CFSTR("NOT ");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p %@:%@ %@Observing>"), v4, self, self->_outputDeviceUID, self->_label, v5);
}

- (id)debugDescription
{
  MRAVEndpointObserver *v2;
  id v3;
  uint64_t v4;
  NSString *outputDeviceUID;
  NSString *label;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  outputDeviceUID = v2->_outputDeviceUID;
  label = v2->_label;
  if (v2->_didBegin)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)MEMORY[0x194036C44](v2->_endpointChangedCallback);
  -[MRAVEndpoint debugName](v2->_endpoint, "debugName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v2->_discoverySession);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p {\n   outputDevice=%@\n   label=%@\n   observing=%@\n   callback=%@\n   endpoint=%@\n   discoverySession=%@\n}>\n"), v4, v2, outputDeviceUID, label, v7, v8, v10, v11);

  objc_sync_exit(v2);
  return v12;
}

- (void)setEndpointChangedCallback:(id)a3
{
  MRAVEndpointObserver *v4;
  uint64_t v5;
  id endpointChangedCallback;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  endpointChangedCallback = v4->_endpointChangedCallback;
  v4->_endpointChangedCallback = (id)v5;

  objc_sync_exit(v4);
}

- (id)endpointChangedCallback
{
  MRAVEndpointObserver *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(v2->_endpointChangedCallback, "copy");
  objc_sync_exit(v2);

  v4 = (void *)MEMORY[0x194036C44](v3);
  return v4;
}

- (void)begin
{
  NSObject *v2;
  MRAVRoutingDiscoverySession *discoverySession;
  uint64_t v4;
  MRAVRoutingDiscoverySession *v5;
  void *v6;
  void *v7;
  MRAVEndpointObserver *obj;
  uint8_t buf[4];
  MRAVEndpointObserver *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_didBegin)
  {
    objc_sync_exit(obj);

  }
  else
  {
    _MRLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = obj;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRAVEndpointObserver] Begin Observing %@", buf, 0xCu);
    }

    obj->_didBegin = 1;
    if (obj->_outputDeviceUID)
    {
      discoverySession = obj->_discoverySession;
      if (!discoverySession)
      {
        -[MRAVEndpointObserver _initializeDiscoverySession](obj);
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = obj->_discoverySession;
        obj->_discoverySession = (MRAVRoutingDiscoverySession *)v4;

        discoverySession = obj->_discoverySession;
      }
      -[MRAVRoutingDiscoverySession setDiscoveryMode:](discoverySession, "setDiscoveryMode:", 2);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRAVOutputContext sharedAudioPresentationContext](MRAVOutputContext, "sharedAudioPresentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", obj, sel__handleOutputContextDidChangeNotification, CFSTR("kMRAVOutputContextDevicesDidChangeNotification"), v7);

    objc_sync_exit(obj);
    -[MRAVEndpointObserver _reevaluateEndpoint](obj);
  }
}

- (id)_initializeDiscoverySession
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;
  id location;

  if (!a1)
    return 0;
  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVEndpointObserver__initializeDiscoverySession__block_invoke;
  v5[3] = &unk_1E30C7050;
  objc_copyWeak(&v6, &location);
  v3 = (id)objc_msgSend(v2, "addEndpointsChangedCallback:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_reevaluateEndpoint
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  int v17;
  id *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v1 = a1;
  objc_sync_enter(v1);
  -[MRAVEndpointObserver _endpointContainingOutputDevice:](v1, v1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1[6], "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      _MRLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v1[6], "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1[6], "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "localizedName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138413314;
        v18 = v1;
        v19 = 2112;
        v20 = v10;
        v21 = 2114;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        v25 = 2114;
        v26 = v13;
        _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRAVEndpointObserver] %@ endpoint changed from <%@> (<%{public}@>) to <%@> (<%{public}@>)", (uint8_t *)&v17, 0x34u);

      }
      if (objc_msgSend(v2, "isLocalEndpoint"))
      {
        +[MRAVLocalEndpoint sharedLocalEndpoint](MRAVLocalEndpoint, "sharedLocalEndpoint");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = v2;
      }
      v16 = v1[6];
      v1[6] = v14;

      v15 = (void (**)(_QWORD, _QWORD))objc_msgSend(v1[3], "copy");
      goto LABEL_12;
    }
  }
  v15 = 0;
LABEL_12:
  objc_sync_exit(v1);

  if (v15)
    ((void (**)(_QWORD, void *))v15)[2](v15, v2);

}

void __51__MRAVEndpointObserver__initializeDiscoverySession__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    -[MRAVEndpointObserver _handleEndpointsDidChange:](WeakRetained, v5);

}

- (void)_handleEndpointsDidChange:(void *)a1
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = objc_msgSend(v6, "copy");
    v5 = (void *)v3[2];
    v3[2] = v4;

    objc_sync_exit(v3);
    -[MRAVEndpointObserver _reevaluateEndpoint](v3);
  }

}

- (void)end
{
  MRAVEndpointObserver *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  MRAVEndpointObserver *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_didBegin)
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRAVEndpointObserver] End Observing %@", (uint8_t *)&v6, 0xCu);
    }

    v2->_didBegin = 0;
    if (v2->_outputDeviceUID)
      -[MRAVRoutingDiscoverySession setDiscoveryMode:](v2->_discoverySession, "setDiscoveryMode:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRAVOutputContext sharedAudioPresentationContext](MRAVOutputContext, "sharedAudioPresentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", v2, CFSTR("kMRAVOutputContextDevicesDidChangeNotification"), v5);

  }
  objc_sync_exit(v2);

}

- (_QWORD)_endpointContainingOutputDevice:(_QWORD *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "addObjectsFromArray:", a1[2], 0);
    a1 = (_QWORD *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (a1)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v4);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6);
          if ((objc_msgSend(v7, "containsOutputDeviceWithUID:", v3) & 1) != 0)
          {
            a1 = v7;
            goto LABEL_12;
          }
          v6 = (_QWORD *)((char *)v6 + 1);
        }
        while (a1 != v6);
        a1 = (_QWORD *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (a1)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return a1;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong(&self->_endpointChangedCallback, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
}

@end
