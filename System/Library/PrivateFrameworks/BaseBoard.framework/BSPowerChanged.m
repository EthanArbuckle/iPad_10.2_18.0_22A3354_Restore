@implementation BSPowerChanged

void ___BSPowerChanged_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSLogPowerMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18A184000, v4, OS_LOG_TYPE_INFO, "kIOMessageCanSystemSleep -> powerMonitorSystemSleepRequested -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "powerMonitorSystemSleepRequested:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void ___BSPowerChanged_block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSLogPowerMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18A184000, v4, OS_LOG_TYPE_INFO, "kIOMessageSystemWillNotSleep -> powerMonitorSystemSleepRequestAborted -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "powerMonitorSystemSleepRequestAborted:", *(_QWORD *)(a1 + 32));

}

void ___BSPowerChanged_block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSLogPowerMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18A184000, v4, OS_LOG_TYPE_INFO, "kIOMessageSystemWillSleep -> powerMonitorSystemWillSleep -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "powerMonitorSystemWillSleep:", *(_QWORD *)(a1 + 32));

}

void ___BSPowerChanged_block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSLogPowerMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18A184000, v4, OS_LOG_TYPE_INFO, "kIOMessageSystemWillPowerOn -> powerMonitorSystemWillWakeFromSleep -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "powerMonitorSystemWillWakeFromSleep:", *(_QWORD *)(a1 + 32));

}

void ___BSPowerChanged_block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSLogPowerMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18A184000, v4, OS_LOG_TYPE_INFO, "kIOMessageSystemHasPoweredOn -> powerMonitorSystemDidWakeFromSleep -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "powerMonitorSystemDidWakeFromSleep:", *(_QWORD *)(a1 + 32));

}

@end
