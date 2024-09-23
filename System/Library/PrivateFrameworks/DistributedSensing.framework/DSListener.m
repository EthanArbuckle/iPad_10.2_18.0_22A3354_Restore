@implementation DSListener

- (DSListener)initWithDispatchQueue:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  void *v12;
  DSClientMotionDataOptions *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t v21[16];
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DSListener;
  v5 = -[DSListener init](&v22, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
      v7 = *((_QWORD *)v5 + 2);
      *((_QWORD *)v5 + 2) = v6;
    }
    else
    {
      v8 = (const char *)objc_msgSend(CFSTR("com.apple.distributedsensing.clientQueue"), "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create(v8, v9);
      v11 = (void *)*((_QWORD *)v5 + 2);
      *((_QWORD *)v5 + 2) = v10;

      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dsLogger");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "[DSListener] client queue created \n", v21, 2u);
      }
    }

    v13 = objc_alloc_init(DSClientMotionDataOptions);
    v14 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v13;

    v15 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = 0;

    v16 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = 0;

    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v17;

    *((_WORD *)v5 + 20) = 0;
    *((_BYTE *)v5 + 42) = 0;
    v19 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = 0;

    *((_DWORD *)v5 + 14) = 0;
    *((_DWORD *)v5 + 23) = 0;
    *((_QWORD *)v5 + 13) = 0;
    *((_QWORD *)v5 + 9) = 0;
    *((_QWORD *)v5 + 10) = 0;
    *((_QWORD *)v5 + 8) = 0;
    *((_BYTE *)v5 + 88) = 0;
  }

  return (DSListener *)v5;
}

- (NSArray)activeProviders
{
  DSListener *v2;
  NSMutableDictionary *providerDictionary;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  providerDictionary = v2->_providerDictionary;
  if (providerDictionary)
  {
    -[NSMutableDictionary allValues](providerDictionary, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)startMotionDataListenerWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  RPCompanionLinkClient *v10;
  RPCompanionLinkClient *discoveryClient;
  uint64_t v12;
  RPCompanionLinkClient *v13;
  RPCompanionLinkClient *v14;
  RPCompanionLinkClient *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[8];
  uint64_t v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsLogger");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "[DSListener] Starting Motion Data Listener\n", buf, 2u);
  }

  -[DSClientMotionDataOptions setDataSubType:](self->_motionDataOptions, "setDataSubType:", objc_msgSend(v4, "dataSubType"));
  -[DSClientMotionDataOptions setDeviceType:](self->_motionDataOptions, "setDeviceType:", objc_msgSend(v4, "deviceType"));
  if (self->_discoveryClient)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30[0] = CFSTR("Listener Discovery companion link already exists");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSListener failedToStartListenerWithError:](self, "failedToStartListenerWithError:", v9);
  }
  else
  {
    v10 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v10;

    -[RPCompanionLinkClient setControlFlags:](self->_discoveryClient, "setControlFlags:", 14);
    -[RPCompanionLinkClient setDispatchQueue:](self->_discoveryClient, "setDispatchQueue:", self->_queue);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v12 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke;
    v26[3] = &unk_24D910AD0;
    objc_copyWeak(&v27, (id *)buf);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_discoveryClient, "setInvalidationHandler:", v26);
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_43;
    v24[3] = &unk_24D910AF8;
    objc_copyWeak(&v25, (id *)buf);
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_discoveryClient, "setDeviceFoundHandler:", v24);
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_2;
    v22[3] = &unk_24D910AF8;
    objc_copyWeak(&v23, (id *)buf);
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_discoveryClient, "setDeviceLostHandler:", v22);
    v13 = self->_discoveryClient;
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_3;
    v20[3] = &unk_24D910B20;
    objc_copyWeak(&v21, (id *)buf);
    -[RPCompanionLinkClient registerRequestID:options:handler:](v13, "registerRequestID:options:handler:", CFSTR("com.apple.distributedsensing.heartbeatRequest"), 0, v20);
    v14 = self->_discoveryClient;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_4;
    v18[3] = &unk_24D910B20;
    objc_copyWeak(&v19, (id *)buf);
    -[RPCompanionLinkClient registerRequestID:options:handler:](v14, "registerRequestID:options:handler:", CFSTR("com.apple.distributedsensing.dataRequest"), 0, v18);
    v15 = self->_discoveryClient;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_5;
    v16[3] = &unk_24D910E50;
    objc_copyWeak(&v17, (id *)buf);
    -[RPCompanionLinkClient activateWithCompletion:](v15, "activateWithCompletion:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }

}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dsLogger");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "[DSListener] discovery companion link invalidated\n", v4, 2u);
    }

  }
}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_43(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_didFindDevice:", v5);

}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_didLoseDevice:", v5);

}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_rapportReceivedHeartbeatRequest:options:responseHandler:", v11, v7, v8);

}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_rapportReceivedDataRequest:options:responseHandler:", v11, v7, v8);

}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dsLogger");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "[DSListener] discovery link activation error\n", buf, 2u);
      }

      objc_msgSend(v5, "failedToStartListenerWithError:", v3);
    }
    else
    {
      objc_msgSend(WeakRetained, "_startCASessionMetricCollection");
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dsLogger");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_DEFAULT, "[DSListener] Activated discovery link for discovering providers.\n", v10, 2u);
      }

      objc_msgSend(v5, "startedListener");
    }
  }

}

