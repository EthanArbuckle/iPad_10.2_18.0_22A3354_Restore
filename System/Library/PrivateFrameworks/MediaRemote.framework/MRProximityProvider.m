@implementation MRProximityProvider

- (MRProximityProvider)init
{
  MRProximityProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *remoteDevices;
  NSMutableSet *v5;
  NSMutableSet *providingDevices;
  NSMutableDictionary *v7;
  NSMutableDictionary *behaviorResults;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRProximityProvider;
  v2 = -[MRProximityProvider init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    remoteDevices = v2->_remoteDevices;
    v2->_remoteDevices = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    providingDevices = v2->_providingDevices;
    v2->_providingDevices = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    behaviorResults = v2->_behaviorResults;
    v2->_behaviorResults = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_handleGroupSessionNotification_, CFSTR("MRActiveGroupSessionInfoDidChangeNotification"), 0);

  }
  return v2;
}

- (id)dictionaryRepresentation
{
  MRProximityProvider *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRProximityProvider proactiveDevice](v2, "proactiveDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("proactiveDevice"));

  -[MRProximityProvider remoteDevices](v2, "remoteDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("remoteDevices"));

  -[MRProximityProvider behaviorResults](v2, "behaviorResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("behaviorResults"));

  -[MRProximityProvider providingDevices](v2, "providingDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("providingDevices"));

  -[MRProximityProvider migratingDevice](v2, "migratingDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("migratingDevice"));

  objc_sync_exit(v2);
  return v3;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRProximityProvider dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return (NSString *)v6;
}

- (void)handleGroupSessionNotification:(id)a3
{
  MRProximityProvider *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRProximityProvider proactiveDevice](v4, "proactiveDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  if (v5)
    -[MRProximityProvider _recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:](v4, "_recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:", v5);

}

- (OS_dispatch_queue)dispatchQueue
{
  OS_dispatch_queue *dispatchQueue;
  OS_dispatch_queue *v3;
  id v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    v3 = dispatchQueue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
  }
  return v3;
}

- (void)receiveEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  MRProximityProvider *v24;
  _QWORD block[4];
  id v26;
  MRProximityProvider *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mediaRemoteID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MRProximityProvider receiveEvent:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  v13 = objc_msgSend(v4, "eventType");
  if (v13 <= 8)
  {
    if (((1 << v13) & 0x105) != 0)
    {
      -[MRProximityProvider _removeDeviceIfNeeded:](self, "_removeDeviceIfNeeded:", v5);
    }
    else if (((1 << v13) & 0x18) != 0)
    {
      -[MRProximityProvider _addDeviceIfNeeded:](self, "_addDeviceIfNeeded:", v5);
    }
    else if (v13 == 1)
    {
      -[MRProximityProvider progressEventHandler](self, "progressEventHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = MEMORY[0x1E0C809B0];
      if (v14)
      {
        -[MRProximityProvider dispatchQueue](self, "dispatchQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = __36__MRProximityProvider_receiveEvent___block_invoke;
        block[3] = &unk_1E30C5F40;
        v26 = v5;
        v27 = self;
        dispatch_async(v16, block);

      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      _MRLogForCategory(7uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v18;
        v30 = 2112;
        v31 = v5;
        _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] migrateForDevice<%@> beginning for device %@", buf, 0x16u);
      }

      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __36__MRProximityProvider_receiveEvent___block_invoke_89;
      v21[3] = &unk_1E30C72D8;
      v22 = v18;
      v23 = v5;
      v24 = self;
      v20 = v18;
      -[MRProximityProvider _migrateForDevice:completion:](self, "_migrateForDevice:completion:", v23, v21);

    }
  }
  if (objc_msgSend(v4, "expectsDisplayContext"))
    -[MRProximityProvider _beginProvidingDisplayContextIfNeeded:](self, "_beginProvidingDisplayContextIfNeeded:", v5);
  else
    -[MRProximityProvider _endProvidingDisplayContextIfNeeded:](self, "_endProvidingDisplayContextIfNeeded:", v5);

}

void __36__MRProximityProvider_receiveEvent___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(getPCProgressEventClass()), "initWithEventType:", 1);
  objc_msgSend(v3, "setMediaRemoteID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "progressEventHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v2)[2](v2, v3);

}

void __36__MRProximityProvider_receiveEvent___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(7uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] migrateForDevice<%@> completed for device %@ with error: %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "progressEventHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "dispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__MRProximityProvider_receiveEvent___block_invoke_90;
    block[3] = &unk_1E30C7328;
    v12 = v3;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v13 = v9;
    v14 = v10;
    dispatch_async(v8, block);

  }
}

void __36__MRProximityProvider_receiveEvent___block_invoke_90(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_alloc(getPCProgressEventClass());
  if (v2)
    v4 = (void *)objc_msgSend(v3, "initWithError:", *(_QWORD *)(a1 + 32));
  else
    v4 = (void *)objc_msgSend(v3, "initWithEventType:", 2);
  v6 = v4;
  objc_msgSend(v4, "setMediaRemoteID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "progressEventHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v6);

}

- (MRProximityProvider)initWithCoder:(id)a3
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)device:(id)a3 stateDidChange:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 3)
  {
    _MRLogForCategory(7uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "prepareError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Device %@ prepare failed with error %@.", buf, 0x16u);

    }
    v10 = objc_alloc_init(getPCMediaRemoteDisplayContextClass());
    objc_msgSend(v10, "setInteractionDirection:", 0);
    objc_msgSend(v6, "uid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMediaRemoteID:", v11);

    -[MRProximityProvider dispatchQueue](self, "dispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__MRProximityProvider_device_stateDidChange___block_invoke;
    v14[3] = &unk_1E30C5F40;
    v14[4] = self;
    v15 = v10;
    v13 = v10;
    dispatch_async(v12, v14);

  }
  else if (a4 == 2)
  {
    -[MRProximityProvider _recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:](self, "_recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:", v6);
  }

}

