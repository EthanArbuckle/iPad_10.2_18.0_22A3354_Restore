@implementation ANAnnounceReachabilityServiceListener

- (ANAnnounceReachabilityServiceListener)init
{
  ANAnnounceReachabilityServiceListener *v2;
  uint64_t v3;
  NSMutableSet *connections;
  id v5;
  uint64_t v6;
  NSXPCListener *listener;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)ANAnnounceReachabilityServiceListener;
  v2 = -[ANAnnounceReachabilityServiceListener init](&v10, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x1E0CF7DE8], "isAnnounceEnabled"))
    {
      v3 = objc_opt_new();
      connections = v2->_connections;
      v2->_connections = (NSMutableSet *)v3;

    }
    v5 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v6 = objc_msgSend(v5, "initWithMachServiceName:", *MEMORY[0x1E0CF7D00]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    ANLogHandleAnnounceReachabilityServiceListener();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@Announce Reachability Service Listener Up!", buf, 0xCu);
    }

  }
  return v2;
}

- (void)cleanForExit
{
  id v2;

  -[ANAnnounceReachabilityServiceListener listener](self, "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id from;
  id location;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ANLogHandleAnnounceReachabilityServiceListener();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = &stru_1E93913D0;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@New Connection Request From (PID = %@) For Service: (%@)", buf, 0x20u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CF7DE8], "isAnnounceEnabled") & 1) == 0)
  {
    ANLogHandleAnnounceReachabilityServiceListener();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = &stru_1E93913D0;
      v16 = "%@Rejecting connection. Announce not enabled.";
      v17 = v11;
      v18 = 12;
LABEL_12:
      _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v7, "hasAnnounceEntitlement") & 1) == 0)
  {
    ANLogHandleAnnounceReachabilityServiceListener();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)*MEMORY[0x1E0CF7EC0];
      *(_DWORD *)buf = 138412546;
      v33 = &stru_1E93913D0;
      v34 = 2112;
      v35 = v19;
      v16 = "%@Missing Announce Entitlement: %@";
      v17 = v11;
      v18 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC807C0);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v11);
  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC98F40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v12);

  -[ANAnnounceReachabilityServiceListener _addConnection:](self, "_addConnection:", v7);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__ANAnnounceReachabilityServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v27[3] = &unk_1E938F5F0;
  objc_copyWeak(&v28, &from);
  objc_copyWeak(&v29, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v27);
  v21 = v13;
  v22 = 3221225472;
  v23 = __76__ANAnnounceReachabilityServiceListener_listener_shouldAcceptNewConnection___block_invoke_71;
  v24 = &unk_1E938F5F0;
  objc_copyWeak(&v25, &from);
  objc_copyWeak(&v26, &location);
  objc_msgSend(v7, "setInvalidationHandler:", &v21);
  objc_msgSend(v7, "resume", v21, v22, v23, v24);
  ANLogHandleAnnounceReachabilityServiceListener();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = &stru_1E93913D0;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "%@Connection Accepted: (%@)", buf, 0x16u);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  v15 = 1;
LABEL_14:

  return v15;
}

void __76__ANAnnounceReachabilityServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  id v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ANLogHandleAnnounceReachabilityServiceListener();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 138412546;
    v7 = &stru_1E93913D0;
    v8 = 2112;
    v9 = WeakRetained;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Interrupted: (%@)", (uint8_t *)&v6, 0x16u);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_removeConnection:", v5);

}

void __76__ANAnnounceReachabilityServiceListener_listener_shouldAcceptNewConnection___block_invoke_71(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  id v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ANLogHandleAnnounceReachabilityServiceListener();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 138412546;
    v7 = &stru_1E93913D0;
    v8 = 2112;
    v9 = WeakRetained;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Invalidated: (%@)", (uint8_t *)&v6, 0x16u);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_removeConnection:", v5);

}

- (void)resumeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ANAnnounceReachabilityServiceListener_resumeWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E938FA48;
  v7 = v4;
  v11 = v7;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v10 = v8;
  objc_msgSend(v6, "startWithCompletionHandler:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __69__ANAnnounceReachabilityServiceListener_resumeWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_sendCurrentReachabilityToConnection:", *(_QWORD *)(a1 + 32));

}

- (void)announceReachabilityForHomeName:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, uint64_t);

  v10 = (void (**)(id, uint64_t))a4;
  v6 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeWithName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, objc_msgSend(v9, "reachabilityForHome:", v8));

  }
  else
  {
    v10[2](v10, 0);
  }

}

- (void)announceReachabilityForRoomName:(id)a3 inHomeName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void (**v15)(id, _QWORD);

  v15 = (void (**)(id, _QWORD))a5;
  v8 = a4;
  v9 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeWithName:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "hmu_roomWithName:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v15[2](v15, 0);
  }
  else
  {
    -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, objc_msgSend(v14, "reachabilityForRoom:inHome:", v12, v11));

  }
}

- (void)announceReachabilityForHomeUUID:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, uint64_t);

  v10 = (void (**)(id, uint64_t))a4;
  v6 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeForID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, objc_msgSend(v9, "reachabilityForHome:", v8));

  }
  else
  {
    v10[2](v10, 0);
  }

}

- (void)announceReachabilityForRoomUUID:(id)a3 inHomeUUID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void (**v15)(id, _QWORD);

  v15 = (void (**)(id, _QWORD))a5;
  v8 = a4;
  v9 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeForID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "hmu_roomWithUniqueIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v15[2](v15, 0);
  }
  else
  {
    -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, objc_msgSend(v14, "reachabilityForRoom:inHome:", v12, v11));

  }
}

