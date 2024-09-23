@implementation DSProvider

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "[DSProvider] companion link invalidated\n", v4, 2u);
    }

  }
}

- (DSProvider)initWithDispatchQueue:(id)a3
{
  id v4;
  char *v5;
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
  void *v17;
  void *v18;
  void *v19;
  uint8_t v21[16];
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DSProvider;
  v5 = -[DSProvider init](&v22, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
      v7 = *((_QWORD *)v5 + 1);
      *((_QWORD *)v5 + 1) = v6;
    }
    else
    {
      v8 = (const char *)objc_msgSend(CFSTR("com.apple.distributedsensing.clientQueue"), "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create(v8, v9);
      v11 = (void *)*((_QWORD *)v5 + 1);
      *((_QWORD *)v5 + 1) = v10;

      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dsLogger");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "[DSProvider] client queue created \n", v21, 2u);
      }
    }

    v13 = objc_alloc_init(DSClientMotionDataOptions);
    v14 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v13;

    v15 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = 0;

    v16 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = 0;

    v17 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = 0;

    v5[56] = 0;
    v18 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = 0;

    v5[72] = 0;
    v5[110] = 0;
    v19 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = 0;

    *((_QWORD *)v5 + 11) = 0;
    *((_QWORD *)v5 + 12) = 0;
    *(_QWORD *)(v5 + 102) = 0;
  }

  return (DSProvider *)v5;
}

