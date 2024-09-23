@implementation DNDRemoteServiceConnection

void __44__DNDRemoteServiceConnection_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (DNDRemoteServiceConnection)init
{
  DNDRemoteServiceConnection *v2;
  uint64_t v3;
  NSHashTable *eventListeners;
  uint64_t v5;
  NSMutableArray *assertionMonitorRequestDetails;
  uint64_t v7;
  NSMutableArray *stateMonitorRequestDetails;
  uint64_t v9;
  NSMutableArray *settingsMonitorRequestDetails;
  uint64_t v11;
  NSMutableArray *modeIdentifiersMonitorRequestDetails;
  uint64_t v13;
  NSMutableArray *globalConfigurationMonitorRequestDetails;
  uint64_t v15;
  NSMutableArray *meDeviceStateMonitorRequestDetails;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)DNDRemoteServiceConnection;
  v2 = -[DNDRemoteServiceConnection init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v3 = objc_claimAutoreleasedReturnValue();
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    assertionMonitorRequestDetails = v2->_assertionMonitorRequestDetails;
    v2->_assertionMonitorRequestDetails = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    stateMonitorRequestDetails = v2->_stateMonitorRequestDetails;
    v2->_stateMonitorRequestDetails = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    settingsMonitorRequestDetails = v2->_settingsMonitorRequestDetails;
    v2->_settingsMonitorRequestDetails = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    modeIdentifiersMonitorRequestDetails = v2->_modeIdentifiersMonitorRequestDetails;
    v2->_modeIdentifiersMonitorRequestDetails = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    globalConfigurationMonitorRequestDetails = v2->_globalConfigurationMonitorRequestDetails;
    v2->_globalConfigurationMonitorRequestDetails = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    meDeviceStateMonitorRequestDetails = v2->_meDeviceStateMonitorRequestDetails;
    v2->_meDeviceStateMonitorRequestDetails = (NSMutableArray *)v15;

    v2->_monitorState = 0;
    *(_QWORD *)&v2->_stateLock._os_unfair_lock_opaque = 0;
    v2->_monitorLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)registerForStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t monitorState;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  monitorState = self->_monitorState;
  -[NSMutableArray addObject:](self->_stateMonitorRequestDetails, "addObject:", v9);
  os_unfair_lock_unlock(&self->_stateLock);
  switch(monitorState)
  {
    case 2:
      -[DNDRemoteServiceConnection _monitorTarget](self, "_monitorTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerForStateUpdatesWithRequestDetails:completionHandler:", v9, v6);

      break;
    case 1:
      goto LABEL_5;
    case 0:
      os_unfair_lock_lock(&self->_monitorLock);
      -[DNDRemoteServiceConnection _monitorLock_createMonitorConnection](self, "_monitorLock_createMonitorConnection");
      os_unfair_lock_unlock(&self->_monitorLock);
LABEL_5:
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AAB0], 0);
      break;
  }

}

