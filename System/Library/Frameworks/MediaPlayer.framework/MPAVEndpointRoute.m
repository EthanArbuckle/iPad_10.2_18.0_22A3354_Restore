@implementation MPAVEndpointRoute

void __36__MPAVEndpointRoute_endpointWrapper__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 240));
}

void __32__MPAVEndpointRoute_description__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  if (v1)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" connection=%@"), v1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertString:atIndex:", v4, objc_msgSend(*(id *)(a1 + 40), "length") - 1);

  }
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v7;
  objc_super v8;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)MPAVEndpointRoute;
  -[MPAVRoute description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4;
  msv_dispatch_sync_on_queue();
  v5 = v7;

  return v5;
}

- (BOOL)isDeviceRoute
{
  void *v2;
  char v3;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocalEndpoint");

  return v3;
}

- (id)routeUID
{
  void *v2;
  void *v3;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)routeName
{
  void *v2;
  void *v3;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)routeType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isLocalEndpoint") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v3, "externalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "isRemoteControllable");

    if ((v7 & 1) != 0)
    {
LABEL_4:
      v8 = 3;
      goto LABEL_16;
    }
  }
  else
  {

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "outputDevices", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    v8 = 3;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v12)
        objc_enumerationMutation(v9);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "canRelayCommunicationChannel") & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v8 = 0;
  }

LABEL_16:
  return v8;
}

- (int64_t)routeSubtype
{
  return 1;
}

- (void)endpoint
{
  id v2;
  void *v3;

  -[MPAVEndpointRoute endpointWrapper](self, "endpointWrapper");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (void *)objc_msgSend(v2, "unwrappedValue");

  return v3;
}

- (MRAVEndpoint)endpointObject
{
  id v2;
  void *v3;

  -[MPAVEndpointRoute endpointWrapper](self, "endpointWrapper");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "unwrappedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRAVEndpoint *)v3;
}

- (MPMRAVEndpointWrapper)endpointWrapper
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
  v7 = __Block_byref_object_copy__45293;
  v8 = __Block_byref_object_dispose__45294;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPMRAVEndpointWrapper *)v2;
}

- (BOOL)isAirPlayingToDevice
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "deviceType", (_QWORD)v9) == 1)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (int64_t)numberOfOutputDevices
{
  void *v2;
  void *v3;
  int64_t v4;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)isAppleTVRoute
{
  BOOL v3;

  v3 = -[MPAVEndpointRoute _groupLeaderIsOfDeviceSubtype:](self, "_groupLeaderIsOfDeviceSubtype:", 13);
  return v3 | -[MPAVEndpointRoute isHomeTheaterRoute](self, "isHomeTheaterRoute");
}

- (BOOL)_groupLeaderIsOfDeviceSubtype:(unsigned int)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "deviceSubtype") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)isHomeTheaterRoute
{
  void *v2;
  BOOL v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clusterType") == 2;

  return v3;
}

- (id)effectiveGroupLeader
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  -[MPAVEndpointRoute endpoint](self, "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupLeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsMultiplayer") && !objc_msgSend(v2, "isLocalEndpoint"))
  {
    objc_msgSend(v2, "outputDeviceUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "groupLeader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "containsObject:", v8);

    if (!v9)
    {
      objc_msgSend(v2, "outputDevices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sortedArrayUsingSelector:", &sel_uid);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
  }
  else
  {

  }
  objc_msgSend(v2, "groupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v4;
}

void __31__MPAVEndpointRoute_connection__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 208));
}

- (MPAVRouteConnection)connection
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__45293;
  v10 = __Block_byref_object_dispose__45294;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MPAVEndpointRoute_connection__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPAVRouteConnection *)v3;
}

- (MPAVEndpointRoute)initWithEndpointObject:(id)a3
{
  id v4;
  MPAVEndpointRoute *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *calloutQueue;
  NSDictionary *avRouteDescription;
  MPAVRoute *wirelessDisplayRoute;
  MPMRAVEndpointWrapper *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPAVEndpointRoute;
  v5 = -[MPAVEndpointRoute init](&v18, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.mediaplayer.MPAVEndpointRoute/accessQueue", v6);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.mediaplayer.MPAVEndpointRoute/calloutQueue", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    v5->super._picked = 0;
    avRouteDescription = v5->super._avRouteDescription;
    v5->super._avRouteDescription = 0;

    wirelessDisplayRoute = v5->super._wirelessDisplayRoute;
    v5->super._wirelessDisplayRoute = 0;

    v5->super._displayRouteType = 3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D4C4E0], "sharedLocalEndpoint");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = -[MPMRAVEndpointWrapper initWithMRAVEndpoint:]([MPMRAVEndpointWrapper alloc], "initWithMRAVEndpoint:", v4);
    -[MPAVEndpointRoute setEndpointWrapper:](v5, "setEndpointWrapper:", v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel__endpointOutputDevicesDidChange_, *MEMORY[0x1E0D4C670], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel__endpointPredictedOutputDeviceDidChange_, *MEMORY[0x1E0D4C678], 0);

  }
  return v5;
}