- (void)stopMotionDataListener
{
  void *v3;
  NSObject *v4;
  NSObject *queue;
  DSListener *v6;
  _QWORD block[5];
  uint8_t buf[16];

  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsLogger");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSListener] Stopping Motion Data Listener\n", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__DSListener_stopMotionDataListener__block_invoke;
  block[3] = &unk_24D9109C0;
  block[4] = self;
  v6 = self;
  dispatch_async(queue, block);

}

uint64_t __36__DSListener_stopMotionDataListener__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 41);
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsLogger");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSListener] Unsubscribing from Motion Data\n", v7, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_unsubscribeToMotionData");
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSListener] No active subscription during stop\n", buf, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_stopListener");
  }
}

- (void)_rapportReceivedHeartbeatRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  DSProviderDevice *currentProvider;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dsLogger");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_217E3C000, v10, OS_LOG_TYPE_DEFAULT, "[DSListener] received heartbeat request\n", (uint8_t *)&v24, 2u);
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dsLogger");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_217E3C000, v22, OS_LOG_TYPE_DEFAULT, "[DSListener] No sender ID\n", (uint8_t *)&v24, 2u);
    }
    goto LABEL_18;
  }
  if (self->_isStopCalled)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dsLogger");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v11;
      _os_log_impl(&dword_217E3C000, v13, OS_LOG_TYPE_DEFAULT, "[DSListener] Rejecting heartbeat request from sender %@ while stop was pending\n", (uint8_t *)&v24, 0xCu);
    }

  }
  currentProvider = self->_currentProvider;
  if (!currentProvider
    || (-[DSRapportDevice rpDevice](currentProvider, "rpDevice"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "identifier"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqualToString:", v11),
        v16,
        v15,
        !v17))
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dsLogger");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v11;
      _os_log_impl(&dword_217E3C000, v21, OS_LOG_TYPE_DEFAULT, "[DSListener] Rejecting heartbeat request from sender %@\n", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, NSObject *))v7 + 2))(v7, 0, 0, v22);
LABEL_18:

    goto LABEL_19;
  }
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dsLogger");
  v19 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v11;
    _os_log_impl(&dword_217E3C000, v19, OS_LOG_TYPE_DEFAULT, "[DSListener] Heartbeat request received from provider %@\n", (uint8_t *)&v24, 0xCu);
  }

  ++self->_numHeartbeats;
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
LABEL_19:

}

