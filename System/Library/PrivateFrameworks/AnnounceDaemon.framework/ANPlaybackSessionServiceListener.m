@implementation ANPlaybackSessionServiceListener

- (ANPlaybackSessionServiceListener)init
{
  ANPlaybackSessionServiceListener *v2;
  uint64_t v3;
  NSMutableSet *remotePlaybackClients;
  uint64_t v5;
  NSMutableSet *localPlaybackClients;
  dispatch_queue_t v7;
  OS_dispatch_queue *playbackClientsSerialQueue;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSXPCListener *localPlaybackSessionListener;
  id v14;
  uint64_t v15;
  NSXPCListener *remotePlaybackSessionListener;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)ANPlaybackSessionServiceListener;
  v2 = -[ANPlaybackSessionServiceListener init](&v19, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x1E0CF7DE8], "isAnnounceEnabled"))
    {
      v3 = objc_opt_new();
      remotePlaybackClients = v2->_remotePlaybackClients;
      v2->_remotePlaybackClients = (NSMutableSet *)v3;

      v5 = objc_opt_new();
      localPlaybackClients = v2->_localPlaybackClients;
      v2->_localPlaybackClients = (NSMutableSet *)v5;

      v7 = dispatch_queue_create("com.apple.Announce.playbackClientsSerialQueue", 0);
      playbackClientsSerialQueue = v2->_playbackClientsSerialQueue;
      v2->_playbackClientsSerialQueue = (OS_dispatch_queue *)v7;

      +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addDelegate:queue:", v2, 0);

      +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRemotePlaybackStatusProvider:", v2);

    }
    v11 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v12 = objc_msgSend(v11, "initWithMachServiceName:", *MEMORY[0x1E0CF7D08]);
    localPlaybackSessionListener = v2->_localPlaybackSessionListener;
    v2->_localPlaybackSessionListener = (NSXPCListener *)v12;

    -[NSXPCListener setDelegate:](v2->_localPlaybackSessionListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_localPlaybackSessionListener, "resume");
    v14 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v15 = objc_msgSend(v14, "initWithMachServiceName:", *MEMORY[0x1E0CF7D10]);
    remotePlaybackSessionListener = v2->_remotePlaybackSessionListener;
    v2->_remotePlaybackSessionListener = (NSXPCListener *)v15;

    -[NSXPCListener setDelegate:](v2->_remotePlaybackSessionListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_remotePlaybackSessionListener, "resume");
    ANLogHandlePlaybackSessionServiceListener();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_DEFAULT, "%@Playback Session Service Listeners Up!", buf, 0xCu);
    }

  }
  return v2;
}