- (void)startMotionDataProviderWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  RPCompanionLinkClient *v25;
  RPCompanionLinkClient *linkClient;
  uint64_t v27;
  RPCompanionLinkClient *v28;
  void *v29;
  NSObject *v30;
  RPCompanionLinkClient *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t v35[16];
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[8];
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsLogger");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] starting motion data provider\n", buf, 2u);
  }

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (notify_register_check("com.apple.springboard.hasBlankedScreen", &self->_screenStateToken))
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v51 = *MEMORY[0x24BDD0FC8];
      v52 = CFSTR("Couldn't register for device screen state");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 5, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[DSProvider failedToStartProviderWithOptions:error:](self, "failedToStartProviderWithOptions:error:", v4, v9);
    }
    else
    {
      v13 = objc_msgSend(v4, "deviceType");
      v14 = objc_msgSend(v4, "dataSubType");
      if ((v13 & 2) != 0)
      {
        v19 = (void *)MEMORY[0x24BDD1540];
        v49 = *MEMORY[0x24BDD0FC8];
        v50 = CFSTR("Unrelated devices not supported");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 5, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[DSProvider failedToStartProviderWithOptions:error:](self, "failedToStartProviderWithOptions:error:", v4, v21);
      }
      else
      {
        v15 = v14;
        if ((v13 & 1) != 0)
          -[DSClientMotionDataOptions setDeviceType:](self->_motionDataOptions, "setDeviceType:", -[DSClientMotionDataOptions deviceType](self->_motionDataOptions, "deviceType") | 1);
        if ((v15 & 1) != 0)
          -[DSClientMotionDataOptions setDataSubType:](self->_motionDataOptions, "setDataSubType:", -[DSClientMotionDataOptions dataSubType](self->_motionDataOptions, "dataSubType") | 1);
        if (-[DSClientMotionDataOptions dataSubType](self->_motionDataOptions, "dataSubType")
          && -[DSClientMotionDataOptions deviceType](self->_motionDataOptions, "deviceType"))
        {
          if (self->_linkClient)
          {
            v16 = (void *)MEMORY[0x24BDD1540];
            v45 = *MEMORY[0x24BDD0FC8];
            v46 = CFSTR("Provider companion link already exists");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 7, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            -[DSProvider failedToStartProviderWithOptions:error:](self, "failedToStartProviderWithOptions:error:", v4, v18);
          }
          else
          {
            v25 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
            linkClient = self->_linkClient;
            self->_linkClient = v25;

            -[RPCompanionLinkClient setControlFlags:](self->_linkClient, "setControlFlags:", 14);
            -[RPCompanionLinkClient setDispatchQueue:](self->_linkClient, "setDispatchQueue:", self->_clientQueue);
            *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
            objc_initWeak((id *)buf, self);
            v27 = MEMORY[0x24BDAC760];
            v42[0] = MEMORY[0x24BDAC760];
            v42[1] = 3221225472;
            v42[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke;
            v42[3] = &unk_24D910AD0;
            objc_copyWeak(&v43, (id *)buf);
            -[RPCompanionLinkClient setInvalidationHandler:](self->_linkClient, "setInvalidationHandler:", v42);
            v40[0] = v27;
            v40[1] = 3221225472;
            v40[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_51;
            v40[3] = &unk_24D910AF8;
            objc_copyWeak(&v41, (id *)buf);
            -[RPCompanionLinkClient setDeviceFoundHandler:](self->_linkClient, "setDeviceFoundHandler:", v40);
            v38[0] = v27;
            v38[1] = 3221225472;
            v38[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_2;
            v38[3] = &unk_24D910AF8;
            objc_copyWeak(&v39, (id *)buf);
            -[RPCompanionLinkClient setDeviceLostHandler:](self->_linkClient, "setDeviceLostHandler:", v38);
            v28 = self->_linkClient;
            v36[0] = v27;
            v36[1] = 3221225472;
            v36[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_3;
            v36[3] = &unk_24D910B20;
            objc_copyWeak(&v37, (id *)buf);
            -[RPCompanionLinkClient registerRequestID:options:handler:](v28, "registerRequestID:options:handler:", CFSTR("com.apple.distributedsensing.subscriptionRequest"), 0, v36);
            +[DSLogging sharedInstance](DSLogging, "sharedInstance");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "dsLogger");
            v30 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v35 = 0;
              _os_log_impl(&dword_217E3C000, v30, OS_LOG_TYPE_DEFAULT, "[DSProvider] activating CompanionLink\n", v35, 2u);
            }

            v31 = self->_linkClient;
            v32[0] = v27;
            v32[1] = 3221225472;
            v32[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_54;
            v32[3] = &unk_24D910B48;
            objc_copyWeak(&v34, (id *)buf);
            v33 = v4;
            -[RPCompanionLinkClient activateWithCompletion:](v31, "activateWithCompletion:", v32);

            objc_destroyWeak(&v34);
            objc_destroyWeak(&v37);
            objc_destroyWeak(&v39);
            objc_destroyWeak(&v41);
            objc_destroyWeak(&v43);
            objc_destroyWeak((id *)buf);
          }
        }
        else
        {
          v22 = (void *)MEMORY[0x24BDD1540];
          v47 = *MEMORY[0x24BDD0FC8];
          v48 = CFSTR("Invalid options");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 2, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[DSProvider failedToStartProviderWithOptions:error:](self, "failedToStartProviderWithOptions:error:", v4, v24);
        }
      }
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v53 = *MEMORY[0x24BDD0FC8];
    v54[0] = CFSTR("Unsupported feature");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSProvider failedToStartProviderWithOptions:error:](self, "failedToStartProviderWithOptions:error:", v4, v12);
  }

}

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_51(uint64_t a1, void *a2)
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

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_2(uint64_t a1, void *a2)
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

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
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
    objc_msgSend(WeakRetained, "_receivedDataRequest:options:responseHandler:", v11, v7, v8);

}

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dsLogger");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v7)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] link activation failed\n", (uint8_t *)&v11, 2u);
      }

      objc_msgSend(WeakRetained, "failedToStartProviderWithOptions:error:", *(_QWORD *)(a1 + 32), v3);
    }
    else
    {
      if (v7)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] companion link activated\n", (uint8_t *)&v11, 2u);
      }

      objc_msgSend(WeakRetained, "startedProviderWithOptions:", WeakRetained[3]);
      objc_msgSend(WeakRetained, "_unPersistListenerState");
      if (WeakRetained[4])
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dsLogger");
        v9 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained[4], "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412290;
          v12 = v10;
          _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_DEFAULT, "[DSProvider] START data subscription to listener %@\n", (uint8_t *)&v11, 0xCu);

        }
        objc_msgSend(WeakRetained, "subscribedToMotionDataWithOptions:", WeakRetained[3]);
      }
    }
  }

}

