@implementation MRAVRoutingDiscoverySessionWrapper

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[MRAVRoutingDiscoverySession methodSignatureForSelector:](self->_sharedSession, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->_sharedSession);
}

- (void)updateObserversWithPreviousSession:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void (**v21)(_QWORD, _QWORD);
  NSMutableDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void (**v27)(_QWORD, _QWORD);
  NSMutableDictionary *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void (**v33)(_QWORD, _QWORD);
  NSMutableDictionary *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void (**v39)(_QWORD, _QWORD);
  NSMutableDictionary *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void (**v45)(_QWORD, _QWORD);
  NSMutableDictionary *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ii;
  void (**v51)(_QWORD, _QWORD);
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  MRAVRoutingDiscoverySessionWrapper *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "availableEndpoints");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v8 = (void *)v5;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v53 = v8;

  v52 = v4;
  objc_msgSend(v4, "availableOutputDevices");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v7;
  v12 = v11;

  -[MRAVRoutingDiscoverySession availableEndpoints](self->_sharedSession, "availableEndpoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVRoutingDiscoverySession availableOutputDevices](self->_sharedSession, "availableOutputDevices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219008;
    v85 = self;
    v86 = 2048;
    v87 = objc_msgSend(v53, "count");
    v88 = 2048;
    v89 = objc_msgSend(v13, "count");
    v90 = 2048;
    v91 = objc_msgSend(v12, "count");
    v92 = 2048;
    v93 = objc_msgSend(v14, "count");
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_INFO, "[MRAVRoutingDiscoverySessionWrapper] <%p> Notifying existing observers from %lu to %lu endpoints and from %lu to %lu output devices", buf, 0x34u);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v16 = self->_endpointsRemovedCallbacks;
  v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v75 != v19)
          objc_enumerationMutation(v16);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsRemovedCallbacks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
        v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v21)[2](v21, v53);

      }
      v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    }
    while (v18);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v22 = self->_endpointsAddedCallbacks;
  v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v71 != v25)
          objc_enumerationMutation(v22);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsAddedCallbacks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
        v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v27)[2](v27, v13);

      }
      v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    }
    while (v24);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v28 = self->_endpointsChangedCallbacks;
  v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v67 != v31)
          objc_enumerationMutation(v28);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsChangedCallbacks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k));
        v33 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v33)[2](v33, v13);

      }
      v30 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
    }
    while (v30);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v34 = self->_outputDevicesRemovedCallbacks;
  v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v63 != v37)
          objc_enumerationMutation(v34);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesRemovedCallbacks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m));
        v39 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v39)[2](v39, v12);

      }
      v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
    }
    while (v36);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v40 = self->_outputDevicesAddedCallbacks;
  v41 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v59;
    do
    {
      for (n = 0; n != v42; ++n)
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(v40);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesAddedCallbacks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * n));
        v45 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v45)[2](v45, v14);

      }
      v42 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
    }
    while (v42);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v46 = self->_outputDevicesChangedCallbacks;
  v47 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v54, v78, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v55;
    do
    {
      for (ii = 0; ii != v48; ++ii)
      {
        if (*(_QWORD *)v55 != v49)
          objc_enumerationMutation(v46);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesChangedCallbacks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * ii));
        v51 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v51)[2](v51, v14);

      }
      v48 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v54, v78, 16);
    }
    while (v48);
  }

}

- (void)setRoutingContextUID:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRAVRoutingDiscoverySessionConfiguration routingContextUID](v4->_configuration, "routingContextUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[MRAVRoutingDiscoverySessionConfiguration setRoutingContextUID:](v4->_configuration, "setRoutingContextUID:", v6);
    -[MRAVRoutingDiscoverySessionWrapper updateSharedSession](v4, "updateSharedSession");
  }
  objc_sync_exit(v4);

}

- (void)updateSharedSession
{
  id v3;

  +[MRAVRoutingDiscoverySession sharedDiscoverySessionForClass:configuration:](MRAVRoutingDiscoverySession, "sharedDiscoverySessionForClass:configuration:", objc_opt_class(), self->_configuration);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MRAVRoutingDiscoverySessionWrapper setSharedSession:](self, "setSharedSession:", v3);

}

