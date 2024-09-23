@implementation AXBSoundDetectionManager

+ (void)initializeManager
{
  id v2;

  v2 = (id)objc_msgSend(a1, "controller");
}

+ (id)controller
{
  if (controller_onceToken_0 != -1)
    dispatch_once(&controller_onceToken_0, &__block_literal_global_8);
  return (id)controller__sManager;
}

void __38__AXBSoundDetectionManager_controller__block_invoke()
{
  AXBSoundDetectionManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBSoundDetectionManager);
  v1 = (void *)controller__sManager;
  controller__sManager = (uint64_t)v0;

}

- (AXBSoundDetectionManager)init
{
  AXBSoundDetectionManager *v2;
  AXBSoundDetectionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXBSoundDetectionManager;
  v2 = -[AXBSoundDetectionManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXBSoundDetectionManager _bootstrapSoundDetection](v2, "_bootstrapSoundDetection");
  return v3;
}

- (void)_bootstrapSoundDetection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  __CFNotificationCenter *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke;
  v22[3] = &unk_250187950;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v3, "registerUpdateBlock:forRetrieveSelector:withListener:", v22, sel_ultronSupportEnabled, self);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_2;
  v20[3] = &unk_250187950;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v5, "registerUpdateBlock:forRetrieveSelector:withListener:", v20, sel_ultronIsRunning, self);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_3;
  v18[3] = &unk_250187950;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v6, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_soundDetectionState, self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_updateSoundDetection, (CFStringRef)*MEMORY[0x24BED26F8], 0, (CFNotificationSuspensionBehavior)1028);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_4;
  v16[3] = &unk_250187950;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v8, "registerUpdateBlock:forRetrieveSelector:withListener:", v16, sel_assistiveTouchSwitches, self);

  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)_updateSoundDetection, (CFStringRef)*MEMORY[0x24BED26F0], 0, (CFNotificationSuspensionBehavior)1028);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  v12 = 3221225472;
  v13 = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_5;
  v14 = &unk_250187950;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v10, "registerUpdateBlock:forRetrieveSelector:withListener:", &v11, sel_assistiveTouchActionsBySoundAction, self);

  -[AXBSoundDetectionManager _soundDetectionSettingsDidUpdate](self, "_soundDetectionSettingsDidUpdate", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_soundDetectionSettingsDidUpdate");

}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_soundDetectionSettingsDidUpdate");

}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_soundDetectionSettingsDidUpdate");

}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_soundDetectionSettingsDidUpdate");

}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_soundDetectionSettingsDidUpdate");

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BED26F0], 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x24BED26F8], 0);
  v5.receiver = self;
  v5.super_class = (Class)AXBSoundDetectionManager;
  -[AXBSoundDetectionManager dealloc](&v5, sel_dealloc);
}

- (void)_soundDetectionSettingsDidUpdate
{
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  AXUIClient *soundDetectionClient;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogUltron();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_232455000, v3, OS_LOG_TYPE_DEFAULT, "Sound detection settings did update", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ultronSupportEnabled");

  if ((v5 & 1) != 0
    || -[AXBSoundDetectionManager _shouldArmSoundRecognition](self, "_shouldArmSoundRecognition")
    || -[AXBSoundDetectionManager _shouldArmVoiceTriggers](self, "_shouldArmVoiceTriggers"))
  {
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__AXBSoundDetectionManager__soundDetectionSettingsDidUpdate__block_invoke;
    block[3] = &unk_250187618;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    soundDetectionClient = self->_soundDetectionClient;
    self->_soundDetectionClient = 0;

  }
}

uint64_t __60__AXBSoundDetectionManager__soundDetectionSettingsDidUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startupSoundDetectionUIServer");
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  AXUIClient *soundDetectionClient;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  soundDetectionClient = self->_soundDetectionClient;
  if (soundDetectionClient == a3 && soundDetectionClient != 0)
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = 67109120;
      v8[1] = objc_msgSend(v7, "ultronSupportEnabled");
      _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_INFO, "Ultron client interrupted, restart: %d", (uint8_t *)v8, 8u);

    }
    -[AXBSoundDetectionManager _startupSoundDetectionUIServer](self, "_startupSoundDetectionUIServer");
  }
}

- (void)_startupSoundDetectionUIServer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_232455000, v0, v1, "Creating Sound Detection Client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)_shouldArmSoundRecognition
{
  void *v2;
  BOOL v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "soundDetectionState") == 1)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "soundDetectionState") == 2;

  }
  return v3;
}

- (BOOL)_shouldArmVoiceTriggers
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (_AXSAssistiveTouchScannerEnabled())
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assistiveTouchSwitches");
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      v7 = *MEMORY[0x24BE00798];
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "source");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", v7);

          if (v10)
          {
            AXLogUltron();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              -[AXBSoundDetectionManager _shouldArmVoiceTriggers].cold.2();

            goto LABEL_18;
          }
          ++v8;
        }
        while (v5 != v8);
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          continue;
        break;
      }
    }

  }
  v11 = _AXSAssistiveTouchEnabled();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assistiveTouchActionsBySoundAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      AXLogUltron();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[AXBSoundDetectionManager _shouldArmVoiceTriggers].cold.1();
LABEL_18:

      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (AXUIClient)soundDetectionClient
{
  return self->_soundDetectionClient;
}

- (void)setSoundDetectionClient:(id)a3
{
  objc_storeStrong((id *)&self->_soundDetectionClient, a3);
}

- (VOSCommandManager)commandManager
{
  return self->_commandManager;
}

- (void)setCommandManager:(id)a3
{
  objc_storeStrong((id *)&self->_commandManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandManager, 0);
  objc_storeStrong((id *)&self->_soundDetectionClient, 0);
}

- (void)_shouldArmVoiceTriggers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_232455000, v0, v1, "Voice triggers should arm for Switch Control", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