- (void)_monitorLock_createMonitorConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19ABEB000, log, OS_LOG_TYPE_ERROR, "Unable to create monitor endpoint.", v1, 2u);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__DNDRemoteServiceConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id obj;
  _QWORD v61[6];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[6];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  _QWORD v82[5];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[5];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v99 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "XPC monitor connection was activated: connection=%p", buf, 0xCu);
  }
  v55 = v2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setMonitorState:", 2);
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
  v5 = (void *)objc_msgSend(*((id *)WeakRetained + 6), "copy");
  v6 = (void *)objc_msgSend(*((id *)WeakRetained + 7), "copy");
  v50 = (void *)objc_msgSend(*((id *)WeakRetained + 8), "copy");
  v56 = (id)objc_msgSend(*((id *)WeakRetained + 9), "copy");
  v52 = (void *)objc_msgSend(*((id *)WeakRetained + 10), "copy");
  v54 = (void *)objc_msgSend(*((id *)WeakRetained + 11), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v89;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v89 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v11);
        objc_msgSend(WeakRetained, "_monitorTarget");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = v8;
        v87[1] = 3221225472;
        v87[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_261;
        v87[3] = &unk_1E39B6390;
        v87[4] = v12;
        objc_msgSend(v13, "registerForAssertionUpdatesWithRequestDetails:completionHandler:", v12, v87);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v9);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v58 = v6;
  v14 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v84;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v84 != v16)
          objc_enumerationMutation(v58);
        v18 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v17);
        objc_msgSend(WeakRetained, "_monitorTarget");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = v8;
        v82[1] = 3221225472;
        v82[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_263;
        v82[3] = &unk_1E39B6390;
        v82[4] = v18;
        objc_msgSend(v19, "registerForStateUpdatesWithRequestDetails:completionHandler:", v18, v82);

        if (*((_QWORD *)WeakRetained + 13))
        {
          objc_msgSend(WeakRetained, "_remoteTarget");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v81[0] = v8;
          v81[1] = 3221225472;
          v81[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_264;
          v81[3] = &unk_1E39B63B8;
          v81[4] = WeakRetained;
          objc_msgSend(v20, "queryStateForUpdateWithRequestDetails:completionHandler:", v18, v81);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    }
    while (v15);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v21 = v50;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v78;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v78 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v25);
        objc_msgSend(WeakRetained, "_monitorTarget");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = v8;
        v76[1] = 3221225472;
        v76[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_2_267;
        v76[3] = &unk_1E39B6390;
        v76[4] = v26;
        objc_msgSend(v27, "registerForSettingsUpdatesWithRequestDetails:completionHandler:", v26, v76);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
    }
    while (v23);
  }
  v51 = v21;

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v57 = v56;
  v28 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v73;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v73 != v30)
          objc_enumerationMutation(v57);
        v32 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v31);
        objc_msgSend(WeakRetained, "_monitorTarget", v51);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v8;
        v71[1] = 3221225472;
        v71[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_268;
        v71[3] = &unk_1E39B63E0;
        v34 = *(_QWORD *)(a1 + 32);
        v71[4] = v32;
        v71[5] = v34;
        objc_msgSend(v33, "registerForModeSelectionUpdatesWithRequestDetails:completionHandler:", v32, v71);

        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
    }
    while (v29);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v35 = v52;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v93, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v68;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v68 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v39);
        objc_msgSend(WeakRetained, "_monitorTarget", v51);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v8;
        v66[1] = 3221225472;
        v66[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_271;
        v66[3] = &unk_1E39B6390;
        v66[4] = v40;
        objc_msgSend(v41, "registerForGlobalConfigurationUpdatesWithRequestDetails:completionHandler:", v40, v66);

        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v93, 16);
    }
    while (v37);
  }
  v53 = v35;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v42 = v54;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v92, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v63;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v63 != v45)
          objc_enumerationMutation(v42);
        v47 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v46);
        objc_msgSend(WeakRetained, "_monitorTarget", v51, v53);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = v8;
        v61[1] = 3221225472;
        v61[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_272;
        v61[3] = &unk_1E39B6408;
        v49 = *(_QWORD *)(a1 + 32);
        v61[4] = v47;
        v61[5] = v49;
        objc_msgSend(v48, "registerForMeDeviceStateUpdatesWithRequestDetails:completionHandler:", v47, v61);

        ++v46;
      }
      while (v44 != v46);
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v92, 16);
    }
    while (v44);
  }

}

- (void)queryStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__DNDRemoteServiceConnection_queryStateWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6570;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "queryStateWithRequestDetails:completionHandler:", v7, v10);

}

- (void)addEventListener:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_eventListeners;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_eventListeners, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)_setMonitorState:(int64_t)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_monitorState != a3)
    self->_monitorState = a3;
  os_unfair_lock_unlock(p_stateLock);
}

- (id)_remoteTarget
{
  void *v3;

  os_unfair_lock_assert_not_owner(&self->_monitorLock);
  os_unfair_lock_lock(&self->_connectionLock);
  -[BSServiceConnection remoteTarget](self->_connectionLock_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[DNDRemoteServiceConnection _connectionLock_invalidateConnection](self, "_connectionLock_invalidateConnection");
    -[DNDRemoteServiceConnection _connectionLock_createConnection](self, "_connectionLock_createConnection");
    -[BSServiceConnection remoteTarget](self->_connectionLock_connection, "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(&self->_connectionLock);
  return v3;
}

- (id)_monitorTarget
{
  void *v3;

  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  os_unfair_lock_lock(&self->_monitorLock);
  -[BSServiceConnection remoteTarget](self->_monitorLock_monitorService, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[DNDRemoteServiceConnection _monitorLock_invalidateMonitorConnection](self, "_monitorLock_invalidateMonitorConnection");
    -[DNDRemoteServiceConnection _monitorLock_createMonitorConnection](self, "_monitorLock_createMonitorConnection");
    -[BSServiceConnection remoteTarget](self->_monitorLock_monitorService, "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(&self->_monitorLock);
  return v3;
}

- (void)_connectionLock_invalidateConnection
{
  BSServiceConnection *connectionLock_connection;
  BSServiceConnection *v4;

  os_unfair_lock_assert_owner(&self->_connectionLock);
  os_unfair_lock_assert_not_owner(&self->_monitorLock);
  connectionLock_connection = self->_connectionLock_connection;
  if (connectionLock_connection)
  {
    -[BSServiceConnection invalidate](connectionLock_connection, "invalidate");
    v4 = self->_connectionLock_connection;
    self->_connectionLock_connection = 0;

  }
}

- (void)_connectionLock_createConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BSServiceConnection *v7;
  BSServiceConnection *connectionLock_connection;
  BSServiceConnection *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  DNDRemoteServiceConnection *v13;

  os_unfair_lock_assert_owner(&self->_connectionLock);
  os_unfair_lock_assert_not_owner(&self->_monitorLock);
  DNDRemoteServiceServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D03458];
  v10 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointForMachName:service:instance:", CFSTR("com.apple.donotdisturb.service"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
    v7 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
    connectionLock_connection = self->_connectionLock_connection;
    self->_connectionLock_connection = v7;

    v9 = self->_connectionLock_connection;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke;
    v11[3] = &unk_1E39B5F40;
    v12 = v10;
    v13 = self;
    -[BSServiceConnection configureConnection:](v9, "configureConnection:", v11);
    -[BSServiceConnection activate](self->_connectionLock_connection, "activate");

  }
}

uint64_t __77__DNDRemoteServiceConnection_queryStateWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D03478];
  v5 = a2;
  objc_msgSend(v3, "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_253);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_255);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_257);

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_2;
  v10[3] = &unk_1E39B6430;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "setActivationHandler:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_274;
  v8[3] = &unk_1E39B6458;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_275;
  v6[3] = &unk_1E39B6458;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

}

