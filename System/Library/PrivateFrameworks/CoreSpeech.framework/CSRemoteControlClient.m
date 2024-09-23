@implementation CSRemoteControlClient

- (CSRemoteControlClient)initWithRemoteDevice:(id)a3
{
  id v5;
  CSRemoteControlClient *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *queue;
  NSHashTable *v9;
  NSHashTable *observers;
  CSDispatchGroup *v11;
  CSDispatchGroup *deviceWaitingGroup;
  OS_dispatch_queue *v13;
  CSRemoteDeviceProtocolInfo *v14;
  CSRemoteDeviceProtocolInfo *deviceProtocolInfo;
  NSObject *v17;
  id v18[5];
  id v19;
  objc_super v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) == 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)CSRemoteControlClient;
    self = -[CSRemoteControlClient init](&v20, sel_init);
    if (self)
    {
      if (!v5)
      {
        v17 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 136315138;
          *(id *)((char *)location + 4) = "-[CSRemoteControlClient initWithRemoteDevice:]";
          _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s invalid remote device", (uint8_t *)location, 0xCu);
        }
        goto LABEL_2;
      }
      v7 = (OS_dispatch_queue *)dispatch_queue_create("CSRemoteControlClient", 0);
      queue = self->_queue;
      self->_queue = v7;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      observers = self->_observers;
      self->_observers = v9;

      v11 = (CSDispatchGroup *)objc_alloc_init(MEMORY[0x1E0D190C0]);
      deviceWaitingGroup = self->_deviceWaitingGroup;
      self->_deviceWaitingGroup = v11;

      objc_initWeak(location, self);
      v13 = self->_queue;
      objc_storeStrong((id *)&self->_device, a3);
      self->_deviceType = remote_device_get_type();
      +[CSRemoteDeviceProtocolInfo defaultProtocolInfo](CSRemoteDeviceProtocolInfo, "defaultProtocolInfo");
      v14 = (CSRemoteDeviceProtocolInfo *)objc_claimAutoreleasedReturnValue();
      deviceProtocolInfo = self->_deviceProtocolInfo;
      self->_deviceProtocolInfo = v14;

      -[CSDispatchGroup enter](self->_deviceWaitingGroup, "enter");
      v18[1] = (id)MEMORY[0x1E0C809B0];
      v18[2] = (id)3221225472;
      v18[3] = __46__CSRemoteControlClient_initWithRemoteDevice___block_invoke;
      v18[4] = &unk_1E7C27A30;
      objc_copyWeak(&v19, location);
      remote_device_set_connected_callback();
      objc_copyWeak(v18, location);
      remote_device_set_disconnected_callback();
      objc_destroyWeak(v18);
      objc_destroyWeak(&v19);

      objc_destroyWeak(location);
    }
    self = self;
    v6 = self;
    goto LABEL_7;
  }
LABEL_2:
  v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isConnectedDeviceGibraltar
{
  return self->_deviceType == 3;
}

- (BOOL)isConnectedDeviceDarwin
{
  self->_deviceType = 11;
  return 1;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EF7BAB88) & 1) != 0
    || (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF7C58D0) & 1) != 0)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__CSRemoteControlClient_addObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
  else
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSRemoteControlClient addObserver:]";
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s observer doesn't conform to either V1 or V2 protocol", buf, 0xCu);
    }
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CSRemoteControlClient_removeObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_invalidate
{
  OS_xpc_remote_connection *connection;
  os_log_t *v4;
  NSObject *v5;
  OS_xpc_remote_connection *v6;
  NSObject *v7;
  OS_remote_device *device;
  OS_remote_device *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  v4 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (connection)
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSRemoteControlClient _invalidate]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Cancelling remote connection", (uint8_t *)&v10, 0xCu);
      connection = self->_connection;
    }
    self->_connection = 0;
    v6 = connection;

    xpc_remote_connection_cancel();
  }
  if (self->_device && remote_device_get_type())
  {
    v7 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSRemoteControlClient _invalidate]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Cancelling remote device", (uint8_t *)&v10, 0xCu);
    }
    device = self->_device;
    self->_device = 0;
    v9 = device;

    remote_device_cancel();
  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CSRemoteControlClient_invalidate__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSRemoteControlClient dealloc]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc of CSRemoteControlClient, it should close connection", buf, 0xCu);
  }
  -[CSRemoteControlClient _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CSRemoteControlClient;
  -[CSRemoteControlClient dealloc](&v4, sel_dealloc);
}

- (void)didDeviceConnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  CSRemoteControlClient *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSRemoteControlClient didDeviceConnect:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__CSRemoteControlClient_didDeviceConnect___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)didDeviceDisconnect:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSRemoteControlClient didDeviceDisconnect:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSRemoteControlClient_didDeviceDisconnect___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)waitingForConnection:(double)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL result;
  NSObject *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[CSDispatchGroup waitWithTimeout:](self->_deviceWaitingGroup, "waitWithTimeout:", dispatch_time(0, (uint64_t)(a3 * 1000000000.0))))
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[CSRemoteControlClient waitingForConnection:error:]";
      v27 = 2050;
      v28 = a3;
      _os_log_fault_impl(&dword_1C2614000, v7, OS_LOG_TYPE_FAULT, "%s Device connection waiting %{public}.3f seconds timed out", buf, 0x16u);
      if (a4)
        goto LABEL_4;
    }
    else if (a4)
    {
LABEL_4:
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D18E80];
      v10 = 301;
LABEL_19:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v19;
      return result;
    }
    return 0;
  }
  if (!-[CSRemoteControlClient isConnected](self, "isConnected"))
  {
    v18 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CSRemoteControlClient waitingForConnection:error:]";
      _os_log_error_impl(&dword_1C2614000, v18, OS_LOG_TYPE_ERROR, "%s Device is connected but RemoteXPC service is not connected", buf, 0xCu);
      if (a4)
        goto LABEL_18;
    }
    else if (a4)
    {
LABEL_18:
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D18E80];
      v10 = 302;
      goto LABEL_19;
    }
    return 0;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_observers;
  v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "didConnected:", self, (_QWORD)v20);
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return 1;
}

- (BOOL)isConnected
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__CSRemoteControlClient_isConnected__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)description
{
  void *v3;
  NSString *deviceId;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deviceId = self->_deviceId;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", remote_device_type_get_description());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("deviceUUID(%@), deviceType(%@)"), deviceId, v5);

  return (NSString *)v3;
}

