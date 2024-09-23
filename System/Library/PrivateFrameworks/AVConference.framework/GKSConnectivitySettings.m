@implementation GKSConnectivitySettings

+ (id)getAllSettings
{
  void *v2;

  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", g_Settings);
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  return v2;
}

+ (void)setAddress:(id)a3 forService:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v6;
      v11 = 2080;
      v12 = "+[GKSConnectivitySettings setAddress:forService:]";
      v13 = 1024;
      v14 = 435;
      v15 = 2112;
      v16 = a4;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings: %@ => %@", (uint8_t *)&v9, 0x30u);
    }
  }
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  v8 = (id)g_Settings;
  if (!g_Settings)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    g_Settings = (uint64_t)v8;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", a3, a4);
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("GKSConnSettingsUpdate"), 0);
}

+ (id)readStorebagValueForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 defaultValue:(id)a5 isDoubleType:(BOOL)a6
{
  return +[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", a3, a4, a5, a6);
}

+ (void)setServerAddresses:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = v4;
      v13 = 2080;
      v14 = "+[GKSConnectivitySettings setServerAddresses:]";
      v15 = 1024;
      v16 = 458;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings: set server: %@", (uint8_t *)&v11, 0x26u);
    }
  }
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  if (!g_Settings)
  {
    g_Settings = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = objc_msgSend((id)(id)CFPreferencesCopyAppValue(CFSTR("specialAllocForHeapInspection"), CFSTR("com.apple.VideoConference")), "BOOLValue");
    g_bSpecialAllocForHeapInspection = v6;
    if (v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315650;
          v12 = v7;
          v13 = 2080;
          v14 = "+[GKSConnectivitySettings setServerAddresses:]";
          v15 = 1024;
          v16 = 466;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d  **** GKSConnectivitySettings:setServerAddresses: \"Special Allocation For Heap Inspection\" has been enabled.", (uint8_t *)&v11, 0x1Cu);
        }
      }
    }
  }
  v9 = g_cacheClearTime;
  if (*(double *)&g_cacheClearTime == 0.0)
  {
    *(double *)&v9 = micro();
    g_cacheClearTime = v9;
  }
  if (g_bSpecialAllocForHeapInspection)
  {
    v10 = (void *)objc_msgSend(a3, "copyGKSDeep", *(double *)&v9);
    objc_msgSend((id)g_Settings, "addEntriesFromDictionary:", v10);

  }
  else
  {
    objc_msgSend((id)g_Settings, "addEntriesFromDictionary:", a3, *(double *)&v9);
  }
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("GKSConnSettingsUpdate"), 0);
}

+ (void)setClientOptions:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "+[GKSConnectivitySettings setClientOptions:]";
      v11 = 1024;
      v12 = 495;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings: set client: %@", (uint8_t *)&v7, 0x26u);
    }
  }
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  v6 = (id)g_Settings;
  if (!g_Settings)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    g_Settings = (uint64_t)v6;
  }
  objc_msgSend(v6, "addEntriesFromDictionary:", a3);
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("GKSConnSettingsUpdate"), 0);
}

+ (id)getClientOption:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  v4 = (id)objc_msgSend((id)g_Settings, "objectForKeyedSubscript:", a3);
  if (!v4)
  {
    if (objc_msgSend(a3, "compare:", CFSTR("staticnattypefromcarrierbundle")))
    {
      if (objc_msgSend(a3, "compare:", CFSTR("keepalivetimeoutfromcarrierbundle")))
      {
        v4 = 0;
        goto LABEL_8;
      }
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = +[GKSConnectivitySettings getKeepAliveTimeoutFromCarrierBundle](GKSConnectivitySettings, "getKeepAliveTimeoutFromCarrierBundle");
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = +[GKSConnectivitySettings getNATTypeFromCarrierBundle](GKSConnectivitySettings, "getNATTypeFromCarrierBundle");
    }
    v4 = (id)objc_msgSend(v5, "numberWithInt:", v6);
    objc_msgSend((id)g_Settings, "setObject:forKeyedSubscript:", v4, a3);
  }
LABEL_8:
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  return v4;
}

+ (id)getAddressForService:(id)a3
{
  id v4;

  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  v4 = (id)objc_msgSend((id)g_Settings, "objectForKeyedSubscript:", a3);
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  return v4;
}

+ (tagIPPORT)getCachedIPPort
{
  tagIPPORT *v2;
  __int128 v3;
  __int128 v4;
  NSObject *global_queue;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int dwIPv4;
  int wPort;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (tagIPPORT *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL);
  if (!v2)
    return v2;
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  if (g_cachedCommNATServer)
  {
    if ((*(_BYTE *)g_cachedCommNATServer & 1) != 0)
    {
      if (*(_QWORD *)(g_cachedCommNATServer + 20) != *MEMORY[0x1E0C83920]
        || *(_QWORD *)(g_cachedCommNATServer + 28) != *(_QWORD *)(MEMORY[0x1E0C83920] + 8))
      {
        goto LABEL_5;
      }
    }
    else if (*(_DWORD *)(g_cachedCommNATServer + 20))
    {
LABEL_5:
      v3 = *(_OWORD *)g_cachedCommNATServer;
      v4 = *(_OWORD *)(g_cachedCommNATServer + 16);
      *(_QWORD *)&v2->IP.abIPv6[12] = *(_QWORD *)(g_cachedCommNATServer + 32);
      *(_OWORD *)&v2->iFlags = v3;
      *(_OWORD *)&v2->szIfName[12] = v4;
      pthread_mutex_unlock(&g_xGKSConnectivitySettings);
LABEL_15:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          dwIPv4 = v2->IP.dwIPv4;
          wPort = v2->wPort;
          v16 = 136316162;
          v17 = v9;
          v18 = 2080;
          v19 = "+[GKSConnectivitySettings getCachedIPPort]";
          v20 = 1024;
          v21 = 568;
          v22 = 1024;
          v23 = dwIPv4;
          v24 = 1024;
          v25 = wPort;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getCachedIPPort: %08X:%u", (uint8_t *)&v16, 0x28u);
        }
      }
      return v2;
    }
  }
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_6);
  free(v2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = v7;
      v18 = 2080;
      v19 = "+[GKSConnectivitySettings getCachedIPPort]";
      v20 = 1024;
      v21 = 559;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings: prepare to enter getIPPortForService", (uint8_t *)&v16, 0x1Cu);
    }
  }
  v2 = +[GKSConnectivitySettings getIPPortForService:](GKSConnectivitySettings, "getIPPortForService:", CFSTR("gk-commnat-main0"));
  if (v2)
    goto LABEL_15;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = v13;
      v18 = 2080;
      v19 = "+[GKSConnectivitySettings getCachedIPPort]";
      v20 = 1024;
      v21 = 570;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getCachedIPPort failed", (uint8_t *)&v16, 0x1Cu);
    }
  }
  return 0;
}

void __42__GKSConnectivitySettings_getCachedIPPort__block_invoke()
{
  tagIPPORT *v0;

  v0 = +[GKSConnectivitySettings getIPPortForService:](GKSConnectivitySettings, "getIPPortForService:", CFSTR("gk-commnat-main0-name"));
  if (v0)
    free(v0);
}

