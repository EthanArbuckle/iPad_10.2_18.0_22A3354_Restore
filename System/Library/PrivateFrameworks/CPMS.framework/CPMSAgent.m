@implementation CPMSAgent

- (char)CPMSPowerTimeScaleToPPMIndex:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cpms_ts_i")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cpms_ts_100")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("cpms_ts_1000")))
  {
    v4 = 2;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)acknowledgePowerBudget:(id)a3 forClientId:(int64_t)a4 error:(id *)a5
{
  CPMSAgent *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  char v20;
  BOOL v21;
  unsigned int v22;
  int v23;
  char *v24;
  kern_return_t v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  void *context;
  int64_t v36;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[12];
  __int16 v46;
  int v47;
  _BYTE v48[128];
  __int128 inputStruct;
  unint64_t v50;
  uint8_t buf[32];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  context = (void *)MEMORY[0x1D824E9A0]();
  v36 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.clientId == %ul"), a4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableSet filteredSetUsingPredicate:](v7->_clientSet, "filteredSetUsingPredicate:", v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (suppressAssert)
  {
    if (!v39)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CPMSAgent acknowledgePowerBudget:forClientId:error:].cold.4();

LABEL_30:
      v28 = 8;
      goto LABEL_33;
    }
  }
  else
  {
    v10 = v39;
    if (!v10)
    {
      *(_QWORD *)v45 = 0;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      LODWORD(inputStruct) = 134217984;
      *(_QWORD *)((char *)&inputStruct + 4) = v36;
      _os_log_send_and_compose_impl();
      v33 = _os_crash_msg();
      -[CPMSAgent acknowledgePowerBudget:forClientId:error:].cold.1(v33);
    }

  }
  inputStruct = 0uLL;
  v50 = 0xFFFFFFFF00000000;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v38;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v42;
    v15 = -1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[CPMSAgent CPMSPowerTimeScaleToPPMIndex:](v7, "CPMSPowerTimeScaleToPPMIndex:", v17);
        v20 = v19;
        if (v18)
          v21 = v19 == -1;
        else
          v21 = 1;
        if (v21)
        {
          if (v18)
          {
            if (objc_msgSend(v17, "hasPrefix:", CFSTR("cpms_ts_thermal")))
            {
              v22 = objc_msgSend(v18, "unsignedIntValue");
              if (v15 == -1 || v22 < v15)
              {
                HIDWORD(v50) = v22;
                v15 = v22;
              }
            }
          }
        }
        else
        {
          v23 = objc_msgSend(v18, "unsignedIntValue");
          v24 = (char *)&inputStruct + 5 * v13;
          *(_DWORD *)(v24 + 3) = v23;
          v24[2] = v20;
          BYTE1(inputStruct) = ++v13;
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v12);
  }

  LOBYTE(inputStruct) = objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", v36);
  v25 = IOConnectCallStructMethod(v7->_connect, 0x1Fu, &inputStruct, 0x18uLL, 0, 0);
  v26 = v25;
  if (suppressAssert)
  {
    if (v25)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CPMSAgent acknowledgePowerBudget:forClientId:error:].cold.3(v36, v26, v27);

      goto LABEL_30;
    }
  }
  else if (v25)
  {
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    *(_DWORD *)v45 = 134218240;
    *(_QWORD *)&v45[4] = v36;
    v46 = 1024;
    v47 = v26;
    _os_log_send_and_compose_impl();
    v34 = _os_crash_msg();
    -[CPMSAgent acknowledgePowerBudget:forClientId:error:].cold.1(v34);
  }
  v28 = 0;
LABEL_33:

  objc_sync_exit(v7);
  if (!v28)
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v38, "description");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = objc_msgSend(v30, "UTF8String");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1D33CB000, v29, OS_LOG_TYPE_DEFAULT, "<Notice> Ack from CPMS clientId %lu. Budgets: %{public}s", buf, 0x16u);

    }
    v28 = 1;
  }

  objc_autoreleasePoolPop(context);
  if (a5 && v28 == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CPMSErrorDomain"), 1, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v28 != 8;
}

+ (unsigned)CPMSClientIdToPPMClientId:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC)
    return -1;
  else
    return byte_1D33D2338[a3 - 1];
}

- (NSMutableSet)clientSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

+ (id)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global);
  return (id)log_log;
}

- (unsigned)connect
{
  return self->_connect;
}

void __16__CPMSAgent_log__block_invoke()
{
  os_log_t v0;
  void *v1;
  NSObject *v2;

  v0 = os_log_create("com.apple.cpms", "framework");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

  if (!log_log)
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __16__CPMSAgent_log__block_invoke_cold_1();

  }
}

