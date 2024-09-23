@implementation CMIOExtensionProxy

+ (id)proxyWithEndpoint:(id)a3 extensionPID:(int)a4 delegate:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEndpoint:extensionPID:delegate:", a3, *(_QWORD *)&a4, a5);
}

- (CMIOExtensionProxy)initWithEndpoint:(id)a3 extensionPID:(int)a4 delegate:(id)a5
{
  unsigned int *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  unsigned int v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  NSObject *global_queue;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  _xpc_connection_s *v19;
  _QWORD v21[4];
  id v22;
  _QWORD handler[5];
  id v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)CMIOExtensionProxy;
    v8 = -[CMIOExtensionProxy init](&v25, sel_init);
    if (v8)
    {
      v9 = CMIOLog();
      v10 = v9;
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        v12 = v8[12];
        *(_DWORD *)buf = 136315907;
        v27 = v11;
        v28 = 1024;
        v29 = 769;
        v30 = 2080;
        v31 = "-[CMIOExtensionProxy initWithEndpoint:extensionPID:delegate:]";
        v32 = 1025;
        v33 = v12;
        _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s creating proxy for pid [%{private}d]", buf, 0x22u);
      }
      objc_initWeak((id *)buf, v8);
      v8[2] = 0;
      *((_QWORD *)v8 + 3) = a3;
      v13 = xpc_connection_create(0, 0);
      *((_QWORD *)v8 + 2) = v13;
      *((_QWORD *)v8 + 4) = xpc_endpoint_create(v13);
      *((_QWORD *)v8 + 5) = a5;
      v8[12] = a4;
      v8[13] = 0;
      *((_QWORD *)v8 + 7) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      global_queue = dispatch_get_global_queue(21, 0);
      v16 = dispatch_queue_create_with_target_V2("com.apple.cmio.CMIOExtensionProxyQueue", v14, global_queue);
      *((_QWORD *)v8 + 8) = v16;
      v17 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, v16);
      *((_QWORD *)v8 + 9) = v17;
      v18 = MEMORY[0x24BDAC760];
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __61__CMIOExtensionProxy_initWithEndpoint_extensionPID_delegate___block_invoke;
      handler[3] = &unk_250458168;
      objc_copyWeak(&v24, (id *)buf);
      handler[4] = v8;
      dispatch_source_set_event_handler(v17, handler);
      dispatch_source_set_timer(*((dispatch_source_t *)v8 + 9), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(*((dispatch_object_t *)v8 + 9));
      *((_BYTE *)v8 + 80) = 0;
      objc_msgSend(*((id *)v8 + 5), "updateStreamingState:forProxyFrontedPID:", 0, v8[12]);
      v19 = (_xpc_connection_s *)*((_QWORD *)v8 + 2);
      v21[0] = v18;
      v21[1] = 3221225472;
      v21[2] = __61__CMIOExtensionProxy_initWithEndpoint_extensionPID_delegate___block_invoke_114;
      v21[3] = &unk_250458000;
      objc_copyWeak(&v22, (id *)buf);
      xpc_connection_set_event_handler(v19, v21);
      xpc_connection_activate(*((xpc_connection_t *)v8 + 2));
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid argument"));
    return 0;
  }
  return (CMIOExtensionProxy *)v8;
}

void __61__CMIOExtensionProxy_initWithEndpoint_extensionPID_delegate___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = *((unsigned __int8 *)WeakRetained + 80);
    v5 = CMIOLog();
    v6 = v5;
    if (v4)
    {
      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315650;
          v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
          v9 = 1024;
          v10 = 786;
          v11 = 2080;
          v12 = "-[CMIOExtensionProxy initWithEndpoint:extensionPID:delegate:]_block_invoke";
          _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s update stream state timer fired while active, updating streaming state to NO", (uint8_t *)&v7, 0x1Cu);
        }
      }
      *((_BYTE *)v3 + 80) = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateStreamingState:forProxyFrontedPID:", 0, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 48));
      dispatch_source_set_timer(v3[9], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      v9 = 1024;
      v10 = 792;
      v11 = 2080;
      v12 = "-[CMIOExtensionProxy initWithEndpoint:extensionPID:delegate:]_block_invoke";
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s update stream state timer fired while not active, not updating streaming state", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __61__CMIOExtensionProxy_initWithEndpoint_extensionPID_delegate___block_invoke_114(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  BOOL v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v5 = WeakRetained;
    v4 = MEMORY[0x23492FDC4](a2) == MEMORY[0x24BDACF88];
    WeakRetained = v5;
    if (v4)
    {
      objc_msgSend(v5, "addConnection:", a2);
      WeakRetained = v5;
    }
  }

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  int extensionPID;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  CMIOExtensionProxy *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_0 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_0, &__block_literal_global_183);
  if (CMIOModuleLogLevel_cmioLevel_0 >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        v12 = 1024;
        v13 = 816;
        v14 = 2080;
        v15 = "-[CMIOExtensionProxy dealloc]";
        v16 = 2113;
        v17 = self;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      extensionPID = self->_extensionPID;
      *(_DWORD *)buf = 136315907;
      v11 = v7;
      v12 = 1024;
      v13 = 818;
      v14 = 2080;
      v15 = "-[CMIOExtensionProxy dealloc]";
      v16 = 1025;
      LODWORD(v17) = extensionPID;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] cancelling update stream state timer", buf, 0x22u);
    }
  }
  dispatch_source_cancel((dispatch_source_t)self->_updateStreamStateTimer);

  v9.receiver = self;
  v9.super_class = (Class)CMIOExtensionProxy;
  -[CMIOExtensionProxy dealloc](&v9, sel_dealloc);
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (OS_xpc_object)proxyEndpoint
{
  return self->_proxyEndpoint;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_invalidated = 1;
    v4 = (void *)-[NSMutableArray copy](self->_contexts, "copy");
    -[NSMutableArray removeAllObjects](self->_contexts, "removeAllObjects");
    os_unfair_lock_unlock(p_lock);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    xpc_connection_cancel(self->_listener);
  }
}

