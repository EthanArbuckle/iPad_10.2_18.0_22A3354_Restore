@implementation MRAVDiscoveryOutputDeviceDataSource

- (MRAVDiscoveryOutputDeviceDataSource)initWithConfiguration:(id)a3
{
  id v5;
  MRAVDiscoveryOutputDeviceDataSource *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSMutableArray *modificationRequests;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRAVDiscoveryOutputDeviceDataSource;
  v6 = -[MRAVDiscoveryOutputDeviceDataSource init](&v18, sel_init);
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ | %@"), v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    modificationRequests = v6->_modificationRequests;
    v6->_modificationRequests = (NSMutableArray *)v13;

    v15 = dispatch_queue_create("com.apple.MediaRemote.MRAVDiscoveryOutputDeviceDataSource/discoverySessionQueue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v15;

    -[MRAVDiscoveryOutputDeviceDataSource initialize](v6, "initialize");
  }

  return v6;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MRAVDiscoveryOutputDeviceDataSource_dealloc__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)MRAVDiscoveryOutputDeviceDataSource;
  -[MRAVDiscoveryOutputDeviceDataSource dealloc](&v4, sel_dealloc);
}

uint64_t __46__MRAVDiscoveryOutputDeviceDataSource_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeOutputDevicesChangedCallback:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDiscoveryMode:", 0);
}

- (id)createConfiguration
{
  return 0;
}

- (id)createOutputContext
{
  return 0;
}

- (id)outputDeviceFromMROutputDevice:(id)a3
{
  id v3;
  MROutputDevice *v4;

  v3 = a3;
  v4 = -[MROutputDevice initWithOutputDevice:]([MROutputDevice alloc], "initWithOutputDevice:", v3);

  return v4;
}

- (void)setDiscoveryMode:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  self->_discoveryMode = a3;
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MRAVDiscoveryOutputDeviceDataSource_setDiscoveryMode___block_invoke;
  v4[3] = &unk_1E30C78E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __56__MRAVDiscoveryOutputDeviceDataSource_setDiscoveryMode___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned int *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "discoverySession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoveryMode:", v1);

}

- (void)performModification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__MRAVDiscoveryOutputDeviceDataSource_performModification_completion___block_invoke;
  v11[3] = &unk_1E30CED18;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __70__MRAVDiscoveryOutputDeviceDataSource_performModification_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "modificationRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", a1[4]);

    objc_msgSend(v4, "updatePendingOutputDevices");
    objc_msgSend(v4, "outputContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "groupTopologyModificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__MRAVDiscoveryOutputDeviceDataSource_performModification_completion___block_invoke_2;
    v9[3] = &unk_1E30CF858;
    objc_copyWeak(&v12, v2);
    v10 = a1[4];
    v11 = a1[5];
    objc_msgSend(v6, "modifyTopologyWithRequest:withReplyQueue:completion:", v7, v8, v9);

    objc_destroyWeak(&v12);
  }

}

void __70__MRAVDiscoveryOutputDeviceDataSource_performModification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "modificationRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v4, "updatePendingOutputDevices");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (BOOL)compatibleWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MRAVDiscoveryOutputDeviceDataSource configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

+ (BOOL)compatibleWithConfiguration:(id)a3
{
  return 0;
}

- (void)outputContextOutputDevicesDidChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__MRAVDiscoveryOutputDeviceDataSource_outputContextOutputDevicesDidChangeNotification___block_invoke;
  v5[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __87__MRAVDiscoveryOutputDeviceDataSource_outputContextOutputDevicesDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateSelectedOutputDevices");
    WeakRetained = v2;
  }

}