- (void)setSharedSession:(id)a3
{
  id v5;
  MRAVRoutingDiscoverySessionWrapper *v6;
  id *p_sharedSession;
  id sharedSession;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  int v14;
  MRAVRoutingDiscoverySessionWrapper *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  p_sharedSession = (id *)&v6->_sharedSession;
  sharedSession = v6->_sharedSession;
  if (sharedSession)
  {
    v9 = sharedSession;
    objc_sync_enter(v9);
    objc_msgSend(*p_sharedSession, "clientDiscoveryStates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v6);

    -[MRAVRoutingDiscoverySessionWrapper transferCallbacksFromSession:toSession:](v6, "transferCallbacksFromSession:toSession:", *p_sharedSession, v5);
    -[MRAVRoutingDiscoverySessionWrapper reevaluateDiscoveryModeForSession:](v6, "reevaluateDiscoveryModeForSession:", *p_sharedSession);
    objc_sync_exit(v9);

    sharedSession = *p_sharedSession;
  }
  v11 = sharedSession;
  objc_storeStrong((id *)&v6->_sharedSession, a3);
  if (*p_sharedSession)
  {
    _MRLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *p_sharedSession;
      v14 = 134218242;
      v15 = v6;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_INFO, "[MRAVRoutingDiscoverySessionWrapper] <%p> Changed to shared session: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    -[MRAVRoutingDiscoverySessionWrapper setDiscoveryMode:](v6, "setDiscoveryMode:", v6->_discoveryMode);
  }
  -[MRAVRoutingDiscoverySessionWrapper updateObserversWithPreviousSession:](v6, "updateObserversWithPreviousSession:", v11);

  objc_sync_exit(v6);
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3;
  MRAVRoutingDiscoverySession *v4;
  void *v5;
  void *v6;
  MRAVRoutingDiscoverySessionWrapper *obj;

  v3 = *(_QWORD *)&a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_discoveryMode = v3;
  v4 = obj->_sharedSession;
  objc_sync_enter(v4);
  -[MRAVRoutingDiscoverySession clientDiscoveryStates](obj->_sharedSession, "clientDiscoveryStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, obj);

  -[MRAVRoutingDiscoverySessionWrapper reevaluateDiscoveryModeForSession:](obj, "reevaluateDiscoveryModeForSession:", obj->_sharedSession);
  objc_sync_exit(v4);

  objc_sync_exit(obj);
}

- (void)reevaluateDiscoveryModeForSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "clientDiscoveryStates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v8 <= objc_msgSend(v11, "intValue"))
          v8 = objc_msgSend(v11, "intValue");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v3, "setDiscoveryMode:", v8);
}

