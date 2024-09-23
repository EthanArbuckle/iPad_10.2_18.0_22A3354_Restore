@implementation CSSiriMobileBluetoothDeviceDataSource

- (CSSiriMobileBluetoothDeviceDataSource)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_group_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CSSiriMobileBluetoothDeviceDataSource;
  v2 = -[CSSiriMobileBluetoothDeviceDataSource init](&v22, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("CSSiriMobileBluetoothDeviceDataSource", v3);

    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    v6 = dispatch_group_create();
    v7 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v6;

    *((_DWORD *)v2 + 14) = 0;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v8;

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v10;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 6));
    v12 = *((_QWORD *)v2 + 1);
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__CSSiriMobileBluetoothDeviceDataSource_init__block_invoke;
    block[3] = &unk_1E7C292C8;
    v21 = v2;
    dispatch_async(v12, block);
    v14 = *((id *)v2 + 1);
    +[CSSiriQueueMonitor sharedMonitor](CSSiriQueueMonitor, "sharedMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __45__CSSiriMobileBluetoothDeviceDataSource_init__block_invoke_2;
    v18[3] = &unk_1E7C27BF8;
    v19 = v14;
    v16 = v14;
    objc_msgSend(v15, "addQueue:heartBeatInterval:timeoutInterval:timeoutHandler:", v16, v18, 5.0, 5.0);

  }
  return (CSSiriMobileBluetoothDeviceDataSource *)v2;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CSSiriMobileBluetoothDeviceDataSource_invalidate__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cleanUpDeviceProxies
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CSSiriMobileBluetoothDeviceDataSource _cleanUpDeviceProxies]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_deviceProxiesLock);
  -[NSMutableDictionary allValues](self->_deviceProxiesByAddress, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_deviceProxiesByAddress, "removeAllObjects");
  -[NSMutableDictionary allValues](self->_deviceProxiesByDeviceUID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_deviceProxiesByDeviceUID, "removeAllObjects");
  os_unfair_lock_unlock(&self->_deviceProxiesLock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10++), "invalidate");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "invalidate", (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)_detachFromSession
{
  BTSessionImpl **p_session;
  BTSessionImpl *session;
  NSObject *v5;
  BTSessionImpl *v6;
  int v7;
  const char *v8;
  __int16 v9;
  BTSessionImpl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CSSiriMobileBluetoothDeviceDataSource _tearDownAccessoryManager](self, "_tearDownAccessoryManager");
  -[CSSiriMobileBluetoothDeviceDataSource _tearDownLocalDevice](self, "_tearDownLocalDevice");
  session = self->_session;
  p_session = &self->_session;
  if (session)
  {
    BTServiceRemoveCallbacks();
    v5 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      v6 = *p_session;
      v7 = 136315394;
      v8 = "-[CSSiriMobileBluetoothDeviceDataSource _detachFromSession]";
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s Detaching from session %p", (uint8_t *)&v7, 0x16u);
    }
    BTSessionDetachWithQueue();
    *p_session = 0;
  }
}

- (void)_attachToSession
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_attachingToSession)
  {
    v2 = *MEMORY[0x1E0CFE6A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
      return;
    v10 = 136315138;
    v11 = "-[CSSiriMobileBluetoothDeviceDataSource _attachToSession]";
    v3 = "%s Already attaching to session!";
    v4 = v2;
    v5 = 12;
LABEL_7:
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v10, v5);
    return;
  }
  -[CSSiriMobileBluetoothDeviceDataSource _detachFromSession](self, "_detachFromSession");
  v7 = BTSessionAttachWithQueue();
  v8 = *MEMORY[0x1E0CFE6A8];
  if (v7)
  {
    v9 = v7;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
      return;
    v10 = 136315394;
    v11 = "-[CSSiriMobileBluetoothDeviceDataSource _attachToSession]";
    v12 = 1024;
    v13 = v9;
    v3 = "%s Failed attaching to bt session %d";
    v4 = v8;
    v5 = 18;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[CSSiriMobileBluetoothDeviceDataSource _attachToSession]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s Attaching to session", (uint8_t *)&v10, 0xCu);
  }
  self->_attachingToSession = 1;
  dispatch_group_enter((dispatch_group_t)self->_sessionSetupGroup);
}

- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4
{
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  BTSessionImpl *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[CSSiriMobileBluetoothDeviceDataSource _sessionAttached:result:]";
    v20 = 2048;
    v21 = a3;
    v22 = 1024;
    v23 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s session = %p, result = %d", buf, 0x1Cu);
  }
  self->_attachingToSession = 0;
  if (!a4)
  {
    -[CSSiriMobileBluetoothDeviceDataSource _detachFromSession](self, "_detachFromSession");
    self->_session = a3;
    if (a3)
      BTServiceAddCallbacks();
    -[CSSiriMobileBluetoothDeviceDataSource _setUpLocalDevice](self, "_setUpLocalDevice");
    -[CSSiriMobileBluetoothDeviceDataSource _setUpAccessoryManager](self, "_setUpAccessoryManager");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CSSiriMobileBluetoothDeviceDataSource _deviceProxies](self, "_deviceProxies", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "reload");
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
  dispatch_group_leave((dispatch_group_t)self->_sessionSetupGroup);
}

- (void)_sessionDetached:(BTSessionImpl *)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  BTSessionImpl *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriMobileBluetoothDeviceDataSource _sessionDetached:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s session = %p", (uint8_t *)&v6, 0x16u);
  }
  if (self->_session == a3)
  {
    -[CSSiriMobileBluetoothDeviceDataSource _cleanUpDeviceProxies](self, "_cleanUpDeviceProxies");
    -[CSSiriMobileBluetoothDeviceDataSource _tearDownAccessoryManager](self, "_tearDownAccessoryManager");
    -[CSSiriMobileBluetoothDeviceDataSource _tearDownLocalDevice](self, "_tearDownLocalDevice");
    if (self->_session)
    {
      BTServiceRemoveCallbacks();
      self->_session = 0;
    }
  }
}

- (void)_sessionTerminated:(BTSessionImpl *)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  BTSessionImpl *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriMobileBluetoothDeviceDataSource _sessionTerminated:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s session = %p", (uint8_t *)&v6, 0x16u);
  }
  if (self->_session == a3)
  {
    -[CSSiriMobileBluetoothDeviceDataSource _tearDownAccessoryManager](self, "_tearDownAccessoryManager");
    -[CSSiriMobileBluetoothDeviceDataSource _tearDownLocalDevice](self, "_tearDownLocalDevice");
    if (self->_session)
    {
      BTServiceRemoveCallbacks();
      self->_session = 0;
    }
    -[CSSiriMobileBluetoothDeviceDataSource _attachToSession](self, "_attachToSession");
  }
}

- (void)_setUpLocalDevice
{
  int Default;
  int v4;
  NSObject *v5;
  BTSessionImpl *session;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  BTLocalDeviceImpl *localDevice;
  BTSessionImpl *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BTSessionImpl *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CSSiriMobileBluetoothDeviceDataSource _tearDownLocalDevice](self, "_tearDownLocalDevice");
  if (!self->_session)
  {
    v10 = *MEMORY[0x1E0CFE6A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
      return;
    v16 = 136315138;
    v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpLocalDevice]";
    v7 = "%s Session is NULL.";
    v8 = v10;
    v9 = 12;
    goto LABEL_10;
  }
  Default = BTLocalDeviceGetDefault();
  if (Default)
  {
    v4 = Default;
    v5 = *MEMORY[0x1E0CFE6A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
      return;
    session = self->_session;
    v16 = 136315650;
    v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpLocalDevice]";
    v18 = 2048;
    v19 = session;
    v20 = 1024;
    LODWORD(v21) = v4;
    v7 = "%s Failed getting default local device from session %p (result = %d).";
    v8 = v5;
    v9 = 28;
    goto LABEL_10;
  }
  v11 = BTLocalDeviceAddCallbacks();
  if (v11)
  {
    v12 = v11;
    v13 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      v15 = self->_session;
      localDevice = self->_localDevice;
      v16 = 136315906;
      v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpLocalDevice]";
      v18 = 2048;
      v19 = localDevice;
      v20 = 2048;
      v21 = v15;
      v22 = 1024;
      v23 = v12;
      v7 = "%s Failed adding callbacks to local device %p from session %p (result = %d).";
      v8 = v13;
      v9 = 38;