+ (tagIPPORT)getIPPortForService:(id)a3
{
  id v4;
  tagIPPORT *v5;
  tagIPPORT *v6;
  id v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  const char *v12;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int dwIPv4;
  int wPort;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  in_addr_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  unsigned int v33;
  int v34;
  _BYTE v36[24];
  __int128 v37;
  unsigned int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = (tagIPPORT *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_43;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_43;
    if (a3)
      v22 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    else
      v22 = "<nil>";
    *(_DWORD *)v36 = 136315906;
    *(_QWORD *)&v36[4] = v20;
    *(_WORD *)&v36[12] = 2080;
    *(_QWORD *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
    *(_WORD *)&v36[22] = 1024;
    LODWORD(v37) = 581;
    WORD2(v37) = 2080;
    *(_QWORD *)((char *)&v37 + 6) = v22;
    v32 = " [%s] %s:%d GKSConnSettings getIPPortForService: %s == 00";
LABEL_42:
    _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v32, v36, 0x26u);
    goto LABEL_43;
  }
  v6 = v5;
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  v7 = (id)objc_msgSend((id)g_Settings, "objectForKeyedSubscript:", a3);
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  if (!v7)
  {
    free(v6);
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_43;
    v23 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_43;
    if (a3)
      v24 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    else
      v24 = "<nil>";
    *(_DWORD *)v36 = 136315906;
    *(_QWORD *)&v36[4] = v23;
    *(_WORD *)&v36[12] = 2080;
    *(_QWORD *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
    *(_WORD *)&v36[22] = 1024;
    LODWORD(v37) = 591;
    WORD2(v37) = 2080;
    *(_QWORD *)((char *)&v37 + 6) = v24;
    v32 = " [%s] %s:%d GKSConnSettings getIPPortForService: %s == nil";
    goto LABEL_42;
  }
  v8 = strdup((const char *)objc_msgSend(v7, "UTF8String"));

  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v36 = 136315906;
        *(_QWORD *)&v36[4] = v9;
        *(_WORD *)&v36[12] = 2080;
        *(_QWORD *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
        *(_WORD *)&v36[22] = 1024;
        LODWORD(v37) = 598;
        WORD2(v37) = 2080;
        *(_QWORD *)((char *)&v37 + 6) = v8;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getIPPortForService: GKS setting for get SNATMAP IP: %s", v36, 0x26u);
      }
    }
    v11 = strchr(v8, 58);
    if (!v11)
      goto LABEL_30;
    *v11 = 0;
    v12 = v11 + 1;
    atoi(v11 + 1);
    if (MakeIPPORTWithHostnameIPv4Only())
    {
      if (objc_msgSend(a3, "isEqualToString:", CFSTR("gk-commnat-main0-name")))
      {
        pthread_mutex_lock(&g_xGKSConnectivitySettings);
        v13 = (_QWORD *)g_cachedCommNATServer;
        if (g_cachedCommNATServer
          || (v13 = malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL), (g_cachedCommNATServer = (uint64_t)v13) != 0))
        {
          v14 = *(_OWORD *)&v6->iFlags;
          v15 = *(_OWORD *)&v6->szIfName[12];
          v13[4] = *(_QWORD *)&v6->IP.abIPv6[12];
          *(_OWORD *)v13 = v14;
          *((_OWORD *)v13 + 1) = v15;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v16 = VRTraceErrorLogLevelToCSTR();
            v17 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              dwIPv4 = v6->IP.dwIPv4;
              wPort = v6->wPort;
              *(_DWORD *)v36 = 136316162;
              *(_QWORD *)&v36[4] = v16;
              *(_WORD *)&v36[12] = 2080;
              *(_QWORD *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
              *(_WORD *)&v36[22] = 1024;
              LODWORD(v37) = 625;
              WORD2(v37) = 1024;
              *(_DWORD *)((char *)&v37 + 6) = dwIPv4;
              WORD5(v37) = 1024;
              HIDWORD(v37) = wPort;
              _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getIPPortForService: cached %08X:%u", v36, 0x28u);
            }
          }
        }
        pthread_mutex_unlock(&g_xGKSConnectivitySettings);
      }
      goto LABEL_30;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v36 = 136315906;
        *(_QWORD *)&v36[4] = v25;
        *(_WORD *)&v36[12] = 2080;
        *(_QWORD *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
        *(_WORD *)&v36[22] = 1024;
        LODWORD(v37) = 603;
        WORD2(v37) = 2080;
        *(_QWORD *)((char *)&v37 + 6) = v8;
        _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getIPPortForService: %s failed to resolve", v36, 0x26u);
      }
    }
    v27 = inet_addr(v8);
    v28 = strtol(v12, 0, 10);
    if (v27 != -1 && v28)
    {
      v6->IP.dwIPv4 = bswap32(v27);
      v6->wPort = v28;
LABEL_30:
      free(v8);
      goto LABEL_31;
    }
    free(v6);
    free(v8);
LABEL_43:
    v6 = 0;
    goto LABEL_44;
  }
LABEL_31:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v31 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v31 = "<nil>";
      v33 = v6->IP.dwIPv4;
      v34 = v6->wPort;
      *(_DWORD *)v36 = 136316418;
      *(_QWORD *)&v36[4] = v29;
      *(_WORD *)&v36[12] = 2080;
      *(_QWORD *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
      *(_WORD *)&v36[22] = 1024;
      LODWORD(v37) = 632;
      WORD2(v37) = 2080;
      *(_QWORD *)((char *)&v37 + 6) = v31;
      HIWORD(v37) = 1024;
      v38 = v33;
      v39 = 1024;
      v40 = v34;
      _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getIPPortForService: %s == %08X:%u", v36, 0x32u);
    }
  }
LABEL_44:
  objc_msgSend(v4, "drain", *(_OWORD *)v36, *(_QWORD *)&v36[16], v37);
  return v6;
}

+ (void)clearAllSettingsWithRefreshIntervalInSeconds:(int)a3
{
  double v4;
  double v5;
  double v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = micro();
  v5 = (double)a3;
  v6 = *(double *)&g_cacheClearTime + (double)a3;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 <= v6)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316418;
        v13 = v10;
        v14 = 2080;
        v15 = "+[GKSConnectivitySettings clearAllSettingsWithRefreshIntervalInSeconds:]";
        v16 = 1024;
        v17 = 654;
        v18 = 1024;
        v19 = (int)(*(double *)&g_cacheClearTime + v5 - v4);
        v20 = 2048;
        v21 = g_cacheClearTime;
        v22 = 2048;
        v23 = v4;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Not yet to clear the locally cached serverbag settings. Still %d seconds left [cacheClearTime: %f, now %f]", (uint8_t *)&v12, 0x36u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316418;
        v13 = v8;
        v14 = 2080;
        v15 = "+[GKSConnectivitySettings clearAllSettingsWithRefreshIntervalInSeconds:]";
        v16 = 1024;
        v17 = 648;
        v18 = 1024;
        v19 = a3;
        v20 = 2048;
        v21 = g_cacheClearTime;
        v22 = 2048;
        v23 = v4;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clear the locally cached serverbag settings with interval %d seconds [cacheClearTime: %f, now %f]", (uint8_t *)&v12, 0x36u);
      }
    }
    pthread_mutex_lock(&g_xGKSConnectivitySettings);
    objc_msgSend((id)g_Settings, "removeAllObjects");
    g_cacheClearTime = *(_QWORD *)&v4;
    pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  }
}

+ (int)getNATTypeFromCarrierBundle
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  if (!VCCarrierBundle_QueryCarrierBundleValueForKey((uint64_t)CFSTR("StaticNATType"), &v8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      v2 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v2;
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "+[GKSConnectivitySettings getNATTypeFromCarrierBundle]";
      v13 = 1024;
      v14 = 672;
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No key 'StaticNATType' in carrier bundle: using default (0x%08x)", buf, 0x22u);
    }
    return 0;
  }
  v2 = objc_msgSend(v8, "intValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v3;
      v11 = 2080;
      v12 = "+[GKSConnectivitySettings getNATTypeFromCarrierBundle]";
      v13 = 1024;
      v14 = 670;
      v15 = 1024;
      v16 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Read key 'StaticNATType' from carrier bundle: 0x%08x", buf, 0x22u);
    }
  }
  return v2;
}

