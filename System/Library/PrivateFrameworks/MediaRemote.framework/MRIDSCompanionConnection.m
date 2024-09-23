@implementation MRIDSCompanionConnection

+ (id)sharedManager
{
  if (sharedManager___once != -1)
    dispatch_once(&sharedManager___once, &__block_literal_global_27);
  return (id)sharedManager___manager_0;
}

void __41__MRIDSCompanionConnection_sharedManager__block_invoke()
{
  MRIDSCompanionConnection *v0;
  void *v1;

  v0 = objc_alloc_init(MRIDSCompanionConnection);
  v1 = (void *)sharedManager___manager_0;
  sharedManager___manager_0 = (uint64_t)v0;

}

- (MRIDSCompanionConnection)init
{
  MRIDSCompanionConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *idsQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *calloutQueue;
  uint64_t v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[4];
  MRIDSCompanionConnection *v17;
  _QWORD handler[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  uint8_t buf[4];
  uint32_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)MRIDSCompanionConnection;
  v2 = -[MRIDSCompanionConnection init](&v23, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.mediaremote.MRIDSCompanionConnection.idsQueue", v3);
    idsQueue = v2->_idsQueue;
    v2->_idsQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.mediaremote.MRIDSCompanionConnection.calloutQueue", v6);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v2);
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __32__MRIDSCompanionConnection_init__block_invoke;
    v20[3] = &unk_1E30C84F0;
    objc_copyWeak(&v21, &location);
    -[MRIDSCompanionConnection setMessageHandler:forType:](v2, "setMessageHandler:forType:", v20, CFSTR("Reset"));
    v10 = v2->_idsQueue;
    handler[0] = v9;
    handler[1] = 3221225472;
    handler[2] = __32__MRIDSCompanionConnection_init__block_invoke_2;
    handler[3] = &unk_1E30C8518;
    objc_copyWeak(&v19, &location);
    v11 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &v2->_firstUnlockToken, v10, handler);
    if (v11)
    {
      _MRLogForCategory(9uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v25 = v11;
        _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Failed to register for first unlock notification (status = %d)", buf, 8u);
      }

    }
    if (softLinkMKBDeviceUnlockedSinceBoot[0]() == 1)
    {
      _MRLogForCategory(9uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Device unlocked since boot", buf, 2u);
      }

      v14 = v2->_idsQueue;
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __32__MRIDSCompanionConnection_init__block_invoke_46;
      v16[3] = &unk_1E30C5CA8;
      v17 = v2;
      dispatch_async(v14, v16);

    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__MRIDSCompanionConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleDidReceiveResetConnectionRequest");

}

void __32__MRIDSCompanionConnection_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _MRLogForCategory(9uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Received first unlock notification", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "initializeService");

}

uint64_t __32__MRIDSCompanionConnection_init__block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initializeService");
}

