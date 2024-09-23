@implementation GKNATObserverInternal

- (GKNATObserverInternal)init
{
  return -[GKNATObserverInternal initWithOptions:](self, "initWithOptions:", 0);
}

- (GKNATObserverInternal)initWithOptions:(id)a3
{
  GKNATObserverInternal *v4;
  dispatch_queue_t v5;
  dispatch_queue_t v6;
  dispatch_group_t v7;
  dispatch_semaphore_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  GKNATObserverInternal *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)GKNATObserverInternal;
  v4 = -[GKNATObserverInternal init](&v16, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.gamekitservices.GKNATObserver.%p.natCheckQueue"), v4), "UTF8String"), 0);
    v4->_natCheckQueue = (OS_dispatch_queue *)v5;
    if (!v5
      || (v6 = dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.gamekitservices.GKNATObserver.%p.reportNATQueue"), v4), "UTF8String"), 0), (v4->_reportNATQueue = (OS_dispatch_queue *)v6) == 0)|| (v7 = dispatch_group_create(), (v4->_natCheckGroup = (OS_dispatch_group *)v7) == 0)|| (v8 = dispatch_semaphore_create(1), (v4->_natCheckNetNameSema = (OS_dispatch_semaphore *)v8) == 0))
    {

      return 0;
    }
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("nonCarrier")))
      v4->_nonCarrierInterfacesOnly = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("nonCarrier")), "BOOLValue");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("checkTCPSSL")))
      v4->_checkTCPAndSSL = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("checkTCPSSL")), "BOOLValue");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("favorNonCar")))
      v4->_favorNonCarrier = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("favorNonCar")), "BOOLValue");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("carrierType")))
      v4->_newCarrierType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("carrierType")), "BOOLValue");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("addInRange")))
      v4->_addInRangeFlag = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("addInRange")), "BOOLValue");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("addCarrier")))
      v4->_addCarrierFlag = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("addCarrier")), "BOOLValue");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ignoreCache")))
      v4->_ignoreNatTypeCache = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ignoreCache")), "BOOLValue");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ignoreCarrierBundle")))
      v4->_ignoreCarrierBundle = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ignoreCarrierBundle")), "BOOLValue");
    v4->_interfaceInfoDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_currentNetworkNames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_lastReportedNATType = -1;
    v4->_xNATCheck = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v4->_hasNATCheckStarted = 0;
    v4->_hasNATCheckEnded = 0;
    -[GKNATObserverInternal registerForNetworkChanges](v4, "registerForNetworkChanges");
    v9 = (void *)objc_opt_class();
    objc_sync_enter(v9);
    if (!cachedNATTypeDictionary)
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
            *(_DWORD *)buf = 136315650;
            v18 = v10;
            v19 = 2080;
            v20 = "-[GKNATObserverInternal initWithOptions:]";
            v21 = 1024;
            v22 = 357;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: no NAT cache available, running NAT check", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          -[GKNATObserverInternal initWithOptions:].cold.1();
        }
      }
      -[GKNATObserverInternal tryNATCheckWithDelay:](v4, "tryNATCheckWithDelay:", 0.0);
    }
    objc_sync_exit(v9);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = v13;
      v19 = 2080;
      v20 = "-[GKNATObserverInternal initWithOptions:]";
      v21 = 1024;
      v22 = 363;
      v23 = 2048;
      v24 = v4;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserverInternal(%p) -init", buf, 0x26u);
    }
  }
  return v4;
}

- (void)release
{
  GKNATObserver_SCContext *sccontext;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sccontext = self->_sccontext;
  objc_sync_enter(sccontext);
  v4.receiver = self;
  v4.super_class = (Class)GKNATObserverInternal;
  -[GKNATObserverInternal release](&v4, sel_release);
  objc_sync_exit(sccontext);
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  GKNATObserverInternal *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[GKNATObserverInternal dealloc]";
      v10 = 1024;
      v11 = 377;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserverInternal(%p) -dealloc", buf, 0x26u);
    }
  }
  VCNAT64ResolverDeregisterAll(self);
  -[GKNATObserver_SCContext setObserver:](self->_sccontext, "setObserver:", 0);

  -[GKNATObserverInternal setDelegate:](self, "setDelegate:", 0);
  objc_storeWeak(&self->_delegate, 0);

  dispatch_release((dispatch_object_t)self->_natCheckQueue);
  dispatch_release((dispatch_object_t)self->_reportNATQueue);
  dispatch_release((dispatch_object_t)self->_natCheckGroup);
  dispatch_release((dispatch_object_t)self->_natCheckNetNameSema);
  v5.receiver = self;
  v5.super_class = (Class)GKNATObserverInternal;
  -[GKNATObserverInternal dealloc](&v5, sel_dealloc);
}

- (int)natTypeForCommNATFlags:(unsigned int)a3 isCarrier:(BOOL)a4
{
  int v4;
  int v5;
  BOOL v6;
  int v7;

  if (!a3)
  {
    v4 = 0;
    goto LABEL_26;
  }
  if ((a3 & 1) != 0)
  {
    v4 = 6;
    if ((a3 & 0x800) != 0)
      v5 = 5;
    else
      v5 = 4;
    v6 = (a3 & 0x1000) == 0;
  }
  else
  {
    if (a4 && self->_newCarrierType && !self->_addCarrierFlag)
    {
      v4 = 128;
      if ((a3 & 0x2000) == 0)
        goto LABEL_22;
      goto LABEL_19;
    }
    v4 = 1;
    if ((a3 & 4) != 0)
      v5 = 3;
    else
      v5 = 2;
    v6 = (a3 & 2) == 0;
  }
  if (v6)
    v4 = v5;
  if ((a3 & 0x2000) != 0)
  {
LABEL_19:
    if (a4 && self->_addCarrierFlag)
      v4 = 4;
  }
LABEL_22:
  if ((a3 & 0x10) == 0 || !self->_addInRangeFlag)
  {
LABEL_26:
    v7 = 0;
    if (!a4)
      return v4 + v7;
    goto LABEL_27;
  }
  v7 = 64;
  if (!a4)
    return v4 + v7;
LABEL_27:
  if (self->_addCarrierFlag)
  {
    v4 += 128;
  }
  else if (self->_newCarrierType)
  {
    v4 = 128;
  }
  return v4 + v7;
}

- (unsigned)setFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5 isCachedKey:(id)a6 mask:(unsigned int)a7
{
  _BOOL8 v9;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v9 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_interfaceInfoDictionary, "objectForKeyedSubscript:", a4);
  if (!v13)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_interfaceInfoDictionary, "setObject:forKeyedSubscript:", v13, a4);
    v14 = (void *)MEMORY[0x1E0CB37E8];
    if (objc_msgSend(a4, "hasPrefix:", CFSTR("gk_ci_")))
      v15 = 1;
    else
      v15 = 2;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v14, "numberWithInt:", v15), CFSTR("interfaceType"));
  }
  v16 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("commnatFlags")), "unsignedLongValue");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16 & ~a7 | a7 & a3), CFSTR("commnatFlags"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9), a6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136316930;
      v21 = v17;
      v22 = 2080;
      v23 = "-[GKNATObserverInternal setFlags:forInterface:isCached:isCachedKey:mask:]";
      v24 = 1024;
      v25 = 467;
      v26 = 1024;
      v27 = a3;
      v28 = 1024;
      v29 = a7;
      v30 = 1024;
      v31 = v16;
      v32 = 1024;
      v33 = v16 & ~a7 | a7 & a3;
      v34 = 1024;
      v35 = v9;
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver setting flags[%08X] mask[%08X] old[%08X]=>result[%08X] (cached:%d)", (uint8_t *)&v20, 0x3Au);
    }
  }
  return v16 & ~a7 | a7 & a3;
}

- (unsigned)setCommNATFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5
{
  return -[GKNATObserverInternal setFlags:forInterface:isCached:isCachedKey:mask:](self, "setFlags:forInterface:isCached:isCachedKey:mask:", *(_QWORD *)&a3, a4, a5, CFSTR("commnatCached"), 10239);
}

- (unsigned)setTCPFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5
{
  return -[GKNATObserverInternal setFlags:forInterface:isCached:isCachedKey:mask:](self, "setFlags:forInterface:isCached:isCachedKey:mask:", *(_QWORD *)&a3, a4, a5, CFSTR("tcpCached"), 2048);
}

- (unsigned)setSSLFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5
{
  return -[GKNATObserverInternal setFlags:forInterface:isCached:isCachedKey:mask:](self, "setFlags:forInterface:isCached:isCachedKey:mask:", *(_QWORD *)&a3, a4, a5, CFSTR("sslCached"), 4096);
}

