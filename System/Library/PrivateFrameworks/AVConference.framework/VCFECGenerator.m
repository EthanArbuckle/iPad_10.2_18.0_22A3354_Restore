@implementation VCFECGenerator

void ___VCFECGenerator_RegisterPeriodicReportingTask_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const __CFAllocator *v9;
  __CFDictionary *Mutable;
  uint64_t v11;
  int v12;
  unsigned __int8 *v13;
  CFStringRef v14;
  CFNumberRef v15;
  __CFDictionary *theDict;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (_QWORD *)(a2 + 96520);
    v5 = selectDestinationForRTMetrics();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v18 = v6;
          v19 = 2080;
          v20 = "_VCFECGenerator_PeriodicReportingTask";
          v21 = 1024;
          v22 = 408;
          v23 = 2112;
          v24 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCFECGenerator's payload='%@'", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        ___VCFECGenerator_RegisterPeriodicReportingTask_block_invoke_cold_1();
      }
    }
    theDict = (__CFDictionary *)v5;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 96592));
    if (*v4)
    {
      v11 = 0;
      v12 = 0;
      do
      {
        v13 = (unsigned __int8 *)(a2 + 2 * v11 + 96528);
        v14 = CFStringCreateWithFormat(v9, 0, CFSTR("%d"), *v13, theDict);
        *(_DWORD *)buf = v13[1];
        v15 = CFNumberCreate(v9, kCFNumberIntType, buf);
        CFDictionaryAddValue(Mutable, v14, v15);
        CFRelease(v14);
        CFRelease(v15);
        v11 = (unsigned __int16)++v12;
      }
      while (*v4 > (unint64_t)(unsigned __int16)v12);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 96592));
    CFDictionaryAddValue(theDict, CFSTR("VCFECGenVector"), Mutable);
    CFRelease(Mutable);
  }
}

void ___VCFECGenerator_RegisterPeriodicReportingTask_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "_VCFECGenerator_PeriodicReportingTask";
  OUTLINED_FUNCTION_4();
  v4 = 408;
  v5 = 2112;
  v6 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCFECGenerator's payload='%@'", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