- (void)_rapportReceivedDataRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dsLogger");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "[DSListener] received data request\n", (uint8_t *)&v25, 2u);
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    if (!v8)
      goto LABEL_12;
  }
  else
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
    if (!v8)
    {
LABEL_12:
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dsLogger");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412290;
        v26 = v13;
        _os_log_impl(&dword_217E3C000, v24, OS_LOG_TYPE_DEFAULT, "[DSListener] Rejecting data request from sender %@\n", (uint8_t *)&v25, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v22;
      goto LABEL_15;
    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("payloadKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_12;
  -[DSListener _findProviderWithIdentifier:](self, "_findProviderWithIdentifier:", v13);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_12;
  v17 = (void *)v16;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dsLogger");
  v19 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v17, "rpDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v20;
    _os_log_impl(&dword_217E3C000, v19, OS_LOG_TYPE_DEFAULT, "[DSListener] Received data from provider %@\n", (uint8_t *)&v25, 0xCu);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("payloadKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSListener _receivedData:fromProvider:](self, "_receivedData:fromProvider:", v21, v17);

  v22 = 0;
LABEL_15:
  (*((void (**)(id, _QWORD, _QWORD, uint64_t))v10 + 2))(v10, 0, 0, v22);

}

- (void)_didFindDevice:(id)a3
{
  id v4;
  void *v5;
  DSListener *v6;
  const char *v7;
  NSObject *p_super;
  uint32_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  NSMutableDictionary *providerDictionary;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  DSListener *v25;
  void *v26;
  DSProviderDevice *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isStopCalled)
  {
    objc_msgSend(v4, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v4, "idsDeviceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v4, "model");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13
            || (objc_msgSend(v4, "model"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "containsString:", CFSTR("iPhone")),
                v14,
                v13,
                (v15 & 1) != 0))
          {
            +[DSLogging sharedInstance](DSLogging, "sharedInstance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "dsLogger");
            v17 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v31 = 138412290;
              v32 = v4;
              _os_log_impl(&dword_217E3C000, v17, OS_LOG_TYPE_DEFAULT, "[DSListener] device %@ found\n", (uint8_t *)&v31, 0xCu);
            }

            v6 = self;
            objc_sync_enter(v6);
            providerDictionary = v6->_providerDictionary;
            objc_msgSend(v4, "idsDeviceIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](providerDictionary, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              +[DSLogging sharedInstance](DSLogging, "sharedInstance");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "dsLogger");
              v22 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v31 = 138412290;
                v32 = v4;
                _os_log_impl(&dword_217E3C000, v22, OS_LOG_TYPE_DEFAULT, "[DSListener] Skipping provider %@, already being tracked\n", (uint8_t *)&v31, 0xCu);
              }

              objc_sync_exit(v6);
            }
            else
            {
              v25 = (DSListener *)objc_alloc_init(MEMORY[0x24BE7CBF8]);
              objc_msgSend(v4, "idsDeviceIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[DSListener setIdentifier:](v25, "setIdentifier:", v26);

              v27 = -[DSProviderDevice initWithRapportDevice:queue:]([DSProviderDevice alloc], "initWithRapportDevice:queue:", v25, self->_queue);
              v28 = v6->_providerDictionary;
              -[DSListener identifier](v25, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setValue:forKey:](v28, "setValue:forKey:", v27, v29);

              objc_sync_exit(v6);
              if (!v6->_currentProvider)
                -[DSListener _updateCurrentProvider:](v6, "_updateCurrentProvider:", v27);
              -[DSListener activeProviders](v6, "activeProviders");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[DSListener updateProviders:](v6, "updateProviders:", v30);

              v6 = v25;
            }
            goto LABEL_20;
          }
          +[DSLogging sharedInstance](DSLogging, "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "dsLogger");
          v6 = (DSListener *)objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
            goto LABEL_20;
          v31 = 138412290;
          v32 = v4;
          v7 = "[DSListener] Skipping incompatible RPCompanionLinkDevice: %@\n";
LABEL_18:
          p_super = &v6->super;
          v9 = 12;
          goto LABEL_19;
        }
      }
      else
      {

      }
    }
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dsLogger");
    v6 = (DSListener *)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v31 = 138412290;
    v32 = v4;
    v7 = "[DSListener] device %@ missing details, skipping\n";
    goto LABEL_18;
  }
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsLogger");
  v6 = (DSListener *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    v7 = "[DSListener] Did find device, but stop was called, returning\n";
    p_super = &v6->super;
    v9 = 2;
LABEL_19:
    _os_log_impl(&dword_217E3C000, p_super, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v31, v9);
  }
LABEL_20:

}

