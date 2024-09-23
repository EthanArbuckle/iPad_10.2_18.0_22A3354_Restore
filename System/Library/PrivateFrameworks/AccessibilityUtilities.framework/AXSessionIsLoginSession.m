@implementation AXSessionIsLoginSession

void __AXSessionIsLoginSession_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_handleSessionIsLoginSessionUpdate, CFSTR("AXInternalSessionIsLoginSessionChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

void __AXSessionIsLoginSession_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  AXLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "Retrieved login session status: %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)SessionIsLoginSession;
  SessionIsLoginSession = v4;

}

@end
