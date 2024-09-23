@implementation AccessoryNowPlayingClient

- (AccessoryNowPlayingClient)initWithDelegate:(id)a3
{
  id v4;
  AccessoryNowPlayingClient *v5;
  AccessoryNowPlayingClient *v6;
  NSXPCConnection *serverConnection;
  AccessoryNowPlayingXPCServerProtocol *remoteObject;
  NSSet *subscriberList;
  NSObject *v10;
  id v11;
  int isServerAvailable;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, int);
  void *v17;
  id v18;
  id location;
  objc_super v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  init_logging();
  v20.receiver = self;
  v20.super_class = (Class)AccessoryNowPlayingClient;
  v5 = -[AccessoryNowPlayingClient init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    serverConnection = v6->_serverConnection;
    v6->_serverConnection = 0;

    remoteObject = v6->_remoteObject;
    v6->_remoteObject = 0;

    subscriberList = v6->_subscriberList;
    v6->_subscriberList = 0;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __46__AccessoryNowPlayingClient_initWithDelegate___block_invoke;
    v17 = &unk_24D481018;
    objc_copyWeak(&v18, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.now-playing.availability-changed", &v14);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      isServerAvailable = accessoryServer_isServerAvailable();
      *(_DWORD *)buf = 67109120;
      v22 = isServerAvailable;
      _os_log_impl(&dword_215D8C000, v10, OS_LOG_TYPE_DEFAULT, "Server available: %d", buf, 8u);
    }

    -[AccessoryNowPlayingClient connectToServer](v6, "connectToServer", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __46__AccessoryNowPlayingClient_initWithDelegate___block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_215D8C000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_215D8C000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  accessoryServer_unregisterAvailabilityChangedHandler();
  -[AccessoryNowPlayingClient serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)AccessoryNowPlayingClient;
  -[AccessoryNowPlayingClient dealloc](&v4, sel_dealloc);
}

- (void)connectToServer
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215D8C000, log, OS_LOG_TYPE_DEBUG, "Getting remote object...", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setRemoteObject:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_215D8C000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v8, 2u);
  }

}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke_77(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRemoteObject:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_215D8C000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }

}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke_78(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __44__AccessoryNowPlayingClient_connectToServer__block_invoke_78_cold_1((uint64_t)v2, v5);

}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke_80(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_215D8C000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (BOOL)shouldSendArtwork
{
  void *v2;
  char v3;

  -[AccessoryNowPlayingClient subscriberList](self, "subscriberList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("MediaItemArtwork"));

  return v3;
}

- (BOOL)shouldSendPlaybackQueueList
{
  void *v2;
  char v3;

  -[AccessoryNowPlayingClient subscriberList](self, "subscriberList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("PlaybackQueueList"));

  return v3;
}

- (void)mediaItemAttributesDidChange:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AccessoryNowPlayingClient subscriberList](self, "subscriberList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("MediaItemAttributes"));
  if (!v8 || !v5)
    goto LABEL_5;
  v6 = objc_msgSend(v8, "count");

  v7 = v8;
  if (v6)
  {
    -[AccessoryNowPlayingClient remoteObject](self, "remoteObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItemAttributesHaveChanged:withReply:", v8, &__block_literal_global_81);
LABEL_5:

    v7 = v8;
  }

}

void __58__AccessoryNowPlayingClient_mediaItemAttributesDidChange___block_invoke()
{
  BOOL v0;
  id v1;
  NSObject *v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__AccessoryNowPlayingClient_mediaItemAttributesDidChange___block_invoke_cold_1();

}

- (void)mediaItemArtworkDidChange
{
  if (-[AccessoryNowPlayingClient shouldSendArtwork](self, "shouldSendArtwork"))
    -[AccessoryNowPlayingClient triggerMediaItemArtworkUpdateWithReply:](self, "triggerMediaItemArtworkUpdateWithReply:", 0);
}

- (void)playbackAttributesDidChange:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AccessoryNowPlayingClient subscriberList](self, "subscriberList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("PlaybackAttributes"));
  if (!v8 || !v5)
    goto LABEL_5;
  v6 = objc_msgSend(v8, "count");

  v7 = v8;
  if (v6)
  {
    -[AccessoryNowPlayingClient remoteObject](self, "remoteObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackAttributesHaveChanged:withReply:", v8, &__block_literal_global_82);
LABEL_5:

    v7 = v8;
  }

}

void __57__AccessoryNowPlayingClient_playbackAttributesDidChange___block_invoke()
{
  BOOL v0;
  id v1;
  NSObject *v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__AccessoryNowPlayingClient_playbackAttributesDidChange___block_invoke_cold_1();

}

- (void)playbackQueueListDidChange
{
  id v3;

  if (-[AccessoryNowPlayingClient shouldSendPlaybackQueueList](self, "shouldSendPlaybackQueueList"))
  {
    -[AccessoryNowPlayingClient remoteObject](self, "remoteObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playbackQueueListChanged");

  }
}

- (void)playbackQueueListInfoResponse:(id)a3 requestID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[AccessoryNowPlayingClient shouldSendPlaybackQueueList](self, "shouldSendPlaybackQueueList"))
  {
    -[AccessoryNowPlayingClient remoteObject](self, "remoteObject");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject playbackQueueListInfoResponse:requestID:info:](v11, "playbackQueueListInfoResponse:requestID:info:", v8, v9, v10);
  }
  else
  {
    if (gLogObjects)
      v12 = gNumLogObjects < 1;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_215D8C000, v11, OS_LOG_TYPE_INFO, "Not shouldSendPlaybackQueueList, ignore! %@, requestID=%@", (uint8_t *)&v14, 0x16u);
    }
  }

}

