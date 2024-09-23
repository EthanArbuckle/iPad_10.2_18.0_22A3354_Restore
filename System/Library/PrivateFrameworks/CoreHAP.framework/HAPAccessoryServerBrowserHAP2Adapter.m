@implementation HAPAccessoryServerBrowserHAP2Adapter

- (void)registerPairedAccessoryWithIdentifier:(id)a3
{
  -[HAPAccessoryServerBrowserHAP2Adapter _setAdapterWithIdentifier:shouldBePaired:]((uint64_t)self, a3, 1);
}

- (void)_setAdapterWithIdentifier:(uint64_t)a3 shouldBePaired:
{
  id v5;
  HAPDeviceID *v6;
  id v7;
  HAPDeviceID *v8;
  _QWORD v9[5];
  HAPDeviceID *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  if (a1)
  {
    v6 = -[HAPDeviceID initWithDeviceIDString:]([HAPDeviceID alloc], "initWithDeviceIDString:", v5);
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__13201;
    v16 = __Block_byref_object_dispose__13202;
    v17 = 0;
    v7 = *(id *)(a1 + 88);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__HAPAccessoryServerBrowserHAP2Adapter__setAdapterWithIdentifier_shouldBePaired___block_invoke;
    v9[3] = &unk_1E894BD68;
    v11 = &v12;
    v9[4] = a1;
    v8 = v6;
    v10 = v8;
    objc_msgSend(v7, "performReadingBlock:", v9);

    objc_msgSend((id)v13[5], "setShouldBePaired:", a3);
    _Block_object_dispose(&v12, 8);

  }
}

void __81__HAPAccessoryServerBrowserHAP2Adapter__setAdapterWithIdentifier_shouldBePaired___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)startConfirmingPairedAccessoryReachability
{
  if (self)
    self = (HAPAccessoryServerBrowserHAP2Adapter *)self->_browser;
  -[HAPAccessoryServerBrowserHAP2Adapter startConfirmingPairedAccessoryReachability](self, "startConfirmingPairedAccessoryReachability");
}

- (HAPAccessoryServerBrowserHAP2Adapter)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HAPAccessoryServerBrowserHAP2Adapter)initWithQueue:(id)a3 storage:(id)a4
{
  id v6;
  id v7;
  HAP2AccessoryServerBrowser *v8;
  void *v9;
  void *v10;
  HAP2AccessoryServerBrowser *v11;
  HAPAccessoryServerBrowserHAP2Adapter *v12;
  HAPAccessoryServerBrowserHAP2Adapter *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [HAP2AccessoryServerBrowser alloc];
  objc_opt_self();
  v9 = (void *)objc_opt_new();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HAP2AccessoryServerBrowser initWithCoordinators:storage:](v8, "initWithCoordinators:storage:", v10, v6);
  v12 = -[HAPAccessoryServerBrowserHAP2Adapter initWithHAP2Browser:queue:](self, "initWithHAP2Browser:queue:", v11, v7);

  if (v12)
    v13 = v12;

  return v12;
}