- (void)setEndpointWrapper:(id)a3
{
  id v5;
  NSObject *accessQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVEndpointRoute.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpointWrapper"));

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(accessQueue, block);

}

void __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  _QWORD v35[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 240);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "endpointObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

  objc_msgSend(*(id *)(a1 + 32), "effectiveGroupLeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 232);
    *(_QWORD *)(v11 + 232) = v10;

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(v13 + 8);
    v9 = *(void **)(v13 + 232);
    *(_QWORD *)(v13 + 232) = v14;
  }

  if (v2)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(NSObject **)(v15 + 224);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = v15;
    dispatch_async(v16, block);
  }
  v17 = objc_retainAutorelease(v2);
  objc_msgSend(v17, "unwrappedValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "unwrappedValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v18, "personalOutputDevices");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v19, "personalOutputDevices");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v22, "isEqualToSet:", v25);

  if ((v26 & 1) == 0)
  {
    v27 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_opt_class();
      v29 = *(_QWORD *)(a1 + 32);
      v34 = v28;
      objc_msgSend(v18, "personalOutputDevices");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personalOutputDevices");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v38 = v28;
      v39 = 2048;
      v40 = v29;
      v41 = 2114;
      v42 = v30;
      v43 = 2114;
      v44 = v31;
      _os_log_impl(&dword_193B9B000, v27, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Personal devices changed from %{public}@, to: %{public}@", buf, 0x2Au);

    }
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(NSObject **)(v32 + 224);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke_42;
    v35[3] = &unk_1E3163508;
    v35[4] = v32;
    dispatch_async(v33, v35);
  }

}

- (MPAVEndpointRoute)initWithCoder:(id)a3
{
  id v4;
  uint64_t LocalEndpoint;
  MPAVEndpointRoute *v6;
  uint64_t ExternalDevice;
  MPAVRouteConnection *v8;

  v4 = a3;
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("localEndpoint")))
    LocalEndpoint = MRAVEndpointGetLocalEndpoint();
  else
    LocalEndpoint = objc_msgSend(v4, "decodeObjectOfClass:forKey:", MRAVEndpointGetClass(), CFSTR("endpoint"));
  v6 = (MPAVEndpointRoute *)LocalEndpoint;
  if (LocalEndpoint)
  {
    self = -[MPAVEndpointRoute initWithEndpoint:](self, "initWithEndpoint:", LocalEndpoint);
    ExternalDevice = MRAVEndpointGetExternalDevice();
    if (ExternalDevice)
    {
      v8 = -[MPAVRouteConnection initWithExternalDevice:]([MPAVRouteConnection alloc], "initWithExternalDevice:", ExternalDevice);
      -[MPAVEndpointRoute setConnection:](self, "setConnection:", v8);

    }
    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t IsLocalEndpoint;
  id v6;
  id v7;

  v7 = a3;
  -[MPAVEndpointRoute endpointWrapper](self, "endpointWrapper");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "unwrappedValue");
  IsLocalEndpoint = MRAVEndpointIsLocalEndpoint();

  objc_msgSend(v7, "encodeBool:forKey:", IsLocalEndpoint, CFSTR("localEndpoint"));
  if ((IsLocalEndpoint & 1) == 0)
  {
    -[MPAVEndpointRoute endpointWrapper](self, "endpointWrapper");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "encodeObject:forKey:", objc_msgSend(v6, "unwrappedValue"), CFSTR("endpoint"));

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4C670], 0);

  v4.receiver = self;
  v4.super_class = (Class)MPAVEndpointRoute;
  -[MPAVEndpointRoute dealloc](&v4, sel_dealloc);
}