- (void)cleanForExit
{
  void *v3;
  id v4;

  -[ANPlaybackSessionServiceListener localPlaybackSessionListener](self, "localPlaybackSessionListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ANPlaybackSessionServiceListener remotePlaybackSessionListener](self, "remotePlaybackSessionListener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id from;
  id location;
  _QWORD v42[5];
  id v43;
  _QWORD block[5];
  id v45;
  uint8_t buf[4];
  const __CFString *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ANLogHandlePlaybackSessionServiceListener();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = &stru_1E93913D0;
    v48 = 2112;
    v49 = v9;
    v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@New Playback Session Connection Request From (PID = %@) For Service: (%@)", buf, 0x20u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CF7DE8], "isAnnounceEnabled") & 1) == 0)
  {
    ANLogHandlePlaybackSessionServiceListener();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = &stru_1E93913D0;
      v16 = "%@Rejecting connection. Announce not enabled.";
      v17 = v13;
      v18 = 12;
LABEL_11:
      _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    }
LABEL_12:
    v20 = 0;
    goto LABEL_21;
  }
  if ((objc_msgSend(v7, "hasAnnounceEntitlement") & 1) == 0)
  {
    ANLogHandlePlaybackSessionServiceListener();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)*MEMORY[0x1E0CF7EC0];
      *(_DWORD *)buf = 138412546;
      v47 = &stru_1E93913D0;
      v48 = 2112;
      v49 = v19;
      v16 = "%@Missing Announce Entitlement: %@";
      v17 = v13;
      v18 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  +[ANPlaybackSessionClient clientWithXPCConnection:](ANPlaybackSessionClient, "clientWithXPCConnection:", v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CF7D10]);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "an_remotePlaybackSessionServiceInterface");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "an_remotePlaybackSessionServiceDelegateInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_1E938F2F0;
    block[4] = self;
    v45 = v33;
    dispatch_sync(v15, block);

  }
  else
  {
    objc_msgSend(v6, "serviceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CF7D08]);

    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3B50], "an_localPlaybackSessionServiceInterface");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B50], "an_localPlaybackSessionServiceDelegateInterface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ANLogHandlePlaybackSessionServiceListener();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v47 = &stru_1E93913D0;
        v48 = 2112;
        v49 = v7;
        _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_DEFAULT, "%@adding connection: (%@)", buf, 0x16u);
      }

      -[NSObject setClass:forSelector:argumentIndex:ofReply:](v13, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendPlaybackCommand_forEndpointID_completionHandler_, 0, 0);
      v24 = (void *)MEMORY[0x1E0C99E60];
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      v27 = objc_opt_class();
      v28 = objc_opt_class();
      objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, objc_opt_class(), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v13, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_lastPlayedAnnouncementInfoForEndpointID_completionHandler_, 0, 1);
      -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
      v30 = objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_19;
      v42[3] = &unk_1E938F2F0;
      v42[4] = self;
      v43 = v33;
      dispatch_sync(v30, v42);

    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
  }
  objc_msgSend(v14, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didReceiveAnnouncement_forGroupID_, 0, 0);
  objc_msgSend(v7, "setExportedInterface:", v13);
  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(v7, "setRemoteObjectInterface:", v14);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v37[3] = &unk_1E938F5F0;
  objc_copyWeak(&v38, &from);
  objc_copyWeak(&v39, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v37);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_23;
  v34[3] = &unk_1E938F5F0;
  objc_copyWeak(&v35, &from);
  objc_copyWeak(&v36, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v34);
  objc_msgSend(v7, "resume");
  ANLogHandlePlaybackSessionServiceListener();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v47 = &stru_1E93913D0;
    v48 = 2112;
    v49 = v7;
    _os_log_impl(&dword_1D23A0000, v31, OS_LOG_TYPE_DEFAULT, "%@Connection Accepted: (%@)", buf, 0x16u);
  }

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  v20 = 1;
LABEL_21:

  return v20;
}

void __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_19(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
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
  ANLogHandlePlaybackSessionServiceListener();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 138412546;
    v7 = &stru_1E93913D0;
    v8 = 2112;
    v9 = WeakRetained;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_ERROR, "%@Connection Interrupted: (%@)", (uint8_t *)&v6, 0x16u);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_removeConnection:", v5);

}

void __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_23(uint64_t a1)
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
  ANLogHandlePlaybackSessionServiceListener();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 138412546;
    v7 = &stru_1E93913D0;
    v8 = 2112;
    v9 = WeakRetained;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_ERROR, "%@Connection Invalidated: (%@)", (uint8_t *)&v6, 0x16u);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_removeConnection:", v5);

}

- (BOOL)remoteSessionsActive
{
  ANPlaybackSessionServiceListener *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ANPlaybackSessionServiceListener_remoteSessionsActive__block_invoke;
  v5[3] = &unk_1E938F618;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __56__ANPlaybackSessionServiceListener_remoteSessionsActive__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "groupID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ANPlaybackSessionServiceListener _endSessionForConnection:](self, "_endSessionForConnection:", v4);
  -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ANPlaybackSessionServiceListener__removeConnection___block_invoke;
  block[3] = &unk_1E938F2F0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __54__ANPlaybackSessionServiceListener__removeConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v35;
    *(_QWORD *)&v5 = 138412546;
    v28 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v9, "connection", v28);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v9);

          ANLogHandlePlaybackSessionServiceListener();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v28;
            v40 = &stru_1E93913D0;
            v41 = 2112;
            v42 = v14;
            _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Removed Playback Info for Connection: (%@)", buf, 0x16u);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v6);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v31;
    *(_QWORD *)&v18 = 138412546;
    v29 = v18;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        v23 = *(void **)(a1 + 40);
        objc_msgSend(v22, "connection", v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 == v24)
        {
          objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeObject:", v22);

          ANLogHandlePlaybackSessionServiceListener();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v29;
            v40 = &stru_1E93913D0;
            v41 = 2112;
            v42 = v27;
            _os_log_impl(&dword_1D23A0000, v26, OS_LOG_TYPE_DEFAULT, "%@Removed Other Playback for Connection: (%@)", buf, 0x16u);
          }

        }
      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }

}

- (id)_clientForConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ANPlaybackSessionServiceListener__clientForConnection___block_invoke;
  block[3] = &unk_1E938F640;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__ANPlaybackSessionServiceListener__clientForConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "connection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == v9)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
          v16 = *(void **)(a1 + 40);
          objc_msgSend(v15, "connection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 == v17)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v15);
            goto LABEL_22;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_22:

  }
}

