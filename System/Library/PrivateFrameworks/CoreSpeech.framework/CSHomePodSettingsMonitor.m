@implementation CSHomePodSettingsMonitor

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSHomePodSettingsMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : HomePod voiceTriggerAssertion", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)shouldVoiceTriggerRun
{
  return 1;
}

- (BOOL)shouldAudioMonitoringRecording
{
  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_23620 != -1)
    dispatch_once(&sharedInstance_onceToken_23620, &__block_literal_global_23621);
  return (id)sharedInstance__sharedInstance_23622;
}

void __42__CSHomePodSettingsMonitor_sharedInstance__block_invoke()
{
  CSHomePodSettingsMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSHomePodSettingsMonitor);
  v1 = (void *)sharedInstance__sharedInstance_23622;
  sharedInstance__sharedInstance_23622 = (uint64_t)v0;

}

@end
