@implementation GKInterfaceListener

- (GKInterfaceListener)init
{
  GKInterfaceListener *v2;
  GKInterfaceListener *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)GKInterfaceListener;
  v2 = -[GKInterfaceListener init](&v5, sel_init);
  v3 = v2;
  if (v2)
    pthread_mutex_init(&v2->_notificationMutex, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[GKInterfaceListener stopChangeListener](self, "stopChangeListener");
  pthread_mutex_destroy(&self->_notificationMutex);
  objc_storeWeak(&self->_interfaceListenerDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)GKInterfaceListener;
  -[GKInterfaceListener dealloc](&v3, sel_dealloc);
}

- (void)hasConnectionWithWifi:(BOOL *)a3 cell:(BOOL *)a4
{
  int LocalInterfaceListWithOptions;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject **v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
    if (LocalInterfaceListWithOptions >= 1)
    {
      v7 = 0;
      v8 = LocalInterfaceListWithOptions;
      v9 = 4;
      v10 = (NSObject **)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *v10;
          v13 = *v10;
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v17 = v11;
              v18 = 2080;
              v19 = "-[GKInterfaceListener hasConnectionWithWifi:cell:]";
              v20 = 1024;
              v21 = 160;
              v22 = 1024;
              v23 = v7;
              v24 = 2080;
              v25 = v9;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKInterfaceListener network %d %s", buf, 0x2Cu);
            }
          }
          else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316162;
            v17 = v11;
            v18 = 2080;
            v19 = "-[GKInterfaceListener hasConnectionWithWifi:cell:]";
            v20 = 1024;
            v21 = 160;
            v22 = 1024;
            v23 = v7;
            v24 = 2080;
            v25 = v9;
            _os_log_debug_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKInterfaceListener network %d %s", buf, 0x2Cu);
          }
        }
        if (strncasecmp((const char *)v9, "lo", 2uLL))
        {
          if ((*(_BYTE *)(v9 - 4) & 4) != 0)
          {
            if (a4)
            {
              *a4 = 1;
              if (!a3 || *a3)
                goto LABEL_27;
            }
          }
          else if (a3)
          {
            *a3 = 1;
            if (!a4 || *a4)
              goto LABEL_27;
          }
        }
        ++v7;
        v9 += 40;
      }
      while (v8 != v7);
    }
    if ((!a3 || !*a3) && (!a4 || !*a4) && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = v14;
        v18 = 2080;
        v19 = "-[GKInterfaceListener hasConnectionWithWifi:cell:]";
        v20 = 1024;
        v21 = 180;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKInterfaceListener no active interface found.", buf, 0x1Cu);
      }
    }
LABEL_27:
    FreeLocalInterfaceList();
  }
}

- (BOOL)startChangeListener
{
  _opaque_pthread_mutex_t *p_notificationMutex;
  BOOL v4;
  __CFString *v6;
  __SCDynamicStore *dynamicStore;
  __SCDynamicStore *v8;
  NSObject *global_queue;
  SCDynamicStoreContext context;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_notificationMutex = &self->_notificationMutex;
  pthread_mutex_lock(&self->_notificationMutex);
  if (self->_dynamicStore)
    goto LABEL_2;
  v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("GKInterfaceListener%d"), getpid());
  context.version = 0;
  context.info = self;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
  context.copyDescription = 0;
  self->_dynamicStore = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, (SCDynamicStoreCallBack)DynamicStoreCallbackForWifiChanges, &context);

  dynamicStore = self->_dynamicStore;
  if (!dynamicStore)
  {
    v4 = 0;
    goto LABEL_3;
  }
  if (SCDynamicStoreSetNotificationKeys(dynamicStore, 0, (CFArrayRef)&unk_1E9EF9AD0))
  {
    v8 = self->_dynamicStore;
    global_queue = dispatch_get_global_queue(0, 0);
    SCDynamicStoreSetDispatchQueue(v8, global_queue);
LABEL_2:
    v4 = 1;
    goto LABEL_3;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[GKInterfaceListener startChangeListener].cold.1();
  }
  CFRelease(self->_dynamicStore);
  v4 = 0;
  self->_dynamicStore = 0;
LABEL_3:
  -[GKInterfaceListener hasConnectionWithWifi:cell:](self, "hasConnectionWithWifi:cell:", &self->_isWifiUp, &self->_isCellUp);
  pthread_mutex_unlock(p_notificationMutex);
  return v4;
}

- (BOOL)stopChangeListener
{
  _opaque_pthread_mutex_t *p_notificationMutex;
  __SCDynamicStore *dynamicStore;

  p_notificationMutex = &self->_notificationMutex;
  pthread_mutex_lock(&self->_notificationMutex);
  dynamicStore = self->_dynamicStore;
  if (dynamicStore)
  {
    SCDynamicStoreSetDispatchQueue(dynamicStore, 0);
    CFRelease(self->_dynamicStore);
    self->_dynamicStore = 0;
  }
  pthread_mutex_unlock(p_notificationMutex);
  return 1;
}

- (BOOL)startRoutingChangeListener
{
  _opaque_pthread_mutex_t *p_notificationMutex;
  const char *notify_key;
  NSObject *global_queue;
  uint32_t v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  p_notificationMutex = &self->_notificationMutex;
  pthread_mutex_lock(&self->_notificationMutex);
  if (self->_monitoringAvailable)
  {
    pthread_mutex_unlock(p_notificationMutex);
    return 1;
  }
  else
  {
    notify_key = (const char *)nwi_state_get_notify_key();
    global_queue = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__GKInterfaceListener_startRoutingChangeListener__block_invoke;
    v8[3] = &unk_1E9E53170;
    v8[4] = self;
    v7 = notify_register_dispatch(notify_key, &self->_notifyToken, global_queue, v8);
    if (v7 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[GKInterfaceListener startRoutingChangeListener].cold.1();
    }
    self->_monitoringAvailable = v7 == 0;
    pthread_mutex_unlock(p_notificationMutex);
    return self->_monitoringAvailable;
  }
}

uint64_t __49__GKInterfaceListener_startRoutingChangeListener__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKInterfaceListener startRoutingChangeListener]_block_invoke";
      v9 = 1024;
      v10 = 248;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKInterfaceListener: network information changed.", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interfaceListenerDelegate"), "networkStateDidChange");
}

- (void)stopRoutingChangeListener
{
  _opaque_pthread_mutex_t *p_notificationMutex;

  p_notificationMutex = &self->_notificationMutex;
  pthread_mutex_lock(&self->_notificationMutex);
  if (self->_monitoringAvailable)
  {
    notify_cancel(self->_notifyToken);
    self->_monitoringAvailable = 0;
  }
  pthread_mutex_unlock(p_notificationMutex);
}

- (void)setInterfaceListenerDelegate:(id)a3
{
  objc_storeWeak(&self->_interfaceListenerDelegate, a3);
}

- (InterfaceListenerDelegate)interfaceListenerDelegate
{
  return (InterfaceListenerDelegate *)objc_loadWeak(&self->_interfaceListenerDelegate);
}

- (BOOL)_isWifiUp
{
  return self->_isWifiUp;
}

- (void)set_isWifiUp:(BOOL)a3
{
  self->_isWifiUp = a3;
}

- (BOOL)_isCellUp
{
  return self->_isCellUp;
}

- (void)set_isCellUp:(BOOL)a3
{
  self->_isCellUp = a3;
}

- (void)startChangeListener
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d GKInterfaceListener SCDynamicStoreSetNotificationKeys failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startRoutingChangeListener
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d GKInterfaceListener: not setting up correctly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
