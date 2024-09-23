@implementation GEOResourceManifestServerRemoteProxy

- (GEOActiveTileGroup)activeTileGroup
{
  return 0;
}

void __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_4(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  xpc_object_t v4;
  id *WeakRetained;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = WeakRetained[5];
    if (v1)
    {
      if ((objc_msgSend(v1, "isDefaultConfiguration") & 1) == 0)
      {
        v6 = CFSTR("message");
        v7[0] = CFSTR("resourcemanifest.setConfiguration");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();

        v4 = xpc_dictionary_create(0, 0, 0);
        GEOEncodeXPCValue(v4, "cfg", WeakRetained[5], 0);
        xpc_dictionary_set_value(v3, "userInfo", v4);
        objc_msgSend(WeakRetained[2], "sendMessage:", v3);

      }
    }
  }

}

void __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const char *string;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = MEMORY[0x18D765A14](v3);
    if (v5 == MEMORY[0x1E0C812F8])
    {
      v6 = _CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(WeakRetained, "_handleMessage:xpcMessage:", v6, v3);
LABEL_7:

      goto LABEL_8;
    }
    if (v5 == MEMORY[0x1E0C81310])
    {
      GEOGetResourceManifestLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
        v8 = 136315138;
        v9 = string;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "GEOResourceManifestServerRemoteProxy: Lost connection to geod (%s)", (uint8_t *)&v8, 0xCu);
      }
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)_handleMessage:(id)a3 xpcMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOActiveTileGroup *v14;
  NSString *authToken;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  GEOResourceManifestServerRemoteProxy *v30;

  v6 = a4;
  v7 = a3;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_HandleMessage"));

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_HandleMessageBEGIN"), 0);

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("message"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", CFSTR("resourcemanifest.didChangeActiveTileGroup")))
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("activeTileGroupData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GEOActiveTileGroup initWithData:]([GEOActiveTileGroup alloc], "initWithData:", v13);
    os_unfair_lock_lock_with_options();
    authToken = self->_authToken;
    self->_authToken = 0;

    os_unfair_lock_unlock(&self->_authTokenLock);
    if (v14)
    {
      v16 = MEMORY[0x1E0C809B0];
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __66__GEOResourceManifestServerRemoteProxy__handleMessage_xpcMessage___block_invoke;
      v29 = &unk_1E1BFF6F8;
      v30 = self;
      geo_isolate_sync_data();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v21 = v16;
      v22 = 3221225472;
      v23 = __66__GEOResourceManifestServerRemoteProxy__handleMessage_xpcMessage___block_invoke_2;
      v24 = &unk_1E1BFF6F8;
      v25 = v6;
      objc_msgSend(WeakRetained, "serverProxy:didChangeActiveTileGroup:finishedCallback:", self, v14, &v21);

    }
  }
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager", v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_HandleMessage"));

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_HandleMessageEND"), 0);

  }
}

- (void)forceUpdate:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOXPCConnection *xpcConnection;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_ForcedUpdate"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_ForcedUpdateBEGIN"), 0);

  }
  v21[0] = CFSTR("message");
  v21[1] = CFSTR("userInfo");
  v22[0] = CFSTR("resourcemanifest.forceUpdate");
  v19 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpcConnection = self->_xpcConnection;
  -[GEOResourceManifestServerRemoteProxy serverQueue](self, "serverQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__GEOResourceManifestServerRemoteProxy_forceUpdate_completionHandler___block_invoke;
  v17[3] = &unk_1E1C093D0;
  v18 = v6;
  v16 = v6;
  -[GEOXPCConnection sendMessageReporingProgress:withReply:handler:](xpcConnection, "sendMessageReporingProgress:withReply:handler:", v13, v15, v17);

}