- (void)calculateSummmaryNATType:(int *)a3 andCarrierNATType:(int *)a4 andNonCarrierNATType:(int *)a5 copyInterfaceInfoDictionary:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  BOOL v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  BOOL v26;
  NSMutableDictionary *obj;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_interfaceInfoDictionary;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_interfaceInfoDictionary, "objectForKeyedSubscript:", v13);
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend(v13, "hasPrefix:", CFSTR("gk_ci_"));
          v17 = -[GKNATObserverInternal natTypeForCommNATFlags:isCarrier:](self, "natTypeForCommNATFlags:isCarrier:", objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("commnatFlags")), "unsignedLongValue"), objc_msgSend(v13, "hasPrefix:", CFSTR("gk_ci_")));
          if (v16)
            v18 = v9;
          else
            v18 = v10;
          v19 = v17 - 128;
          if (v17 <= 0x7F)
            v19 = v17;
          if (v18 > 0x7F)
            v18 -= 128;
          if (v19)
          {
            if (!v18 || v19 != 4 && (v18 != 4 ? (v20 = v19 >= v18) : (v20 = 0), !v20))
            {
              if (v16)
                v9 = v17;
              else
                v10 = v17;
            }
          }
        }
      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v22 = !self->_favorNonCarrier || v10 == 0 || v10 == 4;
  v23 = v10;
  if (v22)
  {
    v24 = v9 <= 0x7F ? v9 : v9 - 128;
    v25 = v10 <= 0x7F ? v10 : v10 - 128;
    v23 = v10;
    if (v24)
    {
      if (!v25 || (v23 = v10, v24 != 4) && (v24 >= v25 ? (v26 = v25 == 4) : (v26 = 1), v23 = v10, v26))
        v23 = v9;
    }
  }
  if (a3)
    *a3 = v23;
  if (a4)
    *a4 = v9;
  if (a5)
    *a5 = v10;
  if (a6)
    *a6 = (id)-[NSMutableDictionary copyGKSDeepMutable](self->_interfaceInfoDictionary, "copyGKSDeepMutable");
}

- (int)currentNATType
{
  uint64_t v3;
  NSObject *v4;
  NSMutableDictionary *interfaceInfoDictionary;
  const char *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_xNATCheck, "lock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      interfaceInfoDictionary = self->_interfaceInfoDictionary;
      if (interfaceInfoDictionary)
        v6 = (const char *)objc_msgSend((id)-[NSMutableDictionary description](interfaceInfoDictionary, "description"), "UTF8String");
      else
        v6 = "<nil>";
      v8 = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[GKNATObserverInternal currentNATType]";
      v12 = 1024;
      v13 = 556;
      v14 = 2080;
      v15 = v6;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver _commNATFlagDictionary = %s", (uint8_t *)&v8, 0x26u);
    }
  }
  v8 = -1431655766;
  -[GKNATObserverInternal calculateSummmaryNATType:andCarrierNATType:andNonCarrierNATType:copyInterfaceInfoDictionary:](self, "calculateSummmaryNATType:andCarrierNATType:andNonCarrierNATType:copyInterfaceInfoDictionary:", &v8, 0, 0, 0);
  -[NSRecursiveLock unlock](self->_xNATCheck, "unlock");
  return v8;
}

- (void)shouldTryNATCheck
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d GKNATObserver: running NAT check from startConnection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportNATType
{
  NSObject *reportNATQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  reportNATQueue = self->_reportNATQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__GKNATObserverInternal_reportNATType__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(reportNATQueue, v3);
}

void __38__GKNATObserverInternal_reportNATType__block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  _DWORD *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  id v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BYTE v41[10];
  __int16 v42;
  unsigned int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v32 = -1431655766;
  v33 = -1431655766;
  v31 = -1431655766;
  v30 = (id)0xAAAAAAAAAAAAAAAALL;
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
  objc_msgSend(*v2, "calculateSummmaryNATType:andCarrierNATType:andNonCarrierNATType:copyInterfaceInfoDictionary:", &v33, &v32, &v31, &v30);
  objc_msgSend(*((id *)*v2 + 3), "unlock");
  if (!objc_msgSend(*v2, "delegate"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_40;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 136316418;
    v35 = v12;
    v36 = 2080;
    v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
    v38 = 1024;
    v39 = 640;
    v40 = 1024;
    *(_DWORD *)v41 = v33;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v32;
    v42 = 1024;
    v43 = v31;
    v14 = " [%s] %s:%d GKNATObserver cannot report NAT Type %d (%d/%d), delegate is nil!";
LABEL_19:
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x2Eu);
    goto LABEL_40;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E08]);
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v33);
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32);
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v31);
    v7 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("summaryType"), v5, CFSTR("carrierType"), v6, CFSTR("nonCarrierType"), v30, CFSTR("ifDictionary"), 0);
    v8 = (void *)objc_opt_class();
    objc_sync_enter(v8);
    v9 = (void *)cachedNATTypeDictionary;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 137))
    {
      cachedNATTypeDictionary = v7;

      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v35 = v10;
          v36 = 2080;
          v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
          v38 = 1024;
          v39 = 599;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: updating cache with new NAT dict", buf, 0x1Cu);
        }
      }
    }
    else if (cachedNATTypeDictionary)
    {
      v20 = (id)cachedNATTypeDictionary;

      v33 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("summaryType")), "unsignedLongValue");
      v32 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("carrierType")), "unsignedLongValue");
      v31 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("nonCarrierType")), "unsignedLongValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v35 = v21;
          v36 = 2080;
          v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
          v38 = 1024;
          v39 = 610;
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: using cached NAT dict", buf, 0x1Cu);
        }
      }
      v7 = v20;
    }
    objc_sync_exit(v8);
    v23 = *(_DWORD **)(a1 + 32);
    if (v23[8] == v33 && v23[9] == v32 && v23[10] == v31)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (v7)
            v26 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          else
            v26 = "<nil>";
          *(_DWORD *)buf = 136315906;
          v35 = v24;
          v36 = 2080;
          v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
          v38 = 1024;
          v39 = 624;
          v40 = 2080;
          *(_QWORD *)v41 = v26;
          _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver not reporting NAT Type dictionary [%s] - no change", buf, 0x26u);
        }
      }
    }
    else
    {
      v23[8] = v33;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) = v32;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = v31;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (v7)
            v29 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          else
            v29 = "<nil>";
          *(_DWORD *)buf = 136315906;
          v35 = v27;
          v36 = 2080;
          v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
          v38 = 1024;
          v39 = 621;
          v40 = 2080;
          *(_QWORD *)v41 = v29;
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver reporting NAT Type dictionary [%s]", buf, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "NATTypeDictionaryUpdated:", v7);
    }

    goto LABEL_40;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_40;
    v19 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 136316418;
    v35 = v19;
    v36 = 2080;
    v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
    v38 = 1024;
    v39 = 637;
    v40 = 1024;
    *(_DWORD *)v41 = v33;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v32;
    v42 = 1024;
    v43 = v31;
    v14 = " [%s] %s:%d GKNATObserver cannot report NAT Type %d (%d/%d), delegate does not respond to callbacks!";
    goto LABEL_19;
  }
  v15 = objc_msgSend(*(id *)(a1 + 32), "currentNATType");
  v33 = v15;
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) != v15)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = v15;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v35 = v16;
        v36 = 2080;
        v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
        v38 = 1024;
        v39 = 633;
        v40 = 1024;
        *(_DWORD *)v41 = v33;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver reporting NAT Type %d", buf, 0x22u);
      }
    }
    v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
    objc_msgSend(v18, "NATTypeDidChange:", v33);
  }
LABEL_40:

}