- (void)_didLoseDevice:(id)a3
{
  id v4;
  DSListener *v5;
  NSMutableDictionary *providerDictionary;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  DSProviderDevice *currentProvider;
  NSMutableDictionary *v22;
  uint64_t v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_isStopCalled)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    v5 = self;
    objc_sync_enter(v5);
    providerDictionary = v5->_providerDictionary;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](providerDictionary, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (!objc_msgSend(v8, "isResponsePending"))
      {
        v11 = v5->_providerDictionary;
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

        -[DSRapportDevice rpDevice](v5->_currentProvider, "rpDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "rpDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isEqualToString:", v16);

        if (v17)
        {
          +[DSLogging sharedInstance](DSLogging, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dsLogger");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            -[DSRapportDevice rpDevice](v5->_currentProvider, "rpDevice");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v32 = v20;
            _os_log_impl(&dword_217E3C000, v19, OS_LOG_TYPE_DEFAULT, "[DSListener] Current provider lost %@\n", buf, 0xCu);

          }
          currentProvider = v5->_currentProvider;
          v5->_currentProvider = 0;

          ++v5->_activeProviderLostCount;
          if (!v5->_isTestMode)
            -[DSCoreAnalyticsEventHandler dsProviderUnavailable](v5->_caEventHandler, "dsProviderUnavailable");
          v22 = v5->_providerDictionary;
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __29__DSListener__didLoseDevice___block_invoke;
          v24[3] = &unk_24D910F30;
          v24[4] = &v25;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v24);
        }
        objc_sync_exit(v5);

        if (v26[5])
          -[DSListener _updateCurrentProvider:](v5, "_updateCurrentProvider:");
        -[DSListener activeProviders](v5, "activeProviders");
        v23 = objc_claimAutoreleasedReturnValue();
        -[DSListener updateProviders:](v5, "updateProviders:", v23);
        v5 = (DSListener *)v23;
        goto LABEL_17;
      }
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dsLogger");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v4;
        _os_log_impl(&dword_217E3C000, v10, OS_LOG_TYPE_DEFAULT, "[DSListener] device %@ lost but response was pending\n", buf, 0xCu);
      }

    }
    objc_sync_exit(v5);
LABEL_17:

    _Block_object_dispose(&v25, 8);
  }

}

void __29__DSListener__didLoseDevice___block_invoke(uint64_t a1, int a2, id obj, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  *a4 = 1;
}

- (id)_findProviderWithIdentifier:(id)a3
{
  id v4;
  DSListener *v5;
  NSMutableDictionary *providerDictionary;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v5 = self;
  objc_sync_enter(v5);
  providerDictionary = v5->_providerDictionary;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__DSListener__findProviderWithIdentifier___block_invoke;
  v10[3] = &unk_24D910F58;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](providerDictionary, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_sync_exit(v5);
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __42__DSListener__findProviderWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "rpDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)_updateCurrentProvider:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dsLogger");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "rpDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "[DSListener] Updating new provider %@\n", (uint8_t *)&v15, 0xCu);

  }
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dsLogger");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "rpDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_217E3C000, v10, OS_LOG_TYPE_DEFAULT, "[DSListener] Current Provider = %@\n", (uint8_t *)&v15, 0xCu);

    }
    objc_storeStrong((id *)&self->_currentProvider, a3);
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dsLogger");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "rpDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_217E3C000, v13, OS_LOG_TYPE_DEFAULT, "[DSListener] Sending Subscription request to Provider = %@\n", (uint8_t *)&v15, 0xCu);

    }
    -[DSListener _subscribeToMotionData](self, "_subscribeToMotionData");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DSListener _updateCurrentProvider:].cold.1(v10);

  }
}

- (void)_subscribeToMotionData
{
  void *v3;
  void *v4;
  DSListener *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  NSObject *v10;
  DSListener *v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  DSProviderDevice *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  if (self->_currentProvider)
  {
    v20[0] = CFSTR("1.0");
    v19[0] = CFSTR("dsVersionKey");
    v19[1] = CFSTR("dataSubTypeKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[DSClientMotionDataOptions dataSubType](self->_motionDataOptions, "dataSubType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v3;
    v19[2] = CFSTR("requestType");
    v19[3] = CFSTR("subscriptionStart");
    v20[2] = &unk_24D915880;
    v20[3] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = (DSProviderDevice *)0xAAAAAAAAAAAAAAAALL;
    v18 = self->_currentProvider;
    objc_msgSend(*((id *)v14 + 5), "setIsResponsePending:", 1);
    v5 = self;
    v6 = *((_QWORD *)v14 + 5);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __36__DSListener__subscribeToMotionData__block_invoke;
    v9[3] = &unk_24D910F80;
    v9[4] = v5;
    v12 = buf;
    v7 = v4;
    v10 = v7;
    v11 = v5;
    -[DSListener _sendRequestID:request:device:options:responseHandler:](v5, "_sendRequestID:request:device:options:responseHandler:", CFSTR("com.apple.distributedsensing.subscriptionRequest"), v7, v6, 0, v9);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dsLogger");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "[DSListener] Trying to subscribe while there's no active provider\n", buf, 2u);
    }
  }

}

