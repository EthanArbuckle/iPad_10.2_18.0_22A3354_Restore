@implementation DSRapportDevice

- (DSRapportDevice)initWithRapportDevice:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  DSRapportDevice *v9;
  DSRapportDevice *v10;
  uint64_t v11;
  NSString *identifier;
  RPCompanionLinkClient *sessionClient;
  RPCompanionLinkClient *screenOffDiscoveryClient;
  uint64_t v15;
  NSMutableArray *pendingRequests;
  OS_dispatch_source *discoveryExitTimer;
  OS_dispatch_source *responseTimeoutTimer;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DSRapportDevice;
  v9 = -[DSRapportDevice init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rpDevice, a3);
    objc_msgSend(v7, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_deviceType = 1;
    sessionClient = v10->_sessionClient;
    v10->_sessionClient = 0;

    screenOffDiscoveryClient = v10->_screenOffDiscoveryClient;
    v10->_screenOffDiscoveryClient = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    pendingRequests = v10->_pendingRequests;
    v10->_pendingRequests = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v10->_queue, a4);
    *(_WORD *)&v10->_isTryingForceDiscovery = 0;
    discoveryExitTimer = v10->_discoveryExitTimer;
    v10->_discoveryExitTimer = 0;

    responseTimeoutTimer = v10->_responseTimeoutTimer;
    v10->_responseTimeoutTimer = 0;

  }
  return v10;
}

- (void)invalidate
{
  RPCompanionLinkClient *sessionClient;
  RPCompanionLinkClient *v4;
  RPCompanionLinkClient *screenOffDiscoveryClient;
  RPCompanionLinkClient *v6;
  NSObject *discoveryExitTimer;
  NSObject *responseTimeoutTimer;
  OS_dispatch_source *v9;
  NSObject *source;

  sessionClient = self->_sessionClient;
  if (sessionClient)
  {
    -[RPCompanionLinkClient invalidate](sessionClient, "invalidate");
    v4 = self->_sessionClient;
    self->_sessionClient = 0;

  }
  screenOffDiscoveryClient = self->_screenOffDiscoveryClient;
  if (screenOffDiscoveryClient)
  {
    -[RPCompanionLinkClient invalidate](screenOffDiscoveryClient, "invalidate");
    v6 = self->_screenOffDiscoveryClient;
    self->_screenOffDiscoveryClient = 0;

  }
  discoveryExitTimer = self->_discoveryExitTimer;
  if (discoveryExitTimer)
  {
    if (!dispatch_source_testcancel((dispatch_source_t)self->_discoveryExitTimer))
    {
      dispatch_source_cancel(discoveryExitTimer);
      discoveryExitTimer = self->_discoveryExitTimer;
    }
    self->_discoveryExitTimer = 0;

  }
  responseTimeoutTimer = self->_responseTimeoutTimer;
  if (responseTimeoutTimer)
  {
    source = self->_responseTimeoutTimer;
    if (dispatch_source_testcancel(responseTimeoutTimer))
    {
      v9 = (OS_dispatch_source *)source;
    }
    else
    {
      dispatch_source_cancel(source);
      v9 = self->_responseTimeoutTimer;
    }
    self->_responseTimeoutTimer = 0;

  }
}

- (void)activateSessionClient
{
  -[DSRapportDevice _activateSessionClientWithForceL2CAP:](self, "_activateSessionClientWithForceL2CAP:", 0);
}

- (void)addRequestToQueue:(id)a3
{
  DSRapportDevice *v4;
  NSMutableArray *pendingRequests;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  pendingRequests = v4->_pendingRequests;
  v6 = (void *)objc_msgSend(v7, "mutableCopy");
  -[NSMutableArray addObject:](pendingRequests, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)sendNextRequest
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_217E3C000, a2, OS_LOG_TYPE_ERROR, "[DSRapportDevice] Invalid request %@\n", (uint8_t *)&v2, 0xCu);
}