- (MRAVRoutingDiscoverySessionWrapper)initWithSession:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  MRAVRoutingDiscoverySessionConfiguration *v9;
  MRAVRoutingDiscoverySessionConfiguration *configuration;
  NSMutableDictionary *v11;
  NSMutableDictionary *endpointsChangedCallbacks;
  NSMutableDictionary *v13;
  NSMutableDictionary *endpointsAddedCallbacks;
  NSMutableDictionary *v15;
  NSMutableDictionary *endpointsRemovedCallbacks;
  NSMutableDictionary *v17;
  NSMutableDictionary *endpointsModifiedCallbacks;
  NSMutableDictionary *v19;
  NSMutableDictionary *outputDevicesChangedCallbacks;
  NSMutableDictionary *v21;
  NSMutableDictionary *outputDevicesAddedCallbacks;
  NSMutableDictionary *v23;
  NSMutableDictionary *outputDevicesRemovedCallbacks;
  NSMutableDictionary *v25;
  NSMutableDictionary *outputDevicesModifiedCallbacks;
  NSMutableDictionary *v27;
  NSMutableDictionary *endpointsTokensMap;
  NSMutableDictionary *v29;
  NSMutableDictionary *outputDevicesTokensMap;
  NSObject *v31;
  MRAVRoutingDiscoverySession *sharedSession;
  int v34;
  MRAVRoutingDiscoverySessionWrapper *v35;
  __int16 v36;
  MRAVRoutingDiscoverySession *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_storeStrong((id *)&self->_sharedSession, a3);
  v8 = a4;
  v9 = (MRAVRoutingDiscoverySessionConfiguration *)objc_msgSend(v8, "copy");

  configuration = self->_configuration;
  self->_configuration = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  endpointsChangedCallbacks = self->_endpointsChangedCallbacks;
  self->_endpointsChangedCallbacks = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  endpointsAddedCallbacks = self->_endpointsAddedCallbacks;
  self->_endpointsAddedCallbacks = v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  endpointsRemovedCallbacks = self->_endpointsRemovedCallbacks;
  self->_endpointsRemovedCallbacks = v15;

  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  endpointsModifiedCallbacks = self->_endpointsModifiedCallbacks;
  self->_endpointsModifiedCallbacks = v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  outputDevicesChangedCallbacks = self->_outputDevicesChangedCallbacks;
  self->_outputDevicesChangedCallbacks = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  outputDevicesAddedCallbacks = self->_outputDevicesAddedCallbacks;
  self->_outputDevicesAddedCallbacks = v21;

  v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  outputDevicesRemovedCallbacks = self->_outputDevicesRemovedCallbacks;
  self->_outputDevicesRemovedCallbacks = v23;

  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  outputDevicesModifiedCallbacks = self->_outputDevicesModifiedCallbacks;
  self->_outputDevicesModifiedCallbacks = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  endpointsTokensMap = self->_endpointsTokensMap;
  self->_endpointsTokensMap = v27;

  v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  outputDevicesTokensMap = self->_outputDevicesTokensMap;
  self->_outputDevicesTokensMap = v29;

  _MRLogForCategory(0);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    sharedSession = self->_sharedSession;
    v34 = 134218242;
    v35 = self;
    v36 = 2114;
    v37 = sharedSession;
    _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_INFO, "[MRAVRoutingDiscoverySessionWrapper] <%p> Init with shared session: %{public}@", (uint8_t *)&v34, 0x16u);
  }

  -[MRAVRoutingDiscoverySessionWrapper updateObserversWithPreviousSession:](self, "updateObserversWithPreviousSession:", 0);
  return self;
}

- (void)transferCallbacksFromSession:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  MRAVRoutingDiscoverySessionWrapper *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _MRLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134218498;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_INFO, "[MRAVRoutingDiscoverySessionWrapper] <%p> Transferring callbacks from: %{public}@ to: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  -[MRAVRoutingDiscoverySessionWrapper transferEndpointsChangedCallbacksFromSession:toSession:](self, "transferEndpointsChangedCallbacksFromSession:toSession:", v6, v7);
  -[MRAVRoutingDiscoverySessionWrapper transferEndpointsAddedCallbacksFromSession:toSession:](self, "transferEndpointsAddedCallbacksFromSession:toSession:", v6, v7);
  -[MRAVRoutingDiscoverySessionWrapper transferEndpointsRemovedCallbacksFromSession:toSession:](self, "transferEndpointsRemovedCallbacksFromSession:toSession:", v6, v7);
  -[MRAVRoutingDiscoverySessionWrapper transferEndpointsModifiedCallbacksFromSession:toSession:](self, "transferEndpointsModifiedCallbacksFromSession:toSession:", v6, v7);
  -[MRAVRoutingDiscoverySessionWrapper transferOutputDevicesChangedCallbacksFromSession:toSession:](self, "transferOutputDevicesChangedCallbacksFromSession:toSession:", v6, v7);
  -[MRAVRoutingDiscoverySessionWrapper transferOutputDevicesAddedCallbacksFromSession:toSession:](self, "transferOutputDevicesAddedCallbacksFromSession:toSession:", v6, v7);
  -[MRAVRoutingDiscoverySessionWrapper transferOutputDevicesRemovedCallbacksFromSession:toSession:](self, "transferOutputDevicesRemovedCallbacksFromSession:toSession:", v6, v7);
  -[MRAVRoutingDiscoverySessionWrapper transferOutputDevicesModifiedCallbacksFromSession:toSession:](self, "transferOutputDevicesModifiedCallbacksFromSession:toSession:", v6, v7);

}

- (void)transferOutputDevicesRemovedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_outputDevicesRemovedCallbacks;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesTokensMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesRemovedCallbacks, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x194036C44]();

        objc_msgSend(v17, "removeOutputDevicesRemovedCallback:", v11);
        objc_msgSend(v16, "addOutputDevicesRemovedCallback:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", v14, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)transferOutputDevicesModifiedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_outputDevicesModifiedCallbacks;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesTokensMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesModifiedCallbacks, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x194036C44]();

        objc_msgSend(v17, "removeOutputDevicesModifiedCallback:", v11);
        objc_msgSend(v16, "addOutputDevicesModifiedCallback:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", v14, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)transferOutputDevicesChangedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_outputDevicesChangedCallbacks;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesTokensMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesChangedCallbacks, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x194036C44]();

        objc_msgSend(v17, "removeOutputDevicesChangedCallback:", v11);
        objc_msgSend(v16, "addOutputDevicesChangedCallback:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", v14, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)transferOutputDevicesAddedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_outputDevicesAddedCallbacks;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesTokensMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_outputDevicesAddedCallbacks, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x194036C44]();

        objc_msgSend(v17, "removeOutputDevicesAddedCallback:", v11);
        objc_msgSend(v16, "addOutputDevicesAddedCallback:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", v14, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)transferEndpointsRemovedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_endpointsRemovedCallbacks;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsTokensMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsRemovedCallbacks, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x194036C44]();

        objc_msgSend(v17, "removeEndpointsRemovedCallback:", v11);
        objc_msgSend(v16, "addEndpointsRemovedCallback:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointsTokensMap, "setObject:forKeyedSubscript:", v14, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)transferEndpointsModifiedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_endpointsModifiedCallbacks;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsTokensMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsModifiedCallbacks, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x194036C44]();

        objc_msgSend(v17, "removeEndpointsModifiedCallback:", v11);
        objc_msgSend(v16, "addEndpointsModifiedCallback:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointsTokensMap, "setObject:forKeyedSubscript:", v14, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)transferEndpointsChangedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_endpointsChangedCallbacks;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsTokensMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsChangedCallbacks, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x194036C44]();

        objc_msgSend(v17, "removeEndpointsChangedCallback:", v11);
        objc_msgSend(v16, "addEndpointsChangedCallback:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointsTokensMap, "setObject:forKeyedSubscript:", v14, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)transferEndpointsAddedCallbacksFromSession:(id)a3 toSession:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_endpointsAddedCallbacks;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsTokensMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsAddedCallbacks, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x194036C44]();

        objc_msgSend(v17, "removeEndpointsAddedCallback:", v11);
        objc_msgSend(v16, "addEndpointsAddedCallback:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointsTokensMap, "setObject:forKeyedSubscript:", v14, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (id)addEndpointsChangedCallback:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionWrapper *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRAVRoutingDiscoverySession addEndpointsChangedCallback:](v5->_sharedSession, "addEndpointsChangedCallback:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_endpointsChangedCallbacks, "setObject:forKeyedSubscript:", v8, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_endpointsTokensMap, "setObject:forKeyedSubscript:", v6, v6);
  objc_sync_exit(v5);

  return v6;
}

- (id)addOutputDevicesChangedCallback:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionWrapper *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRAVRoutingDiscoverySession addOutputDevicesChangedCallback:](v5->_sharedSession, "addOutputDevicesChangedCallback:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputDevicesChangedCallbacks, "setObject:forKeyedSubscript:", v8, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", v6, v6);
  objc_sync_exit(v5);

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVRoutingDiscoverySessionWrapper sharedSession](self, "sharedSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> sharedSession: %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  return (id)-[MRAVRoutingDiscoverySession debugDescription](self->_sharedSession, "debugDescription");
}