- (void)addConnection:(id)a3
{
  xpc_connection_t v5;
  CMIOExtensionProxyContext *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  pid_t pid;
  __int16 v18;
  CMIOExtensionProxyContext *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = xpc_connection_create_from_endpoint(self->_endpoint);
  v6 = -[CMIOExtensionProxyContext initWithConnection:serverConnection:queue:delegate:]([CMIOExtensionProxyContext alloc], "initWithConnection:serverConnection:queue:delegate:", a3, v5, 0, self);
  xpc_release(v5);
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableArray addObject:](self->_contexts, "addObject:", v6);
    os_unfair_lock_unlock(&self->_lock);
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = 136316163;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        v12 = 1024;
        v13 = 882;
        v14 = 2080;
        v15 = "-[CMIOExtensionProxy addConnection:]";
        v16 = 1025;
        pid = xpc_connection_get_pid((xpc_connection_t)a3);
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_INFO, "%s:%d:%s New proxy [%{private}d] %@", (uint8_t *)&v10, 0x2Cu);
      }
    }

  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProxy addConnection:].cold.1();
  }
}

- (void)proxyStreamHasStarted
{
  NSObject *updateStreamStateQueue;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  int extensionPID;
  int activeStreams;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  updateStreamStateQueue = self->_updateStreamStateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CMIOExtensionProxy_proxyStreamHasStarted__block_invoke;
  block[3] = &unk_2504576D0;
  block[4] = self;
  dispatch_sync(updateStreamStateQueue, block);
  v4 = CMIOLog();
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      extensionPID = self->_extensionPID;
      activeStreams = self->_activeStreams;
      *(_DWORD *)buf = 136316163;
      v11 = v6;
      v12 = 1024;
      v13 = 897;
      v14 = 2080;
      v15 = "-[CMIOExtensionProxy proxyStreamHasStarted]";
      v16 = 1025;
      v17 = extensionPID;
      v18 = 1024;
      v19 = activeStreams;
      _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] activeStreams %d", buf, 0x28u);
    }
  }
}

uint64_t __43__CMIOExtensionProxy_proxyStreamHasStarted__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 52);
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 80))
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
        v8 = 136315907;
        v9 = v5;
        v10 = 1024;
        v11 = 891;
        v12 = 2080;
        v13 = "-[CMIOExtensionProxy proxyStreamHasStarted]_block_invoke";
        v14 = 1025;
        v15 = v6;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] canceling update stream state timer", (uint8_t *)&v8, 0x22u);
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 72), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v1 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v1 + 40), "updateStreamingState:forProxyFrontedPID:", 1, *(unsigned int *)(v1 + 48));
}

- (void)proxyStreamsHaveStopped:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  int extensionPID;
  int activeStreams;
  NSObject *updateStreamStateQueue;
  _QWORD v11[5];
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        extensionPID = self->_extensionPID;
        activeStreams = self->_activeStreams;
        *(_DWORD *)buf = 136316419;
        v14 = v7;
        v15 = 1024;
        v16 = 906;
        v17 = 2080;
        v18 = "-[CMIOExtensionProxy proxyStreamsHaveStopped:]";
        v19 = 1025;
        v20 = extensionPID;
        v21 = 1024;
        v22 = activeStreams;
        v23 = 1024;
        v24 = a3;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] activeStreams %d will loose %d", buf, 0x2Eu);
      }
    }
    updateStreamStateQueue = self->_updateStreamStateQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__CMIOExtensionProxy_proxyStreamsHaveStopped___block_invoke;
    v11[3] = &unk_250458190;
    v11[4] = self;
    v12 = a3;
    dispatch_sync(updateStreamStateQueue, v11);
  }
}

void __46__CMIOExtensionProxy_proxyStreamsHaveStopped___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  NSObject *v12;
  dispatch_time_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 52);
  if (v2 >= 1)
  {
    v4 = *(_DWORD *)(a1 + 40);
    v5 = __OFSUB__(v2, v4);
    v6 = v2 - v4;
    if (v6 < 0 != v5)
      v6 = 0;
    *(_DWORD *)(v1 + 52) = v6;
    v7 = *(_QWORD *)(a1 + 32);
    if (!*(_DWORD *)(v7 + 52) && !*(_BYTE *)(v7 + 80))
    {
      *(_BYTE *)(v7 + 80) = 1;
      v8 = CMIOLog();
      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
          v11 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
          v14 = 136315907;
          v15 = v10;
          v16 = 1024;
          v17 = 917;
          v18 = 2080;
          v19 = "-[CMIOExtensionProxy proxyStreamsHaveStopped:]_block_invoke";
          v20 = 1025;
          v21 = v11;
          _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] activating update stream state timer", (uint8_t *)&v14, 0x22u);
        }
      }
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
      v13 = dispatch_time(0, 2000000000);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
}

- (void)proxyContextHasBeenInvalidated:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeObject:](self->_contexts, "removeObject:", a3);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)addConnection:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Failed to instantiate CMIOExtensionProxyContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
