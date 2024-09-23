@implementation DKBatteryMonitor

void __26___DKBatteryMonitor_start__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (IOPSGetSupportedPowerSources())
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __26___DKBatteryMonitor_start__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  else
  {
    notify_cancel(a2);
    objc_msgSend(WeakRetained, "setHasInternalBattery:", 0);
    objc_msgSend(WeakRetained, "completeStart");
  }

}

void __26___DKBatteryMonitor_start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_219056000, a1, a3, "Got battery attach notification but still can't determine power sources.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

@end