- (void)sendMotionData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *clientQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[8];

  v4 = a3;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsLogger");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] Sending motion Data\n", buf, 2u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  clientQueue = self->_clientQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __29__DSProvider_sendMotionData___block_invoke;
  v9[3] = &unk_24D910B70;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(clientQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __29__DSProvider_sendMotionData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_sendMotionData:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)stopMotionDataProvider
{
  void *v3;
  NSObject *v4;
  NSObject *clientQueue;
  DSProvider *v6;
  _QWORD block[5];
  uint8_t buf[16];

  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsLogger");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSProvider] Stopping motion data provider\n", buf, 2u);
  }

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__DSProvider_stopMotionDataProvider__block_invoke;
  block[3] = &unk_24D9109C0;
  block[4] = self;
  v6 = self;
  dispatch_async(clientQueue, block);

}

uint64_t __36__DSProvider_stopMotionDataProvider__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopProvider");
}

- (void)_didFindDevice:(id)a3
{
  id v4;
  DSListenerDevice *currentListener;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  currentListener = self->_currentListener;
  if (currentListener)
  {
    -[DSRapportDevice identifier](currentListener, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dsLogger");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_217E3C000, v10, OS_LOG_TYPE_DEFAULT, "[DSProvider] did find device %@\n", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)_didLoseDevice:(id)a3
{
  id v4;
  DSListenerDevice *currentListener;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  currentListener = self->_currentListener;
  if (currentListener)
  {
    -[DSRapportDevice identifier](currentListener, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      -[DSProvider _fetchScreenState](self, "_fetchScreenState");
      if (self->_isScreenON)
      {
        -[DSProvider _heartBeatWithListener](self, "_heartBeatWithListener");
      }
      else
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dsLogger");
        v10 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_impl(&dword_217E3C000, v10, OS_LOG_TYPE_DEFAULT, "[DSProvider] did lose device when screen was OFF %@, ignorning...\n", (uint8_t *)&v11, 0xCu);
        }

      }
    }
  }

}

- (void)_receivedDataRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  char *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned int Int64Ranged;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  DSListenerDevice *currentListener;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  NSObject *v37;
  unsigned int v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  DSListenerDevice *v42;
  void *v43;
  int v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  DSListenerDevice *v50;
  void *v51;
  NSObject *v52;
  char *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t Int64;
  uint64_t v59;
  int v60;
  DSProvider *v61;
  NSObject *v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  unsigned int v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dsLogger");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v8;
    _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data Request received %@\n", buf, 0xCu);
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dsLogger");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v8;
      _os_log_impl(&dword_217E3C000, v19, OS_LOG_TYPE_DEFAULT, "[DSProvider] No senderID for request %@\n", buf, 0xCu);
    }
    goto LABEL_54;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dsLogger");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (Int64Ranged > 0xB)
      v17 = "?";
    else
      v17 = off_24D910BB8[Int64Ranged];
    *(_DWORD *)buf = 136315138;
    v64 = v17;
    _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data link type %s", buf, 0xCu);
  }

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("requestType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v60 = CFDictionaryGetInt64Ranged();
      Int64 = CFDictionaryGetInt64();
      v21 = CFDictionaryGetInt64Ranged();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v61 = self;
      v22 = v10;
      if (-[NSObject UTF8String](v62, "UTF8String"))
        v23 = TextToSourceVersion();
      else
        v23 = 0;
      +[DSLogging sharedInstance](DSLogging, "sharedInstance", Int64);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dsLogger");
      v25 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v64) = v23;
        _os_log_impl(&dword_217E3C000, v25, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data requested with version key : %d\n", buf, 8u);
      }

      v10 = v22;
      if (!(_DWORD)v23 || v23 > TextToSourceVersion())
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dsLogger");
        v27 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v64) = v23;
          _os_log_impl(&dword_217E3C000, v27, OS_LOG_TYPE_DEFAULT, "[DSProvider] Unsupported version %d specified\n", buf, 8u);
        }

        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = 4;
        goto LABEL_52;
      }
      if (-[DSClientMotionDataOptions dataSubType](v61->_motionDataOptions, "dataSubType") == v21)
      {
        if (v60 == 2 && v59)
        {
          currentListener = v61->_currentListener;
          if (currentListener)
          {
            -[DSRapportDevice identifier](currentListener, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v13, "isEqualToString:", v31);

            +[DSLogging sharedInstance](DSLogging, "sharedInstance");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "dsLogger");
            v34 = objc_claimAutoreleasedReturnValue();

            v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            if (v32)
            {
              v19 = v62;
              if (v35)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_217E3C000, v34, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data re-subscription request received\n", buf, 2u);
              }

              -[DSListenerDevice setResponseHandler:](v61->_currentListener, "setResponseHandler:", v22);
              -[DSProvider requestedMotionDataWithOption:](v61, "requestedMotionDataWithOption:", v61->_motionDataOptions);
            }
            else
            {
              v19 = v62;
              if (v35)
              {
                *(_DWORD *)buf = 138412290;
                v64 = (const char *)v13;
                _os_log_impl(&dword_217E3C000, v34, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data Subscription request rejected for senderID %@, listener already exists\n", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v56);

            }
          }
          else
          {
            v48 = objc_alloc_init(MEMORY[0x24BE7CBF8]);
            v49 = v48;
            if (v48)
            {
              objc_msgSend(v48, "setIdentifier:", v13);
              v50 = -[DSListenerDevice initWithRapportDevice:queue:]([DSListenerDevice alloc], "initWithRapportDevice:queue:", v49, v61->_clientQueue);
              v61->_linkType = CFDictionaryGetInt64Ranged();
              -[DSListenerDevice setResponseHandler:](v50, "setResponseHandler:", v22);
              -[DSListenerDevice setVersion:](v50, "setVersion:", v23);
              -[DSListenerDevice setInOptions:](v50, "setInOptions:", v61->_motionDataOptions);
              -[DSProvider _addNewListener:](v61, "_addNewListener:", v50);
              +[DSLogging sharedInstance](DSLogging, "sharedInstance");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "dsLogger");
              v52 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                -[DSRapportDevice identifier](v50, "identifier");
                v53 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v64 = v53;
                _os_log_impl(&dword_217E3C000, v52, OS_LOG_TYPE_DEFAULT, "[DSProvider] START data subscription to listener %@\n", buf, 0xCu);

              }
              -[DSProvider subscribedToMotionDataWithOptions:](v61, "subscribedToMotionDataWithOptions:", v61->_motionDataOptions);
            }
            else
            {
              +[DSLogging sharedInstance](DSLogging, "sharedInstance");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "dsLogger");
              v50 = (DSListenerDevice *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(&v50->super.super, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_217E3C000, &v50->super.super, OS_LOG_TYPE_DEFAULT, "[DSProvider] Could not allocate rpDevice\n", buf, 2u);
              }
            }
            v19 = v62;

            v10 = v22;
          }
          goto LABEL_54;
        }
        if (v60 == 2 && !v59)
        {
          v42 = v61->_currentListener;
          if (v42)
          {
            -[DSRapportDevice identifier](v42, "identifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "isEqualToString:", v13);

            if (v44)
            {
              -[DSProvider _removeCurrentListenerWithStopReason:](v61, "_removeCurrentListenerWithStopReason:", 1);
              +[DSLogging sharedInstance](DSLogging, "sharedInstance");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "dsLogger");
              v46 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v64 = (const char *)v13;
                _os_log_impl(&dword_217E3C000, v46, OS_LOG_TYPE_DEFAULT, "[DSProvider] STOP data subscription from sender %@\n", buf, 0xCu);
              }

              (*((void (**)(id, _QWORD, _QWORD, _QWORD))v22 + 2))(v22, 0, 0, 0);
              -[DSProvider unsubscribed](v61, "unsubscribed");
              goto LABEL_53;
            }
          }
          +[DSLogging sharedInstance](DSLogging, "sharedInstance");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "dsLogger");
          v37 = objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            goto LABEL_51;
          *(_DWORD *)buf = 138412290;
          v64 = (const char *)v13;
          v39 = "[DSProvider] Received stop subscription from unknown listener %@, ignoring\n";
          goto LABEL_49;
        }
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "dsLogger");
        v37 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v8;
          v39 = "[DSProvider] Invalid Data Request %@\n";
