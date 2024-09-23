@implementation CSContinuousAudioFingerprintEnabledPolicy

- (CSContinuousAudioFingerprintEnabledPolicy)init
{
  CSContinuousAudioFingerprintEnabledPolicy *v2;
  CSContinuousAudioFingerprintEnabledPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSContinuousAudioFingerprintEnabledPolicy;
  v2 = -[CSPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSContinuousAudioFingerprintEnabledPolicy _subscribeEventMonitors](v2, "_subscribeEventMonitors");
    -[CSContinuousAudioFingerprintEnabledPolicy _addContinuousAudioFingerprintEnabledConditions](v3, "_addContinuousAudioFingerprintEnabledConditions");
  }
  return v3;
}

- (void)_subscribeEventMonitors
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

}

- (void)_addContinuousAudioFingerprintEnabledConditions
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_13651);
}

uint64_t __92__CSContinuousAudioFingerprintEnabledPolicy__addContinuousAudioFingerprintEnabledConditions__block_invoke()
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
      v5 = "-[CSContinuousAudioFingerprintEnabledPolicy _addContinuousAudioFingerprintEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ContinuousAudioFingerprint cannot be turned on since Siri is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

@end