- (void)setDelegate:(id)a3
{
  id v5;
  __SCDynamicStore *dynamicStore;
  __SCDynamicStore *v7;

  objc_sync_enter(self);
  if (!a3 || -[GKNATObserverInternal delegate](self, "delegate") != a3)
  {
    objc_storeWeak(&self->_delegate, a3);
    v5 = -[GKNATObserverInternal delegate](self, "delegate");
    dynamicStore = self->_dynamicStore;
    if (v5)
    {
      if (!dynamicStore)
        -[GKNATObserverInternal registerForNetworkChanges](self, "registerForNetworkChanges");
      self->_lastReportedNATType = -1;
      -[GKNATObserverInternal reportNATType](self, "reportNATType");
    }
    else if (dynamicStore)
    {
      SCDynamicStoreSetDispatchQueue(dynamicStore, 0);
      v7 = self->_dynamicStore;
      if (v7)
      {
        CFRelease(v7);
        self->_dynamicStore = 0;
      }
    }
  }
  objc_sync_exit(self);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (tagCommNATInfo)callCommNATTestFromIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4
{
  socklen_t dwIPv4;
  socklen_t v5;
  tagIPPORT *v6;
  tagIPPORT *v7;
  tagIPPORT *v8;
  double v9;
  double v10;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int16 wPort;
  unsigned __int16 v23;
  double v24;
  tagCommNATInfo *v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int var0;
  double v29;
  int *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BYTE v41[14];
  __int16 v42;
  int *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  dwIPv4 = InterpretAddressX();
  v5 = InterpretAddressX();
  v6 = +[GKSConnectivitySettings getIPPortForService:](GKSConnectivitySettings, "getIPPortForService:", CFSTR("gk-commnat-main0-name"));
  if (!v6)
    v6 = +[GKSConnectivitySettings getIPPortForService:](GKSConnectivitySettings, "getIPPortForService:", CFSTR("gk-commnat-main0"));
  v7 = +[GKSConnectivitySettings getIPPortForService:](GKSConnectivitySettings, "getIPPortForService:", CFSTR("gk-commnat-main1-name"), a4, a3);
  if (!v7)
    v7 = +[GKSConnectivitySettings getIPPortForService:](GKSConnectivitySettings, "getIPPortForService:", CFSTR("gk-commnat-main1"));
  v8 = +[GKSConnectivitySettings getIPPortForService:](GKSConnectivitySettings, "getIPPortForService:", CFSTR("gk-commnat-cohort-name"));
  if (!v8)
    v8 = +[GKSConnectivitySettings getIPPortForService:](GKSConnectivitySettings, "getIPPortForService:", CFSTR("gk-commnat-cohort"));
  objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-nat-type-timeout")), "doubleValue");
  v10 = v9;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v10 <= 0.0)
  {
    v10 = 10.0;
    if (ErrorLogLevelForModule >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v35 = v15;
        v36 = 2080;
        v37 = "-[GKNATObserverInternal callCommNATTestFromIPPort:ipv6Prefix:]";
        v38 = 1024;
        v39 = 705;
        v40 = 2048;
        *(_QWORD *)v41 = 0x4024000000000000;
        v14 = " [%s] %s:%d natchecktimeout using default: %lf";
        goto LABEL_14;
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v35 = v12;
      v36 = 2080;
      v37 = "-[GKNATObserverInternal callCommNATTestFromIPPort:ipv6Prefix:]";
      v38 = 1024;
      v39 = 707;
      v40 = 2048;
      *(double *)v41 = v10;
      v14 = " [%s] %s:%d natchecktimeout set to %lf from bag";
LABEL_14:
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x26u);
    }
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v17 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("CommNATMainIP"));
  v18 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("CommNATMainPort0"));
  v19 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("CommNATMainPort1"));
  v20 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("CommNATCohortIP"));
  v21 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("CommNATCohortPort0"));
  if (!v17)
  {
    if (v6)
    {
      dwIPv4 = v6->IP.dwIPv4;
      if (!v18)
        goto LABEL_20;
    }
    else if (!v18)
    {
LABEL_27:
      wPort = 16385;
      if (!v19)
        goto LABEL_28;
LABEL_25:
      v23 = objc_msgSend(v19, "integerValue");
      if (v20)
        goto LABEL_30;
      goto LABEL_33;
    }
LABEL_24:
    wPort = objc_msgSend(v18, "integerValue");
    if (!v19)
      goto LABEL_28;
    goto LABEL_25;
  }
  objc_msgSend(v17, "UTF8String");
  dwIPv4 = InterpretAddressX();
  if (v18)
    goto LABEL_24;
LABEL_20:
  if (!v6)
    goto LABEL_27;
  wPort = v6->wPort;
  if (v19)
    goto LABEL_25;
LABEL_28:
  if (v7)
  {
    v23 = v7->wPort;
    if (v20)
      goto LABEL_30;
  }
  else
  {
    v23 = 16386;
    if (v20)
    {
LABEL_30:
      objc_msgSend(v20, "UTF8String");
      v5 = InterpretAddressX();
      if (!v21)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
LABEL_33:
  if (v8)
  {
    v5 = v8->IP.dwIPv4;
    if (!v21)
      goto LABEL_38;
    goto LABEL_37;
  }
  if (v21)
LABEL_37:
    objc_msgSend(v21, "integerValue");
LABEL_38:
  free(v6);
  free(v7);
  free(v8);
  v24 = micro();
  v25 = (tagCommNATInfo *)CommNAT_Test(v33, 0x4013u, dwIPv4, v10, wPort, v23, v5);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v25)
        var0 = v25->var0;
      else
        var0 = 0;
      v29 = micro();
      *(_DWORD *)buf = 136316418;
      v35 = v26;
      v36 = 2080;
      v37 = "-[GKNATObserverInternal callCommNATTestFromIPPort:ipv6Prefix:]";
      v38 = 1024;
      v39 = 750;
      v40 = 1024;
      *(_DWORD *)v41 = var0;
      *(_WORD *)&v41[4] = 2048;
      *(double *)&v41[6] = v29 - v24;
      v42 = 2080;
      v43 = v33 + 1;
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d commnat_test: [%08X] after %0.6lfs (%s)", buf, 0x36u);
    }
  }
  return v25;
}

- (int)callHTTPTestFromIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 ToServer:(id)a5 isSSL:(BOOL)a6
{
  _BOOL4 v6;
  sockaddr v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  const __CFAllocator *v14;
  const __CFURL *v15;
  __CFString *v16;
  SInt32 v17;
  unsigned __int16 v18;
  CFStringRef v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  __CFHTTPMessage *Request;
  const __CFData *v24;
  int Length;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v37;
  uint8_t *v38;
  int v39;
  __int32_t *v40;
  int v41;
  int v42;
  int v43;
  int ErrorLogLevelForModule;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  size_t v50;
  unsigned int v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  uint32_t v63;
  uint64_t v65;
  int v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  int v70;
  uint64_t v71;
  _BOOL4 v72;
  socklen_t v73;
  int v74;
  timeval v75;
  unsigned int v76;
  uint8_t v77[4];
  uint64_t v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  _BYTE v84[10];
  int v85;
  fd_set v86;
  _DWORD __b[256];
  uint8_t buf[1024];
  sockaddr v89;
  sockaddr v90;
  sockaddr v91;
  sockaddr v92;
  sockaddr v93;
  sockaddr v94;
  sockaddr v95;
  sockaddr v96;
  fd_set v97;
  uint64_t v98;

  v6 = a6;
  v98 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v9.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v9.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  v96 = v9;
  v95 = v9;
  v94 = v9;
  v93 = v9;
  v92 = v9;
  v91 = v9;
  v90 = v9;
  v89 = v9;
  v76 = -1431655766;
  objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-nat-type-timeout")), "doubleValue");
  v11 = v10;
  if (v10 <= 0.0)
  {
    v11 = 10.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 821;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = 0x4024000000000000;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d natchecktimeout using default: %lf", buf, 0x26u);
      }
    }
  }
  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v15 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)a5, 0);
  v16 = (__CFString *)CFURLCopyHostName(v15);
  -[__CFString UTF8String](v16, "UTF8String");
  v76 = InterpretAddressX();
  v17 = CFURLGetPortNumber(v15);
  if (v17 < 1)
  {
    if (v6)
      v18 = 443;
    else
      v18 = 80;
  }
  else
  {
    v18 = v17;
    v19 = CFStringCreateWithFormat(v14, 0, CFSTR("%@:%u"), v16, (unsigned __int16)v17);
    CFRelease(v16);
    v16 = (__CFString *)v19;
  }
  v20 = v6;
  v21 = buf;
  memset(buf, 170, sizeof(buf));
  memset(__b, 170, sizeof(__b));
  v72 = v20;
  if (v20)
  {
    v21 = (uint8_t *)&cSSLClientHello;
    v22 = 51;
  }
  else
  {
    Request = CFHTTPMessageCreateRequest(v14, CFSTR("GET"), v15, (CFStringRef)*MEMORY[0x1E0C930E8]);
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Host"), v16);
    v24 = CFHTTPMessageCopySerializedMessage(Request);
    Length = CFDataGetLength(v24);
    if (Length >= 1024)
      v22 = 1024;
    else
      v22 = Length;
    CFDataGetBytePtr(v24);
    __memcpy_chk();
    CFRelease(Request);
    CFRelease(v24);
    buf[(int)v22] = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a5)
        v28 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      else
        v28 = "<nil>";
      v97.fds_bits[0] = 136317186;
      *(_QWORD *)&v97.fds_bits[1] = v26;
      LOWORD(v97.fds_bits[3]) = 2080;
      *(_QWORD *)((char *)&v97.fds_bits[3] + 2) = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
      HIWORD(v97.fds_bits[5]) = 1024;
      v97.fds_bits[6] = 851;
      LOWORD(v97.fds_bits[7]) = 2080;
      *(_QWORD *)((char *)&v97.fds_bits[7] + 2) = v28;
      HIWORD(v97.fds_bits[9]) = 1024;
      v97.fds_bits[10] = HIBYTE(v76);
      LOWORD(v97.fds_bits[11]) = 1024;
      *(__int32_t *)((char *)&v97.fds_bits[11] + 2) = BYTE2(v76);
      HIWORD(v97.fds_bits[12]) = 1024;
      v97.fds_bits[13] = BYTE1(v76);
      LOWORD(v97.fds_bits[14]) = 1024;
      *(__int32_t *)((char *)&v97.fds_bits[14] + 2) = v76;
      HIWORD(v97.fds_bits[15]) = 1024;
      v97.fds_bits[16] = v18;
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d callHTTPTestFromIPPort: [%s], IP: %u.%u.%u.%u:%u", (uint8_t *)&v97, 0x44u);
    }
  }
  CFRelease(v15);
  CFRelease(v16);
  if ((a3->iFlags & 1) != 0)
    v29 = 30;
  else
    v29 = 2;
  v30 = socket(v29, 1, 6);
  if (v30 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:].cold.1();
    }
    return 0;
  }
  v31 = v30;
  v86.fds_bits[0] = 1;
  setsockopt(v30, 0xFFFF, 4130, &v86, 4u);
  memset(&v97, 0, sizeof(v97));
  FillSockAddrStorage();
  if (bind(v31, (const sockaddr *)&v97, LOBYTE(v97.fds_bits[0])))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:].cold.3();
    }
