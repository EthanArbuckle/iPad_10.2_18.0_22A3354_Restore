@implementation CSTUPhoneCallStateMonitor

- (CSTUPhoneCallStateMonitor)init
{
  CSTUPhoneCallStateMonitor *v3;
  CSTUPhoneCallStateMonitor *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSTUPhoneCallStateMonitor;
    v4 = -[CSEventMonitor init](&v8, sel_init);
    if (v4)
    {
      v5 = dispatch_queue_create("CSTUPhoneCallStateMonitor queue", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  TUCallCenter *v4;
  TUCallCenter *tuCallCenter;

  objc_msgSend(MEMORY[0x1E0DBD1C8], "callCenterWithQueue:", self->_queue);
  v4 = (TUCallCenter *)objc_claimAutoreleasedReturnValue();
  tuCallCenter = self->_tuCallCenter;
  self->_tuCallCenter = v4;

  self->_tuPhoneCallState = -[CSTUPhoneCallStateMonitor _fetchTUPhoneCallState](self, "_fetchTUPhoneCallState");
  -[CSTUPhoneCallStateMonitor _registerPhoneCallStateChangeNotifier](self, "_registerPhoneCallStateChangeNotifier");
}

- (void)_stopMonitoring
{
  void *v3;
  void *v4;
  TUCallCenter *tuCallCenter;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DBD4A8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DBD4F8], 0);

  self->_tuPhoneCallState = 0;
  tuCallCenter = self->_tuCallCenter;
  self->_tuCallCenter = 0;

}

- (void)_registerPhoneCallStateChangeNotifier
{
  NSObject *v2;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (self->_tuCallCenter)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSTUPhoneCallStateMonitor _registerPhoneCallStateChangeNotifier]";
      _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s register tuCallCenter notification call backs", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__callStatusDidChangeHandler_, *MEMORY[0x1E0DBD4A8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__callStatusDidChangeHandler_, *MEMORY[0x1E0DBD4F8], 0);

  }
  else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "-[CSTUPhoneCallStateMonitor _registerPhoneCallStateChangeNotifier]";
    _os_log_error_impl(&dword_1B502E000, v2, OS_LOG_TYPE_ERROR, "%s No tuCallCenter to register", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_callStatusDidChangeHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[5];

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DBD4A8]))
  {

LABEL_4:
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__CSTUPhoneCallStateMonitor__callStatusDidChangeHandler___block_invoke;
    v8[3] = &unk_1E68810D0;
    v8[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v8);
    goto LABEL_5;
  }
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DBD4F8]);

  if (v7)
    goto LABEL_4;
LABEL_5:

}

- (BOOL)firstPartyCall
{
  TUCallCenter *v3;
  TUCallCenter *tuCallCenter;
  NSObject *queue;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  if (!self->_tuCallCenter)
  {
    objc_msgSend(MEMORY[0x1E0DBD1C8], "callCenterWithQueue:", self->_queue);
    v3 = (TUCallCenter *)objc_claimAutoreleasedReturnValue();
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = v3;

  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CSTUPhoneCallStateMonitor_firstPartyCall__block_invoke;
  v8[3] = &unk_1E6880D18;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (unint64_t)phoneCallState
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__CSTUPhoneCallStateMonitor_phoneCallState__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_fetchTUPhoneCallState
{
  TUCallCenter *v3;
  TUCallCenter *tuCallCenter;
  NSObject *queue;
  uint64_t *v6;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (!self->_tuCallCenter)
  {
    objc_msgSend(MEMORY[0x1E0DBD1C8], "callCenterWithQueue:", self->_queue);
    v3 = (TUCallCenter *)objc_claimAutoreleasedReturnValue();
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = v3;

  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__CSTUPhoneCallStateMonitor__fetchTUPhoneCallState__block_invoke;
  v9[3] = &unk_1E6880D18;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  v6 = v11;
  self->_tuPhoneCallState = v11[3];
  v7 = v6[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (TUCallCenter)tuCallCenter
{
  return self->_tuCallCenter;
}

- (void)setTuCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_tuCallCenter, a3);
}

- (unint64_t)tuPhoneCallState
{
  return self->_tuPhoneCallState;
}

- (void)setTuPhoneCallState:(unint64_t)a3
{
  self->_tuPhoneCallState = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
}

void __51__CSTUPhoneCallStateMonitor__fetchTUPhoneCallState__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "currentAudioAndVideoCalls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSTUPhoneCallStateMonitor _fetchTUPhoneCallState]_block_invoke";
      v21 = 1024;
      v22 = 6;
      _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s TUPhone call - [TUCallStatus: %d]", buf, 0x12u);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v6 = 136315394;
    v13 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "status", v13, (_QWORD)v14);
        v11 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v20 = "-[CSTUPhoneCallStateMonitor _fetchTUPhoneCallState]_block_invoke";
          v21 = 1024;
          v22 = v10;
          _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s TUPhone call - [TUCallStatus: %d]", buf, 0x12u);
        }
        switch(v10)
        {
          case 3:
            v12 = 4;
            break;
          case 6:
            v12 = 1;
            break;
          case 4:
            v12 = 2;
            break;
          default:
            if ((v10 - 1) > 1)
              goto LABEL_21;
            v12 = 3;
            break;
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;
LABEL_21:
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          goto LABEL_24;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
LABEL_24:

}

uint64_t __43__CSTUPhoneCallStateMonitor_phoneCallState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

void __43__CSTUPhoneCallStateMonitor_firstPartyCall__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "currentAudioAndVideoCalls");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 136315394;
    v14 = v4;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "provider", v14, (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          v20 = "-[CSTUPhoneCallStateMonitor firstPartyCall]_block_invoke";
          v21 = 2112;
          v22 = v9;
          _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s TUPhone Call - [providerIdentifier: %@]", buf, 0x16u);
        }
        if (!v9)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_18;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "providerManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "providerWithIdentifier:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 && (objc_msgSend(v12, "isSystemProvider") & 1) == 0)
        {
          v13 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = "-[CSTUPhoneCallStateMonitor firstPartyCall]_block_invoke";
            v21 = 2112;
            v22 = v9;
            _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s TUPhone call - identifier is not first party: %@", buf, 0x16u);
          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_18:

}

void __57__CSTUPhoneCallStateMonitor__callStatusDidChangeHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "CSPhoneCallStateMonitor:didRecievePhoneCallStateChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "_fetchTUPhoneCallState"));

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7384 != -1)
    dispatch_once(&sharedInstance_onceToken_7384, &__block_literal_global_7385);
  return (id)sharedInstance_sharedInstance_7386;
}

void __43__CSTUPhoneCallStateMonitor_sharedInstance__block_invoke()
{
  CSTUPhoneCallStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSTUPhoneCallStateMonitor);
  v1 = (void *)sharedInstance_sharedInstance_7386;
  sharedInstance_sharedInstance_7386 = (uint64_t)v0;

}

@end