+ (int)getKeepAliveTimeoutFromCarrierBundle
{
  int v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  if (VCCarrierBundle_QueryCarrierBundleValueForKey((uint64_t)CFSTR("ConnectivityKeepAliveTimeout"), &v10))
  {
    v2 = objc_msgSend(v10, "intValue");
    if (v2 <= 5)
      v3 = 5;
    else
      v3 = v2;
    if (v3 >= 0x78)
      v4 = 120;
    else
      v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v5;
        v13 = 2080;
        v14 = "+[GKSConnectivitySettings getKeepAliveTimeoutFromCarrierBundle]";
        v15 = 1024;
        v16 = 694;
        v17 = 1024;
        v18 = v4;
        v7 = " [%s] %s:%d Read key 'ConnectivityKeepAliveTimeout' from carrier bundle: %d";
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0x22u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 30;
    v8 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v4 = 30;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v8;
      v13 = 2080;
      v14 = "+[GKSConnectivitySettings getKeepAliveTimeoutFromCarrierBundle]";
      v15 = 1024;
      v16 = 696;
      v17 = 1024;
      v18 = 30;
      v7 = " [%s] %s:%d No key 'ConnectivityKeepAliveTimeout' in carrier bundle: using default (%d)";
      goto LABEL_14;
    }
  }
  return v4;
}

+ (BOOL)supportsHEVCEncoding
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKey:", CFSTR("vc-enable-hevc-v2"));
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v4 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v4;
      v10 = 136315906;
      v11 = v7;
      v12 = 2080;
      v13 = "+[GKSConnectivitySettings supportsHEVCEncoding]";
      v14 = 1024;
      v15 = 714;
      v16 = 2080;
      v17 = objc_msgSend(CFSTR("vc-enable-hevc-v2"), "UTF8String");
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s is not present!", (uint8_t *)&v10, 0x26u);
    }
    return 0;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, "BOOLValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v5;
      v12 = 2080;
      v13 = "+[GKSConnectivitySettings supportsHEVCEncoding]";
      v14 = 1024;
      v15 = 712;
      v16 = 2080;
      v17 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d value %s", (uint8_t *)&v10, 0x26u);
    }
  }
  return v4;
}

+ (BOOL)supportsEVSCodec
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKey:", CFSTR("vc-enable-evs-audio-codec"));
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings supportsEVSCodec]";
        v14 = 1024;
        v15 = 731;
        v16 = 2080;
        v17 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d value %s", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings supportsEVSCodec]";
        v14 = 1024;
        v15 = 733;
        v16 = 2080;
        v17 = objc_msgSend(CFSTR("vc-enable-evs-audio-codec"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s is not present!", (uint8_t *)&v10, 0x26u);
      }
    }
    return 1;
  }
  return v4;
}

+ (BOOL)supportsRedAudio
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKey:", CFSTR("vc-enable-red-audio"));
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings supportsRedAudio]";
        v14 = 1024;
        v15 = 750;
        v16 = 2080;
        v17 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d value %s", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings supportsRedAudio]";
        v14 = 1024;
        v15 = 752;
        v16 = 2080;
        v17 = objc_msgSend(CFSTR("vc-enable-red-audio"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s is not present!", (uint8_t *)&v10, 0x26u);
      }
    }
    return 1;
  }
  return v4;
}

