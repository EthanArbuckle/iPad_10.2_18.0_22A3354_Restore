@implementation MNNavigationServiceRemoteProxy

- (MNNavigationServiceRemoteProxy)init
{
  MNNavigationServiceRemoteProxy *v2;
  uint64_t v3;
  OS_dispatch_queue *serialQueue;
  uint64_t v5;
  geo_isolater *clientsLock;
  uint64_t v7;
  NSHashTable *clients;
  uint64_t v9;
  geo_isolater *interruptionDatesLock;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MNNavigationServiceRemoteProxy;
  v2 = -[MNNavigationServiceRemoteProxy init](&v12, sel_init);
  if (v2)
  {
    geo_dispatch_queue_create_with_qos();
    v3 = objc_claimAutoreleasedReturnValue();
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = geo_isolater_create();
    clientsLock = v2->_clientsLock;
    v2->_clientsLock = (geo_isolater *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 261);
    v7 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v7;

    v9 = geo_isolater_create();
    interruptionDatesLock = v2->_interruptionDatesLock;
    v2->_interruptionDatesLock = (geo_isolater *)v9;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MNNavigationServiceRemoteProxy _closeConnection](self, "_closeConnection");
  v3.receiver = self;
  v3.super_class = (Class)MNNavigationServiceRemoteProxy;
  -[MNNavigationServiceRemoteProxy dealloc](&v3, sel_dealloc);
}

- (void)openForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MNNavigationServiceRemoteProxy isOpenForClient:](self, "isOpenForClient:", v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling openForClient with an already existing client."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v10 = "-[MNNavigationServiceRemoteProxy openForClient:]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServiceRemoteProxy.m";
      v13 = 1024;
      v14 = 90;
      v15 = 2080;
      v16 = "NO";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = v4;
    geo_isolate_sync();
    -[MNNavigationServiceRemoteProxy _updateConnection](self, "_updateConnection", v7, 3221225472, __48__MNNavigationServiceRemoteProxy_openForClient___block_invoke, &unk_1E61D1D10, self);

  }
}

uint64_t __48__MNNavigationServiceRemoteProxy_openForClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)closeForClient:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  geo_isolate_sync();
  -[MNNavigationServiceRemoteProxy _updateConnection](self, "_updateConnection");

}

uint64_t __49__MNNavigationServiceRemoteProxy_closeForClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isOpenForClient:(id)a3
{
  char v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5 = a3;
  geo_isolate_sync();
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__MNNavigationServiceRemoteProxy_isOpenForClient___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 40), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (NSArray)interruptionDates
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
  v7 = __Block_byref_object_copy__13;
  v8 = __Block_byref_object_dispose__13;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

void __51__MNNavigationServiceRemoteProxy_interruptionDates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)interruptionCount
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __51__MNNavigationServiceRemoteProxy_interruptionCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)clientCount
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __45__MNNavigationServiceRemoteProxy_clientCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setRepresentation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (void)_updateConnection
{
  unint64_t v3;
  NSXPCConnection *connection;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[MNNavigationServiceRemoteProxy clientCount](self, "clientCount");
  connection = self->_connection;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109632;
    v6[1] = v3 != 0;
    v7 = 1024;
    v8 = connection != 0;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Updating connection for new client list. shouldConnect: %d, isConnected: %d, clientCount: %d", (uint8_t *)v6, 0x14u);
  }

  if ((v3 != 0) != (connection != 0))
  {
    if (v3)
      -[MNNavigationServiceRemoteProxy _openConnection](self, "_openConnection");
    else
      -[MNNavigationServiceRemoteProxy _closeConnection](self, "_closeConnection");
  }
}