LABEL_30:
    close(v31);
    return 0;
  }
  if ((v31 & 0x80000000) != 0)
    return 0;
  v32 = fcntl(v31, 3, 0);
  fcntl(v31, 4, v32 | 4u);
  FillSockAddrStorage();
  v33 = connect(v31, &v89, v89.sa_len);
  if (v33)
  {
    if (v33 == -1 && *__error() != 36)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:].cold.2();
      }
      goto LABEL_30;
    }
    v34 = 0;
  }
  else
  {
    v34 = 1;
  }
  v75.tv_sec = (uint64_t)v11;
  *(&v75.tv_usec + 1) = -1431655766;
  v37 = 1 << v31;
  v75.tv_usec = (int)((v11 - (double)(uint64_t)v11) * 1000000.0);
  v71 = (int)v22;
  v38 = v21;
  while (1)
  {
    memset(&v97, 0, sizeof(v97));
    memset(&v86, 0, sizeof(v86));
    if (v34 > 1)
    {
      v41 = __darwin_check_fd_set_overflow(v31, &v97, 0);
      v40 = &v97.fds_bits[v31 >> 5];
      if (!v41)
        goto LABEL_48;
LABEL_47:
      *v40 |= v37;
      goto LABEL_48;
    }
    v39 = __darwin_check_fd_set_overflow(v31, &v86, 0);
    v40 = &v86.fds_bits[v31 >> 5];
    if (v39)
      goto LABEL_47;
LABEL_48:
    v42 = select(v31 + 1, &v97, &v86, 0, &v75);
    if (!v42)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v53 = VRTraceErrorLogLevelToCSTR();
        v54 = *MEMORY[0x1E0CF2758];
        v55 = v72;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v77 = 136316162;
          v78 = v53;
          v79 = 2080;
          v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
          v81 = 1024;
          v82 = 896;
          v83 = 1024;
          *(_DWORD *)v84 = 896;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = 10;
          v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserve"
                "r.m:%d: callHTTPTestFromIPPort: connect timed out %d";
          goto LABEL_113;
        }
        goto LABEL_83;
      }
      goto LABEL_105;
    }
    if (v42 == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_105;
      v57 = VRTraceErrorLogLevelToCSTR();
      v54 = *MEMORY[0x1E0CF2758];
      v55 = v72;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_83;
      v70 = *__error();
      *(_DWORD *)v77 = 136316162;
      v78 = v57;
      v79 = 2080;
      v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
      v81 = 1024;
      v82 = 893;
      v83 = 1024;
      *(_DWORD *)v84 = 893;
      *(_WORD *)&v84[4] = 1024;
      *(_DWORD *)&v84[6] = v70;
      v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:"
            "%d: callHTTPTestFromIPPort: select failed for connect (%d)";
LABEL_113:
      v62 = v54;
      v63 = 40;
LABEL_114:
      _os_log_error_impl(&dword_1D8A54000, v62, OS_LOG_TYPE_ERROR, v56, v77, v63);
      goto LABEL_83;
    }
    if (!v34)
    {
      v73 = 4;
      v74 = -1431655766;
      getsockopt(v31, 0xFFFF, 4103, &v74, &v73);
      v43 = v74;
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v43)
      {
        if (ErrorLogLevelForModule < 3)
        {
          v34 = 5;
        }
        else
        {
          v45 = VRTraceErrorLogLevelToCSTR();
          v46 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v77 = 136316162;
            v78 = v45;
            v79 = 2080;
            v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
            v81 = 1024;
            v82 = 905;
            v83 = 1024;
            *(_DWORD *)v84 = 905;
            *(_WORD *)&v84[4] = 1024;
            *(_DWORD *)&v84[6] = v74;
            _os_log_error_impl(&dword_1D8A54000, v46, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d: callHTTPTestFromIPPort: connect refused (%d)", v77, 0x28u);
          }
          v34 = 5;
        }
      }
      else if (ErrorLogLevelForModule < 7)
      {
        v34 = 1;
      }
      else
      {
        v47 = v22;
        v48 = VRTraceErrorLogLevelToCSTR();
        v49 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v77 = 136315650;
          v78 = v48;
          v79 = 2080;
          v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
          v81 = 1024;
          v82 = 908;
          _os_log_impl(&dword_1D8A54000, v49, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d callHTTPTestFromIPPort: TCP socket connected!", v77, 0x1Cu);
        }
        v34 = 1;
        v22 = v47;
      }
    }
    if (v34 == 2)
      goto LABEL_69;
    if (v34 == 1)
      break;
LABEL_76:
    if (v34 == 5)
      goto LABEL_105;
  }
  if (!__darwin_check_fd_set_overflow(v31, &v86, 0))
    goto LABEL_75;
  if ((v86.fds_bits[v31 >> 5] & v37) == 0)
    goto LABEL_75;
  v50 = (v22 + (_DWORD)v21 - (_DWORD)v38);
  if ((int)v50 < 1)
    goto LABEL_75;
  v51 = write(v31, v38, v50);
  if ((v51 & 0x80000000) != 0)
  {
    if (*__error() != 35)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v65 = VRTraceErrorLogLevelToCSTR();
        v54 = *MEMORY[0x1E0CF2758];
        v55 = v72;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v66 = *__error();
          *(_DWORD *)v77 = 136316162;
          v78 = v65;
          v79 = 2080;
          v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
          v81 = 1024;
          v82 = 917;
          v83 = 1024;
          *(_DWORD *)v84 = 917;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = v66;
          v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserve"
                "r.m:%d: callHTTPTestFromIPPort: write failed with error=%d";
          goto LABEL_113;
        }
LABEL_83:
        v35 = 0;
        goto LABEL_106;
      }
      goto LABEL_105;
    }
LABEL_75:
    v34 = 1;
    goto LABEL_76;
  }
  v38 += v51;
  if (v38 - v21 != v71)
    goto LABEL_75;
LABEL_69:
  if (!__darwin_check_fd_set_overflow(v31, &v97, 0) || (v97.fds_bits[v31 >> 5] & v37) == 0)
  {
LABEL_73:
    v34 = 2;
    goto LABEL_76;
  }
  v52 = read(v31, __b, 0x400uLL);
  if (v52 < 0)
  {
    if (*__error() != 35)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v58 = VRTraceErrorLogLevelToCSTR();
        v54 = *MEMORY[0x1E0CF2758];
        v55 = v72;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v59 = *__error();
          *(_DWORD *)v77 = 136316162;
          v78 = v58;
          v79 = 2080;
          v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
          v81 = 1024;
          v82 = 933;
          v83 = 1024;
          *(_DWORD *)v84 = 933;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = v59;
          v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserve"
                "r.m:%d: callHTTPTestFromIPPort: read failed with error=%d";
          goto LABEL_113;
        }
        goto LABEL_83;
      }
LABEL_105:
      v35 = 0;
      v55 = v72;
      goto LABEL_106;
    }
    goto LABEL_73;
  }
  if (!v52)
  {
    v55 = v72;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_83;
    v60 = VRTraceErrorLogLevelToCSTR();
    v61 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_83;
    *(_DWORD *)v77 = 136315906;
    v78 = v60;
    v79 = 2080;
    v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
    v81 = 1024;
    v82 = 937;
    v83 = 1024;
    *(_DWORD *)v84 = 937;
    v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d"
          ": callHTTPTestFromIPPort: server terminated";
    v62 = v61;
    v63 = 34;
    goto LABEL_114;
  }
  v55 = v72;
  v35 = v72 || __b[0] == 1347703880 && LOWORD(__b[1]) == 12591;
LABEL_106:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v67 = VRTraceErrorLogLevelToCSTR();
    v68 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v77 = 136316162;
      v69 = "HTTP";
      v78 = v67;
      v79 = 2080;
      if (v55)
        v69 = "HTTPS";
      v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
      v81 = 1024;
      v82 = 952;
      v83 = 2080;
      *(_QWORD *)v84 = v69;
      *(_WORD *)&v84[8] = 1024;
      v85 = v35;
      _os_log_impl(&dword_1D8A54000, v68, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d callHTTPTestFromIPPort: for %s result %d", v77, 0x2Cu);
    }
  }
  close(v31);
  return v35;
}