- (void)activateResourceScale:(int)a3
{
  uint64_t v3;
  GEOActiveResourceFilter *v5;
  void *v6;
  GEOResourceManifestActivateFilterRequest *v7;

  v3 = *(_QWORD *)&a3;
  v7 = -[GEOResourceManifestActivateFilterRequest initWithTraits:auditToken:throttleToken:]([GEOResourceManifestActivateFilterRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v5 = objc_alloc_init(GEOActiveResourceFilter);
  -[GEOResourceManifestActivateFilterRequest setFilter:](v7, "setFilter:", v5);

  -[GEOResourceManifestActivateFilterRequest filter](v7, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScale:", v3);

  -[GEOXPCRequest send:](v7, "send:", self->_xpcConnection);
}

- (id)serverQueue
{
  return self->_serverQueue;
}

- (GEOResourceManifestServerRemoteProxy)initWithDelegate:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  GEOResourceManifestServerRemoteProxy *v8;
  GEOResourceManifestServerRemoteProxy *v9;
  uint64_t v10;
  geo_isolater *maximumZoomLevelIsolation;
  uint64_t v12;
  OS_dispatch_queue *serverQueue;
  id v14;
  const char *v15;
  NSObject *v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  id v20;
  id *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD handler[4];
  id *v28;
  id v29;
  id location;
  objc_super v31;
  char __str[255];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)GEOResourceManifestServerRemoteProxy;
  v8 = -[GEOResourceManifestServerRemoteProxy init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_configuration, a4);
    v10 = geo_isolater_create();
    maximumZoomLevelIsolation = v9->_maximumZoomLevelIsolation;
    v9->_maximumZoomLevelIsolation = (geo_isolater *)v10;

    snprintf(__str, 0xFFuLL, "com.apple.geo.ResourceManifest.%p", v9);
    v12 = geo_dispatch_queue_create();
    serverQueue = v9->_serverQueue;
    v9->_serverQueue = (OS_dispatch_queue *)v12;

    v9->_authTokenLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v9);
    GEOActiveTileGroupChangedInternalDarwinNotificationName(v7);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    v16 = v9->_serverQueue;
    v17 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke;
    handler[3] = &unk_1E1C0ABD0;
    objc_copyWeak(&v29, &location);
    v18 = v9;
    v28 = v18;
    notify_register_dispatch(v15, &v9->_activeTileGroupChangedNotificationToken, v16, handler);

    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_4;
    v25[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v26, &location);
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_5;
    v23[3] = &unk_1E1C07998;
    objc_copyWeak(&v24, &location);
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:queue:reconnectBlock:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:queue:reconnectBlock:eventHandler:", 11, CFSTR("ResourceManifest"), 0, v25, v23);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v18[2];
    v18[2] = (id)v19;

    objc_msgSend(v18[2], "setReconnectAutomatically:", 1);
    v21 = v18;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __70__GEOResourceManifestServerRemoteProxy_forceUpdate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    GEOGetResourceManifestLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[GEOResourceManifestServerRemoteProxy forceUpdate:completionHandler:]_block_invoke";
      v17 = 2080;
      v18 = "com.apple.geod";
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%s: Could not connect to geod on %s", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v4);
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

    }
    else
    {
      GEOGetResourceManifestLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[GEOResourceManifestServerRemoteProxy forceUpdate:completionHandler:]_block_invoke";
        v17 = 2080;
        v18 = "com.apple.geod";
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "%s: Unexpected response type from geod on %s", (uint8_t *)&v15, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
    }

  }
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_ForcedUpdate"));

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_ForcedUpdateEND"), 0);

  }
}

- (void)openConnection
{
  -[GEOXPCConnection reconnect](self->_xpcConnection, "reconnect");
}

void __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  char v3;
  void *v4;
  void *v5;
  GEOActiveTileGroup *v6;
  id v7;
  id *v8;
  id v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isConnected");
    WeakRetained = v8;
    if ((v3 & 1) == 0)
    {
      GEOActiveTileGroupPath(v8[5]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "length"))
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v4);
        if (v5)
        {
          v6 = -[GEOActiveTileGroup initWithData:]([GEOActiveTileGroup alloc], "initWithData:", v5);
LABEL_8:
          v9 = *(id *)(a1 + 32);
          geo_isolate_sync_data();
          v7 = objc_loadWeakRetained(v8 + 1);
          objc_msgSend(v7, "serverProxy:didChangeActiveTileGroup:finishedCallback:", v8, v6, &__block_literal_global_84);

          WeakRetained = v8;
          goto LABEL_9;
        }
      }
      else
      {
        v5 = 0;
      }
      v6 = 0;
      goto LABEL_8;
    }
  }
LABEL_9:

}

uint64_t __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_activeTileGroupChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceManifestServerRemoteProxy;
  -[GEOResourceManifestServerRemoteProxy dealloc](&v3, sel_dealloc);
}