- (void)_openConnection
{
  NSObject *v3;
  NSObject *serialQueue;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_connection)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling _openConnection when XPC connection has already been created"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v9 = "-[MNNavigationServiceRemoteProxy _openConnection]";
    v10 = 2080;
    v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServiceRemoteProxy.m";
    v12 = 1024;
    v13 = 165;
    v14 = 2080;
    v15 = "_connection == nil";
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }

  if (!self->_connection)
  {
LABEL_2:
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Opening connection to navigation server", buf, 2u);
    }

    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke;
    block[3] = &unk_1E61D23C8;
    block[4] = self;
    dispatch_async(serialQueue, block);
  }
}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[8];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD block[4];
  void *v23;
  _BYTE location[12];
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_hasNavigationServiceEntitlement") & 1) != 0)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.navigationService"), 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEED23B0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setExpectedClassesForClientInterface:", v5);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEED5B90);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRemoteObjectInterface:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedInterface:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:");
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_250;
    v20[3] = &unk_1E61D2F90;
    objc_copyWeak(&v21, (id *)location);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", v20);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_2;
    v18[3] = &unk_1E61D2F90;
    objc_copyWeak(&v19, (id *)location);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInvalidationHandler:", v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Connection to navigation server created", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "checkinForNavigationService:", 0);
    geo_isolate_sync();
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Process '%@' is trying to use the MNNavigationService SPI without the proper entitlement."), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 32), "_hasNavigationServiceEntitlement") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "[self _hasNavigationServiceEntitlement]";
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", location, 0x16u);
      }

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_25;
    block[3] = &unk_1E61D23C8;
    v23 = v12;
    v13 = MNNavigationServiceXPCMachPort_block_invoke_onceToken;
    v14 = v12;
    v5 = v14;
    if (v13 == -1)
    {
      v6 = v14;
    }
    else
    {
      dispatch_once(&MNNavigationServiceXPCMachPort_block_invoke_onceToken, block);
      v6 = v23;
    }
  }

}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v4, 0xCu);
  }

}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_250(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInterruption");

}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInvalidation");

}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_251(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (void)_setExpectedClassesForClientInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_navigationServiceProxy_didUpdatePreviewRoutes_withSelectedRouteIndex_, 1, 0);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_navigationServiceProxy_didRerouteWithRoute_withLocation_withAlternateRoutes_rerouteReason_, 3, 0);
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_navigationServiceProxy_didFailRerouteWithError_, 1, 0);
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_navigationServiceProxy_didUpdateAlternateRoutes_, 1, 0);
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_navigationServiceProxy_didFailWithError_, 1, 0);
  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_navigationServiceProxy_willRequestRealtimeUpdatesForRouteIDs_, 1, 0);
  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, v31, v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_navigationServiceProxy_didReceiveRealtimeUpdates_, 1, 0);
  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_navigationServiceProxy_updateSignsWithARInfo_, 1, 0);
}

- (BOOL)_hasNavigationServiceEntitlement
{
  if (qword_1ED0C40A0 != -1)
    dispatch_once(&qword_1ED0C40A0, &__block_literal_global_37);
  return _MergedGlobals_40;
}

void __66__MNNavigationServiceRemoteProxy__hasNavigationServiceEntitlement__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.navigation.spi"), &error);
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      _MergedGlobals_40 = v5;
      CFRelease(v3);
    }
    else
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Error getting entitlement value from security task", buf, 2u);
      }

    }
    if (error)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = error;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Error getting entitlement value from security task: %@", buf, 0xCu);
      }

      CFRelease(error);
    }
    CFRelease(v1);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Error creating security task", buf, 2u);
    }

  }
}

- (void)_handleInterruption
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *serialQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    +[MNNavigationService sharedService](MNNavigationService, "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(objc_msgSend(v4, "state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "navd connection interrupted while in state '%@'.", buf, 0xCu);

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MNNavigationServiceRemoteProxy__handleInterruption__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __53__MNNavigationServiceRemoteProxy__handleInterruption__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDisconnect");
}

- (void)_handleInvalidation
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *serialQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    +[MNNavigationService sharedService](MNNavigationService, "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(objc_msgSend(v4, "state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "navd connection invalidated while in state '%@'. See logs with 'category=\"xpc.exceptions\"' for more information on the invalidation.", buf, 0xCu);

  }
  -[MNNavigationServiceRemoteProxy _closeConnection](self, "_closeConnection");
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MNNavigationServiceRemoteProxy__handleInvalidation__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __53__MNNavigationServiceRemoteProxy__handleInvalidation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateConnection");
  return objc_msgSend(*(id *)(a1 + 32), "_handleDisconnect");
}

