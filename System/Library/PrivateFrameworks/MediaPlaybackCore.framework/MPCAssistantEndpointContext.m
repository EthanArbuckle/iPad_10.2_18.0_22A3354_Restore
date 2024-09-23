@implementation MPCAssistantEndpointContext

- (MPCAssistantEndpointContext)init
{
  MPCAssistantEndpointContext *v2;
  MPCAssistantDiscovery *v3;
  MPCAssistantDiscovery *discoveryLogical;
  MPCAssistantDiscovery *v5;
  MPCAssistantDiscovery *discoveryAudio;
  MPCAssistantDiscovery *v7;
  MPCAssistantDiscovery *discoveryEndpoint;
  uint64_t v9;
  OS_dispatch_queue *callbackQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPCAssistantEndpointContext;
  v2 = -[MPCAssistantContext init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MPCAssistantDiscovery);
    discoveryLogical = v2->_discoveryLogical;
    v2->_discoveryLogical = v3;

    v5 = objc_alloc_init(MPCAssistantDiscovery);
    discoveryAudio = v2->_discoveryAudio;
    v2->_discoveryAudio = v5;

    v7 = objc_alloc_init(MPCAssistantDiscovery);
    discoveryEndpoint = v2->_discoveryEndpoint;
    v2->_discoveryEndpoint = v7;

    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)modifySystemMusicContextForDestination:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__MPCAssistantEndpointContext_modifySystemMusicContextForDestination_completion___block_invoke;
  v8[3] = &unk_24CAB6B08;
  v9 = v6;
  v7 = v6;
  -[MPCAssistantEndpointContext modifySystemMusicContextForEndpointDestination:completion:](self, "modifySystemMusicContextForEndpointDestination:completion:", a3, v8);

}

- (void)modifySystemMusicContextForEndpointDestination:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE65538], "localOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v8 = v5;
  v9 = v6;
  MRMediaRemoteGetDeviceInfo();

}

- (void)modifySystemMusicContextForEndpointDestination:(id)a3 discoveryHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  MPCAssistantEndpointContext *v19;
  MPCAssistantDiscovery *discoveryAudio;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void (*v27)(_QWORD *, id, _QWORD, _QWORD *);
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  MPCAssistantEndpointContext *v33;
  id v34;
  _QWORD aBlock[5];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  MPCAssistantEndpointContext *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BE65500], "localDeviceInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke;
  aBlock[3] = &unk_24CAB6C18;
  aBlock[4] = self;
  v13 = v11;
  v36 = v13;
  v14 = v10;
  v37 = v14;
  v15 = v9;
  v38 = v15;
  v16 = _Block_copy(aBlock);
  objc_msgSend(v8, "outputGroupID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "outputGroupID");
      v19 = (MPCAssistantEndpointContext *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v19;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "Discover devices of group: %{public}@", buf, 0xCu);

    }
    discoveryAudio = self->_discoveryAudio;
    objc_msgSend(v8, "outputGroupID");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantDiscovery discoverAirplayDevicesMatchingGroupID:completion:](discoveryAudio, "discoverAirplayDevicesMatchingGroupID:completion:", v21, v16);
  }
  else
  {
    objc_msgSend(v8, "outputDeviceUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      objc_msgSend(v8, "outputDeviceUIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_15;
      v31[3] = &unk_24CAB6B58;
      v32 = v8;
      v33 = self;
      v34 = v16;
      -[MPCAssistantEndpointContext _updateDiscoverableDeviceList:deviceInfo:completion:](self, "_updateDiscoverableDeviceList:deviceInfo:completion:", v24, v13, v31);

      v21 = v32;
    }
    else
    {
      MRAVEndpointGetLocalEndpoint();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v40 = self;
        _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Sending default local endpoint to caller", buf, 0xCu);
      }

      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_16;
      v28[3] = &unk_24CAB6C40;
      v29 = v25;
      v30 = v14;
      v27 = (void (*)(_QWORD *, id, _QWORD, _QWORD *))v15[2];
      v21 = v25;
      v27(v15, v21, 0, v28);

    }
  }

}

