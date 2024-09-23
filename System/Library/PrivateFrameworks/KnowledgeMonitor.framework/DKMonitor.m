@implementation DKMonitor

void __26___DKMonitor_currentEvent__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

void __23___DKMonitor_saveState__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;

  v1 = a1 + 32;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(MEMORY[0x24BE1AFD0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(*(_QWORD *)v1 + 8), 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setData:forKey:", v3, v5);

    objc_msgSend(MEMORY[0x24BE1AFC8], "instrumentationChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __23___DKMonitor_saveState__block_invoke_cold_1(v1, v6);

  }
}

void __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v2 + 128);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke_2;
  v22 = &unk_24DA66D60;
  v23 = v2;
  v24 = *(id *)(a1 + 40);
  dispatch_sync(v4, &v19);
  if (!*(_QWORD *)(v3 + 8))
  {
    objc_msgSend(*(id *)(*(_QWORD *)v3 + 64), "removeObjectForKey:", CFSTR("kCurrentEvent"), v19, v20, v21, v22, v23);
LABEL_19:
    objc_msgSend(*(id *)v3, "instantHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(*(id *)v3, "instantHandler");
      v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)v3, "currentEvent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v17)[2](v17, v18);

    }
    goto LABEL_21;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v12 = 1;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(*(_QWORD *)v3 + 64), "objectForKeyedSubscript:", CFSTR("kCurrentEvent"), v19, v20, v21, v22, v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke_cold_1(v3, v10);
    goto LABEL_12;
  }
  if (!(*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))())
  {
    v12 = 0;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)v3, "filter");
  v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEndDate:", v8);

    objc_msgSend(*(id *)(a1 + 32), "historicalHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)v3, "historicalHandler");
      v10 = objc_claimAutoreleasedReturnValue();
      v25[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

LABEL_12:
    }
  }
  v12 = 1;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(*(_QWORD *)v3 + 48);
  *(_QWORD *)(*(_QWORD *)v3 + 48) = v13;

LABEL_16:
  v15 = objc_msgSend((id)objc_opt_class(), "shouldMergeUnchangedEvents");
  if (v12 || (v15 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)v3 + 64), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)v3 + 56), CFSTR("kCurrentEvent"), v19, v20, v21, v22, v23);
    if (v12)
      goto LABEL_19;
  }
LABEL_21:
  objc_msgSend(*(id *)v3, "saveState", v19, v20, v21, v22, v23);

}

uint64_t __18___DKMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareValue:");
}

uint64_t __18___DKMonitor_init__block_invoke_2()
{
  return 0;
}

void __23___DKMonitor_loadState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x219A29278]();
  objc_msgSend(MEMORY[0x24BE1AFD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "classesForSecureStateDecoding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setByAddingObjectsFromSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v15, v6, &v30);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v30;
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v16;

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __23___DKMonitor_loadState__block_invoke_cold_1((uint64_t)v17, v20, v21);

    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v22 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = CFSTR("kInstantState");
    v31[1] = CFSTR("kHistoricalState");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __43___DKMonitor_instantMonitorNeedsActivation__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_instantMonitorNeedsActivation");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __45___DKMonitor_instantMonitorNeedsDeactivation__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_instantMonitorNeedsDeactivation");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __35___DKMonitor_systemClockDidChange___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&systemClockDidChange__timebaseInfo);
}

void __35___DKMonitor_systemClockDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = mach_continuous_time();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "machTimeAtLastClockChange");
  v5 = (v2 - v4) * systemClockDidChange__timebaseInfo / *(unsigned int *)algn_253E857AC / 0x3B9ACA00;
  objc_msgSend(*(id *)(a1 + 32), "dateAtLastClockChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v6);
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v8 - v10;

  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v13;
    _os_log_impl(&dword_219056000, v12, OS_LOG_TYPE_INFO, "Time changed by %@ seconds.", (uint8_t *)&v15, 0xCu);

  }
  if (fabs(v11) > 60.0)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __35___DKMonitor_systemClockDidChange___block_invoke_2_cold_1(v14);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMachTimeAtLastClockChange:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setDateAtLastClockChange:", v3);

}

void __23___DKMonitor_loadState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_219056000, a2, a3, "Error unarchiving state: %@", (uint8_t *)&v3);
}

void __23___DKMonitor_saveState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;

  v4 = 136446466;
  v5 = "-[_DKMonitor saveState]_block_invoke";
  v6 = 2114;
  v7 = (id)OUTLINED_FUNCTION_2_0();
  v3 = v7;
  _os_log_debug_impl(&dword_219056000, a2, OS_LOG_TYPE_DEBUG, "%{public}s did _CDSharedMemoryKeyValueStore for %{public}@.", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_3();
}

void __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_0(), "eventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_0(&dword_219056000, a2, v4, "Requested the previousEvent from instantState in setCurrentEvent, but received nil in stream: %@.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3();
}

void __35___DKMonitor_systemClockDidChange___block_invoke_2_cold_1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v2;
  OUTLINED_FUNCTION_1_0(&dword_219056000, a1, v3, "Time changed by %@ seconds. Invalidating current event states.", (uint8_t *)&v4);

  OUTLINED_FUNCTION_3();
}

@end
