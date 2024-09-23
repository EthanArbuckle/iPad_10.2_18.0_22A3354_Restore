@implementation CSVoiceTriggerXPCServiceProxy

- (CSVoiceTriggerXPCServiceProxy)init
{
  return -[CSVoiceTriggerXPCServiceProxy initWithAssertionMonitor:](self, "initWithAssertionMonitor:", 0);
}

- (CSVoiceTriggerXPCServiceProxy)initWithAssertionMonitor:(id)a3
{
  id v5;
  CSVoiceTriggerXPCServiceProxy *v6;
  CSVoiceTriggerXPCServiceProxy *v7;
  uint64_t v8;
  NSMutableSet *activationAssertions;
  uint64_t v10;
  NSHashTable *observers;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSVoiceTriggerXPCServiceProxy;
  v6 = -[CSVoiceTriggerXPCServiceProxy init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
      objc_storeStrong((id *)&v6->_assertionMonitor, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    activationAssertions = v7->_activationAssertions;
    v7->_activationAssertions = (NSMutableSet *)v8;

    *(_WORD *)&v7->_isPhraseSpotterBypassed = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v10;

  }
  return v7;
}

- (void)registerObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)_fetchAssertionMonitor
{
  CSSiriAssertionMonitor *assertionMonitor;

  assertionMonitor = self->_assertionMonitor;
  if (assertionMonitor)
    return assertionMonitor;
  +[CSSiriAssertionMonitor sharedInstance](CSSiriAssertionMonitor, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5
{
  _BOOL4 v6;
  id v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  CSVoiceTriggerXPCServiceProxy *v15;
  double v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  id v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v6 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (os_log_t *)MEMORY[0x1E0D18F60];
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v19 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    v20 = 2082;
    v21 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    v22 = 1026;
    v23 = v6;
    v24 = 2114;
    v25 = v8;
    v26 = 2050;
    v27 = a5;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s ::: %{public}s enable: %{public}d reason: %{public}@ timestamp : %{public}lf", buf, 0x30u);
  }
  if (enableVoiceTrigger_withAssertion_timestamp__onceToken == -1)
  {
    if (v8)
    {
LABEL_5:
      v11 = enableVoiceTrigger_withAssertion_timestamp___VTEnableQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __76__CSVoiceTriggerXPCServiceProxy_enableVoiceTrigger_withAssertion_timestamp___block_invoke_8;
      v13[3] = &unk_1E7C261F8;
      v17 = v6;
      v16 = a5;
      v14 = v8;
      v15 = self;
      dispatch_sync(v11, v13);

      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&enableVoiceTrigger_withAssertion_timestamp__onceToken, &__block_literal_global_5);
    if (v8)
      goto LABEL_5;
  }
  v12 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Ignoring request to enable/disable voice trigger with nil reason.", buf, 0xCu);
  }
LABEL_9:

}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  NSObject *v7;
  _QWORD block[5];
  id v9[2];
  BOOL v10;
  id location;

  if (setPhraseSpotterBypassing_timeout__onceToken != -1)
    dispatch_once(&setPhraseSpotterBypassing_timeout__onceToken, &__block_literal_global_14_13725);
  objc_initWeak(&location, self);
  v7 = setPhraseSpotterBypassing_timeout___phraseSpotterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CSVoiceTriggerXPCServiceProxy_setPhraseSpotterBypassing_timeout___block_invoke_2;
  block[3] = &unk_1E7C26240;
  block[4] = self;
  v10 = a3;
  v9[1] = *(id *)&a4;
  objc_copyWeak(v9, &location);
  dispatch_sync(v7, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
  NSObject *v7;
  _QWORD block[5];
  id v9[2];
  BOOL v10;
  id location;

  if (setRaiseToSpeakBypassing_timeout__onceToken != -1)
    dispatch_once(&setRaiseToSpeakBypassing_timeout__onceToken, &__block_literal_global_22_13715);
  objc_initWeak(&location, self);
  v7 = setRaiseToSpeakBypassing_timeout___rtsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSVoiceTriggerXPCServiceProxy_setRaiseToSpeakBypassing_timeout___block_invoke_2;
  block[3] = &unk_1E7C26240;
  block[4] = self;
  v10 = a3;
  v9[1] = *(id *)&a4;
  objc_copyWeak(v9, &location);
  dispatch_sync(v7, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)notifyVoiceTriggeredSiriSessionCancelled
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSVoiceTriggerXPCServiceProxy notifyVoiceTriggeredSiriSessionCancelled]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (void)notifyServiceConnectionLost
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSVoiceTriggerXPCServiceProxy notifyServiceConnectionLost]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s HandleDisconnect", buf, 0xCu);
  }
  v4 = (void *)-[NSMutableSet copy](self->_activationAssertions, "copy");
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
          objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "systemUptime");
          -[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:](self, "enableVoiceTrigger:withAssertion:timestamp:", 0, v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  -[CSVoiceTriggerXPCServiceProxy setPhraseSpotterBypassing:timeout:](self, "setPhraseSpotterBypassing:timeout:", 0, 0.0, (_QWORD)v12);
  -[CSVoiceTriggerXPCServiceProxy setRaiseToSpeakBypassing:timeout:](self, "setRaiseToSpeakBypassing:timeout:", 0, 0.0);

}