- (void)_updateDiscoverableDeviceList:(id)a3 deviceInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  MPCAssistantDiscovery *discoveryLogical;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  MPCAssistantEndpointContext *v21;
  void (**v22)(id, id);
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  objc_msgSend(v9, "deviceUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "containsObject:", v11))
    goto LABEL_8;
  objc_msgSend(v9, "tightSyncUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
  {

LABEL_8:
    goto LABEL_9;
  }
  v13 = -[MPCAssistantEndpointContext shouldSearchForLogicalDevices](self, "shouldSearchForLogicalDevices");

  if (!v13)
  {
LABEL_9:
    v10[2](v10, v8);
    goto LABEL_10;
  }
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "tightSyncUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v15;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "Discover logical devices: %{public}@", buf, 0xCu);

  }
  discoveryLogical = self->_discoveryLogical;
  objc_msgSend(v9, "tightSyncUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __83__MPCAssistantEndpointContext__updateDiscoverableDeviceList_deviceInfo_completion___block_invoke;
  v19[3] = &unk_24CAB6B58;
  v20 = v8;
  v21 = self;
  v22 = v10;
  -[MPCAssistantDiscovery discoverAirplayDevicesMatchingLogicalDeviceIDs:expectedCount:completion:](discoveryLogical, "discoverAirplayDevicesMatchingLogicalDeviceIDs:expectedCount:completion:", v18, 1, v19);

LABEL_10:
}

- (void)_discoverLocalEndpointFromDeviceInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(void *, void *);
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("discoverLocalEndpointFromDeviceInfo"), v10);
  objc_msgSend(v6, "deviceUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "deviceUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v11, "appendFormat:", CFSTR(" for %@"), v13);

  }
  _MRLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v11;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__MPCAssistantEndpointContext__discoverLocalEndpointFromDeviceInfo_completion___block_invoke;
  aBlock[3] = &unk_24CAB6C68;
  v15 = v6;
  v32 = v15;
  v16 = v10;
  v33 = v16;
  v17 = v8;
  v34 = v17;
  v18 = v7;
  v35 = v18;
  v19 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BE654B8], "sharedController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "clusterType");

  objc_msgSend(v15, "deviceUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23)
  {
    switch(v21)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BE65580], "currentSettings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isMultiplayerHost");

        if (!v25)
          goto LABEL_14;
        _MRLogForCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v37 = CFSTR("discoverLocalEndpointFromDeviceInfo");
          v38 = 2114;
          v39 = v16;
          v40 = 2112;
          v41 = CFSTR("Multiplayer");
          _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        -[MPCAssistantEndpointContext _discoverLocalEndpointFromMultiplayerUsingDeviceInfo:completion:](self, "_discoverLocalEndpointFromMultiplayerUsingDeviceInfo:completion:", v15, v19);
        break;
      case 1:
        _MRLogForCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_DWORD *)buf = 138543874;
        v37 = CFSTR("discoverLocalEndpointFromDeviceInfo");
        v38 = 2114;
        v39 = v16;
        v40 = 2112;
        v41 = CFSTR("Stereo Pair");
        goto LABEL_22;
      case 2:
        _MRLogForCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v37 = CFSTR("discoverLocalEndpointFromDeviceInfo");
          v38 = 2114;
          v39 = v16;
          v40 = 2112;
          v41 = CFSTR("Home Theater");
          _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        -[MPCAssistantEndpointContext _discoverLocalEndpointFromHomeTheaterUsingDeviceInfo:completion:](self, "_discoverLocalEndpointFromHomeTheaterUsingDeviceInfo:completion:", v15, v19);
        break;
      case 3:
        _MRLogForCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v37 = CFSTR("discoverLocalEndpointFromDeviceInfo");
          v38 = 2114;
          v39 = v16;
          v40 = 2112;
          v41 = CFSTR("Generic Audio Group");
LABEL_22:
          _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }
LABEL_23:

        -[MPCAssistantEndpointContext _discoverLocalEndpointFromClusterUsingDeviceInfo:completion:](self, "_discoverLocalEndpointFromClusterUsingDeviceInfo:completion:", v15, v19);
        break;
      default:
        break;
    }
  }
  else
  {
    _MRLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v37 = CFSTR("discoverLocalEndpointFromDeviceInfo");
      v38 = 2114;
      v39 = v16;
      v40 = 2112;
      v41 = CFSTR("Non groupable");
      _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

LABEL_14:
    objc_msgSend(MEMORY[0x24BE654C8], "sharedLocalEndpoint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, v28);

  }
}