- (BOOL)ensureNatCachePathExists
{
  int Directory;
  uint64_t v3;
  NSObject *v4;
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
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2698], "getCachesDirectoryPath"), "UTF8String");
  Directory = VCDiskUtils_CreateDirectory();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[GKNATObserverInternal ensureNatCachePathExists]";
      v10 = 1024;
      v11 = 976;
      v12 = 1024;
      v13 = Directory;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver:ensureNatCachePathExists : %d", (uint8_t *)&v6, 0x22u);
    }
  }
  return Directory;
}

- (id)copyNatTypeCachePlistScheme
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL4 v8;
  CFPropertyListRef v9;
  void *v10;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2698], "getCachesDirectoryPath"), "stringByAppendingString:", CFSTR("/cache.plist"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v3);
  if (v4)
  {
    v5 = v4;
    v6 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("natTypeCache"));

    return v6;
  }
  else
  {
    v8 = -[GKNATObserverInternal ensureNatCachePathExists](self, "ensureNatCachePathExists");
    CFPreferencesAppSynchronize(CFSTR("com.apple.conference"));
    v9 = CFPreferencesCopyAppValue(CFSTR("natTypeCache"), CFSTR("com.apple.conference"));
    v10 = (void *)v9;
    if (v8 && v9)
    {
      CFPreferencesSetAppValue(CFSTR("natTypeCache"), 0, CFSTR("com.apple.conference"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.conference"));
    }
    if (v8)
      -[GKNATObserverInternal updateNatTypeCache_CachePlistScheme:](self, "updateNatTypeCache_CachePlistScheme:", v10);
    return v10;
  }
}

- (void)updateNatTypeCache_CachePlistScheme:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2698], "getCachesDirectoryPath"), "stringByAppendingString:", CFSTR("/cache.plist"));
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v4);
  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", a3, CFSTR("natTypeCache"));
    v5 = v6;
  }
  objc_msgSend(v5, "writeToFile:atomically:", v4, 1);

}

- (id)copyNatTypeCache_OSXGamedScheme
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.gamed"));
  return (id)CFPreferencesCopyAppValue(CFSTR("natTypeCache"), CFSTR("com.apple.gamed"));
}

- (void)updateNatTypeCache_OSXGamedScheme:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("natTypeCache"), a3, CFSTR("com.apple.gamed"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.gamed"));
}

- (id)lookupCachedNATFlagsForNetwork:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
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

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = -[GKNATObserverInternal copyNatTypeCache](self, "copyNatTypeCache");
    v3 = (id)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v3), "objectForKey:", CFSTR("natFlags"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      v7 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315906;
          v10 = v5;
          v11 = 2080;
          v12 = "-[GKNATObserverInternal lookupCachedNATFlagsForNetwork:]";
          v13 = 1024;
          v14 = 1082;
          v15 = 2080;
          v16 = objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: NAT Cache = %s", (uint8_t *)&v9, 0x26u);
          if (!v4)
            return v3;
          goto LABEL_9;
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[GKNATObserverInternal lookupCachedNATFlagsForNetwork:].cold.1(v5, v4);
        if (!v4)
          return v3;
        goto LABEL_9;
      }
    }
    if (v4)
LABEL_9:
      CFRelease(v4);
  }
  return v3;
}

- (void)cacheNATFlags:(id)a3 forNetwork:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  CFTypeRef cf;
  GKNATObserverInternal *v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v38 = v7;
        v39 = 2080;
        v40 = "-[GKNATObserverInternal cacheNATFlags:forNetwork:]";
        v41 = 1024;
        v42 = 1095;
        v43 = 2080;
        v44 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        v45 = 2080;
        v46 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: Caching NAT flags [%s] for network \"%s\"...", buf, 0x30u);
      }
    }
    v9 = -[GKNATObserverInternal copyNatTypeCache](self, "copyNatTypeCache");
    if (v9)
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v9);
    else
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v10;
    v31 = self;
    if (objc_msgSend(v10, "objectForKeyedSubscript:", a4))
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", objc_msgSend(v11, "objectForKeyedSubscript:", a4));
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    cf = v9;
    if (a3)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", a3, CFSTR("natFlags"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D68], "date"), CFSTR("natFlagsLastUpdated"));
    }
    else
    {
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("natFlags"));
    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, a4);
    if ((unint64_t)objc_msgSend(v11, "count") >= 0x65)
    {
      *(_QWORD *)&v14 = 136316162;
      v29 = v14;
      do
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v32, 16, v29);
        if (!v15)
          break;
        v16 = v15;
        v17 = 0;
        v18 = 0;
        v19 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v11);
            v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v22 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v21), "objectForKey:", CFSTR("natFlagsLastUpdated"));
            if (!v22)
            {
              v17 = v21;
              goto LABEL_29;
            }
            v23 = (void *)v22;
            if (!v18 || objc_msgSend(v18, "earlierDate:", v22) == v22)
            {
              v17 = v21;
              v18 = v23;
            }
          }
          v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
          if (v16)
            continue;
          break;
        }
LABEL_29:
        if (!v17)
          break;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          v26 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = objc_msgSend(v17, "UTF8String");
              *(_DWORD *)buf = v29;
              v38 = v24;
              v39 = 2080;
              v40 = "-[GKNATObserverInternal cacheNATFlags:forNetwork:]";
              v41 = 1024;
              v42 = 1142;
              v43 = 2080;
              v44 = v27;
              v45 = 1024;
              LODWORD(v46) = 100;
              _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: Pruning network \"%s\" from NAT flags cache. (GKNATObserverMaxCachedNetworks=%d)", buf, 0x2Cu);
            }
          }
          else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v28 = objc_msgSend(v17, "UTF8String");
            *(_DWORD *)buf = v29;
            v38 = v24;
            v39 = 2080;
            v40 = "-[GKNATObserverInternal cacheNATFlags:forNetwork:]";
            v41 = 1024;
            v42 = 1142;
            v43 = 2080;
            v44 = v28;
            v45 = 1024;
            LODWORD(v46) = 100;
            _os_log_debug_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKNATObserver: Pruning network \"%s\" from NAT flags cache. (GKNATObserverMaxCachedNetworks=%d)", buf, 0x2Cu);
          }
        }
        objc_msgSend(v11, "removeObjectForKey:", v17);
      }
      while ((unint64_t)objc_msgSend(v11, "count") > 0x64);
    }
    -[GKNATObserverInternal updateNatTypeCache:](v31, "updateNatTypeCache:", v11);
    if (cf)
      CFRelease(cf);

  }
}

