@implementation Locked

void __rescheduleAutomaticCooldown_Locked_block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, (const void *)gQueryParser, (CFNotificationCallback)handleDidEnterBackgroundNotification, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t __rescheduleAutomaticCooldown_Locked_block_invoke_2()
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 134217984;
    v2 = 0x405E000000000000;
    _os_log_impl(&dword_1A09DA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[automatic cooldown] cooling down QP after %.0fs of idle time", (uint8_t *)&v1, 0xCu);
  }
  __MDQueryParserCooldown();
  pthread_mutex_lock(&gQueryParserLock);
  if (gQueryParserAutomaticCoolDownBlock)
  {
    _Block_release((const void *)gQueryParserAutomaticCoolDownBlock);
    gQueryParserAutomaticCoolDownBlock = 0;
  }
  return pthread_mutex_unlock(&gQueryParserLock);
}

@end
