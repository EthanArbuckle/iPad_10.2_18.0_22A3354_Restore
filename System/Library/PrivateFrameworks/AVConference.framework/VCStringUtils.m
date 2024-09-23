@implementation VCStringUtils

+ (BOOL)convertString:(id)a3 toFourcc:(unsigned int *)a4
{
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;

  if (a4)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(a3, "length") == 4)
        {
          *a4 = CStrToFourcc((char *)objc_msgSend(a3, "UTF8String"));
          LOBYTE(v6) = 1;
          return v6;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *MEMORY[0x1E0CF2758];
          v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v6)
            return v6;
          +[VCStringUtils convertString:toFourcc:].cold.3(v7, a3, v8);
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        +[VCStringUtils convertString:toFourcc:].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      +[VCStringUtils convertString:toFourcc:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v6)
      return v6;
    +[VCStringUtils convertString:toFourcc:].cold.1();
  }
  LOBYTE(v6) = 0;
  return v6;
}

+ (void)convertString:toFourcc:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d fourcc pointer is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)convertString:toFourcc:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d fourccString is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)convertString:(NSObject *)a3 toFourcc:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "length");
  v7 = 136316162;
  v8 = a1;
  OUTLINED_FUNCTION_1();
  v9 = 22;
  v10 = 2112;
  v11 = a2;
  v12 = 2048;
  v13 = v6;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid fourcc string=%@ length=%lu", (uint8_t *)&v7, 0x30u);
}

+ (void)convertString:toFourcc:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid fourcc string class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