- (id)authToken
{
  os_unfair_lock_s *p_authTokenLock;
  NSString *authToken;
  void *v5;
  void *v6;
  GEOResourceManifestDownload *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  p_authTokenLock = &self->_authTokenLock;
  os_unfair_lock_lock(&self->_authTokenLock);
  authToken = self->_authToken;
  if (!authToken)
  {
    GEOResourceManifestPath(self->_configuration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = -[GEOResourceManifestDownload initWithData:]([GEOResourceManifestDownload alloc], "initWithData:", v6);
        -[GEOResourceManifestDownload resources](v7, "resources");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "authToken");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (NSString *)objc_msgSend(v9, "copy");
        v11 = self->_authToken;
        self->_authToken = v10;

      }
    }

    authToken = self->_authToken;
  }
  v12 = authToken;
  os_unfair_lock_unlock(p_authTokenLock);
  return v12;
}

- (id)configuration
{
  return self->_configuration;
}

- (void)setActiveTileGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_SetActiveTileGroup"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_SetActiveTileGroupBEGIN"), 0);

  }
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", CFSTR("resourcemanifest.setActiveTileGroupIdentifier"), CFSTR("message"), v9, CFSTR("userInfo"), 0);
  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[GEOXPCConnection sendMessage:](self->_xpcConnection, "sendMessage:", v10);
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_SetActiveTileGroup"));

  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_SetActiveTileGroupEND"), 0);

  }
}

- (void)setActiveTileGroupIdentifier:(id)a3 updateType:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOXPCConnection *xpcConnection;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v23[0] = CFSTR("resourcemanifest.setActiveTileGroupIdentifier");
  v22[0] = CFSTR("message");
  v22[1] = CFSTR("userInfo");
  v21[0] = a3;
  v20[0] = CFSTR("identifier");
  v20[1] = CFSTR("type");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = CFSTR("reply");
  v21[1] = v11;
  v21[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpcConnection = self->_xpcConnection;
  -[GEOResourceManifestServerRemoteProxy serverQueue](self, "serverQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__GEOResourceManifestServerRemoteProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke;
  v18[3] = &unk_1E1C093D0;
  v19 = v8;
  v17 = v8;
  -[GEOXPCConnection sendMessage:withReply:handler:](xpcConnection, "sendMessage:withReply:handler:", v14, v16, v18);

}

void __98__GEOResourceManifestServerRemoteProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    GEOGetResourceManifestLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[GEOResourceManifestServerRemoteProxy setActiveTileGroupIdentifier:updateType:completionHandler:]_block_invoke";
      v14 = 2080;
      v15 = "com.apple.geod";
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%s: Could not connect to geod on %s", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v4);
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

    }
    else
    {
      GEOGetResourceManifestLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "-[GEOResourceManifestServerRemoteProxy setActiveTileGroupIdentifier:updateType:completionHandler:]_block_invoke";
        v14 = 2080;
        v15 = "com.apple.geod";
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "%s: Unexpected response type from geod on %s", (uint8_t *)&v12, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
    }

  }
}

- (void)resetActiveTileGroup
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_ResetActiveTileGroup"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_ResetActiveTileGroupBEGIN"), 0);

  }
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("resourcemanifest.resetActiveTileGroup"), CFSTR("message"), 0);
  v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[GEOXPCConnection sendMessage:](self->_xpcConnection, "sendMessage:", v6);
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_ResetActiveTileGroup"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_ResetActiveTileGroupEND"), 0);

  }
}

- (void)updateIfNecessary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  GEOXPCConnection *xpcConnection;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_Update"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_UpdateBEGIN"), 0);

  }
  v14 = CFSTR("message");
  v15[0] = CFSTR("resourcemanifest.updateIfNecessary");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__GEOResourceManifestServerRemoteProxy_updateIfNecessary___block_invoke;
  v12[3] = &unk_1E1C093D0;
  v13 = v4;
  v11 = v4;
  -[GEOXPCConnection sendMessage:withReply:handler:](xpcConnection, "sendMessage:withReply:handler:", v9, MEMORY[0x1E0C80D38], v12);

}

void __58__GEOResourceManifestServerRemoteProxy_updateIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Could not connect to geod on %s"), "-[GEOResourceManifestServerRemoteProxy updateIfNecessary:]_block_invoke", "com.apple.geod");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetResourceManifestLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_15;
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Unexpected response type from geod on %s"), "-[GEOResourceManifestServerRemoteProxy updateIfNecessary:]_block_invoke", "com.apple.geod");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetResourceManifestLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v5);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v6;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_14:
LABEL_15:
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_Update"));

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_UpdateEND"), 0);

  }
}

- (id)updateProgress
{
  return 0;
}

