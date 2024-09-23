@implementation CSVoiceTriggerJarvisAPEnabledPolicy

- (CSVoiceTriggerJarvisAPEnabledPolicy)init
{
  CSVoiceTriggerJarvisAPEnabledPolicy *v2;
  CSVoiceTriggerJarvisAPEnabledPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerJarvisAPEnabledPolicy;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isPlaybackAudioSessionActive = 0;
    -[CSVoiceTriggerJarvisAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy](v2, "_addVoiceTriggerHearstAPEnabledPolicy");
    -[CSVoiceTriggerJarvisAPEnabledPolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_msgSend(MEMORY[0x1E0D19048], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerObserver:", self);

}

- (void)_addVoiceTriggerHearstAPEnabledPolicy
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id location;

  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_7_1204);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_9);
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __76__CSVoiceTriggerJarvisAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke_10;
  v6 = &unk_1E7C26130;
  objc_copyWeak(&v7, &location);
  -[CSPolicy addConditions:](self, "addConditions:", &v3);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_13, v3, v4, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)siriClientBehaviorMonitor:(id)a3 activatedAudioSessionWithReason:(unint64_t)a4
{
  if (a4 - 3 <= 1)
  {
    -[CSVoiceTriggerJarvisAPEnabledPolicy setIsPlaybackAudioSessionActive:](self, "setIsPlaybackAudioSessionActive:", 1);
    -[CSPolicy notifyCallbackWithOption:](self, "notifyCallbackWithOption:", 0);
  }
}

- (void)siriClientBehaviorMonitorReleasedAudioSession:(id)a3
{
  -[CSVoiceTriggerJarvisAPEnabledPolicy setIsPlaybackAudioSessionActive:](self, "setIsPlaybackAudioSessionActive:", 0);
  -[CSPolicy notifyCallbackWithOption:](self, "notifyCallbackWithOption:", 0);
}

- (void)siriClientBehaviorMonitorAudioDeviceInfoUpdated:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "recordDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVoiceTriggerJarvisAPEnabledPolicy setClientRecordRoute:](self, "setClientRecordRoute:", v5);

  -[CSPolicy notifyCallbackWithOption:](self, "notifyCallbackWithOption:", 0);
}

- (BOOL)isPlaybackAudioSessionActive
{
  return self->_isPlaybackAudioSessionActive;
}

- (void)setIsPlaybackAudioSessionActive:(BOOL)a3
{
  self->_isPlaybackAudioSessionActive = a3;
}

- (NSString)clientRecordRoute
{
  return self->_clientRecordRoute;
}

- (void)setClientRecordRoute:(id)a3
{
  objc_storeStrong((id *)&self->_clientRecordRoute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRecordRoute, 0);
}

uint64_t __76__CSVoiceTriggerJarvisAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke_10(uint64_t a1)
{
  void *v2;
  int v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19048], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasNonVoiceTriggerStreamsOrStreamHoldersActive");

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isPlaybackAudioSessionActive"))
  {
    v6 = (void *)MEMORY[0x1E0D19260];
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "clientRecordRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isJarvisAudioRouteWithRecordRoute:", v8);

  }
  else
  {
    v9 = 0;
  }

  v10 = v3 | v9;
  if ((v10 & 1) == 0)
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[CSVoiceTriggerJarvisAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]_block_invoke";
      v15 = 1024;
      v16 = 0;
      v17 = 1024;
      v18 = 0;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger JarvisAP cannot be turned on since there is no other stream active (%d) and playback session not active (%d)", (uint8_t *)&v13, 0x18u);
    }
  }
  return v10;
}

uint64_t __76__CSVoiceTriggerJarvisAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke_12()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "jarvisConnected");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerJarvisAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger JarvisAP cannot be turned on since Jarvis is not connected", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __76__CSVoiceTriggerJarvisAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke_8()
{
  void *v0;
  int v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isOtherNonEligibleAppRecording");

  if (v1)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerJarvisAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger JarvisAP cannot be turned on since other non-eligible App is recording", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 ^ 1u;
}

uint64_t __76__CSVoiceTriggerJarvisAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerJarvisAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger JarvisAP cannot be turned on since VoiceTrigger is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1219 != -1)
    dispatch_once(&sharedInstance_onceToken_1219, &__block_literal_global_1220);
  return (id)sharedInstance_sharedPolicy_1221;
}

void __53__CSVoiceTriggerJarvisAPEnabledPolicy_sharedInstance__block_invoke()
{
  CSVoiceTriggerJarvisAPEnabledPolicy *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerJarvisAPEnabledPolicy);
  v1 = (void *)sharedInstance_sharedPolicy_1221;
  sharedInstance_sharedPolicy_1221 = (uint64_t)v0;

}

@end
