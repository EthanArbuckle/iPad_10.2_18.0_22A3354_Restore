@implementation CSCXPhoneCallStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3177 != -1)
    dispatch_once(&sharedInstance_onceToken_3177, &__block_literal_global_3178);
  return (id)sharedInstance_sharedInstance_3179;
}

- (unint64_t)phoneCallState
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unint64_t v14;
  __int128 v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CXCallObserver calls](self->_callObserver, "calls");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v19;
    *(_QWORD *)&v3 = 136316162;
    v16 = v3;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v8 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          v10 = objc_msgSend(v7, "hasConnected");
          v11 = objc_msgSend(v7, "isOnHold");
          v12 = objc_msgSend(v7, "hasEnded");
          v13 = objc_msgSend(v7, "isOutgoing");
          *(_DWORD *)buf = v16;
          v23 = "-[CSCXPhoneCallStateMonitor phoneCallState]";
          v24 = 1024;
          v25 = v10;
          v26 = 1024;
          v27 = v11;
          v28 = 1024;
          v29 = v12;
          v30 = 1024;
          v31 = v13;
          _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Call : [connected:%d] [onhold:%d] [hasEnd:%d] [isOutputgoing:%d]", buf, 0x24u);

        }
        if ((objc_msgSend(v7, "hasEnded", v16) & 1) != 0)
        {
          v14 = 1;
          goto LABEL_23;
        }
        if (objc_msgSend(v7, "isOutgoing") && !objc_msgSend(v7, "hasConnected"))
        {
          v14 = 4;
          goto LABEL_23;
        }
        if ((objc_msgSend(v7, "hasConnected") & 1) == 0
          && (objc_msgSend(v7, "hasEnded") & 1) == 0
          && (objc_msgSend(v7, "isOnHold") & 1) == 0
          && !objc_msgSend(v7, "isOutgoing"))
        {
          v14 = 2;
          goto LABEL_23;
        }
        if ((objc_msgSend(v7, "hasConnected") & 1) != 0)
        {
          v14 = 3;
          goto LABEL_23;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
      v14 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_23:

  return v14;
}

- (CSCXPhoneCallStateMonitor)init
{
  CSCXPhoneCallStateMonitor *v3;
  objc_super v5;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSCXPhoneCallStateMonitor;
    self = -[CSEventMonitor init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  CXCallObserver *v5;
  CXCallObserver *callObserver;
  TUCallProviderManager *v7;
  TUCallProviderManager *tuCallProviderManager;
  id v9;
  id v10;

  v4 = a3;
  if (!self->_callObserver)
  {
    v9 = v4;
    v5 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E0C932E8]);
    callObserver = self->_callObserver;
    self->_callObserver = v5;

    -[CXCallObserver setDelegate:queue:](self->_callObserver, "setDelegate:queue:", self, 0);
    v4 = v9;
  }
  if (!self->_tuCallProviderManager)
  {
    v10 = v4;
    v7 = (TUCallProviderManager *)objc_alloc_init(MEMORY[0x1E0DBD1E8]);
    tuCallProviderManager = self->_tuCallProviderManager;
    self->_tuCallProviderManager = v7;

    v4 = v10;
  }

}

- (void)_stopMonitoring
{
  CXCallObserver *callObserver;
  TUCallProviderManager *tuCallProviderManager;

  callObserver = self->_callObserver;
  if (callObserver)
  {
    self->_callObserver = 0;

  }
  tuCallProviderManager = self->_tuCallProviderManager;
  if (tuCallProviderManager)
  {
    self->_tuCallProviderManager = 0;

  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = a4;
    v9 = objc_msgSend(v8, "hasConnected");
    v10 = objc_msgSend(v8, "isOnHold");
    v11 = objc_msgSend(v8, "hasEnded");
    v12 = objc_msgSend(v8, "isOutgoing");

    *(_DWORD *)buf = 136316162;
    v15 = "-[CSCXPhoneCallStateMonitor callObserver:callChanged:]";
    v16 = 1024;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 1024;
    v21 = v11;
    v22 = 1024;
    v23 = v12;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Received Call Observer Input : [connected:%d] [onhold:%d] [hasEnd:%d] [isOutputgoing:%d]", buf, 0x24u);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__CSCXPhoneCallStateMonitor_callObserver_callChanged___block_invoke;
  v13[3] = &unk_1E68810D0;
  v13[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v13);
}

- (BOOL)firstPartyCall
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[CXCallObserver calls](self->_callObserver, "calls");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v6 = 1;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "providerIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "-[CSCXPhoneCallStateMonitor firstPartyCall]";
          v24 = 2112;
          v25 = v9;
          _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Call : [providerIdentifier: %@]", buf, 0x16u);
        }
        if (!v9)
        {
          v6 = 0;
          goto LABEL_18;
        }
        -[TUCallProviderManager providerWithIdentifier:](self->_tuCallProviderManager, "providerWithIdentifier:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          if ((objc_msgSend(v11, "isSystemProvider") & 1) == 0)
          {
            v13 = (void *)CSLogContextFacilityCoreSpeech;
            v6 = 0;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              v14 = v13;
              objc_msgSend(v8, "providerIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v23 = "-[CSCXPhoneCallStateMonitor firstPartyCall]";
              v24 = 2112;
              v25 = v15;
              _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Call identifier is not first party: %@", buf, 0x16u);

              v6 = 0;
            }
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v6 = 1;
  }
LABEL_18:

  return v6 & 1;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (TUCallProviderManager)tuCallProviderManager
{
  return self->_tuCallProviderManager;
}

- (void)setTuCallProviderManager:(id)a3
{
  objc_storeStrong((id *)&self->_tuCallProviderManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuCallProviderManager, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
}

void __54__CSCXPhoneCallStateMonitor_callObserver_callChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "CSPhoneCallStateMonitor:didRecievePhoneCallStateChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "phoneCallState"));

}

void __43__CSCXPhoneCallStateMonitor_sharedInstance__block_invoke()
{
  CSCXPhoneCallStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSCXPhoneCallStateMonitor);
  v1 = (void *)sharedInstance_sharedInstance_3179;
  sharedInstance_sharedInstance_3179 = (uint64_t)v0;

}

@end
