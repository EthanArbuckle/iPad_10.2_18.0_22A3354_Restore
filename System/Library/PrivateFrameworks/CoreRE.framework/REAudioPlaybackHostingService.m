@implementation REAudioPlaybackHostingService

- (REAudioPlaybackHostingService)init
{
  REAudioPlaybackHostingService *v2;
  uint64_t v3;
  NSXPCListener *listener;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serviceQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *clients;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)REAudioPlaybackHostingService;
  v2 = -[REAudioPlaybackHostingService init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("AudioPlaybackHosting service queue", v5);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clients = v2->_clients;
    v2->_clients = v8;

    v2->_connectionIdentifierCounter = 0;
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (OS_xpc_object)endpoint
{
  void *v2;
  void *v3;

  -[NSXPCListener endpoint](self->_listener, "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  re *v6;
  int v7;
  unint64_t v8;
  unint64_t connectionIdentifierCounter;
  void *v10;
  NSMutableDictionary *clients;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  re *v16;
  NSObject *v17;
  REAudioPlaybackHostingClientObject *v18;
  void *v19;
  re *v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *serviceQueue;
  REAudioPlaybackHostingClientObject *v29;
  _QWORD v31[5];
  REAudioPlaybackHostingClientObject *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36[2];
  _QWORD v37[4];
  id v38[2];
  uint8_t buf[4];
  _BYTE v40[14];
  __int16 v41;
  re *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (re *)objc_msgSend(v5, "processIdentifier");
  v7 = (int)v6;
  v8 = self->_connectionIdentifierCounter + 1;
  self->_connectionIdentifierCounter = v8;
  connectionIdentifierCounter = v8;
  v10 = (void *)v8;
  while (!v10)
  {
LABEL_5:
    v10 = (void *)connectionIdentifierCounter++;
    self->_connectionIdentifierCounter = connectionIdentifierCounter;
    if (v10 == (void *)v8)
    {
      v14 = *re::audioLogObjects(v6);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_224FE9000, v14, OS_LOG_TYPE_ERROR, "Playback hosting service cannot generate a unique connection identifier. Rejecting connection", buf, 2u);
      }
      v15 = 0;
      goto LABEL_17;
    }
  }
  clients = self->_clients;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](clients, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    connectionIdentifierCounter = self->_connectionIdentifierCounter;
    goto LABEL_5;
  }
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("application-identifier"));
  v16 = (re *)objc_claimAutoreleasedReturnValue();
  v17 = *re::audioLogObjects(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v40 = v7;
    *(_WORD *)&v40[4] = 2048;
    *(_QWORD *)&v40[6] = v10;
    v41 = 2112;
    v42 = v16;
    _os_log_impl(&dword_224FE9000, v17, OS_LOG_TYPE_DEFAULT, "Accepting new playback hosting connection from client pid %d, assigning connection identifier %llu, application identifier %@", buf, 0x1Cu);
  }
  v18 = -[REAudioPlaybackHostingClientObject initWithConnection:connectionIdentifier:]([REAudioPlaybackHostingClientObject alloc], "initWithConnection:connectionIdentifier:", v5, v10);
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.re.should-redact-sensitive-info-from-logs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REAudioPlaybackHostingClientObject setShouldRedactSensitiveInfoFromLogs:](v18, "setShouldRedactSensitiveInfoFromLogs:", v19 != 0);

  v20 = (re *)-[REAudioPlaybackHostingClientObject shouldRedactSensitiveInfoFromLogs](v18, "shouldRedactSensitiveInfoFromLogs");
  if ((_DWORD)v20)
  {
    v21 = *re::audioLogObjects(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v40 = v10;
      _os_log_impl(&dword_224FE9000, v21, OS_LOG_TYPE_DEFAULT, "Setting shouldRedactSensitiveInfoFromLogs for client=%llu to true.", buf, 0xCu);
    }
  }
  -[REAudioPlaybackHostingService didConnectBlock](self, "didConnectBlock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
  {
    -[REAudioPlaybackHostingService didConnectBlock](self, "didConnectBlock");
    v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, BOOL))v24)[2](v24, v10, -[REAudioPlaybackHostingClientObject shouldRedactSensitiveInfoFromLogs](v18, "shouldRedactSensitiveInfoFromLogs"));

  }
  objc_msgSend(v5, "setExportedObject:", v18);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255840880);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v25);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255840B80);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v26);

  objc_msgSend(v5, "_setQueue:", self->_serviceQueue);
  objc_initWeak((id *)buf, self);
  v27 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke;
  v37[3] = &unk_24ED3F588;
  objc_copyWeak(v38, (id *)buf);
  v38[1] = v10;
  objc_msgSend(v5, "setInterruptionHandler:", v37);
  v35[0] = v27;
  v35[1] = 3221225472;
  v35[2] = __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke_82;
  v35[3] = &unk_24ED3F588;
  objc_copyWeak(v36, (id *)buf);
  v36[1] = v10;
  objc_msgSend(v5, "setInvalidationHandler:", v35);
  serviceQueue = self->_serviceQueue;
  v31[0] = v27;
  v31[1] = 3221225472;
  v31[2] = __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke_83;
  v31[3] = &unk_24ED3F5B0;
  v31[4] = self;
  v32 = v18;
  v34 = v10;
  v33 = v5;
  v29 = v18;
  dispatch_sync(serviceQueue, v31);

  objc_destroyWeak(v36);
  objc_destroyWeak(v38);
  objc_destroyWeak((id *)buf);

  v15 = 1;