- (void)updateSubscriberList:(id)a3 WithReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AccessoryNowPlayingClient updateSubscriberList:WithReply:].cold.1((uint64_t)v6, v10, v11);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessoryNowPlayingClient setSubscriberList:](self, "setSubscriberList:", v12);

    -[AccessoryNowPlayingClient delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[AccessoryNowPlayingClient delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shouldSendArtworkDidChange:", -[AccessoryNowPlayingClient shouldSendArtwork](self, "shouldSendArtwork"));

    }
  }
  if (v7)
    v7[2](v7, 1);

}

- (void)triggerMediaItemAttributesUpdateWithReply:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  v5 = (void *)v4;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    goto LABEL_5;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentMediaItemAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AccessoryNowPlayingClient remoteObject](self, "remoteObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaItemAttributesHaveChanged:withReply:", v9, &__block_literal_global_88);

    v11 = 1;
  }
  else
  {
LABEL_5:
    v11 = 0;
  }
  v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v11);
    v12 = v13;
  }

}

void __71__AccessoryNowPlayingClient_triggerMediaItemAttributesUpdateWithReply___block_invoke()
{
  BOOL v0;
  id v1;
  NSObject *v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __71__AccessoryNowPlayingClient_triggerMediaItemAttributesUpdateWithReply___block_invoke_cold_1();

}

- (void)triggerMediaItemArtworkUpdateWithReply:(id)a3
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v4 = (void (**)(id, uint64_t))a3;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[AccessoryNowPlayingClient delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[AccessoryNowPlayingClient delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentMediaItemArtwork");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[AccessoryNowPlayingClient triggerMediaItemArtworkUpdateWithReply:].cold.1(v10, v11);

      if (v10)
      {
        -[AccessoryNowPlayingClient remoteObject](self, "remoteObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mediaItemArtworkHasChanged:withReply:", v10, &__block_literal_global_91);

        v14 = 1;
        if (!v4)
          goto LABEL_16;
        goto LABEL_15;
      }
    }
  }
  v14 = 0;
  if (v4)
LABEL_15:
    v4[2](v4, v14);
LABEL_16:

}

