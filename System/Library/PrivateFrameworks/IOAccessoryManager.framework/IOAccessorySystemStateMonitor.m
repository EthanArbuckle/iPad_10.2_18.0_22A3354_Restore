@implementation IOAccessorySystemStateMonitor

- (IOAccessorySystemStateMonitor)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  IONotificationPort *v5;
  uint64_t v6;
  void *v7;
  IONotificationPort *v8;
  const __CFDictionary *v9;
  IONotificationPort *v10;
  const __CFDictionary *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  int *v15;
  int *v16;
  NSObject *v17;
  int *v18;
  int *v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  _QWORD v24[4];
  char *v25;
  _QWORD v26[4];
  char *v27;
  _QWORD handler[4];
  int *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void *v33;
  int *v34;
  _QWORD block[4];
  id v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)IOAccessorySystemStateMonitor;
  v2 = -[IOAccessorySystemStateMonitor init](&v37, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.IOAccessoryManager.SystemStateMonitor", 0);
    v4 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v3;

    v5 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
    *((_QWORD *)v2 + 6) = v5;
    IONotificationPortSetDispatchQueue(v5, *((dispatch_queue_t *)v2 + 7));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v6;

    v8 = (IONotificationPort *)*((_QWORD *)v2 + 6);
    v9 = IOServiceMatching("IOAccessoryIDBusSystemStates");
    IOServiceAddMatchingNotification(v8, "IOServiceFirstPublish", v9, (IOServiceMatchingCallback)ProcessPublishedEndpoints, v2, (io_iterator_t *)v2 + 4);
    v10 = (IONotificationPort *)*((_QWORD *)v2 + 6);
    v11 = IOServiceMatching("IOAccessoryIDBusSystemStates");
    IOServiceAddMatchingNotification(v10, "IOServiceTerminate", v11, (IOServiceMatchingCallback)ProcessTerminatedEndpoints, v2, (io_iterator_t *)v2 + 5);
    v12 = *((_QWORD *)v2 + 7);
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__IOAccessorySystemStateMonitor_init__block_invoke;
    block[3] = &unk_1E9214228;
    v14 = v2;
    v36 = v14;
    dispatch_sync(v12, block);
    v30 = v13;
    v31 = 3221225472;
    v32 = __37__IOAccessorySystemStateMonitor_init__block_invoke_2;
    v33 = &unk_1E92144D8;
    v15 = (int *)v14;
    v34 = v15;
    *((_QWORD *)v15 + 5) = IOPMScheduleUserActivityLevelNotificationWithTimeout();
    v16 = v15 + 6;
    v17 = *((_QWORD *)v2 + 7);
    handler[0] = v13;
    handler[1] = 3221225472;
    handler[2] = __37__IOAccessorySystemStateMonitor_init__block_invoke_3;
    handler[3] = &unk_1E9214500;
    v18 = v15;
    v29 = v18;
    notify_register_dispatch("com.apple.RealitySimulation.DisplayRevealFirstBoot", v16, v17, handler);
    v19 = v18 + 7;
    v20 = *((_QWORD *)v2 + 7);
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __37__IOAccessorySystemStateMonitor_init__block_invoke_4;
    v26[3] = &unk_1E9214500;
    v21 = v18;
    v27 = v21;
    notify_register_dispatch("com.apple.iokit.hid.displayStatus", v19, v20, v26);
    v22 = *((_QWORD *)v2 + 7);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __37__IOAccessorySystemStateMonitor_init__block_invoke_5;
    v24[3] = &unk_1E9214228;
    v25 = v21;
    dispatch_sync(v22, v24);

  }
  return (IOAccessorySystemStateMonitor *)v2;
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke(uint64_t a1)
{
  ProcessPublishedEndpoints(*(void **)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return ProcessTerminatedEndpoints(*(void **)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20));
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processPMUserActiveState:", a2);
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processBootState");
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processDisplayState");
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "processDisplayState");
  return objc_msgSend(*(id *)(a1 + 32), "processBootState");
}