void __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was activated: connection=%p", (uint8_t *)&v4, 0xCu);
  }

}

- (void)registerForModeSelectionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t monitorState;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  monitorState = self->_monitorState;
  -[NSMutableArray addObject:](self->_modeIdentifiersMonitorRequestDetails, "addObject:", v9);
  os_unfair_lock_unlock(&self->_stateLock);
  switch(monitorState)
  {
    case 2:
      -[DNDRemoteServiceConnection _monitorTarget](self, "_monitorTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerForModeSelectionUpdatesWithRequestDetails:completionHandler:", v9, v6);

      break;
    case 1:
      goto LABEL_5;
    case 0:
      os_unfair_lock_lock(&self->_monitorLock);
      -[DNDRemoteServiceConnection _monitorLock_createMonitorConnection](self, "_monitorLock_createMonitorConnection");
      os_unfair_lock_unlock(&self->_monitorLock);
LABEL_5:
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AAB0], 0, 0);
      break;
  }

}

void __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke_254(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was interrupted: connection=%p", (uint8_t *)&v4, 0xCu);
  }

}

void __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke_256(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was invalidated, cannot recover: connection=%p", (uint8_t *)&v4, 0xCu);
  }

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_261(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(a2, "BOOLValue") & 1) == 0)
  {
    v6 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for assertion updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_263(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(a2, "BOOLValue") & 1) == 0)
  {
    v6 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for state updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_264(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char v6;
  DNDStateUpdate *v7;
  id v8;

  v5 = a2;
  if (v5)
  {
    if (!a3)
    {
      v8 = v5;
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "isEqual:", v5);
      v5 = v8;
      if ((v6 & 1) == 0)
      {
        v7 = -[DNDStateUpdate initWithPreviousState:state:reason:source:options:]([DNDStateUpdate alloc], "initWithPreviousState:state:reason:source:options:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), v8, 4, 1, 1);
        objc_msgSend(*(id *)(a1 + 32), "deliverStateUpdate:", v7);

        v5 = v8;
      }
    }
  }

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_2_267(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(a2, "BOOLValue") & 1) == 0)
  {
    v6 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for settings updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_268(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a2, "BOOLValue") & 1) != 0)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deliverActiveModeAssertion:stateUpdate:clientIdentifiers:", v7, 0, v11);

  }
  else
  {
    v12 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_19ABEB000, v12, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for available mode identifier updates on activation: requestDetails=%{public}@, error=%{public}@", buf, 0x16u);
    }
  }

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_271(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(a2, "BOOLValue") & 1) == 0)
  {
    v6 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for global configuration updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_272(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a2, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "deliverMeDeviceState:", v7);
  }
  else
  {
    v9 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for 'Me Device' state updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }

}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_274(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_19ABEB000, v4, OS_LOG_TYPE_DEFAULT, "XPC monitor connection was interrupted, reactivating: connection=%p", (uint8_t *)&v6, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setMonitorState:", 1);

  objc_msgSend(v3, "activate");
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_275(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_19ABEB000, v4, OS_LOG_TYPE_DEFAULT, "XPC monitor connection was invalidated, cannot recover: connection=%p", (uint8_t *)&v6, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setMonitorState:", 0);

}

- (void)_monitorLock_invalidateMonitorConnection
{
  BSServiceConnection *monitorLock_monitorService;
  BSServiceConnection *v4;

  os_unfair_lock_assert_owner(&self->_monitorLock);
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  monitorLock_monitorService = self->_monitorLock_monitorService;
  if (monitorLock_monitorService)
  {
    -[BSServiceConnection invalidate](monitorLock_monitorService, "invalidate");
    v4 = self->_monitorLock_monitorService;
    self->_monitorLock_monitorService = 0;

  }
}

- (void)removeEventListener:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_eventListeners;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_eventListeners, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)resolveBehaviorForEventDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__DNDRemoteServiceConnection_resolveBehaviorForEventDetails_requestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E39B64A8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "resolveBehaviorForEventDetails:requestDetails:completionHandler:", v10, v9, v13);

}