LABEL_10:
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, v9);
    }
  }
}

- (void)_tearDownLocalDevice
{
  if (self->_localDevice)
  {
    BTLocalDeviceRemoveCallbacks();
    self->_localDevice = 0;
  }
}

- (void)localDevice:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5
{
  NSObject *v9;
  NSObject *queue;
  _QWORD block[6];
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  BTLocalDeviceImpl *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "-[CSSiriMobileBluetoothDeviceDataSource localDevice:event:result:]";
    v15 = 2048;
    v16 = a3;
    v17 = 1024;
    v18 = a4;
    v19 = 1024;
    v20 = a5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s localDevice = %p, event = %d, result = %d", buf, 0x22u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSSiriMobileBluetoothDeviceDataSource_localDevice_event_result___block_invoke;
  block[3] = &unk_1E7C27F58;
  block[4] = self;
  block[5] = a3;
  v12 = a4;
  dispatch_async(queue, block);
}

- (void)_setUpAccessoryManager
{
  int Default;
  int v4;
  NSObject *v5;
  BTSessionImpl *session;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  BTAccessoryManagerImpl *accessoryManager;
  BTSessionImpl *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BTSessionImpl *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CSSiriMobileBluetoothDeviceDataSource _tearDownAccessoryManager](self, "_tearDownAccessoryManager");
  if (!self->_session)
  {
    v10 = *MEMORY[0x1E0CFE6A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
      return;
    v16 = 136315138;
    v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
    v7 = "%s Session is NULL.";
    v8 = v10;
    v9 = 12;
    goto LABEL_10;
  }
  Default = BTAccessoryManagerGetDefault();
  if (Default)
  {
    v4 = Default;
    v5 = *MEMORY[0x1E0CFE6A8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
      return;
    session = self->_session;
    v16 = 136315650;
    v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
    v18 = 2048;
    v19 = session;
    v20 = 1024;
    LODWORD(v21) = v4;
    v7 = "%s Failed getting default accessory manager from session %p (result = %d).";
    v8 = v5;
    v9 = 28;
    goto LABEL_10;
  }
  v11 = BTAccessoryManagerAddCallbacks();
  if (v11)
  {
    v12 = v11;
    v13 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      accessoryManager = self->_accessoryManager;
      v15 = self->_session;
      v16 = 136315906;
      v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
      v18 = 2048;
      v19 = accessoryManager;
      v20 = 2048;
      v21 = v15;
      v22 = 1024;
      v23 = v12;
      v7 = "%s Failed adding callbacks to accessory manager %p from session %p (result = %d).";
      v8 = v13;
      v9 = 38;
LABEL_10:
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, v9);
    }
  }
}

- (void)_tearDownAccessoryManager
{
  if (self->_accessoryManager)
  {
    BTAccessoryManagerRemoveCallbacks();
    self->_accessoryManager = 0;
  }
}

- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6
{
  NSObject *v11;
  NSObject *queue;
  _QWORD v13[7];
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  BTAccessoryManagerImpl *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  BTDeviceImpl *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v16 = "-[CSSiriMobileBluetoothDeviceDataSource accessoryManager:event:device:state:]";
    v17 = 2048;
    v18 = a3;
    v19 = 1024;
    v20 = a4;
    v21 = 2048;
    v22 = a5;
    v23 = 1024;
    v24 = a6;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s accessoryManager = %p, accessoryEvent = %d, device = %p, state = %d", buf, 0x2Cu);
  }
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CSSiriMobileBluetoothDeviceDataSource_accessoryManager_event_device_state___block_invoke;
  v13[3] = &unk_1E7C27C20;
  v13[4] = self;
  v13[5] = a3;
  v14 = a4;
  v13[6] = a5;
  dispatch_async(queue, v13);
}

