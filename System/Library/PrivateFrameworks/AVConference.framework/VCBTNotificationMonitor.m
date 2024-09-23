@implementation VCBTNotificationMonitor

- (VCBTNotificationMonitor)init
{
  VCBTNotificationMonitor *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCBTNotificationMonitor;
  v2 = -[VCBTNotificationMonitor init](&v4, sel_init);
  if (v2)
  {
    v2->_handlerArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VCBTNotificationMonitor registerForBluetoothImmediateNotifications](v2, "registerForBluetoothImmediateNotifications");
    -[VCBTNotificationMonitor setupBTEventHandler](v2, "setupBTEventHandler");
    v2->_btNotificationHandlerLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_49);
  return (id)sharedInstance_sharedInstance;
}

VCBTNotificationMonitor *__41__VCBTNotificationMonitor_sharedInstance__block_invoke()
{
  VCBTNotificationMonitor *result;

  result = objc_alloc_init(VCBTNotificationMonitor);
  sharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  -[VCBTNotificationMonitor unregisterBluetoothImmediateNotifications](self, "unregisterBluetoothImmediateNotifications");
  v3.receiver = self;
  v3.super_class = (Class)VCBTNotificationMonitor;
  -[VCBTNotificationMonitor dealloc](&v3, sel_dealloc);
}

- (int)registerBTNotificationHandler:(id)a3
{
  os_unfair_lock_s *p_btNotificationHandlerLock;
  int v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_btNotificationHandlerLock = &self->_btNotificationHandlerLock;
  os_unfair_lock_lock(&self->_btNotificationHandlerLock);
  v6 = -[NSMutableArray count](self->_handlerArray, "count");
  -[NSMutableArray addObject:](self->_handlerArray, "addObject:", _Block_copy(a3));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316162;
      v11 = v7;
      v12 = 2080;
      v13 = "-[VCBTNotificationMonitor registerBTNotificationHandler:]";
      v14 = 1024;
      v15 = 65;
      v16 = 2048;
      v17 = a3;
      v18 = 1024;
      v19 = v6;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registered handler[%p] with index=%d", (uint8_t *)&v10, 0x2Cu);
    }
  }
  os_unfair_lock_unlock(p_btNotificationHandlerLock);
  return v6;
}

- (void)unregisterBTNotificationHandler:(int)a3
{
  os_unfair_lock_s *p_btNotificationHandlerLock;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_btNotificationHandlerLock = &self->_btNotificationHandlerLock;
  os_unfair_lock_lock(&self->_btNotificationHandlerLock);
  if (a3 < 0 || (int)-[NSMutableArray count](self->_handlerArray, "count") <= a3)
  {
    os_unfair_lock_unlock(p_btNotificationHandlerLock);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCBTNotificationMonitor unregisterBTNotificationHandler:]";
        v12 = 1024;
        v13 = 76;
        v14 = 1024;
        v15 = a3;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unregistered handler with index=%d", (uint8_t *)&v8, 0x22u);
      }
    }
    _Block_release((const void *)-[NSMutableArray objectAtIndexedSubscript:](self->_handlerArray, "objectAtIndexedSubscript:", a3));
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_handlerArray, "replaceObjectAtIndex:withObject:", a3, objc_msgSend(MEMORY[0x1E0C99E38], "null"));
    os_unfair_lock_unlock(p_btNotificationHandlerLock);
  }
}

- (void)unregisterAllBTNotificationHandlers
{
  os_unfair_lock_s *p_btNotificationHandlerLock;
  NSMutableArray *handlerArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_btNotificationHandlerLock = &self->_btNotificationHandlerLock;
  os_unfair_lock_lock(&self->_btNotificationHandlerLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  handlerArray = self->_handlerArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](handlerArray, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(handlerArray);
        _Block_release(*(const void **)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](handlerArray, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
  -[NSMutableArray removeAllObjects](self->_handlerArray, "removeAllObjects");
  os_unfair_lock_unlock(p_btNotificationHandlerLock);
}

- (void)setupBTEventHandler
{
  uint64_t v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__VCBTNotificationMonitor_setupBTEventHandler__block_invoke;
  v3[3] = &unk_1E9E561E0;
  v3[4] = v2;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E0C80D38], v3);
}