- (void)_handleDisconnect
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  MNStartNavigationDetails *startNavigationDetails;
  MNStartNavigationReconnectionDetails *reconnectionDetails;
  uint64_t UInteger;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[MNStartNavigationReconnectionDetails isReconnecting](self->_reconnectionDetails, "isReconnecting"))
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "Handling a navd disconnect while a reconnect was already in progress. This likely means that navd is crashing repeatedly. Attempting to continue anyway.", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MNNavigationServiceRemoteProxy _shouldReconnectWithInterruptionOnDate:](self, "_shouldReconnectWithInterruptionOnDate:", v4);
  v22 = MEMORY[0x1E0C809B0];
  v6 = v4;
  v23 = v6;
  geo_isolate_sync();
  if (v5)
  {
    +[MNNavigationService sharedService](MNNavigationService, "sharedService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "state") >= 3
      && (objc_msgSend(v7, "route"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      && (startNavigationDetails = self->_startNavigationDetails, v8, startNavigationDetails))
    {
      -[MNNavigationServiceRemoteProxy _restoreNavigationSession](self, "_restoreNavigationSession");
    }
    else
    {
      -[MNNavigationServiceRemoteProxy _restoreIdleConnection](self, "_restoreIdleConnection");
    }
  }
  else
  {
    reconnectionDetails = self->_reconnectionDetails;
    self->_reconnectionDetails = 0;

    UInteger = GEOConfigGetUInteger();
    GEOConfigGetDouble();
    v13 = v12;
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = -[MNNavigationServiceRemoteProxy interruptionCount](self, "interruptionCount");
      *(_DWORD *)buf = 67109632;
      v27 = UInteger;
      v28 = 1024;
      v29 = v15;
      v30 = 2048;
      v31 = v13;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "navd connection interrupted over %d times (%d overall) in %g seconds. No longer attempting to reconnect.", buf, 0x18u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection to the navigation service was interrupted over %d times in %g seconds. Please file a Radar with a sysdiagnose."), UInteger, v13, v22, 3221225472, __51__MNNavigationServiceRemoteProxy__handleDisconnect__block_invoke, &unk_1E61D1D10, self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v7;
    v24[0] = CFSTR("MNErrorInternalDescriptionKey");
    v24[1] = CFSTR("MNErrorInterruptionDatesKey");
    -[MNNavigationServiceRemoteProxy interruptionDates](self, "interruptionDates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:userInfo:", 10, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationServiceProxy:didFailWithError:", self, v18);

    +[MNNavigationService sharedService](MNNavigationService, "sharedService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v21, "navigationServiceProxy:didChangeFromState:toState:", self, objc_msgSend(v20, "state"), 0);

  }
}

uint64_t __51__MNNavigationServiceRemoteProxy__handleDisconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_restoreNavigationSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MNStartNavigationReconnectionDetails *v17;
  MNStartNavigationReconnectionDetails *reconnectionDetails;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _DWORD v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v26[0] = 67109120;
    v26[1] = -[MNNavigationServiceRemoteProxy interruptionCount](self, "interruptionCount");
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "Attempting to restart navigation after interruption (%d interruptions overall)", (uint8_t *)v26, 8u);
  }

  +[MNNavigationService sharedService](MNNavigationService, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "userOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationServiceRemoteProxy changeUserOptions:](self, "changeUserOptions:", v6);

    objc_msgSend(v4, "alternateRoutes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") + 1;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(v4, "alternateRoutes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v11);

    v12 = (void *)-[MNStartNavigationDetails copy](self->_startNavigationDetails, "copy");
    objc_msgSend(v12, "setRoutes:", v9);
    objc_msgSend(v4, "currentRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDirectionsRequest:", v13);

    objc_msgSend(v4, "currentResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDirectionsResponse:", v14);

    objc_msgSend(v4, "lastLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInitialUserLocation:", v15);

    objc_msgSend(v4, "details");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MNStartNavigationReconnectionDetails);
    reconnectionDetails = self->_reconnectionDetails;
    self->_reconnectionDetails = v17;

    -[MNStartNavigationReconnectionDetails setIsReconnecting:](self->_reconnectionDetails, "setIsReconnecting:", 1);
    -[MNStartNavigationReconnectionDetails setInitialRouteSource:](self->_reconnectionDetails, "setInitialRouteSource:", objc_msgSend(v16, "initialRouteSource"));
    -[MNStartNavigationReconnectionDetails setTargetLegIndex:](self->_reconnectionDetails, "setTargetLegIndex:", objc_msgSend(v16, "targetLegIndex"));
    objc_msgSend(v16, "spokenAnnouncements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNStartNavigationReconnectionDetails setSpokenAnnouncements:](self->_reconnectionDetails, "setSpokenAnnouncements:", v19);

    objc_msgSend(v16, "resumeRouteHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "serverSessionState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNStartNavigationReconnectionDetails setServerSessionState:](self->_reconnectionDetails, "setServerSessionState:", v21);

    objc_msgSend(v12, "setReconnectionDetails:", self->_reconnectionDetails);
    objc_msgSend(v4, "tracePath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 && (objc_msgSend(v4, "traceIsPlaying") & 1) == 0)
    {
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByDeletingPathExtension");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTraceRecordingNameOverride:", v24);

    }
    -[MNNavigationServiceRemoteProxy _startNavigationWithDetails:](self, "_startNavigationWithDetails:", v12);

  }
  else
  {
    GEOFindOrCreateLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26[0]) = 0;
      _os_log_impl(&dword_1B0AD7000, v25, OS_LOG_TYPE_ERROR, "Restoring navigation session failed because no active route was found.", (uint8_t *)v26, 2u);
    }

    v9 = self->_reconnectionDetails;
    self->_reconnectionDetails = 0;
  }

}

- (void)_restoreIdleConnection
{
  NSObject *v3;
  uint8_t buf[4];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v5 = -[MNNavigationServiceRemoteProxy interruptionCount](self, "interruptionCount");
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "Attempting to restore idle connection after interruption (%d interruptions overall)", buf, 8u);
  }

  -[MNNavigationServiceRemoteProxy _releaseSandboxExtension](self, "_releaseSandboxExtension");
  geo_isolate_sync();
  -[MNNavigationServiceRemoteProxy checkinForNavigationService:](self, "checkinForNavigationService:", 0);
}