- (void)initialize
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__MRAVDiscoveryOutputDeviceDataSource_initialize__block_invoke;
  v4[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__MRAVDiscoveryOutputDeviceDataSource_initialize__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "createConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnableThrottling:", 1);
    +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:](MRAVRoutingDiscoverySession, "discoverySessionWithConfiguration:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDiscoverySession:", v5);
    objc_msgSend(v5, "setDiscoveryMode:", objc_msgSend(v3, "discoveryMode"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__MRAVDiscoveryOutputDeviceDataSource_initialize__block_invoke_2;
    v9[3] = &unk_1E30C7050;
    objc_copyWeak(&v10, v1);
    objc_msgSend(v5, "addOutputDevicesChangedCallback:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCallbackToken:", v6);

    objc_msgSend(v3, "createOutputContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOutputContext:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_outputContextOutputDevicesDidChangeNotification_, CFSTR("MRAVOutputContextOutputDevicesDidChangeNotification"), v7);

    objc_msgSend(v3, "updateAvailableOutputDevices");
    objc_msgSend(v3, "updateSelectedOutputDevices");

    objc_destroyWeak(&v10);
  }

}

void __49__MRAVDiscoveryOutputDeviceDataSource_initialize__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MRAVDiscoveryOutputDeviceDataSource_initialize__block_invoke_3;
    block[3] = &unk_1E30C5CA8;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __49__MRAVDiscoveryOutputDeviceDataSource_initialize__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAvailableOutputDevices");
}

- (void)updateAvailableOutputDevices
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSString *identifier;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[MRAVRoutingDiscoverySession availableOutputDevices](self->_discoverySession, "availableOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[MRAVDiscoveryOutputDeviceDataSource outputDeviceFromMROutputDevice:](self, "outputDeviceFromMROutputDevice:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }

  if (!-[NSSet isEqualToSet:](self->_selectedOutputDevices, "isEqualToSet:", v4))
  {
    objc_storeStrong((id *)&self->_availableOutputDevices, v4);
    _MRLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543618;
      v19 = identifier;
      v20 = 2114;
      v21 = v4;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ update available: %{public}@", buf, 0x16u);
    }

    -[MRAVDiscoveryOutputDeviceDataSource delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outputDeviceDataSource:didChangeAvailableOutputDevices:", self, v4);

  }
}

- (void)updatePendingOutputDevices
{
  void *v3;
  NSObject *v4;
  NSString *identifier;
  void *v6;
  int v7;
  NSString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[MROutputDeviceModificationRequest pendingSelectionforModifications:currentSelection:](MROutputDeviceModificationRequest, "pendingSelectionforModifications:currentSelection:", self->_modificationRequests, self->_selectedOutputDevices);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSSet isEqualToSet:](self->_pendingOutputDevices, "isEqualToSet:", v3))
  {
    objc_storeStrong((id *)&self->_pendingOutputDevices, v3);
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      v7 = 138543618;
      v8 = identifier;
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ update pending: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    -[MRAVDiscoveryOutputDeviceDataSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputDeviceDataSource:didChangePendingOutputDevices:", self, v3);

  }
}

- (void)updateSelectedOutputDevices
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSString *identifier;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[MRAVOutputContext outputDevices](self->_outputContext, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[MRAVDiscoveryOutputDeviceDataSource outputDeviceFromMROutputDevice:](self, "outputDeviceFromMROutputDevice:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }

  if (!-[NSSet isEqualToSet:](self->_selectedOutputDevices, "isEqualToSet:", v4))
  {
    objc_storeStrong((id *)&self->_selectedOutputDevices, v4);
    _MRLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543618;
      v19 = identifier;
      v20 = 2114;
      v21 = v4;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ update selected: %{public}@", buf, 0x16u);
    }

    -[MRAVDiscoveryOutputDeviceDataSource delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outputDeviceDataSource:didChangeSelectedOutputDevices:", self, v4);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MROutputDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (NSSet)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (void)setAvailableOutputDevices:(id)a3
{
  objc_storeStrong((id *)&self->_availableOutputDevices, a3);
}

- (NSSet)pendingOutputDevices
{
  return self->_pendingOutputDevices;
}

- (NSSet)selectedOutputDevices
{
  return self->_selectedOutputDevices;
}

- (MROutputDeviceDataSourceDelegate)delegate
{
  return (MROutputDeviceDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRAVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
  objc_storeStrong((id *)&self->_outputContext, a3);
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
  objc_storeStrong((id *)&self->_discoverySession, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)modificationRequests
{
  return self->_modificationRequests;
}

- (void)setModificationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_modificationRequests, a3);
}

- (id)callbackToken
{
  return self->_callbackToken;
}

- (void)setCallbackToken:(id)a3
{
  objc_storeStrong(&self->_callbackToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callbackToken, 0);
  objc_storeStrong((id *)&self->_modificationRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedOutputDevices, 0);
  objc_storeStrong((id *)&self->_pendingOutputDevices, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