- (void)dealloc
{
  int displayNotifyToken;
  io_object_t discoveryIterator;
  io_object_t terminationIterator;
  IONotificationPort *notificationPort;
  objc_super v7;

  if (self->_pmNotificationHandle)
  {
    IOPMUnregisterNotification();
    self->_pmNotificationHandle = 0;
  }
  displayNotifyToken = self->_displayNotifyToken;
  if (displayNotifyToken)
  {
    notify_cancel(displayNotifyToken);
    self->_displayNotifyToken = 0;
  }
  discoveryIterator = self->_discoveryIterator;
  if (discoveryIterator)
  {
    IOObjectRelease(discoveryIterator);
    self->_discoveryIterator = 0;
  }
  terminationIterator = self->_terminationIterator;
  if (terminationIterator)
  {
    IOObjectRelease(terminationIterator);
    self->_terminationIterator = 0;
  }
  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)IOAccessorySystemStateMonitor;
  -[IOAccessorySystemStateMonitor dealloc](&v7, sel_dealloc);
}

- (void)addEndpointForService:(unsigned int)a3
{
  uint64_t v3;
  kern_return_t RegistryEntryID;
  mach_error_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *endpointMap;
  void *v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  IOAccessorySystemStateEndpoint *v34;
  IOAccessorySystemStateEndpoint *v35;
  NSMutableDictionary *v36;
  void *v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t entryID;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    if (IOObjectConformsTo(a3, "IOAccessoryIDBusSystemStates"))
    {
      entryID = 0;
      RegistryEntryID = IORegistryEntryGetRegistryEntryID(v3, &entryID);
      if (RegistryEntryID)
      {
        v6 = RegistryEntryID;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[IOAccessorySystemStateMonitor addEndpointForService:].cold.5(v6);
      }
      else
      {
        endpointMap = self->_endpointMap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", entryID);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](endpointMap, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v26)
            -[IOAccessorySystemStateMonitor addEndpointForService:].cold.4(v26, v27, v28, v29, v30, v31, v32, v33);
        }
        else
        {
          v34 = -[IOAccessorySystemStateEndpoint initWithService:]([IOAccessorySystemStateEndpoint alloc], "initWithService:", v3);
          v35 = v34;
          if (v34)
          {
            if (self->_userActive)
              -[IOAccessorySystemStateEndpoint notifyUserActive:](v34, "notifyUserActive:", 1);
            if (self->_userPresent)
              -[IOAccessorySystemStateEndpoint notifyUserPresent:](v35, "notifyUserPresent:", 1);
            if (self->_bootComplete)
              -[IOAccessorySystemStateEndpoint notifyBootComplete](v35, "notifyBootComplete");
            v36 = self->_endpointMap;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", entryID);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v35, v37);

          }
          else
          {
            v38 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v38)
              -[IOAccessorySystemStateMonitor addEndpointForService:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);
          }

        }
      }
    }
    else
    {
      v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v15)
        -[IOAccessorySystemStateMonitor addEndpointForService:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
      -[IOAccessorySystemStateMonitor addEndpointForService:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)removeEndpointForService:(unsigned int)a3
{
  NSMutableDictionary *endpointMap;
  void *v5;
  uint64_t entryID;

  if (a3)
  {
    entryID = 0;
    if (!IORegistryEntryGetRegistryEntryID(a3, &entryID))
    {
      endpointMap = self->_endpointMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", entryID);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](endpointMap, "setObject:forKeyedSubscript:", 0, v5);

    }
  }
}

- (void)processDisplayState
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_displayNotifyToken, &state64);
  -[IOAccessorySystemStateMonitor notifyEndpointsUserPresent:](self, "notifyEndpointsUserPresent:", state64 != 0);
}

- (void)processBootState
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_bootToken, &state64);
  -[IOAccessorySystemStateMonitor notifyEndpointsBootComplete:](self, "notifyEndpointsBootComplete:", state64 != 0);
}

- (void)processPMUserActiveState:(unint64_t)a3
{
  -[IOAccessorySystemStateMonitor notifyEndpointsUserActive:](self, "notifyEndpointsUserActive:", (a3 & 5) != 0);
}