- (BOOL)_endSessionForConnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANPlaybackSessionServiceListener _clientForConnection:](self, "_clientForConnection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    ANLogHandlePlaybackSessionServiceListener();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = &stru_1E93913D0;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@Ended Session For Connection: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(v5, "setGroupID:", 0);
  }
  +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackSessionServiceListener _setTimersActive:forEndPointID:](self, "_setTimersActive:forEndPointID:", 1, v7);

  return v5 != 0;
}

- (void)_setTimersActive:(BOOL)a3 forEndPointID:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  _WORD v17[9];

  v4 = a3;
  *(_QWORD *)&v17[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ANLogHandlePlaybackSessionServiceListener();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("IN");
    if (v4)
      v8 = &stru_1E93913D0;
    v14 = 138412546;
    v15 = &stru_1E93913D0;
    v16 = 2112;
    *(_QWORD *)v17 = v8;
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Request to set timers %@ACTIVE", (uint8_t *)&v14, 0x16u);
  }

  if (v4)
  {
    if (objc_msgSend(v6, "an_isLocalDevice"))
      v9 = -[ANPlaybackSessionServiceListener remoteSessionsActive](self, "remoteSessionsActive");
    else
      v9 = 0;
    +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "playbackStateForEndpointID:", v6);

    ANLogHandlePlaybackSessionServiceListener();
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9 || v12 == 1)
    {
      if (v13)
      {
        v14 = 138412802;
        v15 = &stru_1E93913D0;
        v16 = 1024;
        *(_DWORD *)v17 = v9;
        v17[2] = 1024;
        *(_DWORD *)&v17[3] = v12 == 1;
        _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@Unable to activate timers. Remote Session Active = %d, Local Session Active = %d", (uint8_t *)&v14, 0x18u);
      }
    }
    else
    {
      if (v13)
      {
        v14 = 138412290;
        v15 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@No Active Sessions. Resuming All Timers.", (uint8_t *)&v14, 0xCu);
      }

      +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject resumeAllTimersForEndpointID:](v10, "resumeAllTimersForEndpointID:", v6);
    }
  }
  else
  {
    +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject pauseAllTimersForEndpointID:](v10, "pauseAllTimersForEndpointID:", v6);
  }

}

- (void)startSessionForGroupID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackSessionServiceListener _setTimersActive:forEndPointID:](self, "_setTimersActive:forEndPointID:", 0, v8);

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackSessionServiceListener _clientForConnection:](self, "_clientForConnection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "setGroupID:", v6);
    +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "announcementsForGroupID:endpointID:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF7DF8], "contextsFrom:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didUpdateAnnouncements:forGroupID:", v14, v6);

    ANLogHandlePlaybackSessionServiceListener();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = &stru_1E93913D0;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_DEFAULT, "%@Started remote playback session. GroupID = %@, connection = %@)", (uint8_t *)&v21, 0x20u);

    }
    v7[2](v7, 1);

  }
  else
  {
    ANLogHandlePlaybackSessionServiceListener();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = &stru_1E93913D0;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "%@Failed to start remote playback session. Connection = %@", (uint8_t *)&v21, 0x16u);

    }
    v7[2](v7, 0);

    +[ANAnalytics shared](ANAnalytics, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "error:", 5001);
  }

}

- (void)endSessionWithReply:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void (**v7)(id, _BOOL8);

  v4 = (void *)MEMORY[0x1E0CB3B38];
  v7 = (void (**)(id, _BOOL8))a3;
  objc_msgSend(v4, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ANPlaybackSessionServiceListener _endSessionForConnection:](self, "_endSessionForConnection:", v5);

  v7[2](v7, v6);
}

- (void)setPlaybackStartedForAnnouncement:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  ANLogHandlePlaybackSessionServiceListener();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@Set Remote Playback Started", (uint8_t *)&v7, 0xCu);
  }

  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaybackStartedForAnnouncement:endpointID:", v3, v6);

}

- (void)setPlaybackStoppedForAnnouncement:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  ANLogHandlePlaybackSessionServiceListener();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@Set Remote Playback Stopped", (uint8_t *)&v7, 0xCu);
  }

  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaybackStoppedForAnnouncement:endpointID:", v3, v6);

}

