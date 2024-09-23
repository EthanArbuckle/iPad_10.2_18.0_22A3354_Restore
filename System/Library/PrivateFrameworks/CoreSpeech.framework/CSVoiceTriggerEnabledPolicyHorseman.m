@implementation CSVoiceTriggerEnabledPolicyHorseman

- (CSVoiceTriggerEnabledPolicyHorseman)init
{
  CSVoiceTriggerEnabledPolicyHorseman *v2;
  CSVoiceTriggerEnabledPolicyHorseman *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerEnabledPolicyHorseman;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerEnabledPolicyHorseman _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSVoiceTriggerEnabledPolicyHorseman _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  +[CSHomePodSettingsMonitor sharedInstance](CSHomePodSettingsMonitor, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_27119);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_4_27120);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_6_27121);
}

uint64_t __72__CSVoiceTriggerEnabledPolicyHorseman__addVoiceTriggerEnabledConditions__block_invoke_5()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[CSHomePodSettingsMonitor sharedInstance](CSHomePodSettingsMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "shouldVoiceTriggerRun");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyHorseman _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s HomePodSettings have turned off VoiceTrigger", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __72__CSVoiceTriggerEnabledPolicyHorseman__addVoiceTriggerEnabledConditions__block_invoke_3()
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
      v5 = "-[CSVoiceTriggerEnabledPolicyHorseman _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Non-AOP VoiceTrigger cannot be turned on since VoiceTrigger is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __72__CSVoiceTriggerEnabledPolicyHorseman__addVoiceTriggerEnabledConditions__block_invoke()
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
      v4 = "-[CSVoiceTriggerEnabledPolicyHorseman _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v1, OS_LOG_TYPE_DEFAULT, "%s Non-AOP VoiceTrigger cannot be turned on since voiceTriggerInCoreSpeech is NO", (uint8_t *)&v3, 0xCu);
    }
  }
  return v0;
}

@end
