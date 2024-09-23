@implementation CSSpeechDetectionDevicePresentMonitor

- (CSSpeechDetectionDevicePresentMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSSpeechDetectionDevicePresentMonitor;
  return -[CSEventMonitor init](&v3, sel_init);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  -[CSSpeechDetectionDevicePresentMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle", a3);
  -[CSSpeechDetectionDevicePresentMonitor _startObservingSpeechDetectionVADPresence](self, "_startObservingSpeechDetectionVADPresence");
}

- (void)_stopMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)handleSpeechDetectionVADPresentChange:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSpeechDetectionDevicePresentMonitor handleSpeechDetectionVADPresentChange:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__CSSpeechDetectionDevicePresentMonitor_handleSpeechDetectionVADPresentChange___block_invoke;
  v5[3] = &unk_1E68810D0;
  v5[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v5);
}

- (BOOL)isPresent
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "programmableAudioInjectionEnabled");

  if ((v3 & 1) != 0)
    return 1;
  if (CSIsVirtualMachine_onceToken != -1)
    dispatch_once(&CSIsVirtualMachine_onceToken, &__block_literal_global_17);
  if (CSIsVirtualMachine_isVM)
    return 1;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D47ED8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "containsObject:", CFSTR("VirtualAudioDevice_SpeechDetection"));
  return (char)v5;
}

- (void)_startObservingSpeechDetectionVADPresence
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
  v4 = (uint64_t *)MEMORY[0x1E0D47EE0];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D47EE0], 0);

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
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleSpeechDetectionVADPresentChange_, v7, v8);

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
    v7 = "-[CSSpeechDetectionDevicePresentMonitor _systemControllerDied:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[CSSpeechDetectionDevicePresentMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSSpeechDetectionDevicePresentMonitor _startObservingSpeechDetectionVADPresence](self, "_startObservingSpeechDetectionVADPresence");
  -[CSSpeechDetectionDevicePresentMonitor handleSpeechDetectionVADPresentChange:](self, "handleSpeechDetectionVADPresentChange:", 0);

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

uint64_t __79__CSSpeechDetectionDevicePresentMonitor_handleSpeechDetectionVADPresentChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1823 != -1)
    dispatch_once(&sharedInstance_onceToken_1823, &__block_literal_global_1824);
  return (id)sharedInstance_sharedInstance_1825;
}

void __55__CSSpeechDetectionDevicePresentMonitor_sharedInstance__block_invoke()
{
  CSSpeechDetectionDevicePresentMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSSpeechDetectionDevicePresentMonitor);
  v1 = (void *)sharedInstance_sharedInstance_1825;
  sharedInstance_sharedInstance_1825 = (uint64_t)v0;

}

@end