+ (BOOL)supportiRATRecommendation
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-enable-irat-recommendation"));
  if (v2)
  {
    v3 = objc_msgSend(v2, "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = "NOT ";
        v10 = 136315906;
        if (v3)
          v6 = "";
        v11 = v4;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings supportiRATRecommendation]";
        v14 = 1024;
        v15 = 767;
        v16 = 2080;
        v17 = (uint64_t)v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d storebag shows we do %s support iRAT recommendation", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings supportiRATRecommendation]";
        v14 = 1024;
        v15 = 769;
        v16 = 2080;
        v17 = objc_msgSend(CFSTR("vc-enable-irat-recommendation"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d storebag does not have %s, enable iRAT recommendation support by default", (uint8_t *)&v10, 0x26u);
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (int)getRateControllerType
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-rate-controller-type"));
  if (v2)
  {
    v3 = objc_msgSend(v2, "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v4;
        v11 = 2080;
        v12 = "+[GKSConnectivitySettings getRateControllerType]";
        v13 = 1024;
        v14 = 783;
        v15 = 1024;
        LODWORD(v16) = v3;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d storebag shows we should use rate controller type %d", (uint8_t *)&v9, 0x22u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v6;
        v11 = 2080;
        v12 = "+[GKSConnectivitySettings getRateControllerType]";
        v13 = 1024;
        v14 = 785;
        v15 = 2080;
        v16 = objc_msgSend(CFSTR("vc-rate-controller-type"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d storebag does not have %s, select both rate controller type by default", (uint8_t *)&v9, 0x26u);
      }
    }
    return 1;
  }
  return v3;
}

+ (int)getDecryptionTimeoutInterval
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-decryption-timeout-interval"));
  if (v2)
  {
    v3 = objc_msgSend(v2, "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136316162;
        v10 = v4;
        v11 = 2080;
        v12 = "+[GKSConnectivitySettings getDecryptionTimeoutInterval]";
        v13 = 1024;
        v14 = 799;
        v15 = 2112;
        v16 = CFSTR("vc-decryption-timeout-interval");
        v17 = 1024;
        v18 = v3;
        v6 = " [%s] %s:%d storebag value for '%@' is '%d'";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 30;
    v7 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    v3 = 30;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "+[GKSConnectivitySettings getDecryptionTimeoutInterval]";
      v13 = 1024;
      v14 = 801;
      v15 = 2112;
      v16 = CFSTR("vc-decryption-timeout-interval");
      v17 = 1024;
      v18 = 30;
      v6 = " [%s] %s:%d storebag does not have '%@', default value '%d' selected";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (int)getDecryptionMKMRecoveryInterval
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-decryption-mkm-recovery-interval"));
  if (v2)
  {
    v3 = objc_msgSend(v2, "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136316162;
        v10 = v4;
        v11 = 2080;
        v12 = "+[GKSConnectivitySettings getDecryptionMKMRecoveryInterval]";
        v13 = 1024;
        v14 = 815;
        v15 = 2112;
        v16 = CFSTR("vc-decryption-mkm-recovery-interval");
        v17 = 1024;
        v18 = v3;
        v6 = " [%s] %s:%d storebag value for '%@' is '%d'";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 10;
    v7 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    v3 = 10;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "+[GKSConnectivitySettings getDecryptionMKMRecoveryInterval]";
      v13 = 1024;
      v14 = 817;
      v15 = 2112;
      v16 = CFSTR("vc-decryption-mkm-recovery-interval");
      v17 = 1024;
      v18 = 10;
      v6 = " [%s] %s:%d storebag does not have '%@', default value '%d' selected";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (int)getNewSessionJoiningInterval
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-new-session-joining-interval"));
  if (v2)
  {
    v3 = objc_msgSend(v2, "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136316162;
        v10 = v4;
        v11 = 2080;
        v12 = "+[GKSConnectivitySettings getNewSessionJoiningInterval]";
        v13 = 1024;
        v14 = 831;
        v15 = 2112;
        v16 = CFSTR("vc-new-session-joining-interval");
        v17 = 1024;
        v18 = v3;
        v6 = " [%s] %s:%d storebag value for '%@' is '%d'";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 120;
    v7 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    v3 = 120;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "+[GKSConnectivitySettings getNewSessionJoiningInterval]";
      v13 = 1024;
      v14 = 833;
      v15 = 2112;
      v16 = CFSTR("vc-new-session-joining-interval");
      v17 = 1024;
      v18 = 120;
      v6 = " [%s] %s:%d storebag does not have %@, default value '%d' selected";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (int)getAdaptiveLearningState
{
  int AppIntegerValue;
  int v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("useAdaptiveLearningForFaceTime"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v3 = AppIntegerValue;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v21 = v4;
          v22 = 2080;
          v23 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
          v24 = 1024;
          v25 = 850;
          v26 = 2080;
          v27 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
          v28 = 1024;
          LODWORD(v29) = v3;
          v7 = " [%s] %s:%d %s: Read key 'useAdaptiveLearningForFaceTime' from user defaults: %d";
          v8 = v5;
          v9 = 44;
LABEL_18:
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        +[GKSConnectivitySettings getAdaptiveLearningState].cold.2();
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v21 = v10;
          v22 = 2080;
          v23 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
          v24 = 1024;
          v25 = 852;
          v26 = 2080;
          v27 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: No key 'useAdaptiveLearningForFaceTime' in user defaults. Trying to find it in the storebag", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        +[GKSConnectivitySettings getAdaptiveLearningState].cold.1();
      }
    }
    v13 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-adaptive-learning-enabled"));
    if (!v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        v3 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return v3;
        *(_DWORD *)buf = 136316418;
        v21 = v16;
        v22 = 2080;
        v23 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
        v24 = 1024;
        v25 = 858;
        v26 = 2080;
        v27 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
        v28 = 2112;
        v29 = CFSTR("vc-adaptive-learning-enabled");
        v30 = 1024;
        v31 = 0;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: storebag does not have %@, using defaul value %D", buf, 0x36u);
      }
      return 0;
    }
    v3 = objc_msgSend(v13, "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v21 = v14;
        v22 = 2080;
        v23 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
        v24 = 1024;
        v25 = 856;
        v26 = 2080;
        v27 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
        v28 = 2112;
        v29 = CFSTR("vc-adaptive-learning-enabled");
        v30 = 1024;
        v31 = v3;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%d";
        v8 = v15;
        v9 = 54;
        goto LABEL_18;
      }
    }
  }
  return v3;
}

+ (int)getShortTermHistoryLength
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-short-term-history-length"));
  if (v2)
  {
    v3 = objc_msgSend(v2, "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136316418;
        v10 = v4;
        v11 = 2080;
        v12 = "+[GKSConnectivitySettings getShortTermHistoryLength]";
        v13 = 1024;
        v14 = 875;
        v15 = 2080;
        v16 = "+[GKSConnectivitySettings getShortTermHistoryLength]";
        v17 = 2112;
        v18 = CFSTR("vc-short-term-history-length");
        v19 = 1024;
        v20 = v3;
        v6 = " [%s] %s:%d %s: found storebag value '%@'=%d";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x36u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 5;
    v7 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    v3 = 5;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316418;
      v10 = v7;
      v11 = 2080;
      v12 = "+[GKSConnectivitySettings getShortTermHistoryLength]";
      v13 = 1024;
      v14 = 877;
      v15 = 2080;
      v16 = "+[GKSConnectivitySettings getShortTermHistoryLength]";
      v17 = 2112;
      v18 = CFSTR("vc-short-term-history-length");
      v19 = 1024;
      v20 = 5;
      v6 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %d";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (int)getLongTermHistoryLength
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-long-term-history-length"));
  if (v2)
  {
    v3 = objc_msgSend(v2, "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136316418;
        v10 = v4;
        v11 = 2080;
        v12 = "+[GKSConnectivitySettings getLongTermHistoryLength]";
        v13 = 1024;
        v14 = 893;
        v15 = 2080;
        v16 = "+[GKSConnectivitySettings getLongTermHistoryLength]";
        v17 = 2112;
        v18 = CFSTR("vc-long-term-history-length");
        v19 = 1024;
        v20 = v3;
        v6 = " [%s] %s:%d %s: found storebag value '%@'=%d";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x36u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 30;
    v7 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    v3 = 30;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316418;
      v10 = v7;
      v11 = 2080;
      v12 = "+[GKSConnectivitySettings getLongTermHistoryLength]";
      v13 = 1024;
      v14 = 895;
      v15 = 2080;
      v16 = "+[GKSConnectivitySettings getLongTermHistoryLength]";
      v17 = 2112;
      v18 = CFSTR("vc-long-term-history-length");
      v19 = 1024;
      v20 = 30;
      v6 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %d";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (double)getAdaptiveLearningA
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-adaptive-learning-A"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdaptiveLearningA]";
        v14 = 1024;
        v15 = 911;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdaptiveLearningA]";
        v18 = 2112;
        v19 = CFSTR("vc-adaptive-learning-A");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdaptiveLearningA]";
        v14 = 1024;
        v15 = 913;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdaptiveLearningA]";
        v18 = 2112;
        v19 = CFSTR("vc-adaptive-learning-A");
        v20 = 2048;
        v21 = 0x3FD999999999999ALL;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getAdjustmentFactorA
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-adjustment-factor-A"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdjustmentFactorA]";
        v14 = 1024;
        v15 = 929;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdjustmentFactorA]";
        v18 = 2112;
        v19 = CFSTR("vc-adjustment-factor-A");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.25;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdjustmentFactorA]";
        v14 = 1024;
        v15 = 931;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdjustmentFactorA]";
        v18 = 2112;
        v19 = CFSTR("vc-adjustment-factor-A");
        v20 = 2048;
        v21 = 0x3FD0000000000000;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getShortTermValueWeightA
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-short-term-value-weight-A"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getShortTermValueWeightA]";
        v14 = 1024;
        v15 = 947;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getShortTermValueWeightA]";
        v18 = 2112;
        v19 = CFSTR("vc-short-term-value-weight-A");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getShortTermValueWeightA]";
        v14 = 1024;
        v15 = 949;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getShortTermValueWeightA]";
        v18 = 2112;
        v19 = CFSTR("vc-short-term-value-weight-A");
        v20 = 2048;
        v21 = 0x3FD999999999999ALL;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getLongTermValueWeightA
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-long-term-value-weight-A"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getLongTermValueWeightA]";
        v14 = 1024;
        v15 = 965;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getLongTermValueWeightA]";
        v18 = 2112;
        v19 = CFSTR("vc-long-term-value-weight-A");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getLongTermValueWeightA]";
        v14 = 1024;
        v15 = 967;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getLongTermValueWeightA]";
        v18 = 2112;
        v19 = CFSTR("vc-long-term-value-weight-A");
        v20 = 2048;
        v21 = 0x3FB999999999999ALL;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getAdaptiveLearningB
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-adaptive-learning-B"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdaptiveLearningB]";
        v14 = 1024;
        v15 = 983;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdaptiveLearningB]";
        v18 = 2112;
        v19 = CFSTR("vc-adaptive-learning-B");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdaptiveLearningB]";
        v14 = 1024;
        v15 = 985;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdaptiveLearningB]";
        v18 = 2112;
        v19 = CFSTR("vc-adaptive-learning-B");
        v20 = 2048;
        v21 = 0x3FD999999999999ALL;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getAdjustmentFactorB
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-adjustment-factor-B"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdjustmentFactorB]";
        v14 = 1024;
        v15 = 1001;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdjustmentFactorB]";
        v18 = 2112;
        v19 = CFSTR("vc-adjustment-factor-B");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.25;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdjustmentFactorB]";
        v14 = 1024;
        v15 = 1003;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdjustmentFactorB]";
        v18 = 2112;
        v19 = CFSTR("vc-adjustment-factor-B");
        v20 = 2048;
        v21 = 0x3FD0000000000000;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getShortTermValueWeightB
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-short-term-value-weight-B"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getShortTermValueWeightB]";
        v14 = 1024;
        v15 = 1019;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getShortTermValueWeightB]";
        v18 = 2112;
        v19 = CFSTR("vc-short-term-value-weight-B");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getShortTermValueWeightB]";
        v14 = 1024;
        v15 = 1021;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getShortTermValueWeightB]";
        v18 = 2112;
        v19 = CFSTR("vc-short-term-value-weight-B");
        v20 = 2048;
        v21 = 0x3FE0000000000000;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getLongTermValueWeightB
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-long-term-value-weight-B"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getLongTermValueWeightB]";
        v14 = 1024;
        v15 = 1037;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getLongTermValueWeightB]";
        v18 = 2112;
        v19 = CFSTR("vc-long-term-value-weight-B");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getLongTermValueWeightB]";
        v14 = 1024;
        v15 = 1039;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getLongTermValueWeightB]";
        v18 = 2112;
        v19 = CFSTR("vc-long-term-value-weight-B");
        v20 = 2048;
        v21 = 0x3FC999999999999ALL;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getAdjustmentFactorC
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-adjustment-factor-C"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdjustmentFactorC]";
        v14 = 1024;
        v15 = 1055;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdjustmentFactorC]";
        v18 = 2112;
        v19 = CFSTR("vc-adjustment-factor-C");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.25;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAdjustmentFactorC]";
        v14 = 1024;
        v15 = 1057;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getAdjustmentFactorC]";
        v18 = 2112;
        v19 = CFSTR("vc-adjustment-factor-C");
        v20 = 2048;
        v21 = 0x3FD0000000000000;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getShortTermValueWeightC
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-short-term-value-weight-C"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getShortTermValueWeightC]";
        v14 = 1024;
        v15 = 1073;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getShortTermValueWeightC]";
        v18 = 2112;
        v19 = CFSTR("vc-short-term-value-weight-C");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getShortTermValueWeightC]";
        v14 = 1024;
        v15 = 1075;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getShortTermValueWeightC]";
        v18 = 2112;
        v19 = CFSTR("vc-short-term-value-weight-C");
        v20 = 2048;
        v21 = 0x3FD999999999999ALL;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getLongTermValueWeightC
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-long-term-value-weight-C"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getLongTermValueWeightC]";
        v14 = 1024;
        v15 = 1091;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getLongTermValueWeightC]";
        v18 = 2112;
        v19 = CFSTR("vc-long-term-value-weight-C");
        v20 = 2048;
        v21 = *(_QWORD *)&v4;
        v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    v4 = 0.1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316418;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getLongTermValueWeightC]";
        v14 = 1024;
        v15 = 1093;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getLongTermValueWeightC]";
        v18 = 2112;
        v19 = CFSTR("vc-long-term-value-weight-C");
        v20 = 2048;
        v21 = 0x3FB999999999999ALL;
        v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (int)getWRMRSSIThresholdValue:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  _BYTE v22[14];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-wrm-rssi-threshold-distribution"));
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
    if (objc_msgSend(v6, "count"))
      a3 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v6, "count"))), "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316418;
        v14 = v7;
        v15 = 2080;
        v16 = "+[GKSConnectivitySettings getWRMRSSIThresholdValue:]";
        v17 = 1024;
        v18 = 1111;
        v19 = 2112;
        v20 = CFSTR("vc-wrm-rssi-threshold-distribution");
        v21 = 2112;
        *(_QWORD *)v22 = v5;
        *(_WORD *)&v22[8] = 1024;
        *(_DWORD *)&v22[10] = a3;
        v9 = " [%s] %s:%d Found storebag value '%@'=%@, using threshold value %d";
