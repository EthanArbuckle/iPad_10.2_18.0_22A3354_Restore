@implementation CORapportBrowser

- (CORapportBrowser)init
{
  CORapportBrowser *v2;
  CORapportBrowser *v3;
  COBrowserObserverSet *v4;
  COBrowserObserverSet *observerSet;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  COCompanionLinkClientFactory *v11;
  COCompanionLinkClientFactoryProtocol *companionLinkClientFactory;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CORapportBrowser;
  v2 = -[CORapportBrowser init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(COBrowserObserverSet);
    observerSet = v3->_observerSet;
    v3->_observerSet = v4;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.coordination.rapportbrowser.%p"), v3);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v9;

    v11 = -[COCompanionLinkClientFactory initWithDispatchQueue:]([COCompanionLinkClientFactory alloc], "initWithDispatchQueue:", v3->_workQueue);
    companionLinkClientFactory = v3->_companionLinkClientFactory;
    v3->_companionLinkClientFactory = (COCompanionLinkClientFactoryProtocol *)v11;

  }
  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[CORapportBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D4B2630;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 12))
    {
      COCoreLogForCategory(14);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = v4;
        _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p Browser is already running", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      *((_BYTE *)WeakRetained + 12) = 1;
      objc_msgSend(*(id *)(a1 + 32), "companionLinkClientFactory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "companionLinkClientForCurrentDevice");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v4[4];
      v4[4] = v7;

      v9 = (void *)v4[4];
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDispatchQueue:", v10);

      v11 = (void *)v4[4];
      v12 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke_5;
      v22[3] = &unk_24D4B0AA0;
      objc_copyWeak(&v23, v2);
      objc_msgSend(v11, "setDeviceFoundHandler:", v22);
      v13 = (void *)v4[4];
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke_2;
      v20[3] = &unk_24D4B0AA0;
      objc_copyWeak(&v21, v2);
      objc_msgSend(v13, "setDeviceLostHandler:", v20);
      v14 = (void *)v4[4];
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke_3;
      v18[3] = &unk_24D4B0AA0;
      objc_copyWeak(&v19, v2);
      objc_msgSend(v14, "setLocalDeviceUpdatedHandler:", v18);
      objc_msgSend(v4, "setStartCallback:", *(_QWORD *)(a1 + 40));
      v15 = (void *)v4[4];
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke_4;
      v16[3] = &unk_24D4B0880;
      objc_copyWeak(&v17, v2);
      objc_msgSend(v15, "activateWithCompletion:", v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
    }
  }

}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_onqueue_handleFoundDevice:", v5);

}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_onqueue_handleLostDevice:", v5);

}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_onqueue_updateListeningPort:", v5);

}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_onqueue_handleActivation:", v5);

}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  CORapportBrowser *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(14);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p Stopping browser", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[CORapportBrowser workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__CORapportBrowser_stop__block_invoke;
  block[3] = &unk_24D4B0CD8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __24__CORapportBrowser_stop__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 12) = 0;
    v3 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 4), "invalidate");
    v2 = (void *)v3[4];
    v3[4] = 0;

    WeakRetained = v3;
  }

}

- (id)registeredObservers
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__CORapportBrowser_registeredObservers__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[CORapportBrowser _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__CORapportBrowser_registeredObservers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "observerSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)addObserverUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  COBrowserObserver *v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = -[COBrowserObserver initWithBlock:]([COBrowserObserver alloc], "initWithBlock:", v4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__CORapportBrowser_addObserverUsingBlock___block_invoke;
  v7[3] = &unk_24D4B0B18;
  v7[4] = self;
  v7[5] = &v8;
  -[CORapportBrowser _withLock:](self, "_withLock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__CORapportBrowser_addObserverUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observerSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__CORapportBrowser_removeObserver___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CORapportBrowser _withLock:](self, "_withLock:", v6);

}

void __35__CORapportBrowser_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observerSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 40));

}

- (void)setSourceTransport:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *workQueue;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__CORapportBrowser_setSourceTransport___block_invoke;
  v11[3] = &unk_24D4B0858;
  v11[4] = self;
  v12 = v4;
  v6 = v4;
  -[CORapportBrowser _withLock:](self, "_withLock:", v11);
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __39__CORapportBrowser_setSourceTransport___block_invoke_2;
  v8[3] = &unk_24D4B0CD8;
  objc_copyWeak(&v9, &location);
  dispatch_async(workQueue, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

id __39__CORapportBrowser_setSourceTransport___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __39__CORapportBrowser_setSourceTransport___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "listener");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activeDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __39__CORapportBrowser_setSourceTransport___block_invoke_3;
    v5[3] = &unk_24D4B2658;
    v5[4] = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

    WeakRetained = v4;
  }

}