LABEL_49:
          v40 = v37;
          v41 = 12;
          goto LABEL_50;
        }
      }
      else
      {
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "dsLogger");
        v37 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = -[DSClientMotionDataOptions dataSubType](v61->_motionDataOptions, "dataSubType");
          *(_DWORD *)buf = 138412546;
          v64 = (const char *)v13;
          v65 = 1024;
          v66 = v38;
          v39 = "[DSProvider] Data Subscription request rejected for senderID %@ with motion datatype %d\n";
          v40 = v37;
          v41 = 18;
LABEL_50:
          _os_log_impl(&dword_217E3C000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
        }
      }
LABEL_51:

      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = 1;
LABEL_52:
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), v29, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v55);

LABEL_53:
      v19 = v62;
LABEL_54:

    }
  }

}

- (void)_sendMotionData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  DSListenerDevice *currentListener;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  DSProvider *v11;
  _QWORD v12[5];
  uint8_t buf[8];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_currentListener)
  {
    v14 = CFSTR("payloadKey");
    v15[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    ++self->_numMotionStateMessages;
    -[DSListenerDevice responseHandler](self->_currentListener, "responseHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    currentListener = self->_currentListener;
    if (v7)
    {
      -[DSListenerDevice responseHandler](self->_currentListener, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NSObject *, _QWORD, _QWORD))v9)[2](v9, v6, 0, 0);

      -[DSListenerDevice setResponseHandler:](self->_currentListener, "setResponseHandler:", 0);
    }
    else
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __30__DSProvider__sendMotionData___block_invoke;
      v12[3] = &unk_24D910B98;
      v12[4] = self;
      v11 = self;
      -[DSProvider _sendRequestID:request:device:options:responseHandler:](v11, "_sendRequestID:request:device:options:responseHandler:", CFSTR("com.apple.distributedsensing.dataRequest"), v6, currentListener, 0, v12);

    }
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dsLogger");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] No Listeners registered\n", buf, 2u);
    }
  }

}