- (void)getResourceManifestWithHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  GEOXPCConnection *xpcConnection;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (v4)
  {
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_GetResourceManifest"));

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_GetResourceManifestBEGIN"), 0);

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("resourcemanifest.getResourceManifest"), CFSTR("message"), 0);
    v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpcConnection = self->_xpcConnection;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__GEOResourceManifestServerRemoteProxy_getResourceManifestWithHandler___block_invoke;
    v11[3] = &unk_1E1C093D0;
    v12 = v4;
    -[GEOXPCConnection sendMessage:withReply:handler:](xpcConnection, "sendMessage:withReply:handler:", v9, MEMORY[0x1E0C80D38], v11);

  }
}

void __71__GEOResourceManifestServerRemoteProxy_getResourceManifestWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GEOResourceManifestDownload *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Could not connect to geod on %s"), "-[GEOResourceManifestServerRemoteProxy getResourceManifestWithHandler:]_block_invoke", "com.apple.geod");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetResourceManifestLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(CFSTR("%s: Unexpected response type from geod on %s"), "-[GEOResourceManifestServerRemoteProxy getResourceManifestWithHandler:]_block_invoke", "com.apple.geod");
      goto LABEL_17;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_15;
    objc_msgSend(v5, "objectForKey:", CFSTR("manifestData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[GEOResourceManifestDownload initWithData:]([GEOResourceManifestDownload alloc], "initWithData:", v7);
      if (v8)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v6 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("manifest is nil"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("manifestData is not NSData"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v6)
    {
LABEL_15:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

LABEL_17:
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_GetResourceManifest"));

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_GetResourceManifestEND"), 0);

  }
}

- (void)setManifestToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOXPCConnection *xpcConnection;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_SetManifestToken"));

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_SetManifestTokenBEGIN"), 0);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
      objc_msgSend(v11, "setObject:forKey:", v6, CFSTR("requestToken"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("resourcemanifest.setRequestToken"), CFSTR("message"), v12, CFSTR("userInfo"), 0);
    v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__GEOResourceManifestServerRemoteProxy_setManifestToken_completionHandler___block_invoke;
    v16[3] = &unk_1E1C093D0;
    v17 = v7;
    -[GEOXPCConnection sendMessage:withReply:handler:](xpcConnection, "sendMessage:withReply:handler:", v14, MEMORY[0x1E0C80D38], v16);

  }
}

void __75__GEOResourceManifestServerRemoteProxy_setManifestToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  if (MEMORY[0x18D765A14](a2) == MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Could not connect to geod on %s"), "-[GEOResourceManifestServerRemoteProxy setManifestToken:completionHandler:]_block_invoke", "com.apple.geod");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v3);
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_Manifest_SetManifestToken"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("GEOPPTTest_Manifest_SetManifestTokenEND"), 0);

  }
}