LABEL_12:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0x36u);
      }
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(CFSTR("-80,-80,-80,-80,-80,-80,-80,-83,-85,-87"), "componentsSeparatedByString:", CFSTR(","));
    if (objc_msgSend(v10, "count"))
      a3 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v10, "count"))), "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316418;
        v14 = v11;
        v15 = 2080;
        v16 = "+[GKSConnectivitySettings getWRMRSSIThresholdValue:]";
        v17 = 1024;
        v18 = 1117;
        v19 = 2112;
        v20 = CFSTR("vc-wrm-rssi-threshold-distribution");
        v21 = 1024;
        *(_DWORD *)v22 = a3;
        *(_WORD *)&v22[4] = 2112;
        *(_QWORD *)&v22[6] = v10;
        v9 = " [%s] %s:%d Storebag does not have %@, using threshold value %d from default distribution %@";
        goto LABEL_12;
      }
    }
  }
  return a3;
}

+ (double)getThresholdForSwitch:(unsigned int)a3
{
  double v3;
  const __CFString *v4;
  const __CFString *v5;
  double v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  double v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  double v16;
  BOOL v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  double v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  double v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  double v36;
  BOOL v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  double v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  double v47;
  double v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  double v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  double v57;
  double v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  uint64_t v69;
  NSObject *v70;
  double v71;
  const char *v72;
  NSObject *v73;
  uint32_t v74;
  double v75;
  uint64_t v76;
  NSObject *v77;
  int v79;
  uint64_t v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v3 = NAN;
  v4 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
  if ((int)a3 < 0x10000)
  {
    if ((int)a3 <= 255)
    {
      if ((int)a3 <= 15)
      {
        v5 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        switch(a3)
        {
          case 1u:
            v5 = CFSTR("preferRelayOverP2PThreshold");
            v4 = CFSTR("vc-prefer-relay-over-p2p-threshold");
            v3 = 0.1;
            break;
          case 2u:
            v3 = 1.0;
            v5 = CFSTR("alwaysOnAudioRedundancyEnableThreshold");
            v4 = CFSTR("vc-always-on-audio-redundancy-enable-threshold");
            break;
          case 3u:
          case 5u:
          case 6u:
          case 7u:
            goto LABEL_138;
          case 4u:
            v3 = 0.0;
            v5 = CFSTR("highFecEnableThreshold");
            v4 = CFSTR("vc-high-fec-enable-threshold");
            break;
          case 8u:
            v3 = 1.0;
            v5 = CFSTR("lowFpsVideoEnableThreshold");
            v4 = CFSTR("vc-low-fps-video-enable-threshold");
            break;
          default:
            v5 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
            break;
        }
        goto LABEL_138;
      }
      v18 = CFSTR("fastMediaDuplicationEnableThreshold");
      v6 = 1.0;
      v19 = CFSTR("vc-fast-media-duplication-enable-threshold");
      v38 = CFSTR("iRATRtpEnableThreshold");
      v39 = CFSTR("vc-iRAT-rtp-enable-threshold");
      if (a3 == 128)
      {
        v10 = 1.0;
      }
      else
      {
        v39 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v38 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v10 = NAN;
      }
      if (a3 != 64)
      {
        v19 = v39;
        v18 = v38;
      }
      v22 = CFSTR("vplrFecEnableThreshold");
      v23 = CFSTR("vc-vplr-fec-enable-threshold");
      if (a3 == 64)
        v10 = 1.0;
      v40 = CFSTR("UseVideoJitterForVideoPlayoutForFaceTime");
      v41 = CFSTR("vc-ab-testing-use-video-jitter-for-video-playout");
      v42 = 0.0;
      if (a3 != 32)
      {
        v41 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v40 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v42 = NAN;
      }
      if (a3 != 16)
      {
        v23 = v41;
        v22 = v40;
        v6 = v42;
      }
      v17 = (int)a3 <= 63;
      goto LABEL_65;
    }
    v6 = 1.0;
    if ((int)a3 <= 4095)
    {
      v18 = CFSTR("allowBurstyLossRampDownEnableThreshold");
      v19 = CFSTR("vc-allow-bursty-loss-ramp-down-enable-threshold");
      v20 = CFSTR("hevcWifiTiersEnableThreshold");
      v21 = CFSTR("vc-hevc-wifi-tiers-enable-threshold");
      if (a3 == 2048)
      {
        v10 = 1.0;
      }
      else
      {
        v21 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v20 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v10 = NAN;
      }
      if (a3 == 1024)
      {
        v10 = 1.0;
      }
      else
      {
        v19 = v21;
        v18 = v20;
      }
      v22 = CFSTR("preWarmCellEnableThreshold");
      v23 = CFSTR("vc-pre-warm-cell-enable-threshold");
      v24 = CFSTR("duplicateImportantPktsEnableThreshold");
      v25 = CFSTR("vc-duplicate-important-pkts-enable-threshold");
      if (a3 == 512)
      {
        v26 = 1.0;
      }
      else
      {
        v25 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v24 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v26 = NAN;
      }
      if (a3 != 256)
      {
        v23 = v25;
        v22 = v24;
        v6 = v26;
      }
      v17 = (int)a3 <= 1023;
LABEL_65:
      if (v17)
        v4 = v23;
      else
        v4 = v19;
      if (v17)
        v5 = v22;
      else
        v5 = v18;
LABEL_71:
      if (v17)
        v3 = v6;
      else
        v3 = v10;
      goto LABEL_138;
    }
    v27 = CFSTR("wifiLowTierRedundancyEnableThreshold");
    v28 = CFSTR("vc-wifi-low-tier-redundancy-enable-threshold");
    v43 = CFSTR("cellularLowTierRedundancyEnableThreshold");
    v44 = CFSTR("vc-cellular-low-tier-redundancy-enable-threshold");
    if (a3 == 0x8000)
    {
      v31 = 1.0;
    }
    else
    {
      v44 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v43 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v31 = NAN;
    }
    if (a3 == 0x4000)
    {
      v31 = 1.0;
    }
    else
    {
      v28 = v44;
      v27 = v43;
    }
    v32 = CFSTR("viewpointCorrectionEnableThreshold");
    v33 = CFSTR("vc-viewpoint-correction-enable-threshold");
    v45 = CFSTR("heifHevcLivePhotosEnableThreshold");
    v46 = CFSTR("vc-heif-hevc-live-photos-enable-threshold");
    if (a3 == 0x2000)
    {
      v47 = 1.0;
    }
    else
    {
      v46 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v45 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v47 = NAN;
    }
    if (a3 != 4096)
    {
      v33 = v46;
      v32 = v45;
      v6 = v47;
    }
    v37 = (int)a3 < 0x4000;
    goto LABEL_86;
  }
  if ((int)a3 < 0x800000)
  {
    v6 = 1.0;
    if ((int)a3 >= 0x80000)
    {
      v27 = CFSTR("wifiAssistDuplicationEnableThreshold");
      v28 = CFSTR("vc-wifi-assist-duplication-enable-threshold");
      v29 = CFSTR("wifiAssistBudgetStatusEnableThreshold");
      v30 = CFSTR("vc-wifi-assist-budget-status-enable-threshold");
      if (a3 == 0x400000)
      {
        v31 = 1.0;
      }
      else
      {
        v30 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v29 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v31 = NAN;
      }
      if (a3 == 0x200000)
      {
        v31 = 1.0;
      }
      else
      {
        v28 = v30;
        v27 = v29;
      }
      v32 = CFSTR("secureMessagingEnableThreshold");
      v33 = CFSTR("vc-secure-messaging-enable-threshold");
      v34 = CFSTR("disableSIPEnableThreshold");
      v35 = CFSTR("vc-disable-SIP-enable-threshold");
      if (a3 == 0x100000)
      {
        v36 = 1.0;
      }
      else
      {
        v35 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v34 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v36 = NAN;
      }
      if (a3 != 0x80000)
      {
        v33 = v35;
        v32 = v34;
        v6 = v36;
      }
      v37 = (int)a3 < 0x200000;
LABEL_86:
      if (v37)
        v4 = v33;
      else
        v4 = v28;
      if (v37)
        v5 = v32;
      else
        v5 = v27;
      if (v37)
        v3 = v6;
      else
        v3 = v31;
      goto LABEL_138;
    }
    v60 = CFSTR("fecHeaderV1EnableThreshold");
    v61 = CFSTR("vc-fec-header-v1-enable-threshold");
    v62 = CFSTR("updatedAFRCHeaderEnableThreshold");
    v63 = CFSTR("vc-updated-AFRC-header-enable-threshold");
    if (a3 == 0x40000)
    {
      v64 = 1.0;
    }
    else
    {
      v63 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v62 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v64 = NAN;
    }
    if (a3 == 0x20000)
    {
      v64 = 1.0;
    }
    else
    {
      v61 = v63;
      v60 = v62;
    }
    if (a3 == 0x10000)
      v4 = CFSTR("vc-iRAT-metrics-enable-threshold");
    else
      v4 = v61;
    if (a3 == 0x10000)
      v5 = CFSTR("iRATMetricsEnableThreshold");
    else
      v5 = v60;
    if (a3 == 0x10000)
      v3 = 1.0;
    else
      v3 = v64;
  }
  else
  {
    if ((int)a3 <= 0x7FFFFFF)
    {
      v6 = 1.0;
      v7 = CFSTR("duplicationEnhancementEnableThreshold");
      v8 = CFSTR("videoJBEnableThreshold");
      v9 = CFSTR("vc-video-jb-enable-threshold-v2");
      v10 = 0.0;
      if (a3 != 0x4000000)
      {
        v9 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v8 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v10 = NAN;
      }
      if (a3 == 0x2000000)
        v11 = CFSTR("vc-duplication-enhancement-enable-threshold");
      else
        v11 = v9;
      if (a3 == 0x2000000)
        v10 = 1.0;
      else
        v7 = v8;
      v12 = CFSTR("wifiAssistStatusBarEnableThreshold");
      v13 = CFSTR("vc-wifi-assist-status-bar-enable-threshold");
      v14 = CFSTR("lowNetworkModeEnableThreshold");
      v15 = CFSTR("vc-low-network-mode-enable-threshold");
      if (a3 == 0x1000000)
      {
        v16 = 1.0;
      }
      else
      {
        v15 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v14 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
        v16 = NAN;
      }
      if (a3 != 0x800000)
      {
        v13 = v15;
        v12 = v14;
        v6 = v16;
      }
      v17 = (int)a3 <= 0x1FFFFFF;
      if ((int)a3 <= 0x1FFFFFF)
        v4 = v13;
      else
        v4 = v11;
      if ((int)a3 <= 0x1FFFFFF)
        v5 = v12;
      else
        v5 = v7;
      goto LABEL_71;
    }
    v48 = 0.0;
    v49 = CFSTR("mediaDrivenDuplicationEnableThreshold");
    v50 = CFSTR("useRTTForFIRThrottling");
    v51 = CFSTR("vc-ab-testing-use-rtt-for-fir-throttling");
    if (a3 == 0x40000000)
    {
      v52 = 0.0;
    }
    else
    {
      v51 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v50 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v52 = NAN;
    }
    if (a3 == 0x20000000)
      v53 = CFSTR("vc-media-driven-duplication-enable-threshold");
    else
      v53 = v51;
    if (a3 != 0x20000000)
    {
      v49 = v50;
      v48 = v52;
    }
    v54 = CFSTR("iRATDuplicationEnableThreshold");
    v55 = CFSTR("wrmRSSIThresholdEnableThreshold");
    v56 = CFSTR("vc-wrm-rssi-threshold-enable-threshold");
    v57 = 1.0;
    if (a3 == 0x10000000)
    {
      v58 = 1.0;
    }
    else
    {
      v56 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v55 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
      v58 = NAN;
    }
    if (a3 == 0x8000000)
      v59 = CFSTR("vc-iRAT-duplication-enable-threshold");
    else
      v59 = v56;
    if (a3 != 0x8000000)
    {
      v54 = v55;
      v57 = v58;
    }
    if ((int)a3 <= 0x1FFFFFFF)
      v4 = v59;
    else
      v4 = v53;
    if ((int)a3 <= 0x1FFFFFFF)
      v5 = v54;
    else
      v5 = v49;
    if ((int)a3 <= 0x1FFFFFFF)
      v3 = v57;
    else
      v3 = v48;
  }
LABEL_138:
  v65 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", v4);
  if (v65)
  {
    v66 = v65;
    objc_msgSend(v65, "doubleValue");
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", v5);
    v68 = v67;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v69 = VRTraceErrorLogLevelToCSTR();
      v70 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v66, "doubleValue");
        v79 = 136316418;
        v80 = v69;
        v81 = 2080;
        v82 = "+[GKSConnectivitySettings getThresholdForSwitch:]";
        v83 = 1024;
        v84 = 1291;
        v85 = 2112;
        v86 = v4;
        v87 = 2048;
        v88 = v71;
        v89 = 2048;
        v90 = v68;
        v72 = " [%s] %s:%d Found storebag value '%@'=%f, using %f";
        v73 = v70;
        v74 = 58;
LABEL_145:
        _os_log_impl(&dword_1D8A54000, v73, OS_LOG_TYPE_DEFAULT, v72, (uint8_t *)&v79, v74);
      }
    }
  }
  else
  {
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", v5, v3);
    v68 = v75;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v76 = VRTraceErrorLogLevelToCSTR();
      v77 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v79 = 136316162;
        v80 = v76;
        v81 = 2080;
        v82 = "+[GKSConnectivitySettings getThresholdForSwitch:]";
        v83 = 1024;
        v84 = 1294;
        v85 = 2112;
        v86 = v4;
        v87 = 2048;
        v88 = v68;
        v72 = " [%s] %s:%d Storebag does not have %@, using default value %f";
        v73 = v77;
        v74 = 48;
        goto LABEL_145;
      }
    }
  }
  return v68;
}