+ (BOOL)isCPMSSupported
{
  return objc_msgSend(a1, "isCPMSSupportedForClient:", 0);
}

+ (BOOL)isCPMSSupportedForAnyClient
{
  unint64_t v4;
  unint64_t v5;

  if ((objc_msgSend(a1, "isCPMSSupportedForClient:", 0) & 1) != 0)
    return 1;
  v4 = 0;
  do
  {
    v5 = v4;
    if (v4 == 13)
      break;
    ++v4;
  }
  while (!objc_msgSend(a1, "isCPMSSupportedForClient:", v5 + 1));
  return v5 < 0xD;
}

+ (BOOL)isCPMSSupportedForClient:(int64_t)a3
{
  unsigned int v4;
  _BOOL4 v5;

  if (isCPMSSupportedForClient__onceToken != -1)
    dispatch_once(&isCPMSSupportedForClient__onceToken, &__block_literal_global_28);
  if (isCPMSSupportedForClient__isCPMSSupportedClientBitfield == -1)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v4 = +[CPMSAgent CPMSClientIdToPPMClientId:](CPMSAgent, "CPMSClientIdToPPMClientId:", a3);
    if (v4 > 0x13)
      LOBYTE(v5) = 0;
    else
      return (isCPMSSupportedForClient__isCPMSSupportedClientBitfield >> v4) & 1;
  }
  return v5;
}

void __38__CPMSAgent_isCPMSSupportedForClient___block_invoke()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  const __CFNumber *CFProperty;
  const __CFNumber *v4;
  CFTypeID v5;
  NSObject *v6;
  CFTypeID v7;
  CFIndex v8;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v10;
  CFTypeID v11;
  NSObject *v12;
  NSObject *v13;
  int valuePtr;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  v0 = IOServiceMatching("ApplePPM");
  if (!v0)
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_1();
    goto LABEL_11;
  }
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v0);
  if (!MatchingService)
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_2();
LABEL_11:

    v2 = 0;
    goto LABEL_25;
  }
  v2 = MatchingService;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("CPMSSupported"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
  {
    v4 = CFProperty;
    v5 = CFGetTypeID(CFProperty);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      if (valuePtr)
        isCPMSSupportedForClient__isCPMSSupportedClientBitfield = -1;
    }
    else
    {
      v7 = CFGetTypeID(v4);
      if (v7 == CFArrayGetTypeID())
      {
        if (CFArrayGetCount(v4) >= 1)
        {
          v8 = 0;
          do
          {
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v4, v8);
            if (ValueAtIndex)
            {
              v10 = ValueAtIndex;
              v11 = CFGetTypeID(ValueAtIndex);
              if (v11 == CFNumberGetTypeID())
              {
                *(_DWORD *)buf = 0;
                CFNumberGetValue(v10, kCFNumberIntType, buf);
                if (*(_DWORD *)buf <= 0x13u)
                  isCPMSSupportedForClient__isCPMSSupportedClientBitfield |= 1 << buf[0];
              }
            }
            ++v8;
          }
          while (CFArrayGetCount(v4) > v8);
        }
      }
      else
      {
        +[CPMSAgent log](CPMSAgent, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_3();

      }
    }
    CFRelease(v4);
  }
LABEL_25:
  +[CPMSAgent log](CPMSAgent, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v16 = isCPMSSupportedForClient__isCPMSSupportedClientBitfield;
    _os_log_impl(&dword_1D33CB000, v13, OS_LOG_TYPE_INFO, "<Info> CPMSSupported bitfield 0x%08x", buf, 8u);
  }

  if (v2)
    IOObjectRelease(v2);
}

+ (id)sharedCPMSAgent
{
  if (sharedCPMSAgent_onceToken != -1)
    dispatch_once(&sharedCPMSAgent_onceToken, &__block_literal_global_32);
  return (id)sharedCPMSAgent_agent;
}

void __28__CPMSAgent_sharedCPMSAgent__block_invoke()
{
  CPMSAgent *v0;
  void *v1;
  NSObject *v2;

  if (+[CPMSAgent isCPMSSupportedForAnyClient](CPMSAgent, "isCPMSSupportedForAnyClient"))
  {
    v0 = objc_alloc_init(CPMSAgent);
    v1 = (void *)sharedCPMSAgent_agent;
    sharedCPMSAgent_agent = (uint64_t)v0;

  }
  else
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __28__CPMSAgent_sharedCPMSAgent__block_invoke_cold_1();

  }
}