- (id)fetchVoiceTriggerStats
{
  void *v2;
  void *v3;

  +[CSVoiceTriggerDataCollector sharedInstance](CSVoiceTriggerDataCollector, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchVoiceTriggerHeartBeatMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableSet)activationAssertions
{
  return self->_activationAssertions;
}

- (void)setActivationAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_activationAssertions, a3);
}

- (BOOL)isPhraseSpotterBypassed
{
  return self->_isPhraseSpotterBypassed;
}

- (void)setIsPhraseSpotterBypassed:(BOOL)a3
{
  self->_isPhraseSpotterBypassed = a3;
}

- (BOOL)isRaiseToSpeakBypassed
{
  return self->_isRaiseToSpeakBypassed;
}

- (void)setIsRaiseToSpeakBypassed:(BOOL)a3
{
  self->_isRaiseToSpeakBypassed = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CSSiriAssertionMonitor)assertionMonitor
{
  return self->_assertionMonitor;
}

- (void)setAssertionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_assertionMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activationAssertions, 0);
}

void __66__CSVoiceTriggerXPCServiceProxy_setRaiseToSpeakBypassing_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  dispatch_source_t v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD handler[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 9);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = *MEMORY[0x1E0D18F60];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v6)
    {
      v7 = CFSTR("bypassed");
      if (!v3)
        v7 = CFSTR("NOT bypassed");
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSVoiceTriggerXPCServiceProxy setRaiseToSpeakBypassing:timeout:]_block_invoke_2";
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ::: Ignore request as raiseToSpeak already %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v6)
    {
      v8 = CFSTR("bypassed");
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v29 = "-[CSVoiceTriggerXPCServiceProxy setRaiseToSpeakBypassing:timeout:]_block_invoke";
      if (!v4)
        v8 = CFSTR("NOT bypassed");
      v30 = 2114;
      v31 = v8;
      v32 = 2050;
      v33 = v9;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ::: Asserting that raiseToSpeak should be %{public}@, timeout: %{public}f", buf, 0x20u);
      LOBYTE(v4) = *(_BYTE *)(a1 + 56);
      v2 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v2 + 9) = v4;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "CSVoiceTriggerXPCServiceProxy:bypassRaiseToSpeak:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    if (setRaiseToSpeakBypassing_timeout___rtsTimer)
    {
      dispatch_source_cancel((dispatch_source_t)setRaiseToSpeakBypassing_timeout___rtsTimer);
      v15 = (void *)setRaiseToSpeakBypassing_timeout___rtsTimer;
      setRaiseToSpeakBypassing_timeout___rtsTimer = 0;

    }
    if (*(_BYTE *)(a1 + 56) && *(double *)(a1 + 48) > 0.0)
    {
      v16 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)setRaiseToSpeakBypassing_timeout___rtsQueue);
      v17 = (void *)setRaiseToSpeakBypassing_timeout___rtsTimer;
      setRaiseToSpeakBypassing_timeout___rtsTimer = (uint64_t)v16;

      v18 = setRaiseToSpeakBypassing_timeout___rtsTimer;
      v19 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
      dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v20 = setRaiseToSpeakBypassing_timeout___rtsTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __66__CSVoiceTriggerXPCServiceProxy_setRaiseToSpeakBypassing_timeout___block_invoke_25;
      handler[3] = &unk_1E7C27FF0;
      objc_copyWeak(&v22, (id *)(a1 + 40));
      dispatch_source_set_event_handler(v20, handler);
      dispatch_resume((dispatch_object_t)setRaiseToSpeakBypassing_timeout___rtsTimer);
      objc_destroyWeak(&v22);
    }
  }
}