- (unsigned)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setTargetAudioSessionID:(unsigned int)a3
{
  uint64_t v3;
  MRAVRoutingDiscoverySessionWrapper *obj;

  v3 = *(_QWORD *)&a3;
  obj = self;
  objc_sync_enter(obj);
  if (-[MRAVRoutingDiscoverySessionConfiguration targetAudioSessionID](obj->_configuration, "targetAudioSessionID") != (_DWORD)v3)
  {
    -[MRAVRoutingDiscoverySessionConfiguration setTargetAudioSessionID:](obj->_configuration, "setTargetAudioSessionID:", v3);
    -[MRAVRoutingDiscoverySessionWrapper updateSharedSession](obj, "updateSharedSession");
  }
  objc_sync_exit(obj);

}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  _BOOL8 v3;
  MRAVRoutingDiscoverySessionWrapper *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (-[MRAVRoutingDiscoverySessionConfiguration alwaysAllowUpdates](obj->_configuration, "alwaysAllowUpdates") != v3)
  {
    -[MRAVRoutingDiscoverySessionConfiguration setAlwaysAllowUpdates:](obj->_configuration, "setAlwaysAllowUpdates:", v3);
    -[MRAVRoutingDiscoverySessionWrapper updateSharedSession](obj, "updateSharedSession");
  }
  objc_sync_exit(obj);

}

- (void)setPopulatesExternalDevice:(BOOL)a3
{
  _BOOL8 v3;
  MRAVRoutingDiscoverySessionWrapper *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (-[MRAVRoutingDiscoverySessionConfiguration populatesExternalDevice](obj->_configuration, "populatesExternalDevice") != v3)
  {
    -[MRAVRoutingDiscoverySessionConfiguration setPopulatesExternalDevice:](obj->_configuration, "setPopulatesExternalDevice:", v3);
    -[MRAVRoutingDiscoverySessionWrapper updateSharedSession](obj, "updateSharedSession");
  }
  objc_sync_exit(obj);

}

- (void)setConfiguration:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[MRAVRoutingDiscoverySessionConfiguration isEqual:](v5->_configuration, "isEqual:", v6))
  {
    objc_storeStrong((id *)&v5->_configuration, a3);
    -[MRAVRoutingDiscoverySessionWrapper updateSharedSession](v5, "updateSharedSession");
  }
  objc_sync_exit(v5);

}

- (id)addEndpointsAddedCallback:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionWrapper *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRAVRoutingDiscoverySession addEndpointsAddedCallback:](v5->_sharedSession, "addEndpointsAddedCallback:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_endpointsAddedCallbacks, "setObject:forKeyedSubscript:", v8, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_endpointsTokensMap, "setObject:forKeyedSubscript:", v6, v6);
  objc_sync_exit(v5);

  return v6;
}

- (id)addEndpointsRemovedCallback:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionWrapper *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRAVRoutingDiscoverySession addEndpointsRemovedCallback:](v5->_sharedSession, "addEndpointsRemovedCallback:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_endpointsRemovedCallbacks, "setObject:forKeyedSubscript:", v8, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_endpointsTokensMap, "setObject:forKeyedSubscript:", v6, v6);
  objc_sync_exit(v5);

  return v6;
}

- (id)addEndpointsModifiedCallback:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionWrapper *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRAVRoutingDiscoverySession addEndpointsModifiedCallback:](v5->_sharedSession, "addEndpointsModifiedCallback:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_endpointsModifiedCallbacks, "setObject:forKeyedSubscript:", v8, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_endpointsTokensMap, "setObject:forKeyedSubscript:", v6, v6);
  objc_sync_exit(v5);

  return v6;
}

- (id)addOutputDevicesAddedCallback:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionWrapper *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRAVRoutingDiscoverySession addOutputDevicesAddedCallback:](v5->_sharedSession, "addOutputDevicesAddedCallback:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputDevicesAddedCallbacks, "setObject:forKeyedSubscript:", v8, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", v6, v6);
  objc_sync_exit(v5);

  return v6;
}

