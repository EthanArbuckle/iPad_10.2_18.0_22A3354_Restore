@implementation CSAudioPlayingAppMonitor

- (CSAudioPlayingAppMonitor)init
{
  CSAudioPlayingAppMonitor *v3;
  objc_super v5;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSAudioPlayingAppMonitor;
    self = -[CSEventMonitor init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (id)playingApps
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  CSAudioPlayingApp *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D48068]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      v8 = (_QWORD *)MEMORY[0x1E0D48070];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "objectForKeyedSubscript:", *v8, v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            v12 = objc_msgSend(v10, "integerValue");
            objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "processIdentifier");

            if (v14 != (_DWORD)v12)
            {
              v15 = -[CSAudioPlayingApp initWithPid:]([CSAudioPlayingApp alloc], "initWithPid:", v12);
              if (v15)
                objc_msgSend(v18, "addObject:", v15);

            }
          }

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

    v3 = v17;
  }

  return v18;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  -[CSAudioPlayingAppMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle", a3);
  -[CSAudioPlayingAppMonitor _startObservingAudioPlayingState](self, "_startObservingAudioPlayingState");
}

- (void)_stopMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)handleAudioPlayingStateChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__CSAudioPlayingAppMonitor_handleAudioPlayingStateChange___block_invoke;
  v3[3] = &unk_1E68810D0;
  v3[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_startObservingAudioPlayingState
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D48268];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48268], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleAudioPlayingStateChange_, v7, v8);

}

- (void)_systemControllerDied:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSAudioPlayingAppMonitor _systemControllerDied:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[CSAudioPlayingAppMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSAudioPlayingAppMonitor _startObservingAudioPlayingState](self, "_startObservingAudioPlayingState");
  -[CSAudioPlayingAppMonitor handleAudioPlayingStateChange:](self, "handleAudioPlayingStateChange:", 0);

}

- (void)_startObservingSystemControllerLifecycle
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D48208];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48208], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__systemControllerDied_, v7, v8);

}

uint64_t __58__CSAudioPlayingAppMonitor_handleAudioPlayingStateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_2286);
  return (id)sharedMonitor_sharedMonitor;
}

void __41__CSAudioPlayingAppMonitor_sharedMonitor__block_invoke()
{
  CSAudioPlayingAppMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioPlayingAppMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;

}

@end