void __66__CSVoiceTriggerXPCServiceProxy_setRaiseToSpeakBypassing_timeout___block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSVoiceTriggerXPCServiceProxy setRaiseToSpeakBypassing:timeout:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ::: Timeout!! raiseToSpeak should be NOT bypassed", buf, 0xCu);
    }
    *((_BYTE *)WeakRetained + 9) = 0;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *((id *)WeakRetained + 3);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "CSVoiceTriggerXPCServiceProxy:bypassRaiseToSpeak:", WeakRetained, 0, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

void __66__CSVoiceTriggerXPCServiceProxy_setRaiseToSpeakBypassing_timeout___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("raise-to-speak assertion queue", 0);
  v1 = (void *)setRaiseToSpeakBypassing_timeout___rtsQueue;
  setRaiseToSpeakBypassing_timeout___rtsQueue = (uint64_t)v0;

}

void __67__CSVoiceTriggerXPCServiceProxy_setPhraseSpotterBypassing_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  dispatch_source_t v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD handler[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 8);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = *MEMORY[0x1E0D18F60];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v6)
    {
      v7 = CFSTR("bypassed");
      if (!v3)
        v7 = CFSTR("NOT bypassed");
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSVoiceTriggerXPCServiceProxy setPhraseSpotterBypassing:timeout:]_block_invoke_2";
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ::: Ignore request as phraseSpotter already %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v6)
    {
      v8 = CFSTR("bypassed");
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v29 = "-[CSVoiceTriggerXPCServiceProxy setPhraseSpotterBypassing:timeout:]_block_invoke";
      if (!v4)
        v8 = CFSTR("NOT bypassed");
      v30 = 2114;
      v31 = v8;
      v32 = 2050;
      v33 = v9;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ::: Asserting that PhraseSpotter should be %{public}@, timeout: %{public}f", buf, 0x20u);
      LOBYTE(v4) = *(_BYTE *)(a1 + 56);
      v2 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v2 + 8) = v4;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "CSVoiceTriggerXPCServiceProxy:bypassPhraseSpotter:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    if (setPhraseSpotterBypassing_timeout___timer)
    {
      dispatch_source_cancel((dispatch_source_t)setPhraseSpotterBypassing_timeout___timer);
      v15 = (void *)setPhraseSpotterBypassing_timeout___timer;
      setPhraseSpotterBypassing_timeout___timer = 0;

    }
    if (*(_BYTE *)(a1 + 56) && *(double *)(a1 + 48) > 0.0)
    {
      v16 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)setPhraseSpotterBypassing_timeout___phraseSpotterQueue);
      v17 = (void *)setPhraseSpotterBypassing_timeout___timer;
      setPhraseSpotterBypassing_timeout___timer = (uint64_t)v16;

      v18 = setPhraseSpotterBypassing_timeout___timer;
      v19 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
      dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v20 = setPhraseSpotterBypassing_timeout___timer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __67__CSVoiceTriggerXPCServiceProxy_setPhraseSpotterBypassing_timeout___block_invoke_21;
      handler[3] = &unk_1E7C27FF0;
      objc_copyWeak(&v22, (id *)(a1 + 40));
      dispatch_source_set_event_handler(v20, handler);
      dispatch_resume((dispatch_object_t)setPhraseSpotterBypassing_timeout___timer);
      objc_destroyWeak(&v22);
    }
  }
}