uint64_t __94__DNDRemoteServiceConnection_resolveBehaviorForEventDetails_requestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)takeModeAssertionWithDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__DNDRemoteServiceConnection_takeModeAssertionWithDetails_requestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E39B64D0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "takeModeAssertionWithDetails:requestDetails:completionHandler:", v10, v9, v13);

}

uint64_t __92__DNDRemoteServiceConnection_takeModeAssertionWithDetails_requestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidateActiveModeAssertionWithDetails:(id)a3 reasonOverride:(id)a4 requestDetails:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __119__DNDRemoteServiceConnection_invalidateActiveModeAssertionWithDetails_reasonOverride_requestDetails_completionHandler___block_invoke;
  v16[3] = &unk_1E39B64F8;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "invalidateActiveModeAssertionWithDetails:reasonOverride:requestDetails:completionHandler:", v13, v12, v11, v16);

}

uint64_t __119__DNDRemoteServiceConnection_invalidateActiveModeAssertionWithDetails_reasonOverride_requestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getActiveModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__DNDRemoteServiceConnection_getActiveModeAssertionWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B64D0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getActiveModeAssertionWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __89__DNDRemoteServiceConnection_getActiveModeAssertionWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getLatestModeAssertionInvalidationWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__DNDRemoteServiceConnection_getLatestModeAssertionInvalidationWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B64F8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getLatestModeAssertionInvalidationWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __101__DNDRemoteServiceConnection_getLatestModeAssertionInvalidationWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidateAllActiveModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__DNDRemoteServiceConnection_invalidateAllActiveModeAssertionsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6520;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "invalidateAllActiveModeAssertionsWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __100__DNDRemoteServiceConnection_invalidateAllActiveModeAssertionsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAllModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__DNDRemoteServiceConnection_getAllModeAssertionsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6548;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getAllModeAssertionsWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __87__DNDRemoteServiceConnection_getAllModeAssertionsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerForAssertionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t monitorState;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  monitorState = self->_monitorState;
  -[NSMutableArray addObject:](self->_assertionMonitorRequestDetails, "addObject:", v9);
  os_unfair_lock_unlock(&self->_stateLock);
  switch(monitorState)
  {
    case 2:
      -[DNDRemoteServiceConnection _monitorTarget](self, "_monitorTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerForAssertionUpdatesWithRequestDetails:completionHandler:", v9, v6);

      break;
    case 1:
      goto LABEL_5;
    case 0:
      os_unfair_lock_lock(&self->_monitorLock);
      -[DNDRemoteServiceConnection _monitorLock_createMonitorConnection](self, "_monitorLock_createMonitorConnection");
      os_unfair_lock_unlock(&self->_monitorLock);
LABEL_5:
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AAB0], 0);
      break;
  }

}

- (void)deliverActiveModeAssertionUpdate:(id)a3 invalidation:(id)a4 clientIdentifiers:(id)a5
{
  id v8;
  NSObject *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSHashTable *obj;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v18 = a4;
  v8 = a5;
  v9 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v26 = v19;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "Remote service connection got assertion update: assertion=%{public}@, invalidation=%{public}@, clientIdentifiers=%{public}@", buf, 0x20u);
  }
  obj = self->_eventListeners;
  objc_sync_enter(obj);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_eventListeners;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "clientIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v8, "containsObject:", v15);

          if (v16)
            objc_msgSend(v14, "remoteService:didChangeActiveModeAssertion:invalidation:", self, v19, v18);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_sync_exit(obj);
}

- (void)deliverStateUpdate:(id)a3
{
  id v4;
  DNDState *v5;
  DNDState *lastReceivedState;
  NSHashTable *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "state");
  v5 = (DNDState *)objc_claimAutoreleasedReturnValue();
  lastReceivedState = self->_lastReceivedState;
  self->_lastReceivedState = v5;

  v7 = self->_eventListeners;
  objc_sync_enter(v7);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_eventListeners;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "remoteService:didReceiveDoNotDisturbStateUpdate:", self, v4, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)setScreenIsShared:(id)a3 screenIsMirrored:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__DNDRemoteServiceConnection_setScreenIsShared_screenIsMirrored_withRequestDetails_completionHandler___block_invoke;
  v16[3] = &unk_1E39B6520;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "setScreenIsShared:screenIsMirrored:withRequestDetails:completionHandler:", v13, v12, v11, v16);

}

