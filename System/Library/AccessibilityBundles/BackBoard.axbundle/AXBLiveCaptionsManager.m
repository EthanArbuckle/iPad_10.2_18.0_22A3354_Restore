@implementation AXBLiveCaptionsManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_6 != -1)
    dispatch_once(&initializeMonitor_onceToken_6, &__block_literal_global_12);
}

void __43__AXBLiveCaptionsManager_initializeMonitor__block_invoke()
{
  AXBLiveCaptionsManager *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  dispatch_time_t v6;

  v0 = objc_alloc_init(AXBLiveCaptionsManager);
  v1 = (void *)_SharedManager_3;
  _SharedManager_3 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BED2888];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, 0, v4, &__block_literal_global_179_2);

  v6 = dispatch_time(0, 6000000000);
  dispatch_after(v6, MEMORY[0x24BDAC9B8], &__block_literal_global_180_1);
}

uint64_t __43__AXBLiveCaptionsManager_initializeMonitor__block_invoke_2()
{
  return objc_msgSend((id)_SharedManager_3, "updateSettings");
}

uint64_t __43__AXBLiveCaptionsManager_initializeMonitor__block_invoke_3()
{
  return objc_msgSend((id)_SharedManager_3, "updateSettings");
}

- (void)updateSettings
{
  objc_msgSend((id)_SharedManager_3, "setLiveCaptionsEnabled:", _AXSLiveTranscriptionEnabled() != 0);
}

- (void)setLiveCaptionsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id LiveCaptionsServicesClass;
  id *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v4 = _os_feature_enabled_impl();
  AXLogLiveTranscription();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_DEFAULT, "LiveCaptions monitor asked to enable LiveCaptions: %@", buf, 0xCu);

    }
    v8 = AXHasCapability();
    LiveCaptionsServicesClass = getLiveCaptionsServicesClass();
    if (v3 && v8)
    {
      v13 = 0;
      v10 = (id *)&v13;
      objc_msgSend(LiveCaptionsServicesClass, "startLiveCaptionsAndReturnError:", &v13);
    }
    else
    {
      v12 = 0;
      v10 = (id *)&v12;
      objc_msgSend(LiveCaptionsServicesClass, "stopLiveCaptionsAndReturnError:", &v12);
    }
    v6 = *v10;
    if (v6)
    {
      AXLogLiveTranscription();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AXBLiveCaptionsManager setLiveCaptionsEnabled:].cold.1((uint64_t)v6, v11);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_INFO, "Asked to enable/disable LiveCaptions integrated with LiveSpeech but feature flag is off, so no", buf, 2u);
  }

}

- (void)setLiveCaptionsEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232455000, a2, OS_LOG_TYPE_ERROR, "Error toggling LiveCaptions: %@", (uint8_t *)&v2, 0xCu);
}

@end