- (void)_discoverLocalEndpointFromHomeTheaterUsingDeviceInfo:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  MPCAssistantDiscovery *discoveryEndpoint;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BE654B8], "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "clusterType");

  if (v10 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCAssistantEndpointContext.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("MRAVClusterController.sharedController.clusterType == MRAVOutputDeviceClusterTypeHomeTheater"));

  }
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "deviceUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "Local endpoint: %{public}@", buf, 0xCu);

  }
  discoveryEndpoint = self->_discoveryEndpoint;
  objc_msgSend(v7, "deviceUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __95__MPCAssistantEndpointContext__discoverLocalEndpointFromHomeTheaterUsingDeviceInfo_completion___block_invoke;
  v19[3] = &unk_24CAB6CB8;
  v20 = v7;
  v21 = v8;
  v16 = v8;
  v17 = v7;
  -[MPCAssistantDiscovery discoverRemoteControlEndpointsMatchingUIDs:completion:](discoveryEndpoint, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v15, v19);

}

- (void)_discoverLocalEndpointFromClusterUsingDeviceInfo:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  MPCAssistantDiscovery *discoveryEndpoint;
  void *v18;
  uint64_t LocalEndpoint;
  _QWORD v20[4];
  id v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE654B8];
  v9 = a3;
  objc_msgSend(v8, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "clusterType") != 1)
  {
    objc_msgSend(MEMORY[0x24BE654B8], "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "clusterType");

    if (v12 == 3)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCAssistantEndpointContext.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("MRAVClusterController.sharedController.clusterType == MRAVOutputDeviceClusterTypeStereoPair || MRAVClusterController.sharedController.clusterType == MRAVOutputDeviceClusterTypeGenericAudio"));
  }

LABEL_5:
  objc_msgSend(v9, "deviceUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "isAirPlayActive");

  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "Searching for endpoint, pilot %{public}@", buf, 0xCu);
    }

    discoveryEndpoint = self->_discoveryEndpoint;
    v23 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __91__MPCAssistantEndpointContext__discoverLocalEndpointFromClusterUsingDeviceInfo_completion___block_invoke;
    v20[3] = &unk_24CAB6CB8;
    v21 = v13;
    v22 = v7;
    -[MPCAssistantDiscovery discoverRemoteControlEndpointsMatchingUIDs:completion:](discoveryEndpoint, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v18, v20);

  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "Not being airplayed to", buf, 2u);
    }

    LocalEndpoint = MRAVEndpointGetLocalEndpoint();
    (*((void (**)(id, uint64_t))v7 + 2))(v7, LocalEndpoint);
  }

}

- (void)_discoverLocalEndpointFromMultiplayerUsingDeviceInfo:(id)a3 completion:(id)a4
{
  id v6;
  MPCAssistantDiscovery *discoveryEndpoint;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  discoveryEndpoint = self->_discoveryEndpoint;
  objc_msgSend(a3, "deviceUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __95__MPCAssistantEndpointContext__discoverLocalEndpointFromMultiplayerUsingDeviceInfo_completion___block_invoke;
  v11[3] = &unk_24CAB6CE0;
  v12 = v6;
  v10 = v6;
  -[MPCAssistantDiscovery discoverRemoteControlEndpointsMatchingUIDs:completion:](discoveryEndpoint, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v9, v11);

}

- (void)_modifyOutputDevices:(id)a3 onEndpoint:(id)a4 completion:(id)a5
{
  id v8;
  OS_dispatch_queue *callbackQueue;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  callbackQueue = self->_callbackQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__MPCAssistantEndpointContext__modifyOutputDevices_onEndpoint_completion___block_invoke;
  v11[3] = &unk_24CAB9A98;
  v12 = v8;
  v10 = v8;
  objc_msgSend(a4, "setOutputDevices:initiator:withReplyQueue:completion:", a3, CFSTR("MPCAssistantEndpointContext"), callbackQueue, v11);

}

- (BOOL)shouldSearchForLogicalDevices
{
  return _os_feature_enabled_impl() ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_discoveryEndpoint, 0);
  objc_storeStrong((id *)&self->_discoveryAudio, 0);
  objc_storeStrong((id *)&self->_discoveryLogical, 0);
}

