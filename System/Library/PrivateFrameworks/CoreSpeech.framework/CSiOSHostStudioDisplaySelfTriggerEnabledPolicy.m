@implementation CSiOSHostStudioDisplaySelfTriggerEnabledPolicy

- (CSiOSHostStudioDisplaySelfTriggerEnabledPolicy)init
{
  CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *v2;
  CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSiOSHostStudioDisplaySelfTriggerEnabledPolicy;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSiOSHostStudioDisplaySelfTriggerEnabledPolicy _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSiOSHostStudioDisplaySelfTriggerEnabledPolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  objc_msgSend(MEMORY[0x1E0D19238], "defaultShellStartMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_26203);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_4_26204);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_6_26205);
}

uint64_t __83__CSiOSHostStudioDisplaySelfTriggerEnabledPolicy__addVoiceTriggerEnabledConditions__block_invoke_5()
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
      v5 = "-[CSiOSHostStudioDisplaySelfTriggerEnabledPolicy _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger on remote Darwin cannot be turned on since device is not unlocked after restart", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __83__CSiOSHostStudioDisplaySelfTriggerEnabledPolicy__addVoiceTriggerEnabledConditions__block_invoke_3()
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
      v5 = "-[CSiOSHostStudioDisplaySelfTriggerEnabledPolicy _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger on remote Darwin cannot be turned on since system shell is not started yet", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __83__CSiOSHostStudioDisplaySelfTriggerEnabledPolicy__addVoiceTriggerEnabledConditions__block_invoke()
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
      v5 = "-[CSiOSHostStudioDisplaySelfTriggerEnabledPolicy _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger on remote Darwin cannot be turned on since Siri is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

@end