- (CPMSAgent)init
{
  CPMSAgent *v2;
  NSMutableSet *v3;
  NSMutableSet *clientSet;
  NSObject *v5;
  uint64_t v6;
  NSSet *timeScalesSet;
  NSObject *v8;
  const __CFDictionary *v9;
  io_service_t MatchingService;
  NSObject *v11;
  CPMSAgent *v12;
  NSObject *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CPMSAgent;
  v2 = -[CPMSAgent init](&v15, sel_init);
  if (!v2)
    goto LABEL_19;
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  clientSet = v2->_clientSet;
  v2->_clientSet = v3;

  if (!v2->_clientSet)
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CPMSAgent init].cold.4();

    if (!v2->_clientSet)
      goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("cpms_ts_i"), CFSTR("cpms_ts_100"), CFSTR("cpms_ts_1000"), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  timeScalesSet = v2->_timeScalesSet;
  v2->_timeScalesSet = (NSSet *)v6;

  if (!v2->_timeScalesSet)
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CPMSAgent init].cold.3();

    if (!v2->_timeScalesSet)
      goto LABEL_19;
  }
  v9 = IOServiceMatching("ApplePPM");
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v9);
  v2->_ppmService = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &v2->_connect))
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CPMSAgent init].cold.2();

LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  if (!-[CPMSAgent registerForNotifications](v2, "registerForNotifications"))
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CPMSAgent init].cold.1();

    goto LABEL_19;
  }
  v12 = v2;
LABEL_20:

  return v12;
}

- (void)dealloc
{
  io_connect_t connect;
  io_object_t ppmService;
  IONotificationPort *notificationPort;
  objc_super v6;

  connect = self->_connect;
  if (connect)
    IOServiceClose(connect);
  ppmService = self->_ppmService;
  if (ppmService)
    IOObjectRelease(ppmService);
  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);
  v6.receiver = self;
  v6.super_class = (Class)CPMSAgent;
  -[CPMSAgent dealloc](&v6, sel_dealloc);
}

- (BOOL)registerClientWithDescription:(id)a3 error:(id *)a4
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  CPMSAgent *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  void *context;
  id obj;
  uint64_t v25;
  mach_port_t *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD inputStruct[13];
  int v33;
  int v34;
  int v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  +[CPMSAgent log](CPMSAgent, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v38 = objc_msgSend(v27, "clientId");
    _os_log_impl(&dword_1D33CB000, v5, OS_LOG_TYPE_INFO, "<Info> Registration call from CPMS clientId %lu\n", buf, 0xCu);
  }

  context = (void *)MEMORY[0x1D824E9A0]();
  if (suppressAssert)
  {
    if (!v27)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CPMSAgent registerClientWithDescription:error:].cold.4();
LABEL_27:

      v20 = 0;
LABEL_28:
      objc_autoreleasePoolPop(context);
      goto LABEL_29;
    }
  }
  else
  {
    v7 = v27;
    if (!v7)
      -[CPMSAgent registerClientWithDescription:error:].cold.1();

  }
  if (!-[CPMSAgent sanityCheckClientDescription:](self, "sanityCheckClientDescription:"))
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CPMSAgent registerClientWithDescription:error:].cold.3();
    goto LABEL_27;
  }
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableSet addObject:](v8->_clientSet, "addObject:", v27);
  objc_sync_exit(v8);
  v26 = (mach_port_t *)v8;

  v33 = 0;
  memset(inputStruct, 0, sizeof(inputStruct));
  LOBYTE(inputStruct[0]) = objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", objc_msgSend(v27, "clientId"));
  v34 = objc_msgSend(v27, "isContinuous");
  v35 = objc_msgSend(v27, "powerBudgetUpdateMinimumPeriod");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v27, "powerLevels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v10)
  {
    v25 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v27, "powerLevels");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        *((_BYTE *)inputStruct + 68 * v9 + 8) = -[mach_port_t CPMSPowerTimeScaleToPPMIndex:](v26, "CPMSPowerTimeScaleToPPMIndex:", v12);
        v15 = objc_msgSend(v14, "count");
        *((_BYTE *)inputStruct + 68 * v9 + 9) = v15;
        v16 = v15;
        if (v15)
        {
          v17 = 0;
          do
          {
            objc_msgSend(v14, "objectAtIndex:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(((unint64_t)inputStruct | 0xC) + 68 * v9 + 4 * v17) = objc_msgSend(v18, "intValue");

            ++v17;
          }
          while (v17 < v16);
        }

        ++v9;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v10);
  }

  BYTE4(inputStruct[0]) = v9;
  if (!IOConnectCallStructMethod(v26[10], 0x1Au, inputStruct, 0xDCuLL, 0, 0))
  {
    v20 = 1;
    goto LABEL_28;
  }
  +[CPMSAgent log](CPMSAgent, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[CPMSAgent registerClientWithDescription:error:].cold.2();

  objc_autoreleasePoolPop(context);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CPMSErrorDomain"), 2, 0);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_29:

  return v20;
}