- (void)_handleServerEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = MEMORY[0x1C3BC4CBC](v4);
    if (MEMORY[0x1C3BC4CBC](v4) == MEMORY[0x1E0C81310])
    {
      v8 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v9 = 136315138;
        v10 = "-[CSRemoteControlClient _handleServerEvent:]";
        _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s remoteXPC connection get failed", (uint8_t *)&v9, 0xCu);
      }
      -[CSRemoteControlClient _handleServerError:](self, "_handleServerError:", v4);
    }
    else
    {
      if (v5 == MEMORY[0x1E0C812F8])
      {
        -[CSRemoteControlClient _handleServerMessage:](self, "_handleServerMessage:", v4);
        goto LABEL_13;
      }
      v6 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v9 = 136315138;
        v10 = "-[CSRemoteControlClient _handleServerEvent:]";
        v7 = "%s Ignore unknown type message";
LABEL_8:
        _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[CSRemoteControlClient _handleServerEvent:]";
      v7 = "%s cannot handle server event since event is nil";
      goto LABEL_8;
    }
  }
LABEL_13:

}

- (void)_handleServerError:(id)a3
{
  id v4;
  NSObject *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *string;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (v4 == (id)MEMORY[0x1E0C81260] || v4 == (id)MEMORY[0x1E0C81258])
    {
      v6 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[CSRemoteControlClient _handleServerError:]";
        _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s connection disconnected", buf, 0xCu);
      }
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = self->_observers;
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v12, "didReceiveConnectionInvalidated:", self, (_QWORD)v16);
            ++v11;
          }
          while (v9 != v11);
          v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        }
        while (v9);
      }

    }
    else
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
      v14 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[CSRemoteControlClient _handleServerError:]";
        v22 = 2082;
        v23 = string;
        _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", buf, 0x16u);
      }
    }
  }

}

- (void)_handleServerMessage:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSObject **v6;
  NSObject *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  const char *string;
  const char *v26;
  void *v27;
  NSObject *v28;
  NSHashTable *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  NSHashTable *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  NSHashTable *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v4, "COMMAND"));
  v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  v6 = (NSObject **)MEMORY[0x1E0D18F60];
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[CSRemoteControlClient _handleServerMessage:]";
    v55 = 2114;
    v56 = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s XPC command recevied : %{public}@", buf, 0x16u);
  }
  if (-[NSHashTable isEqualToString:](v5, "isEqualToString:", CFSTR("notifyVoiceTrigger")))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v8 = self->_observers;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "didReceiveVoiceTriggered:", self);
        }
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v10);
    }
    goto LABEL_56;
  }
  if (-[NSHashTable isEqualToString:](v5, "isEqualToString:", CFSTR("notifySelfTrigger")))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v8 = self->_observers;
    v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    if (!v14)
    {
LABEL_56:

      goto LABEL_57;
    }
    v15 = v14;
    v35 = v5;
    v16 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v8);
        v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[CSRemoteControlClient _getMyriadInfoFromServerMessage:](self, "_getMyriadInfoFromServerMessage:", v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "didReceiveSelfTriggerDetected:myriadHash:", self, v19);

        }
      }
      v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v15);
LABEL_55:
    v5 = v35;
    goto LABEL_56;
  }
  if (-[NSHashTable isEqualToString:](v5, "isEqualToString:", CFSTR("notifyBootFromHibernate")))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = self->_observers;
    v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v59, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v41;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v8);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "didReceiveBootFromHibernate:", self);
        }
        v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v59, 16);
      }
      while (v21);
    }
    goto LABEL_56;
  }
  if (-[NSHashTable isEqualToString:](v5, "isEqualToString:", CFSTR("requestAssetDownload")))
  {
    string = xpc_dictionary_get_string(v4, "voiceTriggerAssetConfigVersion");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v26 = xpc_dictionary_get_string(v4, "languageCode");
    v35 = v5;
    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v28 = *v6;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v54 = "-[CSRemoteControlClient _handleServerMessage:]";
      v55 = 2114;
      v56 = v8;
      v57 = 2114;
      v58 = v27;
      _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s RequestVoiceTriggerAssetDownload : configVersion %{public}@, languageCode %{public}@", buf, 0x20u);
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v29 = self->_observers;
    v30 = -[NSHashTable countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v37;
      do
      {
        for (m = 0; m != v31; ++m)
        {
          if (*(_QWORD *)v37 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * m);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v34, "didReceiveVoiceTriggerAssetsDownloadingRequest:withConfigVersion:languageCode:", self, v8, v27);
        }
        v31 = -[NSHashTable countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
      }
      while (v31);
    }

    goto LABEL_55;
  }
LABEL_57:

}

- (void)readVoiceTriggeredTokenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSRemoteControlClient readVoiceTriggeredTokenWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = CFSTR("COMMAND");
  v14 = CFSTR("readVoiceTriggeredToken");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CSRemoteControlClient_readVoiceTriggeredTokenWithCompletion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)readAndClearVoiceTriggeredTokenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSRemoteControlClient readAndClearVoiceTriggeredTokenWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = CFSTR("COMMAND");
  v14 = CFSTR("readAndClearVoiceTriggeredToken");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CSRemoteControlClient_readAndClearVoiceTriggeredTokenWithCompletion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)_transferFile:(id)a3 at:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *queue;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (os_log_t *)MEMORY[0x1E0D18F60];
  v12 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[CSRemoteControlClient _transferFile:at:completion:]";
    v33 = 2114;
    v34 = v8;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "fileExistsAtPath:", v8) & 1) != 0)
    {
      v14 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v14, "COMMAND", "writeFile");
      xpc_dictionary_set_string(v14, "filePath", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
      v15 = objc_retainAutorelease(v8);
      objc_msgSend(v15, "UTF8String");
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __53__CSRemoteControlClient__transferFile_at_completion___block_invoke;
      v28 = &unk_1E7C27A58;
      v29 = v15;
      v16 = v10;
      v30 = v16;
      v17 = (void *)xpc_file_transfer_create_with_path();
      if (v17)
      {
        xpc_dictionary_set_value(v14, "fileTx", v17);
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53__CSRemoteControlClient__transferFile_at_completion___block_invoke_136;
        block[3] = &unk_1E7C28EC8;
        block[4] = self;
        v23 = v14;
        v24 = v16;
        dispatch_async(queue, block);

LABEL_16:
        goto LABEL_17;
      }
      v20 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[CSRemoteControlClient _transferFile:at:completion:]";
        _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s Failed to create xpc file transfer", buf, 0xCu);
        if (!v16)
          goto LABEL_16;
      }
      else if (!v16)
      {
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 304, &unk_1E7C64A20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v16 + 2))(v16, v21);

      goto LABEL_16;
    }
    v19 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[CSRemoteControlClient _transferFile:at:completion:]";
      v33 = 2114;
      v34 = v8;
      _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s File does not exists : %{public}@", buf, 0x16u);
      if (!v10)
        goto LABEL_18;
      goto LABEL_12;
    }
    if (v10)
    {
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 117, &unk_1E7C649F8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v14);
LABEL_17:

    }