+ (unsigned)getAbTestMasterLocalSwitches
{
  void *v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-ab-test-master-local-switches"));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v4;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAbTestMasterLocalSwitches]";
        v14 = 1024;
        v15 = 1307;
        v16 = 2112;
        v17 = CFSTR("vc-ab-test-master-local-switches");
        v18 = 2112;
        v19 = v2;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag value '%@'=%@", (uint8_t *)&v10, 0x30u);
      }
    }
    return objc_msgSend(v2, "unsignedIntValue");
  }
  else
  {
    v6 = 201326554;
    if (ErrorLogLevelForModule >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAbTestMasterLocalSwitches]";
        v14 = 1024;
        v15 = 1310;
        v16 = 2112;
        v17 = CFSTR("vc-ab-test-master-local-switches");
        v18 = 1024;
        LODWORD(v19) = 201326554;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Storebag does not have %@, using default value %d", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  return v6;
}

+ (unsigned)getAbTestingState
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  unsigned __int8 IntValueForKey;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-ab-testing-state"));
  if (v2)
  {
    v3 = (void *)v2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v4;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAbTestingState]";
        v14 = 1024;
        v15 = 1320;
        v16 = 2112;
        v17 = CFSTR("vc-ab-testing-state");
        v18 = 2112;
        v19 = v3;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag value '%@'=%@", (uint8_t *)&v10, 0x30u);
      }
    }
    return objc_msgSend(v3, "unsignedIntValue");
  }
  else
  {
    IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("abTestingState"), 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getAbTestingState]";
        v14 = 1024;
        v15 = 1324;
        v16 = 2112;
        v17 = CFSTR("vc-ab-testing-state");
        v18 = 1024;
        LODWORD(v19) = IntValueForKey;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Storebag does not have %@, using default value %d", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  return IntValueForKey;
}