void __30__DSProvider__sendMotionData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unsigned int Int64Ranged;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_QWORD *)(a1 + 32))
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    {
      v11 = Int64Ranged;
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dsLogger");
      v13 = objc_claimAutoreleasedReturnValue();

      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v14)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "rpDevice");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v11 > 0xB)
            v17 = "?";
          else
            v17 = off_24D910BB8[v11];
          v19 = 138412802;
          v20 = v9;
          v21 = 2112;
          v22 = v15;
          v23 = 2080;
          v24 = v17;
          _os_log_impl(&dword_217E3C000, v13, OS_LOG_TYPE_DEFAULT, "[DSProvider] %@ in sending data to device %@ over data link: %s. STOP subscription\n", (uint8_t *)&v19, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "_removeCurrentListenerWithStopReason:", 3);
        objc_msgSend(*(id *)(a1 + 32), "unsubscribed");
      }
      else
      {
        if (v14)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "rpDevice");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412290;
          v20 = v18;
          _os_log_impl(&dword_217E3C000, v13, OS_LOG_TYPE_DEFAULT, "[DSProvider] Sent Data to device %@\n", (uint8_t *)&v19, 0xCu);

        }
      }
    }
  }

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

- (void)_fetchScreenState
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t state64;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(self->_screenStateToken, &state64);
  self->_isScreenON = state64 != 1;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsLogger");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isScreenON)
      v5 = "ON";
    else
      v5 = "OFF";
    *(_DWORD *)buf = 136315138;
    v8 = v5;
    _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSProvider] Current screen state is %s\n", buf, 0xCu);
  }

}

