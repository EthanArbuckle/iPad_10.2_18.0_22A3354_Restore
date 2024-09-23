@implementation AXBLiveSpeechManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_3 != -1)
    dispatch_once(&initializeMonitor_onceToken_3, &__block_literal_global_9);
}

void __41__AXBLiveSpeechManager_initializeMonitor__block_invoke()
{
  AXBLiveSpeechManager *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v0 = objc_alloc_init(AXBLiveSpeechManager);
  v1 = (void *)_SharedManager_0;
  _SharedManager_0 = (uint64_t)v0;

  if (_AXSLiveSpeechEnabled())
    _AXSLiveSpeechSetEnabled();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BED2880];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v2, 0, v3, &__block_literal_global_179_0);

}

uint64_t __41__AXBLiveSpeechManager_initializeMonitor__block_invoke_2()
{
  return objc_msgSend((id)_SharedManager_0, "updateSettings");
}

- (void)setLiveSpeechEnabled:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  _BOOL8 v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = _os_feature_enabled_impl();
  LiveSpeechLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232455000, v7, OS_LOG_TYPE_INFO, "Asked to enable/disable LiveSpeech but feature flag is off, so no", buf, 2u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wasEverEnabled);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v13 = v3;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_232455000, v7, OS_LOG_TYPE_DEFAULT, "LiveSpeech monitor asked to enable LiveSpeech: %ld (was ever enabled: %@)", buf, 0x16u);

  }
  if (v3)
  {
    v11 = 0;
    objc_msgSend(getLiveSpeechServicesObjcClass(), "startLiveSpeechAndReturnError:", &v11);
    v7 = v11;
    self->_wasEverEnabled = 1;
    if (!v7)
      return;
    goto LABEL_11;
  }
  if (self->_wasEverEnabled)
  {
    v10 = 0;
    objc_msgSend(getLiveSpeechServicesObjcClass(), "stopLiveSpeechAndReturnError:", &v10);
    v7 = v10;
    self->_wasEverEnabled = 0;
    if (v7)
    {
LABEL_11:
      LiveSpeechLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AXBLiveSpeechManager setLiveSpeechEnabled:].cold.1((uint64_t)v7, v9);

LABEL_14:
    }
  }
}

- (void)updateSettings
{
  objc_msgSend((id)_SharedManager_0, "setLiveSpeechEnabled:", _AXSLiveSpeechEnabled() != 0);
}

- (void)setLiveSpeechEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232455000, a2, OS_LOG_TYPE_ERROR, "Error toggling LiveSpeech: %@", (uint8_t *)&v2, 0xCu);
}

@end