- (void)NATCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  double v15;
  __CFString *v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  double v21;
  id v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  double v33;
  uint64_t v34;
  NSObject *v35;
  tagCommNATInfo *v36;
  uint64_t var0;
  double v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  NSObject *v42;
  double v43;
  double v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  double v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v5 = a5;
  v63 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if ((a3->iFlags & 4) != 0)
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gk_ci_%s"), a3->szIfName);
  else
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->szIfName);
  v11 = (void *)v10;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v11)
        v14 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
      else
        v14 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v54 = v12;
      v55 = 2080;
      v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
      v57 = 1024;
      v58 = 1169;
      v59 = 2080;
      v60 = *(double *)&v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: NATCheckWithIPPort starting for %s", buf, 0x26u);
    }
  }
  v15 = micro();
  if ((a3->iFlags & 4) != 0)
    v16 = CFSTR("gk_ci_cache");
  else
    v16 = -[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:](self, "nameForNetworkWithIPPort:interfaceName:", a3, v11);
  v17 = micro() - v15;
  if (v17 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v54 = v18;
      v55 = 2080;
      v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
      v57 = 1024;
      v58 = 1175;
      v59 = 2048;
      v60 = v17;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: nameForNetworkWithIPPort took %0.lf seconds", buf, 0x26u);
    }
  }
  v20 = micro();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_natCheckNetNameSema, 0xFFFFFFFFFFFFFFFFLL);
  if (v5)
  {
    if (v16)
    {
      v52 = v9;
      v21 = micro();
      v22 = -[GKNATObserverInternal lookupCachedNATFlagsForNetwork:](self, "lookupCachedNATFlagsForNetwork:", v16);
      v23 = micro() - v21;
      if (v23 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v54 = v24;
          v55 = 2080;
          v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
          v57 = 1024;
          v58 = 1192;
          v59 = 2048;
          v60 = v23;
          _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: cache lookup took %0.lf seconds", buf, 0x26u);
        }
      }
      if (!v22)
        goto LABEL_34;
      -[NSRecursiveLock lock](self->_xNATCheck, "lock");
      v26 = objc_msgSend(v22, "unsignedLongValue");
      -[GKNATObserverInternal setCommNATFlags:forInterface:isCached:](self, "setCommNATFlags:forInterface:isCached:", v26, v11, 1);
      -[GKNATObserverInternal setTCPFlags:forInterface:isCached:](self, "setTCPFlags:forInterface:isCached:", v26, v11, 1);
      -[GKNATObserverInternal setSSLFlags:forInterface:isCached:](self, "setSSLFlags:forInterface:isCached:", v26, v11, 1);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v51 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v28 = objc_msgSend((id)-[__CFString description](v16, "description"), "UTF8String");
          *(_DWORD *)buf = 136316162;
          v54 = v51;
          v55 = 2080;
          v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
          v57 = 1024;
          v58 = 1201;
          v59 = 2080;
          v60 = *(double *)&v28;
          v61 = 2048;
          v62 = v26;
          _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: Cached NAT flags for network \"%s\": [%08lX]", buf, 0x30u);
        }
      }
      -[NSRecursiveLock unlock](self->_xNATCheck, "unlock");
      -[GKNATObserverInternal reportNATType](self, "reportNATType");
      v29 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentNetworkNames, "objectForKeyedSubscript:", v11), "isEqualToString:", v16);
      if ((v26 & 1) != 0)
      {
LABEL_34:
        v9 = v52;
      }
      else
      {
        v9 = v52;
        if (v29)
        {
          dispatch_semaphore_signal((dispatch_semaphore_t)self->_natCheckNetNameSema);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v30 = VRTraceErrorLogLevelToCSTR();
            v31 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v11)
                v32 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
              else
                v32 = "<nil>";
              v50 = objc_msgSend((id)-[__CFString description](v16, "description"), "UTF8String");
              *(_DWORD *)buf = 136316162;
              v54 = v30;
              v55 = 2080;
              v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
              v57 = 1024;
              v58 = 1209;
              v59 = 2080;
              v60 = *(double *)&v32;
              v61 = 2080;
              v62 = v50;
              v47 = " [%s] %s:%d GKNATObserver: Network on interface \"%s\" [%s] did not change, skipping...";
              v48 = v31;
              v49 = 48;
              goto LABEL_55;
            }
          }
          goto LABEL_56;
        }
      }
      -[NSMutableDictionary setValue:forKey:](self->_currentNetworkNames, "setValue:forKey:", v16, v11);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](self->_currentNetworkNames, "removeObjectForKey:", v11);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_natCheckNetNameSema);
  v33 = micro() - v20;
  if (v33 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v54 = v34;
      v55 = 2080;
      v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
      v57 = 1024;
      v58 = 1222;
      v59 = 2048;
      v60 = v33;
      _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: cache lookup semaphore took %0.lf seconds", buf, 0x26u);
    }
  }
  v36 = -[GKNATObserverInternal callCommNATTestFromIPPort:ipv6Prefix:](self, "callCommNATTestFromIPPort:ipv6Prefix:", a3, a4);
  if (v36)
    var0 = v36->var0;
  else
    var0 = 1;
  free(v36);
  v38 = micro();
  -[NSRecursiveLock lock](self->_xNATCheck, "lock");
  v39 = -[GKNATObserverInternal setCommNATFlags:forInterface:isCached:](self, "setCommNATFlags:forInterface:isCached:", var0, v11, 0);
  -[NSRecursiveLock unlock](self->_xNATCheck, "unlock");
  v40 = micro() - v38;
  if (v40 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v41 = VRTraceErrorLogLevelToCSTR();
    v42 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v54 = v41;
      v55 = 2080;
      v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
      v57 = 1024;
      v58 = 1235;
      v59 = 2048;
      v60 = v40;
      _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: updating NAT flags dictionary took %0.lf seconds", buf, 0x26u);
    }
  }
  -[GKNATObserverInternal reportNATType](self, "reportNATType");
  if (v5)
  {
    if (v16)
    {
      v43 = micro();
      -[GKNATObserverInternal cacheNATFlags:forNetwork:](self, "cacheNATFlags:forNetwork:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v39), v16);
      v44 = micro() - v43;
      if (v44 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v45 = VRTraceErrorLogLevelToCSTR();
        v46 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v54 = v45;
          v55 = 2080;
          v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
          v57 = 1024;
          v58 = 1245;
          v59 = 2048;
          v60 = v44;
          v47 = " [%s] %s:%d GKNATObserver: caching took %0.lf seconds";
          v48 = v46;
          v49 = 38;
LABEL_55:
          _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
        }
      }
    }
  }
LABEL_56:

}

- (void)HTTPCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if ((a3->iFlags & 4) != 0)
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gk_ci_%s"), a3->szIfName);
  else
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->szIfName);
  v11 = v10;
  if ((a3->iFlags & 4) != 0)
    v12 = CFSTR("gk_ci_cache");
  else
    v12 = -[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:](self, "nameForNetworkWithIPPort:interfaceName:", a3, v10);
  v13 = +[GKSConnectivitySettings getAddressForService:](GKSConnectivitySettings, "getAddressForService:", CFSTR("gk-p2p-tcp-check-url"));
  if (v13)
  {
    v14 = (-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:](self, "callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:", a3, a4, v13, 0) != 0) << 11;
    -[NSRecursiveLock lock](self->_xNATCheck, "lock");
    v15 = -[GKNATObserverInternal setTCPFlags:forInterface:isCached:](self, "setTCPFlags:forInterface:isCached:", v14, v11, 0);
    -[NSRecursiveLock unlock](self->_xNATCheck, "unlock");
    -[GKNATObserverInternal reportNATType](self, "reportNATType");
    if (v5 && v12)
      -[GKNATObserverInternal cacheNATFlags:forNetwork:](self, "cacheNATFlags:forNetwork:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15), v12);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[GKNATObserverInternal HTTPCheckWithIPPort:ipv6Prefix:useCache:].cold.1();
  }

}

- (void)HTTPSCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if ((a3->iFlags & 4) != 0)
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gk_ci_%s"), a3->szIfName);
  else
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->szIfName);
  v11 = v10;
  if ((a3->iFlags & 4) != 0)
    v12 = CFSTR("gk_ci_cache");
  else
    v12 = -[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:](self, "nameForNetworkWithIPPort:interfaceName:", a3, v10);
  v13 = +[GKSConnectivitySettings getAddressForService:](GKSConnectivitySettings, "getAddressForService:", CFSTR("gk-p2p-ssl-check-url"));
  if (v13)
  {
    v14 = (-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:](self, "callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:", a3, a4, v13, 1) != 0) << 12;
    -[NSRecursiveLock lock](self->_xNATCheck, "lock");
    v15 = -[GKNATObserverInternal setSSLFlags:forInterface:isCached:](self, "setSSLFlags:forInterface:isCached:", v14, v11, 0);
    -[NSRecursiveLock unlock](self->_xNATCheck, "unlock");
    -[GKNATObserverInternal reportNATType](self, "reportNATType");
    if (v5 && v12)
      -[GKNATObserverInternal cacheNATFlags:forNetwork:](self, "cacheNATFlags:forNetwork:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15), v12);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[GKNATObserverInternal HTTPSCheckWithIPPort:ipv6Prefix:useCache:].cold.1();
  }

}

- (void)clearRetries
{
  -[NSRecursiveLock lock](self->_xNATCheck, "lock");
  self->_NATCheckRetryCount = 0;
  -[NSRecursiveLock unlock](self->_xNATCheck, "unlock");
}