uint64_t __39__CORapportBrowser_setSourceTransport___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleFoundDevice:", a2);
}

- (CORapportTransport)sourceTransport
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__CORapportBrowser_sourceTransport__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[CORapportBrowser _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CORapportTransport *)v2;
}

void __35__CORapportBrowser_sourceTransport__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (id)_rapportDeviceWithCompanionLinkDevice:(id)a3
{
  id v4;
  void *v5;
  CORapportDevice *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[CORapportBrowser sourceTransport](self, "sourceTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CORapportDevice initWithCompanionLinkDevice:sourceTransport:]([CORapportDevice alloc], "initWithCompanionLinkDevice:sourceTransport:", v4, v5);
  objc_initWeak(&location, v6);
  -[CORapportBrowser companionLinkClientFactory](self, "companionLinkClientFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__CORapportBrowser__rapportDeviceWithCompanionLinkDevice___block_invoke;
  v11[3] = &unk_24D4B2680;
  objc_copyWeak(&v14, &location);
  v8 = v7;
  v12 = v8;
  v9 = v5;
  v13 = v9;
  -[CORapportDevice setCompanionLinkProvider:](v6, "setCompanionLinkProvider:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v6;
}

id __58__CORapportBrowser__rapportDeviceWithCompanionLinkDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "IDSIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companionLinkClientForDevice:withIDSIdentifier:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dispatchQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDispatchQueue:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_onqueue_updateListeningPort:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (a3)
    -[CORapportBrowser _onqueue_handleActivation:](self, "_onqueue_handleActivation:", 0);
}

- (void)_onqueue_handleActivation:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  int v9;
  unsigned __int16 v10;
  void *v11;
  CORapportCurrentDevice *v12;
  int v13;
  CORapportBrowser *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!self->_activated)
  {
    -[CORapportBrowser startCallback](self, "startCallback");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void (**)(_QWORD, _QWORD))v5;
    if (v4 && v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
      -[CORapportBrowser setStartCallback:](self, "setStartCallback:", 0);
    }
    else
    {
      -[CORapportBrowser listener](self, "listener");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "listeningPort");
      if (v9 >= 1)
      {
        v10 = v9;
        if (v9 != -[CORapportBrowser listeningPort](self, "listeningPort"))
          self->_listeningPort = v10;
      }
      -[COCompanionLinkClientProtocol localDevice](self->_listener, "localDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        self->_activated = 1;
        if (v6)
        {
          v6[2](v6, 0);
          -[CORapportBrowser setStartCallback:](self, "setStartCallback:", 0);
        }
        v12 = -[CORapportCurrentDevice initWithClient:browser:]([CORapportCurrentDevice alloc], "initWithClient:browser:", self->_listener, self);
        -[CORapportBrowser _onqueue_informObserversOfDiscoveredRecord:](self, "_onqueue_informObserversOfDiscoveredRecord:", v12);
      }
      else
      {
        COCoreLogForCategory(14);
        v12 = (CORapportCurrentDevice *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412290;
          v14 = self;
          _os_log_impl(&dword_215E92000, &v12->super, OS_LOG_TYPE_DEFAULT, "%@ deferring activation, don't have local device yet", (uint8_t *)&v13, 0xCu);
        }
      }

    }
  }

}