- (void)_heartBeatWithListener
{
  void *v3;
  NSObject *v4;
  void *v5;
  DSListenerDevice *currentListener;
  DSProvider *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!self->_isPendingHeartbeat)
  {
    self->_isPendingHeartbeat = 1;
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dsLogger");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[DSRapportDevice rpDevice](self->_currentListener, "rpDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSProvider] Heartbeating with Listener %@\n", buf, 0xCu);

    }
    ++self->_numHeartbeats;
    currentListener = self->_currentListener;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__DSProvider__heartBeatWithListener__block_invoke;
    v8[3] = &unk_24D910B98;
    v8[4] = self;
    v7 = self;
    -[DSProvider _sendRequestID:request:device:options:responseHandler:](v7, "_sendRequestID:request:device:options:responseHandler:", CFSTR("com.apple.distributedsensing.heartbeatRequest"), MEMORY[0x24BDBD1B8], currentListener, 0, v8);

  }
}

void __36__DSProvider__heartBeatWithListener__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unsigned int Int64Ranged;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_QWORD *)(a1 + 32))
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v11 + 32))
    {
      v12 = Int64Ranged;
      *(_BYTE *)(v11 + 56) = 0;
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dsLogger");
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v15)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "rpDevice");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v12 > 0xB)
            v18 = "?";
          else
            v18 = off_24D910BB8[v12];
          v20 = 138412802;
          v21 = v9;
          v22 = 2112;
          v23 = v16;
          v24 = 2080;
          v25 = v18;
          _os_log_impl(&dword_217E3C000, v14, OS_LOG_TYPE_DEFAULT, "[DSProvider] %@ in heartbeating with listener %@ over data link: %s. STOP subscription\n", (uint8_t *)&v20, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "_removeCurrentListenerWithStopReason:", 2);
        objc_msgSend(*(id *)(a1 + 32), "subscriptionExpired");
      }
      else
      {
        if (v15)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "rpDevice");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412290;
          v21 = v19;
          _os_log_impl(&dword_217E3C000, v14, OS_LOG_TYPE_DEFAULT, "[DSProvider] Listener %@ is still active\n", (uint8_t *)&v20, 0xCu);

        }
      }
    }
  }

}

- (void)_stopProvider
{
  RPCompanionLinkClient *linkClient;

  -[RPCompanionLinkClient deregisterRequestID:](self->_linkClient, "deregisterRequestID:", CFSTR("com.apple.distributedsensing.subscriptionRequest"));
  -[DSClientMotionDataOptions setDataSubType:](self->_motionDataOptions, "setDataSubType:", 0);
  -[DSClientMotionDataOptions setDeviceType:](self->_motionDataOptions, "setDeviceType:", 0);
  -[DSProvider _removeCurrentListenerWithStopReason:](self, "_removeCurrentListenerWithStopReason:", 4);
  -[RPCompanionLinkClient invalidate](self->_linkClient, "invalidate");
  linkClient = self->_linkClient;
  self->_linkClient = 0;

  -[DSProvider stoppedProvider](self, "stoppedProvider");
}

- (void)_addNewListener:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  DSProvider *v10;
  _QWORD handler[5];
  uint8_t buf[16];

  v5 = a3;
  objc_storeStrong((id *)&self->_currentListener, a3);
  self->_isSubscriptionActive = 1;
  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_clientQueue);
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dsLogger");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "[DSProvider] Creating Heartbeat timer\n", buf, 2u);
  }

  v9 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1800000000000);
  dispatch_source_set_timer(v6, v9, 0x1A3185C5000uLL, 0x6FC23AC00uLL);
  v10 = self;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __30__DSProvider__addNewListener___block_invoke;
  handler[3] = &unk_24D9109C0;
  handler[4] = v10;
  dispatch_source_set_event_handler(v6, handler);
  objc_storeStrong((id *)&v10->_heartbeatTimer, v6);
  dispatch_resume((dispatch_object_t)v10->_heartbeatTimer);
  -[DSProvider _startCASessionMetricCollection](v10, "_startCASessionMetricCollection");
  if (!v10->_isUnterminatedSession)
    -[DSProvider _persistListenerState](v10, "_persistListenerState");

}

void __30__DSProvider__addNewListener___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    if (v2[4])
    {
      objc_msgSend(v2, "_heartBeatWithListener");
    }
    else
    {
      v3 = v2[6];
      if (v3)
      {
        dispatch_source_cancel(v3);
        v4 = *(_QWORD *)(a1 + 32);
        v5 = *(void **)(v4 + 48);
        *(_QWORD *)(v4 + 48) = 0;

      }
    }
  }
}