void __45__MRProximityProvider_device_stateDidChange___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "displayContextHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)_addDeviceIfNeeded:(id)a3
{
  id v4;
  MRProximityProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  MRMigrationDevice *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRProximityProvider remoteDevices](v5, "remoteDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[MRProximityProvider proactiveDevice](v5, "proactiveDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      _MRLogForCategory(7uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Initializing proactive device.", (uint8_t *)&v16, 2u);
      }

      +[MRMigrationDevice proactiveDevice](MRMigrationDevice, "proactiveDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRProximityProvider setProactiveDevice:](v5, "setProactiveDevice:", v10);

      -[MRProximityProvider proactiveDevice](v5, "proactiveDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", v5);

      -[MRProximityProvider proactiveDevice](v5, "proactiveDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "prepare");

    }
    v13 = -[MRMigrationDevice initWithUID:]([MRMigrationDevice alloc], "initWithUID:", v4);
    -[MRMigrationDevice setDelegate:](v13, "setDelegate:", v5);
    -[MRMigrationDevice prepare](v13, "prepare");
    _MRLogForCategory(7uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Adding device %@.", (uint8_t *)&v16, 0xCu);
    }

    -[MRProximityProvider remoteDevices](v5, "remoteDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v4);

  }
  objc_sync_exit(v5);

}

- (void)_removeDeviceIfNeeded:(id)a3
{
  id v4;
  MRProximityProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRProximityProvider _endProvidingDisplayContextIfNeeded:](v5, "_endProvidingDisplayContextIfNeeded:", v4);
  -[MRProximityProvider behaviorResults](v5, "behaviorResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);

  -[MRProximityProvider remoteDevices](v5, "remoteDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _MRLogForCategory(7uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[MRProximityProvider remoteDevices](v5, "remoteDevices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRProximityProvider remoteDevices](v5, "remoteDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endpoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRProximityProvider _nameForDevice:inEndpoint:](v5, "_nameForDevice:inEndpoint:", v12, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v4;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Removing device %@ (%@).", (uint8_t *)&v21, 0x16u);

    }
    -[MRProximityProvider remoteDevices](v5, "remoteDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v4);

    -[MRProximityProvider remoteDevices](v5, "remoteDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") == 0;

    if (v19)
    {
      _MRLogForCategory(7uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Clearing proactive device.", (uint8_t *)&v21, 2u);
      }

      -[MRProximityProvider setProactiveDevice:](v5, "setProactiveDevice:", 0);
    }
  }
  objc_sync_exit(v5);

}

- (void)_beginProvidingDisplayContextIfNeeded:(id)a3
{
  id v4;
  MRProximityProvider *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRProximityProvider _deviceForUID:](v5, "_deviceForUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MRProximityProvider providingDevices](v5, "providingDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if ((v8 & 1) == 0)
    {
      -[MRProximityProvider providingDevices](v5, "providingDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

      _MRLogForCategory(7uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "uid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "endpoint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRProximityProvider _nameForDevice:inEndpoint:](v5, "_nameForDevice:inEndpoint:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412546;
        v28 = v4;
        v29 = 2112;
        v30 = v23;
        _os_log_debug_impl(&dword_193827000, v10, OS_LOG_TYPE_DEBUG, "[ProximityProvider] Begin providing for device %@ (%@).", (uint8_t *)&v27, 0x16u);

      }
    }
    if (objc_msgSend(v6, "deviceState") == 2)
    {
      -[MRProximityProvider behaviorResults](v5, "behaviorResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "uid");
        v14 = objc_claimAutoreleasedReturnValue();
        -[MRProximityProvider _provideDisplayContextForDevice:](v5, "_provideDisplayContextForDevice:", v14);
      }
      else
      {
        _MRLogForCategory(7uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v6, "uid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "endpoint");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRProximityProvider _nameForDevice:inEndpoint:](v5, "_nameForDevice:inEndpoint:", v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138412546;
          v28 = v4;
          v29 = 2112;
          v30 = v26;
          _os_log_debug_impl(&dword_193827000, v14, OS_LOG_TYPE_DEBUG, "[ProximityProvider] Cannot provide because no result has been calculated yet for device %@ (%@).", (uint8_t *)&v27, 0x16u);

        }
      }

    }
    else
    {
      _MRLogForCategory(7uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[MRProximityProvider _beginProvidingDisplayContextIfNeeded:].cold.1((uint64_t)v4, v13, v15, v16, v17, v18, v19, v20);
    }

  }
  objc_sync_exit(v5);

}

- (void)_endProvidingDisplayContextIfNeeded:(id)a3
{
  id v4;
  MRProximityProvider *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MRProximityProvider providingDevices](v5, "providingDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    -[MRProximityProvider _deviceForUID:](v5, "_deviceForUID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(7uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "uid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endpoint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRProximityProvider _nameForDevice:inEndpoint:](v5, "_nameForDevice:inEndpoint:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v13;
      _os_log_debug_impl(&dword_193827000, v9, OS_LOG_TYPE_DEBUG, "[ProximityProvider] End providing for device %@ (%@).", (uint8_t *)&v14, 0x16u);

    }
    -[MRProximityProvider providingDevices](v5, "providingDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v4);

  }
  objc_sync_exit(v5);

}

- (void)_provideDisplayContextForDevice:(id)a3
{
  id v4;
  void *v5;
  MRProximityProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  -[MRProximityProvider displayContextHandler](self, "displayContextHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[MRProximityProvider _deviceForUID:](v6, "_deviceForUID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProximityProvider _effectivePlayerStateForDevice:](v6, "_effectivePlayerStateForDevice:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProximityProvider proactiveDevice](v6, "proactiveDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProximityProvider behaviorResults](v6, "behaviorResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProximityProvider _displayContextForDevice:withRemotePlayerState:proactivePlayerState:migrationBehavior:](v6, "_displayContextForDevice:withRemotePlayerState:proactivePlayerState:migrationBehavior:", v7, v8, v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRProximityProvider dispatchQueue](v6, "dispatchQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__MRProximityProvider__provideDisplayContextForDevice___block_invoke;
    v17[3] = &unk_1E30C5F40;
    v17[4] = v6;
    v18 = v14;
    v16 = v14;
    dispatch_async(v15, v17);

    objc_sync_exit(v6);
  }
  else
  {
    _MRLogForCategory(7uLL);
    v6 = (MRProximityProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
      -[MRProximityProvider _provideDisplayContextForDevice:].cold.1(&v6->super);
  }

}

void __55__MRProximityProvider__provideDisplayContextForDevice___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "displayContextHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (id)_displayContextForDevice:(id)a3 withRemotePlayerState:(id)a4 proactivePlayerState:(id)a5 migrationBehavior:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  __CFString *v32;
  NSObject *v33;
  const __CFString *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  const __CFString *v40;
  void *v41;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  __CFString *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  __CFString *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(getPCMediaRemoteDisplayContextClass());
  objc_msgSend(v14, "setProxDeviceState:", v11);
  objc_msgSend(v14, "setSelectedDeviceState:", v12);
  v61 = v10;
  objc_msgSend(v10, "uid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMediaRemoteID:", v15);

  v60 = v13;
  if (objc_msgSend(v13, "action") == 2)
  {
    v16 = 2;
    v17 = v11;
  }
  else
  {
    if (!objc_msgSend(v13, "action"))
    {
      objc_msgSend(v14, "setInteractionDirection:", 0);
      v19 = 0;
      goto LABEL_9;
    }
    v16 = 1;
    v17 = v12;
  }
  objc_msgSend(v14, "setInteractionDirection:", v16);
  objc_msgSend(v17, "playbackQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentItemWithOffset:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[MRProximityProvider _displayStringForContentItem:](self, "_displayStringForContentItem:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLegacyBodyText:", v20);

    objc_msgSend(v19, "artwork");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v19, "artwork");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "imageData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRProximityProvider _persistArtworkData:forDevice:](self, "_persistArtworkData:forDevice:", v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLegacyAttachmentURL:", v26);

    }
  }