- (void)tryNATCheckWithDelay:(double)a3
{
  uint64_t v6;
  NSObject *v7;
  double v8;
  NSObject *natCheckQueue;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *Name;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_hasNATCheckStarted = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v6;
      v13 = 2080;
      v14 = "-[GKNATObserverInternal tryNATCheckWithDelay:]";
      v15 = 1024;
      v16 = 1332;
      v17 = 2080;
      Name = sel_getName(a2);
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: %s", buf, 0x26u);
    }
  }
  -[NSRecursiveLock lock](self->_xNATCheck, "lock");
  if (self->_fNATCheckQueued)
  {
    -[NSRecursiveLock unlock](self->_xNATCheck, "unlock");
  }
  else
  {
    if (self->_fNATCheckInProgress)
      v8 = 0.25;
    else
      v8 = 0.0;
    self->_fNATCheckQueued = 1;
    -[NSRecursiveLock unlock](self->_xNATCheck, "unlock");
    natCheckQueue = self->_natCheckQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke;
    block[3] = &unk_1E9E52910;
    block[4] = self;
    *(double *)&block[5] = a3;
    *(double *)&block[6] = v8;
    dispatch_async(natCheckQueue, block);
  }
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int LocalInterfaceListWithOptions;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *global_queue;
  IPPortWrapper *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  IPv6PrefixWrapper *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  IPPortWrapper *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  IPv6PrefixWrapper *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  id *v61;
  uint64_t v62;
  int v63;
  double v64;
  uint64_t v65;
  NSObject *v66;
  int v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  int v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v78;
  id v79;
  int v80;
  uint64_t v81;
  _QWORD v82[6];
  int v83;
  _QWORD v84[7];
  _QWORD v85[5];
  _QWORD v86[7];
  _QWORD v87[7];
  _QWORD v88[7];
  _QWORD block[5];
  uint64_t v90;
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  int v96;
  __int16 v97;
  _BYTE v98[20];
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v92 = v2;
      v93 = 2080;
      v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      v95 = 1024;
      v96 = 1345;
      v97 = 2048;
      *(_QWORD *)v98 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: start setting up NAT checks (delay: %lf)", buf, 0x26u);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unlock");
  usleep(((*(double *)(a1 + 40) + *(double *)(a1 + 48)) * 1000000.0));
  v90 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
  v79 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allKeys"), "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unlock");
  LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
  v81 = a1;
  if (LocalInterfaceListWithOptions >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = LocalInterfaceListWithOptions;
    v9 = 4;
    v10 = MEMORY[0x1E0C809B0];
    v78 = LocalInterfaceListWithOptions;
    while (1)
    {
      v99 = 0;
      v100 = 0;
      v11 = v90;
      if ((*(_BYTE *)(v90 + v9 - 4) & 1) == 0)
        goto LABEL_10;
      VCNAT64ResolverRegisterForPrefixUpdate((const char *)(v90 + v9), (uint64_t)NAT64ResolverCallBack, *(_QWORD *)(a1 + 32));
      VCNAT64ResolverGetPrefix(v90 + v9, &v99);
      if (VCNAT64ResolverIsNonzeroPrefix(&v99))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          break;
      }
LABEL_20:
      ++v6;
      v9 += 40;
      if (v8 == v6)
        goto LABEL_23;
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_117;
    block[3] = &unk_1E9E521C0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(global_queue, block);
    v11 = v90;
LABEL_10:
    if (strcmp((const char *)(v11 + v9), "lo0"))
    {
      v80 = v7;
      v13 = objc_alloc_init(IPPortWrapper);
      v14 = -[IPPortWrapper ipport](v13, "ipport");
      v15 = *(_QWORD *)(v90 + v9 + 28);
      v16 = *(_OWORD *)(v90 + v9 + 12);
      *(_OWORD *)v14 = *(_OWORD *)(v90 + v9 - 4);
      *(_OWORD *)(v14 + 16) = v16;
      *(_QWORD *)(v14 + 32) = v15;
      v17 = -[IPv6PrefixWrapper initWithPrefix:]([IPv6PrefixWrapper alloc], "initWithPrefix:", &v99);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v92 = v18;
          v93 = 2080;
          v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
          v95 = 1024;
          v96 = 1393;
          v97 = 1024;
          *(_DWORD *)v98 = v6;
          *(_WORD *)&v98[4] = 1024;
          *(_DWORD *)&v98[6] = v8;
          *(_WORD *)&v98[10] = 2080;
          *(_QWORD *)&v98[12] = v9 + v90;
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: queued non-carrier NAT check %d@%d, %s", buf, 0x32u);
        }
      }
      if ((*(_BYTE *)(v90 + v9 - 4) & 4) != 0)
        v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gk_ci_%s"), v90 + v9);
      else
        v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      objc_msgSend(v79, "removeObject:", v20);
      v21 = *(_QWORD *)(v81 + 32);
      v22 = *(NSObject **)(v21 + 104);
      v23 = dispatch_get_global_queue(2, 0);
      v88[0] = v10;
      v88[1] = 3221225472;
      v88[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_121;
      v88[3] = &unk_1E9E527D0;
      v88[4] = v21;
      v88[5] = v13;
      a1 = v81;
      v88[6] = v17;
      dispatch_group_async(v22, v23, v88);
      v24 = *(_QWORD *)(v81 + 32);
      if (*(_BYTE *)(v24 + 57))
      {
        v25 = *(NSObject **)(v24 + 104);
        v87[0] = v10;
        v87[1] = 3221225472;
        v87[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_2;
        v87[3] = &unk_1E9E527D0;
        v87[4] = v24;
        v87[5] = v13;
        v87[6] = v17;
        dispatch_group_async(v25, v23, v87);
        v26 = *(_QWORD *)(v81 + 32);
        v27 = *(NSObject **)(v26 + 104);
        v86[0] = v10;
        v86[1] = 3221225472;
        v86[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_3;
        v86[3] = &unk_1E9E527D0;
        v86[4] = v26;
        v86[5] = v13;
        v86[6] = v17;
        dispatch_group_async(v27, v23, v86);
      }

      v7 = v80 + 1;
      v8 = v78;
    }
    goto LABEL_20;
  }
  v7 = 0;
LABEL_23:
  FreeLocalInterfaceList();
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v90 = 0;
    v30 = GetLocalInterfaceListWithOptions();
    if (v30 < 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v52 = VRTraceErrorLogLevelToCSTR();
        v53 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v92 = v52;
          v93 = 2080;
          v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke_2";
          v95 = 1024;
          v96 = 1491;
          _os_log_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: No usable carrier interfaces found.", buf, 0x1Cu);
        }
      }
      goto LABEL_59;
    }
    v31 = v30;
    if (!*(_BYTE *)(*(_QWORD *)(v81 + 32) + 63))
    {
      v54 = +[GKSConnectivitySettings getNATTypeFromCarrierBundle](GKSConnectivitySettings, "getNATTypeFromCarrierBundle");
      if ((_DWORD)v54)
      {
        v55 = v54;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v56 = VRTraceErrorLogLevelToCSTR();
          v57 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v92 = v56;
            v93 = 2080;
            v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke_4";
            v95 = 1024;
            v96 = 1433;
            v97 = 1024;
            *(_DWORD *)v98 = v55;
            _os_log_impl(&dword_1D8A54000, v57, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: carrier static NAT type: %08X", buf, 0x22u);
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(v81 + 32) + 24), "lock");
        objc_msgSend(*(id *)(v81 + 32), "setCommNATFlags:forInterface:isCached:", v55, CFSTR("gk_ci_"), 0);
        objc_msgSend(*(id *)(*(_QWORD *)(v81 + 32) + 24), "unlock");
        objc_msgSend(v79, "removeObject:", CFSTR("gk_ci_"));
        ++v7;
LABEL_59:
        FreeLocalInterfaceList();
        goto LABEL_60;
      }
    }
    v32 = 0;
    v33 = v31;
    v34 = MEMORY[0x1E0C809B0];
    while (1)
    {
      v99 = 0;
      v100 = 0;
      if ((*(_BYTE *)(v90 + v32) & 1) == 0)
        goto LABEL_34;
      VCNAT64ResolverRegisterForPrefixUpdate((const char *)(v90 + v32 + 4), (uint64_t)NAT64ResolverCallBack, *(_QWORD *)(v81 + 32));
      VCNAT64ResolverGetPrefix(v90 + v32 + 4, &v99);
      if (VCNAT64ResolverIsNonzeroPrefix(&v99))
      {
        objc_msgSend(*(id *)(v81 + 32), "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          break;
      }
LABEL_45:
      v32 += 40;
      if (!--v33)
        goto LABEL_59;
    }
    v35 = dispatch_get_global_queue(0, 0);
    v85[0] = v34;
    v85[1] = 3221225472;
    v85[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_123;
    v85[3] = &unk_1E9E521C0;
    v85[4] = *(_QWORD *)(v81 + 32);
    dispatch_async(v35, v85);
LABEL_34:
    v36 = objc_alloc_init(IPPortWrapper);
    v37 = -[IPPortWrapper ipport](v36, "ipport");
    v38 = *(_QWORD *)(v90 + v32 + 32);
    v39 = *(_OWORD *)(v90 + v32 + 16);
    *(_OWORD *)v37 = *(_OWORD *)(v90 + v32);
    *(_OWORD *)(v37 + 16) = v39;
    *(_QWORD *)(v37 + 32) = v38;
    v40 = -[IPv6PrefixWrapper initWithPrefix:]([IPv6PrefixWrapper alloc], "initWithPrefix:", &v99);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v92 = v41;
        v93 = 2080;
        v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
        v95 = 1024;
        v96 = 1464;
        v97 = 2080;
        *(_QWORD *)v98 = v32 + v90 + 4;
        _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: queued carrier NAT check on %s", buf, 0x26u);
      }
    }
    v43 = v90 + v32 + 4;
    if ((*(_BYTE *)(v90 + v32) & 4) != 0)
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gk_ci_%s"), v43);
    else
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v43);
    v45 = v44;
    objc_msgSend(v79, "removeObject:", v44);
    v46 = *(_QWORD *)(v81 + 32);
    if (!*(_BYTE *)(v46 + 59) || *(_BYTE *)(v46 + 61) || *(_BYTE *)(v46 + 60))
    {
      v47 = *(NSObject **)(v46 + 104);
      v48 = dispatch_get_global_queue(2, 0);
      v84[0] = v34;
      v84[1] = 3221225472;
      v84[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_124;
      v84[3] = &unk_1E9E527D0;
      v84[4] = v46;
      v84[5] = v36;
      v84[6] = v40;
      dispatch_group_async(v47, v48, v84);
    }
    else
    {
      v49 = v7;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v50 = VRTraceErrorLogLevelToCSTR();
        v51 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v92 = v50;
          v93 = 2080;
          v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
          v95 = 1024;
          v96 = 1472;
          _os_log_impl(&dword_1D8A54000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: empty carrier NAT type set", buf, 0x1Cu);
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(v81 + 32) + 24), "lock");
      objc_msgSend(*(id *)(v81 + 32), "setCommNATFlags:forInterface:isCached:", 0, v45, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(v81 + 32) + 24), "unlock");
      v7 = v49;
    }

    ++v7;
    goto LABEL_45;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    goto LABEL_61;
  v28 = VRTraceErrorLogLevelToCSTR();
  v29 = *MEMORY[0x1E0CF2758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v92 = v28;
    v93 = 2080;
    v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
    v95 = 1024;
    v96 = 1497;
    _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: _nonCarrierInterfacesOnly set, skipping carrier interfaces test", buf, 0x1Cu);
  }