LABEL_17:

  return v15;
}

void __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  re *WeakRetained;
  re *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  int v11;
  re *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (re *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *re::audioLogObjects(WeakRetained);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v11 = 138412546;
      v12 = v3;
      v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_224FE9000, v4, OS_LOG_TYPE_DEFAULT, "REAudioPlaybackHostingService %@ removing interrupted connection %llu", (uint8_t *)&v11, 0x16u);
    }
    -[re didDisconnectBlock](v3, "didDisconnectBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      -[re didDisconnectBlock](v3, "didDisconnectBlock");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, *(_QWORD *)(a1 + 40));

    }
    v9 = (void *)*((_QWORD *)v3 + 2);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

void __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke_82(uint64_t a1)
{
  re *WeakRetained;
  re *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  int v11;
  re *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (re *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *re::audioLogObjects(WeakRetained);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v11 = 138412546;
      v12 = v3;
      v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_224FE9000, v4, OS_LOG_TYPE_DEFAULT, "REAudioPlaybackHostingService %@ removing invalidated connection %llu", (uint8_t *)&v11, 0x16u);
    }
    -[re didDisconnectBlock](v3, "didDisconnectBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      -[re didDisconnectBlock](v3, "didDisconnectBlock");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, *(_QWORD *)(a1 + 40));

    }
    v9 = (void *)*((_QWORD *)v3 + 2);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

void __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke_83(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2);

  objc_msgSend(*(id *)(a1 + 48), "resume");
  objc_msgSend(*(id *)(a1 + 48), "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveConnectionIdentifier:", *(_QWORD *)(a1 + 56));

}

- (void)connectionIdentifier:(unint64_t)a3 streamToken:(unint64_t)a4 didChangeFromState:(unint64_t)a5 toState:(unint64_t)a6
{
  NSObject *serviceQueue;
  _QWORD block[9];

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__REAudioPlaybackHostingService_connectionIdentifier_streamToken_didChangeFromState_toState___block_invoke;
  block[3] = &unk_24ED3F5D8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_sync(serviceQueue, block);
}

void __93__REAudioPlaybackHostingService_connectionIdentifier_streamToken_didChangeFromState_toState___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v6, "unsignedLongLongValue", (_QWORD)v10) == a1[5])
        {
          objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "connection");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "remoteObjectProxy");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "streamToken:didChangeFromState:toState:", a1[6], a1[7], a1[8]);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)connectionIdentifierLostMediaServices:(unint64_t)a3
{
  NSObject *serviceQueue;
  _QWORD v4[6];

  serviceQueue = self->_serviceQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__REAudioPlaybackHostingService_connectionIdentifierLostMediaServices___block_invoke;
  v4[3] = &unk_24ED3D378;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serviceQueue, v4);
}

void __71__REAudioPlaybackHostingService_connectionIdentifierLostMediaServices___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  re *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v17;
    *(_QWORD *)&v4 = 138412546;
    v15 = v4;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = (re *)objc_msgSend(v7, "unsignedLongLongValue", v15, (_QWORD)v16);
        if (v8 == *(re **)(a1 + 40))
        {
          v9 = *re::audioLogObjects(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_QWORD *)(a1 + 32);
            v11 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v15;
            v21 = v10;
            v22 = 2048;
            v23 = v11;
            _os_log_impl(&dword_224FE9000, v9, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioPlaybackHostingService %@ notifying connection %llu that media services lost.", buf, 0x16u);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "connection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "remoteObjectProxy");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mediaServicesLost");

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v3);
  }

}

- (void)connectionIdentifierResetMediaServices:(unint64_t)a3
{
  NSObject *serviceQueue;
  _QWORD v4[6];

  serviceQueue = self->_serviceQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__REAudioPlaybackHostingService_connectionIdentifierResetMediaServices___block_invoke;
  v4[3] = &unk_24ED3D378;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serviceQueue, v4);
}

void __72__REAudioPlaybackHostingService_connectionIdentifierResetMediaServices___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  re *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v17;
    *(_QWORD *)&v4 = 138412546;
    v15 = v4;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = (re *)objc_msgSend(v7, "unsignedLongLongValue", v15, (_QWORD)v16);
        if (v8 == *(re **)(a1 + 40))
        {
          v9 = *re::audioLogObjects(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_QWORD *)(a1 + 32);
            v11 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v15;
            v21 = v10;
            v22 = 2048;
            v23 = v11;
            _os_log_impl(&dword_224FE9000, v9, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioPlaybackHostingService %@ notifying connection %llu that media services reset.", buf, 0x16u);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "connection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "remoteObjectProxy");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mediaServicesReset");

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v3);
  }

}

- (unint64_t)clientCount
{
  return -[NSMutableDictionary count](self->_clients, "count");
}

- (id)didConnectBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDidConnectBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)didDisconnectBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDidDisconnectBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didDisconnectBlock, 0);
  objc_storeStrong(&self->_didConnectBlock, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