- (void)_reloadForDevice:(BTDeviceImpl *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _CSSiriBTDeviceGetAddress(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[CSSiriMobileBluetoothDeviceDataSource _deviceProxies](self, "_deviceProxies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          v12[0] = v9;
          v12[1] = 3221225472;
          v12[2] = __58__CSSiriMobileBluetoothDeviceDataSource__reloadForDevice___block_invoke;
          v12[3] = &unk_1E7C27C48;
          v13 = v4;
          v14 = v11;
          objc_msgSend(v11, "getDeviceInfo:", v12);

          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
}

- (id)_deviceProxies
{
  os_unfair_lock_s *p_deviceProxiesLock;
  void *v4;
  void *v5;
  id v6;

  p_deviceProxiesLock = &self->_deviceProxiesLock;
  os_unfair_lock_lock(&self->_deviceProxiesLock);
  -[NSMutableDictionary allValues](self->_deviceProxiesByAddress, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_deviceProxiesByDeviceUID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_deviceProxiesLock);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v4);
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v5);

  return v6;
}

- (void)getBTDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *sessionSetupGroup;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CSSiriMobileBluetoothDeviceDataSource_getBTDeviceWithAddress_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_group_notify(sessionSetupGroup, queue, block);

}

- (void)getBTDeviceWithDeviceUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *sessionSetupGroup;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CSSiriMobileBluetoothDeviceDataSource_getBTDeviceWithDeviceUID_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_group_notify(sessionSetupGroup, queue, block);

}

- (void)getBTLocalDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *sessionSetupGroup;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CSSiriMobileBluetoothDeviceDataSource_getBTLocalDeviceWithCompletion___block_invoke;
  v8[3] = &unk_1E7C29150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(sessionSetupGroup, queue, v8);

}

- (id)deviceWithAddress:(id)a3
{
  os_unfair_lock_s *p_deviceProxiesLock;
  id v5;
  void *v6;

  p_deviceProxiesLock = &self->_deviceProxiesLock;
  v5 = a3;
  os_unfair_lock_lock(p_deviceProxiesLock);
  -[CSSiriMobileBluetoothDeviceDataSource _deviceProxyWithAddress:createsIfAbsent:](self, "_deviceProxyWithAddress:createsIfAbsent:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_deviceProxiesLock);
  return v6;
}

- (id)deviceWithUID:(id)a3
{
  os_unfair_lock_s *p_deviceProxiesLock;
  id v5;
  void *v6;

  p_deviceProxiesLock = &self->_deviceProxiesLock;
  v5 = a3;
  os_unfair_lock_lock(p_deviceProxiesLock);
  -[CSSiriMobileBluetoothDeviceDataSource _deviceProxyWithUID:createsIfAbsent:](self, "_deviceProxyWithUID:createsIfAbsent:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_deviceProxiesLock);
  return v6;
}

- (id)_deviceProxyWithAddress:(id)a3 createsIfAbsent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CSSiriMobileBluetoothDeviceProxy *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_deviceProxiesByAddress, "objectForKey:", v6);
  v7 = (CSSiriMobileBluetoothDeviceProxy *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = -[CSSiriMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]([CSSiriMobileBluetoothDeviceProxy alloc], "initWithAddress:dataSource:queue:", v6, self, self->_queue);
    -[NSMutableDictionary setObject:forKey:](self->_deviceProxiesByAddress, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (id)_deviceProxyWithUID:(id)a3 createsIfAbsent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CSSiriMobileBluetoothDeviceProxy *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_deviceProxiesByDeviceUID, "objectForKey:", v6);
  v7 = (CSSiriMobileBluetoothDeviceProxy *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = -[CSSiriMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]([CSSiriMobileBluetoothDeviceProxy alloc], "initWithDeviceUID:dataSource:queue:", v6, self, self->_queue);
    -[NSMutableDictionary setObject:forKey:](self->_deviceProxiesByDeviceUID, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceProxiesByDeviceUID, 0);
  objc_storeStrong((id *)&self->_deviceProxiesByAddress, 0);
  objc_storeStrong((id *)&self->_sessionSetupGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __72__CSSiriMobileBluetoothDeviceDataSource_getBTLocalDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t result;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16))
    v3 = *(_QWORD *)(v2 + 24);
  else
    v3 = 0;
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriMobileBluetoothDeviceDataSource getBTLocalDeviceWithCompletion:]_block_invoke";
    v8 = 2048;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s BTLocalDevice %p", (uint8_t *)&v6, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

uint64_t __77__CSSiriMobileBluetoothDeviceDataSource_getBTDeviceWithDeviceUID_completion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t result;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v16[0] = 0;
    v16[1] = 0;
    objc_msgSend(*(id *)(a1 + 40), "getUUIDBytes:", v16);
    v3 = BTDeviceFromIdentifier();
    if (v3)
    {
      v4 = v3;
      v5 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithDeviceUID:completion:]_block_invoke";
        v12 = 1024;
        LODWORD(v13) = v4;
        _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Failed getting device from deviceUID %d", buf, 0x12u);
      }
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  }
  else
  {
    v6 = 0;
  }
  v7 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithDeviceUID:completion:]_block_invoke";
    v12 = 2048;
    v13 = 0;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s BTDevice %p for deviceUID %@", buf, 0x20u);
    v7 = *v2;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithDeviceUID:completion:]_block_invoke";
    v12 = 2048;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s BTAccessoryManager %p", buf, 0x16u);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, v6);
  return result;
}