+ (id)getTestGroupPermutations:(unsigned __int8)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 > 4u)
    return &stru_1E9E58EE0;
  v3 = off_1E9E53110[(char)a3];
  v4 = off_1E9E53138[(char)a3];
  v5 = (__CFString *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", v3);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v5)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316162;
        v13 = v7;
        v14 = 2080;
        v15 = "+[GKSConnectivitySettings getTestGroupPermutations:]";
        v16 = 1024;
        v17 = 1360;
        v18 = 2112;
        v19 = v3;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag value '%@'=%@", (uint8_t *)&v12, 0x30u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "+[GKSConnectivitySettings getTestGroupPermutations:]";
        v16 = 1024;
        v17 = 1363;
        v18 = 2112;
        v19 = v3;
        v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Storebag does not have %@, using default value %@", (uint8_t *)&v12, 0x30u);
      }
    }
    return v4;
  }
  return v5;
}

+ (double)getRemoteMediaStallTimeout
{
  double v2;
  double v3;
  void *v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[VCDefaults remoteMediaStallTimeout](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "remoteMediaStallTimeout");
  v3 = v2;
  v4 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-remote-media-stall-timeout"));
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v3 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316162;
        v12 = v6;
        v13 = 2080;
        v14 = "+[GKSConnectivitySettings getRemoteMediaStallTimeout]";
        v15 = 1024;
        v16 = 1376;
        v17 = 2112;
        v18 = CFSTR("vc-remote-media-stall-timeout");
        v19 = 2112;
        v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
        v8 = " [%s] %s:%d storebag value for '%@' is '%@'";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x30u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136316162;
      v12 = v9;
      v13 = 2080;
      v14 = "+[GKSConnectivitySettings getRemoteMediaStallTimeout]";
      v15 = 1024;
      v16 = 1378;
      v17 = 2112;
      v18 = CFSTR("vc-remote-media-stall-timeout");
      v19 = 2112;
      v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
      v8 = " [%s] %s:%d storebag does not have '%@', default value '%@' selected";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (double)getNoRemoteDuplicationThresholdFast
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", CFSTR("vc-no-remote-duplication-threshold-fast"));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v5;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getNoRemoteDuplicationThresholdFast]";
        v14 = 1024;
        v15 = 1392;
        v16 = 2112;
        v17 = CFSTR("vc-no-remote-duplication-threshold-fast");
        v18 = 2112;
        v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
        v7 = " [%s] %s:%d storebag value for '%@' is '%@'";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x30u);
      }
    }
  }
  else
  {
    v4 = 4.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v8;
        v12 = 2080;
        v13 = "+[GKSConnectivitySettings getNoRemoteDuplicationThresholdFast]";
        v14 = 1024;
        v15 = 1394;
        v16 = 2112;
        v17 = CFSTR("vc-no-remote-duplication-threshold-fast");
        v18 = 2112;
        v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 4.0);
        v7 = " [%s] %s:%d storebag does not have '%@', default value '%@' selected";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (id)getVCRCSeverBagConfigWithKey:(id)a3
{
  void *v4;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v6;
        v16 = 2080;
        v17 = "+[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:]";
        v18 = 1024;
        v19 = 1405;
        v20 = 2112;
        v21 = a3;
        v22 = 2112;
        v23 = v4;
        v8 = " [%s] %s:%d storebag map value for '%@' is '%@'";
        v9 = v7;
        v10 = 48;
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315906;
      v15 = v11;
      v16 = 2080;
      v17 = "+[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:]";
      v18 = 1024;
      v19 = 1407;
      v20 = 2112;
      v21 = a3;
      v8 = " [%s] %s:%d storebag does not have '%@'";
      v9 = v12;
      v10 = 38;
      goto LABEL_8;
    }
  }
  return v4;
}

