@implementation DKCPUUsageMonitor

uint64_t __27___DKCPUUsageMonitor_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentCPUUsageLevel:", objc_msgSend(*(id *)(a1 + 32), "getCurrentCPUUsageLevel"));
}

void __27___DKCPUUsageMonitor_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD handler[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  objc_msgSend(*(id *)(a1 + 32), "getCPUTicksForUser:system:idle:", *(_QWORD *)(a1 + 32) + 152, *(_QWORD *)(a1 + 32) + 168, *(_QWORD *)(a1 + 32) + 160);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v3;

  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 144), 0, 0x2540BE400uLL, 0x5F5E100uLL);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 144);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __27___DKCPUUsageMonitor_start__block_invoke_2;
  handler[3] = &unk_24DA66D10;
  handler[4] = v6;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 144));
  v8 = objc_msgSend(*(id *)(a1 + 32), "getCurrentCPUUsageLevel");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCPUUsageLevel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = v8;
}

@end
