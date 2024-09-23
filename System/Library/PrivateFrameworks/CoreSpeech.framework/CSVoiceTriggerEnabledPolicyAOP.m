@implementation CSVoiceTriggerEnabledPolicyAOP

- (CSVoiceTriggerEnabledPolicyAOP)init
{
  CSVoiceTriggerEnabledPolicyAOP *v2;
  CSVoiceTriggerEnabledPolicyAOP *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerEnabledPolicyAOP;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSVoiceTriggerEnabledPolicyAOP _subscribeEventMonitors](v3, "_subscribeEventMonitors");
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_msgSend(MEMORY[0x1E0D19238], "defaultShellStartMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  objc_msgSend(MEMORY[0x1E0D191E8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  objc_msgSend(MEMORY[0x1E0D19208], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

  +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

  objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v11);

  +[CSHangUpEnabledMonitor sharedInstance](CSHangUpEnabledMonitor, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v12);

  +[CSSiriInCallEnabledMonitor sharedInstance](CSSiriInCallEnabledMonitor, "sharedInstance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v13);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_20234);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_13_20235);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_15_20236);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_17_20237);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_19_20238);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_21_20239);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_23_20240);
}

BOOL __67__CSVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_22()
{
  void *v0;
  int v1;

  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  return !v1
      || +[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy](CSVoiceTriggerEnabledPolicyHelper, "siriInCallPolicy");
}

uint64_t __67__CSVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_20()
{
  void *v0;
  int v1;
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191E8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isScreenLocked");

  objc_msgSend(MEMORY[0x1E0D19208], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestricted");

  if (!v1)
    return 1;
  if (v3)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since Siri is restricted on lock screen", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1u;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_18()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isFirstUnlocked");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since device is not unlocked after restart", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_16()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19238], "defaultShellStartMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isSystemShellStarted");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since system shell is not started yet", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_14()
{
  void *v0;
  void *v1;
  char v2;
  uint64_t result;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isEnabled");

    if ((v2 & 1) != 0)
      return 1;
  }
  else
  {

  }
  v4 = *MEMORY[0x1E0D18F60];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v5)
  {
    v6 = 136315394;
    v7 = "-[CSVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions]_block_invoke";
    v8 = 1024;
    v9 = 0;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since Siri VT (%d) is not enabled", (uint8_t *)&v6, 0x12u);
    return 0;
  }
  return result;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke_12()
{
  void *v0;
  int v1;
  BOOL v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHangUp"))
    v2 = v1 == 0;
  else
    v2 = 1;
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "phoneCallState") == 3)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "phoneCallState") == 4;

    }
  }
  objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOtherNonEligibleAppRecording");

  v8 = v7 ^ 1 | v3;
  if (((v7 ^ 1 | v3) & 1) == 0)
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[CSVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since there is other app recording that is not eligible and we are not in a connected or outgoing call", (uint8_t *)&v11, 0xCu);
    }
  }
  return v8;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyAOP__addVoiceTriggerEnabledConditions__block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(MEMORY[0x1E0D19260], "isLocalVoiceTriggerAvailable");
  if ((v0 & 1) == 0)
  {
    v1 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "-[CSVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v1, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since voiceTriggerInCoreSpeech is NO", (uint8_t *)&v3, 0xCu);
    }
  }
  return v0;
}

@end
