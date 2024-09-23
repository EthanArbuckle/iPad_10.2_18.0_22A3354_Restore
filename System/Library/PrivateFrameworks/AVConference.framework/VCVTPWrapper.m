@implementation VCVTPWrapper

+ (void)startVTP
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  v3 = vtpRefCount;
  if (!vtpRefCount)
  {
    VTP_Initialize();
    v3 = vtpRefCount;
  }
  vtpRefCount = v3 + 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "+[VCVTPWrapper startVTP]";
      v10 = 1024;
      v11 = 23;
      v12 = 1024;
      v13 = vtpRefCount;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VTP refCount=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  objc_sync_exit(a1);
}

+ (void)stopVTP
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  if (vtpRefCount >= 1)
  {
    --vtpRefCount;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315906;
        v6 = v3;
        v7 = 2080;
        v8 = "+[VCVTPWrapper stopVTP]";
        v9 = 1024;
        v10 = 31;
        v11 = 1024;
        v12 = vtpRefCount;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VTP refCount=%d", (uint8_t *)&v5, 0x22u);
      }
    }
    if (!vtpRefCount)
      VTP_Cleanup();
  }
  objc_sync_exit(a1);
}

@end