- (HAPAccessoryServerBrowserHAP2Adapter)initWithHAP2Browser:(id)a3 queue:(id)a4
{
  id v7;
  HAPAccessoryServerBrowserHAP2Adapter *v8;
  uint64_t v9;
  HAP2PropertyLock *propertyLock;
  uint64_t v11;
  NSMutableDictionary *discoveredServers;
  HAPAccessoryServerBrowserHAP2Adapter *v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPAccessoryServerBrowserHAP2Adapter;
  v8 = -[HAPAccessoryServerBrowser initWithQueue:](&v15, sel_initWithQueue_, a4);
  if (v8)
  {
    objc_msgSend(v7, "setDelegate:", v8);
    objc_storeStrong((id *)&v8->_browser, a3);
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAPAccessoryServerBrowserHAP2Adapter.propertyLock"));
    v9 = objc_claimAutoreleasedReturnValue();
    propertyLock = v8->_propertyLock;
    v8->_propertyLock = (HAP2PropertyLock *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    discoveredServers = v8->_discoveredServers;
    v8->_discoveredServers = (NSMutableDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (int64_t)linkType
{
  return 1;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  HAP2PropertyLock *propertyLock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HAPAccessoryServerBrowserHAP2Adapter_setDelegate_queue___block_invoke;
  v11[3] = &unk_1E894E120;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v11);

}

- (void)startDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HAPAccessoryServerBrowserHAP2Adapter_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HAPAccessoryServerBrowserHAP2Adapter_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopConfirmingPairedAccessoryReachability
{
  if (self)
    self = (HAPAccessoryServerBrowserHAP2Adapter *)self->_browser;
  -[HAPAccessoryServerBrowserHAP2Adapter stopConfirmingPairedAccessoryReachability](self, "stopConfirmingPairedAccessoryReachability");
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  HAPAccessoryServerBrowserHAP2Adapter *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__HAPAccessoryServerBrowserHAP2Adapter_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E894D9E8;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (BOOL)isPaired:(id)a3
{
  id v4;
  HAPDeviceID *v5;
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v7;
  uint64_t v8;
  HAPDeviceID *v9;
  void *v10;
  char v11;
  NSObject *v12;
  HAP2AccessoryServerBrowserPrivate *browser;
  HAP2AccessoryServerBrowserPrivate *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[4];
  HAPDeviceID *v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[5];
  HAPDeviceID *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v5 = -[HAPDeviceID initWithDeviceIDString:]([HAPDeviceID alloc], "initWithDeviceIDString:", v4);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__13201;
  v34 = __Block_byref_object_dispose__13202;
  v35 = 0;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v7 = propertyLock;
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __49__HAPAccessoryServerBrowserHAP2Adapter_isPaired___block_invoke;
  v27[3] = &unk_1E894BD68;
  v29 = &v30;
  v27[4] = self;
  v9 = v5;
  v28 = v9;
  -[HAP2PropertyLock performReadingBlock:](v7, "performReadingBlock:", v27);

  v10 = (void *)v31[5];
  if (v10)
  {
    v11 = objc_msgSend(v10, "isPaired");
  }
  else
  {
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    if (self)
      browser = self->_browser;
    else
      browser = 0;
    v14 = browser;
    -[HAP2AccessoryServerBrowserPrivate storage](v14, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __49__HAPAccessoryServerBrowserHAP2Adapter_isPaired___block_invoke_2;
    v19[3] = &unk_1E894BDB8;
    v22 = &v23;
    v20 = v9;
    v17 = v12;
    v21 = v17;
    objc_msgSend(v15, "hasKeysForIdentifiers:completion:", v16, v19);

    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    v11 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v30, 8);
  return v11;
}

- (void)deRegisterAccessoryWithIdentifier:(id)a3
{
  -[HAPAccessoryServerBrowserHAP2Adapter _setAdapterWithIdentifier:shouldBePaired:]((uint64_t)self, a3, 0);
}

- (void)accessoryServerBrowser:(id)a3 didDiscoverPairedAccessoryServer:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  HAPAccessoryServerBrowserHAP2Adapter *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverPairedAccessoryServer_withCompletion___block_invoke;
  block[3] = &unk_1E894D9E8;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)accessoryServerBrowser:(id)a3 didDiscoverUnpairedAccessoryServer:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  HAPAccessoryServerBrowserHAP2Adapter *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverUnpairedAccessoryServer_withCompletion___block_invoke;
  block[3] = &unk_1E894D9E8;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)accessoryServerBrowser:(id)a3 didStartDiscoveringWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStartDiscoveringWithError___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)accessoryServerBrowser:(id)a3 didStopDiscoveringWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStopDiscoveringWithError___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)accessoryServerBrowser:(id)a3 didLoseUnpairedAccessoryServer:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didLoseUnpairedAccessoryServer_error___block_invoke;
  v9[3] = &unk_1E894E0F8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void)accessoryServerBrowser:(id)a3 didLosePairedAccessoryServer:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didLosePairedAccessoryServer_error___block_invoke;
  v9[3] = &unk_1E894E0F8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_discoveredServers, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __98__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didLosePairedAccessoryServer_error___block_invoke(uint64_t a1)
{
  -[HAPAccessoryServerBrowserHAP2Adapter _handleLostAccessoryServer:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_handleLostAccessoryServer:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  if (a1)
  {
    v3 = a2;
    objc_msgSend((id)a1, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(v3, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5;
    objc_msgSend((id)a1, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__13201;
    v25 = __Block_byref_object_dispose__13202;
    v26 = 0;
    v8 = *(id *)(a1 + 88);
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__HAPAccessoryServerBrowserHAP2Adapter__removeDiscoveredServerWithDeviceID___block_invoke;
    v18[3] = &unk_1E894BD68;
    v20 = &v21;
    v18[4] = a1;
    v10 = v6;
    v19 = v10;
    objc_msgSend(v8, "performWritingBlock:", v18);

    v11 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

    if (v11)
    {
      -[HAPAccessoryServerBrowserHAP2Adapter delegate]((id *)a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = *(NSObject **)(a1 + 64);
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __67__HAPAccessoryServerBrowserHAP2Adapter__handleLostAccessoryServer___block_invoke;
        v14[3] = &unk_1E894E120;
        v15 = v12;
        v16 = a1;
        v17 = v11;
        dispatch_async(v13, v14);

      }
    }

  }
}

- (id)delegate
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__13201;
    v9 = __Block_byref_object_dispose__13202;
    v10 = 0;
    v2 = a1[11];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __48__HAPAccessoryServerBrowserHAP2Adapter_delegate__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

uint64_t __67__HAPAccessoryServerBrowserHAP2Adapter__handleLostAccessoryServer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didRemoveAccessoryServer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __48__HAPAccessoryServerBrowserHAP2Adapter_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __76__HAPAccessoryServerBrowserHAP2Adapter__removeDiscoveredServerWithDeviceID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

- (id)discoveredServers
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[11], "assertOwner");
    a1 = (id *)v1[9];
  }
  return a1;
}

void __100__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didLoseUnpairedAccessoryServer_error___block_invoke(uint64_t a1)
{
  -[HAPAccessoryServerBrowserHAP2Adapter _handleLostAccessoryServer:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __91__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStopDiscoveringWithError___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];

  -[HAPAccessoryServerBrowserHAP2Adapter delegate](*(id **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  v4 = MEMORY[0x1E0C809B0];
  if ((v3 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(NSObject **)(v5 + 64);
    else
      v6 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __91__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStopDiscoveringWithError___block_invoke_2;
    v13[3] = &unk_1E894E120;
    v7 = v2;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v14 = v7;
    v15 = v8;
    v16 = v9;
    dispatch_async(v6, v13);

  }
  v10 = *(_QWORD **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v11);

    v12 = (void *)v10[11];
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __63__HAPAccessoryServerBrowserHAP2Adapter__clearDiscoveredServers__block_invoke;
    v17[3] = &unk_1E894DD08;
    v17[4] = v10;
    objc_msgSend(v12, "performWritingBlock:", v17);
  }

}

uint64_t __91__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStopDiscoveringWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didStopDiscoveringWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __63__HAPAccessoryServerBrowserHAP2Adapter__clearDiscoveredServers__block_invoke(uint64_t a1)
{
  id v1;

  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void __92__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStartDiscoveringWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  -[HAPAccessoryServerBrowserHAP2Adapter delegate](*(id **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(NSObject **)(v3 + 64);
    else
      v4 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStartDiscoveringWithError___block_invoke_2;
    block[3] = &unk_1E894E120;
    v5 = v2;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    dispatch_async(v4, block);

  }
}

uint64_t __92__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStartDiscoveringWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didStartDiscoveringWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __113__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverUnpairedAccessoryServer_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  HAPAccessoryServerHAP2Adapter *(*v8)(uint64_t);
  void *v9;
  id v10;
  char v11;

  v11 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __113__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverUnpairedAccessoryServer_withCompletion___block_invoke_2;
  v9 = &unk_1E894BDE0;
  v10 = *(id *)(a1 + 32);
  v2 = (void *)MEMORY[0x1D17B7400](&v6);
  v3 = *(id **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "deviceID", v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBrowserHAP2Adapter _getOrInsertServerWithDeviceID:creationBlock:created:](v3, v4, v2, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[HAPAccessoryServerBrowserHAP2Adapter _notifyDelegateOfNewServer:withCompletion:](*(_QWORD **)(a1 + 40), v5, *(void **)(a1 + 48));
  else
    objc_msgSend(v5, "setUnpairedServer:", *(_QWORD *)(a1 + 32));

}

HAPAccessoryServerHAP2Adapter *__113__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverUnpairedAccessoryServer_withCompletion___block_invoke_2(uint64_t a1)
{
  return -[HAPAccessoryServerHAP2Adapter initWithUnpairedServer:]([HAPAccessoryServerHAP2Adapter alloc], "initWithUnpairedServer:", *(_QWORD *)(a1 + 32));
}

- (id)_getOrInsertServerWithDeviceID:(void *)a3 creationBlock:(_BYTE *)a4 created:
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__13201;
    v29 = __Block_byref_object_dispose__13202;
    v30 = 0;
    v10 = a1[11];
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __93__HAPAccessoryServerBrowserHAP2Adapter__getOrInsertServerWithDeviceID_creationBlock_created___block_invoke;
    v22[3] = &unk_1E894BD68;
    v24 = &v25;
    v22[4] = a1;
    v12 = v7;
    v23 = v12;
    objc_msgSend(v10, "performReadingBlock:", v22);

    v13 = v26;
    if (v26[5])
    {
      *a4 = 0;
      v14 = (id)v13[5];
    }
    else
    {
      v8[2](v8);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v26[5];
      v26[5] = v15;

      v17 = a1[11];
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __93__HAPAccessoryServerBrowserHAP2Adapter__getOrInsertServerWithDeviceID_creationBlock_created___block_invoke_2;
      v19[3] = &unk_1E894BD68;
      v19[4] = a1;
      v20 = v12;
      v21 = &v25;
      objc_msgSend(v17, "performWritingBlock:", v19);

      *a4 = 1;
      v14 = (id)v26[5];

    }
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_notifyDelegateOfNewServer:(void *)a3 withCompletion:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    -[HAPAccessoryServerBrowserHAP2Adapter delegate]((id *)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = a1[8];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __82__HAPAccessoryServerBrowserHAP2Adapter__notifyDelegateOfNewServer_withCompletion___block_invoke;
      v10[3] = &unk_1E894D6D0;
      v11 = v8;
      v12 = a1;
      v13 = v5;
      v14 = v6;
      dispatch_async(v9, v10);

    }
  }

}

void __82__HAPAccessoryServerBrowserHAP2Adapter__notifyDelegateOfNewServer_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HAPAccessoryServerBrowserHAP2Adapter__notifyDelegateOfNewServer_withCompletion___block_invoke_2;
  block[3] = &unk_1E894D498;
  v4 = *(id *)(a1 + 56);
  dispatch_async(v2, block);

}

uint64_t __82__HAPAccessoryServerBrowserHAP2Adapter__notifyDelegateOfNewServer_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __93__HAPAccessoryServerBrowserHAP2Adapter__getOrInsertServerWithDeviceID_creationBlock_created___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __93__HAPAccessoryServerBrowserHAP2Adapter__getOrInsertServerWithDeviceID_creationBlock_created___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __111__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverPairedAccessoryServer_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  HAPAccessoryServerHAP2Adapter *(*v8)(uint64_t);
  void *v9;
  id v10;
  char v11;

  v11 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __111__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverPairedAccessoryServer_withCompletion___block_invoke_2;
  v9 = &unk_1E894BDE0;
  v10 = *(id *)(a1 + 32);
  v2 = (void *)MEMORY[0x1D17B7400](&v6);
  v3 = *(id **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "deviceID", v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBrowserHAP2Adapter _getOrInsertServerWithDeviceID:creationBlock:created:](v3, v4, v2, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[HAPAccessoryServerBrowserHAP2Adapter _notifyDelegateOfNewServer:withCompletion:](*(_QWORD **)(a1 + 40), v5, *(void **)(a1 + 48));
  else
    objc_msgSend(v5, "setPairedServer:", *(_QWORD *)(a1 + 32));

}

HAPAccessoryServerHAP2Adapter *__111__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverPairedAccessoryServer_withCompletion___block_invoke_2(uint64_t a1)
{
  return -[HAPAccessoryServerHAP2Adapter initWithPairedServer:]([HAPAccessoryServerHAP2Adapter alloc], "initWithPairedServer:", *(_QWORD *)(a1 + 32));
}

void __49__HAPAccessoryServerBrowserHAP2Adapter_isPaired___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__HAPAccessoryServerBrowserHAP2Adapter_isPaired___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __107__HAPAccessoryServerBrowserHAP2Adapter_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  HAPDeviceID *v2;
  uint64_t v3;
  void *v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;

  v2 = -[HAPDeviceID initWithDeviceIDString:]([HAPDeviceID alloc], "initWithDeviceIDString:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(void **)(v3 + 80);
  else
    v4 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __107__HAPAccessoryServerBrowserHAP2Adapter_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_1E894BD90;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "accessoryWithDeviceIDIsPaired:completion:", v2, v7);

}

