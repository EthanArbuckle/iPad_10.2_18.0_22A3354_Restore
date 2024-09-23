@implementation DKMDCSWorkoutMonitor

void __30___DKMDCSWorkoutMonitor_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE1B1E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BE1B180];
    v9 = v7;
    objc_msgSend(v8, "sessionState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    __HKWorkoutSessionStateName(2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "isEqualToString:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __30___DKMDCSWorkoutMonitor_start__block_invoke_cold_1((uint64_t)v6, v13);

  }
}

void __30___DKMDCSWorkoutMonitor_start__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_219056000, a2, OS_LOG_TYPE_ERROR, "MDCS Workout payload is not dictionary: %@", (uint8_t *)&v2, 0xCu);
}

@end
