@implementation CSVoiceTriggerEnabledPolicyMac

- (CSVoiceTriggerEnabledPolicyMac)init
{
  CSVoiceTriggerEnabledPolicyMac *v2;
  CSVoiceTriggerEnabledPolicyMac *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerEnabledPolicyMac;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSVoiceTriggerEnabledPolicyMac _subscribeEventMonitors](v3, "_subscribeEventMonitors");
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

  +[CSClamshellStateMonitor sharedInstance](CSClamshellStateMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  +[CSSRFUserSettingMonitor sharedInstance](CSSRFUserSettingMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  objc_msgSend(MEMORY[0x1E0D191E8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  objc_msgSend(MEMORY[0x1E0D19258], "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

}

- (void)_addVoiceTriggerEnabledConditions
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_21409);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_6_21410);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_8_21411);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_10_21412);
}

uint64_t __67__CSVoiceTriggerEnabledPolicyMac__addVoiceTriggerEnabledConditions__block_invoke_9()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19258], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isUserActive");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since current user doesn't activated", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyMac__addVoiceTriggerEnabledConditions__block_invoke_7()
{
  void *v0;
  void *v1;
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t result;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[CSSRFUserSettingMonitor sharedInstance](CSSRFUserSettingMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isSiriRestrictedOnLockScreen") & 1) == 0)
  {

    return 1;
  }
  objc_msgSend(MEMORY[0x1E0D191E8], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isScreenLocked");

  if (!v2)
    return 1;
  v3 = *MEMORY[0x1E0D18F60];
  v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v4)
  {
    v6 = 136315138;
    v7 = "-[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions]_block_invoke";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since Siri restricted on lock screen AND screen is locked", (uint8_t *)&v6, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyMac__addVoiceTriggerEnabledConditions__block_invoke_5()
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
      v5 = "-[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since VoiceTrigger is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyMac__addVoiceTriggerEnabledConditions__block_invoke()
{
  void *v0;
  int v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[CSClamshellStateMonitor sharedInstance](CSClamshellStateMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isClamshellClosed");

  if (v1)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since clamshell is closed", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 ^ 1u;
}

@end