- (void)_removeCurrentListenerWithStopReason:(int)a3
{
  uint64_t v4;
  DSListenerDevice *currentListener;
  DSCoreAnalyticsEventHandler *caEventHandler;
  void *v7;
  NSObject *v8;
  NSObject *heartbeatTimer;
  NSObject *responseTimeoutTimer;
  uint8_t v11[16];

  self->_isSubscriptionActive = 0;
  if (self->_currentListener)
  {
    v4 = *(_QWORD *)&a3;
    -[DSProvider _removePersistedState](self, "_removePersistedState");
    -[DSRapportDevice invalidate](self->_currentListener, "invalidate");
    currentListener = self->_currentListener;
    self->_currentListener = 0;

    -[DSProvider _stopCASessionMetricCollectionWithStopReason:](self, "_stopCASessionMetricCollectionWithStopReason:", v4);
    caEventHandler = self->_caEventHandler;
    self->_caEventHandler = 0;

    self->_numHeartbeats = 0;
    self->_numMotionStateMessages = 0;
    self->_linkType = 0;
  }
  if (self->_heartbeatTimer)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance", *(_QWORD *)&a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dsLogger");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "[DSProvider] Cancelling Heartbeat timer\n", v11, 2u);
    }

    heartbeatTimer = self->_heartbeatTimer;
    if (!dispatch_source_testcancel(heartbeatTimer))
    {
      dispatch_source_cancel(heartbeatTimer);
      heartbeatTimer = self->_heartbeatTimer;
    }
    self->_heartbeatTimer = 0;

  }
  responseTimeoutTimer = self->_responseTimeoutTimer;
  if (responseTimeoutTimer)
  {
    if (!dispatch_source_testcancel((dispatch_source_t)self->_responseTimeoutTimer))
    {
      dispatch_source_cancel(responseTimeoutTimer);
      responseTimeoutTimer = self->_responseTimeoutTimer;
    }
    self->_responseTimeoutTimer = 0;

  }
}

- (void)_startCASessionMetricCollection
{
  void *v3;
  NSObject *v4;
  DSCoreAnalyticsEventHandler *v5;
  DSCoreAnalyticsEventHandler *caEventHandler;
  uint8_t v7[16];

  if (!self->_isTestMode)
  {
    if (self->_caEventHandler)
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dsLogger");
      v4 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSProvider] Core analytics event handler already exists\n", v7, 2u);
      }

    }
    else
    {
      v5 = objc_alloc_init(DSCoreAnalyticsEventHandler);
      caEventHandler = self->_caEventHandler;
      self->_caEventHandler = v5;

      -[DSCoreAnalyticsEventHandler dsSessionStartedWithDeviceRole:numPotentialProviders:unterminatedSession:](self->_caEventHandler, "dsSessionStartedWithDeviceRole:numPotentialProviders:unterminatedSession:", 1, 0, self->_isUnterminatedSession);
    }
  }
}

- (void)_stopCASessionMetricCollectionWithStopReason:(int)a3
{
  DSCoreAnalyticsEventHandler *caEventHandler;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (!self->_isTestMode)
  {
    caEventHandler = self->_caEventHandler;
    if (caEventHandler)
    {
      -[DSCoreAnalyticsEventHandler dsSessionCompletedWithStopReason:numHeartbeats:numMotionStateMessages:activeProviderLostCount:dataLinkType:maxListenerClients:avgListenerStartInterval:](caEventHandler, "dsSessionCompletedWithStopReason:numHeartbeats:numMotionStateMessages:activeProviderLostCount:dataLinkType:maxListenerClients:avgListenerStartInterval:", *(_QWORD *)&a3, self->_numHeartbeats, self->_numMotionStateMessages, 0, self->_linkType, 0, 0.0);
    }
    else
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance", *(_QWORD *)&a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dsLogger");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] Core analytics event handler not initialized\n", v7, 2u);
      }

    }
  }
}