LABEL_18:

    goto LABEL_19;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, &unk_1E7C649D0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
    goto LABEL_18;
  }
LABEL_19:

}

- (BOOL)transferVoiceTriggerSpeakerModel:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  os_log_t *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  void *v26;
  void *v27;
  _QWORD v28[4];
  NSObject *v29;
  _BYTE *v30;
  uint8_t v31[4];
  const char *v32;
  __int16 v33;
  void *v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelDirectoryPathForProfile:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hashFromResourcePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "URLByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "hashFromResourcePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("VoiceTrigger/SAT/model/"), "stringByAppendingPathComponent:", v11);
    v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

    v13 = (os_log_t *)MEMORY[0x1E0D18F60];
    v14 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CSRemoteControlClient transferVoiceTriggerSpeakerModel:forAsset:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v36 = v12;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Speaker model file %{public}@ is being transmited to %{public}@", buf, 0x20u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__21551;
    v37 = __Block_byref_object_dispose__21552;
    v38 = 0;
    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    objc_msgSend(v10, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __67__CSRemoteControlClient_transferVoiceTriggerSpeakerModel_forAsset___block_invoke;
    v28[3] = &unk_1E7C27A80;
    v30 = buf;
    v17 = v15;
    v29 = v17;
    -[CSRemoteControlClient _transferFile:at:completion:](self, "_transferFile:at:completion:", v16, v12, v28);

    v18 = v8;
    v19 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v17, v19))
    {
      v20 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v31 = 136315138;
        v32 = "-[CSRemoteControlClient transferVoiceTriggerSpeakerModel:forAsset:]";
        _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s ERR: Speaker model transmission timed out", v31, 0xCu);
      }
    }
    else
    {
      v23 = *(_QWORD *)&buf[8];
      if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v22 = 1;
        v18 = v8;
        goto LABEL_15;
      }
      v24 = *v13;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v23 + 40), "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 136315394;
        v32 = "-[CSRemoteControlClient transferVoiceTriggerSpeakerModel:forAsset:]";
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", v31, 0x16u);

      }
      v18 = v8;
    }
    v22 = 0;
LABEL_15:

    _Block_object_dispose(buf, 8);
    goto LABEL_16;
  }
  v21 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[CSRemoteControlClient transferVoiceTriggerSpeakerModel:forAsset:]";
    _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, "%s ERR: speakerProfile passed is nil - Bailing out", buf, 0xCu);
  }
  v22 = 0;
LABEL_16:

  return v22;
}

- (void)transferVoiceTriggerAsset:(id)a3 forLanguageCode:(id)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *queue;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void (**v36)(id, _QWORD, id);
  void *v38;
  _QWORD block[5];
  id v40;
  void (**v41)(id, _QWORD, id);
  _QWORD v42[4];
  NSObject *v43;
  __int128 *p_buf;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  _QWORD v50[5];
  const __CFString *v51;
  id v52;
  uint8_t v53[4];
  const char *v54;
  __int16 v55;
  void *v56;
  uint8_t v57[128];
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = a4;
  v36 = (void (**)(id, _QWORD, id))a5;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSRemoteControlClient transferVoiceTriggerAsset:forLanguageCode:completion:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(v7, "hashFromResourcePath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configVersion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("VoiceTrigger/asset"), "stringByAppendingPathComponent:", v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR(".asset"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__21551;
  v61 = __Block_byref_object_dispose__21552;
  v62 = 0;
  v10 = dispatch_group_create();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourcePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorAtPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v46;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v16);
        objc_msgSend(v7, "resourcePath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAppendingPathComponent:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v53[0] = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v19, v53);

        if (!v53[0])
        {
          dispatch_group_enter(v10);
          objc_msgSend(v38, "stringByAppendingPathComponent:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __78__CSRemoteControlClient_transferVoiceTriggerAsset_forLanguageCode_completion___block_invoke;
          v42[3] = &unk_1E7C27A80;
          p_buf = &buf;
          v43 = v10;
          -[CSRemoteControlClient _transferFile:at:completion:](self, "_transferFile:at:completion:", v19, v21, v42);

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v14);
  }

  v22 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v10, v22))
  {
    v23 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v53 = 136315138;
      v54 = "-[CSRemoteControlClient transferVoiceTriggerAsset:forLanguageCode:completion:]";
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger asset file transmission timed out", v53, 0xCu);
    }
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 304, &unk_1E7C64A70);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v36[2](v36, 0, v24);
LABEL_23:

    }
  }
  else
  {
    v25 = *((_QWORD *)&buf + 1);
    if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v49[0] = CFSTR("COMMAND");
      v49[1] = CFSTR("voiceTriggerAssetHash");
      v50[0] = CFSTR("setVoiceTriggerAsset");
      v50[1] = v35;
      v49[2] = CFSTR("voiceTriggerAssetLanguageCode");
      v49[3] = CFSTR("voiceTriggerAssetPath");
      v50[2] = v33;
      v50[3] = v38;
      v49[4] = CFSTR("voiceTriggerAssetConfigVersion");
      v50[4] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__CSRemoteControlClient_transferVoiceTriggerAsset_forLanguageCode_completion___block_invoke_162;
      block[3] = &unk_1E7C28EC8;
      block[4] = self;
      v40 = v30;
      v41 = v36;
      v24 = v30;
      dispatch_async(queue, block);

      goto LABEL_23;
    }
    v26 = (id)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(v25 + 40), "localizedDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v53 = 136315394;
      v54 = "-[CSRemoteControlClient transferVoiceTriggerAsset:forLanguageCode:completion:]";
      v55 = 2114;
      v56 = v32;
      _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s Cannot transfer VoiceTrigger asset %{public}@", v53, 0x16u);

    }
    if (v36)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v51 = CFSTR("reason");
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "localizedDescription");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v52 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 304, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2](v36, 0, v29);

      goto LABEL_23;
    }
  }

  _Block_object_dispose(&buf, 8);
}