void __74__MPCAssistantEndpointContext__modifyOutputDevices_onEndpoint_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3 && (MRMediaRemoteErrorIsInformational() & 1) == 0)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "Failed to set output devices on primary endpoint: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    MPCAssistantCreateError(4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __95__MPCAssistantEndpointContext__discoverLocalEndpointFromMultiplayerUsingDeviceInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __91__MPCAssistantEndpointContext__discoverLocalEndpointFromClusterUsingDeviceInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  int v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  uint64_t LocalEndpoint;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v42 = v6;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "Searching endpoint for leader: %{public}@", buf, 0xCu);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v3, "outputDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
      v29 = *(_QWORD *)v36;
      v30 = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v3, "designatedGroupLeader", v29);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "containsUID:", v14);

          if (v15)
          {
            objc_msgSend(v12, "clusterComposition");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v32;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v32 != v20)
                    objc_enumerationMutation(v17);
                  objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "uid");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqualToString:", *(_QWORD *)(a1 + 32));

                  if (v23)
                  {
                    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

                    goto LABEL_28;
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
                if (v19)
                  continue;
                break;
              }
            }

            v10 = v29;
            v7 = v30;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v9);
    }

    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v3;
      v24 = "cluster is not group leader. Endpoint: %{public}@";
      v25 = v4;
      v26 = 12;
LABEL_26:
      _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v24 = "No discoverable pair";
    v25 = v4;
    v26 = 2;
    goto LABEL_26;
  }

  v27 = *(_QWORD *)(a1 + 40);
  LocalEndpoint = MRAVEndpointGetLocalEndpoint();
  (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v27, LocalEndpoint);
LABEL_28:

}

void __95__MPCAssistantEndpointContext__discoverLocalEndpointFromHomeTheaterUsingDeviceInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t LocalEndpoint;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  os_log_t v18;
  const char *v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = (uint64_t)v4;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "Discovered primary endpoint: %{public}@", buf, 0xCu);
    }

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __95__MPCAssistantEndpointContext__discoverLocalEndpointFromHomeTheaterUsingDeviceInfo_completion___block_invoke_52;
    v24[3] = &unk_24CAB6C90;
    v25 = *(id *)(a1 + 32);
    objc_msgSend(v4, "outputDevicesMatchingPredicate:", v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = (uint64_t)v4;
        _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "Breakaway from endpoint: %{public}@", buf, 0xCu);
      }

      v8 = *(_QWORD *)(a1 + 40);
      LocalEndpoint = MRAVEndpointGetLocalEndpoint();
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, LocalEndpoint);
      goto LABEL_24;
    }
    objc_msgSend(v4, "designatedGroupLeader");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "groupContainsGroupLeader");

    if (v17)
    {
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
LABEL_24:

        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543362;
      v27 = (uint64_t)v4;
      v19 = "Discovered primary endpoint: %{public}@";
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE654B8], "sharedController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "needsCommandRedirection");

      if (!v21)
      {
        MRAVEndpointGetLocalEndpoint();
        v22 = objc_claimAutoreleasedReturnValue();

        v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v22;
          _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "Takeover legacy endpoint: %{public}@", buf, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v4 = (void *)v22;
        goto LABEL_24;
      }
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 138543362;
      v27 = (uint64_t)v4;
      v19 = "Takeover discovered endpoint: %{public}@";
    }
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BE654B8], "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "needsCommandRedirection");

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_ERROR, "No discovered endpoint, failing because device requires command redirection", buf, 2u);
    }

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_ERROR, "No discovered endpoint, use local", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 40);
    v15 = MRAVEndpointGetLocalEndpoint();
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v15);
  }
LABEL_25:

}

uint64_t __95__MPCAssistantEndpointContext__discoverLocalEndpointFromHomeTheaterUsingDeviceInfo_completion___block_invoke_52(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __79__MPCAssistantEndpointContext__discoverLocalEndpointFromDeviceInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "deviceUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v29 = 138544386;
        v30 = CFSTR("discoverLocalEndpointFromDeviceInfo");
        v31 = 2114;
        v32 = v7;
        v33 = 2112;
        v34 = v3;
        v35 = 2114;
        v36 = v8;
        v37 = 2048;
        v38 = v10;
        v11 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v12 = v5;
        v13 = 52;
LABEL_8:
        _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v29, v13);

LABEL_14:
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (!v6)
      goto LABEL_15;
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v29 = 138544130;
    v30 = CFSTR("discoverLocalEndpointFromDeviceInfo");
    v31 = 2114;
    v32 = v16;
    v33 = 2112;
    v34 = v3;
    v35 = 2048;
    v36 = v17;
    v18 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v19 = v5;
    v20 = 42;