- (NSString)sortName
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__45293;
  v10 = __Block_byref_object_dispose__45294;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__MPAVEndpointRoute_sortName__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)routeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "logicalDeviceID", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          if (objc_msgSend(v12, "length"))
          {
            if ((objc_msgSend(v5, "containsObject:", v12) & 1) != 0)
              goto LABEL_12;
            objc_msgSend(v4, "addObject:", v13);
            v14 = v5;
            v15 = v12;
          }
          else
          {
            v14 = v4;
            v15 = v13;
          }
          objc_msgSend(v14, "addObject:", v15);
        }
LABEL_12:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)designatedGroupLeaderName
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = &stru_1E3163D10;
  }

  return v5;
}

- (void)establishGroup
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C608]), "initWithName:requestID:reason:", CFSTR("MPAVEndpointRoute.establishGroup"), 0, CFSTR("API Call"));
  v3 = objc_alloc(MEMORY[0x1E0D4C570]);
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithRequestDetails:type:outputDevices:", v8, 1, v5);

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modifyTopologyWithRequest:withReplyQueue:completion:", v6, MEMORY[0x1E0C80D38], &__block_literal_global_45314);

}

- (void)setConnection:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MPAVEndpointRoute_setConnection___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (MPAVOutputDeviceRoute)predictedOutputDevice
{
  void *v2;
  void *v3;
  MPAVOutputDeviceRoute *v4;
  void *v5;
  MPAVOutputDeviceRoute *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predictedOutputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [MPAVOutputDeviceRoute alloc];
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v4, "initWithOutputDevices:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)resetPredictedOutputDevice
{
  id v2;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetPredictedOutputDevice");

}

- (BOOL)canAccessRemoteAssets
{
  return 1;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return 1;
}

- (BOOL)canFetchMediaDataFromSender
{
  return 1;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return 1;
}

- (id)groupLeaderAirplayIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[MPAVEndpointRoute isDeviceRoute](self, "isDeviceRoute"))
  {
    v3 = 0;
  }
  else
  {
    -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "uid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v6, "copy");

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (BOOL)isTVRoute
{
  return -[MPAVEndpointRoute _groupLeaderIsOfDeviceSubtype:](self, "_groupLeaderIsOfDeviceSubtype:", 11)
      || -[MPAVEndpointRoute _groupLeaderIsOfDeviceSubtype:](self, "_groupLeaderIsOfDeviceSubtype:", 16)
      || -[MPAVEndpointRoute _groupLeaderIsOfDeviceSubtype:](self, "_groupLeaderIsOfDeviceSubtype:", 17);
}

- (BOOL)isMacRoute
{
  void *v2;
  BOOL v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceSubtype") == 18;

  return v3;
}

- (BOOL)isHomePodRoute
{
  if (-[MPAVEndpointRoute isClusterRoute](self, "isClusterRoute"))
    return -[MPAVEndpointRoute isStereoPair](self, "isStereoPair");
  else
    return -[MPAVEndpointRoute _groupLeaderIsOfDeviceSubtype:](self, "_groupLeaderIsOfDeviceSubtype:", 12);
}

- (BOOL)isB520Route
{
  void *v2;
  void *v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "containsString:", CFSTR("AudioAccessory5"));
  return (char)v2;
}

- (BOOL)isStereoPair
{
  MPAVEndpointRoute *v2;
  void *v3;

  v2 = self;
  if (-[MPAVEndpointRoute isClusterRoute](self, "isClusterRoute"))
  {
    -[MPAVEndpointRoute effectiveGroupLeader](v2, "effectiveGroupLeader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = objc_msgSend(v3, "clusterType") == 1;

  }
  else
  {
    return (-[MPAVEndpointRoute _outputDevicesComposition](v2, "_outputDevicesComposition") >> 3) & 1;
  }
  return (char)v2;
}

- (BOOL)isPhoneRoute
{
  void *v2;
  BOOL v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostDeviceClass") == 1;

  return v3;
}

- (BOOL)isProxyGroupPlayer
{
  void *v2;
  char v3;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProxyGroupPlayer");

  return v3;
}

- (BOOL)canModifyGroupMembership
{
  void *v2;
  char v3;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canModifyGroupMembership");

  return v3;
}

- (BOOL)isDeviceSpeakerRoute
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "deviceType", (_QWORD)v9) == 4)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)isRoutingToWirelessDevice
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (+[MPAVOutputDeviceRoute pickableRouteTypeForOutputDevice:](MPAVOutputDeviceRoute, "pickableRouteTypeForOutputDevice:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9) == 1)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)isLowLatencyRoute
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  BOOL v6;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "deviceType");

    v6 = (v5 & 0xFFFFFFFE) == 4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)productIdentifier
{
  void *v2;
  void *v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)originalRouteSubtype
{
  void *v2;
  int64_t v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "routeSubtypeForMRSubtype:mrType:", objc_msgSend(v2, "deviceSubtype"), objc_msgSend(v2, "deviceType"));

  return v3;
}

