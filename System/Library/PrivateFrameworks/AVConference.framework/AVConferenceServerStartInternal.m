@implementation AVConferenceServerStartInternal

void __AVConferenceServerStartInternal_block_invoke()
{
  id v0;
  const char *v1;
  char *v2;
  os_log_t *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  const char *v7;
  char *v8;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v0 = +[AVCDaemonProcessInfo getDaemonProcessInfo](AVCDaemonProcessInfo, "getDaemonProcessInfo");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v1 = v0 ? (const char *)objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "mediaserverdProcessInfo=%s", v1);
    if (__str)
    {
      __lasts = 0;
      v2 = strtok_r(__str, "\n", &__lasts);
      v3 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v4 = VRTraceErrorLogLevelToCSTR();
          v5 = *v3;
          if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v15 = v4;
            v16 = 2080;
            v17 = "AVConferenceServerStartInternal_block_invoke";
            v18 = 1024;
            v19 = 199;
            v20 = 2080;
            v21 = "daemoninfo";
            v22 = 2080;
            v23 = v2;
            _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v2 = strtok_r(0, "\n", &__lasts);
      }
      while (v2);
      free(__str);
    }
  }
  v6 = +[VCDaemonProcessInfoManager copyProcessInfo](VCDaemonProcessInfoManager, "copyProcessInfo");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v7 = v6 ? (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "avconferencedProcessInfo=%s", v7);
    if (__str)
    {
      __lasts = 0;
      v8 = strtok_r(__str, "\n", &__lasts);
      v9 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v15 = v10;
            v16 = 2080;
            v17 = "AVConferenceServerStartInternal_block_invoke";
            v18 = 1024;
            v19 = 201;
            v20 = 2080;
            v21 = "daemoninfo";
            v22 = 2080;
            v23 = v8;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v8 = strtok_r(0, "\n", &__lasts);
      }
      while (v8);
      free(__str);
    }
  }

}

uint64_t __AVConferenceServerStartInternal_block_invoke_12()
{
  uint64_t result;
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[VCServerBag pullStoreBagKeys](VCServerBag, "pullStoreBagKeys");
  result = VCFeatureFlagManager_UseAvconferenced();
  if ((_DWORD)result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v1 = VRTraceErrorLogLevelToCSTR();
      v2 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v3 = 136315906;
        v4 = v1;
        v5 = 2080;
        v6 = "AVConferenceServer_RegisterWithControlCenter";
        v7 = 1024;
        v8 = 173;
        v9 = 2112;
        v10 = CFSTR("com.apple.facetime");
        _os_log_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STDynamicActivityAttributionPublisher app=%@", (uint8_t *)&v3, 0x26u);
      }
    }
    return objc_msgSend(MEMORY[0x1E0DB08D0], "setCurrentAttributionKey:andApp:", 0, CFSTR("com.apple.facetime"));
  }
  return result;
}

@end
