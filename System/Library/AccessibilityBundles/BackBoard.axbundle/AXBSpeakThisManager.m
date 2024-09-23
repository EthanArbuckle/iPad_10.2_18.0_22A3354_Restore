@implementation AXBSpeakThisManager

+ (void)initializeMonitor
{
  id v2;

  v2 = (id)objc_msgSend(getSpeakThisServicesClass(), "sharedInstance");
  if (initializeMonitor_onceToken_9 != -1)
    dispatch_once(&initializeMonitor_onceToken_9, &__block_literal_global_18);
}

void __40__AXBSpeakThisManager_initializeMonitor__block_invoke()
{
  AXBSpeakThisManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBSpeakThisManager);
  v1 = (void *)SharedManager_0;
  SharedManager_0 = (uint64_t)v0;

}

+ (void)didUpdateAccessibilityUIServerPID
{
  objc_msgSend((id)SharedManager_0, "_startWatchingForDeathOfAccessibilityUIServerPID");
}

- (AXBSpeakThisManager)init
{
  AXBSpeakThisManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *speakThisQueue;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXBSpeakThisManager;
  v2 = -[AXBSpeakThisManager init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("SpeakThisQueue", 0);
    speakThisQueue = v2->_speakThisQueue;
    v2->_speakThisQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __27__AXBSpeakThisManager_init__block_invoke;
    v10[3] = &unk_250187950;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "registerUpdateBlock:forRetrieveSelector:withListener:", v10, sel_showSpeechController, v2);

    objc_destroyWeak(&v11);
    AXLogSpeakScreen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_DEFAULT, "Clearing highlight state because backboardd just started up.", v9, 2u);
    }

    _AXSSpeakThisSetHighlightVisible();
    -[AXBSpeakThisManager _notifySpeakThisOfSettingsChange](v2, "_notifySpeakThisOfSettingsChange");
    -[AXBSpeakThisManager _startWatchingForDeathOfAccessibilityUIServerPID](v2, "_startWatchingForDeathOfAccessibilityUIServerPID");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__startWatchingForDeathOfAccessibilityUIServerPID, *MEMORY[0x24BED2920], 0);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__AXBSpeakThisManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifySpeakThisOfSettingsChange");

}

- (void)_notifySpeakThisOfSettingsChange
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "showSpeechController"))
  {
    v4 = _AXSSpeakThisEnabled();

    if (v4)
    {
      v5 = &__block_literal_global_183_0;
      goto LABEL_7;
    }
  }
  else
  {

  }
  if (!_AXSSpeakThisEnabled())
    return;
  v5 = &__block_literal_global_187;
LABEL_7:
  dispatch_async((dispatch_queue_t)self->_speakThisQueue, v5);
}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke()
{
  id v0;

  objc_msgSend(getSpeakThisServicesClass(), "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "showSpeechController:", &__block_literal_global_185_0);

}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    AXLogSpeakScreen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_186()
{
  id v0;

  objc_msgSend(getSpeakThisServicesClass(), "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hideSpeechController:", &__block_literal_global_189_0);

}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2_188(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    AXLogSpeakScreen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)_startWatchingForDeathOfAccessibilityUIServerPID
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_232455000, log, OS_LOG_TYPE_FAULT, "Should have accessed AXUIServer PID on the main thread.", v1, 2u);
}

void __71__AXBSpeakThisManager__startWatchingForDeathOfAccessibilityUIServerPID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  if (!_AXSSpeakThisEnabled())
  {
    AXLogSpeakScreen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v12[0]) = 0;
    v11 = "Not watching for death of AXUIServer, because Speak Screen was not enabled.";
LABEL_10:
    _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v12, 2u);
    goto LABEL_11;
  }
  v4 = *(_DWORD *)(a1 + 40);
  AXLogSpeakScreen();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 < 1)
  {
    if (!v6)
      goto LABEL_11;
    LOWORD(v12[0]) = 0;
    v11 = "Not watching for death of AXUIServer, because PID unavailable.";
    goto LABEL_10;
  }
  if (v6)
  {
    v7 = *(_DWORD *)(a1 + 40);
    v12[0] = 67109120;
    v12[1] = v7;
    _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "Start watching for death of AXUIServer: %i", (uint8_t *)v12, 8u);
  }

  v8 = objc_alloc(MEMORY[0x24BE0BE78]);
  v9 = objc_msgSend(v8, "initWithPID:queue:deathHandler:", *(unsigned int *)(a1 + 40), MEMORY[0x24BDAC9B8], &__block_literal_global_194);
  v10 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v9;
LABEL_11:

}

uint64_t __71__AXBSpeakThisManager__startWatchingForDeathOfAccessibilityUIServerPID__block_invoke_193()
{
  NSObject *v0;
  uint8_t v2[16];

  AXLogSpeakScreen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_232455000, v0, OS_LOG_TYPE_DEFAULT, "Clearing highlight state because AXUIServer died.", v2, 2u);
  }

  return _AXSSpeakThisSetHighlightVisible();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityUIServerDeathWatcher, 0);
  objc_storeStrong((id *)&self->_speakThisQueue, 0);
}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_232455000, a2, a3, "Error notifying SpeakThis of setting change: %@", a5, a6, a7, a8, 2u);
}

@end