LABEL_9:
  if (MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(v11, "playbackState"))
    || objc_msgSend(v11, "playerHasPlayedRecently"))
  {
    objc_msgSend(v11, "playbackQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentItemWithOffset:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[MRProximityProvider _displayStringForContentItem:](self, "_displayStringForContentItem:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLocalizedSecondaryAltText:", v29);

    }
  }
  _MRLogForCategory(7uLL);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "legacyBodyText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedSecondaryAltText");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v63 = v31;
    v64 = 2112;
    v65 = v32;
    _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Legacy: %@. V2: %@.", buf, 0x16u);

  }
  _MRLogForCategory(7uLL);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v61, "uid");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(objc_msgSend(v12, "playbackState"));
    objc_msgSend(v12, "playbackQueue");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "contentItemWithOffset:", 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "identifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playbackQueue");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "contentItemWithOffset:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "artwork");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "imageData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = CFSTR("YES");
    if (!v49)
      v34 = CFSTR("NO");
    v45 = v34;
    objc_msgSend(v12, "playerLastPlayingDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v14;
    v35 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(objc_msgSend(v11, "playbackState"));
    objc_msgSend(v11, "playbackQueue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "contentItemWithOffset:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playbackQueue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contentItemWithOffset:", 0);
    v56 = v19;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "artwork");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "imageData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v12;
    if (v38)
      v40 = CFSTR("YES");
    else
      v40 = CFSTR("NO");
    objc_msgSend(v11, "playerLastPlayingDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    v63 = v59;
    v64 = 2112;
    v65 = v58;
    v66 = 2112;
    v67 = v57;
    v68 = 2112;
    v69 = v45;
    v70 = 2112;
    v71 = v44;
    v72 = 2112;
    v73 = v35;
    v74 = 2112;
    v75 = v36;
    v76 = 2112;
    v77 = v40;
    v12 = v39;
    v78 = 2112;
    v79 = v41;
    _os_log_impl(&dword_193827000, v33, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Context for %{public}@ - Proactive: state=%@, item=%@, art=%@, lpd=%@. Remote: state=%@, item=%@, art=%@, lpd=%@", buf, 0x5Cu);

    v19 = v56;
    v14 = v51;

  }
  return v14;
}

- (id)_displayStringForContentItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackArtistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "trackArtistName");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "albumArtistName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v9)
    {
      objc_msgSend(v10, "albumArtistName");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "radioStationName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_9:
        objc_msgSend(v3, "metadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v14, "copy");
        goto LABEL_10;
      }
      objc_msgSend(v3, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "radioStationName");
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = (void *)v8;

  if (!v12)
    goto LABEL_9;
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  MRLocalizedString(CFSTR("HANDOFF_PILL_TITLE_ARTIST_DELIMITER"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@ %@"), v15, v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v17;
}

- (id)_persistArtworkData:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v17);
  v11 = v17;

  if (v11)
  {
    _MRLogForCategory(7uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MRProximityProvider _persistArtworkData:forDevice:].cold.1();
  }
  else
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v5, "writeToURL:options:error:", v12, 1, &v16);
    v11 = v16;
    if (!v11)
    {
      v12 = v12;
      v14 = v12;
      goto LABEL_9;
    }
    _MRLogForCategory(7uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MRProximityProvider _persistArtworkData:forDevice:].cold.1();

  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (void)_recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:(id)a3
{
  MRProximityProvider *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRProximityProvider proactiveDevice](v4, "proactiveDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v15)
  {
    -[MRProximityProvider remoteDevices](v4, "remoteDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_sync_exit(v4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "isPrepared"))
        {
          objc_msgSend(v13, "uid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = v11;
          v16[1] = 3221225472;
          v16[2] = __93__MRProximityProvider__recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice___block_invoke;
          v16[3] = &unk_1E30CFC68;
          v16[4] = v4;
          v16[5] = v13;
          -[MRProximityProvider _migrationBehaviorForRemoteDevice:completion:](v4, "_migrationBehaviorForRemoteDevice:completion:", v14, v16);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

void __93__MRProximityProvider__recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_nameForDevice:inEndpoint:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "behaviorResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "remoteDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    _MRLogForCategory(7uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "uid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v16;
      v38 = 2112;
      v39 = v8;
      _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Device %{public}@ (%@) was removed while updating result. Ignoring.", (uint8_t *)&v36, 0x16u);

    }
  }
  _MRLogForCategory(7uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "uid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138412802;
    v37 = v35;
    v38 = 2112;
    v39 = v8;
    v40 = 2112;
    v41 = v3;
    _os_log_debug_impl(&dword_193827000, v17, OS_LOG_TYPE_DEBUG, "[ProximityProvider] Result for device %@ (%@):\n%@", (uint8_t *)&v36, 0x20u);

  }
  if ((objc_msgSend(v11, "isEqual:", v3) & 1) == 0)
  {
    objc_msgSend(v3, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      _MRLogForCategory(7uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "uid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "error");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543874;
        v37 = v20;
        v38 = 2112;
        v39 = v8;
        v40 = 2114;
        v41 = v21;
        _os_log_error_impl(&dword_193827000, v19, OS_LOG_TYPE_ERROR, "[ProximityProvider] Error for device %{public}@ (%@) : %{public}@", (uint8_t *)&v36, 0x20u);

      }
    }
    else
    {
      _MRLogForCategory(7uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "reason");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543874;
        v37 = v22;
        v38 = 2112;
        v39 = v8;
        v40 = 2114;
        v41 = v23;
        _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Behavior for device %{public}@ (%@) : %{public}@", (uint8_t *)&v36, 0x20u);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "behaviorResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v3, v25);

  }
  objc_msgSend(*(id *)(a1 + 32), "providingDevices");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "containsObject:", v27);

  if (v28)
  {
    v29 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_provideDisplayContextForDevice:", v30);

  }
  objc_msgSend(*(id *)(a1 + 32), "behaviorCallback");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (!v32)
  {
    objc_msgSend(*(id *)(a1 + 32), "behaviorCallback");
    v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uid");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v33)[2](v33, v34, v3);

  }
  objc_sync_exit(v4);

}

- (id)_deviceForUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  MRProximityProvider *v9;
  void *v10;

  v4 = a3;
  -[MRProximityProvider proactiveDevice](self, "proactiveDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    -[MRProximityProvider proactiveDevice](self, "proactiveDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = self;
    objc_sync_enter(v9);
    -[MRProximityProvider remoteDevices](v9, "remoteDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v9);
  }

  return v8;
}

- (void)_migrateForDevice:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[MRProximityProvider migratingDevice](self, "migratingDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  -[MRProximityProvider migratingDevice](self, "migratingDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[MRProximityProvider migratingDevice](self, "migratingDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("A migration is already in progress for device %@."), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 3, v12);
    v7[2](v7, v13);

    objc_sync_exit(v8);
  }
  else
  {
    -[MRProximityProvider setMigratingDevice:](self, "setMigratingDevice:", v6);
    objc_sync_exit(v8);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__MRProximityProvider__migrateForDevice_completion___block_invoke;
    v14[3] = &unk_1E30CFC90;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    -[MRProximityProvider _migrationBehaviorForRemoteDevice:completion:](self, "_migrationBehaviorForRemoteDevice:completion:", v15, v14);

  }
}

void __52__MRProximityProvider__migrateForDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "action") == 2)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v4, "sourceUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_deviceForUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endpoint");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v4, "action") != 3 && objc_msgSend(v4, "action") != 1)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "reason");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("Action == None because %@"), v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "migratingDevice");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v40);
        objc_msgSend(*(id *)(a1 + 32), "setMigratingDevice:", 0);
        objc_sync_exit(v40);

        v41 = *(_QWORD *)(a1 + 48);
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 3, v39);
        (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v42);

        goto LABEL_17;
      }
      v21 = *(void **)(a1 + 32);
      objc_msgSend(v4, "sourceUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_deviceForUID:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "endpoint");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *(void **)(a1 + 32);
      objc_msgSend(v4, "destinationUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_deviceForUID:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "endpoint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 32), "_outputDeviceWithUID:fromSource:andDestination:", *(_QWORD *)(a1 + 40), v43, v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_deviceForUID:", *(_QWORD *)(a1 + 40));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(7uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(void **)(a1 + 32);
      v30 = *(void **)(a1 + 40);
      objc_msgSend(v28, "uid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "endpoint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_nameForDevice:inEndpoint:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v30;
      v48 = 2112;
      v49 = v34;
      v50 = 2112;
      v51 = v4;
      _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] migrateForDevice %{public}@ (%@) evaluated result:\n%@", buf, 0x20u);

    }
    _MRLogForCategory(7uLL);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v47 = v43;
      v48 = 2114;
      v49 = v8;
      v50 = 2114;
      v51 = v27;
      _os_log_impl(&dword_193827000, v35, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Will migrate with source %{public}@, dest %{public}@, outputDevice %{public}@.", buf, 0x20u);
    }

    objc_msgSend(v4, "destinationUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __52__MRProximityProvider__migrateForDevice_completion___block_invoke_122;
    v44[3] = &unk_1E30C75E8;
    v44[4] = *(_QWORD *)(a1 + 32);
    v45 = *(id *)(a1 + 48);
    +[MRProximityProvider _migrate:destinationEndpoint:destinationUID:outputDevice:label:completion:](MRProximityProvider, "_migrate:destinationEndpoint:destinationUID:outputDevice:label:completion:", v43, v8, v36, v27, CFSTR("MRProximityProvider"), v44);

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "proactiveDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("proactiveDevice"));

    objc_msgSend(*(id *)(a1 + 32), "proactiveDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("proactivePlayerState"));

    objc_msgSend(*(id *)(a1 + 32), "_deviceForUID:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("remoteDevice"));

    objc_msgSend(*(id *)(a1 + 32), "_deviceForUID:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playerState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("remotePlayerState"));

    _MRLogForCategory(7uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __52__MRProximityProvider__migrateForDevice_completion___block_invoke_cold_1((uint64_t *)(a1 + 40), v16);

    MRLogCategoryMigrationOversize();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v9;
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "migratingDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v18);
    objc_msgSend(*(id *)(a1 + 32), "setMigratingDevice:", 0);
    objc_sync_exit(v18);

    v19 = *(_QWORD *)(a1 + 48);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 3, CFSTR("No valid behavior exists for device."));
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

  }
LABEL_17:

}

void __52__MRProximityProvider__migrateForDevice_completion___block_invoke_122(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "migratingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "setMigratingDevice:", 0);
  objc_sync_exit(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_outputDeviceWithUID:(id)a3 fromSource:(id)a4 andDestination:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__MRProximityProvider__outputDeviceWithUID_fromSource_andDestination___block_invoke;
  v20[3] = &unk_1E30C5F68;
  v10 = v7;
  v21 = v10;
  objc_msgSend(a4, "outputDevicesMatchingPredicate:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v15 = v9;
    v16 = 3221225472;
    v17 = __70__MRProximityProvider__outputDeviceWithUID_fromSource_andDestination___block_invoke_2;
    v18 = &unk_1E30C5F68;
    v19 = v10;
    objc_msgSend(v8, "outputDevicesMatchingPredicate:", &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject", v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

uint64_t __70__MRProximityProvider__outputDeviceWithUID_fromSource_andDestination___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__MRProximityProvider__outputDeviceWithUID_fromSource_andDestination___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

- (void)_migrationBehaviorForRemoteDevice:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[MRProximityProvider _deviceForUID:](self, "_deviceForUID:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MRProximityProvider proactiveDevice](self, "proactiveDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRProximityProvider _migrationBehaviorForRemoteDevice:proactiveDevice:completion:](self, "_migrationBehaviorForRemoteDevice:proactiveDevice:completion:", v8, v7, v6);

}

- (void)_migrationBehaviorForRemoteDevice:(id)a3 proactiveDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, MRMigrationBehaviorResult *);
  MRMigrationBehaviorResult *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  MRMigrationBehaviorResult *v29;
  void (**v30)(id, MRMigrationBehaviorResult *);
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, MRMigrationBehaviorResult *))a5;
  if (v8 && v9 && objc_msgSend(v9, "isPrepared") && (objc_msgSend(v8, "isPrepared") & 1) != 0)
  {
    v11 = objc_alloc_init(MRMigrationBehaviorResult);
    objc_msgSend(v9, "playerState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProximityProvider _effectivePlayerStateForDevice:](self, "_effectivePlayerStateForDevice:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v16 = -[MRProximityProvider migrationActionForProactivePlayer:proactiveEndpoint:remotePlayer:remoteEndpoint:reason:](self, "migrationActionForProactivePlayer:proactiveEndpoint:remotePlayer:remoteEndpoint:reason:", v12, v14, v13, v15, &v31);
    v17 = v31;

    -[MRMigrationBehaviorResult setAction:](v11, "setAction:", v16);
    -[MRMigrationBehaviorResult setReason:](v11, "setReason:", v17);
    if (v16 == 2)
    {
      v26 = v13;
      v27 = v12;
      v18 = v8;
      objc_msgSend(v18, "endpoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v9;
      +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", 0);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v16)
      {
        v10[2](v10, v11);
LABEL_18:

        goto LABEL_9;
      }
      v26 = v13;
      v27 = v12;
      v18 = v9;
      objc_msgSend(v18, "endpoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v8;
      objc_msgSend(v20, "endpoint");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    objc_msgSend(v18, "uid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMigrationBehaviorResult setSourceUID:](v11, "setSourceUID:", v23);

    objc_msgSend(v20, "uid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMigrationBehaviorResult setDestinationUID:](v11, "setDestinationUID:", v24);

    if ((objc_msgSend(v19, "isLocalEndpoint") & 1) == 0
      && ((objc_msgSend(v19, "isLocalEndpoint") & 1) != 0 || (objc_msgSend(v22, "isLocalEndpoint") & 1) != 0))
    {
      dispatch_get_global_queue(0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __84__MRProximityProvider__migrationBehaviorForRemoteDevice_proactiveDevice_completion___block_invoke;
      v28[3] = &unk_1E30C75E8;
      v29 = v11;
      v30 = v10;
      objc_msgSend(v19, "canMigrateToEndpoint:queue:completion:", v22, v25, v28);

    }
    else
    {
      v10[2](v10, v11);
    }
    v12 = v27;

    v13 = v26;
    goto LABEL_18;
  }
  v10[2](v10, 0);
LABEL_9:

}

uint64_t __84__MRProximityProvider__migrationBehaviorForRemoteDevice_proactiveDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "setAction:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setError:", v4);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_effectivePlayerStateForDevice:(id)a3
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  MRNowPlayingPlayerResponse *v14;
  MRDestination *v15;
  void *v16;
  void *v17;
  MRDestination *v18;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(v4, "prepareError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  objc_msgSend(v4, "playerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLocalEndpoint");
  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outputDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54__MRProximityProvider__effectivePlayerStateForDevice___block_invoke;
    v20[3] = &unk_1E30C5F68;
    v3 = &v21;
    v21 = v4;
    objc_msgSend(v12, "mr_first:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "isProxyGroupPlayer");

  }
  if (v6 != 42 && v7 && !v10)
  {
    objc_msgSend(v4, "playerState");
    v14 = (MRNowPlayingPlayerResponse *)objc_claimAutoreleasedReturnValue();
    if ((v9 & 1) != 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v14 = objc_alloc_init(MRNowPlayingPlayerResponse);
  v15 = [MRDestination alloc];
  objc_msgSend(v4, "endpoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "origin");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MRDestination initWithOrigin:](v15, "initWithOrigin:", v17);
  -[MRNowPlayingPlayerResponse setDestination:](v14, "setDestination:", v18);

  -[MRNowPlayingPlayerResponse setPlaybackState:](v14, "setPlaybackState:", 0);
  if ((v9 & 1) == 0)
LABEL_10:

LABEL_11:
  return v14;
}

uint64_t __54__MRProximityProvider__effectivePlayerStateForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsUID:", v4);

  return v5;
}

- (int64_t)migrationActionForProactivePlayer:(id)a3 proactiveEndpoint:(id)a4 remotePlayer:(id)a5 remoteEndpoint:(id)a6 reason:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 IsAdvancing;
  _BOOL4 v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  int64_t v24;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  double v41;
  id *v42;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(v11, "playbackState"));
  v16 = MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(v13, "playbackState"));
  objc_msgSend(v11, "playerPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "origin");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isLocal");

  if (!MRGroupSessionAllowsMigrationForEndpoint(v12))
  {
    v24 = 0;
    *a7 = CFSTR("Proactive endpoint is QHO-restricted group session endpoint.");
    goto LABEL_7;
  }
  v42 = a7;
  objc_msgSend(v12, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if (!v22)
  {
    v26 = !v16;
    if (!IsAdvancing || (v26 & 1) != 0)
    {
      if (!IsAdvancing || v16)
      {
        if (((IsAdvancing | v26) & 1) == 0)
        {
          v23 = CFSTR("Remote is playing -> Pull from remote.");
          goto LABEL_4;
        }
        if (IsAdvancing || v16)
        {
          v24 = 0;
          goto LABEL_7;
        }
        objc_msgSend(v11, "playbackQueue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "contentItems");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "count"))
        {
          v31 = objc_msgSend(v11, "playerHasPlayedRecently");

          if (v31)
          {
            v32 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v11, "playerLastPlayingDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "timeIntervalSinceNow");
            v35 = -v34;
            if (v19)
            {
              objc_msgSend(v32, "stringWithFormat:", CFSTR("Proactive == local, has queue, was playing recently (%.0lf seconds ago) -> Push to remote."), *(_QWORD *)&v35);
              *v42 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_20;
            }
            objc_msgSend(v32, "stringWithFormat:", CFSTR("Proactive != local, has queue, was playing recently (%.0lf seconds ago) -> Add remote to group."), *(_QWORD *)&v35);
            *v42 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
            v24 = 3;
            goto LABEL_7;
          }
        }
        else
        {

        }
        objc_msgSend(v13, "playbackQueue");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "contentItems");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "count"))
        {
          v38 = objc_msgSend(v13, "playerHasPlayedRecently");

          if (v38)
          {
            v39 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v11, "playerLastPlayingDate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "timeIntervalSinceNow");
            objc_msgSend(v39, "stringWithFormat:", CFSTR("Remote has queue, was playing recently (%.0lf seconds ago) -> Pull from remote."), -v41);
            *v42 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_5;
          }
        }
        else
        {

        }
        v24 = 0;
        *v42 = CFSTR("Neither device has a recently played queue.");
        goto LABEL_7;
      }
      if (v19)
      {
        v27 = CFSTR("Proactive == local and proactive is playing -> Push to remote.");
        goto LABEL_19;
      }
      v28 = CFSTR("Proactive != local and proactive is playing -> Add remote to group.");
    }
    else
    {
      if (v19)
      {
        v27 = CFSTR("Proactive == local and both proactive and remote are playing -> Push to remote.");
LABEL_19:
        *v42 = (id)v27;
LABEL_20:
        v24 = 1;
        goto LABEL_7;
      }
      v28 = CFSTR("Proactive != local and both proactive and remote are playing -> Add remote to group.");
    }
    *v42 = (id)v28;
    goto LABEL_24;
  }
  v23 = CFSTR("Proactive == remote -> Pull from remote back to local.");
LABEL_4:
  *v42 = (id)v23;
LABEL_5:
  v24 = 2;
LABEL_7:

  return v24;
}

+ (void)_migrate:(id)a3 destinationEndpoint:(id)a4 destinationUID:(id)a5 outputDevice:(id)a6 label:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  MRPlaybackSessionMigrateRequest *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  MRPlaybackSessionMigrateRequest *v25;
  id v26;
  void (**v27)(_QWORD, _QWORD);
  id v28;
  id v29;
  MRPlaybackSessionMigrateRequest *v30;
  void (**v31)(_QWORD, _QWORD);
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  MRPlaybackSessionMigrateRequest *v39;
  id v40;
  __CFString *v41;
  id v42;
  id v43;
  void (**v44)(_QWORD, _QWORD);
  _QWORD v45[4];
  __CFString *v46;
  MRPlaybackSessionMigrateRequest *v47;
  id v48;
  void (**v49)(_QWORD, _QWORD);
  _QWORD v50[4];
  id v51;
  id v52;
  __CFString *v53;
  MRPlaybackSessionMigrateRequest *v54;
  _QWORD v55[4];
  MRPlaybackSessionMigrateRequest *v56;
  __CFString *v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v34 = a5;
  v33 = a6;
  v15 = a7;
  v16 = a8;
  v17 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
  -[MRPlaybackSessionMigrateRequest setInitiator:](v17, "setInitiator:", CFSTR("proximity"));
  -[MRPlaybackSessionMigrateRequest setPlayerOptions:](v17, "setPlayerOptions:", -[MRPlaybackSessionMigrateRequest playerOptions](v17, "playerOptions") | 4);
  -[MRPlaybackSessionMigrateRequest setPlayerOptions:](v17, "setPlayerOptions:", -[MRPlaybackSessionMigrateRequest playerOptions](v17, "playerOptions") | 0x40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackSessionMigrateRequest startEvent:](v17, "startEvent:", CFSTR("migrateProximity"));
  v19 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[MRPlaybackSessionMigrateRequest requestID](v17, "requestID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("migrateProximity"), v20);

  if (v15)
    objc_msgSend(v21, "appendFormat:", CFSTR(" for %@"), v15);
  v37 = v21;
  v22 = v14;
  _MRLogForCategory(0xAuLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v37;
    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v24 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke;
  v55[3] = &unk_1E30CD3A8;
  v25 = v17;
  v56 = v25;
  v57 = CFSTR("migrateProximity");
  v26 = v15;
  v58 = v26;
  v35 = v18;
  v59 = v35;
  v36 = v16;
  v60 = v36;
  v27 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v55);
  v50[0] = v24;
  v50[1] = 3221225472;
  v50[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_160;
  v50[3] = &unk_1E30CFCB8;
  v28 = v33;
  v51 = v28;
  v29 = v34;
  v52 = v29;
  v53 = CFSTR("migrateProximity");
  v30 = v25;
  v54 = v30;
  v31 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v50);
  if ((objc_msgSend(v13, "isLocalEndpoint") & 1) != 0 || v22 && (objc_msgSend(v22, "isLocalEndpoint") & 1) != 0)
  {
    if (objc_msgSend(v22, "isLocalEndpoint"))
    {
      -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") | 2);
      -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") | 4);
      -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") | 0x10);
      -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") | 0x20);
      -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v30, "setEndpointOptions:", -[MRPlaybackSessionMigrateRequest endpointOptions](v30, "endpointOptions") & 0xFFFFFFFFFFFFFFF7);
      objc_msgSend(v13, "migrateToEndpoint:request:queue:completion:", v22, v30, MEMORY[0x1E0C80D38], v27);
    }
    else if (objc_msgSend(v13, "isLocalEndpoint"))
    {
      v38[0] = v24;
      v38[1] = 3221225472;
      v38[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2_169;
      v38[3] = &unk_1E30CFD08;
      v44 = v27;
      v39 = v30;
      v40 = v22;
      v41 = CFSTR("migrateProximity");
      v42 = v29;
      v43 = v13;
      ((void (**)(_QWORD, _QWORD *))v31)[2](v31, v38);

    }
    else
    {
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 2, CFSTR("Error in migrate. No cases matched. Please examine the state prior to this error."));
      ((void (**)(_QWORD, void *))v27)[2](v27, v32);

    }
  }
  else
  {
    v45[0] = v24;
    v45[1] = 3221225472;
    v45[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2;
    v45[3] = &unk_1E30CFCE0;
    v49 = v27;
    v46 = CFSTR("migrateProximity");
    v47 = v30;
    v48 = v13;
    ((void (**)(_QWORD, _QWORD *))v31)[2](v31, v45);

  }
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", *(_QWORD *)(a1 + 40), v3);
  v4 = *(_QWORD *)(a1 + 48);
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (!v7)
        goto LABEL_15;
      v8 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v30 = 138544386;
      v31 = v8;
      v32 = 2114;
      v33 = v9;
      v34 = 2114;
      v35 = v3;
      v36 = 2114;
      v37 = v10;
      v38 = 2048;
      v39 = v12;
      v13 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v14 = v6;
      v15 = 52;
    }
    else
    {
      if (!v7)
        goto LABEL_15;
      v23 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v30 = 138544130;
      v31 = v23;
      v32 = 2114;
      v33 = v9;
      v34 = 2114;
      v35 = v3;
      v36 = 2048;
      v37 = v24;
      v13 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      v14 = v6;
      v15 = 42;
    }
    _os_log_error_impl(&dword_193827000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v30, v15);
  }
  else
  {
    v16 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v16)
        goto LABEL_15;
      v17 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v30 = 138544130;
      v31 = v17;
      v32 = 2114;
      v33 = v9;
      v34 = 2114;
      v35 = v18;
      v36 = 2048;
      v37 = v19;
      v20 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v21 = v6;
      v22 = 42;
    }
    else
    {
      if (!v16)
        goto LABEL_15;
      v25 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v30 = 138543874;
      v31 = v25;
      v32 = 2114;
      v33 = v9;
      v34 = 2048;
      v35 = v26;
      v20 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v21 = v6;
      v22 = 32;
    }
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v30, v22);
  }

LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "finalize");
  MRLogCategoryMigrationOversize();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "report");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    v31 = v28;
    _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v30, 0xCu);

  }
  v29 = *(_QWORD *)(a1 + 64);
  if (v29)
    (*(void (**)(uint64_t, id))(v29 + 16))(v29, v3);

}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_160(uint64_t a1, _QWORD *a2)
{
  void (*v2)(void);
  _QWORD *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MRAVLightweightReconnaissanceSession *v10;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void (*)(void))a2[2];
    v10 = a2;
    v2();
  }
  else
  {
    v4 = a2;
    v10 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "requestID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@<%@>"), v7, v8);
    -[MRAVLightweightReconnaissanceSession searchForOutputDeviceUID:timeout:reason:queue:completion:](v10, "searchForOutputDeviceUID:timeout:reason:queue:completion:", v5, v9, MEMORY[0x1E0C80D38], v4, 7.0);

  }
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "requestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      v23 = 2112;
      v24 = CFSTR("Adding prox device to proactiveEndpoint");
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setRequestType:", 2);
    objc_msgSend(*(id *)(a1 + 40), "startEvent:", CFSTR("addOutputDevices"));
    v9 = *(void **)(a1 + 40);
    v18 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addDestinationTypesFromDevices:", v10);

    v11 = *(void **)(a1 + 48);
    v17 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_167;
    v14[3] = &unk_1E30C75E8;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v11, "addOutputDevices:initiator:withReplyQueue:completion:", v12, v13, MEMORY[0x1E0C80D38], v14);

  }
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_167(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("addOutputDevices"), v4);
  if (!v4 && (objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 4) != 0)
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  else
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  v3();

}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2_169(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 2);
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") & 0xFFFFFFFFFFFFFFFBLL);
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 0x10);
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") & 0xFFFFFFFFFFFFFFDFLL);
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 8);
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportNewMigrationBehaviorForProximity");

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 0x40);
    if (*(_QWORD *)(a1 + 40))
    {
      v8 = *(void **)(a1 + 64);
      v20 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "migrateToOutputDevices:request:initiator:queue:completion:", v9, *(_QWORD *)(a1 + 32), 0, MEMORY[0x1E0C80D38], *(_QWORD *)(a1 + 72));

    }
    else
    {
      _MRLogForCategory(0xAuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 48);
        v12 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        v23 = v11;
        v24 = 2114;
        v25 = v12;
        v26 = 2112;
        v27 = CFSTR("Falling back to setOutputDevice because destination is not remote-controllable.");
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("setOutputDevice"));
      v13 = ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "playerOptions") >> 6) & 1;
      v14 = *(void **)(a1 + 64);
      v21 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_175;
      v16[3] = &unk_1E30C6878;
      v17 = *(id *)(a1 + 32);
      v18 = *(id *)(a1 + 48);
      v19 = *(id *)(a1 + 72);
      objc_msgSend(v14, "setOutputDevices:initiator:fadeAudio:withReplyQueue:completion:", v15, CFSTR("MRProximityProvider"), v13, MEMORY[0x1E0C80D38], v16);

    }
  }

}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("setOutputDevice"), v3);
  if (!v3 && (objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("play"));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@<%@>"), v6, v7);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2_178;
    v9[3] = &unk_1E30C9458;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    MRMediaRemoteSendCommandToPlayer(0, v4, 0, 0, MEMORY[0x1E0C80D38], v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2_178(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("play"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_nameForDevice:(id)a3 inEndpoint:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a4, "outputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    v24 = *(_QWORD *)v31;
    v25 = v6;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "clusterComposition", v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v11, "clusterComposition");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "uid");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "isEqualToString:", v5);

                if ((v19 & 1) != 0)
                {
                  objc_msgSend(v11, "name");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  v6 = v25;
                  goto LABEL_22;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v15)
                continue;
              break;
            }
          }

          v9 = v24;
          v6 = v25;
        }
        else
        {
          objc_msgSend(v11, "uid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v5);

          if (v21)
          {
            objc_msgSend(v11, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      v22 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_22:

  return v22;
}

- (id)endpointForDevice:(id)a3
{
  void *v3;
  void *v4;

  -[MRProximityProvider _deviceForUID:](self, "_deviceForUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contentToDisplayForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MRProximityProvider behaviorResults](self, "behaviorResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRProximityProvider _deviceForUID:](self, "_deviceForUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)displayContextHandler
{
  return self->_displayContextHandler;
}

- (void)setDisplayContextHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)progressEventHandler
{
  return self->_progressEventHandler;
}

- (void)setProgressEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableDictionary)remoteDevices
{
  return self->_remoteDevices;
}

- (void)setRemoteDevices:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevices, a3);
}

- (NSMutableSet)providingDevices
{
  return self->_providingDevices;
}

- (void)setProvidingDevices:(id)a3
{
  objc_storeStrong((id *)&self->_providingDevices, a3);
}

- (NSMutableDictionary)behaviorResults
{
  return self->_behaviorResults;
}

- (void)setBehaviorResults:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorResults, a3);
}