- (void)notifyEndpointsBootComplete:(BOOL)a3
{
  uint64_t v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[NSMutableDictionary count](self->_endpointMap, "count");
      *(_DWORD *)buf = 136315394;
      v17 = "-[IOAccessorySystemStateMonitor notifyEndpointsBootComplete:]";
      v18 = 2048;
      v19 = v4;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s boot completed notifying %lu endpoints", buf, 0x16u);
    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_endpointMap;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "notifyBootComplete");

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    self->_bootComplete = 1;
  }
}

- (void)notifyEndpointsUserActive:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 userActive;
  uint64_t v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_userActive != a3)
  {
    v3 = a3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      userActive = self->_userActive;
      v6 = -[NSMutableDictionary count](self->_endpointMap, "count");
      *(_DWORD *)buf = 136315906;
      v19 = "-[IOAccessorySystemStateMonitor notifyEndpointsUserActive:]";
      v20 = 1024;
      v21 = userActive;
      v22 = 1024;
      v23 = v3;
      v24 = 2048;
      v25 = v6;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s user active changed %d->%d notifying %lu endpoints", buf, 0x22u);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_endpointMap;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "notifyUserActive:", v3);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    self->_userActive = v3;
  }
}

- (void)notifyEndpointsUserPresent:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 userPresent;
  uint64_t v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_userPresent != a3)
  {
    v3 = a3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      userPresent = self->_userPresent;
      v6 = -[NSMutableDictionary count](self->_endpointMap, "count");
      *(_DWORD *)buf = 136315906;
      v19 = "-[IOAccessorySystemStateMonitor notifyEndpointsUserPresent:]";
      v20 = 1024;
      v21 = userPresent;
      v22 = 1024;
      v23 = v3;
      v24 = 2048;
      v25 = v6;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s user present changed %d->%d notifying %lu endpoints", buf, 0x22u);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_endpointMap;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "notifyUserPresent:", v3);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    self->_userPresent = v3;
  }
}

- (NSMutableDictionary)endpointMap
{
  return self->_endpointMap;
}

- (void)setEndpointMap:(id)a3
{
  objc_storeStrong((id *)&self->_endpointMap, a3);
}

- (unint64_t)pmNotificationHandle
{
  return self->_pmNotificationHandle;
}

- (void)setPmNotificationHandle:(unint64_t)a3
{
  self->_pmNotificationHandle = a3;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->_notificationPort = a3;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (unsigned)discoveryIterator
{
  return self->_discoveryIterator;
}

- (void)setDiscoveryIterator:(unsigned int)a3
{
  self->_discoveryIterator = a3;
}

- (unsigned)terminationIterator
{
  return self->_terminationIterator;
}

- (void)setTerminationIterator:(unsigned int)a3
{
  self->_terminationIterator = a3;
}

- (int)bootToken
{
  return self->_bootToken;
}

- (void)setBootToken:(int)a3
{
  self->_bootToken = a3;
}

- (int)displayNotifyToken
{
  return self->_displayNotifyToken;
}

- (void)setDisplayNotifyToken:(int)a3
{
  self->_displayNotifyToken = a3;
}

- (BOOL)bootComplete
{
  return self->_bootComplete;
}

- (void)setBootComplete:(BOOL)a3
{
  self->_bootComplete = a3;
}

- (BOOL)displayEnabled
{
  return self->_displayEnabled;
}

- (void)setDisplayEnabled:(BOOL)a3
{
  self->_displayEnabled = a3;
}

- (BOOL)pmUserActive
{
  return self->_pmUserActive;
}

- (void)setPmUserActive:(BOOL)a3
{
  self->_pmUserActive = a3;
}

- (BOOL)userActive
{
  return self->_userActive;
}

- (void)setUserActive:(BOOL)a3
{
  self->_userActive = a3;
}

- (BOOL)userPresent
{
  return self->_userPresent;
}

- (void)setUserPresent:(BOOL)a3
{
  self->_userPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_endpointMap, 0);
}

- (void)addEndpointForService:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s NULL service", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)addEndpointForService:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s service has unexpected type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)addEndpointForService:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s unable to initialize endpoint", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)addEndpointForService:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s service already added", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)addEndpointForService:(mach_error_t)a1 .cold.5(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v1, "%s unable to read registry entry id (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