uint64_t __56__MNNavigationServiceRemoteProxy__restoreIdleConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

- (BOOL)_shouldReconnectWithInterruptionOnDate:(id)a3
{
  id v4;
  unint64_t UInteger;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  UInteger = GEOConfigGetUInteger();
  if (-[MNNavigationServiceRemoteProxy interruptionCount](self, "interruptionCount") <= UInteger)
  {
    v9 = 1;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__13;
    v15 = __Block_byref_object_dispose__13;
    v16 = 0;
    geo_isolate_sync();
    GEOConfigGetDouble();
    v7 = v6;
    objc_msgSend(v4, "timeIntervalSinceDate:", v12[5]);
    v9 = v8 >= v7;
    _Block_object_dispose(&v11, 8);

  }
  return v9;
}

void __73__MNNavigationServiceRemoteProxy__shouldReconnectWithInterruptionOnDate___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "objectAtIndexedSubscript:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_closeConnection
{
  NSObject *v3;
  NSObject *serialQueue;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Closing connection to navigation server", buf, 2u);
  }

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MNNavigationServiceRemoteProxy__closeConnection__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __50__MNNavigationServiceRemoteProxy__closeConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  geo_isolate_sync();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_releaseSandboxExtension");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

}

void __50__MNNavigationServiceRemoteProxy__closeConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = 0;

}

- (void)_startNavigationWithDetails:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *serialQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "%@ => navd _startNavigationWithDetails", buf, 0xCu);

  }
  serialQueue = self->_serialQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__MNNavigationServiceRemoteProxy__startNavigationWithDetails___block_invoke;
  v10[3] = &unk_1E61D1D10;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(serialQueue, v10);

}

void __62__MNNavigationServiceRemoteProxy__startNavigationWithDetails___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startNavigationWithDetails:activeBlock:", *(_QWORD *)(a1 + 40), &__block_literal_global_281_1);

}

- (id)_remoteObjectProxy
{
  NSXPCConnection *connection;
  void *v4;
  NSObject *v5;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (!connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to connect to navd without previously opening a connection. Execution can continue but please file a radar."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "-[MNNavigationServiceRemoteProxy _remoteObjectProxy]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServiceRemoteProxy.m";
      v13 = 1024;
      v14 = 456;
      v15 = 2080;
      v16 = "NO";
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v9, 0x30u);
    }

    -[MNNavigationServiceRemoteProxy _openConnection](self, "_openConnection");
    connection = self->_connection;
    if (!connection)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC connection must be created before calling remoteObjectProxy"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136316162;
        v10 = "-[MNNavigationServiceRemoteProxy _remoteObjectProxy]";
        v11 = 2080;
        v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServiceRemoteProxy.m";
        v13 = 1024;
        v14 = 460;
        v15 = 2080;
        v16 = "_connection != nil";
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v9, 0x30u);
      }

      connection = self->_connection;
    }
  }
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_consumeSandboxExtension:(char *)a3
{
  int64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  int v12;
  char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 && *a3)
  {
    v5 = sandbox_extension_consume();
    if (v5 == -1)
    {
      MNGetMNNavigationServiceLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v11 = *__error();
        v12 = 136380931;
        v13 = a3;
        v14 = 1024;
        v15 = v11;
        v7 = "Error consuming (%{private}s) sandbox extension: %d";
        v8 = v6;
        v9 = OS_LOG_TYPE_ERROR;
        v10 = 18;
        goto LABEL_8;
      }
    }
    else
    {
      self->_sandboxHandle = v5;
      MNGetMNNavigationServiceLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136380675;
        v13 = a3;
        v7 = "Sandbox extension (%{private}s) consumed.";
        v8 = v6;
        v9 = OS_LOG_TYPE_DEFAULT;
        v10 = 12;
LABEL_8:
        _os_log_impl(&dword_1B0AD7000, v8, v9, v7, (uint8_t *)&v12, v10);
      }
    }

  }
}

- (void)_releaseSandboxExtension
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_sandboxHandle)
  {
    v3 = sandbox_extension_release();
    MNGetMNNavigationServiceLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == -1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v10 = *__error();
        v11[0] = 67109120;
        v11[1] = v10;
        v6 = "Error releasing sandbox extension: %d";
        v7 = v5;
        v8 = OS_LOG_TYPE_ERROR;
        v9 = 8;
        goto LABEL_7;
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      v6 = "Sandbox extension released.";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 2;
LABEL_7:
      _os_log_impl(&dword_1B0AD7000, v7, v8, v6, (uint8_t *)v11, v9);
    }

    self->_sandboxHandle = 0;
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  MNNavigationServiceRemoteProxy *v8;
  _QWORD v9[5];
  id v10;
  MNNavigationServiceRemoteProxy *v11;

  v4 = a3;
  v5 = (const char *)objc_msgSend(v4, "selector");
  if (MNProtocolDeclaresSelector(&unk_1EEED23B0, v5))
  {
    objc_msgSend(v4, "methodSignature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DD8], "_navigation_methodSignatureForEmptyMethod");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      v8 = self;
      v11 = v8;
      objc_msgSend(v4, "setArgument:atIndex:", &v11, 2);
      objc_msgSend(v4, "retainArguments");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52__MNNavigationServiceRemoteProxy_forwardInvocation___block_invoke;
      v9[3] = &unk_1E61D1D10;
      v9[4] = v8;
      v10 = v4;
      MNRunAsynchronouslyOnMainThread(v9);

    }
  }
  else
  {
    -[MNNavigationServiceRemoteProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v5);
  }

}