void __36__DSListener__subscribeToMotionData__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unsigned int Int64Ranged;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a1[4];
  if (!v10 || !*(_QWORD *)(v10 + 24))
    goto LABEL_22;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setIsResponsePending:", 0);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v12 = Int64Ranged;
  v13 = a1[4];
  if (*(_BYTE *)(v13 + 42))
  {
    if (v9)
    {
LABEL_5:
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dsLogger");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)a1[5];
        objc_msgSend(*(id *)(a1[4] + 24), "rpDevice");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v12 > 0xB)
          v19 = "?";
        else
          v19 = off_24D911008[v12];
        v34 = 138412802;
        v35 = v16;
        v36 = 2112;
        v37 = v17;
        v38 = 2080;
        v39 = v19;
        _os_log_impl(&dword_217E3C000, v15, OS_LOG_TYPE_DEFAULT, "[DSListener] Send Subscription Start Request %@ to device %@ failed over data link: %s\n", (uint8_t *)&v34, 0x20u);

      }
      v31 = (id *)a1[4];
      objc_msgSend(v31[3], "rpDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_didLoseDevice:", v32);

      v33 = a1[4];
      if (*(_BYTE *)(v33 + 42))
        objc_msgSend(*(id *)(v33 + 48), "dsFirstListenerSessionSetUnsuccessful");
      goto LABEL_22;
    }
  }
  else
  {
    *(_BYTE *)(v13 + 42) = 1;
    *(_DWORD *)(a1[4] + 56) = Int64Ranged;
    if (v9)
      goto LABEL_5;
  }
  v20 = a1[4];
  if (!*(_BYTE *)(v20 + 88))
    objc_msgSend(*(id *)(v20 + 48), "dsProviderAvailable");
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dsLogger");
  v22 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)a1[5];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "rpDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138412546;
    v35 = v23;
    v36 = 2112;
    v37 = (uint64_t)v24;
    _os_log_impl(&dword_217E3C000, v22, OS_LOG_TYPE_DEFAULT, "[DSListener] Sent Subscription Start Request %@ to device %@\n", (uint8_t *)&v34, 0x16u);

  }
  *(_BYTE *)(a1[4] + 41) = 1;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("payloadKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dsLogger");
      v27 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "rpDevice");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138412290;
        v35 = v28;
        _os_log_impl(&dword_217E3C000, v27, OS_LOG_TYPE_DEFAULT, "[DSListener] Received data with subscription response from provider %@\n", (uint8_t *)&v34, 0xCu);

      }
      v29 = (void *)a1[6];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("payloadKey"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_receivedData:fromProvider:", v30, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

    }
  }
LABEL_22:

}

- (void)_unsubscribeToMotionData
{
  void *v3;
  DSClientMotionDataOptions *motionDataOptions;
  DSListener *v5;
  void *v6;
  void *v7;
  DSProviderDevice *currentProvider;
  id v9;
  DSListener *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[8];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  if (self->_currentProvider)
  {
    v17[0] = CFSTR("1.0");
    v16[0] = CFSTR("dsVersionKey");
    v16[1] = CFSTR("dataSubTypeKey");
    v3 = (void *)MEMORY[0x24BDD16E0];
    motionDataOptions = self->_motionDataOptions;
    v5 = self;
    objc_msgSend(v3, "numberWithUnsignedInt:", -[DSClientMotionDataOptions dataSubType](motionDataOptions, "dataSubType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    v17[2] = &unk_24D915880;
    v16[2] = CFSTR("requestType");
    v16[3] = CFSTR("subscriptionStart");
    v17[3] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSProviderDevice setIsResponsePending:](self->_currentProvider, "setIsResponsePending:", 1);
    currentProvider = self->_currentProvider;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __38__DSListener__unsubscribeToMotionData__block_invoke;
    v13[3] = &unk_24D910FA8;
    v13[4] = v5;
    v14 = v7;
    v9 = v7;
    -[DSListener _sendRequestID:request:device:options:responseHandler:](v5, "_sendRequestID:request:device:options:responseHandler:", CFSTR("com.apple.distributedsensing.subscriptionRequest"), v9, currentProvider, 0, v13);

  }
  else
  {
    v10 = self;
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dsLogger");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "[DSListener] No active provider during unsubscribe\n", buf, 2u);
    }

    -[DSListener _stopListener](v10, "_stopListener");
  }

}