void __46__VCBTNotificationMonitor_setupBTEventHandler__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  uint64_t uint64;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  char v18;
  int v19;
  _QWORD v20[2];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  string = xpc_dictionary_get_string(xdict, "XPCEventName");
  v20[0] = string;
  uint64 = xpc_dictionary_get_uint64(xdict, "_State");
  v20[1] = uint64;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v22 = v6;
      v23 = 2080;
      v24 = "-[VCBTNotificationMonitor setupBTEventHandler]_block_invoke";
      v25 = 1024;
      v26 = 102;
      v27 = 2080;
      v28 = (void *)string;
      v29 = 2048;
      v30 = uint64;
      v31 = 1024;
      v32 = HIWORD(uint64) & 1;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received notifyd.matching event %s state %llu isPairing %d", buf, 0x36u);
    }
  }
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.bluetooth.pairing")))
    v9 = (uint64 & 0x1000000000000) == 0;
  else
    v9 = 1;
  if (!v9
    || ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.bluetooth.outgoing-classic-connection-state")) & 1) != 0
     || objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.bluetooth.settings.app-state")))
    && uint64 < 2
    || objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.bluetooth.outgoing-le-fast-scan-level")))
  {
    v19 = 0;
    v18 = 0;
    v10 = +[VCWiFiUtils getInfraChannelNumber:is5Ghz:](VCWiFiUtils, "getInfraChannelNumber:is5Ghz:", &v19, &v18);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v10)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          if (v18)
            v14 = CFSTR("5GHz WLAN");
          else
            v14 = CFSTR("2.4GHz WLAN");
          v22 = v12;
          v23 = 2080;
          v24 = "-[VCBTNotificationMonitor setupBTEventHandler]_block_invoke";
          v25 = 1024;
          v26 = 113;
          v27 = 2112;
          v28 = (void *)v14;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d BT event received while device is on band=%@", buf, 0x26u);
        }
      }
      if (!v18)
      {
        v15 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
        objc_msgSend(v15, "processBTNotification:", v20);
        if (v15)
          CFRelease(v15);
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __46__VCBTNotificationMonitor_setupBTEventHandler__block_invoke_cold_1(v16, v17);
    }
  }
}

- (void)processBTNotification:(id *)a3
{
  os_unfair_lock_s *p_btNotificationHandlerLock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_btNotificationHandlerLock = &self->_btNotificationHandlerLock;
  os_unfair_lock_lock(&self->_btNotificationHandlerLock);
  v6 = (void *)-[NSMutableArray copy](self->_handlerArray, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            (*(void (**)(uint64_t, $BE749665CD263385F3F5ED554982D87D *))(v11 + 16))(v11, a3);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_btNotificationHandlerLock);
}

- (void)registerDarwinNotification:(id)a3
{
  const char *v4;
  xpc_object_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", 4);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "Notification", v4);
  xpc_set_event();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCBTNotificationMonitor registerDarwinNotification:]";
      v12 = 1024;
      v13 = 140;
      v14 = 2112;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Register for Darwin %@", (uint8_t *)&v8, 0x26u);
    }
  }
  xpc_release(v5);
}

- (void)unregisterDarwinNotification:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "cStringUsingEncoding:", 4);
  xpc_set_event();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCBTNotificationMonitor unregisterDarwinNotification:]";
      v10 = 1024;
      v11 = 147;
      v12 = 2112;
      v13 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unregister for Darwin %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)registerForBluetoothImmediateNotifications
{
  -[VCBTNotificationMonitor registerDarwinNotification:](self, "registerDarwinNotification:", CFSTR("com.apple.bluetooth.pairing"));
  -[VCBTNotificationMonitor registerDarwinNotification:](self, "registerDarwinNotification:", CFSTR("com.apple.bluetooth.outgoing-classic-connection-state"));
  -[VCBTNotificationMonitor registerDarwinNotification:](self, "registerDarwinNotification:", CFSTR("com.apple.bluetooth.settings.app-state"));
  -[VCBTNotificationMonitor registerDarwinNotification:](self, "registerDarwinNotification:", CFSTR("com.apple.bluetooth.outgoing-le-fast-scan-level"));
}

- (void)unregisterBluetoothImmediateNotifications
{
  -[VCBTNotificationMonitor unregisterDarwinNotification:](self, "unregisterDarwinNotification:", CFSTR("com.apple.bluetooth.pairing"));
  -[VCBTNotificationMonitor unregisterDarwinNotification:](self, "unregisterDarwinNotification:", CFSTR("com.apple.bluetooth.outgoing-classic-connection-state"));
  -[VCBTNotificationMonitor unregisterDarwinNotification:](self, "unregisterDarwinNotification:", CFSTR("com.apple.bluetooth.settings.app-state"));
  -[VCBTNotificationMonitor unregisterDarwinNotification:](self, "unregisterDarwinNotification:", CFSTR("com.apple.bluetooth.outgoing-le-fast-scan-level"));
}

void __46__VCBTNotificationMonitor_setupBTEventHandler__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCBTNotificationMonitor setupBTEventHandler]_block_invoke";
  v6 = 1024;
  v7 = 110;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCWiFiUtils getInfraChannelNumber() failed!", (uint8_t *)&v2, 0x1Cu);
}

@end