- (void)deactivateResourceScale:(int)a3
{
  uint64_t v3;
  GEOActiveResourceFilter *v5;
  void *v6;
  GEOResourceManifestDeactivateFilterRequest *v7;

  v3 = *(_QWORD *)&a3;
  v7 = -[GEOResourceManifestDeactivateFilterRequest initWithTraits:auditToken:throttleToken:]([GEOResourceManifestDeactivateFilterRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v5 = objc_alloc_init(GEOActiveResourceFilter);
  -[GEOResourceManifestDeactivateFilterRequest setFilter:](v7, "setFilter:", v5);

  -[GEOResourceManifestDeactivateFilterRequest filter](v7, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScale:", v3);

  -[GEOXPCRequest send:](v7, "send:", self->_xpcConnection);
}

- (void)activateResourceScenario:(int)a3
{
  uint64_t v3;
  GEOActiveResourceFilter *v5;
  void *v6;
  GEOResourceManifestActivateFilterRequest *v7;

  v3 = *(_QWORD *)&a3;
  v7 = -[GEOResourceManifestActivateFilterRequest initWithTraits:auditToken:throttleToken:]([GEOResourceManifestActivateFilterRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v5 = objc_alloc_init(GEOActiveResourceFilter);
  -[GEOResourceManifestActivateFilterRequest setFilter:](v7, "setFilter:", v5);

  -[GEOResourceManifestActivateFilterRequest filter](v7, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScenario:", v3);

  -[GEOXPCRequest send:](v7, "send:", self->_xpcConnection);
}

- (void)deactivateResourceScenario:(int)a3
{
  uint64_t v3;
  GEOActiveResourceFilter *v5;
  void *v6;
  GEOResourceManifestDeactivateFilterRequest *v7;

  v3 = *(_QWORD *)&a3;
  v7 = -[GEOResourceManifestDeactivateFilterRequest initWithTraits:auditToken:throttleToken:]([GEOResourceManifestDeactivateFilterRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v5 = objc_alloc_init(GEOActiveResourceFilter);
  -[GEOResourceManifestDeactivateFilterRequest setFilter:](v7, "setFilter:", v5);

  -[GEOResourceManifestDeactivateFilterRequest filter](v7, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScenario:", v3);

  -[GEOXPCRequest send:](v7, "send:", self->_xpcConnection);
}

- (void)activateResourceName:(id)a3
{
  id v4;
  GEOActiveResourceFilter *v5;
  void *v6;
  GEOResourceManifestActivateFilterRequest *v7;

  v4 = a3;
  v7 = -[GEOResourceManifestActivateFilterRequest initWithTraits:auditToken:throttleToken:]([GEOResourceManifestActivateFilterRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v5 = objc_alloc_init(GEOActiveResourceFilter);
  -[GEOResourceManifestActivateFilterRequest setFilter:](v7, "setFilter:", v5);

  -[GEOResourceManifestActivateFilterRequest filter](v7, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v4);

  -[GEOXPCRequest send:](v7, "send:", self->_xpcConnection);
}

- (void)deactivateResourceName:(id)a3
{
  id v4;
  GEOActiveResourceFilter *v5;
  void *v6;
  GEOResourceManifestDeactivateFilterRequest *v7;

  v4 = a3;
  v7 = -[GEOResourceManifestDeactivateFilterRequest initWithTraits:auditToken:throttleToken:]([GEOResourceManifestDeactivateFilterRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v5 = objc_alloc_init(GEOActiveResourceFilter);
  -[GEOResourceManifestDeactivateFilterRequest setFilter:](v7, "setFilter:", v5);

  -[GEOResourceManifestDeactivateFilterRequest filter](v7, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v4);

  -[GEOXPCRequest send:](v7, "send:", self->_xpcConnection);
}

- (unsigned)maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v34[2] = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  geo_isolate_sync_data();
  if (*((_BYTE *)v24 + 24))
  {
    v9 = *((_DWORD *)v28 + 6);
  }
  else
  {
    v33[0] = CFSTR("message");
    v33[1] = CFSTR("userInfo");
    v34[0] = CFSTR("resourcemanifest.getMaximumZoomLevel");
    v31[0] = CFSTR("style");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = CFSTR("scale");
    v32[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOXPCConnection sendDictionaryWithReplySync:error:](self->_xpcConnection, "sendDictionaryWithReplySync:error:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("userInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("result"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("idealSize"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (a5 && v18)
        *a5 = objc_msgSend(v18, "intValue");
      v21 = v17;
      v22 = v19;
      geo_isolate_sync_data();
      v9 = objc_msgSend(v21, "unsignedIntValue");

    }
    else
    {
      v9 = 0;
    }

  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v9;
}

void __79__GEOResourceManifestServerRemoteProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  _DWORD *v6;
  unint64_t v7;
  id v8;

  v2 = *(void **)(a1[4] + 80);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  if (v8)
  {
    v5 = objc_msgSend(v8, "unsignedLongLongValue");
    v6 = (_DWORD *)a1[8];
    if (v5 == -1)
    {
      LODWORD(v7) = -1;
      if (v6)
        *v6 = -1;
    }
    else
    {
      if (v6)
        *v6 = v5;
      v7 = HIDWORD(v5);
    }
    v4 = v8;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

void __79__GEOResourceManifestServerRemoteProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 80);
    *(_QWORD *)(v3 + 80) = v2;

  }
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue");
  v7 = objc_msgSend(*(id *)(a1 + 48), "intValue");
  if ((v7 & v6) == 0xFFFFFFFF)
    v8 = -1;
  else
    v8 = v7 | (unint64_t)(v6 << 32);
  objc_msgSend(v5, "numberWithUnsignedLongLong:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

}

uint64_t __66__GEOResourceManifestServerRemoteProxy__handleMessage_xpcMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
}

void __66__GEOResourceManifestServerRemoteProxy__handleMessage_xpcMessage___block_invoke_2(uint64_t a1)
{
  xpc_object_t reply;
  _xpc_connection_s *connection;

  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_connection_send_message(connection, reply);

}

- (GEOResourceManifestServerProxyDelegate)delegate
{
  return (GEOResourceManifestServerProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumZoomLevelCache, 0);
  objc_storeStrong((id *)&self->_maximumZoomLevelIsolation, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
