@implementation NSBundle(VCAdditions)

+ (uint64_t)plistFromDefaultOverride:()VCAdditions
{
  void *v3;
  uint64_t v4;

  v3 = (void *)VCDefaults_CopyStringValueForKey(a3);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[NSBundle(VCAdditions) plistFromDefaultOverride:].cold.2();
    }
    goto LABEL_10;
  }
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[NSBundle(VCAdditions) plistFromDefaultOverride:].cold.1();
    }
LABEL_10:
    v4 = 0;
  }

  return v4;
}

+ (uint64_t)plistForClass:()VCAdditions withPath:defaultOverride:
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:].cold.1(v17, v18);
    }
    return 0;
  }
  if (!a5)
    goto LABEL_21;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315906;
      v21 = v8;
      v22 = 2080;
      v23 = "+[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:]";
      v24 = 1024;
      v25 = 34;
      v26 = 2112;
      v27 = a5;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Loading plist from file: path=%@", (uint8_t *)&v20, 0x26u);
    }
  }
  v10 = objc_msgSend(MEMORY[0x1E0CB34D0], "plistFromDefaultOverride:", a5);
  if (!v10)
  {
LABEL_21:
    v11 = (void *)objc_msgSend(a4, "copy");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315906;
        v21 = v12;
        v22 = 2080;
        v23 = "+[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:]";
        v24 = 1024;
        v25 = 39;
        v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Loading plist from bundle: path=%@", (uint8_t *)&v20, 0x26u);
      }
    }
    v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a3), "pathForResource:ofType:", v11, CFSTR("plist"));
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v14);

    if (!v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = v15;
          v22 = 2080;
          v23 = "+[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:]";
          v24 = 1024;
          v25 = 45;
          v26 = 2112;
          v27 = a4;
          v28 = 2112;
          v29 = a5;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to load the resource at path=%@ defaultOverride=%@", (uint8_t *)&v20, 0x30u);
        }
      }
      return 0;
    }
  }
  return v10;
}

+ (void)plistFromDefaultOverride:()VCAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Configuration plist specified but the file could not be loaded: path=%@");
  OUTLINED_FUNCTION_3();
}

+ (void)plistFromDefaultOverride:()VCAdditions .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Configuration plist specified but the path is invalid: path=%@");
  OUTLINED_FUNCTION_3();
}

+ (void)plistForClass:()VCAdditions withPath:defaultOverride:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "+[NSBundle(VCAdditions) plistForClass:withPath:defaultOverride:]";
  v6 = 1024;
  v7 = 29;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d resourcePath is nil", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

@end