void __68__AccessoryNowPlayingClient_triggerMediaItemArtworkUpdateWithReply___block_invoke()
{
  BOOL v0;
  id v1;
  NSObject *v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68__AccessoryNowPlayingClient_triggerMediaItemArtworkUpdateWithReply___block_invoke_cold_1();

}

- (void)triggerPlaybackAttributesUpdateWithReply:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  v5 = (void *)v4;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    goto LABEL_5;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPlaybackAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AccessoryNowPlayingClient remoteObject](self, "remoteObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackAttributesHaveChanged:withReply:", v9, &__block_literal_global_94);

    v11 = 1;
  }
  else
  {
LABEL_5:
    v11 = 0;
  }
  v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v11);
    v12 = v13;
  }

}

void __70__AccessoryNowPlayingClient_triggerPlaybackAttributesUpdateWithReply___block_invoke()
{
  BOOL v0;
  id v1;
  NSObject *v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryNowPlayingClient initWithDelegate:].cold.1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __70__AccessoryNowPlayingClient_triggerPlaybackAttributesUpdateWithReply___block_invoke_cold_1();

}

- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v18 = a3;
  v12 = a4;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[AccessoryNowPlayingClient delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[AccessoryNowPlayingClient delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "requestPlaybackQueueListInfo:requestID:startIndex:upToCount:infoMask:", v18, v12, v9, v8, v7);

    }
  }

}

- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[AccessoryNowPlayingClient delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[AccessoryNowPlayingClient delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cancelRequestPlaybackQueueListInfo:requestID:", v12, v6);

    }
  }

}

- (void)setPlaybackElapsedTime:(id)a3 withReply:(id)a4
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[AccessoryNowPlayingClient delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[AccessoryNowPlayingClient delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "setPlaybackElapsedTime:", v13);

      if (!v6)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v12 = 0;
  if (v6)
LABEL_6:
    v6[2](v6, v12);
LABEL_7:

}

- (void)setPlaybackQueueIndex:(id)a3 withReply:(id)a4
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  -[AccessoryNowPlayingClient delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[AccessoryNowPlayingClient delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[AccessoryNowPlayingClient delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "setPlaybackQueueIndex:", v13);

      if (!v6)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v12 = 0;
  if (v6)
LABEL_6:
    v6[2](v6, v12);
LABEL_7:

}

- (AccessoryNowPlayingClientProtocol)delegate
{
  return (AccessoryNowPlayingClientProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setShouldSendArtwork:(BOOL)a3
{
  self->_shouldSendArtwork = a3;
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (AccessoryNowPlayingXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSSet)subscriberList
{
  return self->_subscriberList;
}

- (void)setSubscriberList:(id)a3
{
  objc_storeStrong((id *)&self->_subscriberList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriberList, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_215D8C000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke_78_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215D8C000, a2, OS_LOG_TYPE_ERROR, "XPC connection error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __58__AccessoryNowPlayingClient_mediaItemAttributesDidChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215D8C000, v0, v1, "Update mediaItemAttributes result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__AccessoryNowPlayingClient_playbackAttributesDidChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215D8C000, v0, v1, "Update playbackAttributes result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)updateSubscriberList:(uint64_t)a3 WithReply:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_215D8C000, a2, a3, "Received subscriberList update: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __71__AccessoryNowPlayingClient_triggerMediaItemAttributesUpdateWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215D8C000, v0, v1, "(Triggered) Update mediaItemAttributes result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)triggerMediaItemArtworkUpdateWithReply:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_6(&dword_215D8C000, a2, v3, "Received mediaItemArtwork from client: %lu bytes", (uint8_t *)&v4);
}

void __68__AccessoryNowPlayingClient_triggerMediaItemArtworkUpdateWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215D8C000, v0, v1, "#Artwork (Triggered) Update mediaItemArtwork result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __70__AccessoryNowPlayingClient_triggerPlaybackAttributesUpdateWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215D8C000, v0, v1, "(Triggered) Update playbackAttributes result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
