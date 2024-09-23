@implementation VCVisualAlert

+ (void)start
{
  void *v2;
  NSString *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSArray *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  VCCameraTorchManager *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  int ErrorLogLevelForModule;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = start_visualAlertEnabled;
  if (!start_visualAlertEnabled)
  {
    v3 = -[NSString stringByAppendingPathComponent:](NSOpenStepRootDirectory(), "stringByAppendingPathComponent:", CFSTR("usr/lib/libAccessibility.dylib"));
    v4 = dlopen(-[NSString UTF8String](v3, "UTF8String"), 1);
    if (v4)
    {
      v2 = dlsym(v4, "_AXSVisualAlertEnabled");
      start_visualAlertEnabled = v2;
      if (!v2)
        goto LABEL_18;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136315906;
          v25 = v5;
          v26 = 2080;
          v27 = "+[VCVisualAlert start]";
          v28 = 1024;
          v29 = 30;
          v30 = 2080;
          v31 = -[NSString UTF8String](v3, "UTF8String");
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cannot open libAccessibility.dylib (%s)", (uint8_t *)&v24, 0x26u);
        }
      }
      v2 = start_visualAlertEnabled;
      if (!start_visualAlertEnabled)
      {
LABEL_18:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v24 = 136315650;
            v25 = v17;
            v26 = 2080;
            v27 = "+[VCVisualAlert start]";
            v28 = 1024;
            v29 = 56;
            v16 = " [%s] %s:%d VisualAlert not enabled or failed to load.";
            goto LABEL_21;
          }
        }
        return;
      }
    }
  }
  if (!((unsigned int (*)(void))v2)())
    goto LABEL_18;
  v7 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  if (-[NSArray count](v7, "count"))
  {
    v8 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0), "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks/VisualAlert.framework"));
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v8);
    if ((objc_msgSend(v9, "isLoaded") & 1) == 0)
    {
      v18 = objc_msgSend(v9, "load");
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v18)
      {
        if (ErrorLogLevelForModule < 7)
          goto LABEL_12;
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        v24 = 136315650;
        v25 = v20;
        v26 = 2080;
        v27 = "+[VCVisualAlert start]";
        v28 = 1024;
        v29 = 43;
        v22 = " [%s] %s:%d VisualAlert framework bundle loaded.";
      }
      else
      {
        if (ErrorLogLevelForModule < 5)
          goto LABEL_12;
        v23 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        v24 = 136315650;
        v25 = v23;
        v26 = 2080;
        v27 = "+[VCVisualAlert start]";
        v28 = 1024;
        v29 = 45;
        v22 = " [%s] %s:%d Failed to load VisualAlert framework bundle.";
      }
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v24, 0x1Cu);
    }
  }
LABEL_12:
  v10 = (void *)-[objc_class sharedVisualAlertManager](NSClassFromString(CFSTR("AXVisualAlertManager")), "sharedVisualAlertManager");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315906;
      v25 = v11;
      v26 = 2080;
      v27 = "+[VCVisualAlert start]";
      v28 = 1024;
      v29 = 50;
      v30 = 2112;
      v31 = (uint64_t)v10;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d visualAlertManager=%@", (uint8_t *)&v24, 0x26u);
    }
  }
  v13 = objc_alloc_init(VCCameraTorchManager);
  objc_msgSend(v10, "startForAlertTypes:cameraTorchManager:", 2, v13);

  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315650;
      v25 = v14;
      v26 = 2080;
      v27 = "+[VCVisualAlert start]";
      v28 = 1024;
      v29 = 54;
      v16 = " [%s] %s:%d Started AXVisualAlertManager";
LABEL_21:
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, 0x1Cu);
    }
  }
}

+ (void)stop
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)-[objc_class sharedVisualAlertManager](NSClassFromString(CFSTR("AXVisualAlertManager")), "sharedVisualAlertManager"), "stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = v2;
      v6 = 2080;
      v7 = "+[VCVisualAlert stop]";
      v8 = 1024;
      v9 = 67;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopped AXVisualAlertManager", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

@end