- (id)requestPowerBudget:(id)a3 forClient:(int64_t)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  char *v20;
  void *v21;
  unint64_t v22;
  unsigned int *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  size_t outputStructCnt;
  _QWORD outputStruct[2];
  char v41;
  _QWORD inputStruct[2];
  char v43;
  uint8_t v44[128];
  uint8_t buf[4];
  int64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  outputStructCnt = 17;
  outputStruct[0] = 0;
  inputStruct[0] = 0;
  inputStruct[1] = 0;
  v43 = 0;
  outputStruct[1] = 0;
  v41 = 0;
  v9 = -[CPMSAgent isClientIdValid:](self, "isClientIdValid:", a4);
  if (suppressAssert)
  {
    if (!v9)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CPMSAgent requestPowerBudget:forClient:error:].cold.5();
      goto LABEL_26;
    }
    if (!v8)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CPMSAgent requestPowerBudget:forClient:error:].cold.4();
LABEL_26:

      v21 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    if (!v9)
      -[CPMSAgent requestPowerBudget:forClient:error:].cold.3(&v38, buf);
    v11 = v8;
    if (!v11)
      -[CPMSAgent requestPowerBudget:forClient:error:].cold.1();

  }
  v32 = a5;
  v33 = v8;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (char *)inputStruct + 5 * v15 + 2;
        *v20 = -[CPMSAgent CPMSPowerTimeScaleToPPMIndex:](self, "CPMSPowerTimeScaleToPPMIndex:", v18);
        *(_DWORD *)(v20 + 1) = objc_msgSend(v19, "intValue");
        ++v15;

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  BYTE1(inputStruct[0]) = v15;
  LOBYTE(inputStruct[0]) = objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", a4);
  if (IOConnectCallStructMethod(self->_connect, 0x1Bu, inputStruct, 0x11uLL, outputStruct, &outputStructCnt))
  {
    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CPMSErrorDomain"), 2, 0);
      *v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[CPMSAgent log](CPMSAgent, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CPMSAgent requestPowerBudget:forClient:error:].cold.2();
    v8 = v33;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (BYTE1(outputStruct[0]))
  {
    v22 = 0;
    v23 = (unsigned int *)((char *)outputStruct + 3);
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPMSAgent PPMIndexToCPMSPowerTimeScale:](self, "PPMIndexToCPMSPowerTimeScale:", *((char *)v23 - 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v24, v25);

      ++v22;
      v23 = (unsigned int *)((char *)v23 + 5);
    }
    while (v22 < BYTE1(outputStruct[0]));
  }
  v8 = v33;
LABEL_31:
  +[CPMSAgent log](CPMSAgent, "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "description");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = objc_msgSend(v27, "UTF8String");
    objc_msgSend(v21, "description");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "UTF8String");
    *(_DWORD *)buf = 134218498;
    v46 = a4;
    v47 = 2082;
    v48 = v28;
    v49 = 2082;
    v50 = v30;
    _os_log_impl(&dword_1D33CB000, v26, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %lu requested budget %{public}s granted budget %{public}s", buf, 0x20u);

  }
  return v21;
}

- (id)copyPowerBudgetForRequest:(id)a3 forClient:(int64_t)a4 withPowerProfile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  char *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  mach_port_t connect;
  __int128 *p_inputStruct;
  uint32_t v36;
  size_t v37;
  id v38;
  unint64_t v39;
  unsigned int *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  char v48;
  id v50;
  void *v51;
  int64_t v52;
  id *v53;
  void *context;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  size_t outputStructCnt;
  _QWORD outputStruct[2];
  char v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  __int128 inputStruct;
  char v68;
  uint8_t v69[128];
  uint8_t buf[4];
  int64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  outputStructCnt = 17;
  outputStruct[0] = 0;
  inputStruct = 0uLL;
  v68 = 0;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0;
  outputStruct[1] = 0;
  v62 = 0;
  v12 = MEMORY[0x1D824E9A0]();
  v13 = -[CPMSAgent isClientIdValid:](self, "isClientIdValid:", a4);
  context = (void *)v12;
  if (suppressAssert)
  {
    if (!v13)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CPMSAgent requestPowerBudget:forClient:error:].cold.5();
      goto LABEL_19;
    }
    if (!v10)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CPMSAgent requestPowerBudget:forClient:error:].cold.4();
LABEL_19:
      v25 = 0;