void __52__MNNavigationServiceRemoteProxy_forwardInvocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));

  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 40);
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
    objc_msgSend(v3, "invokeWithTarget:", v4);

  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  if (!MNProtocolDeclaresSelector(&unk_1EEED23B0, a3))
    goto LABEL_9;
  -[MNNavigationServiceRemoteProxy delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

LABEL_9:
      v9.receiver = self;
      v9.super_class = (Class)MNNavigationServiceRemoteProxy;
      -[MNNavigationServiceRemoteProxy methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    objc_msgSend(v5, "methodSignatureForSelector:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "_navigation_methodSignatureForEmptyMethod");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  if (!v7)
    goto LABEL_9;
  return v7;
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *serialQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  uint8_t buf[16];

  v6 = a3;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Maps => navd setRoutesForPreview", buf, 2u);
  }

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MNNavigationServiceRemoteProxy_setRoutesForPreview_selectedRouteIndex___block_invoke;
  block[3] = &unk_1E61D2968;
  block[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  dispatch_async(serialQueue, block);

}

void __73__MNNavigationServiceRemoteProxy_setRoutesForPreview_selectedRouteIndex___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoutesForPreview:selectedRouteIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  MNStartNavigationDetails *v5;
  MNStartNavigationReconnectionDetails *reconnectionDetails;
  MNStartNavigationDetails *startNavigationDetails;
  MNStartNavigationDetails *v8;

  v5 = (MNStartNavigationDetails *)a3;
  geo_isolate_sync();
  reconnectionDetails = self->_reconnectionDetails;
  self->_reconnectionDetails = 0;

  startNavigationDetails = self->_startNavigationDetails;
  self->_startNavigationDetails = v5;
  v8 = v5;

  -[MNNavigationServiceRemoteProxy _startNavigationWithDetails:](self, "_startNavigationWithDetails:", v8);
}

uint64_t __73__MNNavigationServiceRemoteProxy_startNavigationWithDetails_activeBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  MNStartNavigationReconnectionDetails *reconnectionDetails;
  MNStartNavigationDetails *startNavigationDetails;
  NSObject *serialQueue;
  _QWORD v13[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (a3 - 1 > 9)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E61D76D8[a3 - 1];
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "%@ => navd stopNavigationWithReason: %@", buf, 0x16u);

  }
  reconnectionDetails = self->_reconnectionDetails;
  self->_reconnectionDetails = 0;

  startNavigationDetails = self->_startNavigationDetails;
  self->_startNavigationDetails = 0;

  serialQueue = self->_serialQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__MNNavigationServiceRemoteProxy_stopNavigationWithReason___block_invoke;
  v13[3] = &unk_1E61D23F0;
  v13[4] = self;
  v13[5] = a3;
  dispatch_async(serialQueue, v13);
}

void __59__MNNavigationServiceRemoteProxy_stopNavigationWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopNavigationWithReason:", *(_QWORD *)(a1 + 40));

}

- (void)rerouteWithWaypoints:(id)a3
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
  v7[2] = __55__MNNavigationServiceRemoteProxy_rerouteWithWaypoints___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __55__MNNavigationServiceRemoteProxy_rerouteWithWaypoints___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rerouteWithWaypoints:", *(_QWORD *)(a1 + 40));

}

- (void)insertWaypoint:(id)a3
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
  v7[2] = __49__MNNavigationServiceRemoteProxy_insertWaypoint___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __49__MNNavigationServiceRemoteProxy_insertWaypoint___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertWaypoint:", *(_QWORD *)(a1 + 40));

}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_removeWaypointAtIndex___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_removeWaypointAtIndex___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeWaypointAtIndex:", *(_QWORD *)(a1 + 40));

}

- (void)advanceToNextLeg
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MNNavigationServiceRemoteProxy_advanceToNextLeg__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __50__MNNavigationServiceRemoteProxy_advanceToNextLeg__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "advanceToNextLeg");

}

- (void)updateDestination:(id)a3
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
  v7[2] = __52__MNNavigationServiceRemoteProxy_updateDestination___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __52__MNNavigationServiceRemoteProxy_updateDestination___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDestination:", *(_QWORD *)(a1 + 40));

}

