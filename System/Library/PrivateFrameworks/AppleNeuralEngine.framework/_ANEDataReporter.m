@implementation _ANEDataReporter

+ (id)reportClient:(id)a3 modelName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  +[_ANEStrings coreAnalyticsANEUsageDefaultReportedClient](_ANEStrings, "coreAnalyticsANEUsageDefaultReportedClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && v6)
  {
    objc_msgSend(&unk_1E951E6E0, "objectForKeyedSubscript:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[_ANEStrings systemLibraryPath](_ANEStrings, "systemLibraryPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v10, &stru_1E9516758);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PrivateFrameworks/"), &stru_1E9516758);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Frameworks/"), &stru_1E9516758);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("/"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14
        || (objc_msgSend(v14, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v14, "count") > 1),
            (v16 = objc_claimAutoreleasedReturnValue()) == 0)
        || (v17 = (void *)v16,
            objc_msgSend(&unk_1E951E708, "objectForKeyedSubscript:", v16),
            v9 = (id)objc_claimAutoreleasedReturnValue(),
            v17,
            !v9))
      {
        v9 = v8;
      }

    }
    +[_ANEDataReporter addValue:forScalarKey:](_ANEDataReporter, "addValue:forScalarKey:", 1, v9);
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

+ (void)addValue:(int64_t)a3 forScalarKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)MEMORY[0x1D824DB90]();
  objc_msgSend(a1, "analyticsKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANEStrings coreAnalyticsANEUsageKeyGroup](_ANEStrings, "coreAnalyticsANEUsageKeyGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  AnalyticsSendEventLazy();

  objc_autoreleasePoolPop(v6);
}

+ (id)analyticsKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  +[_ANEStrings coreAnalyticsANEUsageKeyGroup](_ANEStrings, "coreAnalyticsANEUsageKeyGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)reportTelemetryToPPS:(id)a3 playload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D824DB90]();
  if (MEMORY[0x1E0D7FE60])
    v8 = MEMORY[0x1E0D7FE58] == 0;
  else
    v8 = 1;
  if (!v8)
  {
    if (reportTelemetryToPPS_playload__onceToken != -1)
      dispatch_once(&reportTelemetryToPPS_playload__onceToken, &__block_literal_global_0);
    objc_msgSend((id)reportTelemetryToPPS_playload__ppsIDMapping, "objectForKey:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10)
    {
      v20 = 0;
      -[NSObject getValue:](v10, "getValue:", &v20);
      v11 = v20;
      +[_ANELog common](_ANELog, "common");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13)
          +[_ANEDataReporter reportTelemetryToPPS:playload:].cold.4((uint64_t)v5, v12, v14, v15, v16, v17, v18, v19);

        PPSSendTelemetry();
        goto LABEL_20;
      }
      if (v13)
        +[_ANEDataReporter reportTelemetryToPPS:playload:].cold.3((uint64_t)v5, v12, v14, v15, v16, v17, v18, v19);
    }
    else
    {
      +[_ANELog common](_ANELog, "common");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[_ANEDataReporter reportTelemetryToPPS:playload:].cold.2((uint64_t)v5, v12);
    }

    goto LABEL_20;
  }
  +[_ANELog common](_ANELog, "common");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[_ANEDataReporter reportTelemetryToPPS:playload:].cold.1(v9);
LABEL_20:

  objc_autoreleasePoolPop(v7);
}

+ (void)reportErrorMsg:(unsigned int)a3 status:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v4 = *(_QWORD *)&a4;
  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("statusType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("returnType");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reportTelemetryToPPS:playload:", CFSTR("ANEStatus"), v8);

}

+ (void)reportTelemetryToPPS:(os_log_t)log playload:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D3352000, log, OS_LOG_TYPE_DEBUG, "PerfPowerServices not supported.", v1, 2u);
}

+ (void)reportTelemetryToPPS:(uint64_t)a1 playload:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D3352000, a2, OS_LOG_TYPE_ERROR, "Telemetry: invalid PPS category %@ specified!", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_6();
}

+ (void)reportTelemetryToPPS:(uint64_t)a3 playload:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3352000, a2, a3, "Telemetry: ppsId not available %@!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

+ (void)reportTelemetryToPPS:(uint64_t)a3 playload:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3352000, a2, a3, "Telemetry: report to category %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

@end