- (void)setVoiceTriggerEnable:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString **v9;
  const __CFString **v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSRemoteControlClient setVoiceTriggerEnable:withCompletion:]";
    v24 = 1026;
    v25 = v4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s set enable : %{public}d", buf, 0x12u);
  }
  if (v4)
  {
    v20 = CFSTR("COMMAND");
    v21 = CFSTR("enableVoiceTrigger");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v21;
    v10 = &v20;
  }
  else
  {
    v18 = CFSTR("COMMAND");
    v19 = CFSTR("disableVoiceTrigger");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v19;
    v10 = &v18;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSRemoteControlClient_setVoiceTriggerEnable_withCompletion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v16 = v11;
  v17 = v6;
  v13 = v6;
  v14 = v11;
  dispatch_async(queue, block);

}

- (void)voiceTriggerEnabledWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSRemoteControlClient voiceTriggerEnabledWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = CFSTR("COMMAND");
  v14 = CFSTR("voiceTriggerEnabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSRemoteControlClient_voiceTriggerEnabledWithCompletion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)invalidateInterstitialWithLevel:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSRemoteControlClient invalidateInterstitialWithLevel:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v12[0] = CFSTR("COMMAND");
  v12[1] = CFSTR("interstitialLevel");
  v13[0] = CFSTR("invalidateInterstitialAudio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CSRemoteControlClient_invalidateInterstitialWithLevel___block_invoke;
  v10[3] = &unk_1E7C292A0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

}

- (BOOL)transferInterstitialAudioFiles:(id)a3 interstitialLevel:(int64_t)a4 completion:(id)a5
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  NSObject *v23;
  id v24;
  BOOL v25;
  void *v26;
  void *v27;
  NSObject *queue;
  void (**v29)(id, id);
  uint64_t v32;
  id v33;
  void (**v34)(id, id);
  void *v35;
  id obj;
  void *v37;
  void *v39;
  NSObject *group;
  _QWORD block[5];
  id v42;
  void (**v43)(id, id);
  _QWORD v44[4];
  NSObject *v45;
  __int128 *p_buf;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint8_t v57[4];
  const char *v58;
  _BYTE v59[128];
  uint8_t v60[128];
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v34 = (void (**)(id, id))a5;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSRemoteControlClient transferInterstitialAudioFiles:interstitialLevel:completion:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__21551;
  v64 = __Block_byref_object_dispose__21552;
  v65 = 0;
  if (objc_msgSend(v33, "count"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v7 = v33;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v52;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v10), "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v35, "fileExistsAtPath:", v11);

        if ((v12 & 1) == 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v8)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      if (!v34)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 117, &unk_1E7C64AE8);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v34[2](v34, v24);
      v25 = 0;
      goto LABEL_38;
    }
LABEL_12:

    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "interstitialRelativeDirForLevel:", v32);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v7;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v48;
      v16 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v48 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          dispatch_group_enter(group);
          objc_msgSend(v18, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringByAppendingPathComponent:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "addObject:", v20);
          objc_msgSend(v18, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v16;
          v44[1] = 3221225472;
          v44[2] = __85__CSRemoteControlClient_transferInterstitialAudioFiles_interstitialLevel_completion___block_invoke;
          v44[3] = &unk_1E7C27A80;
          p_buf = &buf;
          v45 = group;
          -[CSRemoteControlClient _transferFile:at:completion:](self, "_transferFile:at:completion:", v21, v20, v44);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      }
      while (v14);
    }

    v22 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(group, v22))
    {
      v23 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v57 = 136315138;
        v58 = "-[CSRemoteControlClient transferInterstitialAudioFiles:interstitialLevel:completion:]";
        _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Interstitial file transmission timed out", v57, 0xCu);
      }
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 301, &unk_1E7C64B10);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v34[2](v34, v24);
        v25 = 0;
LABEL_37:
        v7 = v37;
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v55[0] = CFSTR("COMMAND");
        v55[1] = CFSTR("interstitialLevel");
        v56[0] = CFSTR("updateInterstitialAudio");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __85__CSRemoteControlClient_transferInterstitialAudioFiles_interstitialLevel_completion___block_invoke_199;
        block[3] = &unk_1E7C28EC8;
        block[4] = self;
        v24 = v27;
        v42 = v24;
        v29 = v34;
        v43 = v29;
        dispatch_async(queue, block);
        if (v29)
          v29[2](v29, 0);

        v25 = 1;
        goto LABEL_37;
      }
      if (v34)
        ((void (*)(void))v34[2])();
    }
    v25 = 0;
    v7 = v37;
LABEL_39:

    goto LABEL_40;
  }
  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, &unk_1E7C64AC0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v34[2](v34, v7);
LABEL_28:
    v25 = 0;
    goto LABEL_39;
  }
  v25 = 0;
LABEL_40:
  _Block_object_dispose(&buf, 8);

  return v25;
}

- (void)getTriggerCount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSRemoteControlClient getTriggerCount:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = CFSTR("COMMAND");
  v14 = CFSTR("getTriggerCount");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSRemoteControlClient_getTriggerCount___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)clearTriggerCount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSRemoteControlClient clearTriggerCount:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = CFSTR("COMMAND");
  v14 = CFSTR("clearTriggerCount");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CSRemoteControlClient_clearTriggerCount___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)getFirstPassRunningMode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSRemoteControlClient getFirstPassRunningMode:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = CFSTR("COMMAND");
  v14 = CFSTR("getFirstPassRunningMode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CSRemoteControlClient_getFirstPassRunningMode___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (id)_dictionaryWithContentsOfXPCObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD applier[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  if (v4)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __60__CSRemoteControlClient__dictionaryWithContentsOfXPCObject___block_invoke;
    applier[3] = &unk_1E7C27AA8;
    v8 = v4;
    xpc_dictionary_apply(v3, applier);

  }
  return v5;
}

- (id)_getMyriadInfoFromServerMessage:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = [v3 alloc];
  xpc_dictionary_get_value(v4, "myriadHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_cs_initWithXPCObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)notifyVoiceTriggerAssetChangeWithSiriLanguageCode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSRemoteControlClient notifyVoiceTriggerAssetChangeWithSiriLanguageCode:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s languageCode : %{public}@", buf, 0x16u);
  }
  v11[0] = CFSTR("COMMAND");
  v11[1] = CFSTR("languageCode");
  v12[0] = CFSTR("NotifyVTAssetChange");
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CSRemoteControlClient_notifyVoiceTriggerAssetChangeWithSiriLanguageCode___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)exchangeRemoteDeviceProtocolInfo:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F60];
  v6 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSRemoteControlClient exchangeRemoteDeviceProtocolInfo:]";
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Exchange protocol info with host info : %{public}@", buf, 0x16u);

  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "COMMAND", "exchangeProtocolInfo");
  if (v4)
  {
    objc_msgSend(v4, "xpcObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v9, "hostProtocolInfo", v10);

  }
  else
  {
    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSRemoteControlClient exchangeRemoteDeviceProtocolInfo:]";
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Invalid hostProtocolInfo", buf, 0xCu);
    }
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__CSRemoteControlClient_exchangeRemoteDeviceProtocolInfo___block_invoke;
  v14[3] = &unk_1E7C292A0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  dispatch_async(queue, v14);

}

