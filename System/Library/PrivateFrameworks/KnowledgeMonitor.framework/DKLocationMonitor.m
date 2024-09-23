@implementation DKLocationMonitor

void __26___DKLocationMonitor_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = objc_alloc(MEMORY[0x24BDBFA88]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/SystemCustomization.bundle"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithEffectiveBundle:delegate:onQueue:", v8, v3, v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v5;

}

uint64_t __27___DKLocationMonitor_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "startMonitoringVisits");
}

uint64_t __26___DKLocationMonitor_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "stopMonitoringVisits");
}

void __35___DKLocationMonitor__handleVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __35___DKLocationMonitor__handleVisit___block_invoke_cold_1((uint64_t)v4, v5);
  }
  else
  {
    objc_msgSend(a2, "valueForKey:", CFSTR("identifier"));
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_219056000, v6, OS_LOG_TYPE_INFO, "_DKLocationMonitor LOIs nearby %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNearbyLOIIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v8);

  }
}

void __35___DKLocationMonitor__handleVisit___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_219056000, a2, OS_LOG_TYPE_ERROR, "_DKLocationMonitor CoreRoutine Fetch LOIs error: %@", (uint8_t *)&v2, 0xCu);
}

@end
