@implementation CSListeningEnabledPolicyWatch

- (CSListeningEnabledPolicyWatch)init
{
  CSListeningEnabledPolicyWatch *v2;
  CSListeningEnabledPolicyWatch *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSListeningEnabledPolicyWatch;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSListeningEnabledPolicyWatch _addListeningEnabledConditions](v2, "_addListeningEnabledConditions");
    -[CSListeningEnabledPolicyWatch _subscribeEventMonitors](v3, "_subscribeEventMonitors");
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
  id v9;

  +[CSSiriAssertionMonitor sharedInstance](CSSiriAssertionMonitor, "sharedInstance");
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

  objc_msgSend(MEMORY[0x1E0D19210], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHandsFree"))
  {
    objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

    +[CSPhraseSpotterEnabledMonitor sharedInstance](CSPhraseSpotterEnabledMonitor, "sharedInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

  }
}

- (void)_addListeningEnabledConditions
{
  void *v3;

  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_20175);
  if (CSHasAOP())
    v3 = &__block_literal_global_9_20176;
  else
    v3 = &__block_literal_global_11;
  -[CSPolicy addConditions:](self, "addConditions:", v3);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_13_20177);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_15_20178);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_17_20179);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_19_20180);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_22_20181);
}

uint64_t __63__CSListeningEnabledPolicyWatch__addListeningEnabledConditions__block_invoke_21()
{
  void *v0;
  uint64_t v1;
  char v2;
  char v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "phoneCallState");

  v2 = objc_msgSend(MEMORY[0x1E0D19260], "supportRingtoneA2DP");
  if (v1 == 2)
    v3 = v2;
  else
    v3 = 1;
  if ((v3 & 1) == 0 || (unint64_t)(v1 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Listening on watch cant be turned on because we are in a ringtone with A2DP, connected or outgoing call", (uint8_t *)&v6, 0xCu);
    }
  }
  if (v1 == 4)
    return 0;
  else
    return v3 & (v1 != 3);
}

uint64_t __63__CSListeningEnabledPolicyWatch__addListeningEnabledConditions__block_invoke_18()
{
  void *v0;
  int v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "audioInjectionEnabled");

  if (v1)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Listening on watch cannot be turned on since audioInjection is enabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 ^ 1u;
}

uint64_t __63__CSListeningEnabledPolicyWatch__addListeningEnabledConditions__block_invoke_16()
{
  void *v0;
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[CSPhraseSpotterEnabledMonitor sharedInstance](CSPhraseSpotterEnabledMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if (!objc_msgSend(MEMORY[0x1E0D19260], "supportHandsFree"))
  {
LABEL_9:
    v5 = 0;
    goto LABEL_12;
  }
  v2 = *MEMORY[0x1E0D18F60];
  v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (!v1)
  {
    if (v3)
    {
      v10 = 136315138;
      v11 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Hey Siri is disabled. Not checking if we are in a call.", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_9;
  }
  if (v3)
  {
    v10 = 136315138;
    v11 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Hey Siri is enabled. Checking if we are in a call.", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phoneCallState") == 2)
    v5 = objc_msgSend(MEMORY[0x1E0D19260], "supportRingtoneA2DP") ^ 1;
  else
    v5 = 0;

LABEL_12:
  +[CSSiriAssertionMonitor sharedInstance](CSSiriAssertionMonitor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  if ((v7 & 1) == 0 && (v5 & 1) == 0)
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Listening on watch cannot be turned on since Siri assertion is disabled and or its not in a ringtone hfp state", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7 | v1 & v5;
}

uint64_t __63__CSListeningEnabledPolicyWatch__addListeningEnabledConditions__block_invoke_14()
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
      v5 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Listening on watch cannot be turned on since device is not unlocked after restart", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __63__CSListeningEnabledPolicyWatch__addListeningEnabledConditions__block_invoke_12()
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
      v5 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Listening on watch cannot be turned on since system shell is not started", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __63__CSListeningEnabledPolicyWatch__addListeningEnabledConditions__block_invoke_10()
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
      v5 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Listening on watch cannot be turned on since Siri is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __63__CSListeningEnabledPolicyWatch__addListeningEnabledConditions__block_invoke_8()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[CSPhraseSpotterEnabledMonitor sharedInstance](CSPhraseSpotterEnabledMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Listening on watch cannot be turned on since HS and RTS disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __63__CSListeningEnabledPolicyWatch__addListeningEnabledConditions__block_invoke()
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
      v5 = "-[CSListeningEnabledPolicyWatch _addListeningEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Listening on watch cannot be turned on since speech detection VAD is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

@end
