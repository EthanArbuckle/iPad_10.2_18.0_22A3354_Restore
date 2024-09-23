@implementation BLSHShowCriticalAssertFailureAlert

void ___BLSHShowCriticalAssertFailureAlert_block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v11;

  if ((a2 & 1) != 0)
  {
    bls_diagnostics_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      ___BLSHShowCriticalAssertFailureAlert_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v11 = (const void *)objc_opt_class();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)_blsCriticalAssertLockStatusDidChange, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  else
  {
    BLSHResetCriticalAssertFailure();
  }
}

void ___BLSHShowCriticalAssertFailureAlert_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_2145AC000, a1, a3, "-[BLSHInternalTapToRadarManager requestTapToRadar:::] said to try again later. will wait for next lock status change to check again for critical assert", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_3();
}

@end