LABEL_28:

      v38 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    if (!v13)
      -[CPMSAgent requestPowerBudget:forClient:error:].cold.3(&v59, buf);
    v15 = v10;
    if (!v15)
      -[CPMSAgent requestPowerBudget:forClient:error:].cold.1();

  }
  v51 = v11;
  v52 = a4;
  v53 = a6;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v50 = v10;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v56 != v20)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (char *)&inputStruct + 5 * v19 + 2;
        *v24 = -[CPMSAgent CPMSPowerTimeScaleToPPMIndex:](self, "CPMSPowerTimeScaleToPPMIndex:", v22);
        *(_DWORD *)(v24 + 1) = objc_msgSend(v23, "intValue");
        ++v19;

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  BYTE1(inputStruct) = v19;
  a4 = v52;
  LOBYTE(inputStruct) = objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", v52);
  v11 = v51;
  if (v51)
  {
    BYTE4(v64) = objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", v52);
    objc_msgSend(v51, "objectForKey:", CFSTR("cpms_Pb"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD2(v64) = objc_msgSend(v26, "unsignedIntValue");

    objc_msgSend(v51, "objectForKey:", CFSTR("cpms_Pp"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v64) = objc_msgSend(v27, "unsignedIntValue");

    objc_msgSend(v51, "objectForKey:", CFSTR("cpms_Ps"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = objc_msgSend(v28, "unsignedIntValue");

    objc_msgSend(v51, "objectForKey:", CFSTR("cpms_Pu"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD1(v65) = objc_msgSend(v29, "unsignedIntValue");

    objc_msgSend(v51, "objectForKey:", CFSTR("cpms_Tb"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD2(v65) = objc_msgSend(v30, "unsignedIntValue");

    objc_msgSend(v51, "objectForKey:", CFSTR("cpms_Tp"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v65) = objc_msgSend(v31, "unsignedIntValue");

    objc_msgSend(v51, "objectForKey:", CFSTR("cpms_Ts"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v66) = objc_msgSend(v32, "unsignedIntValue");

    objc_msgSend(v51, "objectForKey:", CFSTR("cpms_Tu"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v66) = objc_msgSend(v33, "unsignedIntValue");

    v63 = inputStruct;
    LOBYTE(v64) = v68;
    connect = self->_connect;
    p_inputStruct = &v63;
    v36 = 38;
    v37 = 56;
  }
  else
  {
    connect = self->_connect;
    p_inputStruct = &inputStruct;
    v36 = 27;
    v37 = 17;
  }
  if (IOConnectCallStructMethod(connect, v36, p_inputStruct, v37, outputStruct, &outputStructCnt))
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    v10 = v50;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CPMSAgent requestPowerBudget:forClient:error:].cold.2();
    v25 = 1;
    goto LABEL_28;
  }
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (BYTE1(outputStruct[0]))
  {
    v39 = 0;
    v40 = (unsigned int *)((char *)outputStruct + 3);
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPMSAgent PPMIndexToCPMSPowerTimeScale:](self, "PPMIndexToCPMSPowerTimeScale:", *((char *)v40 - 1));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKey:", v41, v42);

      ++v39;
      v40 = (unsigned int *)((char *)v40 + 5);
    }
    while (v39 < BYTE1(outputStruct[0]));
    v25 = 0;
    a4 = v52;
    a6 = v53;
  }
  else
  {
    v25 = 0;
  }
  v10 = v50;
LABEL_35:
  +[CPMSAgent log](CPMSAgent, "log");
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "description");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v45 = objc_msgSend(v44, "UTF8String");
    objc_msgSend(v38, "description");
    v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = objc_msgSend(v46, "UTF8String");
    *(_DWORD *)buf = 134218498;
    v71 = a4;
    v72 = 2082;
    v73 = v45;
    v74 = 2082;
    v75 = v47;
    _os_log_impl(&dword_1D33CB000, v43, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %lu requested budget %{public}s granted budget %{public}s", buf, 0x20u);

  }
  objc_autoreleasePoolPop(context);
  v48 = v25 ^ 1;
  if (!a6)
    v48 = 1;
  if ((v48 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CPMSErrorDomain"), 2, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v38;
}

- (id)copyPowerBudgetForRequest:(id)a3 forClient:(int64_t)a4 error:(id *)a5
{
  return -[CPMSAgent copyPowerBudgetForRequest:forClient:withPowerProfile:error:](self, "copyPowerBudgetForRequest:forClient:withPowerProfile:error:", a3, a4, 0, a5);
}

- (id)copyDefaultPowerProfileForClient:(int64_t)a3 error:(id *)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t input;
  size_t v20;
  __int128 outputStruct;
  __int128 v22;
  unsigned int v23;

  v23 = 0;
  outputStruct = 0u;
  v22 = 0u;
  v20 = 36;
  input = objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", a3);
  v6 = (void *)MEMORY[0x1D824E9A0]();
  if (IOConnectCallMethod(self->_connect, 0x27u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v20))
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CPMSAgent copyDefaultPowerProfileForClient:error:].cold.1();

    objc_autoreleasePoolPop(v6);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CPMSErrorDomain"), 2, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD1(outputStruct));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(outputStruct));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(outputStruct));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD1(v22));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v22));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v22));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, CFSTR("cpms_Pb"), v11, CFSTR("cpms_Pp"), v12, CFSTR("cpms_Ps"), v13, CFSTR("cpms_Pu"), v14, CFSTR("cpms_Tb"), v15, CFSTR("cpms_Tp"), v16, CFSTR("cpms_Ts"), v17, CFSTR("cpms_Tu"), 0);

    objc_autoreleasePoolPop(v6);
  }
  return v8;
}

- (BOOL)registerForNotifications
{
  mach_port_t v3;
  const __CFDictionary *v4;
  NSObject *v5;
  io_object_t v6;
  IONotificationPort *notificationPort;
  BOOL v8;
  BOOL v9;
  io_object_t v10;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *notificationQueue;
  IONotificationPort *v14;
  io_service_t v15;
  io_iterator_t existing[2];

  *(_QWORD *)existing = 0;
  v3 = *MEMORY[0x1E0CBBAA8];
  v4 = IOServiceMatching("ApplePPM");
  if (IOServiceGetMatchingServices(v3, v4, &existing[1]))
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CPMSAgent registerForNotifications].cold.2();
    v6 = 0;
  }
  else
  {
    v12 = (OS_dispatch_queue *)dispatch_queue_create("ppmNotificationQueue", 0);
    notificationQueue = self->_notificationQueue;
    self->_notificationQueue = v12;

    v14 = IONotificationPortCreate(v3);
    self->_notificationPort = v14;
    IONotificationPortSetDispatchQueue(v14, (dispatch_queue_t)self->_notificationQueue);
    v15 = IOIteratorNext(existing[1]);
    if (!v15)
      return 1;
    v6 = v15;
    if (!IOServiceAddInterestNotification(self->_notificationPort, v15, "IOGeneralInterest", (IOServiceInterestCallback)PPMCallbackHandler, self, existing))
    {
      IOObjectRelease(v6);
      v8 = 1;
      v10 = existing[1];
LABEL_10:
      IOObjectRelease(v10);
      return v8;
    }
    +[CPMSAgent log](CPMSAgent, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CPMSAgent registerForNotifications].cold.1();
  }

  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);
  if (v6)
    IOObjectRelease(v6);
  v8 = 0;
  v9 = 0;
  v10 = existing[1];
  if (existing[1])
    goto LABEL_10;
  return v9;
}

- (BOOL)isClientIdValid:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0xD;
}

- (BOOL)sanityCheckClientDescription:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  unint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v34;
  void *v35;
  void *v36;
  NSObject *v37;
  unsigned int v38;
  char *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[16];
  _QWORD v46[2];
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CPMSAgent isClientIdValid:](self, "isClientIdValid:", objc_msgSend(v4, "clientId"));
  if (suppressAssert)
  {
    if (!v5)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
        -[CPMSAgent sanityCheckClientDescription:].cold.19(v4, v12);
      goto LABEL_65;
    }
    objc_msgSend(v4, "powerLevels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CPMSAgent sanityCheckClientDescription:].cold.18();

    }
    objc_msgSend(v4, "powerLevels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_66:
      LOBYTE(v32) = 0;
      goto LABEL_67;
    }
  }
  else
  {
    if (!v5)
      -[CPMSAgent sanityCheckClientDescription:].cold.17(v46, buf);
    objc_msgSend(v4, "powerLevels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      -[CPMSAgent sanityCheckClientDescription:].cold.1();

  }
  objc_msgSend(v4, "powerLevels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (suppressAssert)
  {
    if (v11 <= 0)
    {
      +[CPMSAgent log](CPMSAgent, "log");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
        -[CPMSAgent sanityCheckClientDescription:].cold.16();
      goto LABEL_65;
    }
  }
  else if (v11 <= 0)
  {
    -[CPMSAgent sanityCheckClientDescription:].cold.2();
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v4, "powerLevels");
  v12 = (char *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (!v13)
    goto LABEL_54;
  v14 = v13;
  v15 = *(_QWORD *)v42;
  v39 = (char *)v46 + 4;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v42 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
      if (!-[NSSet containsObject:](self->_timeScalesSet, "containsObject:", v17, v39))
      {
        if (!suppressAssert)
          -[CPMSAgent sanityCheckClientDescription:].cold.14(&v40, buf);
        +[CPMSAgent log](CPMSAgent, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[CPMSAgent sanityCheckClientDescription:].cold.15();
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
      objc_msgSend(v4, "powerLevels");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v17);
      v19 = objc_claimAutoreleasedReturnValue();

      LODWORD(v18) = objc_msgSend(v4, "isContinuous");
      v20 = suppressAssert;
      v21 = -[NSObject count](v19, "count");
      if ((_DWORD)v18)
      {
        if (v20)
        {
          if (v21 != 2)
          {
            +[CPMSAgent log](CPMSAgent, "log");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[CPMSAgent sanityCheckClientDescription:].cold.11((uint64_t)v46, v19);

          }
          if (-[NSObject count](v19, "count") != 2)
            goto LABEL_64;
        }
        else if (v21 != 2)
        {
          -[CPMSAgent sanityCheckClientDescription:].cold.10(&v40, buf);
        }
      }
      else if (v20)
      {
        if (v21 <= 1)
        {
          +[CPMSAgent log](CPMSAgent, "log");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[CPMSAgent sanityCheckClientDescription:].cold.13((uint64_t)v45, v19);

        }
        if ((unint64_t)-[NSObject count](v19, "count") < 2)
          goto LABEL_64;
      }
      else if (v21 <= 1)
      {
        -[CPMSAgent sanityCheckClientDescription:].cold.12(&v40, buf);
      }
      v24 = suppressAssert;
      v25 = -[NSObject count](v19, "count");
      if (v24)
      {
        if (v25 >= 0x11)
        {
          +[CPMSAgent log](CPMSAgent, "log");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = -[NSObject count](v19, "count");
            *(_DWORD *)buf = 134218240;
            v49 = v27;
            v50 = 1024;
            v51 = 16;
            _os_log_error_impl(&dword_1D33CB000, v26, OS_LOG_TYPE_ERROR, "<Error> Power level count %lu more than max count %d\n", buf, 0x12u);
          }

        }
        if ((unint64_t)-[NSObject count](v19, "count") > 0x10)
          goto LABEL_64;
      }
      else if (v25 >= 0x11)
      {
        -[CPMSAgent sanityCheckClientDescription:].cold.9(&v40, buf);
      }

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  }
  while (v14);
LABEL_54:

  v28 = suppressAssert;
  objc_msgSend(v4, "notificationCallback");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v28)
  {
    if (!v29)
      -[CPMSAgent sanityCheckClientDescription:].cold.3();

LABEL_70:
    v34 = suppressAssert;
    objc_msgSend(v4, "getCurrentPower");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v34)
    {

      if (!v36)
      {
        +[CPMSAgent log](CPMSAgent, "log");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[CPMSAgent sanityCheckClientDescription:].cold.7();

      }
      objc_msgSend(v4, "getCurrentPower");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
        goto LABEL_67;
    }
    else
    {
      if (!v35)
        -[CPMSAgent sanityCheckClientDescription:].cold.4();

    }
    if (objc_msgSend(v4, "powerBudgetUpdateMinimumPeriod") > 0x2710)
    {
      if (suppressAssert)
        goto LABEL_84;
    }
    else
    {
      v38 = objc_msgSend(v4, "powerBudgetUpdateMinimumPeriod");
      if (suppressAssert)
      {
        if (v38 > 9)
          goto LABEL_87;
LABEL_84:
        +[CPMSAgent log](CPMSAgent, "log");
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
          -[CPMSAgent sanityCheckClientDescription:].cold.6(v4, v12);
        goto LABEL_65;
      }
      if (v38 > 9)
      {
LABEL_87:
        LOBYTE(v32) = 1;
        goto LABEL_67;
      }
    }
    -[CPMSAgent sanityCheckClientDescription:].cold.5(&v40, buf);
  }

  if (!v30)
  {
    +[CPMSAgent log](CPMSAgent, "log");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CPMSAgent sanityCheckClientDescription:].cold.8();

  }
  objc_msgSend(v4, "notificationCallback");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
    goto LABEL_70;
