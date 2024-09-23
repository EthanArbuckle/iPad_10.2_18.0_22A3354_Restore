@implementation CSRestrictionFactory

+ (id)restrictionForClass:(id)a3 withProperties:(id)a4 errors:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSRestrictionFactory"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CSRestrictionFactory restrictionForClass:withProperties:errors:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("CPUTimeRestriction")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("CPUTimeRestrictionBand")))
    {
      +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:](CSRestrictionFactory, "_cpuTimeRestrictionWithBand:errors:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  +[CSRestrictionFactory _cpuTimeRestrictionWithProperties:errors:](CSRestrictionFactory, "_cpuTimeRestrictionWithProperties:errors:", v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v19 = (void *)v10;
LABEL_11:

  return v19;
}

+ (id)_cpuTimeRestrictionWithProperties:(id)a3 errors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  CSCPUTimeRestriction *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a4;
  v6 = a3;
  CSNumberForKeyWithErrors(v6, CFSTR("Threshold"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CSNumberForKeyWithErrors(v6, CFSTR("TimeWindow"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !v8)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_11:
        v9 = 0;
        goto LABEL_12;
      }
      +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSRestrictionFactory"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CSRestrictionFactory _cpuTimeRestrictionWithProperties:errors:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSRestrictionFactory"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CSRestrictionFactory _cpuTimeRestrictionWithProperties:errors:].cold.1(v10, v18, v19, v20, v21, v22, v23, v24);
    }

    goto LABEL_11;
  }
  v9 = -[CSCPUTimeRestriction initWithThreshold:andTimeWindow:]([CSCPUTimeRestriction alloc], "initWithThreshold:andTimeWindow:", v7, v8);
LABEL_12:

  return v9;
}

+ (id)_cpuTimeRestrictionWithBand:(id)a3 errors:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CSCPUTimeRestriction *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CSCPUTimeRestriction *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CSCPUTimeRestriction *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a3;
  v6 = a4;
  if (!_cpuTimeRestrictionWithBand_errors__restrictionsByBand)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_cpuTimeRestrictionWithBand_errors__restrictionsByBand;
    _cpuTimeRestrictionWithBand_errors__restrictionsByBand = v7;

  }
  CSNumberForKeyWithErrors(v5, CFSTR("Band"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_cpuTimeRestrictionWithBand_errors__restrictionsByBand, "objectForKey:", v9);
  v10 = (CSCPUTimeRestriction *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (objc_msgSend(v9, "isEqualToNumber:", &unk_250A1A8B8))
    {
      +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSRestrictionFactory"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

      v19 = [CSCPUTimeRestriction alloc];
      v20 = &unk_250A1A8D0;
LABEL_16:
      v10 = -[CSCPUTimeRestriction initWithThreshold:andTimeWindow:](v19, "initWithThreshold:andTimeWindow:", v20, &unk_250A1A8E8);
      objc_msgSend((id)_cpuTimeRestrictionWithBand_errors__restrictionsByBand, "setObject:forKeyedSubscript:", v10, v9);
      goto LABEL_17;
    }
    if (objc_msgSend(v9, "isEqualToNumber:", &unk_250A1A900))
    {
      +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSRestrictionFactory"));
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

      v19 = [CSCPUTimeRestriction alloc];
      v20 = &unk_250A1A918;
      goto LABEL_16;
    }
    v29 = objc_msgSend(v9, "isEqualToNumber:", &unk_250A1A930);
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSRestrictionFactory"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);

      v19 = [CSCPUTimeRestriction alloc];
      v20 = &unk_250A1A948;
      goto LABEL_16;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[CSRestrictionFactory _cpuTimeRestrictionWithBand:errors:].cold.4((uint64_t)v9, v31, v41, v42, v43, v44, v45, v46);

    v10 = 0;
  }
LABEL_17:
  v39 = v10;

  return v39;
}

+ (void)restrictionForClass:(uint64_t)a3 withProperties:(uint64_t)a4 errors:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_2383F5000, a1, a3, "Empty/Nil restrictionType: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_cpuTimeRestrictionWithProperties:(uint64_t)a3 errors:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_2383F5000, a1, a3, "Detected misconfigured cpuTime restriction with unknown threshold: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_cpuTimeRestrictionWithProperties:(uint64_t)a3 errors:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_2383F5000, a1, a3, "Detected misconfigured cpuTime restriction with unknown timeWindow: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_cpuTimeRestrictionWithBand:(uint64_t)a3 errors:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2383F5000, a1, a3, "ByBand: Allocating for Band1", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_cpuTimeRestrictionWithBand:(uint64_t)a3 errors:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2383F5000, a1, a3, "ByBand: Allocating for Band2", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_cpuTimeRestrictionWithBand:(uint64_t)a3 errors:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2383F5000, a1, a3, "ByBand: Allocating for Band3", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_cpuTimeRestrictionWithBand:(uint64_t)a3 errors:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_2383F5000, a2, a3, "Detected misconfigured cpuTime band restriction with unknown band: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