- (MRMigrationDevice)proactiveDevice
{
  return self->_proactiveDevice;
}

- (void)setProactiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveDevice, a3);
}

- (NSString)migratingDevice
{
  return self->_migratingDevice;
}

- (void)setMigratingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_migratingDevice, a3);
}

- (id)behaviorCallback
{
  return self->_behaviorCallback;
}

- (void)setBehaviorCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_behaviorCallback, 0);
  objc_storeStrong((id *)&self->_migratingDevice, 0);
  objc_storeStrong((id *)&self->_proactiveDevice, 0);
  objc_storeStrong((id *)&self->_behaviorResults, 0);
  objc_storeStrong((id *)&self->_providingDevices, 0);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
  objc_storeStrong(&self->_progressEventHandler, 0);
  objc_storeStrong(&self->_displayContextHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)receiveEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_193827000, a2, a3, "[ProximityProvider] Received event %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)_beginProvidingDisplayContextIfNeeded:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_193827000, a2, a3, "[ProximityProvider] Begin providing for device %@, but device is not prepared, so must defer initial provide.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)_provideDisplayContextForDevice:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[ProximityProvider] Cannot provide due to missing displayContextHandler.", v1, 2u);
}

- (void)_persistArtworkData:forDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_3_3(&dword_193827000, v0, v1, "[ProximityProvider] Failed to persist artwork data for device %@. Error: %@.");
  OUTLINED_FUNCTION_8();
}

void __52__MRProximityProvider__migrateForDevice_completion___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[ProximityProvider] No result for device %@. Was this device prepared before handoff was attempted?", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_8();
}

@end