uint64_t __102__DNDRemoteServiceConnection_setScreenIsShared_screenIsMirrored_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getBehaviorSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__DNDRemoteServiceConnection_getBehaviorSettingsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6598;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getBehaviorSettingsWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __86__DNDRemoteServiceConnection_getBehaviorSettingsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setBehaviorSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__DNDRemoteServiceConnection_setBehaviorSettings_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E39B6520;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "setBehaviorSettings:withRequestDetails:completionHandler:", v10, v9, v13);

}

uint64_t __87__DNDRemoteServiceConnection_setBehaviorSettings_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getScheduleSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__DNDRemoteServiceConnection_getScheduleSettingsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B65C0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getScheduleSettingsWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __86__DNDRemoteServiceConnection_getScheduleSettingsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setScheduleSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__DNDRemoteServiceConnection_setScheduleSettings_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E39B6520;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "setScheduleSettings:withRequestDetails:completionHandler:", v10, v9, v13);

}

uint64_t __87__DNDRemoteServiceConnection_setScheduleSettings_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerForSettingsUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t monitorState;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  monitorState = self->_monitorState;
  -[NSMutableArray addObject:](self->_settingsMonitorRequestDetails, "addObject:", v9);
  os_unfair_lock_unlock(&self->_stateLock);
  switch(monitorState)
  {
    case 2:
      -[DNDRemoteServiceConnection _monitorTarget](self, "_monitorTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerForSettingsUpdatesWithRequestDetails:completionHandler:", v9, v6);

      break;
    case 1:
      goto LABEL_5;
    case 0:
      os_unfair_lock_lock(&self->_monitorLock);
      -[DNDRemoteServiceConnection _monitorLock_createMonitorConnection](self, "_monitorLock_createMonitorConnection");
      os_unfair_lock_unlock(&self->_monitorLock);
LABEL_5:
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AAB0], 0);
      break;
  }

}

- (void)syncModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__DNDRemoteServiceConnection_syncModeConfigurationsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6520;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "syncModeConfigurationsWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __89__DNDRemoteServiceConnection_syncModeConfigurationsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCloudSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__DNDRemoteServiceConnection_getCloudSyncStateWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6520;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getCloudSyncStateWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __84__DNDRemoteServiceConnection_getCloudSyncStateWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setCloudSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__DNDRemoteServiceConnection_setCloudSyncPreferenceEnabled_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E39B6520;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "setCloudSyncPreferenceEnabled:withRequestDetails:completionHandler:", v10, v9, v13);

}

uint64_t __97__DNDRemoteServiceConnection_setCloudSyncPreferenceEnabled_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPairSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__DNDRemoteServiceConnection_getPairSyncStateWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6520;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getPairSyncStateWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __83__DNDRemoteServiceConnection_getPairSyncStateWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPairSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__DNDRemoteServiceConnection_setPairSyncPreferenceEnabled_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E39B6520;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "setPairSyncPreferenceEnabled:withRequestDetails:completionHandler:", v10, v9, v13);

}

uint64_t __96__DNDRemoteServiceConnection_setPairSyncPreferenceEnabled_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAccountFeatureSupportWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__DNDRemoteServiceConnection_getAccountFeatureSupportWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B65E8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getAccountFeatureSupportWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __91__DNDRemoteServiceConnection_getAccountFeatureSupportWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deliverUpdatedBehaviorSettings:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_eventListeners;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_eventListeners;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveUpdatedBehaviorSettings:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)deliverUpdatedScheduleSettings:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_eventListeners;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_eventListeners;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveUpdatedScheduleSettings:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)deliverUpdatedPairSyncState:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_eventListeners;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_eventListeners;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveUpdatedPairSyncState:", self, objc_msgSend(v4, "unsignedIntegerValue", (_QWORD)v11));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)deliverUpdatedPhoneCallBypassSettings:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_eventListeners;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_eventListeners;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveUpdatedPhoneCallBypassSettings:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)deliverUpdatedPreventAutoReplySetting:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_eventListeners;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_eventListeners;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveUpdatedPreventAutoReplySetting:", self, objc_msgSend(v4, "BOOLValue", (_QWORD)v11));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)setModeConfiguration:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setModeConfiguration:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)getAllModesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__DNDRemoteServiceConnection_getAllModesWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6610;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getAllModesWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __78__DNDRemoteServiceConnection_getAllModesWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAvailableModesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__DNDRemoteServiceConnection_getAvailableModesWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6610;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getAvailableModesWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __84__DNDRemoteServiceConnection_getAvailableModesWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeModeConfigurationForModeIdentifier:deletePlaceholder:withRequestDetails:completionHandler:", v13, v12, v11, v10);

}

