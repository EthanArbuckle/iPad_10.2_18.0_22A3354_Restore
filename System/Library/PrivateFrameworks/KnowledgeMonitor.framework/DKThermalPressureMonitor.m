@implementation DKThermalPressureMonitor

void __34___DKThermalPressureMonitor_start__block_invoke(uint64_t a1)
{
  const char *v2;
  int *v3;
  int *v4;
  NSObject *v5;
  uint64_t v6;
  int *v7;
  int *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD handler[5];

  v2 = (const char *)*MEMORY[0x24BDAE948];
  v3 = *(int **)(a1 + 32);
  v4 = v3 + 37;
  objc_msgSend(v3, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __34___DKThermalPressureMonitor_start__block_invoke_2;
  handler[3] = &unk_24DA670E8;
  handler[4] = *(_QWORD *)(a1 + 32);
  notify_register_dispatch(v2, v4, v5, handler);

  v7 = *(int **)(a1 + 32);
  v8 = v7 + 39;
  objc_msgSend(v7, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __34___DKThermalPressureMonitor_start__block_invoke_3;
  v10[3] = &unk_24DA670E8;
  v10[4] = *(_QWORD *)(a1 + 32);
  notify_register_dispatch("com.apple.system.peakpowerpressurelevel", v8, v9, v10);

}

uint64_t __34___DKThermalPressureMonitor_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "getThermalPressureLevelWithToken:", a2);
}

uint64_t __34___DKThermalPressureMonitor_start__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "getPeakPowerPressureLevelWithToken:", a2);
}

@end