LABEL_60:
  a1 = v81;
LABEL_61:
  if (objc_msgSend(v79, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v58 = VRTraceErrorLogLevelToCSTR();
      v59 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v60 = objc_msgSend((id)objc_msgSend(v79, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        v92 = v58;
        v93 = 2080;
        v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
        v95 = 1024;
        v96 = 1502;
        v97 = 2080;
        *(_QWORD *)v98 = v60;
        _os_log_impl(&dword_1D8A54000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: Removing interfaces from consideration: %s", buf, 0x26u);
      }
    }
    a1 = v81;
    objc_msgSend(*(id *)(*(_QWORD *)(v81 + 32) + 24), "lock");
    objc_msgSend(*(id *)(*(_QWORD *)(v81 + 32) + 48), "removeObjectsForKeys:", v79);
    objc_msgSend(*(id *)(*(_QWORD *)(v81 + 32) + 24), "unlock");
  }
  objc_msgSend(*(id *)(a1 + 32), "reportNATType");
  v61 = *(id **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v61, "clearRetries");
    dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 104), 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(v61[3], "lock");
    v62 = *(_QWORD *)(a1 + 32);
    v63 = *(_DWORD *)(v62 + 64);
    if (v63 > 2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v65 = VRTraceErrorLogLevelToCSTR();
        v66 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v67 = *(_DWORD *)(*(_QWORD *)(v81 + 32) + 64);
          *(_DWORD *)buf = 136315906;
          v92 = v65;
          v93 = 2080;
          v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke_2";
          v95 = 1024;
          v96 = 1544;
          v97 = 1024;
          *(_DWORD *)v98 = v67;
          _os_log_impl(&dword_1D8A54000, v66, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: no usable interfaces (already retried %d times)", buf, 0x22u);
        }
      }
    }
    else
    {
      if (v63)
        v64 = *(double *)(v62 + 72) + *(double *)(v62 + 72);
      else
        v64 = 0.25;
      *(double *)(v62 + 72) = v64;
      ++*(_DWORD *)(*(_QWORD *)(v81 + 32) + 64);
      v68 = *(_QWORD *)(v81 + 32);
      v69 = *(_DWORD *)(v68 + 64);
      v70 = *(_QWORD *)(v68 + 72);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v71 = VRTraceErrorLogLevelToCSTR();
        v72 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v73 = *(_DWORD *)(*(_QWORD *)(v81 + 32) + 64);
          *(_DWORD *)buf = 136316162;
          v92 = v71;
          v93 = 2080;
          v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
          v95 = 1024;
          v96 = 1529;
          v97 = 1024;
          *(_DWORD *)v98 = v73;
          *(_WORD *)&v98[4] = 2048;
          *(_QWORD *)&v98[6] = v70;
          _os_log_impl(&dword_1D8A54000, v72, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: no usable interfaces (retry #%d in %0.3lfs)", buf, 0x2Cu);
        }
      }
      v74 = dispatch_get_global_queue(0, 0);
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_126;
      v82[3] = &unk_1E9E52350;
      v82[5] = v70;
      v82[4] = *(_QWORD *)(v81 + 32);
      v83 = v69;
      dispatch_async(v74, v82);
    }
    a1 = v81;
    objc_msgSend(*(id *)(*(_QWORD *)(v81 + 32) + 24), "unlock");
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 137) = 1;
  objc_msgSend(*(id *)(a1 + 32), "reportNATType");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v75 = VRTraceErrorLogLevelToCSTR();
    v76 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v92 = v75;
      v93 = 2080;
      v94 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      v95 = 1024;
      v96 = 1552;
      _os_log_impl(&dword_1D8A54000, v76, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: done waiting for NAT check group", buf, 0x1Cu);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unlock");
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_117(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      v9 = 1024;
      v10 = 1380;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Trigger interface change directly from non-carrier check", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "triggerInterfaceChange");
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_121(id *a1)
{
  return objc_msgSend(a1[4], "NATCheckWithIPPort:ipv6Prefix:useCache:", objc_msgSend(a1[5], "ipport"), objc_msgSend(a1[6], "ipv6Prefix"), *((_BYTE *)a1[4] + 62) == 0);
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_2(id *a1)
{
  return objc_msgSend(a1[4], "HTTPCheckWithIPPort:ipv6Prefix:useCache:", objc_msgSend(a1[5], "ipport"), objc_msgSend(a1[6], "ipv6Prefix"), *((_BYTE *)a1[4] + 62) == 0);
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_3(id *a1)
{
  return objc_msgSend(a1[4], "HTTPSCheckWithIPPort:ipv6Prefix:useCache:", objc_msgSend(a1[5], "ipport"), objc_msgSend(a1[6], "ipv6Prefix"), *((_BYTE *)a1[4] + 62) == 0);
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_123(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      v9 = 1024;
      v10 = 1456;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Trigger interface change directly from carrier check", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "triggerInterfaceChange");
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_124(id *a1)
{
  return objc_msgSend(a1[4], "NATCheckWithIPPort:ipv6Prefix:useCache:", objc_msgSend(a1[5], "ipport"), objc_msgSend(a1[6], "ipv6Prefix"), 1);
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_126(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t result;

  usleep((*(double *)(a1 + 40) * 1000000.0));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
  v2 = *(_DWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 64);
  result = objc_msgSend(*(id *)(v3 + 24), "unlock");
  if (v2 <= v4)
    return objc_msgSend(*(id *)(a1 + 32), "tryNATCheckWithDelay:", 0.0);
  return result;
}

- (id)nameForNetworkWithIPPort:(tagIPPORT *)a3 interfaceName:(id)a4
{
  CFDictionaryRef v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  NSObject *v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v7 = SCDynamicStoreCopyMultiple(self->_dynamicStore, 0, (CFArrayRef)&unk_1E9EF9AA0);
  objc_sync_exit(self);
  if (v7)
  {
    v8 = (void *)-[__CFDictionary allValues](v7, "allValues");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v26 = v9;
          v27 = 2080;
          v28 = "-[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:]";
          v29 = 1024;
          v30 = 1577;
          v31 = 2080;
          v32 = objc_msgSend((id)-[__CFDictionary description](v7, "description"), "UTF8String");
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: SCDS dictionary: %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:].cold.1(v9, v7);
      }
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
LABEL_10:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
        if ((objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("InterfaceName")), "isEqual:", a4) & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
          if (v12)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
      v16 = (id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NetworkSignature"));
      CFRelease(v7);
      if (v16)
        return v16;
    }
    else
    {
LABEL_16:
      CFRelease(v7);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = v18;
      v27 = 2080;
      v28 = "-[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:]";
      v29 = 1024;
      v30 = 1575;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Dynamic store is nil", buf, 0x1Cu);
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u.%u.%u.%u%%%@"), HIBYTE(a3->IP.dwIPv4), BYTE2(a3->IP.dwIPv4), BYTE1(a3->IP.dwIPv4), a3->IP.dwIPv4, a4);
}

- (void)registerForNetworkChanges
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d GKNATObserver: SCDynamicStoreSetNotificationKeys failed, we will miss network change notifications!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOptions:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 357;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKNATObserver: no NAT cache available, running NAT check", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d: createTCPSocket: socket() failed (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d: connectTCPSocket: connect failed (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d: createTCPSocket: bind() failed (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)lookupCachedNATFlagsForNetwork:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_10_1(a2, *MEMORY[0x1E0C80C00]), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v2, v3, " [%s] %s:%d GKNATObserver: NAT Cache = %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)HTTPCheckWithIPPort:ipv6Prefix:useCache:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No tcp server... aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)HTTPSCheckWithIPPort:ipv6Prefix:useCache:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No https server... aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)nameForNetworkWithIPPort:(uint64_t)a1 interfaceName:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_10_1(a2, *MEMORY[0x1E0C80C00]), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v2, v3, " [%s] %s:%d GKNATObserver: SCDS dictionary: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

@end