- (void)getModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__DNDRemoteServiceConnection_getModeConfigurationsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6638;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getModeConfigurationsWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __88__DNDRemoteServiceConnection_getModeConfigurationsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getModeConfigurationForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getModeConfigurationForModeIdentifier:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)getAllowedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getAllowedModesForContactHandle:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)getSilencedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getSilencedModesForContactHandle:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)getUserAvailabilityInActiveModeForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getUserAvailabilityInActiveModeForContactHandle:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)publishStatusKitAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "publishStatusKitAvailabilityWithRequestDetails:completionHandler:", v7, v6);

}

- (void)getPreventAutoReplyWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getPreventAutoReplyWithRequestDetails:completionHandler:", v7, v6);

}

- (void)setPreventAutoReply:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreventAutoReply:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)getModesCanImpactAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getModesCanImpactAvailabilityWithRequestDetails:completionHandler:", v7, v6);

}

- (void)setModesCanImpactAvailability:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setModesCanImpactAvailability:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __126__DNDRemoteServiceConnection_didChangeFocusStatusSharingSettingForApplicationIdentifier_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E39B6520;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "didChangeFocusStatusSharingSettingForApplicationIdentifier:withRequestDetails:completionHandler:", v10, v9, v13);

}

uint64_t __126__DNDRemoteServiceConnection_didChangeFocusStatusSharingSettingForApplicationIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getStateDumpWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__DNDRemoteServiceConnection_getStateDumpWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B6660;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getStateDumpWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __79__DNDRemoteServiceConnection_getStateDumpWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerForGlobalConfigurationUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t monitorState;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  monitorState = self->_monitorState;
  -[NSMutableArray addObject:](self->_globalConfigurationMonitorRequestDetails, "addObject:", v9);
  os_unfair_lock_unlock(&self->_stateLock);
  switch(monitorState)
  {
    case 2:
      -[DNDRemoteServiceConnection _monitorTarget](self, "_monitorTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerForGlobalConfigurationUpdatesWithRequestDetails:completionHandler:", v9, v6);

      break;
    case 1:
      goto LABEL_5;
    case 0:
      os_unfair_lock_lock(&self->_monitorLock);
      -[DNDRemoteServiceConnection _monitorLock_createMonitorConnection](self, "_monitorLock_createMonitorConnection");
      os_unfair_lock_unlock(&self->_monitorLock);
LABEL_5:
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AAB0], 0);
      break;
  }

}

- (void)deliverAllModes:(id)a3
{
  id v4;
  NSHashTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSHashTable *obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  obj = self->_eventListeners;
  objc_sync_enter(obj);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_eventListeners;
  v6 = 0;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveUpdatedModes:", self, v4);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (!v6)
          {
            objc_msgSend(v4, "bs_map:", &__block_literal_global_305);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "remoteService:didReceiveUpdatedModeIdentifiers:", self, v6);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(obj);
}

uint64_t __46__DNDRemoteServiceConnection_deliverAllModes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modeIdentifier");
}

- (void)deliverAvailableModes:(id)a3
{
  id v4;
  NSHashTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSHashTable *obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  obj = self->_eventListeners;
  objc_sync_enter(obj);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_eventListeners;
  v6 = 0;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveUpdatedAvailableModes:", self, v4);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (!v6)
          {
            objc_msgSend(v4, "bs_map:", &__block_literal_global_310);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "remoteService:didReceiveUpdatedAvailableModeIdentifiers:", self, v6);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(obj);
}

uint64_t __52__DNDRemoteServiceConnection_deliverAvailableModes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modeIdentifier");
}

- (void)deliverActiveModeAssertion:(id)a3 stateUpdate:(id)a4 clientIdentifiers:(id)a5
{
  id v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSHashTable *obj;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v17 = a4;
  v8 = a5;
  obj = self->_eventListeners;
  objc_sync_enter(obj);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_eventListeners;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "clientIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v8, "containsObject:", v14);

          if (v15)
            objc_msgSend(v13, "remoteService:didReceiveUpdatedActiveModeAssertion:stateUpdate:", self, v18, v17);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_sync_exit(obj);
}

- (void)signalAppConfigurationContextUpdateForModeIdentifier:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_eventListeners;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_eventListeners;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveAppConfigurationContextUpdateForModeIdentifier:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)activateModeWithDetails:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateModeWithDetails:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)activeModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__DNDRemoteServiceConnection_activeModeAssertionWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B64D0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "activeModeAssertionWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __86__DNDRemoteServiceConnection_activeModeAssertionWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidateModeAssertionWithUUID:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateModeAssertionWithUUID:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)getAppInfoForBundleIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getAppInfoForBundleIdentifier:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)getAppInfoForBundleIdentifiers:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getAppInfoForBundleIdentifiers:withRequestDetails:completionHandler:", v10, v9, v8);

}