LABEL_13:
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v29, v20);
    goto LABEL_14;
  }
  if (!v4)
  {
    if (!v6)
      goto LABEL_15;
    v21 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v29 = 138543874;
    v30 = CFSTR("discoverLocalEndpointFromDeviceInfo");
    v31 = 2114;
    v32 = v21;
    v33 = 2048;
    v34 = v22;
    v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v19 = v5;
    v20 = 32;
    goto LABEL_13;
  }
  if (v6)
  {
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "deviceUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v29 = 138544130;
    v30 = CFSTR("discoverLocalEndpointFromDeviceInfo");
    v31 = 2114;
    v32 = v14;
    v33 = 2114;
    v34 = v8;
    v35 = 2048;
    v36 = v15;
    v11 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    v12 = v5;
    v13 = 42;
    goto LABEL_8;
  }
LABEL_15:

  (*(void (**)(_QWORD, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v3, v23, v24, v25, v26, v27, v28);
}

void __83__MPCAssistantEndpointContext__updateDiscoverableDeviceList_deviceInfo_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  v4 = a1[4];
  v5 = a2;
  objc_msgSend(v3, "setWithArray:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObjectsFromArray:", v7);
  objc_msgSend(*(id *)(a1[5] + 16), "stopDiscovery");
  v8 = a1[6];
  objc_msgSend(v10, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "msv_map:", &__block_literal_global_18756);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Resolved devices: %@", buf, 0x16u);

  }
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_12;
  v12[3] = &unk_24CAB6BF0;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v12[4] = v10;
  v15 = *(id *)(a1 + 56);
  v13 = v3;
  v11 = v3;
  objc_msgSend(v7, "_discoverLocalEndpointFromDeviceInfo:completion:", v8, v12);

}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "outputDeviceUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "Discover devices: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "discoverAirplayDevicesMatchingUIDs:completion:", v3, *(_QWORD *)(a1 + 48));

}

uint64_t __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v13 = v5;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Sending discovered local endpoint to caller", buf, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 56);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_13;
    v9[3] = &unk_24CAB6BC8;
    v7 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, id, id, _QWORD *))(v6 + 16))(v6, v3, v10, v9);

  }
  else
  {
    MPCAssistantCreateError(2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v14 = v5;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Routing to devices", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_14;
  v10[3] = &unk_24CAB9CA8;
  v10[4] = v6;
  v8 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  objc_msgSend(v6, "_modifyOutputDevices:onEndpoint:completion:", v7, v9, v10);

}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Routing completed with error %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t LocalEndpoint;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  _QWORD aBlock[5];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_2;
  aBlock[3] = &unk_24CAB6B30;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v30 = v8;
  v32 = *(id *)(a1 + 48);
  v9 = v6;
  v31 = v9;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "outputGroupID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "outputGroupID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v13;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "Discover devices of group: %{public}@", buf, 0xCu);

    }
    v14 = *(void **)(a1 + 40);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v14, "outputGroupID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "discoverAirplayDevicesMatchingGroupID:completion:", v16, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "outputDeviceUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "outputDeviceUIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v7;
      v25[1] = 3221225472;
      v25[2] = __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_6;
      v25[3] = &unk_24CAB6B58;
      v21 = *(id *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 32);
      v26 = v21;
      v27 = v22;
      v28 = v10;
      objc_msgSend(v19, "_updateDiscoverableDeviceList:deviceInfo:completion:", v20, v8, v25);

    }
    else
    {
      v23 = *(_QWORD *)(a1 + 48);
      LocalEndpoint = MRAVEndpointGetLocalEndpoint();
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v23 + 16))(v23, LocalEndpoint, 0);
    }
  }

}

void __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_3;
  v9[3] = &unk_24CAB6C68;
  v13 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v4, "_discoverLocalEndpointFromDeviceInfo:completion:", v5, v9);

}

void __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "outputDeviceUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "Discover devices: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "discoverAirplayDevicesMatchingUIDs:completion:", v3, *(_QWORD *)(a1 + 48));

}

void __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "msv_description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "Modify context: slow error=%{public}@", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "Modify context: slow", buf, 2u);
    }

    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_2;
    v11[3] = &unk_24CABA438;
    v13 = *(id *)(a1 + 56);
    v12 = v3;
    objc_msgSend(v9, "_modifyOutputDevices:onEndpoint:completion:", v10, v12, v11);

  }
  else
  {
    MPCAssistantCreateError(2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

uint64_t __81__MPCAssistantEndpointContext_modifySystemMusicContextForDestination_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
