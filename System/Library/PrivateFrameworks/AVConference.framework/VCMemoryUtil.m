@implementation VCMemoryUtil

void __VCMemoryUtil_IsProbabilisticGuardMallocEnabled_block_invoke()
{
  const char *zone_name;
  _BOOL8 v1;
  _BOOL4 BoolValueForKey;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  zone_name = malloc_get_zone_name(*(malloc_zone_t **)*MEMORY[0x1E0C83FC0]);
  if (zone_name)
    v1 = strcmp(zone_name, "ProbGuardMallocZone") == 0;
  else
    v1 = 0;
  VCMemoryUtil_IsProbabilisticGuardMallocEnabled_isProbabilisticGuardMallocEnabled = v1;
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("forceProbabilisticGuardMallocMode"), v1);
  VCMemoryUtil_IsProbabilisticGuardMallocEnabled_isProbabilisticGuardMallocEnabled = BoolValueForKey;
  if (BoolValueForKey && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "VCMemoryUtil_IsProbabilisticGuardMallocEnabled_block_invoke";
      v9 = 1024;
      v10 = 26;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Probabilistic Guard Malloc enabled", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __VCMemoryUtil_IsAddressSanitizerEnabled_block_invoke()
{
  char *zone_name;
  _BOOL8 v1;
  _BOOL4 BoolValueForKey;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  zone_name = (char *)malloc_get_zone_name(*(malloc_zone_t **)*MEMORY[0x1E0C83FC0]);
  if (zone_name)
    v1 = strstr(zone_name, "asan") != 0;
  else
    v1 = 0;
  VCMemoryUtil_IsAddressSanitizerEnabled_isASANEnabled = v1;
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("forceASANMode"), v1);
  VCMemoryUtil_IsAddressSanitizerEnabled_isASANEnabled = BoolValueForKey;
  if (BoolValueForKey && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "VCMemoryUtil_IsAddressSanitizerEnabled_block_invoke";
      v9 = 1024;
      v10 = 40;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ASAN mode detected", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

@end
