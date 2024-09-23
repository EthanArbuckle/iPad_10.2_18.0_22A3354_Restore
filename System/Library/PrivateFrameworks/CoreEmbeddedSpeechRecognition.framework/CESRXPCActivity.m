@implementation CESRXPCActivity

- (void)registerXPCActivities
{
  -[CESRXPCActivity registerPostUpgradeSubscriptionActivity](self, "registerPostUpgradeSubscriptionActivity");
  -[CESRXPCActivity registerDailySubscriptionCleanupActivity](self, "registerDailySubscriptionCleanupActivity");
  -[CESRXPCActivity registerPostUpgradeANECompilationActivity](self, "registerPostUpgradeANECompilationActivity");
  -[CESRXPCActivity registerDailyANECompilationActivity](self, "registerDailyANECompilationActivity");
}

- (void)registerPostUpgradeSubscriptionActivity
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315138;
    v4 = "-[CESRXPCActivity registerPostUpgradeSubscriptionActivity]";
    _os_log_debug_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the post-upgrade Subscription XPC Activity", (uint8_t *)&v3, 0xCu);
  }
  _RegisterXPCActivity("com.apple.siri.xpc_activity.post-upgrade-subscriptions", (void *)*MEMORY[0x1E0C80748], &__block_literal_global_973, &__block_literal_global_184);
}

- (void)registerDailySubscriptionCleanupActivity
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315138;
    v4 = "-[CESRXPCActivity registerDailySubscriptionCleanupActivity]";
    _os_log_debug_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the daily Subscription Cleanup XPC Activity", (uint8_t *)&v3, 0xCu);
  }
  _RegisterXPCActivity("com.apple.siri.xpc_activity.daily-subscription-cleanup", (void *)*MEMORY[0x1E0C80748], &__block_literal_global_192, &__block_literal_global_193);
}

- (void)registerPostUpgradeANECompilationActivity
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() >= 10)
  {
    v2 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      v3 = 136315138;
      v4 = "-[CESRXPCActivity registerPostUpgradeANECompilationActivity]";
      _os_log_debug_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the post-upgrade ANE Compilation XPC Activity", (uint8_t *)&v3, 0xCu);
    }
    _RegisterXPCActivity("com.apple.siri.xpc_activity.post-upgrade-speech-ane-compilation", (void *)*MEMORY[0x1E0C80748], &__block_literal_global_195, &__block_literal_global_196);
  }
}

- (void)registerDailyANECompilationActivity
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() >= 10)
  {
    v2 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      v3 = 136315138;
      v4 = "-[CESRXPCActivity registerDailyANECompilationActivity]";
      _os_log_debug_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the daily ANE Compilation XPC Activity", (uint8_t *)&v3, 0xCu);
    }
    _RegisterXPCActivity("com.apple.siri.xpc_activity.daily-speech-ane-compilation", (void *)*MEMORY[0x1E0C80748], &__block_literal_global_201, &__block_literal_global_202);
  }
}

@end