- (void)_onqueue_handleFoundDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  CORapportBrowser *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  NSObject *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = self;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p Rapport Browser found device %@", buf, 0x16u);
  }

  if (!self->_started)
  {
    COCoreLogForCategory(14);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    *(_DWORD *)buf = 134217984;
    v26 = self;
    v18 = "%p Rapport Browser is not running";
LABEL_23:
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    goto LABEL_29;
  }
  if (!self->_activated)
  {
    COCoreLogForCategory(14);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    *(_DWORD *)buf = 134217984;
    v26 = self;
    v18 = "%p Rapport Browser not started completely";
    goto LABEL_23;
  }
  -[CORapportBrowser sourceTransport](self, "sourceTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    COCoreLogForCategory(14);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    *(_DWORD *)buf = 134217984;
    v26 = self;
    v18 = "%p source transport not established yet";
    goto LABEL_23;
  }
  -[CORapportBrowser _rapportDeviceWithCompanionLinkDevice:](self, "_rapportDeviceWithCompanionLinkDevice:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  -[NSObject HomeKitIdentifier](v7, "HomeKitIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[NSObject IDSIdentifier](v7, "IDSIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[CORapportBrowser listener](self, "listener", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "idsDeviceIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && !objc_msgSend(v9, "compare:options:", v17, 1))
          {
            objc_msgSend(v16, "homeKitIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setHomeKitIdentifier:](v7, "setHomeKitIdentifier:", v19);
            COCoreLogForCategory(14);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v26 = self;
              v27 = 2112;
              v28 = v19;
              v29 = 2048;
              v30 = v7;
              _os_log_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEFAULT, "%@ used fallback to get HomeKit identifier(%@) for device %p", buf, 0x20u);
            }

            goto LABEL_27;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_27:

  }
  -[CORapportBrowser _onqueue_informObserversOfDiscoveredRecord:](self, "_onqueue_informObserversOfDiscoveredRecord:", v7);
LABEL_29:

}

- (void)_onqueue_handleLostDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  CORapportBrowser *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p Rapport Browser lost device %@", (uint8_t *)&v9, 0x16u);
  }

  -[CORapportBrowser sourceTransport](self, "sourceTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    COCoreLogForCategory(14);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v9 = 134217984;
    v10 = self;
    v8 = "%p Rapport Browser doesn't have source transport";
LABEL_13:
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_14;
  }
  if (!self->_started)
  {
    COCoreLogForCategory(14);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v9 = 134217984;
    v10 = self;
    v8 = "%p Rapport Browser is not running";
    goto LABEL_13;
  }
  if (!self->_activated)
  {
    COCoreLogForCategory(14);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v9 = 134217984;
    v10 = self;
    v8 = "%p Rapport Browser not started completely";
    goto LABEL_13;
  }
  -[CORapportBrowser _rapportDeviceWithCompanionLinkDevice:](self, "_rapportDeviceWithCompanionLinkDevice:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  -[CORapportBrowser _onqueue_informObserversOfLostRecord:](self, "_onqueue_informObserversOfLostRecord:", v7);
LABEL_14:

}

- (void)_onqueue_informObserversOfDiscoveredRecord:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__CORapportBrowser__onqueue_informObserversOfDiscoveredRecord___block_invoke;
  v10[3] = &unk_24D4B07E0;
  v10[4] = self;
  v10[5] = &v11;
  -[CORapportBrowser _withLock:](self, "_withLock:", v10);
  v6 = (void *)v12[5];
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __63__CORapportBrowser__onqueue_informObserversOfDiscoveredRecord___block_invoke_2;
  v8[3] = &unk_24D4B14F8;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  _Block_object_dispose(&v11, 8);
}

void __63__CORapportBrowser__onqueue_informObserversOfDiscoveredRecord___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "observerSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __63__CORapportBrowser__onqueue_informObserversOfDiscoveredRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t, _QWORD);

  objc_msgSend(a2, "block");
  v3 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 1, *(_QWORD *)(a1 + 32));

}

- (void)_onqueue_informObserversOfLostRecord:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__CORapportBrowser__onqueue_informObserversOfLostRecord___block_invoke;
  v10[3] = &unk_24D4B07E0;
  v10[4] = self;
  v10[5] = &v11;
  -[CORapportBrowser _withLock:](self, "_withLock:", v10);
  v6 = (void *)v12[5];
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __57__CORapportBrowser__onqueue_informObserversOfLostRecord___block_invoke_2;
  v8[3] = &unk_24D4B14F8;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  _Block_object_dispose(&v11, 8);
}

void __57__CORapportBrowser__onqueue_informObserversOfLostRecord___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observerSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__CORapportBrowser__onqueue_informObserversOfLostRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "block");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, *(_QWORD *)(a1 + 32));

}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (COBrowserObserverSet)observerSet
{
  return self->_observerSet;
}

- (COCompanionLinkClientProtocol)listener
{
  return self->_listener;
}

- (unsigned)listeningPort
{
  return self->_listeningPort;
}

- (id)startCallback
{
  return self->_startCallback;
}

- (void)setStartCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (COCompanionLinkClientFactoryProtocol)companionLinkClientFactory
{
  return self->_companionLinkClientFactory;
}

- (void)setCompanionLinkClientFactory:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClientFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionLinkClientFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_startCallback, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_observerSet, 0);
  objc_destroyWeak((id *)&self->_sourceTransport);
}

@end