- (void)resumeOriginalDestination
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MNNavigationServiceRemoteProxy_resumeOriginalDestination__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __59__MNNavigationServiceRemoteProxy_resumeOriginalDestination__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resumeOriginalDestination");

}

- (void)forceReroute
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MNNavigationServiceRemoteProxy_forceReroute__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __46__MNNavigationServiceRemoteProxy_forceReroute__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "forceReroute");

}

- (void)switchToRoute:(id)a3
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
  v7[2] = __48__MNNavigationServiceRemoteProxy_switchToRoute___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __48__MNNavigationServiceRemoteProxy_switchToRoute___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switchToRoute:", *(_QWORD *)(a1 + 40));

}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MNNavigationServiceRemoteProxy_changeTransportType_route___block_invoke;
  block[3] = &unk_1E61D7668;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(serialQueue, block);

}

void __60__MNNavigationServiceRemoteProxy_changeTransportType_route___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeTransportType:route:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)switchToDestinationRoute
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MNNavigationServiceRemoteProxy_switchToDestinationRoute__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __58__MNNavigationServiceRemoteProxy_switchToDestinationRoute__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "switchToDestinationRoute");

}

- (void)setGuidanceType:(unint64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MNNavigationServiceRemoteProxy_setGuidanceType___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __50__MNNavigationServiceRemoteProxy_setGuidanceType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGuidanceType:", *(_QWORD *)(a1 + 40));

}

- (void)changeUserOptions:(id)a3
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
  v7[2] = __52__MNNavigationServiceRemoteProxy_changeUserOptions___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __52__MNNavigationServiceRemoteProxy_changeUserOptions___block_invoke(uint64_t a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeUserOptions:", *(_QWORD *)(a1 + 40));

}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__MNNavigationServiceRemoteProxy_setVoiceGuidanceLevelOverride___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __64__MNNavigationServiceRemoteProxy_setVoiceGuidanceLevelOverride___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVoiceGuidanceLevelOverride:", *(_QWORD *)(a1 + 40));

}

- (void)repeatCurrentGuidanceWithReply:(id)a3
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
  v7[2] = __65__MNNavigationServiceRemoteProxy_repeatCurrentGuidanceWithReply___block_invoke;
  v7[3] = &unk_1E61D1CE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __65__MNNavigationServiceRemoteProxy_repeatCurrentGuidanceWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__MNNavigationServiceRemoteProxy_repeatCurrentGuidanceWithReply___block_invoke_2;
  v3[3] = &unk_1E61D7690;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "repeatCurrentGuidanceWithReply:", v3);

}

uint64_t __65__MNNavigationServiceRemoteProxy_repeatCurrentGuidanceWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)repeatCurrentTrafficAlertWithReply:(id)a3
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
  v7[2] = __69__MNNavigationServiceRemoteProxy_repeatCurrentTrafficAlertWithReply___block_invoke;
  v7[3] = &unk_1E61D1CE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __69__MNNavigationServiceRemoteProxy_repeatCurrentTrafficAlertWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__MNNavigationServiceRemoteProxy_repeatCurrentTrafficAlertWithReply___block_invoke_2;
  v3[3] = &unk_1E61D7690;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "repeatCurrentTrafficAlertWithReply:", v3);

}

uint64_t __69__MNNavigationServiceRemoteProxy_repeatCurrentTrafficAlertWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MNNavigationServiceRemoteProxy_vibrateForPrompt_withReply___block_invoke;
  block[3] = &unk_1E61D7120;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(serialQueue, block);

}

void __61__MNNavigationServiceRemoteProxy_vibrateForPrompt_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__MNNavigationServiceRemoteProxy_vibrateForPrompt_withReply___block_invoke_2;
  v4[3] = &unk_1E61D7690;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "vibrateForPrompt:withReply:", v3, v4);

}

uint64_t __61__MNNavigationServiceRemoteProxy_vibrateForPrompt_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stopCurrentGuidancePrompt
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MNNavigationServiceRemoteProxy_stopCurrentGuidancePrompt__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __59__MNNavigationServiceRemoteProxy_stopCurrentGuidancePrompt__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopCurrentGuidancePrompt");

}

