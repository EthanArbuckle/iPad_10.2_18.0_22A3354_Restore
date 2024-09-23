@implementation CSContinuousAudioFingerprintEnabledPolicyHomePod

- (void)_subscribeEventMonitors
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSContinuousAudioFingerprintEnabledPolicyHomePod;
  -[CSContinuousAudioFingerprintEnabledPolicy _subscribeEventMonitors](&v4, sel__subscribeEventMonitors);
  +[CSHomePodSettingsMonitor sharedInstance](CSHomePodSettingsMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

}

- (void)_addContinuousAudioFingerprintEnabledConditions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSContinuousAudioFingerprintEnabledPolicyHomePod;
  -[CSContinuousAudioFingerprintEnabledPolicy _addContinuousAudioFingerprintEnabledConditions](&v3, sel__addContinuousAudioFingerprintEnabledConditions);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_2380);
}

uint64_t __99__CSContinuousAudioFingerprintEnabledPolicyHomePod__addContinuousAudioFingerprintEnabledConditions__block_invoke()
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
  v1 = objc_msgSend(v0, "shouldAudioMonitoringRecording");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSContinuousAudioFingerprintEnabledPolicyHomePod _addContinuousAudioFingerprintEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ContinuousAudioFingerprint cannot be resumed since we should not monitor audio", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

@end
