@implementation VCDaemonProcessInfoManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_26);
  return (id)_vcDaemonProcessInfoManager;
}

void __43__VCDaemonProcessInfoManager_sharedManager__block_invoke()
{
  if (!_vcDaemonProcessInfoManager)
    _vcDaemonProcessInfoManager = objc_alloc_init(VCDaemonProcessInfoManager);
}

+ (id)copyProcessInfo
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "sharedManager"), "copyUniquePidInfo");
}

- (VCDaemonProcessInfoManager)init
{
  VCDaemonProcessInfoManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCDaemonProcessInfoManager;
  v2 = -[VCDaemonProcessInfoManager init](&v5, sel_init);
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCDaemonProcessInfoManager.xpcQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCDaemonProcessInfoManager deregisterBlocksForService](self, "deregisterBlocksForService");
  dispatch_release((dispatch_object_t)self->_xpcQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCDaemonProcessInfoManager;
  -[VCDaemonProcessInfoManager dealloc](&v3, sel_dealloc);
}

- (VCDaemonProcessInfoManager)allocWithZone:(_NSZone *)a3
{
  return (VCDaemonProcessInfoManager *)_vcDaemonProcessInfoManager;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)registerBlocksForService
{
  uint64_t v2;

  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E0C809B0], 3221225472, __54__VCDaemonProcessInfoManager_registerBlocksForService__block_invoke, &unk_1E9E53848, self, *MEMORY[0x1E0C80C00]), "registerBlockForService:block:queue:", "vcGetDaemonProcessInfo", &v2, self->_xpcQueue);
}

uint64_t __54__VCDaemonProcessInfoManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcGetDaemonProcessInfoUniquePid")))
    return objc_msgSend(*(id *)(a1 + 32), "copyUniquePidInfo");
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcDaemonProcessInfoAuditToken")))
    return 0;
  return objc_msgSend(*(id *)(a1 + 32), "copyAuditTokenInfo");
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcGetDaemonProcessInfo");
}

- (id)copyUniquePidInfo
{
  pid_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCDaemonProcessInfoManager *v25;
  __int128 buffer;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  buffer = 0u;
  v3 = getpid();
  if (proc_pidinfo(v3, 17, 1uLL, &buffer, 56) == 56)
  {
    v4 = 0;
    v5 = v27;
  }
  else
  {
    if ((VCDaemonProcessInfoManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCDaemonProcessInfoManager copyUniquePidInfo].cold.1(v7, v8);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCDaemonProcessInfoManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v17 = v9;
          v18 = 2080;
          v19 = "-[VCDaemonProcessInfoManager copyUniquePidInfo]";
          v20 = 1024;
          v21 = 124;
          v22 = 2112;
          v23 = v6;
          v24 = 2048;
          v25 = self;
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to fetch unique pid", buf, 0x30u);
        }
      }
    }
    v5 = -1;
    v4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCDaemonProcessInfo"), -1, 0);
  }
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5, CFSTR("avcKeyDaemonProcessInfoUniquePID"));
  v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1), "mutableCopy");
  v12 = v11;
  if (v4)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("avcKeyDaemonProcessInfoError"));
  return v12;
}

- (id)copyAuditTokenInfo
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = v2;
  v10[1] = v2;
  VCUtil_AuditTokenForCurrentProcess(v10);
  if (VCUtil_AuditTokenValid((uint64_t)v10))
  {
    v3 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10, 32);
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCDaemonProcessInfo"), -2, 0);
    v3 = 0;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v6 = v5;
  if (v3)
  {
    v7 = CFSTR("vcDaemonProcessInfoAuditToken");
    v8 = v3;
LABEL_8:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);
    return v6;
  }
  if (v4)
  {
    v7 = CFSTR("ERROR");
    v8 = v4;
    goto LABEL_8;
  }
  return v6;
}

- (void)copyUniquePidInfo
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
  v5 = "-[VCDaemonProcessInfoManager copyUniquePidInfo]";
  v6 = 1024;
  v7 = 124;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to fetch unique pid", (uint8_t *)&v2, 0x1Cu);
}

@end