- (void)initializeService
{
  IDSService *v3;
  IDSService *service;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  objc_msgSend(MEMORY[0x1E0D34358], "mr_sharedIDSCompanionService");
  v3 = (IDSService *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  self->_service = v3;

  -[IDSService addDelegate:queue:](self->_service, "addDelegate:queue:", self, self->_idsQueue);
  -[MRIDSCompanionConnection _maybeDeviceConnectionStatusChanged](self, "_maybeDeviceConnectionStatusChanged");
  if (notify_is_valid_token(self->_firstUnlockToken))
    notify_cancel(self->_firstUnlockToken);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)MRIDSCompanionConnection;
  -[MRIDSCompanionConnection description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@"), v4);

  -[MRIDSCompanionConnection deviceInfo](self, "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("deviceInfo=%@"), v6);

  -[IDSService devices](self->_service, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("IDSDevices=%@"), v7);

  return (NSString *)v5;
}

- (void)setDevice:(id)a3
{
  IDSDevice *v4;
  IDSDevice *device;
  IDSDevice *v6;
  MRDeviceInfo *deviceInfo;
  MRIDSCompanionConnection *obj;

  v4 = (IDSDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  device = obj->_device;
  obj->_device = v4;
  v6 = v4;

  deviceInfo = obj->_deviceInfo;
  obj->_deviceInfo = 0;

  objc_sync_exit(obj);
}

- (IDSDevice)device
{
  MRIDSCompanionConnection *v2;
  IDSDevice *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (MRDeviceInfo)deviceInfo
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MRIDSCompanionConnection *v10;
  MRDeviceInfo *deviceInfo;
  MRDeviceInfo *v12;
  MRDeviceInfo *v13;
  uint64_t v14;
  MRDeviceInfo *v15;

  -[MRIDSCompanionConnection device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIDOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "uniqueID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self;
  objc_sync_enter(v10);
  deviceInfo = v10->_deviceInfo;
  if (v3 && !deviceInfo)
  {
    v12 = objc_alloc_init(MRDeviceInfo);
    v13 = v10->_deviceInfo;
    v10->_deviceInfo = v12;

    -[MRDeviceInfo setDeviceUID:](v10->_deviceInfo, "setDeviceUID:", v7);
    -[MRDeviceInfo setName:](v10->_deviceInfo, "setName:", v8);
    if (objc_msgSend(v9, "containsString:", CFSTR("Watch")))
      v14 = 6;
    else
      v14 = 1;
    -[MRDeviceInfo setDeviceClass:](v10->_deviceInfo, "setDeviceClass:", v14);
    deviceInfo = v10->_deviceInfo;
  }
  v15 = deviceInfo;
  objc_sync_exit(v10);

  return v15;
}

- (id)name
{
  MRIDSCompanionConnection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[IDSDevice name](v2->_device, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)deviceDebugName
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MRIDSCompanionConnection device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v2, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%@ (%@)"), v4, v5, v6);

  return v7;
}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  -[MRIDSCompanionConnection deviceInfo](self, "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)resetConnection
{
  if (-[MRIDSCompanionConnection isConnected](self, "isConnected"))
    -[MRIDSCompanionConnection sendMessage:type:destination:session:options:priority:](self, "sendMessage:type:destination:session:options:priority:", 0, CFSTR("Reset"), 0, 0, 0, 300);
}

- (BOOL)_sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 replyID:(id)a9 response:(id)a10
{
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  void *StringRepresentation;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  MRIDSCompanionConnection *v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *responseHandlers;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  IDSService *service;
  void *v36;
  char v37;
  id v38;
  id v39;
  NSObject *v40;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v47 = a4;
  v48 = a5;
  v15 = a6;
  v44 = a7;
  v45 = a9;
  v16 = a10;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = -[MRIDSCompanionConnection _generateMessageID](self, "_generateMessageID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("messageid"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v48, CFSTR("destination"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("session"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v46, CFSTR("data"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v47, CFSTR("type"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v45, CFSTR("replyid"));
  _MRLogForCategory(9uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    StringRepresentation = (void *)MRDataCreateStringRepresentation(v46);
    *(_DWORD *)buf = 134219010;
    v52 = v18;
    v53 = 2112;
    v54 = StringRepresentation;
    v55 = 2112;
    v56 = v47;
    v57 = 2112;
    v58 = v48;
    v59 = 2112;
    v60 = v15;
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Message Sent<%lu>: data=%@ type=%@ destination=%@ session=%@", buf, 0x34u);

  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v44);
  v23 = *MEMORY[0x1E0D34160];
  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D34160]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (v25)
  {
    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v23);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D34090]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D341C8]);

  }
  objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34168], a8);
  if (!self->_service)
  {
    _MRLogForCategory(9uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[MRIDSCompanionConnection _sendMessage:type:destination:session:options:priority:replyID:response:].cold.2(v27);

  }
  if (v16)
  {
    v28 = self;
    objc_sync_enter(v28);
    if (!v28->_responseHandlers)
    {
      v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      responseHandlers = v28->_responseHandlers;
      v28->_responseHandlers = v29;

    }
    v31 = (void *)objc_msgSend(v16, "copy");
    v32 = (void *)MEMORY[0x194036C44]();
    v33 = v28->_responseHandlers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v32, v34);

    objc_sync_exit(v28);
  }
  service = self->_service;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D34018]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v50 = 0;
  v37 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v17, v36, v43, v22, &v50, &v49);
  v38 = v50;
  v39 = v49;

  if ((v37 & 1) == 0)
  {
    _MRLogForCategory(9uLL);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[MRIDSCompanionConnection _sendMessage:type:destination:session:options:priority:replyID:response:].cold.1((uint64_t)v39, v40);

  }
  return v37;
}

- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 response:(id)a9
{
  return -[MRIDSCompanionConnection _sendMessage:type:destination:session:options:priority:replyID:response:](self, "_sendMessage:type:destination:session:options:priority:replyID:response:", a3, a4, a5, a6, a7, a8, 0, a9);
}

- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8
{
  return -[MRIDSCompanionConnection _sendMessage:type:destination:session:options:priority:replyID:response:](self, "_sendMessage:type:destination:session:options:priority:replyID:response:", a3, a4, a5, a6, a7, a8, 0, 0);
}

- (void)setMessageHandler:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  MRIDSCompanionConnection *v8;
  id *p_messageHandlers;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  p_messageHandlers = (id *)&v8->_messageHandlers;
  if (!v8->_messageHandlers)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = *p_messageHandlers;
    *p_messageHandlers = v10;

  }
  v12 = (void *)objc_msgSend(v6, "copy");
  v13 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(*p_messageHandlers, "setObject:forKeyedSubscript:", v13, v7);

  _MRLogForCategory(9uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[MRIDSCompanionConnection setMessageHandler:forType:].cold.1();

  objc_sync_exit(v8);
}

- (void)setMessageHandler:(id)a3 forType:(id)a4 destination:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MRIDSCompanionConnection *v14;
  NSMutableDictionary *destinationMessageHandlers;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSMutableDictionary *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  NSMutableDictionary *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  destinationMessageHandlers = v14->_destinationMessageHandlers;
  if (!destinationMessageHandlers)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = v14->_destinationMessageHandlers;
    v14->_destinationMessageHandlers = v16;

    destinationMessageHandlers = v14->_destinationMessageHandlers;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](destinationMessageHandlers, "objectForKeyedSubscript:", v11);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14->_destinationMessageHandlers, "setObject:forKeyedSubscript:", v18, v11);
  }
  v19 = (void *)objc_msgSend(v10, "copy");
  -[MRIDSCompanionConnection _configurationFromDestination:session:](v14, "_configurationFromDestination:session:", v12, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v20);

  _MRLogForCategory(9uLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = v14->_destinationMessageHandlers;
    v23 = 138413058;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v22;
    _os_log_debug_impl(&dword_193827000, v21, OS_LOG_TYPE_DEBUG, "[MRIDSCompanionConnection] Added destination handler for type=%@, destination=%@, session=%@, %@", (uint8_t *)&v23, 0x2Au);
  }

  objc_sync_exit(v14);
}

- (void)removeMessageHandlerForType:(id)a3
{
  id v4;
  MRIDSCompanionConnection *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_messageHandlers, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_messageHandlers, "setObject:forKeyedSubscript:", 0, v4);
    _MRLogForCategory(9uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MRIDSCompanionConnection removeMessageHandlerForType:].cold.1();

  }
  objc_sync_exit(v5);

}

