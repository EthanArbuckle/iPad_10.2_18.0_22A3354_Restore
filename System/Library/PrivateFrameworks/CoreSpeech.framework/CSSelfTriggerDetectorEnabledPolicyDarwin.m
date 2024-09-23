@implementation CSSelfTriggerDetectorEnabledPolicyDarwin

- (CSSelfTriggerDetectorEnabledPolicyDarwin)init
{
  CSSelfTriggerDetectorEnabledPolicyDarwin *v2;
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
  v13.super_class = (Class)CSSelfTriggerDetectorEnabledPolicyDarwin;
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
    v9 = __48__CSSelfTriggerDetectorEnabledPolicyDarwin_init__block_invoke;
    v10 = &unk_1E7C26D40;
    objc_copyWeak(&v11, &location);
    -[CSPolicy setCallback:](v5, "setCallback:", &v7);
    -[CSSelfTriggerDetectorEnabledPolicyDarwin _subscribeEventMonitors](v2, "_subscribeEventMonitors", v7, v8, v9, v10);
    -[CSSelfTriggerDetectorEnabledPolicyDarwin _addSelfTriggerDetectorEnabledConditions](v2, "_addSelfTriggerDetectorEnabledConditions");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  id v4;

  +[CSSelfTriggerEnabledMonitorAccessory sharedInstance](CSSelfTriggerEnabledMonitorAccessory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  +[CSHostPowerStateMonitor sharedInstance](CSHostPowerStateMonitor, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

}

- (void)_addSelfTriggerDetectorEnabledConditions
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__CSSelfTriggerDetectorEnabledPolicyDarwin__addSelfTriggerDetectorEnabledConditions__block_invoke;
  v3[3] = &unk_1E7C268C0;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[CSPolicy addConditions:](self, "addConditions:", v3);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_16040);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldEnableMyriadFriendlySelfTrigger
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[CSSelfTriggerEnabledMonitorAccessory sharedInstance](CSSelfTriggerEnabledMonitorAccessory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[CSSelfTriggerDetectorEnabledPolicyDarwin _shouldEnableMyriadFriendlySelfTrigger]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Device meets myriad-friendly selfTrigger condition : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
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

uint64_t __84__CSSelfTriggerDetectorEnabledPolicyDarwin__addSelfTriggerDetectorEnabledConditions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  uint64_t result;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "voiceTriggerEnabledPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  if ((v4 & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "_shouldEnableMyriadFriendlySelfTrigger") & 1) != 0)
    return 1;
  v6 = *MEMORY[0x1E0D18F60];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v7)
  {
    v8 = 136315138;
    v9 = "-[CSSelfTriggerDetectorEnabledPolicyDarwin _addSelfTriggerDetectorEnabledConditions]_block_invoke";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s SelfTriggerDetector cannot be turned on since VoiceTrigger is disabled and doesn't meet myriad-friendly self-trigger condition", (uint8_t *)&v8, 0xCu);
    return 0;
  }
  return result;
}

BOOL __84__CSSelfTriggerDetectorEnabledPolicyDarwin__addSelfTriggerDetectorEnabledConditions__block_invoke_4()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[CSHostPowerStateMonitor sharedInstance](CSHostPowerStateMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "currentDarwinHostState");

  if (v1 != 3)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSSelfTriggerDetectorEnabledPolicyDarwin _addSelfTriggerDetectorEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s SelfTriggerDetector cannot be turned on since Darwin host state is inactive", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 == 3;
}

void __48__CSSelfTriggerDetectorEnabledPolicyDarwin_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyCallbackWithOption:", a3);

}

@end