uint64_t __75__CSSiriMobileBluetoothDeviceDataSource_getBTDeviceWithAddress_completion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  int v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v7 = 0;
    goto LABEL_9;
  }
  WORD2(v13) = 0;
  LODWORD(v13) = 0;
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String", v13);
  v3 = BTDeviceAddressFromString();
  if (!v3)
  {
    v8 = BTDeviceFromAddress();
    if (!v8)
      goto LABEL_8;
    v9 = v8;
    v5 = *v2;
    if (!os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 136315394;
    v15 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithAddress:completion:]_block_invoke";
    v16 = 1024;
    LODWORD(v17) = v9;
    v6 = "%s Failed getting device from address %d";
    goto LABEL_17;
  }
  v4 = v3;
  v5 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithAddress:completion:]_block_invoke";
    v16 = 1024;
    LODWORD(v17) = v4;
    v6 = "%s Failed getting device address from string %d";
LABEL_17:
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
  }
LABEL_8:
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
LABEL_9:
  v10 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v15 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithAddress:completion:]_block_invoke";
    v16 = 2048;
    v17 = 0;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s BTDevice %p for address %@", buf, 0x20u);
    v10 = *v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithAddress:completion:]_block_invoke";
    v16 = 2048;
    v17 = v7;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s BTAccessoryManager %p", buf, 0x16u);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, v7);
  return result;
}

void __58__CSSiriMobileBluetoothDeviceDataSource__reloadForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "reload");
}

_QWORD *__77__CSSiriMobileBluetoothDeviceDataSource_accessoryManager_event_device_state___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[4] == *(_QWORD *)(a1 + 40) && *(_DWORD *)(a1 + 56) <= 6u)
    return (_QWORD *)objc_msgSend(result, "_reloadForDevice:", *(_QWORD *)(a1 + 48));
  return result;
}

_QWORD *__66__CSSiriMobileBluetoothDeviceDataSource_localDevice_event_result___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[3] == *(_QWORD *)(a1 + 40) && *(_DWORD *)(a1 + 48) == 11)
    return (_QWORD *)objc_msgSend(result, "_cleanUpDeviceProxies");
  return result;
}

uint64_t __51__CSSiriMobileBluetoothDeviceDataSource_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cleanUpDeviceProxies");
  return objc_msgSend(*(id *)(a1 + 32), "_detachFromSession");
}

void __45__CSSiriMobileBluetoothDeviceDataSource_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_attachToSession");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
}

void __45__CSSiriMobileBluetoothDeviceDataSource_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Queue %s did not respond to watchdog and is likely blocked."), dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)));
  v2 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v4 = "-[CSSiriMobileBluetoothDeviceDataSource init]_block_invoke_2";
    v5 = 2112;
    v6 = v1;
    _os_log_fault_impl(&dword_1C2614000, v2, OS_LOG_TYPE_FAULT, "%s %@", buf, 0x16u);
  }

}

@end
