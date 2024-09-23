@implementation MXSourceUtilities

+ (id)regionFormat
{
  if (regionFormat_onceToken != -1)
    dispatch_once(&regionFormat_onceToken, &__block_literal_global);
  return (id)regionFormat_regionFormat;
}

void __33__MXSourceUtilities_regionFormat__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v2 = v0;
    objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
      objc_storeStrong((id *)&regionFormat_regionFormat, v1);

    v0 = v2;
  }

}

+ (BOOL)isMetricKitClient:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;

  v3 = a3;
  v14 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v3, &v14);
  v5 = v14;
  if (v5)
  {
    _MXSourceUtilitiesLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MXSourceUtilities isMetricKitClient:].cold.2();
  }
  else
  {
    if (!v4)
      goto LABEL_9;
    _MXSourceUtilitiesLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[MXSourceUtilities isMetricKitClient:].cold.1();

    objc_msgSend(v4, "containingBundleRecord");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject bundleIdentifier](v6, "bundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
  }

LABEL_9:
  v9 = (void *)CFPreferencesCopyValue(CFSTR("MXClientDataRetrieved"), CFSTR("com.apple.metrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)isMetricKitClient:(id)a3 forUser:(unsigned int)a4
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v15;

  v4 = a3;
  v15 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v4, &v15);
  v6 = v15;
  if (v6)
  {
    _MXSourceUtilitiesLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[MXSourceUtilities isMetricKitClient:].cold.2();
    v8 = v4;
  }
  else
  {
    v8 = v4;
    if (!v5)
      goto LABEL_10;
    _MXSourceUtilitiesLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[MXSourceUtilities isMetricKitClient:].cold.1();

    objc_msgSend(v5, "containingBundleRecord");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject bundleIdentifier](v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:
  v10 = (void *)CFPreferencesCopyValue(CFSTR("MXClientDataRetrieved"), CFSTR("com.apple.metrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isAppAnalyticsEnabled
{
  if (isAppAnalyticsEnabled_onceToken != -1)
    dispatch_once(&isAppAnalyticsEnabled_onceToken, &__block_literal_global_9);
  return isAppAnalyticsEnabled_appAnalyticsEnabled;
}

uint64_t __42__MXSourceUtilities_isAppAnalyticsEnabled__block_invoke()
{
  uint64_t result;

  result = AppAnalyticsEnabled();
  isAppAnalyticsEnabled_appAnalyticsEnabled = result;
  return result;
}

+ (BOOL)anyClientsAvailable
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("MXClientsAvailable"), CFSTR("com.apple.metrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

+ (id)getSignpostDataforPid:(int)a3 forClient:(id)a4 andEventTimestamp:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[16];
  _BYTE v60[32];
  uint64_t v61;

  v6 = *(_QWORD *)&a3;
  v61 = *MEMORY[0x24BDAC8D0];
  v45 = a4;
  v7 = a5;
  if ((_DWORD)v6)
  {
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy_;
    v57 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BE906A0]);
    v9 = objc_alloc_init(MEMORY[0x24BE90698]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addPIDNumber:", v10);

    objc_msgSend(v8, "addSubsystem:category:", CFSTR("com.apple.metrickit.log"), 0);
    v11 = objc_alloc_init(MEMORY[0x24BE90690]);
    objc_msgSend(v11, "setSubsystemCategoryFilter:", v8);
    objc_msgSend(v11, "setPidFilter:", v9);
    v12 = MEMORY[0x24BDAC760];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke;
    v50[3] = &unk_24D560E20;
    v13 = v45;
    v51 = v13;
    v52 = &v53;
    objc_msgSend(v11, "setEmitEventProcessingBlock:", v50);
    v47[0] = v12;
    v47[1] = 3221225472;
    v47[2] = __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_29;
    v47[3] = &unk_24D560E48;
    v48 = v13;
    v49 = &v53;
    objc_msgSend(v11, "setIntervalCompletionProcessingBlock:", v47);
    v14 = v7;
    objc_msgSend(v14, "dateByAddingTimeInterval:", -5.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v16, "setLocale:", v17);
    objc_msgSend(v16, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    v18 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v16, "stringFromDate:", v15);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromDate:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:].cold.5(v20, v21, (uint64_t)v60);
    }

    v46 = 0;
    v22 = objc_msgSend(v11, "processLogArchiveWithPath:startDate:endDate:errorOut:", 0, v15, v14, &v46);
    v23 = v46;
    if ((v22 & 1) != 0)
    {
      v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v24)
        +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:].cold.3(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    else
    {
      _MXSourceUtilitiesLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v23, "description");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:].cold.4(v35, buf, v34);
      }

    }
    if (objc_msgSend((id)v54[5], "count", v45))
    {
      v33 = (id)v54[5];
    }
    else
    {
      v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v36)
        +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:].cold.2(v36, v37, v38, v39, v40, v41, v42, v43);
      v33 = 0;
    }

    _Block_object_dispose(&v53, 8);
  }
  else
  {
    _MXSourceUtilitiesLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:].cold.1(v32);

    v33 = 0;
  }

  return v33;
}

