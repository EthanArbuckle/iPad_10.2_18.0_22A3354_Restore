@implementation AXBHapticMusicManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken != -1)
    dispatch_once(&initializeMonitor_onceToken, &__block_literal_global_2);
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __42__AXBHapticMusicManager_initializeMonitor__block_invoke()
{
  AXBHapticMusicManager *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  v0 = objc_alloc_init(AXBHapticMusicManager);
  v1 = (void *)_SharedManager;
  _SharedManager = (uint64_t)v0;

  AXLogHapticMusic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "Initializing Haptic Music Monitor", v7, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BED2798];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, &__block_literal_global_180);

}

uint64_t __42__AXBHapticMusicManager_initializeMonitor__block_invoke_178()
{
  return objc_msgSend((id)_SharedManager, "updateSettings");
}

uint64_t __42__AXBHapticMusicManager_initializeMonitor__block_invoke_2()
{
  return objc_msgSend((id)_SharedManager, "updateSettings");
}

- (id)_serviceName
{
  return CFSTR("AXHapticMusicServer");
}

- (void)setHapticMusicEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  AXUIClient *v9;
  AXUIClient *client;
  AXUIClient *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (v3)
    {
      AXLogHapticMusic();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "Asked to enable Haptic Music from BB: (%@)", (uint8_t *)&v13, 0xCu);

      }
      if (!self->_client)
      {
        v7 = objc_alloc(MEMORY[0x24BDFF8F0]);
        -[AXBHapticMusicManager _serviceName](self, "_serviceName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (AXUIClient *)objc_msgSend(v7, "initWithIdentifier:serviceBundleName:", CFSTR("HapticMusicClient-Backboard"), v8);
        client = self->_client;
        self->_client = v9;

        -[AXUIClient setDelegate:](self->_client, "setDelegate:", self);
      }
    }
    v11 = self->_client;
    objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    -[AXUIClient sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:](v11, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], 1, v12, &__block_literal_global_192);
  }
  else
  {
    AXLogHapticMusic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AXBHapticMusicManager setHapticMusicEnabled:].cold.1(v12);
  }

}

void __47__AXBHapticMusicManager_setHapticMusicEnabled___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (v3)
  {
    AXLogHapticMusic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__AXBHapticMusicManager_setHapticMusicEnabled___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  AXLogHapticMusic();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[AXBHapticMusicManager connectionWithServiceWasInterruptedForUserInterfaceClient:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = v3;
  AXPerformBlockAsynchronouslyOnMainThread();

}

_QWORD *__83__AXBHapticMusicManager_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  v3 = result[1];
  if (!v3 || *(_QWORD *)(a1 + 40) == v3)
    return (_QWORD *)objc_msgSend(result, "updateSettings");
  return result;
}

- (void)updateSettings
{
  objc_msgSend((id)_SharedManager, "setHapticMusicEnabled:", _AXSHapticMusicEnabled() != 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setHapticMusicEnabled:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_232455000, log, OS_LOG_TYPE_ERROR, "Asked to enable/disable haptic music but feature flag is off, so no", v1, 2u);
}

void __47__AXBHapticMusicManager_setHapticMusicEnabled___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_232455000, a2, a3, "Error starting haptic music: %@", a5, a6, a7, a8, 2u);
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_232455000, a2, a3, "Connection for haptic music interrupted: %@", a5, a6, a7, a8, 2u);
}

@end
