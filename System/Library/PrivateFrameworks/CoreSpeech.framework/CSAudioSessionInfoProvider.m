@implementation CSAudioSessionInfoProvider

- (CSAudioSessionInfoProvider)init
{
  CSAudioSessionInfoProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *sessionInfoQueue;
  uint64_t v5;
  NSHashTable *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSAudioSessionInfoProvider;
  v2 = -[CSAudioSessionInfoProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAudioSessionInfoProvider", 0);
    sessionInfoQueue = v2->_sessionInfoQueue;
    v2->_sessionInfoQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CSAudioSessionInfoProvider _deregisterAudioSessionNotifications](self, "_deregisterAudioSessionNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CSAudioSessionInfoProvider;
  -[CSAudioSessionInfoProvider dealloc](&v3, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *sessionInfoQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    sessionInfoQueue = self->_sessionInfoQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__CSAudioSessionInfoProvider_registerObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(sessionInfoQueue, v7);

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *sessionInfoQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    sessionInfoQueue = self->_sessionInfoQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__CSAudioSessionInfoProvider_unregisterObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(sessionInfoQueue, v7);

  }
}

- (unsigned)audioSessionIdForDeviceId:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  void *v11;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D19260], "supportRemoraVoiceTrigger");
  if (v3 && v4)
  {
    objc_msgSend(MEMORY[0x1E0D19008], "contextForRemoraVoiceTriggerWithDeviceId:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avvcContextSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C89BF0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "sessionForContext:error:", v6, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (v8)
    {
      v10 = objc_msgSend(v8, "opaqueSessionID");
    }
    else
    {
      v11 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v13 = v11;
        objc_msgSend(v9, "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSAudioSessionInfoProvider audioSessionIdForDeviceId:]";
        v18 = 2114;
        v19 = v14;
        _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Session Query Failed : %{public}@", buf, 0x16u);

      }
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "opaqueSessionID");
  }

  return v10;
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  NSObject *sessionInfoQueue;
  _QWORD block[5];

  sessionInfoQueue = self->_sessionInfoQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CSAudioSessionInfoProvider_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(sessionInfoQueue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  NSObject *sessionInfoQueue;
  _QWORD block[5];

  sessionInfoQueue = self->_sessionInfoQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSAudioSessionInfoProvider_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(sessionInfoQueue, block);
}

- (void)_startMonitoring
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  -[CSAudioSessionInfoProvider _registerAudioSessionNotifications](self, "_registerAudioSessionNotifications");
}

- (void)_stopMonitoring
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CSAudioSessionInfoProvider _deregisterAudioSessionNotifications](self, "_deregisterAudioSessionNotifications");
}

- (void)_registerInterruptionNotification
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C896F0];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C896F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleInterruption_, v4, v6);

  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[CSAudioSessionInfoProvider _registerInterruptionNotification]";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AudioSessionInterruption", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_registerAudioRouteChangeNotification
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C89870];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89870], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__audioRouteChanged_, v4, v6);

  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[CSAudioSessionInfoProvider _registerAudioRouteChangeNotification]";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AudioSessionRouteChangeNotification", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_handleInterruption:(id)a3
{
  id v4;
  NSObject *sessionInfoQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionInfoQueue = self->_sessionInfoQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CSAudioSessionInfoProvider__handleInterruption___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionInfoQueue, v7);

}

- (void)_audioRouteChanged:(id)a3
{
  id v4;
  NSObject *sessionInfoQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSAudioSessionInfoProvider *v9;

  v4 = a3;
  sessionInfoQueue = self->_sessionInfoQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CSAudioSessionInfoProvider__audioRouteChanged___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(sessionInfoQueue, v7);

}

- (void)_registerAudioSessionNotifications
{
  -[CSAudioSessionInfoProvider _registerInterruptionNotification](self, "_registerInterruptionNotification");
  -[CSAudioSessionInfoProvider _registerAudioRouteChangeNotification](self, "_registerAudioRouteChangeNotification");
}

- (void)_deregisterAudioSessionNotifications
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSAudioSessionInfoProvider _deregisterAudioSessionNotifications]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring AudioSession activities", (uint8_t *)&v5, 0xCu);
  }
}

- (OS_dispatch_queue)sessionInfoQueue
{
  return self->_sessionInfoQueue;
}

- (void)setSessionInfoQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfoQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sessionInfoQueue, 0);
}

void __49__CSAudioSessionInfoProvider__audioRouteChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSAudioSessionInfoProvider _audioRouteChanged:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = CFSTR("RouteChangeNotificationInfo");
  v18 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "audioSessionInfoProvider:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:", *(_QWORD *)(a1 + 40), v5, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

void __50__CSAudioSessionInfoProvider__handleInterruption___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAudioSessionInfoProvider _handleInterruption:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "userInfo", (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "audioSessionInfoProvider:didReceiveAudioSessionInterruptionNotificationWithUserInfo:", v9, v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __79__CSAudioSessionInfoProvider_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioSessionInfoProvider CSAudioServerCrashMonitorDidReceiveServerRestart:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod recovered from crash", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_registerAudioSessionNotifications");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:", *(_QWORD *)(a1 + 32), 0, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __77__CSAudioSessionInfoProvider_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioSessionInfoProvider CSAudioServerCrashMonitorDidReceiveServerCrash:]_block_invoke";
    _os_log_error_impl(&dword_1C2614000, v2, OS_LOG_TYPE_ERROR, "%s audiomxd/bridgeaudiod crashed", buf, 0xCu);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:", *(_QWORD *)(a1 + 32), 0, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t __49__CSAudioSessionInfoProvider_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoring");
  return result;
}

uint64_t __47__CSAudioSessionInfoProvider_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_startMonitoring");
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_21888 != -1)
    dispatch_once(&sharedInstance_onceToken_21888, &__block_literal_global_21889);
  return (id)sharedInstance_sharedProvider_21890;
}

void __44__CSAudioSessionInfoProvider_sharedInstance__block_invoke()
{
  CSAudioSessionInfoProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioSessionInfoProvider);
  v1 = (void *)sharedInstance_sharedProvider_21890;
  sharedInstance_sharedProvider_21890 = (uint64_t)v0;

}

@end