uint64_t __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  id v24;

  v3 = a2;
  objc_msgSend(v3, "processImagePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_2();
    v24 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();

  }
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") < 0x64)
  {
    v16 = objc_alloc(MEMORY[0x24BDDE678]);
    objc_msgSend(v3, "subsystem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "category");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = 0;
    v21 = (void *)objc_msgSend(v16, "initWithSubSystem:category:name:beginTimeStamp:endTimeStamp:duration:isInterval:", v17, v18, v19, v20, 0, 0, v23);

    if (v21)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v21);

  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v8)
      __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  return 1;
}

id __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_22(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("clientOfInterest");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v3 = a2;
  objc_msgSend(v3, "endEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processImagePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_29_cold_2();
    v34 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();

  }
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") < 0x64)
  {
    v31 = v8;
    v32 = v7;
    v33 = v6;
    v17 = objc_alloc(MEMORY[0x24BDDE678]);
    objc_msgSend(v3, "subsystem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "category");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x24BDD1660]);
    objc_msgSend(v3, "durationMs");
    v25 = v24;
    objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v23, "initWithDoubleValue:unit:", v26, v25);
    LOBYTE(v30) = 1;
    v28 = (void *)objc_msgSend(v17, "initWithSubSystem:category:name:beginTimeStamp:endTimeStamp:duration:isInterval:", v18, v19, v20, v21, v22, v27, v30);

    if (v28)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v28);

    v7 = v32;
    v6 = v33;
    v8 = v31;
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v9)
      __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  return 1;
}

id __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_30(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("clientOfInterest");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)isMetricKitClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_8_0();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(v1, v2), "containingBundleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_21642F000, v0, v5, "The client %@ is an app Extension checking metrickit subscription for main app's bundleID %@", v6);

  OUTLINED_FUNCTION_1_0();
}

+ (void)isMetricKitClient:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(v0, v1), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_21642F000, v3, v4, "Failed to create bundle record for bundleID %@ and error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)getSignpostDataforPid:(os_log_t)log forClient:andEventTimestamp:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21642F000, log, OS_LOG_TYPE_ERROR, "pid passed for reading MXsignpost was nill", v1, 2u);
  OUTLINED_FUNCTION_5();
}

+ (void)getSignpostDataforPid:(uint64_t)a3 forClient:(uint64_t)a4 andEventTimestamp:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_21642F000, MEMORY[0x24BDACB70], a3, "Final count of signpostData array was zero", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)getSignpostDataforPid:(uint64_t)a3 forClient:(uint64_t)a4 andEventTimestamp:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_21642F000, MEMORY[0x24BDACB70], a3, "MXSignpost Readback started successfully", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)getSignpostDataforPid:(void *)a1 forClient:(uint8_t *)buf andEventTimestamp:(os_log_t)log .cold.4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21642F000, log, OS_LOG_TYPE_ERROR, "MXSignpost Readback failed to start with error %@", buf, 0xCu);

}

+ (void)getSignpostDataforPid:(void *)a1 forClient:(void *)a2 andEventTimestamp:(uint64_t)a3 .cold.5(void *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_0(&dword_21642F000, MEMORY[0x24BDACB70], a3, "Reading signposts with Start Timestamp : %@ and End Timestamp %@", (uint8_t *)a3);

}

void __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_21642F000, MEMORY[0x24BDACB70], a3, "Maximum number of signpost instances recorded ignoring more signpost data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_cold_2()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_21642F000, MEMORY[0x24BDACB70], v0, "The bundleID of the process which emitted this signpost event :%@ client of interest : %@ Mismatch detected ignoring this interval", v1);
}

void __71__MXSourceUtilities_getSignpostDataforPid_forClient_andEventTimestamp___block_invoke_29_cold_2()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_21642F000, MEMORY[0x24BDACB70], v0, "The bundleID of the process which emitted this signpost interval :%@ client of interest : %@ Mismatch detected ignoring this interval", v1);
}

@end
