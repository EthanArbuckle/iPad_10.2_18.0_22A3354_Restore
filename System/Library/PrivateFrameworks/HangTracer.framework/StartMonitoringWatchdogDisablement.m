@implementation StartMonitoringWatchdogDisablement

void __StartMonitoringWatchdogDisablement_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  objc_msgSend(a4, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("FBDisableWatchdog"));

  os_unfair_lock_lock((os_unfair_lock_t)&gHTWatchdogLock);
  if (!gHTWatchdogMonitor)
  {
    shared_ht_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __StartMonitoringWatchdogDisablement_block_invoke_cold_1();
    goto LABEL_17;
  }
  v7 = gHTWatchdogDisabledAssertion;
  shared_ht_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __StartMonitoringWatchdogDisablement_block_invoke_cold_2();
LABEL_17:

      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF62F000, v9, OS_LOG_TYPE_INFO, "Watchdog monitoring: watchdog disabled, beginning assertion", buf, 2u);
    }

    v12 = kHTWatchdogDisabledAssertionName;
    v13 = mach_absolute_time();
    gHTWatchdogDisabledAssertion = _HTBeginNonResponsiveAssertionAtStartTime(v12, v13, 0, 1, 0.0);
  }
  else
  {
    if (!v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __StartMonitoringWatchdogDisablement_block_invoke_cold_3();
      goto LABEL_17;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1AF62F000, v9, OS_LOG_TYPE_INFO, "Watchdog monitoring: watchdog enabled, ending assertion", v14, 2u);
    }

    v10 = gHTWatchdogDisabledAssertion;
    v11 = mach_absolute_time();
    HTEndNonResponsiveTaskAtTime(v10, v11);
    gHTWatchdogDisabledAssertion = 0;
  }
LABEL_18:
  os_unfair_lock_unlock((os_unfair_lock_t)&gHTWatchdogLock);
}

void __StartMonitoringWatchdogDisablement_block_invoke_93(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = a1[4];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v5, v6, v7);

  objc_msgSend(v4, "setStateDescriptor:", a1[5]);
  objc_msgSend(v4, "setUpdateHandler:", a1[6]);

}

void __StartMonitoringWatchdogDisablement_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Watchdog monitoring: state callback when not enabled, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __StartMonitoringWatchdogDisablement_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Watchdog monitoring: watchdog disabled, already have assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __StartMonitoringWatchdogDisablement_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Watchdog monitoring: watchdog enabled, no assertion active", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