LABEL_67:

  return (char)v32;
}

- (id)PPMIndexToCPMSPowerTimeScale:(char)a3
{
  if (a3 > 2)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E9527D08 + a3);
}

- (void)setClientSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setConnect:(unsigned int)a3
{
  self->_connect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSet, 0);
  objc_storeStrong((id *)&self->_timeScalesSet, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

void __16__CPMSAgent_log__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Could not create log object\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Could not create matching dictionary\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Could not find PPM service\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __38__CPMSAgent_isCPMSSupportedForClient___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> CPMSSupported property has unknown type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __28__CPMSAgent_sharedCPMSAgent__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> CPMS not supported on current platform", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Client Set alloc failed\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerClientWithDescription:error:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)registerClientWithDescription:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D33CB000, v0, v1, "<Error> Register client call to PPM failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerClientWithDescription:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Sanity check failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerClientWithDescription:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Nil description object\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)requestPowerBudget:forClient:error:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)requestPowerBudget:forClient:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D33CB000, v0, v1, "<Error> Request budget call to PPM failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)requestPowerBudget:(_QWORD *)a1 forClient:(_OWORD *)a2 error:.cold.3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

- (void)requestPowerBudget:forClient:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Nil requestBudget argument\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)requestPowerBudget:forClient:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D33CB000, v0, v1, "<Error> Unsupported client handle %lu\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)copyDefaultPowerProfileForClient:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D33CB000, v0, v1, "<Error> copyDefaultPowerProfileForClient call to PPM failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)acknowledgePowerBudget:(uint64_t)a1 forClientId:(int)a2 error:(NSObject *)a3 .cold.3(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  OUTLINED_FUNCTION_15(&dword_1D33CB000, a3, (uint64_t)a3, "<Error> Ack failure for CPMS clientId %lu, userclient return 0x%08x\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_12();
}

- (void)acknowledgePowerBudget:forClientId:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D33CB000, v0, v1, "<Error> Ack called on unregistered CPMS clientId %lu\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)registerForNotifications
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D33CB000, v0, v1, "<Error> IOServiceGetMatchingServices returned 0x%08x\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sanityCheckClientDescription:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)sanityCheckClientDescription:.cold.2()
{
  _os_crash();
  __break(1u);
}

- (void)sanityCheckClientDescription:.cold.3()
{
  _os_crash();
  __break(1u);
}

- (void)sanityCheckClientDescription:.cold.4()
{
  _os_crash();
  __break(1u);
}

- (void)sanityCheckClientDescription:(_QWORD *)a1 .cold.5(_QWORD *a1, _OWORD *a2)
{
  void *v2;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_5();
  objc_msgSend(v2, "powerBudgetUpdateMinimumPeriod");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.6(void *a1, NSObject *a2)
{
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "powerBudgetUpdateMinimumPeriod");
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1D33CB000, a2, OS_LOG_TYPE_ERROR, "<Error> Budget update period %d ms is out of bounds\n", v3, 8u);
  OUTLINED_FUNCTION_12();
}