void __107__HAPAccessoryServerBrowserHAP2Adapter_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__13201;
    v25 = __Block_byref_object_dispose__13202;
    v26 = 0;
    v7 = *(id *)(v6 + 88);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__HAPAccessoryServerBrowserHAP2Adapter_accessoryServers__block_invoke;
    v20[3] = &unk_1E894DEE8;
    v20[4] = v6;
    v20[5] = &v21;
    objc_msgSend(v7, "performReadingBlock:", v20, (_QWORD)v16);

    v8 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v8 = 0;
  }
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "identifier", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = HMFEqualObjects();

        if (v14)
        {
          v9 = v12;
          goto LABEL_13;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  if (a3)
    v15 = 0;
  else
    v15 = a2;
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v15, v9);

}

void __56__HAPAccessoryServerBrowserHAP2Adapter_accessoryServers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  HAPDeviceID *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  HAPDeviceID *v8;
  uint64_t v9;
  NSObject *v10;
  id *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[2];
  id v20;
  _QWORD block[4];
  _QWORD v22[3];
  _QWORD v23[5];
  HAPDeviceID *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  -[HAPAccessoryServerBrowserHAP2Adapter delegate](*(id **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[HAPDeviceID initWithDeviceIDString:]([HAPDeviceID alloc], "initWithDeviceIDString:", *(_QWORD *)(a1 + 40));
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__13201;
    v30 = __Block_byref_object_dispose__13202;
    v31 = 0;
    v4 = *(_QWORD **)(a1 + 32);
    if (v4)
      v4 = (_QWORD *)v4[11];
    v5 = v4;
    v6 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_2;
    v23[3] = &unk_1E894BD68;
    v7 = *(_QWORD *)(a1 + 32);
    v25 = &v26;
    v23[4] = v7;
    v8 = v3;
    v24 = v8;
    objc_msgSend(v5, "performReadingBlock:", v23);

    v9 = *(_QWORD *)(a1 + 32);
    if (v27[5])
    {
      if (v9)
        v10 = *(NSObject **)(v9 + 64);
      else
        v10 = 0;
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_3;
      block[3] = &unk_1E894BD68;
      v11 = (id *)v22;
      v12 = v2;
      v13 = *(_QWORD *)(a1 + 32);
      v22[0] = v12;
      v22[1] = v13;
      v22[2] = &v26;
      dispatch_async(v10, block);
    }
    else
    {
      if (v9)
        v14 = *(NSObject **)(v9 + 64);
      else
        v14 = 0;
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_4;
      v18[3] = &unk_1E894E120;
      v11 = (id *)v19;
      v15 = v2;
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      v19[0] = v15;
      v19[1] = v16;
      v20 = v17;
      dispatch_async(v14, v18);

    }
    _Block_object_dispose(&v26, 8);

  }
}

void __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0, 0);
}

uint64_t __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __71__HAPAccessoryServerBrowserHAP2Adapter_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 80);
  else
    v2 = 0;
  return objc_msgSend(v2, "stopDiscovering");
}

uint64_t __72__HAPAccessoryServerBrowserHAP2Adapter_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 80);
  else
    v2 = 0;
  return objc_msgSend(v2, "startDiscovering");
}

void __58__HAPAccessoryServerBrowserHAP2Adapter_setDelegate_queue___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 48));
}

@end