+ (id)getStorebagValueForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 defaultValue:(id)a5 isDoubleType:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int ErrorLogLevelForModule;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v6 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  v11 = v10;
  if (v10)
    a5 = v10;
  if (a4)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    if (v6)
    {
      objc_msgSend(a5, "doubleValue");
      +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", a4);
      v13 = (void *)objc_msgSend(v12, "numberWithDouble:");
    }
    else
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", a4, (int)objc_msgSend(a5, "intValue")));
    }
    a5 = v13;
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v11)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136316418;
        v24 = v15;
        v25 = 2080;
        v26 = "+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:]";
        v27 = 1024;
        v28 = 1429;
        v29 = 2112;
        v30 = a3;
        v31 = 2112;
        v32 = v11;
        v33 = 2112;
        v34 = a5;
        v17 = " [%s] %s:%d Found storebag value '%@'=%@, using %@";
        v18 = v16;
        v19 = 58;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136316162;
      v24 = v20;
      v25 = 2080;
      v26 = "+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:]";
      v27 = 1024;
      v28 = 1431;
      v29 = 2112;
      v30 = a3;
      v31 = 2112;
      v32 = a5;
      v17 = " [%s] %s:%d Storebag does not have %@, using %@";
      v18 = v21;
      v19 = 48;
      goto LABEL_15;
    }
  }
  return a5;
}

+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 featureFlagDomain:(char *)a5 featureFlagName:(char *)a6
{
  return objc_msgSend(a1, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:normalizedRandom:", a3, a4, a5, a6, (double)arc4random() / 4294967300.0);
}

+ (BOOL)isFeatureDisabledByExceptionKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
    v7 = (void *)MGGetStringAnswer();
    v8 = v7;
    if (v7)
    {
      if ((objc_msgSend(v7, "isEqualToString:", &stru_1E9E58EE0) & 1) == 0)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v33 != v11)
                objc_enumerationMutation(v6);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "isEqualToString:", v8))
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                {
                  v13 = 1;
                }
                else
                {
                  v15 = VRTraceErrorLogLevelToCSTR();
                  v16 = *MEMORY[0x1E0CF2758];
                  v13 = 1;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    v17 = 136316674;
                    v18 = v15;
                    v19 = 2080;
                    v20 = "+[GKSConnectivitySettings isFeatureDisabledByExceptionKey:]";
                    v21 = 1024;
                    v22 = 1458;
                    v23 = 2112;
                    v24 = a3;
                    v25 = 2112;
                    v26 = v5;
                    v27 = 2112;
                    v28 = v8;
                    v29 = 1024;
                    v30 = 1;
                    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag exception value '%@'=%@, deviceCode=%@ isDisabled=%d", (uint8_t *)&v17, 0x40u);
                  }
                }
                goto LABEL_13;
              }
            }
            v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
            if (v10)
              continue;
            break;
          }
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 exceptionKey:(id)a4 userDefaultKey:(__CFString *)a5 featureFlagDomain:(char *)a6 featureFlagName:(char *)a7
{
  unsigned int v13;
  int AppBooleanValue;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  _BYTE v39[14];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = arc4random();
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(a5, CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  v15 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  if (keyExistsAndHasValidFormat)
  {
    LOBYTE(v13) = AppBooleanValue != 0;
    return v13;
  }
  v16 = (void *)v15;
  if ((objc_msgSend(a1, "isFeatureDisabledByExceptionKey:", a4) & 1) != 0)
  {
    LOBYTE(v13) = 0;
    return v13;
  }
  if (v16)
  {
    v17 = (double)v13 / 4294967300.0;
    objc_msgSend(v16, "doubleValue");
    v19 = v18;
    LOBYTE(v13) = v17 < v18;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v29 = v20;
        v30 = 2080;
        v31 = "+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:exceptionKey:userDefaultKey:featureFlagDomain:featureFlagName:]";
        v32 = 1024;
        v33 = 1483;
        v34 = 2112;
        v35 = a3;
        v36 = 2112;
        v37 = (char *)v16;
        v38 = 1024;
        *(_DWORD *)v39 = v17 < v19;
        *(_WORD *)&v39[4] = 2048;
        *(double *)&v39[6] = v17;
        v22 = " [%s] %s:%d Found storebag value '%@'=%@, result=%d, normalizedRandom=%1.4f";
        v23 = v21;
LABEL_10:
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, 0x40u);
      }
    }
  }
  else
  {
    v13 = _os_feature_enabled_impl();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v29 = v24;
        v30 = 2080;
        v31 = "+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:exceptionKey:userDefaultKey:featureFlagDomain:featureFlagName:]";
        v32 = 1024;
        v33 = 1486;
        v34 = 2112;
        v35 = a3;
        v36 = 2080;
        v37 = a6;
        v38 = 2080;
        *(_QWORD *)v39 = a7;
        *(_WORD *)&v39[8] = 1024;
        *(_DWORD *)&v39[10] = v13;
        v22 = " [%s] %s:%d Storebag does not have %@, using feature flag domain=%s name=%s value=%d";
        v23 = v25;
        goto LABEL_10;
      }
    }
  }
  return v13;
}

+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 featureFlagDomain:(char *)a5 featureFlagName:(char *)a6 normalizedRandom:(double)a7
{
  int AppBooleanValue;
  uint64_t v12;
  BOOL v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  _BYTE v36[14];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(a4, CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  v12 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  if (keyExistsAndHasValidFormat)
    return AppBooleanValue == 1;
  v14 = (void *)v12;
  if (!_os_feature_enabled_impl())
    return 0;
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
    v13 = v15 > a7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v26 = v17;
        v27 = 2080;
        v28 = "+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:"
              "normalizedRandom:]";
        v29 = 1024;
        v30 = 1507;
        v31 = 2112;
        v32 = a3;
        v33 = 2112;
        v34 = (char *)v14;
        v35 = 1024;
        *(_DWORD *)v36 = v16 > a7;
        *(_WORD *)&v36[4] = 2048;
        *(double *)&v36[6] = a7;
        v19 = " [%s] %s:%d Found storebag value '%@'=%@, result=%d, normalizedRandom=%1.4f";
        v20 = v18;
LABEL_12:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, 0x40u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    v13 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v26 = v21;
      v27 = 2080;
      v28 = "+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:no"
            "rmalizedRandom:]";
      v29 = 1024;
      v30 = 1509;
      v31 = 2112;
      v32 = a3;
      v33 = 2080;
      v34 = a5;
      v35 = 2080;
      *(_QWORD *)v36 = a6;
      *(_WORD *)&v36[8] = 1024;
      *(_DWORD *)&v36[10] = 1;
      v19 = " [%s] %s:%d Storebag does not have %@, using feature flag domain=%s name=%s value=%d";
      v20 = v22;
      goto LABEL_12;
    }
  }
  return v13;
}

+ (id)getStorebagValueStorebagKey:(id)a3 defaultValue:(id)a4
{
  void *v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316162;
        v14 = v8;
        v15 = 2080;
        v16 = "+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:]";
        v17 = 1024;
        v18 = 1521;
        v19 = 2112;
        v20 = a3;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag value '%@'=%@", (uint8_t *)&v13, 0x30u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316162;
        v14 = v10;
        v15 = 2080;
        v16 = "+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:]";
        v17 = 1024;
        v18 = 1524;
        v19 = 2112;
        v20 = a3;
        v21 = 2112;
        v22 = a4;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Storebag does not have %@, using %@", (uint8_t *)&v13, 0x30u);
      }
    }
    return a4;
  }
  return v6;
}

- (GKSConnectivitySettings)init
{
  return 0;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)GKSConnectivitySettings;
  -[GKSConnectivitySettings dealloc](&v2, sel_dealloc);
}

+ (void)getAdaptiveLearningState
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
  v5 = 1024;
  v6 = 850;
  v7 = v0;
  v8 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
  v9 = 1024;
  v10 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s: Read key 'useAdaptiveLearningForFaceTime' from user defaults: %d", v3, 0x2Cu);
}

@end