- (BOOL)createRemoteVoiceProfileWithAudioFiles:(id)a3 aesKey:(id)a4 encryptedAudioSampleBypeDepth:(unint64_t)a5 languageCode:(id)a6 completion:(id)a7
{
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  dispatch_time_t v25;
  intptr_t v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  void *v30;
  xpc_object_t v31;
  void *v32;
  NSObject *queue;
  id v34;
  id v36;
  id v37;
  void (**v38)(id, void *);
  id v39;
  void *v40;
  id obj;
  id v43;
  NSObject *group;
  _QWORD block[5];
  id v46;
  void (**v47)(id, void *);
  _QWORD v48[6];
  id v49;
  NSObject *v50;
  __int128 *p_buf;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[4];
  const char *v61;
  uint8_t v62[128];
  __int128 buf;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v43 = a4;
  v36 = a6;
  v38 = (void (**)(id, void *))a7;
  v11 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSRemoteControlClient createRemoteVoiceProfileWithAudioFiles:aesKey:encryptedAudio"
                                    "SampleBypeDepth:languageCode:completion:]";
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  if (objc_msgSend(v39, "count"))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v12 = v39;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v57 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v40, "fileExistsAtPath:", v16);

          if ((v17 & 1) == 0)
          {
            if (v38)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 117, &unk_1E7C64B88);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v38[2](v38, v29);

            }
            goto LABEL_29;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v13)
          continue;
        break;
      }
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__21551;
    v66 = __Block_byref_object_dispose__21552;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v67 = (id)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v12;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v53 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_msgSend(v21, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("VoiceTrigger/SAT/audio/"), "stringByAppendingPathComponent:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          dispatch_group_enter(group);
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __125__CSRemoteControlClient_createRemoteVoiceProfileWithAudioFiles_aesKey_encryptedAudioSampleBypeDepth_languageCode_completion___block_invoke;
          v48[3] = &unk_1E7C27B20;
          v48[4] = v21;
          v48[5] = self;
          v24 = v23;
          v49 = v24;
          p_buf = &buf;
          v50 = group;
          -[CSRemoteControlClient _fetchDataFromAudioFileUrl:aesKey:encryptedAudioSampleBypeDepth:completion:](self, "_fetchDataFromAudioFileUrl:aesKey:encryptedAudioSampleBypeDepth:completion:", v21, v43, a5, v48);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v18);
    }

    v25 = dispatch_time(0, 10000000000);
    v26 = dispatch_group_wait(group, v25);
    v27 = v26 == 0;
    if (v26)
    {
      v28 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v60 = 136315138;
        v61 = "-[CSRemoteControlClient createRemoteVoiceProfileWithAudioFiles:aesKey:encryptedAudioSampleBypeDepth:langua"
              "geCode:completion:]";
        _os_log_error_impl(&dword_1C2614000, v28, OS_LOG_TYPE_ERROR, "%s ERR: training data transfer timed out", v60, 0xCu);
      }
      if (v38)
        v38[2](v38, 0);
    }
    else
    {
      v31 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v31, "COMMAND", "createRemoteVoiceProfile");
      xpc_dictionary_set_string(v31, "languageCode", (const char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "_cs_xpcObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v31, "explicitTrainingAudioFiles", v32);

      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __125__CSRemoteControlClient_createRemoteVoiceProfileWithAudioFiles_aesKey_encryptedAudioSampleBypeDepth_languageCode_completion___block_invoke_242;
      block[3] = &unk_1E7C28EC8;
      block[4] = self;
      v46 = v31;
      v47 = v38;
      v34 = v31;
      dispatch_async(queue, block);

    }
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, &unk_1E7C64B60);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2](v38, v30);

    }
LABEL_29:
    v27 = 0;
  }

  return v27;
}

- (void)notifyBluetoothWirelessSplitterStateChanged:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  const __CFString *v8;
  xpc_object_t v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    v15 = "-[CSRemoteControlClient notifyBluetoothWirelessSplitterStateChanged:shouldDisableSpeakerVerificationInSplitterMode:]";
    *(_DWORD *)buf = 136315650;
    if (v4)
      v8 = CFSTR("YES");
    v16 = 2050;
    v17 = a3;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s splitterState : %{public}lu, shouldDisableSpeakerVerification : %{public}@", buf, 0x20u);
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "COMMAND", "notifySplitterStateChange");
  xpc_dictionary_set_uint64(v9, "splitterState", a3);
  xpc_dictionary_set_BOOL(v9, "shouldDisableSpeakerVerification", v4);
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__CSRemoteControlClient_notifyBluetoothWirelessSplitterStateChanged_shouldDisableSpeakerVerificationInSplitterMode___block_invoke;
  v12[3] = &unk_1E7C292A0;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(queue, v12);

}

- (void)fetchAndClearCachedVoiceTriggerEventsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSRemoteControlClient fetchAndClearCachedVoiceTriggerEventsWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = CFSTR("COMMAND");
  v14 = CFSTR("fetchAndClearCachedVTEvents");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CSRemoteControlClient_fetchAndClearCachedVoiceTriggerEventsWithCompletion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)setUserSelectedVoiceTriggerPhraseType:(unint64_t)a3
{
  NSObject *v5;
  xpc_object_t v6;
  OS_xpc_remote_connection *v7;
  NSObject *queue;
  id v9;
  OS_xpc_remote_connection *v10;
  _QWORD v11[4];
  OS_xpc_remote_connection *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSRemoteControlClient setUserSelectedVoiceTriggerPhraseType:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "COMMAND", "userSelectedVoiceTriggerPhraseType");
  xpc_dictionary_set_uint64(v6, "userSelectedVoiceTriggerPhraseTypeOption", a3);
  v7 = self->_connection;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CSRemoteControlClient_setUserSelectedVoiceTriggerPhraseType___block_invoke;
  v11[3] = &unk_1E7C292A0;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, v11);

}

