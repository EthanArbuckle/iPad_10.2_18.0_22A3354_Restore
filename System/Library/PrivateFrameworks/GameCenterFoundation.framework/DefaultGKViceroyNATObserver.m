@implementation DefaultGKViceroyNATObserver

- (DefaultGKViceroyNATObserver)init
{
  DefaultGKViceroyNATObserver *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *natSemaphore;
  GKNATObserver *v5;
  GKNATObserver *natObserver;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DefaultGKViceroyNATObserver;
  v2 = -[DefaultGKViceroyNATObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    natSemaphore = v2->_natSemaphore;
    v2->_natSemaphore = (OS_dispatch_semaphore *)v3;

    v2->_natType = 0;
    v5 = (GKNATObserver *)objc_alloc_init(MEMORY[0x1E0D25C70]);
    natObserver = v2->_natObserver;
    v2->_natObserver = v5;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "[GKViceroyNATObserver] Deallocating.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (id)syncQueue
{
  if (syncQueue_onceToken != -1)
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_42);
  return (id)syncQueue_sSyncQueue;
}

void __40__DefaultGKViceroyNATObserver_syncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.GameKit.GKViceroyNATObserver.sync", 0);
  v1 = (void *)syncQueue_sSyncQueue;
  syncQueue_sSyncQueue = (uint64_t)v0;

}

- (void)performAsync:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "syncQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v3);

}

- (void)getNATTypeWithNATSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__DefaultGKViceroyNATObserver_getNATTypeWithNATSettings_completionHandler___block_invoke;
  v10[3] = &unk_1E75B30F8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[DefaultGKViceroyNATObserver performAsync:](self, "performAsync:", v10);

}

uint64_t __75__DefaultGKViceroyNATObserver_getNATTypeWithNATSettings_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getNATTypeWithNATSettings:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)isValidSettings:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[GKViceroyNATConfiguration settingsKeys](GKViceroyNATConfiguration, "settingsKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          if (!os_log_GKGeneral)
            v12 = GKOSLoggers();
          v13 = os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
            -[DefaultGKViceroyNATObserver isValidSettings:].cold.1(v9, v13);
          v11 = 0;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_15:

  return v11;
}

- (void)_getNATTypeWithNATSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  NSObject *natSemaphore;
  dispatch_time_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[DefaultGKViceroyNATObserver natType](self, "natType"))
  {
LABEL_2:
    v7[2](v7, -[DefaultGKViceroyNATObserver natType](self, "natType"));
    goto LABEL_20;
  }
  if (v6 && -[DefaultGKViceroyNATObserver isValidSettings:](self, "isValidSettings:", v6))
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[DefaultGKViceroyNATObserver _getNATTypeWithNATSettings:completionHandler:].cold.3();
    +[GKViceroyNATConfiguration applySettings:](GKViceroyNATConfiguration, "applySettings:", v6);
    -[DefaultGKViceroyNATObserver natObserver](self, "natObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    natSemaphore = self->_natSemaphore;
    v11 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(natSemaphore, v11))
    {
      if (!os_log_GKGeneral)
        v14 = GKOSLoggers();
      v15 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)MEMORY[0x1E0CB37E8];
        v17 = v15;
        objc_msgSend(v16, "numberWithUnsignedInt:", -[DefaultGKViceroyNATObserver natType](self, "natType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v18;
        _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "[GKViceroyNATObserver] Done waiting for valid NAT type: %@", (uint8_t *)&v19, 0xCu);

      }
      goto LABEL_2;
    }
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[DefaultGKViceroyNATObserver _getNATTypeWithNATSettings:completionHandler:].cold.2();
    v7[2](v7, 0);
    -[DefaultGKViceroyNATObserver teardown](self, "teardown");
  }
  else
  {
    if (!os_log_GKGeneral)
      v13 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[DefaultGKViceroyNATObserver _getNATTypeWithNATSettings:completionHandler:].cold.1();
    v7[2](v7, 0);
  }
LABEL_20:

}

- (void)teardown
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "[GKViceroyNATObserver] Tearing down.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)NATTypeDidChange:(int)a3
{
  uint64_t v3;
  id v5;
  NSObject *v6;
  NSObject *v7;
  intptr_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _DWORD v13[2];
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109120;
    v13[1] = v3;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "[GKViceroyNATObserver] Received NAT type %d", (uint8_t *)v13, 8u);
  }
  -[DefaultGKViceroyNATObserver natSemaphore](self, "natSemaphore");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_semaphore_wait(v7, 0);

  if (v8)
  {
    if ((_DWORD)v3)
    {
      -[DefaultGKViceroyNATObserver setNatType:](self, "setNatType:", v3);
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInteger:forKey:", v3, CFSTR("natType"));

      -[DefaultGKViceroyNATObserver natSemaphore](self, "natSemaphore");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v10);

    }
    else
    {
      if (!os_log_GKGeneral)
        v12 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
        -[DefaultGKViceroyNATObserver NATTypeDidChange:].cold.2();
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[DefaultGKViceroyNATObserver NATTypeDidChange:].cold.1();
    -[DefaultGKViceroyNATObserver teardown](self, "teardown");
  }
}

- (GKNATObserver)natObserver
{
  return self->_natObserver;
}

- (void)setNatObserver:(id)a3
{
  objc_storeStrong((id *)&self->_natObserver, a3);
}

- (OS_dispatch_semaphore)natSemaphore
{
  return self->_natSemaphore;
}

- (void)setNatSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_natSemaphore, a3);
}

- (int)natType
{
  return self->_natType;
}

- (void)setNatType:(int)a3
{
  self->_natType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_natSemaphore, 0);
  objc_storeStrong((id *)&self->_natObserver, 0);
}

- (void)isValidSettings:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_ERROR, "[GKViceroyNATObserver] Missing required setting: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_getNATTypeWithNATSettings:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "[GKViceroyNATObserver] Invalid settings provided.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_getNATTypeWithNATSettings:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "[GKViceroyNATObserver] Timed out waiting for a valid NAT type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_getNATTypeWithNATSettings:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "[GKViceroyNATObserver] Applying settings and awaiting a valid NAT type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)NATTypeDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "[GKViceroyNATObserver] Semaphore already signaled. Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)NATTypeDidChange:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "[GKViceroyNATObserver] Received an invalid NAT type. Continuing to wait for a valid NAT type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