- (void)sendPlaybackCommand:(id)a3 forEndpointID:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  ANLogHandlePlaybackSessionServiceListener();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412802;
    v19 = &stru_1E93913D0;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@Received Playback Command. Endpoint ID = %@, Command = %@", (uint8_t *)&v18, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setClientIdentifier:", v12);
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performPlaybackCommand:endpointID:completionHandler:", v7, v8, v9);

  +[ANAnalytics shared](ANAnalytics, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "operation");
  v16 = objc_msgSend(MEMORY[0x1E0CF7DF8], "sourceFromString:", v12);
  +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playbackAction:fromSource:context:", v15, v16, v17);

}

- (void)resumeWithEndpointID:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB3B38];
  v7 = (void (**)(_QWORD))a4;
  v8 = a3;
  objc_msgSend(v6, "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackSessionServiceListener _clientForConnection:](self, "_clientForConnection:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEndpointID:", v8);
  v7[2](v7);

}

- (void)lastPlayedAnnouncementInfoForEndpointID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPlayedAnnouncementInfoForEndpointID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *))a4 + 2))(v6, v8);
}

- (void)playbackStateForEndpointID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "playbackStateForEndpointID:", v7);

  (*((void (**)(id, uint64_t))a4 + 2))(v6, v8);
}

- (BOOL)isExternalPlaybackActiveForEndpointID:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "an_isLocalDevice");
  if (v4)
    LOBYTE(v4) = -[ANPlaybackSessionServiceListener remoteSessionsActive](self, "remoteSessionsActive");
  return v4;
}

- (void)coordinator:(id)a3 didUpdateAnnouncements:(id)a4 forGroupID:(id)a5 forEndpointID:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  char v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  ANLogHandlePlaybackSessionServiceListener();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = &stru_1E93913D0;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1D23A0000, v12, OS_LOG_TYPE_DEFAULT, "%@Did Update Announcements for Group ID: %@", buf, 0x16u);
  }

  v13 = objc_msgSend(v11, "an_isLocalDevice");
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CF7DF8], "contextsFrom:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__ANPlaybackSessionServiceListener_coordinator_didUpdateAnnouncements_forGroupID_forEndpointID___block_invoke;
    block[3] = &unk_1E938F668;
    block[4] = self;
    v18 = v10;
    v19 = v14;
    v16 = v14;
    dispatch_async(v15, block);

  }
  else
  {
    ANLogHandlePlaybackSessionServiceListener();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "%@Skipping updates not for local device", buf, 0xCu);
    }
  }

}

void __96__ANPlaybackSessionServiceListener_coordinator_didUpdateAnnouncements_forGroupID_forEndpointID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138412546;
    v14 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "groupID", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v10)
        {
          ANLogHandlePlaybackSessionServiceListener();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = &stru_1E93913D0;
            v21 = 2112;
            v22 = v8;
            _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@Notifying Connection Announcements Changed: %@", buf, 0x16u);
          }

          objc_msgSend(v8, "connection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "remoteObjectProxy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "didUpdateAnnouncements:forGroupID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);
  }

}

- (void)coordinator:(id)a3 didReceiveAnnouncement:(id)a4 forGroupID:(id)a5 forEndpointID:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  ANLogHandlePlaybackSessionServiceListener();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = &stru_1E93913D0;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1D23A0000, v12, OS_LOG_TYPE_DEFAULT, "%@Did Receive Announcement ID: %@, for Group ID: %@", buf, 0x20u);

  }
  v14 = (void *)MEMORY[0x1E0CF7E08];
  objc_msgSend(v9, "remoteSessionDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contextFromDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v11, "an_isLocalDevice");
  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __96__ANPlaybackSessionServiceListener_coordinator_didReceiveAnnouncement_forGroupID_forEndpointID___block_invoke;
    block[3] = &unk_1E938F668;
    block[4] = self;
    v29 = v10;
    v30 = v16;
    dispatch_async(v19, block);

  }
  -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __96__ANPlaybackSessionServiceListener_coordinator_didReceiveAnnouncement_forGroupID_forEndpointID___block_invoke_30;
  v24[3] = &unk_1E938F690;
  v24[4] = self;
  v25 = v11;
  v26 = v16;
  v27 = v10;
  v21 = v10;
  v22 = v16;
  v23 = v11;
  dispatch_async(v20, v24);

}

void __96__ANPlaybackSessionServiceListener_coordinator_didReceiveAnnouncement_forGroupID_forEndpointID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138412546;
    v14 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "groupID", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v10)
        {
          ANLogHandlePlaybackSessionServiceListener();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = &stru_1E93913D0;
            v21 = 2112;
            v22 = v8;
            _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@Notifying Remote Playback Client Announcement Received: %@", buf, 0x16u);
          }

          objc_msgSend(v8, "connection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "remoteObjectProxy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "didReceiveAnnouncement:forGroupID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);
  }

}

