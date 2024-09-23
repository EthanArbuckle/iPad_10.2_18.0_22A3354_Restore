@implementation CSAudioSessionController

- (CSAudioSessionController)init
{
  return -[CSAudioSessionController initWithEndpointId:](self, "initWithEndpointId:", 0);
}

- (CSAudioSessionController)initWithEndpointId:(id)a3
{
  id v4;
  CSAudioSessionController *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSHashTable *observers;
  uint64_t v11;
  NSUUID *endpointId;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSAudioSessionController;
  v5 = -[CSAudioSessionController init](&v14, sel_init);
  if (v5)
  {
    dispatch_get_global_queue(33, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("CSAudioSessionController Queue", 0, v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v9;

    v11 = objc_msgSend(v4, "copy");
    endpointId = v5->_endpointId;
    v5->_endpointId = (NSUUID *)v11;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSAudioSessionController dealloc]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@ deallocated", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)CSAudioSessionController;
  -[CSAudioSessionController dealloc](&v6, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__CSAudioSessionController_registerObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__CSAudioSessionController_unregisterObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getAudioSessionIDWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__CSAudioSessionController_getAudioSessionIDWithCompletion___block_invoke;
    v7[3] = &unk_1E7C29150;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (unsigned)_getAudioSessionID
{
  NSUUID *endpointId;
  void *v4;
  void *v5;
  unsigned int v6;

  -[CSAudioSessionController _createXPCClientConnectionIfNeeded](self, "_createXPCClientConnectionIfNeeded");
  endpointId = self->_endpointId;
  if (endpointId)
  {
    -[NSUUID UUIDString](endpointId, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[CSAudioSessionController sessionInfoProvider](self, "sessionInfoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioSessionIdForDeviceId:", v4);

  return v6;
}

- (unsigned)getAudioSessionID
{
  NSObject *queue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CSAudioSessionController_getAudioSessionID__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __112__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __111__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionRouteChangeNotificationWithUserInfo___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __121__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __122__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (BOOL)_createXPCClientConnectionIfNeeded
{
  CSXPCClient *v3;
  CSXPCClient *xpcClient;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_xpcClient)
    goto LABEL_3;
  v3 = -[CSXPCClient initWithType:]([CSXPCClient alloc], "initWithType:", 2);
  xpcClient = self->_xpcClient;
  self->_xpcClient = v3;

  -[CSAudioSessionController setSessionInfoProvider:](self, "setSessionInfoProvider:", self->_xpcClient);
  -[CSAudioSessionController sessionInfoProvider](self, "sessionInfoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", self);

  -[CSXPCClient setDelegate:](self->_xpcClient, "setDelegate:", self);
  -[CSXPCClient connect](self->_xpcClient, "connect");
  if (self->_xpcClient)
  {
LABEL_3:
    LOBYTE(v6) = 1;
  }
  else
  {
    v7 = *MEMORY[0x1E0D18F38];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      v9 = 136315138;
      v10 = "-[CSAudioSessionController _createXPCClientConnectionIfNeeded]";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s audioProvider not exist", (uint8_t *)&v9, 0xCu);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)_startMonitoring
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSAudioSessionController _startMonitoring]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Start Monitoring : AudioSession notification from corespeechd", (uint8_t *)&v5, 0xCu);
  }
  -[CSAudioSessionController setShouldKeepConnection:](self, "setShouldKeepConnection:", 1);
  -[CSAudioSessionController _createXPCClientConnectionIfNeeded](self, "_createXPCClientConnectionIfNeeded");
  +[CSCoreSpeechDaemonStateMonitor sharedInstance](CSCoreSpeechDaemonStateMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)_stopMonitoring
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAudioSessionController _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Stop Monitoring : AudioSession notification from corespeechd", (uint8_t *)&v4, 0xCu);
  }
  -[CSAudioSessionController setShouldKeepConnection:](self, "setShouldKeepConnection:", 0);
}

- (void)_registerInterruptionNotification
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSAudioSessionController _registerInterruptionNotification]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Start Monitoring : AudioSession notification from corespeechd", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_registerAudioRouteChangeNotification
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSAudioSessionController _registerAudioRouteChangeNotification]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Start Monitoring : AudioSession notification from corespeechd", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_handleInterruption:(id)a3
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
  v7[2] = __48__CSAudioSessionController__handleInterruption___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_mediaServicesWereLost:(id)a3
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
  v7[2] = __51__CSAudioSessionController__mediaServicesWereLost___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_mediaServicesWereReset:(id)a3
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
  v7[2] = __52__CSAudioSessionController__mediaServicesWereReset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_audioRouteChanged:(id)a3
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
  v7[2] = __47__CSAudioSessionController__audioRouteChanged___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_teardownXPCClientIfNeeded
{
  CSXPCClient *xpcClient;
  NSObject *v4;
  void *v5;
  CSXPCClient *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    v4 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[CSAudioSessionController _teardownXPCClientIfNeeded]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
      xpcClient = self->_xpcClient;
    }
    -[CSXPCClient setDelegate:](xpcClient, "setDelegate:", 0);
    -[CSAudioSessionController sessionInfoProvider](self, "sessionInfoProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterObserver:", self);

    v6 = self->_xpcClient;
    self->_xpcClient = 0;

    -[CSAudioSessionController setSessionInfoProvider:](self, "setSessionInfoProvider:", self->_xpcClient);
  }
}

- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSAudioSessionController_CSXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)coreSpeechDaemonStateMonitor:(id)a3 didReceiveStateChanged:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__CSAudioSessionController_coreSpeechDaemonStateMonitor_didReceiveStateChanged___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CSAudioSessionInfoProviding)sessionInfoProvider
{
  return self->_sessionInfoProvider;
}

- (void)setSessionInfoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfoProvider, a3);
}

- (CSXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClient, a3);
}

- (BOOL)shouldKeepConnection
{
  return self->_shouldKeepConnection;
}

- (void)setShouldKeepConnection:(BOOL)a3
{
  self->_shouldKeepConnection = a3;
}

- (NSUUID)endpointId
{
  return self->_endpointId;
}

- (void)setEndpointId:(id)a3
{
  objc_storeStrong((id *)&self->_endpointId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointId, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_sessionInfoProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __80__CSAudioSessionController_coreSpeechDaemonStateMonitor_didReceiveStateChanged___block_invoke(uint64_t a1)
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
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    v2 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSAudioSessionController coreSpeechDaemonStateMonitor:didReceiveStateChanged:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CoreSpeech Daemon reset notification", buf, 0xCu);
    }
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
            objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionOwnerResetNotification:", *(_QWORD *)(a1 + 32), 0, (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

uint64_t __54__CSAudioSessionController_CSXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioSessionController:didReceiveAudioSessionOwnerLostNotification:", *(_QWORD *)(a1 + 32), 0, (_QWORD)v10);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v4);
  }

  v8 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioSessionController CSXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s reset sessionInfoProvider since xpcClient disconnected", buf, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_teardownXPCClientIfNeeded", (_QWORD)v10);
}

void __47__CSAudioSessionController__audioRouteChanged___block_invoke(uint64_t a1)
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
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAudioSessionController _audioRouteChanged:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:", v9, v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

uint64_t __52__CSAudioSessionController__mediaServicesWereReset___block_invoke(uint64_t a1)
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSAudioSessionController _mediaServicesWereReset:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "userInfo", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:", v9, v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "_registerInterruptionNotification");
  return objc_msgSend(*(id *)(a1 + 32), "_registerAudioRouteChangeNotification");
}

void __51__CSAudioSessionController__mediaServicesWereLost___block_invoke(uint64_t a1)
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
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAudioSessionController _mediaServicesWereLost:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:", v9, v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __48__CSAudioSessionController__handleInterruption___block_invoke(uint64_t a1)
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
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAudioSessionController _handleInterruption:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:", v9, v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __122__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo___block_invoke(uint64_t a1)
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
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioSessionController audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereResetNotificationWi"
          "thUserInfo:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __121__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke(uint64_t a1)
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
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioSessionController audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereLostNotificationWit"
          "hUserInfo:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __111__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionRouteChangeNotificationWithUserInfo___block_invoke(uint64_t a1)
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
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioSessionController audioSessionInfoProvider:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __112__CSAudioSessionController_audioSessionInfoProvider_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke(uint64_t a1)
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
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioSessionController audioSessionInfoProvider:didReceiveAudioSessionInterruptionNotificationWithUserInfo:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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
          objc_msgSend(v8, "audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t __45__CSAudioSessionController_getAudioSessionID__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getAudioSessionID");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __60__CSAudioSessionController_getAudioSessionIDWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_getAudioSessionID"), 0);
}

uint64_t __47__CSAudioSessionController_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoring");
  return result;
}

uint64_t __45__CSAudioSessionController_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_startMonitoring");
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_516 != -1)
    dispatch_once(&sharedInstance_onceToken_516, &__block_literal_global_517);
  return (id)sharedInstance_sharedInstance;
}

void __42__CSAudioSessionController_sharedInstance__block_invoke()
{
  CSAudioSessionController *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioSessionController);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