uint64_t __38__DSListener__unsubscribeToMotionData__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int Int64Ranged;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  _BYTE v19[24];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(result + 32))
    return result;
  v5 = result;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dsLogger");
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(v5 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 24), "rpDevice");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (Int64Ranged > 0xB)
        v13 = "?";
      else
        v13 = off_24D911008[Int64Ranged];
      *(_DWORD *)v19 = 138412802;
      *(_QWORD *)&v19[4] = v10;
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = v11;
      *(_WORD *)&v19[22] = 2080;
      v20 = v13;
      v15 = "[DSListener] Send Subscription Stop Request %@ to device %@ failed over data link: %s\n";
      v16 = v8;
      v17 = 32;
      goto LABEL_10;
    }
  }
  else if (v9)
  {
    v14 = *(_QWORD *)(v5 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 24), "rpDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v19 = 138412546;
    *(_QWORD *)&v19[4] = v14;
    *(_WORD *)&v19[12] = 2112;
    *(_QWORD *)&v19[14] = v12;
    v15 = "[DSListener] Sent Stop Subscription Request %@ to device %@\n";
    v16 = v8;
    v17 = 22;
LABEL_10:
    _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, v15, v19, v17);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 24), "setIsResponsePending:", 0);
  v18 = *(_QWORD *)(v5 + 32);
  if (!*(_BYTE *)(v18 + 88))
  {
    objc_msgSend(*(id *)(v18 + 48), "dsProviderUnavailable");
    v18 = *(_QWORD *)(v5 + 32);
  }
  return objc_msgSend((id)v18, "_stopListener", *(_OWORD *)v19, *(_QWORD *)&v19[16], v20);
}

- (void)_stopListener
{
  DSListener *v3;
  DSProviderDevice *currentProvider;
  RPCompanionLinkClient *discoveryClient;
  DSCoreAnalyticsEventHandler *caEventHandler;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  -[RPCompanionLinkClient deregisterRequestID:](self->_discoveryClient, "deregisterRequestID:", CFSTR("com.apple.distributedsensing.dataRequest"));
  -[RPCompanionLinkClient deregisterRequestID:](self->_discoveryClient, "deregisterRequestID:", CFSTR("com.apple.distributedsensing.heartbeatRequest"));
  v3 = self;
  objc_sync_enter(v3);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3->_providerDictionary, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8);
  -[NSMutableDictionary removeAllObjects](v3->_providerDictionary, "removeAllObjects");
  objc_sync_exit(v3);

  currentProvider = v3->_currentProvider;
  v3->_currentProvider = 0;

  -[DSClientMotionDataOptions setDataSubType:](v3->_motionDataOptions, "setDataSubType:", 0);
  -[DSClientMotionDataOptions setDeviceType:](v3->_motionDataOptions, "setDeviceType:", 0);
  -[RPCompanionLinkClient invalidate](self->_discoveryClient, "invalidate");
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = 0;

  *(_WORD *)&v3->_isStopCalled = 0;
  v3->_isFirstSubscription = 0;
  -[DSListener _stopCASessionMetricCollection](v3, "_stopCASessionMetricCollection");
  caEventHandler = v3->_caEventHandler;
  v3->_caEventHandler = 0;

  v3->_firstSubscriptionDataLinkType = 0;
  v3->_numMotionStateMessages = 0;
  v3->_activeProviderLostCount = 0;
  v3->_numHeartbeats = 0;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dsLogger");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "[DSListener] Stopped\n", v9, 2u);
  }

  -[DSListener stoppedListener](v3, "stoppedListener");
}

uint64_t __27__DSListener__stopListener__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)_sendRequestID:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  if (a4)
    v10 = a4;
  else
    v10 = (id)MEMORY[0x24BDBD1B8];
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v17 = (id)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("RapportRequestIDKey"));

  v15 = (void *)MEMORY[0x219A18818](v11);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("RapportRequestHandlerKey"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("RapportOptionsKey"));
  v16 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v13, "addRequestToQueue:", v16);

  objc_msgSend(v13, "activateSessionClient");
}

