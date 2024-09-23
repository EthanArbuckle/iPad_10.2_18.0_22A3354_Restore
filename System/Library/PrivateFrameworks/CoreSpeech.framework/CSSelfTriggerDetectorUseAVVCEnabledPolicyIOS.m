@implementation CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS

- (CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS)init
{
  CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *v2;
  uint64_t v3;
  CSPolicy *voiceTriggerEnabledPolicy;
  CSPolicy *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS;
  v2 = -[CSPolicy init](&v13, sel_init);
  if (v2)
  {
    +[CSBuiltInVoiceTriggerEnabledPolicy builtInVoiceTriggerEnabledPolicy](CSBuiltInVoiceTriggerEnabledPolicy, "builtInVoiceTriggerEnabledPolicy");
    v3 = objc_claimAutoreleasedReturnValue();
    voiceTriggerEnabledPolicy = v2->_voiceTriggerEnabledPolicy;
    v2->_voiceTriggerEnabledPolicy = (CSPolicy *)v3;

    objc_initWeak(&location, v2);
    v5 = v2->_voiceTriggerEnabledPolicy;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __52__CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS_init__block_invoke;
    v10 = &unk_1E7C26D40;
    objc_copyWeak(&v11, &location);
    -[CSPolicy setCallback:](v5, "setCallback:", &v7);
    -[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _subscribeEventMonitors](v2, "_subscribeEventMonitors", v7, v8, v9, v10);
    -[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions](v2, "_addSelfTriggerDetectorEnabledConditions");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D19210], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_msgSend(MEMORY[0x1E0D19080], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  objc_msgSend(MEMORY[0x1E0D191B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  if (-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _deviceSupportMyriadFriendlySelfTrigger](self, "_deviceSupportMyriadFriendlySelfTrigger"))
  {
    objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

    objc_msgSend(MEMORY[0x1E0D19238], "defaultShellStartMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

    objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

    +[CSAVCallConnectedMonitor sharedInstance](CSAVCallConnectedMonitor, "sharedInstance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

  }
}

- (void)_addSelfTriggerDetectorEnabledConditions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __88__CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke;
  v6 = &unk_1E7C26130;
  objc_copyWeak(&v7, &location);
  -[CSPolicy addConditions:](self, "addConditions:", &v3);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_13613, v3, v4, v5, v6);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_12);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_14_13614);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldEnableMyriadFriendlySelfTrigger
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEnabled");

    if (-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _deviceSupportMyriadFriendlySelfTrigger](self, "_deviceSupportMyriadFriendlySelfTrigger"))
    {
      +[CSAVCallConnectedMonitor sharedInstance](CSAVCallConnectedMonitor, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "hasConnectedAVCall") & v4) == 1)
      {
        objc_msgSend(MEMORY[0x1E0D19238], "defaultShellStartMonitor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "isSystemShellStarted"))
        {
          objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "isFirstUnlocked");

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if (v8)
        v10 = CFSTR("YES");
      v12 = 136315394;
      v13 = "-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _shouldEnableMyriadFriendlySelfTrigger]";
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s shouldEnableMyriadFriendly STS? %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)_deviceSupportMyriadFriendlySelfTrigger
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D19260], "supportHandsFree");
  return v2;
}

- (CSPolicy)voiceTriggerEnabledPolicy
{
  return self->_voiceTriggerEnabledPolicy;
}

- (void)setVoiceTriggerEnabledPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerEnabledPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEnabledPolicy, 0);
}

uint64_t __88__CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  NSObject *v4;
  id v5;
  void *v6;
  int v7;
  uint64_t result;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_shouldEnableMyriadFriendlySelfTrigger");

  if (v3)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Device meets myriad-friendly selfTrigger condition", (uint8_t *)&v11, 0xCu);
    }
    return 1;
  }
  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "voiceTriggerEnabledPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  if ((v7 & 1) != 0)
    return 1;
  v9 = *MEMORY[0x1E0D18F60];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v10)
  {
    v11 = 136315138;
    v12 = "-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s SelfTriggerDetector cannot be turned on since VoiceTrigger is disabled", (uint8_t *)&v11, 0xCu);
    return 0;
  }
  return result;
}

BOOL __88__CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke_13()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "phoneCallState");

  if (v1 == 2)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s We are disabling self trigger detector as we are in a ringtone", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 != 2;
}

uint64_t __88__CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke_11()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19210], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isPresent");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s SelfTriggerDetector cannot be turned on since speech detection VAD is not available", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __88__CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke_10()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19080], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "currentBuiltinSpeakerState");

  objc_msgSend(MEMORY[0x1E0D191B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackVolumeStatus");

  v4 = v1 == 1 && v3 == 0;
  v5 = v4;
  if (!v4)
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s SelfTriggerDetector cannot be turned on since speaker is inactive or speaker volume is low", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

void __52__CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyCallbackWithOption:", a3);

}

@end
