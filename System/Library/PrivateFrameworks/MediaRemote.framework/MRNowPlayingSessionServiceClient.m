@implementation MRNowPlayingSessionServiceClient

- (MRNowPlayingSessionServiceClient)initWithService:(id)a3
{
  id v5;
  MRNowPlayingSessionServiceClient *v6;
  uint64_t v7;
  NSMutableDictionary *playerPathsByOrigin;
  void *v9;
  void *v10;
  uint64_t v11;
  MRNowPlayingSessionServiceClient *v12;
  void *v13;
  void *v14;
  MRNowPlayingSessionServiceClient *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  MRNowPlayingSessionServiceClient *v25;
  _QWORD v26[4];
  MRNowPlayingSessionServiceClient *v27;
  SEL v28;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MRNowPlayingSessionServiceClient;
  v6 = -[MRNowPlayingSessionServiceClient init](&v29, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    playerPathsByOrigin = v6->_playerPathsByOrigin;
    v6->_playerPathsByOrigin = (NSMutableDictionary *)v7;

    objc_msgSend(v5, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mrXPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke;
    v26[3] = &unk_1E30D03C8;
    v28 = a2;
    v12 = v6;
    v27 = v12;
    objc_msgSend(v10, "addCustomXPCHandler:forKey:", v26, 0x40000000000000BLL);

    objc_msgSend(v5, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mrXPCConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v11;
    v22 = 3221225472;
    v23 = __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke_3;
    v24 = &unk_1E30D03F0;
    v15 = v12;
    v25 = v15;
    objc_msgSend(v14, "addCustomXPCHandler:forKey:", &v21, 0x40000000000000CLL);

    getAVAudioSessionMediaServicesWereLostNotification[0]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("MRNowPlayingSessionServiceClient.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("AVAudioSessionMediaServicesWereLostNotification"), v21, v22, v23, v24);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    getAVAudioSessionMediaServicesWereLostNotification[0]();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v15, sel_mediaServicesResetNotification_, v18, 0);

  }
  return v6;
}

void __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  MRCreatePlayerPathFromXPCMessage(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateDeviceInfoFromXPCMessage(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routingContextID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MRNowPlayingSessionServiceClient.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceInfo.routingContextID"));

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke_2;
  v11[3] = &unk_1E30D03A0;
  v12 = v3;
  v9 = v3;
  objc_msgSend(v7, "_handleCreatePlayerForOrigin:deviceInfo:completion:", v8, v5, v11);

}

void __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _xpc_connection_s *v6;
  xpc_object_t reply;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    v8 = reply;
    if (reply)
    {
      MRAddPlayerPathToXPCMessage(reply, v9);
      MRAddClientErrorToXPCMessage(v8, (uint64_t)v5);
      xpc_connection_send_message(v6, v8);
    }

  }
}

void __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  MRCreateOriginFromXPCMessage(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handleDestroyPlayersForOrigin:", v3);

}

- (void)mediaServicesResetNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MRNowPlayingSessionServiceClient *v7;
  void *v8;
  NSObject *v9;
  id v10;
  MRNowPlayingSessionServiceClient *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destroyPlayerCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)-[NSMutableDictionary copy](v7->_playerPathsByOrigin, "copy");
  objc_sync_exit(v7);

  if (objc_msgSend(v8, "count"))
  {
    _MRLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionServiceClient] Destroying all players %@", buf, 0xCu);
    }

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__MRNowPlayingSessionServiceClient_mediaServicesResetNotification___block_invoke;
  v12[3] = &unk_1E30D0418;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
  v11 = v7;
  objc_sync_enter(v11);
  -[NSMutableDictionary removeAllObjects](v7->_playerPathsByOrigin, "removeAllObjects");
  objc_sync_exit(v11);

}

void __67__MRNowPlayingSessionServiceClient_mediaServicesResetNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a3);
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeOrigin:", v7);

}

- (void)_handleDestroyPlayersForOrigin:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  MRNowPlayingSessionServiceClient *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destroyPlayerCallback");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_playerPathsByOrigin, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_playerPathsByOrigin, "setObject:forKeyedSubscript:", 0, v4);
  objc_sync_exit(v7);

  if (v8)
  {
    _MRLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionServiceClient] Destroying player %@ created for origin: %@", (uint8_t *)&v11, 0x16u);
    }

    if (v6)
      ((void (**)(_QWORD, void *))v6)[2](v6, v8);
  }
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeOrigin:", v4);

}

- (void)_handleCreatePlayerForOrigin:(id)a3 deviceInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, void *);
  MRPlayerPath *v12;
  NSObject *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MRPlayerPath *v23;
  void *v24;
  MRNowPlayingSessionServiceClient *v25;
  NSObject *v26;
  void *v27;
  uint8_t buf[4];
  MRPlayerPath *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, void *))a5;
  -[MRNowPlayingSessionServiceClient _existingPlayerPathForOrigin:](self, "_existingPlayerPathForOrigin:", v9);
  v12 = (MRPlayerPath *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createNewPlayerCallback");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v10, "routingContextID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingSessionServiceClient.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceInfo.routingContextID"));

      }
      +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "routingContextID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "createCustomOriginClientForOrigin:routingContextID:", v9, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[MRNowPlayingSessionServiceClient _generatePlayerPathForOrigin:](self, "_generatePlayerPathForOrigin:", v9);
      v12 = (MRPlayerPath *)objc_claimAutoreleasedReturnValue();
      +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "playerClientForPlayerPath:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "routingContextID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, MRPlayerPath *, void *))v15)[2](v15, v12, v22);

    }
    else
    {
      if (!objc_msgSend(v9, "isLocal"))
      {
        _MRLogForCategory(1uLL);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionServiceClient] Not creating new player for origin because createNewPlayerCallback was not registered", buf, 2u);
        }

        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 14);
        v12 = 0;
        goto LABEL_12;
      }
      v23 = [MRPlayerPath alloc];
      +[MRClient localClient](MRClient, "localClient");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[MRPlayerPath initWithOrigin:client:player:](v23, "initWithOrigin:client:player:", v9, v19, 0);
    }

    v24 = 0;
LABEL_12:
    v25 = self;
    objc_sync_enter(v25);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25->_playerPathsByOrigin, "setObject:forKeyedSubscript:", v12, v9);
    objc_sync_exit(v25);

    v11[2](v11, v12, v24);
    goto LABEL_13;
  }
  _MRLogForCategory(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v12;
    _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionServiceClient] Not creating new player for origin because playerPath already exists: %@", buf, 0xCu);
  }

  v11[2](v11, v12, 0);
LABEL_13:

}

- (id)_existingPlayerPathForOrigin:(id)a3
{
  id v4;
  MRNowPlayingSessionServiceClient *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_playerPathsByOrigin, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)_generatePlayerPathForOrigin:(id)a3
{
  id v4;
  void *v5;
  MRPlayerPath *v6;
  void *v7;
  MRPlayer *v8;
  MRPlayerPath *v9;

  v4 = a3;
  -[MRNowPlayingSessionServiceClient _generatePlayerID](self, "_generatePlayerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [MRPlayerPath alloc];
  +[MRClient localClient](MRClient, "localClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRPlayer initWithIdentifier:displayName:]([MRPlayer alloc], "initWithIdentifier:displayName:", v5, v5);
  v9 = -[MRPlayerPath initWithOrigin:client:player:](v6, "initWithOrigin:client:player:", v4, v7, v8);

  return v9;
}

- (id)_generatePlayerID
{
  void *v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatePlayerIDCallback");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (!v3 || (v3[2](v3), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPathsByOrigin, 0);
}

@end
