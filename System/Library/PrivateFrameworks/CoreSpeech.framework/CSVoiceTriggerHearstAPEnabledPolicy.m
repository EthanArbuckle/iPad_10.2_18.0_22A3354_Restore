@implementation CSVoiceTriggerHearstAPEnabledPolicy

- (CSVoiceTriggerHearstAPEnabledPolicy)init
{
  CSVoiceTriggerHearstAPEnabledPolicy *v2;
  CSVoiceTriggerHearstAPEnabledPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerHearstAPEnabledPolicy;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerHearstAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy](v2, "_addVoiceTriggerHearstAPEnabledPolicy");
    -[CSVoiceTriggerHearstAPEnabledPolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  +[CSOpportuneSpeakEventMonitor sharedInstance](CSOpportuneSpeakEventMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  objc_msgSend(MEMORY[0x1E0D19048], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

}

- (void)_addVoiceTriggerHearstAPEnabledPolicy
{
  _QWORD v3[5];

  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_8_20299);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__CSVoiceTriggerHearstAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke_9;
  v3[3] = &unk_1E7C27608;
  v3[4] = self;
  -[CSPolicy addConditions:](self, "addConditions:", v3);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_11_20300);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_15_20301);
}

- (BOOL)_isOtherStreamsActiveOnDoAPRoute
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0D19048], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasNonVoiceTriggerStreamsOrStreamHoldersActive");

  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hearstRouteStatus");

  if (v5 == 1)
    return v3;
  else
    return 0;
}

uint64_t __76__CSVoiceTriggerHearstAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke_9(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t result;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[CSOpportuneSpeakEventMonitor sharedInstance](CSOpportuneSpeakEventMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStreaming");

  if ((v3 & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "_isOtherStreamsActiveOnDoAPRoute") & 1) != 0)
    return 1;
  v5 = *MEMORY[0x1E0D18F60];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v6)
  {
    v7 = 136315138;
    v8 = "-[CSVoiceTriggerHearstAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]_block_invoke";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger HearstAP cannot be turned on since OpportuneListener is not listening or no other streams active on DoAP route", (uint8_t *)&v7, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __76__CSVoiceTriggerHearstAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke_14()
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
      v5 = "-[CSVoiceTriggerHearstAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger HearstAP cannot be turned on since other non-eligible App is recording", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 ^ 1u;
}

uint64_t __76__CSVoiceTriggerHearstAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke_10()
{
  void *v0;
  int v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t result;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "phoneCallState") == 2)
  {
    v1 = objc_msgSend(MEMORY[0x1E0D19260], "supportRingtoneA2DP");

    if (!v1)
      goto LABEL_11;
  }
  else
  {
    +[CSMXRingtoneMonitor sharedInstance](CSMXRingtoneMonitor, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isAnyRingtoneCurrentlyPlaying") & 1) != 0)
    {
      v3 = objc_msgSend(MEMORY[0x1E0D19260], "supportRingtoneA2DP");

      if ((v3 & 1) == 0)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phoneCallState") == 3)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "phoneCallState");

    if (v6 != 4)
      return 1;
  }
LABEL_11:
  v7 = *MEMORY[0x1E0D18F60];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v8)
  {
    v10 = 136315138;
    v11 = "-[CSVoiceTriggerHearstAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]_block_invoke";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger HearstAP cannot be turned on since we are inside of an invalid phone call state.", (uint8_t *)&v10, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __76__CSVoiceTriggerHearstAPEnabledPolicy__addVoiceTriggerHearstAPEnabledPolicy__block_invoke()
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
      v5 = "-[CSVoiceTriggerHearstAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger HearstAP cannot be turned on since VoiceTrigger is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_20315 != -1)
    dispatch_once(&sharedInstance_onceToken_20315, &__block_literal_global_20316);
  return (id)sharedInstance_sharedPolicy_20317;
}

void __53__CSVoiceTriggerHearstAPEnabledPolicy_sharedInstance__block_invoke()
{
  CSVoiceTriggerHearstAPEnabledPolicy *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerHearstAPEnabledPolicy);
  v1 = (void *)sharedInstance_sharedPolicy_20317;
  sharedInstance_sharedPolicy_20317 = (uint64_t)v0;

}

@end