- (void)deliverMeDeviceState:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_eventListeners;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_eventListeners;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "remoteService:didReceiveUpdatedMeDeviceState:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)queryMeDeviceStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__DNDRemoteServiceConnection_queryMeDeviceStateWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E39B66E8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "queryMeDeviceStateWithRequestDetails:completionHandler:", v7, v10);

}

uint64_t __85__DNDRemoteServiceConnection_queryMeDeviceStateWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerForMeDeviceStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t monitorState;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  monitorState = self->_monitorState;
  -[NSMutableArray addObject:](self->_meDeviceStateMonitorRequestDetails, "addObject:", v9);
  os_unfair_lock_unlock(&self->_stateLock);
  switch(monitorState)
  {
    case 2:
      -[DNDRemoteServiceConnection _monitorTarget](self, "_monitorTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerForMeDeviceStateUpdatesWithRequestDetails:completionHandler:", v9, v6);

      break;
    case 1:
      goto LABEL_5;
    case 0:
      os_unfair_lock_lock(&self->_monitorLock);
      -[DNDRemoteServiceConnection _monitorLock_createMonitorConnection](self, "_monitorLock_createMonitorConnection");
      os_unfair_lock_unlock(&self->_monitorLock);
LABEL_5:
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AAB0], 0, 0);
      break;
  }

}

- (void)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __156__DNDRemoteServiceConnection_setAppConfigurationPredicate_forActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v24[3] = &unk_1E39B6520;
    v25 = v19;
    objc_msgSend(v20, "setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v14, v15, v16, v17, v18, v24);

    v21 = v25;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("DNDAppConfigurationService is only supported when linking LinkServices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, MEMORY[0x1E0C9AAA0], v23);

  }
}

void __156__DNDRemoteServiceConnection_setAppConfigurationPredicate_forActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Failed to set predicate.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1008, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getAppConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __155__DNDRemoteServiceConnection_getAppConfigurationPredicateForActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E39B6710;
    v22 = v16;
    objc_msgSend(v17, "getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v12, v13, v14, v15, v21);

    v18 = v22;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("DNDAppConfigurationService is only supported when linking LinkServices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v20);

  }
}

uint64_t __155__DNDRemoteServiceConnection_getAppConfigurationPredicateForActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __176__DNDRemoteServiceConnection_setAppConfigurationTargetContentIdentifierPrefix_forActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
  v22[3] = &unk_1E39B6520;
  v23 = v14;
  v21 = v14;
  objc_msgSend(v20, "setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v19, v18, v17, v16, v15, v22);

}

void __176__DNDRemoteServiceConnection_setAppConfigurationTargetContentIdentifierPrefix_forActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Failed to set target content identifier prefix.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1008, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __135__DNDRemoteServiceConnection_getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E39B6738;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:withRequestDetails:completionHandler:", v10, v9, v13);

}

uint64_t __135__DNDRemoteServiceConnection_getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAppConfigurationAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __133__DNDRemoteServiceConnection_setAppConfigurationAction_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E39B6520;
    v22 = v16;
    objc_msgSend(v17, "setAppConfigurationAction:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v12, v13, v14, v15, v21);

    v18 = v22;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("DNDAppConfigurationService is only supported when linking LinkServices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, MEMORY[0x1E0C9AAA0], v20);

  }
}

uint64_t __133__DNDRemoteServiceConnection_setAppConfigurationAction_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearAppConfigurationActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __149__DNDRemoteServiceConnection_clearAppConfigurationActionWithIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E39B6520;
    v22 = v16;
    objc_msgSend(v17, "clearAppConfigurationActionWithIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v12, v13, v14, v15, v21);

    v18 = v22;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("DNDAppConfigurationService is only supported when linking LinkServices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, MEMORY[0x1E0C9AAA0], v20);

  }
}