- (void)_receivedData:(id)a3 fromProvider:(id)a4
{
  ++self->_numMotionStateMessages;
  -[DSListener receivedData:fromProvider:](self, "receivedData:fromProvider:", a3, a4);
}

- (void)_startCASessionMetricCollection
{
  void *v2;
  NSObject *v3;
  const char *v4;
  void *v6;
  DSCoreAnalyticsEventHandler *v7;
  DSCoreAnalyticsEventHandler *caEventHandler;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  DSListener *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (self->_isTestMode)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dsLogger");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "[DSListener] Skipping core analytics event init\n";
LABEL_7:
      _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    }
  }
  else if (self->_caEventHandler)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dsLogger");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "[DSListener] Core analytics event handler already exists\n";
      goto LABEL_7;
    }
  }
  else
  {
    v7 = objc_alloc_init(DSCoreAnalyticsEventHandler);
    caEventHandler = self->_caEventHandler;
    self->_caEventHandler = v7;

    if (!self->_caEventHandler)
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dsLogger");
      v3 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      *(_WORD *)buf = 0;
      v4 = "[DSListener] Core analytics event handler not initialized\n";
      goto LABEL_7;
    }
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = self;
    -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v14, "model");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            objc_msgSend(v14, "model");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "containsString:", CFSTR("iPhone"));

            if (v18)
            {
              objc_msgSend(v14, "idsDeviceIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
              {
                objc_msgSend(v14, "idsDeviceIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKey:](v3, "setObject:forKey:", v14, v21);

              }
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v11);
    }

    -[DSCoreAnalyticsEventHandler dsSessionStartedWithDeviceRole:numPotentialProviders:unterminatedSession:](v23->_caEventHandler, "dsSessionStartedWithDeviceRole:numPotentialProviders:unterminatedSession:", 2, -[NSObject count](v3, "count"), 0);
  }
LABEL_8:

}

- (void)_stopCASessionMetricCollection
{
  DSCoreAnalyticsEventHandler *caEventHandler;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (!self->_isTestMode)
  {
    caEventHandler = self->_caEventHandler;
    if (caEventHandler)
    {
      if (!self->_isSubscriptionActive)
      {
        -[DSCoreAnalyticsEventHandler dsFirstListenerSessionSetUnsuccessful](caEventHandler, "dsFirstListenerSessionSetUnsuccessful");
        caEventHandler = self->_caEventHandler;
      }
      -[DSCoreAnalyticsEventHandler dsSessionCompletedWithStopReason:numHeartbeats:numMotionStateMessages:activeProviderLostCount:dataLinkType:maxListenerClients:avgListenerStartInterval:](caEventHandler, "dsSessionCompletedWithStopReason:numHeartbeats:numMotionStateMessages:activeProviderLostCount:dataLinkType:maxListenerClients:avgListenerStartInterval:", 0, self->_numHeartbeats, self->_numMotionStateMessages, self->_activeProviderLostCount, self->_firstSubscriptionDataLinkType, self->_maxListenerClients, self->_avgListenerStartInterval);
    }
    else
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dsLogger");
      v5 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_DEFAULT, "[DSListener] Core analytics event handler not initialized\n", v6, 2u);
      }

    }
  }
}

- (BOOL)isTestMode
{
  return self->_isTestMode;
}

- (void)setIsTestMode:(BOOL)a3
{
  self->_isTestMode = a3;
}

- (DSClientMotionDataOptions)motionDataOptions
{
  return self->_motionDataOptions;
}

- (void)setMotionDataOptions:(id)a3
{
  objc_storeStrong((id *)&self->_motionDataOptions, a3);
}

- (unsigned)maxListenerClients
{
  return self->_maxListenerClients;
}

- (void)setMaxListenerClients:(unsigned int)a3
{
  self->_maxListenerClients = a3;
}

- (double)avgListenerStartInterval
{
  return self->_avgListenerStartInterval;
}

- (void)setAvgListenerStartInterval:(double)a3
{
  self->_avgListenerStartInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDataOptions, 0);
  objc_storeStrong((id *)&self->_caEventHandler, 0);
  objc_storeStrong((id *)&self->_providerDictionary, 0);
  objc_storeStrong((id *)&self->_currentProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
}

- (void)_updateCurrentProvider:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217E3C000, log, OS_LOG_TYPE_ERROR, "[DSListener] Trying to update current provider with invalid object\n", v1, 2u);
}

@end