- (void)setHeadingOrientation:(int)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  int v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_setHeadingOrientation___block_invoke;
  v4[3] = &unk_1E61D2460;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_setHeadingOrientation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeadingOrientation:", *(unsigned int *)(a1 + 40));

}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__MNNavigationServiceRemoteProxy_setGuidancePromptsEnabled___block_invoke;
  v4[3] = &unk_1E61D2538;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __60__MNNavigationServiceRemoteProxy_setGuidancePromptsEnabled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGuidancePromptsEnabled:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__MNNavigationServiceRemoteProxy_setIsDisplayingNavigationTray___block_invoke;
  v4[3] = &unk_1E61D2538;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __64__MNNavigationServiceRemoteProxy_setIsDisplayingNavigationTray___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsDisplayingNavigationTray:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__MNNavigationServiceRemoteProxy_setIsConnectedToCarplay___block_invoke;
  v4[3] = &unk_1E61D2538;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __58__MNNavigationServiceRemoteProxy_setIsConnectedToCarplay___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsConnectedToCarplay:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_setDisplayedStepIndex___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_setDisplayedStepIndex___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayedStepIndex:", *(_QWORD *)(a1 + 40));

}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  NSObject *serialQueue;
  _QWORD block[7];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MNNavigationServiceRemoteProxy_setRideIndex_forSegmentIndex___block_invoke;
  block[3] = &unk_1E61D1D60;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(serialQueue, block);
}

void __63__MNNavigationServiceRemoteProxy_setRideIndex_forSegmentIndex___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRideIndex:forSegmentIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  NSObject *serialQueue;
  _QWORD block[7];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MNNavigationServiceRemoteProxy_setJunctionViewImageWidth_height___block_invoke;
  block[3] = &unk_1E61D1D60;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(serialQueue, block);
}

void __67__MNNavigationServiceRemoteProxy_setJunctionViewImageWidth_height___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setJunctionViewImageWidth:height:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)disableNavigationCapability:(unint64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__MNNavigationServiceRemoteProxy_disableNavigationCapability___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __62__MNNavigationServiceRemoteProxy_disableNavigationCapability___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableNavigationCapability:", *(_QWORD *)(a1 + 40));

}

- (void)enableNavigationCapability:(unint64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__MNNavigationServiceRemoteProxy_enableNavigationCapability___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __61__MNNavigationServiceRemoteProxy_enableNavigationCapability___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableNavigationCapability:", *(_QWORD *)(a1 + 40));

}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  unsigned __int8 v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__MNNavigationServiceRemoteProxy_changeOfflineMode___block_invoke;
  v4[3] = &unk_1E61D2538;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __52__MNNavigationServiceRemoteProxy_changeOfflineMode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeOfflineMode:", *(unsigned __int8 *)(a1 + 40));

}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MNNavigationServiceRemoteProxy_acceptReroute_forTrafficIncidentAlert___block_invoke;
  block[3] = &unk_1E61D1C08;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(serialQueue, block);

}

void __72__MNNavigationServiceRemoteProxy_acceptReroute_forTrafficIncidentAlert___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptReroute:forTrafficIncidentAlert:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setTraceIsPlaying:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__MNNavigationServiceRemoteProxy_setTraceIsPlaying___block_invoke;
  v4[3] = &unk_1E61D2538;
  v4[4] = self;
  v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __52__MNNavigationServiceRemoteProxy_setTraceIsPlaying___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTraceIsPlaying:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setTracePlaybackSpeed:(double)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_setTracePlaybackSpeed___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_setTracePlaybackSpeed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTracePlaybackSpeed:", *(double *)(a1 + 40));

}

- (void)setTracePosition:(double)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__MNNavigationServiceRemoteProxy_setTracePosition___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __51__MNNavigationServiceRemoteProxy_setTracePosition___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTracePosition:", *(double *)(a1 + 40));

}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
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
  v7[2] = __88__MNNavigationServiceRemoteProxy_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __88__MNNavigationServiceRemoteProxy_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordTraceBookmarkAtCurrentPositionWthScreenshotData:", *(_QWORD *)(a1 + 40));

}

- (void)recordPedestrianTracePath:(id)a3
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
  v7[2] = __60__MNNavigationServiceRemoteProxy_recordPedestrianTracePath___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __60__MNNavigationServiceRemoteProxy_recordPedestrianTracePath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordPedestrianTracePath:", *(_QWORD *)(a1 + 40));

}

- (void)setSimulationSpeedOverride:(double)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__MNNavigationServiceRemoteProxy_setSimulationSpeedOverride___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __61__MNNavigationServiceRemoteProxy_setSimulationSpeedOverride___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSimulationSpeedOverride:", *(double *)(a1 + 40));

}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__MNNavigationServiceRemoteProxy_setSimulationSpeedMultiplier___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __63__MNNavigationServiceRemoteProxy_setSimulationSpeedMultiplier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSimulationSpeedMultiplier:", *(double *)(a1 + 40));

}

- (void)setSimulationPosition:(double)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_setSimulationPosition___block_invoke;
  v4[3] = &unk_1E61D23F0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_setSimulationPosition___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSimulationPosition:", *(double *)(a1 + 40));

}

- (void)interfaceHashesWithHandler:(id)a3
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
  v7[2] = __61__MNNavigationServiceRemoteProxy_interfaceHashesWithHandler___block_invoke;
  v7[3] = &unk_1E61D1CE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __61__MNNavigationServiceRemoteProxy_interfaceHashesWithHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interfaceHashesWithHandler:", *(_QWORD *)(a1 + 40));

}