- (void)_fetchDataFromAudioFileUrl:(id)a3 aesKey:(id)a4 encryptedAudioSampleBypeDepth:(unint64_t)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  _BYTE v22[40];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __100__CSRemoteControlClient__fetchDataFromAudioFileUrl_aesKey_encryptedAudioSampleBypeDepth_completion___block_invoke;
  v39[3] = &unk_1E7C27B48;
  v12 = v8;
  v40 = v12;
  v13 = v10;
  v41 = v13;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v39);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__21551;
  v33 = __Block_byref_object_dispose__21552;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__21551;
  v27 = __Block_byref_object_dispose__21552;
  v28 = 0;
  v15 = (void *)MEMORY[0x1E0DA8C18];
  objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __100__CSRemoteControlClient__fetchDataFromAudioFileUrl_aesKey_encryptedAudioSampleBypeDepth_completion___block_invoke_261;
  v17[3] = &unk_1E7C27B70;
  v16 = v12;
  v18 = v16;
  v19 = &v23;
  v20 = &v29;
  v21 = &v35;
  objc_msgSend(v15, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", v16, v22, 640, v17);
  v14[2](v14, v30[5], v36[3], v24[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

- (void)_transferAudioData:(id)a3 numSamples:(unint64_t)a4 remoteWavFilePath:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v13, "COMMAND", "writeFileFromAudioData");
  xpc_dictionary_set_uint64(v13, "numberOfSamples", a4);
  if (v11)
    xpc_dictionary_set_string(v13, "filePath", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
  if (v10)
  {
    objc_msgSend(v10, "_cs_xpcObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v13, "audioData", v14);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CSRemoteControlClient__transferAudioData_numSamples_remoteWavFilePath_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v19 = v13;
  v20 = v12;
  v16 = v12;
  v17 = v13;
  dispatch_async(queue, block);

}

- (void)setSelfTriggerEnable:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString **v9;
  const __CFString **v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSRemoteControlClient setSelfTriggerEnable:withCompletion:]";
    v24 = 1026;
    v25 = v4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s setting remote SelfTrigger enable : %{public}d", buf, 0x12u);
  }
  if (v4)
  {
    v20 = CFSTR("COMMAND");
    v21 = CFSTR("enableSelfTrigger");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v21;
    v10 = &v20;
  }
  else
  {
    v18 = CFSTR("COMMAND");
    v19 = CFSTR("disableSelfTrigger");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v19;
    v10 = &v18;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CSRemoteControlClient_setSelfTriggerEnable_withCompletion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v16 = v11;
  v17 = v6;
  v13 = v6;
  v14 = v11;
  dispatch_async(queue, block);

}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (OS_remote_device)device
{
  return self->_device;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (CSRemoteDeviceProtocolInfo)deviceProtocolInfo
{
  return self->_deviceProtocolInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceProtocolInfo, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deviceWaitingGroup, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__CSRemoteControlClient_setSelfTriggerEnable_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 1, 0);
  }
  else
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[CSRemoteControlClient setSelfTriggerEnable:withCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", (uint8_t *)&v7, 0xCu);
    }
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 302, &unk_1E7C64BB0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }
}

void __84__CSRemoteControlClient__transferAudioData_numSamples_remoteWavFilePath_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    xpc_remote_connection_send_message();
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CSRemoteControlClient _transferAudioData:numSamples:remoteWavFilePath:completion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", (uint8_t *)&v6, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 302, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    }
  }
}

void __100__CSRemoteControlClient__fetchDataFromAudioFileUrl_aesKey_encryptedAudioSampleBypeDepth_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 136315394;
      v14 = "-[CSRemoteControlClient _fetchDataFromAudioFileUrl:aesKey:encryptedAudioSampleBypeDepth:completion:]_block_invoke";
      v15 = 2114;
      v16 = v12;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s ERR: Failed to fetch audio data from %{public}@", (uint8_t *)&v13, 0x16u);
    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_8:
      v10();
    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_8;
    }
  }

}

void __100__CSRemoteControlClient__fetchDataFromAudioFileUrl_aesKey_encryptedAudioSampleBypeDepth_completion___block_invoke_261(_QWORD *a1, uint64_t a2, char a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v13 = a1[4];
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSRemoteControlClient _fetchDataFromAudioFileUrl:aesKey:encryptedAudioSampleBypeDepth:completion:]_block_invoke";
      v17 = 2112;
      v18 = v13;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed to read file: %@", buf, 0x16u);
    }
    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = v7;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
LABEL_9:

    goto LABEL_10;
  }
  if ((a3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "appendData:", v11);
    v12 = objc_msgSend(v11, "length");
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += v12 / v14;
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __63__CSRemoteControlClient_setUserSelectedVoiceTriggerPhraseType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return xpc_remote_connection_send_message();
  return result;
}

void __77__CSRemoteControlClient_fetchAndClearCachedVoiceTriggerEventsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient fetchAndClearCachedVoiceTriggerEventsWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0, 0);
  }
}

void __77__CSRemoteControlClient_fetchAndClearCachedVoiceTriggerEventsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1C3BC4CBC]() == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_array(xdict, "voiceTriggerFirstPassEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v7, "_cs_initWithXPCObject:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    xpc_dictionary_get_array(xdict, "secondPassRejectedEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v9, "_cs_initWithXPCObject:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    xpc_dictionary_get_array(xdict, "secondPassCancelledEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v11, "_cs_initWithXPCObject:", v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, void *, void *, void *))(v12 + 16))(v12, v5, v4, v3);

}

void __116__CSRemoteControlClient_notifyBluetoothWirelessSplitterStateChanged_shouldDisableSpeakerVerificationInSplitterMode___block_invoke(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    xpc_remote_connection_send_message();
  }
  else
  {
    v1 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v2 = 136315138;
      v3 = "-[CSRemoteControlClient notifyBluetoothWirelessSplitterStateChanged:shouldDisableSpeakerVerificationInSplitte"
           "rMode:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v1, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", (uint8_t *)&v2, 0xCu);
    }
  }
}

void __125__CSRemoteControlClient_createRemoteVoiceProfileWithAudioFiles_aesKey_encryptedAudioSampleBypeDepth_languageCode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (!v7 || v8)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  else
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSRemoteControlClient createRemoteVoiceProfileWithAudioFiles:aesKey:encryptedAudioSampleBypeDepth:language"
            "Code:completion:]_block_invoke";
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Sending training data from %{public}@ to remote", buf, 0x16u);
    }
    v13 = *(void **)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __125__CSRemoteControlClient_createRemoteVoiceProfileWithAudioFiles_aesKey_encryptedAudioSampleBypeDepth_languageCode_completion___block_invoke_238;
    v14[3] = &unk_1E7C27AF8;
    v17 = *(_QWORD *)(a1 + 64);
    v15 = v12;
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v13, "_transferAudioData:numSamples:remoteWavFilePath:completion:", v7, a3, v15, v14);

  }
}