- (BOOL)_persistListenerState
{
  DSKeychainPersistence *v3;
  DSListenerDevice *currentListener;
  BOOL v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = -[DSKeychainPersistence initWithQueue:]([DSKeychainPersistence alloc], "initWithQueue:", self->_clientQueue);
  currentListener = self->_currentListener;
  v10 = 0;
  v5 = -[DSKeychainPersistence saveListenerState:withError:](v3, "saveListenerState:withError:", currentListener, &v10);
  v6 = v10;
  if (!v5)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dsLogger");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "[DSProvider] failed to save peristence data with error %@", buf, 0xCu);
    }

  }
  return v5;
}

- (BOOL)_unPersistListenerState
{
  DSKeychainPersistence *v3;
  BOOL v4;
  id v5;
  id v6;
  int v7;
  void *v8;
  int v9;
  unsigned int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v25;
  void *v26;
  int v27;
  id v28;
  id v29;
  uint8_t buf[4];
  _DWORD v31[7];

  *(_QWORD *)&v31[5] = *MEMORY[0x24BDAC8D0];
  v3 = -[DSKeychainPersistence initWithQueue:]([DSKeychainPersistence alloc], "initWithQueue:", self->_clientQueue);
  v28 = 0;
  v29 = 0;
  v4 = -[DSKeychainPersistence loadListenerState:withError:](v3, "loadListenerState:withError:", &v29, &v28);
  v5 = v29;
  v6 = v28;
  if (!v4)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dsLogger");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v31 = v6;
      v17 = "[DSProvider] No persistence data found with error: %@";
      v18 = v16;
      v19 = 12;
LABEL_15:
      _os_log_impl(&dword_217E3C000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    }
LABEL_16:

    v14 = 0;
    goto LABEL_17;
  }
  if (!v5)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dsLogger");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "[DSProvider] no listener device persisted\n";
      v18 = v16;
      v19 = 2;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!objc_msgSend(v5, "version")
    || (v7 = objc_msgSend(v5, "version"), v7 != TextToSourceVersion()))
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dsLogger");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v5, "version");
      v22 = TextToSourceVersion();
      *(_DWORD *)buf = 67109376;
      v31[0] = v21;
      LOWORD(v31[1]) = 1024;
      *(_DWORD *)((char *)&v31[1] + 2) = v22;
      v17 = "[DSProvider] version %d in persisted listener doesn't match current version: %d\n";
      v18 = v16;
      v19 = 14;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(v5, "inOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dataSubType");
  v10 = -[DSClientMotionDataOptions dataSubType](self->_motionDataOptions, "dataSubType");

  if (v9 != v10)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dsLogger");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "inOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "dataSubType");
      *(_DWORD *)buf = 67109120;
      v31[0] = v27;
      _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, "[DSProvider] Invalid motion datatype %d in persisted listener\n", buf, 8u);

    }
    goto LABEL_16;
  }
  self->_isUnterminatedSession = 1;
  +[DSLogging sharedInstance](DSLogging, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dsLogger");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v31 = v13;
    _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "[DSProvider] UNTERMINATED session found with listener ID %@", buf, 0xCu);

  }
  -[DSProvider _addNewListener:](self, "_addNewListener:", v5);
  v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)_removePersistedState
{
  DSKeychainPersistence *v3;
  DSListenerDevice *currentListener;
  BOOL v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  self->_isUnterminatedSession = 0;
  v3 = -[DSKeychainPersistence initWithQueue:]([DSKeychainPersistence alloc], "initWithQueue:", self->_clientQueue);
  currentListener = self->_currentListener;
  v10 = 0;
  v5 = -[DSKeychainPersistence removeListenerState:withError:](v3, "removeListenerState:withError:", currentListener, &v10);
  v6 = v10;
  if (!v5)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dsLogger");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "[DSProvider] failed to remove peristence data with error %@", buf, 0xCu);
    }

  }
  return v5;
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

- (BOOL)isSubscriptionActive
{
  return self->_isSubscriptionActive;
}

- (void)setIsSubscriptionActive:(BOOL)a3
{
  self->_isSubscriptionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caEventHandler, 0);
  objc_storeStrong((id *)&self->_responseTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_currentListener, 0);
  objc_storeStrong((id *)&self->_motionDataOptions, 0);
  objc_storeStrong((id *)&self->_linkClient, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