uint64_t __149__DNDRemoteServiceConnection_clearAppConfigurationActionWithIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAppConfigurationActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __111__DNDRemoteServiceConnection_getAppConfigurationActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E39B6760;
    v16 = v10;
    objc_msgSend(v11, "getAppConfigurationActionsForModeIdentifier:withRequestDetails:completionHandler:", v8, v9, v15);

    v12 = v16;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("DNDAppConfigurationService is only supported when linking LinkServices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

uint64_t __111__DNDRemoteServiceConnection_getAppConfigurationActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __120__DNDRemoteServiceConnection_setAppAction_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E39B6520;
    v22 = v16;
    objc_msgSend(v17, "setAppAction:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v12, v13, v14, v15, v21);

    v18 = v22;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("DNDAppConfigurationService is only supported when linking LinkServices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, MEMORY[0x1E0C9AAA0], v20);

  }
}

void __120__DNDRemoteServiceConnection_setAppAction_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Failed to save action.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1008, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getAppActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__DNDRemoteServiceConnection_getAppActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E39B6760;
    v16 = v10;
    objc_msgSend(v11, "getAppActionsForModeIdentifier:withRequestDetails:completionHandler:", v8, v9, v15);

    v12 = v16;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("DNDAppConfigurationService is only supported when linking LinkServices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

uint64_t __98__DNDRemoteServiceConnection_getAppActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __136__DNDRemoteServiceConnection_clearAppActionWithIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E39B6520;
    v22 = v16;
    objc_msgSend(v17, "clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v12, v13, v14, v15, v21);

    v18 = v22;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("DNDAppConfigurationService is only supported when linking LinkServices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, MEMORY[0x1E0C9AAA0], v20);

  }
}

uint64_t __136__DNDRemoteServiceConnection_clearAppActionWithIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSystemAction:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (NSClassFromString(CFSTR("WFToggleSettingContextualAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __101__DNDRemoteServiceConnection_setSystemAction_forModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v18[3] = &unk_1E39B6520;
    v19 = v13;
    objc_msgSend(v14, "setSystemAction:forModeIdentifier:withRequestDetails:completionHandler:", v10, v11, v12, v18);

    v15 = v19;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("DNDAppConfigurationService is only supported when linking VoiceShortcutClient");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, MEMORY[0x1E0C9AAA0], v17);

  }
}

void __101__DNDRemoteServiceConnection_setSystemAction_forModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Failed to save action.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1008, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (NSClassFromString(CFSTR("WFToggleSettingContextualAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __117__DNDRemoteServiceConnection_clearSystemActionWithIdentifier_forModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v18[3] = &unk_1E39B6520;
    v19 = v13;
    objc_msgSend(v14, "clearSystemActionWithIdentifier:forModeIdentifier:withRequestDetails:completionHandler:", v10, v11, v12, v18);

    v15 = v19;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("DNDAppConfigurationService is only supported when linking VoiceShortcutClient");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, MEMORY[0x1E0C9AAA0], v17);

  }
}

uint64_t __117__DNDRemoteServiceConnection_clearSystemActionWithIdentifier_forModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getSystemActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (NSClassFromString(CFSTR("WFToggleSettingContextualAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __101__DNDRemoteServiceConnection_getSystemActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E39B6788;
    v16 = v10;
    objc_msgSend(v11, "getSystemActionsForModeIdentifier:withRequestDetails:completionHandler:", v8, v9, v15);

    v12 = v16;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("DNDAppConfigurationService is only supported when linking VoiceShortcutClient");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

uint64_t __101__DNDRemoteServiceConnection_getSystemActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSystemConfigurationAction:(id)a3 modeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (NSClassFromString(CFSTR("WFToggleSettingContextualAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __111__DNDRemoteServiceConnection_setSystemConfigurationAction_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v18[3] = &unk_1E39B6520;
    v19 = v13;
    objc_msgSend(v14, "setSystemConfigurationAction:modeIdentifier:withRequestDetails:completionHandler:", v10, v11, v12, v18);

    v15 = v19;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("DNDAppConfigurationService is only supported when linking VoiceShortcutClient");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, MEMORY[0x1E0C9AAA0], v17);

  }
}

uint64_t __111__DNDRemoteServiceConnection_setSystemConfigurationAction_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearSystemConfigurationActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (NSClassFromString(CFSTR("WFToggleSettingContextualAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __127__DNDRemoteServiceConnection_clearSystemConfigurationActionWithIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v18[3] = &unk_1E39B6520;
    v19 = v13;
    objc_msgSend(v14, "clearSystemConfigurationActionWithIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v10, v11, v12, v18);

    v15 = v19;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("DNDAppConfigurationService is only supported when linking VoiceShortcutClient");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, MEMORY[0x1E0C9AAA0], v17);

  }
}

uint64_t __127__DNDRemoteServiceConnection_clearSystemConfigurationActionWithIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getSystemConfigurationActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (NSClassFromString(CFSTR("WFToggleSettingContextualAction")))
  {
    -[DNDRemoteServiceConnection _remoteTarget](self, "_remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __114__DNDRemoteServiceConnection_getSystemConfigurationActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E39B67B0;
    v16 = v10;
    objc_msgSend(v11, "getSystemConfigurationActionsForModeIdentifier:withRequestDetails:completionHandler:", v8, v9, v15);

    v12 = v16;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("DNDAppConfigurationService is only supported when linking VoiceShortcutClient");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

uint64_t __114__DNDRemoteServiceConnection_getSystemConfigurationActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedState, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
  objc_storeStrong((id *)&self->_meDeviceStateMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_globalConfigurationMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_modeIdentifiersMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_settingsMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_stateMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_assertionMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_connectionLock_connection, 0);
  objc_storeStrong((id *)&self->_monitorLock_monitorService, 0);
}

@end