void __34__DSRapportDevice_sendNextRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 64));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v39 = v9;
    v12 = *((_QWORD *)WeakRetained + 5);
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dsLogger");
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v46 = v16;
        _os_log_impl(&dword_217E3C000, v14, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Cancelling Response Timer for requestID %@\n", buf, 0xCu);
      }

      v17 = *((_QWORD *)v11 + 5);
      v9 = v39;
      if (!dispatch_source_testcancel(v17))
      {
        dispatch_source_cancel(v17);
        v17 = *((_QWORD *)v11 + 5);
      }
      *((_QWORD *)v11 + 5) = 0;

      if (!v39)
        goto LABEL_23;
      objc_msgSend(v39, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("DSErrorDomain")))
      {

LABEL_23:
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        objc_msgSend(v11, "sendNextRequest");
        goto LABEL_24;
      }
      v29 = v11[25];

      if (v29)
        goto LABEL_23;
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dsLogger");
      v31 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E3C000, v31, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Retrying sendRequest on error\n", buf, 2u);
      }

      objc_msgSend(*((id *)v11 + 1), "invalidate");
      v32 = (void *)*((_QWORD *)v11 + 1);
      *((_QWORD *)v11 + 1) = 0;

      if (*(_QWORD *)(a1 + 40))
        v33 = *(void **)(a1 + 40);
      else
        v33 = (void *)MEMORY[0x24BDBD1B8];
      v34 = (void *)objc_msgSend(v33, "mutableCopy");
      objc_msgSend(v34, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("RapportRequestIDKey"));
      v35 = (void *)MEMORY[0x219A18818](*(_QWORD *)(a1 + 56));
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CFSTR("RapportRequestHandlerKey"));

      objc_msgSend(v34, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("RapportOptionsKey"));
      v36 = (void *)objc_msgSend(v34, "copy");
      objc_msgSend(v11, "addRequestToQueue:", v36);

      objc_msgSend(v11, "_forceBLEDiscoverytoSendRequestID");
    }
    else
    {
      v37 = v8;
      v38 = v7;
      if (v15)
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v46 = v19;
        _os_log_impl(&dword_217E3C000, v14, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Response Handler Timer invalidated for requestID %@\n", buf, 0xCu);
      }

      v20 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 9, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, v21);

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v22 = *((id *)v11 + 6);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v41 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("RapportRequestHandlerKey"));
            v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 9, 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, _QWORD, _QWORD, void *))v27)[2](v27, 0, 0, v28);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v24);
      }

      objc_msgSend(*((id *)v11 + 6), "removeAllObjects");
      v8 = v37;
      v7 = v38;
      v9 = v39;
    }
  }
LABEL_24:

}

- (void)_activateSessionClientWithForceL2CAP:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  RPCompanionLinkClient *v13;
  RPCompanionLinkClient *sessionClient;
  void *v15;
  NSObject *v16;
  void *v17;
  RPCompanionLinkClient *v18;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  _BYTE buf[24];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsLogger");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[DSRapportDevice rpDevice](self, "rpDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Creating a session client to device %@\n", buf, 0xCu);

  }
  if (self->_isTryingForceDiscovery)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dsLogger");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[DSRapportDevice rpDevice](self, "rpDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Session can't be activated, Trying a force discovery for %@\n", buf, 0xCu);

    }
LABEL_6:

    return;
  }
  if (self->_sessionClient)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dsLogger");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[DSRapportDevice rpDevice](self, "rpDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Session already exists for device %@\n", buf, 0xCu);

    }
    goto LABEL_6;
  }
  v13 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
  sessionClient = self->_sessionClient;
  self->_sessionClient = v13;

  -[RPCompanionLinkClient setDestinationDevice:](self->_sessionClient, "setDestinationDevice:", self->_rpDevice);
  -[RPCompanionLinkClient setControlFlags:](self->_sessionClient, "setControlFlags:", 14);
  if (v3)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dsLogger");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[DSRapportDevice rpDevice](self, "rpDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Forcing an L2CAP session for %@\n", buf, 0xCu);

    }
    -[RPCompanionLinkClient setControlFlags:](self->_sessionClient, "setControlFlags:", -[RPCompanionLinkClient controlFlags](self->_sessionClient, "controlFlags") | 0x100);
    self->_isSessionInForceL2CAP = 1;
  }
  -[RPCompanionLinkClient setDispatchQueue:](self->_sessionClient, "setDispatchQueue:", self->_queue);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v18 = self->_sessionClient;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__DSRapportDevice__activateSessionClientWithForceL2CAP___block_invoke;
  v19[3] = &unk_24D910E28;
  objc_copyWeak(&v20, (id *)buf);
  v21 = v3;
  -[RPCompanionLinkClient activateWithCompletion:](v18, "activateWithCompletion:", v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __56__DSRapportDevice__activateSessionClientWithForceL2CAP___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if (v3)
    {
      objc_msgSend(v5[1], "invalidate");
      v7 = v5[1];
      v5[1] = 0;

      *((_BYTE *)v5 + 25) = 0;
      if (*(_BYTE *)(a1 + 40))
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = v5[6];
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("RapportRequestHandlerKey"), (_QWORD)v18);
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = (void *)v13;
              if (v13)
                (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, 0, v3);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          }
          while (v10);
        }

        objc_msgSend(v5[6], "removeAllObjects");
      }
      else
      {
        objc_msgSend(v5, "_forceBLEDiscoverytoSendRequestID");
      }
    }
    else
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dsLogger");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "rpDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Activated session client to device %@\n", buf, 0xCu);

      }
      objc_msgSend(v5, "sendNextRequest");
    }
  }

}

- (void)_forceBLEDiscoverytoSendRequestID
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217E3C000, log, OS_LOG_TYPE_ERROR, "[DSRapportDevice] Screen off Discovery client already exists\n", v1, 2u);
}