void __67__CSVoiceTriggerXPCServiceProxy_setPhraseSpotterBypassing_timeout___block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSVoiceTriggerXPCServiceProxy setPhraseSpotterBypassing:timeout:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ::: Timeout!! PhraseSpotter should be NOT bypassed", buf, 0xCu);
    }
    *((_BYTE *)WeakRetained + 8) = 0;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *((id *)WeakRetained + 3);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "CSVoiceTriggerXPCServiceProxy:bypassPhraseSpotter:", WeakRetained, 0, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

void __67__CSVoiceTriggerXPCServiceProxy_setPhraseSpotterBypassing_timeout___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("phrasespotter assertion queue", 0);
  v1 = (void *)setPhraseSpotterBypassing_timeout___phraseSpotterQueue;
  setPhraseSpotterBypassing_timeout___phraseSpotterQueue = (uint64_t)v0;

}

void __76__CSVoiceTriggerXPCServiceProxy_enableVoiceTrigger_withAssertion_timestamp___block_invoke_8(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 56))
      v5 = CFSTR("Enabled");
    else
      v5 = CFSTR("Disabled");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
    v8 = v4;
    v9 = objc_msgSend(v7, "count");
    v10 = *(_QWORD *)(a1 + 48);
    v18 = 136316674;
    v19 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]_block_invoke";
    v20 = 2114;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    v24 = 2050;
    v25 = v9;
    v26 = 2114;
    v27 = enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
    v28 = 2114;
    v29 = v2;
    v30 = 2050;
    v31 = v10;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s ::: Asserting that VoiceTrigger should be %{public}@ with reason: %{public}@. Existing assertions (%{public}lu): %{public}@; times: %{public}@ vs %{public}f",
      (uint8_t *)&v18,
      0x48u);

  }
  objc_msgSend(v2, "doubleValue");
  if (v11 < *(double *)(a1 + 48))
  {
    v12 = (void *)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, *(_QWORD *)(a1 + 32));

    if (*(_BYTE *)(a1 + 56))
    {
      v14 = objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons, "count");
      objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons, "addObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", *(_QWORD *)(a1 + 32));
      if (v14)
        goto LABEL_15;
      objc_msgSend(*(id *)(a1 + 40), "_fetchAssertionMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "enableAssertionReceived");
    }
    else
    {
      objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons, "removeObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", *(_QWORD *)(a1 + 32));
      if (objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons, "count"))
        goto LABEL_15;
      objc_msgSend(*(id *)(a1 + 40), "_fetchAssertionMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "disableAssertionReceived");
    }

LABEL_15:
    if (objc_msgSend(CFSTR("Backlight turned on"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(*(id *)(a1 + 40), "_fetchAssertionMonitor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "backlightOnAssertionReceived:atHostTime:", *(unsigned __int8 *)(a1 + 56), mach_absolute_time());

    }
    goto LABEL_17;
  }
  v16 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Ignoring request to enable/disable voice trigger - time order violation.", (uint8_t *)&v18, 0xCu);
  }
LABEL_17:

}

void __76__CSVoiceTriggerXPCServiceProxy_enableVoiceTrigger_withAssertion_timestamp___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
  enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons = v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason;
  enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason = v2;

  v4 = dispatch_queue_create("voicetrigger assertion queue", 0);
  v5 = (void *)enableVoiceTrigger_withAssertion_timestamp___VTEnableQueue;
  enableVoiceTrigger_withAssertion_timestamp___VTEnableQueue = (uint64_t)v4;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13749 != -1)
    dispatch_once(&sharedInstance_onceToken_13749, &__block_literal_global_13750);
  return (id)sharedInstance__sharedInstance_13751;
}

void __47__CSVoiceTriggerXPCServiceProxy_sharedInstance__block_invoke()
{
  CSVoiceTriggerXPCServiceProxy *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerXPCServiceProxy);
  v1 = (void *)sharedInstance__sharedInstance_13751;
  sharedInstance__sharedInstance_13751 = (uint64_t)v0;

}

@end