- (void)sanityCheckClientDescription:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Nil getCurrentPower callback\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sanityCheckClientDescription:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Nil notification callback\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sanityCheckClientDescription:(_QWORD *)a1 .cold.9(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

- (void)sanityCheckClientDescription:(_QWORD *)a1 .cold.10(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

- (void)sanityCheckClientDescription:(uint64_t)a1 .cold.11(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t *v3;
  uint8_t *v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_13(a1, a2);
  *(_DWORD *)v4 = 134217984;
  *v3 = v5;
  OUTLINED_FUNCTION_11(&dword_1D33CB000, v2, OS_LOG_TYPE_ERROR, "<Error> Incorrect value count %lu for continous client\n", v4);
  OUTLINED_FUNCTION_20();
}

- (void)sanityCheckClientDescription:(_QWORD *)a1 .cold.12(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

- (void)sanityCheckClientDescription:(uint64_t)a1 .cold.13(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t *v3;
  uint8_t *v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_13(a1, a2);
  *(_DWORD *)v4 = 134217984;
  *v3 = v5;
  OUTLINED_FUNCTION_11(&dword_1D33CB000, v2, OS_LOG_TYPE_ERROR, "<Error> Incorrect value count %lu for discrete client\n", v4);
  OUTLINED_FUNCTION_20();
}

- (void)sanityCheckClientDescription:(_QWORD *)a1 .cold.14(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

- (void)sanityCheckClientDescription:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D33CB000, v0, v1, "<Error> Incorrect timescale %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)sanityCheckClientDescription:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Empty powerlevels dictionary\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sanityCheckClientDescription:(_QWORD *)a1 .cold.17(_QWORD *a1, _OWORD *a2)
{
  void *v2;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_5();
  objc_msgSend(v2, "clientId");
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

- (void)sanityCheckClientDescription:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Nil powerLevels\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sanityCheckClientDescription:(void *)a1 .cold.19(void *a1, char *a2)
{
  uint8_t v3[24];

  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D33CB000, a2, OS_LOG_TYPE_ERROR, "<Error> Unsupported client handle %lu\n", v3);
  OUTLINED_FUNCTION_10();
}

@end