void __125__CSRemoteControlClient_createRemoteVoiceProfileWithAudioFiles_aesKey_encryptedAudioSampleBypeDepth_languageCode_completion___block_invoke_242(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();
    v2 = v5;
LABEL_7:

    return;
  }
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSRemoteControlClient createRemoteVoiceProfileWithAudioFiles:aesKey:encryptedAudioSampleBypeDepth:languageCod"
         "e:completion:]_block_invoke";
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 302, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v2);
    goto LABEL_7;
  }
}

void __125__CSRemoteControlClient_createRemoteVoiceProfileWithAudioFiles_aesKey_encryptedAudioSampleBypeDepth_languageCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && xpc_dictionary_get_BOOL(v3, "replyResult"))
  {
    v5 = 0;
  }
  else
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSRemoteControlClient createRemoteVoiceProfileWithAudioFiles:aesKey:encryptedAudioSampleBypeDepth:languageC"
           "ode:completion:]_block_invoke_2";
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Failed to create remote voice profile", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 306, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v5);

}

void __125__CSRemoteControlClient_createRemoteVoiceProfileWithAudioFiles_aesKey_encryptedAudioSampleBypeDepth_languageCode_completion___block_invoke_238(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __58__CSRemoteControlClient_exchangeRemoteDeviceProtocolInfo___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t buf[4];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    xpc_remote_connection_send_message_with_reply();
  }
  else
  {
    v1 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v3 = "-[CSRemoteControlClient exchangeRemoteDeviceProtocolInfo:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v1, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
  }
}

void __58__CSRemoteControlClient_exchangeRemoteDeviceProtocolInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1C3BC4CBC]();
  v5 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (!v3 || !xpc_dictionary_get_BOOL(v3, "replyResult"))
  {
    v6 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSRemoteControlClient exchangeRemoteDeviceProtocolInfo:]_block_invoke_2";
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fetch accessory protocol info, fallback to default info", buf, 0xCu);
    }
  }
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_dictionary(v3, "accessoryProtocolInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(NSObject **)(v10 + 8);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__CSRemoteControlClient_exchangeRemoteDeviceProtocolInfo___block_invoke_227;
      v12[3] = &unk_1E7C292A0;
      v12[4] = v10;
      v13 = v8;
      dispatch_async(v11, v12);

    }
  }
  else
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSRemoteControlClient exchangeRemoteDeviceProtocolInfo:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Wrong reply type received", buf, 0xCu);
    }
  }

}

void __58__CSRemoteControlClient_exchangeRemoteDeviceProtocolInfo___block_invoke_227(uint64_t a1)
{
  CSRemoteDeviceProtocolInfo *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[CSRemoteDeviceProtocolInfo initWithXPCObject:]([CSRemoteDeviceProtocolInfo alloc], "initWithXPCObject:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v7 = v5;
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[CSRemoteControlClient exchangeRemoteDeviceProtocolInfo:]_block_invoke";
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetched accessory device info : %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

void __75__CSRemoteControlClient_notifyVoiceTriggerAssetChangeWithSiriLanguageCode___block_invoke(uint64_t a1)
{
  NSObject *v1;
  id v2;
  uint8_t buf[4];
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

  }
  else
  {
    v1 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v4 = "-[CSRemoteControlClient notifyVoiceTriggerAssetChangeWithSiriLanguageCode:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v1, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
  }
}

uint64_t __60__CSRemoteControlClient__dictionaryWithContentsOfXPCObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

  }
  else
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSRemoteControlClient _dictionaryWithContentsOfXPCObject:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s xpcObject key or value is NULL", (uint8_t *)&v10, 0xCu);
    }
  }

  return 1;
}

void __49__CSRemoteControlClient_getFirstPassRunningMode___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient getFirstPassRunningMode:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
}

void __49__CSRemoteControlClient_getFirstPassRunningMode___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (MEMORY[0x1C3BC4CBC]() == MEMORY[0x1E0C812F8])
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v4, "_cs_initWithXPCObject:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5
      && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replyGetFirstPassRunningMode")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replyGetFirstPassRunningMode"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "unsignedIntegerValue");

    }
    else
    {
      v3 = -1;
    }

  }
  else
  {
    v3 = -1;
  }
  v8 = v10;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v3, v10);
    v8 = v10;
  }

}

void __43__CSRemoteControlClient_clearTriggerCount___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient clearTriggerCount:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
}

void __43__CSRemoteControlClient_clearTriggerCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (MEMORY[0x1C3BC4CBC]() == MEMORY[0x1E0C812F8])
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "_cs_initWithXPCObject:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyClearTriggerCount"));

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __41__CSRemoteControlClient_getTriggerCount___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient getTriggerCount:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
}

void __41__CSRemoteControlClient_getTriggerCount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (MEMORY[0x1C3BC4CBC]() == MEMORY[0x1E0C812F8])
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v4, "_cs_initWithXPCObject:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replyGetTriggerCount"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replyGetTriggerCount"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = (void *)objc_msgSend(v6, "unsignedLongLongValue");

      }
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  v7 = v9;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v3, v9);
    v7 = v9;
  }

}

void __85__CSRemoteControlClient_transferInterstitialAudioFiles_interstitialLevel_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __85__CSRemoteControlClient_transferInterstitialAudioFiles_interstitialLevel_completion___block_invoke_199(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

  }
  else
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient transferInterstitialAudioFiles:interstitialLevel:completion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v2, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 302, &unk_1E7C64B38);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    }
  }
}

void __57__CSRemoteControlClient_invalidateInterstitialWithLevel___block_invoke(uint64_t a1)
{
  NSObject *v1;
  id v2;
  uint8_t buf[4];
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

  }
  else
  {
    v1 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v4 = "-[CSRemoteControlClient invalidateInterstitialWithLevel:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v1, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
  }
}

void __59__CSRemoteControlClient_voiceTriggerEnabledWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient voiceTriggerEnabledWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
  }
}