void __52__DSRapportDevice__forceBLEDiscoverytoSendRequestID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  _BYTE *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[24])
    {
      objc_msgSend(WeakRetained, "rpDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "idsDeviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (v9)
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dsLogger");
        v11 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "model");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = v12;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_217E3C000, v11, OS_LOG_TYPE_DEFAULT, "Device discovered via BLEScreenOff Rapport Discovery: %@ %@\n", (uint8_t *)&v17, 0x16u);

        }
        if (*((_QWORD *)v5 + 4))
        {
          +[DSLogging sharedInstance](DSLogging, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dsLogger");
          v15 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v17 = 138412290;
            v18 = v3;
            _os_log_impl(&dword_217E3C000, v15, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Cancelling Discovery Timer for device %@\n", (uint8_t *)&v17, 0xCu);
          }

          v16 = *((_QWORD *)v5 + 4);
          if (!dispatch_source_testcancel(v16))
          {
            dispatch_source_cancel(v16);
            v16 = *((_QWORD *)v5 + 4);
          }
          *((_QWORD *)v5 + 4) = 0;

        }
        v5[24] = 0;
        objc_msgSend(v5, "_activateSessionClientWithForceL2CAP:", 1);
      }
    }
  }

}

void __52__DSRapportDevice__forceBLEDiscoverytoSendRequestID__block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(WeakRetained[2], "invalidate");
      v6 = v5[2];
      v5[2] = 0;

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = v5[6];
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "objectForKeyedSubscript:", CFSTR("RapportRequestHandlerKey"), (_QWORD)v14);
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v12;
            if (v12)
              (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v12 + 16))(v12, 0, 0, v3);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

      objc_msgSend(v5[6], "removeAllObjects");
    }
    else
    {
      objc_msgSend(WeakRetained, "_startDiscoveryExitTimer");
    }
  }

}

- (void)_startResponseTimeoutTimer
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  OS_dispatch_source *responseTimeoutTimer;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  uint8_t buf[8];

  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsLogger");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Starting Response Timeout Timer\n", buf, 2u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  v6 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 200000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__DSRapportDevice__startResponseTimeoutTimer__block_invoke;
  v10[3] = &unk_24D910E78;
  v7 = v5;
  v11 = v7;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_source_set_event_handler(v7, v10);
  responseTimeoutTimer = self->_responseTimeoutTimer;
  self->_responseTimeoutTimer = (OS_dispatch_source *)v7;
  v9 = v7;

  dispatch_resume((dispatch_object_t)self->_responseTimeoutTimer);
  objc_destroyWeak(&v12);

  objc_destroyWeak((id *)buf);
}

void __45__DSRapportDevice__startResponseTimeoutTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dsLogger");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "rpDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Timed out while waiting for a response from %@\n", (uint8_t *)&v10, 0xCu);

    }
    v6 = WeakRetained[5];
    WeakRetained[5] = 0;

    objc_msgSend(WeakRetained[1], "invalidate");
    v7 = WeakRetained[1];
    WeakRetained[1] = 0;

    *((_BYTE *)WeakRetained + 25) = 0;
    v8 = WeakRetained[2];
    if (v8)
    {
      objc_msgSend(v8, "invalidate");
      v9 = WeakRetained[2];
      WeakRetained[2] = 0;

    }
  }

}

- (void)_startDiscoveryExitTimer
{
  void *v3;
  NSObject *v4;
  NSObject *queue;
  DSRapportDevice *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  OS_dispatch_source *discoveryExitTimer;
  NSObject *v11;
  _QWORD handler[4];
  NSObject *v13;
  DSRapportDevice *v14;
  DSRapportDevice *v15;
  uint8_t buf[16];

  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsLogger");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Starting Discovery Timer\n", buf, 2u);
  }

  queue = self->_queue;
  v6 = self;
  v7 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, queue);
  v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __43__DSRapportDevice__startDiscoveryExitTimer__block_invoke;
  handler[3] = &unk_24D910EA0;
  v9 = v7;
  v13 = v9;
  v14 = v6;
  v15 = v6;
  dispatch_source_set_event_handler(v9, handler);
  discoveryExitTimer = v6->_discoveryExitTimer;
  v6->_discoveryExitTimer = (OS_dispatch_source *)v9;
  v11 = v9;

  dispatch_resume((dispatch_object_t)v6->_discoveryExitTimer);
}

void __43__DSRapportDevice__startDiscoveryExitTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (*(_BYTE *)(v2 + 24))
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dsLogger");
      v4 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "rpDevice");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Exit timer fired, stop force discovery for %@\n", buf, 0xCu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "invalidate");
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 16);
      *(_QWORD *)(v6 + 16) = 0;

      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 32);
      *(_QWORD *)(v8 + 32) = 0;

      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 0;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "objectForKeyedSubscript:", CFSTR("RapportRequestHandlerKey"), (_QWORD)v18);
            v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 8, 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, _QWORD, _QWORD, void *))v15)[2](v15, 0, 0, v16);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v12);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeAllObjects");
    }
    else
    {
      v17 = *(void **)(v2 + 32);
      *(_QWORD *)(v2 + 32) = 0;

    }
  }
}

- (RPCompanionLinkDevice)rpDevice
{
  return self->_rpDevice;
}

- (void)setRpDevice:(id)a3
{
  objc_storeStrong((id *)&self->_rpDevice, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rpDevice, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_responseTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_discoveryExitTimer, 0);
  objc_storeStrong((id *)&self->_screenOffDiscoveryClient, 0);
  objc_storeStrong((id *)&self->_sessionClient, 0);
}

@end