- (void)removeMessageHandlerForType:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRIDSCompanionConnection *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *destinationMessageHandlers;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  NSMutableDictionary *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  -[MRIDSCompanionConnection _configurationFromDestination:session:](v11, "_configurationFromDestination:session:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11->_destinationMessageHandlers, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v11->_destinationMessageHandlers, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v12);

    _MRLogForCategory(9uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      destinationMessageHandlers = v11->_destinationMessageHandlers;
      v18 = 138413058;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = destinationMessageHandlers;
      _os_log_debug_impl(&dword_193827000, v16, OS_LOG_TYPE_DEBUG, "[MRIDSCompanionConnection] Remove destination handler for type=%@, destination=%@, session=%@, %@", (uint8_t *)&v18, 0x2Au);
    }

  }
  objc_sync_exit(v11);

}

- (void)handleDidReceiveResetConnectionRequest
{
  NSObject *calloutQueue;
  _QWORD block[5];

  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRIDSCompanionConnection_handleDidReceiveResetConnectionRequest__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(calloutQueue, block);
}

void __66__MRIDSCompanionConnection_handleDidReceiveResetConnectionRequest__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MRIDSCompanionConnectionDeviceDidDisconnect"), *(_QWORD *)(a1 + 32));

  if (objc_msgSend(*(id *)(a1 + 32), "isConnected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("MRIDSCompanionConnectionDeviceDidConnect"), *(_QWORD *)(a1 + 32));

  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *StringRepresentation;
  MRIDSCompanionConnection *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *calloutQueue;
  id *v30;
  id *v31;
  _QWORD *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  MRIDSCompanionMessage *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  MRIDSCompanionMessage *v43;
  id v44;
  _QWORD block[4];
  MRIDSCompanionMessage *v46;
  id v47;
  id v48;
  NSObject *v49;
  _QWORD v50[4];
  MRIDSCompanionMessage *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("destination"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("session"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("data"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("messageid"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("replyid"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[MRIDSCompanionMessage initWithID:data:]([MRIDSCompanionMessage alloc], "initWithID:data:", v40, v41);
  _MRLogForCategory(9uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    StringRepresentation = (void *)MRDataCreateStringRepresentation(v41);
    *(_DWORD *)buf = 138413570;
    v54 = v40;
    v55 = 2112;
    v56 = StringRepresentation;
    v57 = 2112;
    v58 = v17;
    v59 = 2112;
    v60 = v38;
    v61 = 2112;
    v62 = v37;
    v63 = 2112;
    v64 = v39;
    _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Message received<%@>: data=%@ type=%@ destination=%@ session=%@ replyID=%@", buf, 0x3Eu);

  }
  if ((-[IDSDevice isConnected](self->_device, "isConnected") & 1) != 0)
  {
    v20 = self;
    objc_sync_enter(v20);
    -[NSMutableDictionary objectForKeyedSubscript:](v20->_messageHandlers, "objectForKeyedSubscript:", v17);
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v20->_destinationMessageHandlers, "objectForKeyedSubscript:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRIDSCompanionConnection _configurationFromDestination:session:](v20, "_configurationFromDestination:session:", v38, v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v20->_responseHandlers, "objectForKeyedSubscript:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20->_responseHandlers, "setObject:forKeyedSubscript:", 0, v39);
    }
    else
    {
      v24 = 0;
    }

    objc_sync_exit(v20);
    if (v24)
    {
      v34 = v17;
      v25 = v16;
      v26 = v15;
      v27 = v13;
      v28 = v12;
      calloutQueue = v20->_calloutQueue;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke;
      v50[3] = &unk_1E30C6568;
      v30 = &v52;
      v52 = v24;
      v31 = (id *)&v51;
      v51 = v36;
      v32 = v50;
    }
    else
    {
      if (v21)
      {
        v33 = v20->_calloutQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke_2;
        block[3] = &unk_1E30C8540;
        v49 = v21;
        v46 = v36;
        v47 = v38;
        v48 = v37;
        dispatch_async(v33, block);

      }
      if (!v35)
        goto LABEL_16;
      v34 = v17;
      v25 = v16;
      v26 = v15;
      v27 = v13;
      v28 = v12;
      calloutQueue = v20->_calloutQueue;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke_3;
      v42[3] = &unk_1E30C6568;
      v30 = &v44;
      v44 = v35;
      v31 = (id *)&v43;
      v43 = v36;
      v32 = v42;
    }
    dispatch_async(calloutQueue, v32);

    v12 = v28;
    v13 = v27;
    v15 = v26;
    v16 = v25;
    v17 = v34;

LABEL_16:
    goto LABEL_17;
  }
  _MRLogForCategory(9uLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[MRIDSCompanionConnection service:account:incomingMessage:fromID:context:].cold.1(v21);
LABEL_17:

}

uint64_t __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_maybeDeviceConnectionStatusChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  NSObject *calloutQueue;
  __CFString *v20;
  _QWORD v21[4];
  __CFString *v22;
  MRIDSCompanionConnection *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  -[IDSService devices](self->_service, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDefaultPairedDevice") && objc_msgSend(v9, "isConnected"))
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  -[MRIDSCompanionConnection device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v11 && (objc_msgSend(v6, "isEqual:", v11) & 1) == 0)
  {
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(9uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        objc_msgSend(v11, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = CFSTR("MRIDSCompanionConnection");
        v30 = 2114;
        v31 = CFSTR("active paired device");
        v32 = 2112;
        v33 = v15;
        v34 = 2112;
        v35 = v16;
        _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", buf, 0x2Au);

LABEL_20:
      }
    }
    else if (v14)
    {
      objc_msgSend(v6, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = CFSTR("MRIDSCompanionConnection");
      v30 = 2114;
      v31 = CFSTR("active paired device");
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);
      goto LABEL_20;
    }

    -[MRIDSCompanionConnection setDevice:](self, "setDevice:", v6);
    v17 = CFSTR("MRIDSCompanionConnectionDeviceDidConnect");
    if (!v6)
      v17 = CFSTR("MRIDSCompanionConnectionDeviceDidDisconnect");
    v18 = v17;
    calloutQueue = self->_calloutQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63__MRIDSCompanionConnection__maybeDeviceConnectionStatusChanged__block_invoke;
    v21[3] = &unk_1E30C5F40;
    v22 = v18;
    v23 = self;
    v20 = v18;
    dispatch_async(calloutQueue, v21);

  }
}

void __63__MRIDSCompanionConnection__maybeDeviceConnectionStatusChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (unint64_t)_generateMessageID
{
  MRIDSCompanionConnection *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_totalOutgoingMessageCount + 1;
  v2->_totalOutgoingMessageCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (id)_configurationFromDestination:(id)a3 session:(id)a4
{
  objc_class *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = (__CFString *)a4;
  v7 = (__CFString *)a3;
  v8 = [v5 alloc];
  v9 = CFSTR("default");
  if (v7)
    v10 = v7;
  else
    v10 = CFSTR("default");
  if (v6)
    v9 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@-%@"), v10, v9);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_destinationMessageHandlers, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)_sendMessage:(uint64_t)a1 type:(NSObject *)a2 destination:session:options:priority:replyID:response:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[MRIDSCompanionConnection] Error %@ sending message", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_8();
}

- (void)_sendMessage:(os_log_t)log type:destination:session:options:priority:replyID:response:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_193827000, log, OS_LOG_TYPE_FAULT, "Attempting to send IDS messages before first unlock", v1, 2u);
}

- (void)setMessageHandler:forType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_193827000, v0, v1, "[MRIDSCompanionConnection] Added handler for %@ %@");
  OUTLINED_FUNCTION_8();
}

- (void)removeMessageHandlerForType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_193827000, v0, v1, "[MRIDSCompanionConnection] Remove handler for type=%@, %@");
  OUTLINED_FUNCTION_8();
}

- (void)service:(os_log_t)log account:incomingMessage:fromID:context:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[MRIDSCompanionConnection] Dropping message because sender device is not yet connected", v1, 2u);
}

@end