- (void)checkinForNavigationService:(id)a3
{
  NSObject *serialQueue;
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_sandboxHandle <= 0)
  {
    objc_initWeak(&location, self);
    serialQueue = self->_serialQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__MNNavigationServiceRemoteProxy_checkinForNavigationService___block_invoke;
    v5[3] = &unk_1E61D2F90;
    objc_copyWeak(&v6, &location);
    dispatch_async(serialQueue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __62__MNNavigationServiceRemoteProxy_checkinForNavigationService___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__MNNavigationServiceRemoteProxy_checkinForNavigationService___block_invoke_2;
  v4[3] = &unk_1E61D76B8;
  objc_copyWeak(&v5, v1);
  objc_msgSend(v3, "checkinForNavigationService:", v4);

  objc_destroyWeak(&v5);
}

void __62__MNNavigationServiceRemoteProxy_checkinForNavigationService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_consumeSandboxExtension:", a2);

}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
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
  v7[2] = __68__MNNavigationServiceRemoteProxy_pauseRealtimeUpdatesForSubscriber___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __68__MNNavigationServiceRemoteProxy_pauseRealtimeUpdatesForSubscriber___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseRealtimeUpdatesForSubscriber:", *(_QWORD *)(a1 + 40));

}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
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
  v7[2] = __69__MNNavigationServiceRemoteProxy_resumeRealtimeUpdatesForSubscriber___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __69__MNNavigationServiceRemoteProxy_resumeRealtimeUpdatesForSubscriber___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeRealtimeUpdatesForSubscriber:", *(_QWORD *)(a1 + 40));

}

- (void)navigationServiceProxy:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[7];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationXPCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "navd => %@ willChangeFromState: '%@' toState: '%@'", buf, 0x20u);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__MNNavigationServiceRemoteProxy_navigationServiceProxy_willChangeFromState_toState___block_invoke;
  v13[3] = &unk_1E61D1D60;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a5;
  MNRunAsynchronouslyOnMainThread(v13);
}

void __85__MNNavigationServiceRemoteProxy_navigationServiceProxy_willChangeFromState_toState___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  if ((objc_msgSend(*(id *)(a1[4] + 72), "isReconnecting") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 96));
    objc_msgSend(WeakRetained, "navigationServiceProxy:willChangeFromState:toState:", a1[4], a1[5], a1[6]);

  }
}

- (void)navigationServiceProxy:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[7];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationXPCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "navd => %@ didChangeFromState: '%@' toState: '%@'", buf, 0x20u);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didChangeFromState_toState___block_invoke;
  v13[3] = &unk_1E61D1D60;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a5;
  MNRunAsynchronouslyOnMainThread(v13);
}

void __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didChangeFromState_toState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  uint8_t buf[16];

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isReconnecting") & 1) != 0)
  {
    MNGetMNNavigationXPCLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "Reconnected to navd", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "spokenAnnouncements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MNNavigationService sharedService](MNNavigationService, "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "details");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpokenAnnouncements:", v3);

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = 0;

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
    objc_msgSend(WeakRetained, "navigationServiceProxy:didChangeFromState:toState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    if (!*(_QWORD *)(a1 + 48))
      geo_isolate_sync();
    objc_msgSend(*(id *)(a1 + 32), "_updateConnection");
  }
}

void __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didChangeFromState_toState___block_invoke_292(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ssZ"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 != v10)
            objc_msgSend(v3, "appendString:", CFSTR(", "));
          objc_msgSend(v2, "stringFromDate:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v6);
    }

    MNGetMNNavigationXPCLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
      *(_DWORD *)buf = 67109378;
      v19 = v13;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "navd state changed to stopped and %d interruptions were detected at: %@", buf, 0x12u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  }
}

- (void)navigationServiceProxy:(id)a3 didUpdateNavigationDetails:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didUpdateNavigationDetails___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);

}

void __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didUpdateNavigationDetails___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isReconnecting") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
    objc_msgSend(WeakRetained, "navigationServiceProxy:didUpdateNavigationDetails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)navigationServiceProxy:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__MNNavigationServiceRemoteProxy_navigationServiceProxy_didSendNavigationServiceCallback___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);

}

void __90__MNNavigationServiceRemoteProxy_navigationServiceProxy_didSendNavigationServiceCallback___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "navigationServiceProxy:didSendNavigationServiceCallback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (MNNavigationServiceClientInterface)delegate
{
  return (MNNavigationServiceClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_reconnectionDetails, 0);
  objc_storeStrong((id *)&self->_interruptionDates, 0);
  objc_storeStrong((id *)&self->_interruptionDatesLock, 0);
  objc_storeStrong((id *)&self->_startNavigationDetails, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clientsLock, 0);
  objc_storeStrong((id *)&self->_userOptions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