- (BOOL)supportsGrouping
{
  void *v2;
  char v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGroupable");

  return v3;
}

- (BOOL)supportsRemoteControl
{
  void *v2;
  char v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRemoteControllable");

  return v3;
}

- (BOOL)isSplitterCapable
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsBluetoothSharing");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSplitRoute
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "supportsBluetoothSharing", (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
    v9 = 0;

  return v9;
}

- (BOOL)isClusterRoute
{
  return -[MPAVEndpointRoute _groupLeaderIsOfDeviceSubtype:](self, "_groupLeaderIsOfDeviceSubtype:", 15);
}

- (id)clusterComposition
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clusterCompositionForOutputDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)clusterType
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_opt_class();
  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "clusterTypeForMRClusterType:", objc_msgSend(v4, "clusterType"));

  return v5;
}

- (id)designatedGroupLeaderRouteUID
{
  void *v3;
  void *v4;
  void *v5;

  -[MPAVEndpointRoute endpoint](self, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isLocalEndpoint") & 1) != 0)
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)isLowFidelityRoute
{
  void *v2;
  char v3;

  -[MPAVEndpointRoute effectiveGroupLeader](self, "effectiveGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "producesLowFidelityAudio");

  return v3;
}

- (BOOL)isPickable
{
  return 1;
}

- (void)_endpointDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  MPMRAVEndpointWrapper *v11;
  int v12;
  void *v13;
  __int16 v14;
  MPAVEndpointRoute *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C700]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v4, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v8;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> External device: %{public}@ changed endpoint to: %{public}@", (uint8_t *)&v12, 0x2Au);

  }
  v11 = -[MPMRAVEndpointWrapper initWithMRAVEndpoint:]([MPMRAVEndpointWrapper alloc], "initWithMRAVEndpoint:", v6);
  -[MPAVEndpointRoute setEndpointWrapper:](self, "setEndpointWrapper:", v11);

}

- (void)_endpointOutputDevicesDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("MPAVRouteDidChangeNotification"), self);

  }
}

- (void)_endpointPredictedOutputDeviceDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  MPAVEndpointRoute *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      objc_msgSend(v4, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predictedOutputDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v10;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> External device: %{public}@ predicted route to: %{public}@", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("MPAVRouteDidChangeNotification"), self);

  }
}

- (unint64_t)_outputDevicesComposition
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[MPAVEndpointRoute endpointObject](self, "endpointObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "deviceSubtype", (_QWORD)v17);
        if (v14 == 12)
        {
          objc_msgSend(v13, "logicalDeviceID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v9 & 1) != 0 || (objc_msgSend(v3, "containsObject:", v15) & 1) == 0)
          {
            if (v15)
              objc_msgSend(v3, "addObject:", v15);
          }
          else
          {
            v9 = 1;
          }
          v10 |= 4uLL;

        }
        else if (v14 == 13)
        {
          v10 |= 2uLL;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);

    if ((v9 & 1) != 0 && (v10 & 4) != 0)
      v10 |= 8uLL;
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointWrapper, 0);
  objc_storeStrong((id *)&self->_sortName, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __35__MPAVEndpointRoute_setConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0D4C6F8];
    objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D4C6F8], 0);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__endpointDidChange_, v3, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "externalDevice"));

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 224);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__MPAVEndpointRoute_setConnection___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = v5;
    dispatch_async(v6, block);
  }
}

void __35__MPAVEndpointRoute_setConnection___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPAVRouteDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPAVRouteDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke_42(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPAVRouteDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __29__MPAVEndpointRoute_sortName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 232));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)getActiveEndpointRouteWithCompletion:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  MRAVEndpointResolveActiveSystemEndpoint();

}

void __58__MPAVEndpointRoute_getActiveEndpointRouteWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  MPAVEndpointRoute *v4;

  if (!a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = -[MPAVEndpointRoute initWithEndpoint:]([MPAVEndpointRoute alloc], "initWithEndpoint:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
