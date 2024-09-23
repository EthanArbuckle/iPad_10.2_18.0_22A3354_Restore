@implementation CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS

- (CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS)init
{
  CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS *v2;
  uint64_t v3;
  CSPolicy *voiceTriggerEnabledPolicy;
  CSPolicy *v5;
  CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS;
  v2 = -[CSPolicy init](&v14, sel_init);
  if (v2)
  {
    if (!objc_msgSend(MEMORY[0x1E0D19260], "supportAudioTappingSelfTrigger"))
    {
      v6 = 0;
      goto LABEL_6;
    }
    +[CSBuiltInVoiceTriggerEnabledPolicy builtInVoiceTriggerEnabledPolicy](CSBuiltInVoiceTriggerEnabledPolicy, "builtInVoiceTriggerEnabledPolicy");
    v3 = objc_claimAutoreleasedReturnValue();
    voiceTriggerEnabledPolicy = v2->_voiceTriggerEnabledPolicy;
    v2->_voiceTriggerEnabledPolicy = (CSPolicy *)v3;

    objc_initWeak(&location, v2);
    v5 = v2->_voiceTriggerEnabledPolicy;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __56__CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS_init__block_invoke;
    v11 = &unk_1E7C26D40;
    objc_copyWeak(&v12, &location);
    -[CSPolicy setCallback:](v5, "setCallback:", &v8);
    -[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _subscribeEventMonitors](v2, "_subscribeEventMonitors", v8, v9, v10, v11);
    -[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions](v2, "_addSelfTriggerDetectorEnabledConditions");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v6 = v2;
LABEL_6:

  return v6;
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
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  objc_msgSend(MEMORY[0x1E0D18FF0], "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  +[CSAudioSessionMonitor sharedInstance](CSAudioSessionMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  +[CSBluetoothSpeakerStateMonitor sharedInstance](CSBluetoothSpeakerStateMonitor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  objc_msgSend(MEMORY[0x1E0D19080], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  objc_msgSend(MEMORY[0x1E0D191B8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

  if (-[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _deviceSupportMyriadFriendlySelfTrigger](self, "_deviceSupportMyriadFriendlySelfTrigger"))
  {
    objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

    objc_msgSend(MEMORY[0x1E0D19238], "defaultShellStartMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

    objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v11);

    +[CSAVCallConnectedMonitor sharedInstance](CSAVCallConnectedMonitor, "sharedInstance");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v12);

  }
}

- (void)_addSelfTriggerDetectorEnabledConditions
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke;
  v6[3] = &unk_1E7C26130;
  objc_copyWeak(&v7, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __92__CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke_13;
  v4[3] = &unk_1E7C26130;
  objc_copyWeak(&v5, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v4);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_13566);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_16_13567);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldEnableMyriadFriendlySelfTrigger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!_os_feature_enabled_impl()
    || !-[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _deviceSupportMyriadFriendlySelfTrigger](self, "_deviceSupportMyriadFriendlySelfTrigger"))
  {
    return 0;
  }
  +[CSAVCallConnectedMonitor sharedInstance](CSAVCallConnectedMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasConnectedAVCall"))
  {
    objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0D19238], "defaultShellStartMonitor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSystemShellStarted"))
      {
        objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isFirstUnlocked");

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_deviceSupportMyriadFriendlySelfTrigger
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D19260], "supportHandsFree");
  return v2;
}

- (BOOL)_isSpeakerActive
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0D191B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackVolumeStatus");

  objc_msgSend(MEMORY[0x1E0D19080], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "currentBuiltinSpeakerState") == 1 && v3 == 0;

  +[CSBluetoothSpeakerStateMonitor sharedInstance](CSBluetoothSpeakerStateMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  if ((objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn"))
      return v8;
    else
      return v6 | v8;
  }
  return v6;
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

uint64_t __92__CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke(uint64_t a1)
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
      v12 = "-[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
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
    v12 = "-[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s SelfTriggerDetector cannot be turned on since VoiceTrigger is disabled", (uint8_t *)&v11, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __92__CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D18FF0], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playingApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  +[CSAudioSessionMonitor sharedInstance](CSAudioSessionMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getAudioSessionState");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = objc_msgSend(WeakRetained, "_isSpeakerActive");

  if (v4)
    v9 = 1;
  else
    v9 = v6 == 1;
  if (v9)
    v10 = v8;
  else
    v10 = 0;
  if ((v10 & 1) == 0)
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315906;
      v14 = "-[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
      v15 = 1024;
      v16 = v4 != 0;
      v17 = 1024;
      v18 = v6 == 1;
      v19 = 1024;
      v20 = v8;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s SelfTriggerDetector cannot be turned on since isOtherAppPlayingBack = %d, isAudioSessionActive = %d, isSpeakerActive = %d", (uint8_t *)&v13, 0x1Eu);
    }
  }
  return v10;
}

uint64_t __92__CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke_15()
{
  void *v0;
  uint64_t v1;
  uint64_t result;
  NSObject *v3;
  _BOOL4 v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn") & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "phoneCallState");

  if ((unint64_t)(v1 - 5) < 0xFFFFFFFFFFFFFFFELL)
    return 1;
  v3 = *MEMORY[0x1E0D18F60];
  v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v4)
  {
    v5 = 136315138;
    v6 = "-[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s We are disabling self trigger detector as we are in phone call in non-barge-in device", (uint8_t *)&v5, 0xCu);
    return 0;
  }
  return result;
}

BOOL __92__CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS__addSelfTriggerDetectorEnabledConditions__block_invoke_14()
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
      v5 = "-[CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS _addSelfTriggerDetectorEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s We are disabling self trigger detector as we are in a ringtone", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 != 2;
}

void __56__CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyCallbackWithOption:", a3);

}

@end
