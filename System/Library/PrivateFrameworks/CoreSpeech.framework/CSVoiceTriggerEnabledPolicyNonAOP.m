@implementation CSVoiceTriggerEnabledPolicyNonAOP

- (CSVoiceTriggerEnabledPolicyNonAOP)init
{
  CSVoiceTriggerEnabledPolicyNonAOP *v2;
  CSVoiceTriggerEnabledPolicyNonAOP *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerEnabledPolicyNonAOP;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSVoiceTriggerEnabledPolicyNonAOP _subscribeEventMonitors](v3, "_subscribeEventMonitors");
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  +[CSSiriAssertionMonitor sharedInstance](CSSiriAssertionMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  objc_msgSend(MEMORY[0x1E0D19238], "defaultShellStartMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  +[CSBatteryMonitor sharedInstance](CSBatteryMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

  objc_msgSend(MEMORY[0x1E0D191E8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

  objc_msgSend(MEMORY[0x1E0D19208], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

  +[CSSoftwareUpdateCheckingMonitor sharedInstance](CSSoftwareUpdateCheckingMonitor, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v11);

  objc_msgSend(MEMORY[0x1E0D19210], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v12);

  objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v13);

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v14);

  +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v15);

  +[CSHangUpEnabledMonitor sharedInstance](CSHangUpEnabledMonitor, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v16);

  +[CSSiriInCallEnabledMonitor sharedInstance](CSSiriInCallEnabledMonitor, "sharedInstance");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v17);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_12005);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_16_12006);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_19_12007);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_21);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_23);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_25);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_27_12008);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_29_12009);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_31_12010);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_33_12011);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_35_12012);
}

BOOL __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_34()
{
  return +[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy](CSVoiceTriggerEnabledPolicyHelper, "siriInCallPolicy");
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_32()
{
  void *v0;
  int v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[CSSoftwareUpdateCheckingMonitor sharedInstance](CSSoftwareUpdateCheckingMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isSoftwareUpdateCheckingRunning");

  if (v1)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since Software Update Checking is running", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 ^ 1u;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_30()
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
      v7 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since Siri is restricted on lock screen", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1u;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_28()
{
  void *v0;
  char v1;
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t result;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[CSSiriAssertionMonitor sharedInstance](CSSiriAssertionMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) != 0)
    return 1;
  +[CSBatteryMonitor sharedInstance](CSBatteryMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "batteryState");

  if (v3 != 2)
    return 1;
  v4 = *MEMORY[0x1E0D18F60];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v5)
  {
    v7 = 136315138;
    v8 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since device is on battery", (uint8_t *)&v7, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_26()
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
      v5 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since device is not unlocked after restart", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_24()
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
      v5 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since system shell is not started yet", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_22()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since Siri is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_20()
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
      v5 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since VoiceTrigger is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_18()
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
      v4 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v1, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since voiceTriggerInCoreSpeech is NO", (uint8_t *)&v3, 0xCu);
    }
  }
  return v0;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke_15()
{
  void *v0;
  _BOOL4 v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHangUp"))
  {
    objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v0, "phoneCallState") == 3)
    {
      v1 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v2, "phoneCallState") == 4;

    }
  }
  else
  {
    v1 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOtherNonEligibleAppRecording");

  v5 = v4 ^ 1 | v1;
  if (((v4 ^ 1 | v1) & 1) == 0)
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since there is other app recording that is not eligible and we are not in a connected or outgoing call", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

uint64_t __70__CSVoiceTriggerEnabledPolicyNonAOP__addVoiceTriggerEnabledConditions__block_invoke()
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
      v5 = "-[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since SpeechDetectionVAD is not present", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

@end