void __59__CSRemoteControlClient_voiceTriggerEnabledWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (MEMORY[0x1C3BC4CBC]() == MEMORY[0x1E0C812F8])
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v4, "_cs_initWithXPCObject:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replyVoiceTriggerEnabled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replyVoiceTriggerEnabled"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v7, "BOOLValue");

      }
    }
    else
    {
      v6 = 0;
    }
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, 1, v6);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
  }

}

void __62__CSRemoteControlClient_setVoiceTriggerEnable_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient setVoiceTriggerEnable:withCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
}

uint64_t __62__CSRemoteControlClient_setVoiceTriggerEnable_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x1C3BC4CBC](a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v3 == MEMORY[0x1E0C812F8]);
  return result;
}

void __78__CSRemoteControlClient_transferVoiceTriggerAsset_forLanguageCode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __78__CSRemoteControlClient_transferVoiceTriggerAsset_forLanguageCode_completion___block_invoke_162(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();

    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 1, 0);
  }
  else
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[CSRemoteControlClient transferVoiceTriggerAsset:forLanguageCode:completion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", (uint8_t *)&v7, 0xCu);
    }
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 304, &unk_1E7C64A98);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }
}

void __67__CSRemoteControlClient_transferVoiceTriggerSpeakerModel_forAsset___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __53__CSRemoteControlClient__transferFile_at_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v17 = "-[CSRemoteControlClient _transferFile:at:completion:]_block_invoke";
      v18 = 2114;
      v19 = v13;
      v20 = 1026;
      v21 = a2;
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Transfer of file %{public}@ failed : %{public}d", buf, 0x1Cu);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D18E80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2, CFSTR("reason"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 304, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v10);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSRemoteControlClient _transferFile:at:completion:]_block_invoke";
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Transfer of file %{public}@ succeed", buf, 0x16u);
    }
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }
}

void __53__CSRemoteControlClient__transferFile_at_completion___block_invoke_136(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    xpc_remote_connection_send_message();
  }
  else
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[CSRemoteControlClient _transferFile:at:completion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v2, OS_LOG_TYPE_ERROR, "%s attempt to send message while connection does not exsit", buf, 0xCu);
    }
    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__CSRemoteControlClient__transferFile_at_completion___block_invoke_137;
      block[3] = &unk_1E7C28F10;
      v6 = v3;
      dispatch_async(v4, block);

    }
  }
}

void __53__CSRemoteControlClient__transferFile_at_completion___block_invoke_137(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 302, &unk_1E7C64A48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __71__CSRemoteControlClient_readAndClearVoiceTriggeredTokenWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient readAndClearVoiceTriggeredTokenWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0, 0, 0);
  }
}

void __71__CSRemoteControlClient_readAndClearVoiceTriggeredTokenWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if (MEMORY[0x1C3BC4CBC]() == MEMORY[0x1E0C812F8])
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v7, "_cs_initWithXPCObject:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("replyReadAndClearVoiceTriggeredToken"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("replyReadAndClearVoiceTriggeredToken"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v9, "BOOLValue");

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("myriadHash"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("myriadHash"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("voiceTriggerEventInfo"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("voiceTriggerEventInfo"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tokenFetchMachTime"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tokenFetchMachTime"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(v10, "unsignedLongLongValue");

      }
    }
    else
    {
      v3 = 0;
      v6 = 0;
      v5 = 0;
      v4 = 0;
    }

  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, void *, void *, void *, void *))(v11 + 16))(v11, v6, v5, v3, v4);

}

void __63__CSRemoteControlClient_readVoiceTriggeredTokenWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 48);
    xpc_remote_connection_send_message_with_reply();

  }
  else
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteControlClient readVoiceTriggeredTokenWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Attempt to send message while connection does not exist", buf, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
}

void __63__CSRemoteControlClient_readVoiceTriggeredTokenWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (MEMORY[0x1C3BC4CBC]() == MEMORY[0x1E0C812F8])
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v4, "_cs_initWithXPCObject:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replyReadVoiceTriggeredToken"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replyReadVoiceTriggeredToken"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = (void *)objc_msgSend(v6, "BOOLValue");

      }
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  v7 = v9;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v3, v9);
    v7 = v9;
  }

}

uint64_t __36__CSRemoteControlClient_isConnected__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

void __45__CSRemoteControlClient_didDeviceDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(NSObject **)(v11 + 8);
          v13[0] = v8;
          v13[1] = 3221225472;
          v13[2] = __45__CSRemoteControlClient_didDeviceDisconnect___block_invoke_2;
          v13[3] = &unk_1E7C292A0;
          v13[4] = v10;
          v13[5] = v11;
          dispatch_async(v12, v13);
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

uint64_t __45__CSRemoteControlClient_didDeviceDisconnect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnected:", *(_QWORD *)(a1 + 40));
}

void __42__CSRemoteControlClient_didDeviceConnect___block_invoke(uint64_t a1)
{
  unsigned int type;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[2];
  _BYTE location[12];
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  type = remote_device_get_type();
  v3 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 40);
  if ((_DWORD)v3 == type)
  {
    v13[0] = 0;
    v13[1] = 0;
    remote_device_copy_uuid();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v13);
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

    v8 = (void *)remote_device_copy_service();
    if (v8)
    {
      v9 = (void *)xpc_remote_connection_create_with_remote_service();
      objc_initWeak((id *)location, *(id *)(a1 + 40));
      objc_copyWeak(&v12, (id *)location);
      xpc_remote_connection_set_event_handler();
      xpc_remote_connection_activate();
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), v9);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "leave");
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v11 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "-[CSRemoteControlClient didDeviceConnect:]_block_invoke";
        v15 = 2082;
        v16 = (unint64_t)"com.apple.corespeech.xpc.remote.control";
        _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Service: %{public}s not found", location, 0x16u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "leave");
    }

  }
  else
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315650;
      *(_QWORD *)&location[4] = "-[CSRemoteControlClient didDeviceConnect:]_block_invoke";
      v15 = 2048;
      v16 = type;
      v17 = 2048;
      v18 = v3;
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Connected to unexpected device type : %lu (expected type: %lu)", location, 0x20u);
    }
  }
}

void __42__CSRemoteControlClient_didDeviceConnect___block_invoke_71(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleServerEvent:", v3);

}

uint64_t __35__CSRemoteControlClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __40__CSRemoteControlClient_removeObserver___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 32), "removeObject:", *(_QWORD *)(result + 40));
  return result;
}

uint64_t __37__CSRemoteControlClient_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __46__CSRemoteControlClient_initWithRemoteDevice___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didDeviceConnect:", v3);

}

void __46__CSRemoteControlClient_initWithRemoteDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didDeviceDisconnect:", v3);

}

@end
