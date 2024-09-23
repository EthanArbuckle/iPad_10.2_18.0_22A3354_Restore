@implementation HTHangEventCreateWithBundleID

void __HTHangEventCreateWithBundleID_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  HTPrefsQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __HTHangEventCreateWithBundleID_block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __HTHangEventCreateWithBundleID_block_invoke(int a1, int token)
{
  uint64_t v2;
  _BOOL4 v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  os_signpost_id_t started;
  uint64_t v10;
  uint64_t state64;

  state64 = 0;
  if (!notify_get_state(token, &state64))
  {
    v2 = state64;
    v3 = state64 != 0;
    shared_ht_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __HTHangEventCreateWithBundleID_block_invoke_cold_2(v3, v4);

    v5 = kHTAppActivationFailureReasonWatchdog_block_invoke_htAssertion;
    if (v2 || kHTAppActivationFailureReasonWatchdog_block_invoke_prevDisplayState != 1)
    {
      if (!v2 || !kHTAppActivationFailureReasonWatchdog_block_invoke_htAssertion)
        goto LABEL_15;
      v10 = mach_absolute_time();
      HTEndNonResponsiveTaskAtTime(v5, v10);
      started = 0;
    }
    else
    {
      if (kHTAppActivationFailureReasonWatchdog_block_invoke_htAssertion)
      {
        shared_ht_log_handle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          __HTHangEventCreateWithBundleID_block_invoke_cold_1();

      }
      v7 = kHTScreenOffAssertionName;
      v8 = mach_absolute_time();
      started = _HTBeginNonResponsiveAssertionAtStartTime(v7, v8, 1, 1, 0.0);
    }
    kHTAppActivationFailureReasonWatchdog_block_invoke_htAssertion = started;
LABEL_15:
    kHTAppActivationFailureReasonWatchdog_block_invoke_prevDisplayState = v3;
  }
}

void __HTHangEventCreateWithBundleID_block_invoke_24(uint64_t a1)
{
  void *v2;
  void *v3;

  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HTPrefsQueue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupPrefsWithQueue:", v3);

  handleSettingChange(*(_QWORD *)(a1 + 32));
}

void __HTHangEventCreateWithBundleID_block_invoke_3(uint64_t a1)
{
  handleSettingChange(*(_QWORD *)(a1 + 32));
}

void __HTHangEventCreateWithBundleID_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_1AF62F000, v0, v1, "HangTracer SB Screen State: Detected Screen ON -> OFF but an old HT Assertion still exists when we're about to create a new one", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __HTHangEventCreateWithBundleID_block_invoke_cold_2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = kHTAppActivationFailureReasonWatchdog_block_invoke_prevDisplayState == 1;
  v3 = 1024;
  v4 = a1;
  _os_log_debug_impl(&dword_1AF62F000, a2, OS_LOG_TYPE_DEBUG, "Display state changed %i -> %i", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_5();
}

@end