- (void)_addConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ANAnnounceReachabilityServiceListener connections](self, "connections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[ANAnnounceReachabilityServiceListener connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    -[ANAnnounceReachabilityServiceListener setReachabilityManager:](self, "setReachabilityManager:", v7);

    -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

  }
  objc_sync_exit(v4);

}

- (void)_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnounceReachabilityServiceListener connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[ANAnnounceReachabilityServiceListener connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  ANLogHandleAnnounceReachabilityServiceListener();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = &stru_1E93913D0;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Removed Connection: (%@)", (uint8_t *)&v13, 0x16u);
  }

  -[ANAnnounceReachabilityServiceListener connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") == 0;

  if (v9)
  {
    ANLogHandleAnnounceReachabilityServiceListener();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@All Reachability Connections Removed. Stopping Reachability Manager.", (uint8_t *)&v13, 0xCu);
    }

    -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stop");

    -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", 0);

    -[ANAnnounceReachabilityServiceListener setReachabilityManager:](self, "setReachabilityManager:", 0);
  }
  objc_sync_exit(v5);

}

- (void)_sendCurrentReachabilityToConnection:(id)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  ANAnnounceReachabilityServiceListener *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  id obj;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "monitoredHomes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
  if (v42)
  {
    v40 = *(_QWORD *)v52;
    *(_QWORD *)&v6 = 138413058;
    v38 = v6;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v52 != v40)
          objc_enumerationMutation(obj);
        v43 = v7;
        v8 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v7);
        -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager", v38);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "reachabilityForHome:", v8);

        ANLogHandleAnnounceReachabilityServiceListener();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v38;
          v56 = &stru_1E93913D0;
          v57 = 2112;
          v58 = v12;
          v59 = 2112;
          v60 = v13;
          v61 = 2112;
          v62 = v46;
          _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@Sending Current Home Reachability: Home = %@, Reachability = %@, Connection = %@", buf, 0x2Au);

        }
        objc_msgSend(v46, "remoteObjectProxy");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "reachabilityLevel:didChangeForHomeName:", v10, v15);

        objc_msgSend(v46, "remoteObjectProxy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reachabilityLevel:didChangeForHomeUUID:", v10, v17);

        -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "monitoredRoomsForHome:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "append:", objc_msgSend(v19, "count"));
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v44 = v19;
        v20 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
        if (v20)
        {
          v21 = v20;
          v45 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v48 != v45)
                objc_enumerationMutation(v44);
              v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              -[ANAnnounceReachabilityServiceListener reachabilityManager](self, "reachabilityManager");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "reachabilityForRoom:inHome:", v23, v8);

              ANLogHandleAnnounceReachabilityServiceListener();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v8, "name");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "name");
                v28 = self;
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", v25);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413314;
                v56 = &stru_1E93913D0;
                v57 = 2112;
                v58 = v27;
                v59 = 2112;
                v60 = v29;
                v61 = 2112;
                v62 = v30;
                v63 = 2112;
                v64 = v46;
                _os_log_impl(&dword_1D23A0000, v26, OS_LOG_TYPE_DEFAULT, "%@Sending Current Room Reachability: Home = %@, Room = %@, Reachability = %@, Connection = %@", buf, 0x34u);

                self = v28;
              }

              objc_msgSend(v46, "remoteObjectProxy");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "name");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "name");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "reachabilityLevel:didChangeForRoomName:inHomeName:", v25, v32, v33);

              objc_msgSend(v46, "remoteObjectProxy");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "uniqueIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "uniqueIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "reachabilityLevel:didChangeForRoomUUID:inHomeUUID:", v25, v35, v36);

            }
            v21 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
          }
          while (v21);
        }

        v7 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
    }
    while (v42);
  }

  +[ANAnalytics shared](ANAnalytics, "shared");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "recordReachableHomes:", v41);

}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHome:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ANLogHandleAnnounceReachabilityServiceListener();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = &stru_1E93913D0;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Reachability Changed For [Home = %@]: %@", buf, 0x20u);

  }
  -[ANAnnounceReachabilityServiceListener connections](self, "connections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ANAnnounceReachabilityServiceListener connections](self, "connections", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "remoteObjectProxy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reachabilityLevel:didChangeForHomeName:", a3, v17);

        objc_msgSend(v15, "remoteObjectProxy");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "reachabilityLevel:didChangeForHomeUUID:", a3, v19);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  objc_sync_exit(v10);
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoom:(id)a4 inHome:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  ANLogHandleAnnounceReachabilityServiceListener();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v33 = &stru_1E93913D0;
    v34 = 2112;
    v35 = v11;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@Reachability Changed For [Home = %@, Room = %@]: %@", buf, 0x2Au);

  }
  -[ANAnnounceReachabilityServiceListener connections](self, "connections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ANAnnounceReachabilityServiceListener connections](self, "connections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v28;
    v26 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v26);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v18, "remoteObjectProxy", obj);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reachabilityLevel:didChangeForRoomName:inHomeName:", a3, v20, v21);

        objc_msgSend(v18, "remoteObjectProxy");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "reachabilityLevel:didChangeForRoomUUID:inHomeUUID:", a3, v23, v24);

      }
      v14 = v26;
      v15 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  objc_sync_exit(obj);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (ANAnnounceReachabilityManager)reachabilityManager
{
  return self->_reachabilityManager;
}

- (void)setReachabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityManager, a3);
}

- (NSMutableSet)connections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