- (id)addOutputDevicesRemovedCallback:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionWrapper *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRAVRoutingDiscoverySession addOutputDevicesRemovedCallback:](v5->_sharedSession, "addOutputDevicesRemovedCallback:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputDevicesRemovedCallbacks, "setObject:forKeyedSubscript:", v8, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", v6, v6);
  objc_sync_exit(v5);

  return v6;
}

- (id)addOutputDevicesModifiedCallback:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionWrapper *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRAVRoutingDiscoverySession addOutputDevicesModifiedCallback:](v5->_sharedSession, "addOutputDevicesModifiedCallback:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputDevicesModifiedCallbacks, "setObject:forKeyedSubscript:", v8, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", v6, v6);
  objc_sync_exit(v5);

  return v6;
}

- (void)removeEndpointsChangedCallback:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_endpointsTokensMap, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  -[MRAVRoutingDiscoverySession removeEndpointsChangedCallback:](v4->_sharedSession, "removeEndpointsChangedCallback:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_endpointsChangedCallbacks, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_endpointsTokensMap, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (void)removeEndpointsAddedCallback:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_endpointsTokensMap, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  -[MRAVRoutingDiscoverySession removeEndpointsAddedCallback:](v4->_sharedSession, "removeEndpointsAddedCallback:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_endpointsAddedCallbacks, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_endpointsTokensMap, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (void)removeEndpointsRemovedCallback:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_endpointsTokensMap, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  -[MRAVRoutingDiscoverySession removeEndpointsRemovedCallback:](v4->_sharedSession, "removeEndpointsRemovedCallback:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_endpointsRemovedCallbacks, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_endpointsTokensMap, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (void)removeEndpointsModifiedCallback:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_endpointsTokensMap, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  -[MRAVRoutingDiscoverySession removeEndpointsModifiedCallback:](v4->_sharedSession, "removeEndpointsModifiedCallback:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_endpointsModifiedCallbacks, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_endpointsTokensMap, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (void)removeOutputDevicesChangedCallback:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_outputDevicesTokensMap, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  -[MRAVRoutingDiscoverySession removeOutputDevicesChangedCallback:](v4->_sharedSession, "removeOutputDevicesChangedCallback:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputDevicesChangedCallbacks, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (void)removeOutputDevicesAddedCallback:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_outputDevicesTokensMap, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  -[MRAVRoutingDiscoverySession removeOutputDevicesAddedCallback:](v4->_sharedSession, "removeOutputDevicesAddedCallback:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputDevicesAddedCallbacks, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (void)removeOutputDevicesRemovedCallback:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_outputDevicesTokensMap, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  -[MRAVRoutingDiscoverySession removeOutputDevicesRemovedCallback:](v4->_sharedSession, "removeOutputDevicesRemovedCallback:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputDevicesRemovedCallbacks, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (void)removeOutputDevicesModifiedCallback:(id)a3
{
  MRAVRoutingDiscoverySessionWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_outputDevicesTokensMap, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  -[MRAVRoutingDiscoverySession removeOutputDevicesModifiedCallback:](v4->_sharedSession, "removeOutputDevicesModifiedCallback:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputDevicesModifiedCallbacks, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputDevicesTokensMap, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (void)dealloc
{
  objc_super v3;

  -[MRAVRoutingDiscoverySessionWrapper setSharedSession:](self, "setSharedSession:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MRAVRoutingDiscoverySessionWrapper;
  -[MRAVRoutingDiscoverySessionWrapper dealloc](&v3, sel_dealloc);
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (MRAVRoutingDiscoverySession)sharedSession
{
  return self->_sharedSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSession, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outputDevicesTokensMap, 0);
  objc_storeStrong((id *)&self->_endpointsTokensMap, 0);
  objc_storeStrong((id *)&self->_outputDevicesModifiedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesRemovedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesAddedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesChangedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsModifiedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsRemovedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsAddedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsChangedCallbacks, 0);
}

@end
