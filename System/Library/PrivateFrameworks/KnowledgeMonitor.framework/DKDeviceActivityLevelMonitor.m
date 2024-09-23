@implementation DKDeviceActivityLevelMonitor

uint64_t __38___DKDeviceActivityLevelMonitor_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePerformanceThrottleStatusWithLevel:", objc_msgSend(*(id *)(a1 + 32), "lastInUseStatus"));
}

uint64_t __38___DKDeviceActivityLevelMonitor_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke_2;
  v8[3] = &unk_24DA66D10;
  v8[4] = *(_QWORD *)(a1 + 32);
  v4 = v8;
  v5 = (void *)os_transaction_create();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
  block[3] = &unk_24DA66E28;
  v10 = v5;
  v11 = v4;
  v6 = v5;
  dispatch_async(v2, block);

  return 1;
}

uint64_t __38___DKDeviceActivityLevelMonitor_start__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePerformanceThrottleStatusWithLevel:", *(_QWORD *)(a1 + 40) & 2);
}

uint64_t __38___DKDeviceActivityLevelMonitor_start__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateActivityDateAndInUseState:", objc_msgSend(*(id *)(a1 + 32), "currentInUseStatus"));
}

void __38___DKDeviceActivityLevelMonitor_start__block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastActivityDate:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setLastSetActiveDate:", v2);

}

void __38___DKDeviceActivityLevelMonitor_start__block_invoke_6(uint64_t a1, uint64_t a2, unint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  int64_t v8;
  dispatch_time_t v9;
  NSObject *v10;

  objc_msgSend(*(id *)(a1 + 32), "debounceTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v6);

  objc_msgSend(*(id *)(a1 + 32), "setCurrentInUseStatus:", a2 & 0xFFFFFFFFFFFFFFFDLL);
  objc_msgSend(*(id *)(a1 + 32), "debounceTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (a3 >= 2)
    v8 = 2000000000;
  else
    v8 = 0;
  v9 = dispatch_walltime(0, v8);
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

  objc_msgSend(*(id *)(a1 + 32), "debounceTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v10);

}

@end