void __96__ANPlaybackSessionServiceListener_coordinator_didReceiveAnnouncement_forGroupID_forEndpointID___block_invoke_30(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138412546;
    v16 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "endpointID", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;

        if (objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40)))
        {
          ANLogHandlePlaybackSessionServiceListener();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = &stru_1E93913D0;
            v23 = 2112;
            v24 = v8;
            _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Notifying Local Playback Client Announcement Received: %@", buf, 0x16u);
          }

          objc_msgSend(v8, "connection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "remoteObjectProxy");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "didReceiveAnnouncement:forGroupID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }

}

- (void)coordinator:(id)a3 didStartPlayingAnnouncementsAtMachAbsoluteTime:(unint64_t)a4 forEndpointID:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v7 = a5;
  -[ANPlaybackSessionServiceListener _setTimersActive:forEndPointID:](self, "_setTimersActive:forEndPointID:", 0, v7);
  -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__ANPlaybackSessionServiceListener_coordinator_didStartPlayingAnnouncementsAtMachAbsoluteTime_forEndpointID___block_invoke;
  block[3] = &unk_1E938F6B8;
  block[4] = self;
  v11 = v7;
  v12 = a4;
  v9 = v7;
  dispatch_async(v8, block);

}

void __109__ANPlaybackSessionServiceListener_coordinator_didStartPlayingAnnouncementsAtMachAbsoluteTime_forEndpointID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v27;
    *(_QWORD *)&v4 = 138413058;
    v23 = v4;
    v24 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      v25 = v5;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        objc_msgSend(v8, "endpointID", v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;

        if (objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40)))
        {
          ANLogHandlePlaybackSessionServiceListener();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v8, "connection");
            v15 = v2;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "processIdentifier"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "connection");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "clientID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = v23;
            v31 = &stru_1E93913D0;
            v32 = 2112;
            v33 = v17;
            v34 = 2112;
            v35 = v19;
            v36 = 2048;
            v37 = v20;
            _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Notifying Local Playback Client (%@, %@) Announcement playback starting at time: %lld", buf, 0x2Au);

            v5 = v25;
            v2 = v15;
            v6 = v24;
          }

          objc_msgSend(v8, "connection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "remoteObjectProxy");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "announcementsWillStartPlaying:", *(_QWORD *)(a1 + 48));

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v5);
  }

}

- (void)coordinator:(id)a3 didFinishPlayingAnnouncementsForEndpointID:(id)a4
{
  -[ANPlaybackSessionServiceListener _setTimersActive:forEndPointID:](self, "_setTimersActive:forEndPointID:", 1, a4);
}

- (void)coordinator:(id)a3 didUpdatePlaybackState:(unint64_t)a4 forEndpointID:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v7 = a5;
  -[ANPlaybackSessionServiceListener playbackClientsSerialQueue](self, "playbackClientsSerialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__ANPlaybackSessionServiceListener_coordinator_didUpdatePlaybackState_forEndpointID___block_invoke;
  block[3] = &unk_1E938F6B8;
  block[4] = self;
  v11 = v7;
  v12 = a4;
  v9 = v7;
  dispatch_async(v8, block);

}

void __85__ANPlaybackSessionServiceListener_coordinator_didUpdatePlaybackState_forEndpointID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "endpointID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = v8;
        }
        else
        {
          +[ANAnnouncementCoordinator localDeviceIdentifier](ANAnnouncementCoordinator, "localDeviceIdentifier");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v10;

        if (objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 40)))
        {
          objc_msgSend(v7, "connection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "remoteObjectProxy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "announcementsStateUpdate:", *(_QWORD *)(a1 + 48));

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (NSXPCListener)localPlaybackSessionListener
{
  return self->_localPlaybackSessionListener;
}

- (NSXPCListener)remotePlaybackSessionListener
{
  return self->_remotePlaybackSessionListener;
}

- (NSMutableSet)remotePlaybackClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemotePlaybackClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableSet)localPlaybackClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalPlaybackClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)playbackClientsSerialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackClientsSerialQueue, 0);
  objc_storeStrong((id *)&self->_localPlaybackClients, 0);
  objc_storeStrong((id *)&self->_remotePlaybackClients, 0);
  objc_storeStrong((id *)&self->_remotePlaybackSessionListener, 0);
  objc_storeStrong((id *)&self->_localPlaybackSessionListener, 0);
}

@end
