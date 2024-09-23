@implementation DTDeviceInfoService

+ (void)registerCapabilities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  mach_timebase_info v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", DTDefaultDeviceInfoServiceIdentifier, 115, a1);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "operatingSystemVersion");
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }

  v7 = 10000 * (v12 & ~(v12 >> 63))
     + 100 * (v13 & ~(v13 >> 63))
     + (v14 & ~(v14 >> 63));
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.systemversion"), v7, a1);
  v8 = (void *)MEMORY[0x227679C5C](objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.recordOptions"), 1, a1));
  v9 = MTLCreateSystemDefaultDevice();
  if (v9)
    objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.metal"), 1, a1);

  objc_autoreleasePoolPop(v8);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.condition-inducer"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.energytracing.location"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.target.user-page-size"), getpagesize(), a1);
  v10.numer = 0;
  v15 = 4;
  sysctlbyname("hw.physicalcpu_max", &v10, &v15, 0, 0);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.target.physical-cpus"), v10.numer, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.target.logical-cpus"), DTGetCoreCount(), a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.target.ios"), v7, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.app-life-cycle"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.dyld-tracing"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.scenekit-tracing"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.gcd-perf"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.gpu-allocation"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.counters.advertising"), 1, a1);
  v11 = 0;
  v15 = 4;
  if (sysctlbyname("kern.monotonic.supported", &v11, &v15, 0, 0) < 0
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_222BC59D8();
  }
  if (v11 >= 1)
    objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.counters"), 1, a1);
  v10 = 0;
  mach_timebase_info(&v10);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.target.mtb.numer"), v10.numer, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.target.mtb.denom"), v10.denom, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.deviceinfo.devicesymbolication"), 1, a1);

}

- (DTDeviceInfoService)initWithChannel:(id)a3
{
  id v4;
  DTDeviceInfoService *v5;
  uint64_t v6;
  NSMutableDictionary *peerTrackingSelectorsByPid;
  dispatch_queue_t v8;
  OS_dispatch_queue *trackingSymbolicatorQueue;
  uint64_t v10;
  DTDSCSymbolicatorCache *sharedCacheSymbolicators;
  OS_dispatch_queue *v12;
  DTDeviceInfoService *v13;
  uint64_t v14;
  OS_xpc_object *dtsecurityPidWatcher;
  os_log_t v16;
  OS_os_log *logHandle;
  _QWORD v19[4];
  DTDeviceInfoService *v20;
  id v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DTDeviceInfoService;
  v5 = -[DTXService initWithChannel:](&v22, sel_initWithChannel_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    peerTrackingSelectorsByPid = v5->_peerTrackingSelectorsByPid;
    v5->_peerTrackingSelectorsByPid = (NSMutableDictionary *)v6;

    v8 = dispatch_queue_create("symbolicator tracking", 0);
    trackingSymbolicatorQueue = v5->_trackingSymbolicatorQueue;
    v5->_trackingSymbolicatorQueue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    sharedCacheSymbolicators = v5->_sharedCacheSymbolicators;
    v5->_sharedCacheSymbolicators = (DTDSCSymbolicatorCache *)v10;

    v12 = v5->_trackingSymbolicatorQueue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_222B20F8C;
    v19[3] = &unk_24EB282D8;
    v13 = v5;
    v20 = v13;
    v21 = v4;
    pid_watcher_connect(0, v12, v19);
    v14 = objc_claimAutoreleasedReturnValue();
    dtsecurityPidWatcher = v13->_dtsecurityPidWatcher;
    v13->_dtsecurityPidWatcher = (OS_xpc_object *)v14;

    v16 = os_log_create("com.apple.DTServiceHub", "Device Info Service");
    logHandle = v13->_logHandle;
    v13->_logHandle = (OS_os_log *)v16;

  }
  return v5;
}

- (void)messageReceived:(id)a3
{
  id v4;
  NSObject *trackingSymbolicatorQueue;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "errorStatus") == 2)
  {
    trackingSymbolicatorQueue = self->_trackingSymbolicatorQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B213B8;
    block[3] = &unk_24EB27E30;
    block[4] = self;
    dispatch_async(trackingSymbolicatorQueue, block);
    if (self->_expiredPidTrackingEnabled)
    {
      +[DTExpiredPidCacheService defaultCache](DTExpiredPidCacheService, "defaultCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enableCaching:", 0);

      self->_expiredPidTrackingEnabled = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "stringForMessageKey:", CFSTR("infoRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ktraceMachineInformation"));

    if (v8)
    {
      v22 = 0;
      v9 = authorized_ktrace_machine_cpu_topologies(0, (uint64_t)&v22);
      if ((_DWORD)v9)
      {
        v10 = (void *)MEMORY[0x24BDD1540];
        v11 = DTDefaultDeviceInfoServiceIdentifier;
        v24 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to fetch machine cores information: %d"), v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 15, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)objc_msgSend(v4, "newReplyWithError:", v14);
      }
      else
      {
        v15 = (void *)objc_msgSend(v4, "newReplyWithObject:", v22);
      }
      -[DTXService channel](self, "channel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendControlAsync:replyHandler:", v15, 0);

    }
    else
    {
      objc_msgSend(v4, "stringForMessageKey:", CFSTR("infoRequest"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("configurationInformation"));

      if (v17)
      {
        -[DTDeviceInfoService _configurationProperties](self, "_configurationProperties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v4, "newReplyWithObject:", v18);

        -[DTXService channel](self, "channel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sendControlAsync:replyHandler:", v19, 0);

      }
    }
  }

}

- (id)machTimeInfo
{
  mach_error_t times;
  mach_error_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  mach_timebase_info info;
  _QWORD v14[6];
  uint8_t buf[4];
  mach_error_t v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  info = 0;
  times = mach_get_times();
  if (times)
  {
    v3 = times;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v16 = v3;
      v17 = 2080;
      v18 = mach_error_string(v3);
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Device Info Service was unable to create get times: %#x - %s", buf, 0x12u);
    }
  }
  mach_timebase_info(&info);
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", info.numer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", info.denom);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)0 / 1000000000.0 + (double)0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_processDictionaryForProcInfo:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  int v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[6];

  v50[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isZombie") & 1) == 0)
  {
    v5 = objc_msgSend(v3, "pid");
    if (qword_25576F950 != -1)
      dispatch_once(&qword_25576F950, &unk_24EB27650);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((_DWORD)v5 == dword_25576F948)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], DTDeviceInfoRunningProcessIsMatchingServicePid);
    if (objc_msgSend(v3, "shouldAnalyzeWithCorpse"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], DTDeviceInfoRunningProcessShouldAnalyzeWithCorpse);
    v8 = (void *)qword_25576F958;
    if (qword_25576F958)
    {
      objc_msgSend(v3, "valueForEnvVar:", CFSTR("XPC_SIMULATOR_LAUNCHD_NAME"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (!v10)
      {
        v4 = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    v11 = (void *)MEMORY[0x24BDBCE60];
    v12 = (double)objc_msgSend(v3, "startTime");
    objc_msgSend(v3, "startTime");
    objc_msgSend(v11, "dateWithTimeIntervalSince1970:", (double)v13 / 1000000.0 + v12);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isCFM"))
    {
      objc_msgSend(v3, "requestedAppName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(v3, "name");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
LABEL_15:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PID %d"), v5);
        v15 = objc_claimAutoreleasedReturnValue();
      }
    }
    v16 = objc_alloc(MEMORY[0x24BDC1540]);
    v17 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "realAppName");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "rangeOfString:options:", CFSTR(".app"), 4);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v18;
    }
    else
    {
      objc_msgSend(v18, "substringToIndex:", v19 + v20);
      v45 = v5;
      v46 = v7;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByDeletingPathExtension");
      v25 = v15;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v23, "isEqualToString:", v26);

      v15 = v25;
      if (v27)
        v28 = v22;
      else
        v28 = v18;
      v21 = v28;

      v5 = v45;
      v7 = v46;
    }

    objc_msgSend(v17, "fileURLWithPath:", v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v16, "initWithURL:allowPlaceholder:error:", v29, 0, 0);

    if (v30)
    {
      objc_msgSend(v30, "bundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    v32 = objc_msgSend(v3, "isSemiCriticalProcess") ^ 1;
    if (v30)
      v33 = v32;
    else
      v33 = 0;
    v49[0] = DTDeviceInfoRunningProcessPidKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v34;
    v49[1] = DTDeviceInfoRunningProcessIsApplicationKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v35;
    v50[2] = v15;
    v47 = (void *)v15;
    v49[2] = DTDeviceInfoRunningProcessNameKey;
    v49[3] = DTDeviceInfoRunningProcessRealAppNameKey;
    objc_msgSend(v3, "realAppName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = DTDeviceInfoRunningProcessStartDateKey;
    v50[3] = v36;
    v50[4] = v48;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v37);

    if (v31)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, DTDeviceInfoRunningProcessBundleIdentifierKey);
    v38 = (void *)MEMORY[0x24BE80C78];
    objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleForIdentifier:error:", v39, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "currentState");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "taskState") == 4)
    {
      objc_msgSend(v41, "endowmentNamespaces");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "containsObject:", *MEMORY[0x24BE38348]);

      if (v43)
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], DTDeviceInfoRunningProcessForegroundRunningKey);
    }
    v4 = v7;

    goto LABEL_35;
  }
  v4 = 0;
LABEL_36:

  return v4;
}

- (id)runningProcesses
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BEB3408]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allProcInfos", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[DTDeviceInfoService _processDictionaryForProcInfo:](self, "_processDictionaryForProcInfo:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("XPC_SIMULATOR_LAUNCHD_NAME"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    objc_msgSend(v3, "addObject:", &unk_24EB4ED68);

  return v3;
}

- (id)nameForUID:(id)a3
{
  id v3;
  uid_t v4;
  __CFString *v5;
  id v6;
  void *v7;
  passwd *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  __CFString *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "intValue");
  if (qword_25576F960)
  {
    objc_msgSend((id)qword_25576F960, "objectForKey:", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_11;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = (void *)qword_25576F960;
    qword_25576F960 = (uint64_t)v6;

  }
  v8 = getpwuid(v4);
  if (v8
    && v8->pw_name
    && *v8->pw_name
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (__CFString *)v9;
    objc_msgSend((id)qword_25576F960, "setObject:forKey:", v9, v3);
  }
  else
  {
    v5 = CFSTR("???");
  }
LABEL_11:
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("root")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("root");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("nobody")))
    {
      v13 = v5;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("nobody");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24EB2CF78, 0);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v13;
}

- (id)nameForGID:(id)a3
{
  id v3;
  gid_t v4;
  __CFString *v5;
  id v6;
  void *v7;
  group *v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "intValue");
  if (qword_25576F968)
  {
    objc_msgSend((id)qword_25576F968, "objectForKey:", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_11;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = (void *)qword_25576F968;
    qword_25576F968 = (uint64_t)v6;

  }
  v8 = getgrgid(v4);
  if (v8
    && v8->gr_name
    && *v8->gr_name
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (__CFString *)v9;
    objc_msgSend((id)qword_25576F968, "setObject:forKey:", v9, v3);
  }
  else
  {
    v5 = CFSTR("???");
  }
LABEL_11:

  return v5;
}

- (id)execnameForPid:(id)a3
{
  id v3;
  int v4;
  void *v5;
  uint64_t Name;
  void *v7;
  void *v8;
  _BYTE buffer[1024];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "intValue");
  if (v4 < 1)
  {
    if (!v4)
    {
      CSSymbolicatorCreateWithMachKernel();
      CSSymbolicatorGetAOutSymbolOwner();
      Name = CSSymbolOwnerGetName();
      if (Name)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      CSRelease();
      if (v5)
        goto LABEL_19;
    }
  }
  else if (proc_pidpath(v4, buffer, 0x400u) >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buffer);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_19;
  }
  +[DTExpiredPidCacheService defaultCache](DTExpiredPidCacheService, "defaultCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signatureForExpiredPid:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (CSSymbolicatorCreateWithSignature(), (CSIsNull() & 1) == 0))
  {
    CSSymbolicatorGetAOutSymbolOwner();
    if ((CSIsNull() & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", CSSymbolOwnerGetName());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CSRelease();
  }
  else
  {
    v5 = 0;
  }

LABEL_19:
  return v5;
}

- (id)isRunningPid:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend(a3, "intValue");
  v4 = objc_alloc_init(MEMORY[0x24BEB3408]);
  v5 = v4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  if ((_DWORD)v3)
  {
    objc_msgSend(v4, "procInfoWithPID:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", v7 != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)runningProcessWithPid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v4 = objc_msgSend(a3, "intValue");
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = objc_alloc_init(MEMORY[0x24BEB3408]);
    objc_msgSend(v6, "procInfoWithPID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[DTDeviceInfoService _processDictionaryForProcInfo:](self, "_processDictionaryForProcInfo:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = &unk_24EB4ED68;
  }
  return v8;
}

- (id)machKernelName
{
  int v2;
  __CFString *v3;
  const char *v4;
  char *v5;
  int v6;
  char *v7;
  int v8;
  const char *v9;
  char v10;
  int v11;
  const char *v12;
  int v13;
  size_t v15;
  char v16[1024];
  char __str[1024];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = 1024;
  v2 = sysctlbyname("kern.version", v16, &v15, 0, 0);
  v3 = CFSTR("mach_kernel");
  if (!v2 && v15 <= 0x3FF)
  {
    v4 = 0;
    v5 = v16;
    do
    {
      while (*v5++ == 47)
        v4 = v5;
    }
    while (*(v5 - 1));
    if (v4)
    {
      v6 = *(unsigned __int8 *)v4;
      v7 = (char *)v4;
      if (v6 != 95)
      {
        v7 = (char *)v4;
        do
        {
          *v7 = __tolower((char)v6);
          v8 = *++v7;
          LOBYTE(v6) = v8;
        }
        while (v8 != 95);
      }
      *v7 = 0;
      v9 = v7 + 1;
      do
      {
        v11 = *(unsigned __int8 *)v9++;
        v10 = v11;
      }
      while (v11 != 95);
      v12 = v9;
      do
      {
        *((_BYTE *)v12 - 1) = __tolower(v10);
        v13 = *(unsigned __int8 *)v12++;
        v10 = v13;
      }
      while (v13);
    }
    else
    {
      v9 = "";
      v4 = "";
    }
    snprintf(__str, 0x400uLL, "/mach.%s.%s", v4, v9);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", __str);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)deepSymbolOwnerSignatureForPid:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *trackingSymbolicatorQueue;
  id Signature;
  id v12;
  _QWORD block[6];
  int v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_msgSend(v6, "unsignedIntValue");
    if (v8 == -1)
    {
      v12 = v7;
      CSSymbolicatorCreateWithMachKernelFlagsAndNotification();
      v18 = 0;
      v19 = 0;
      objc_msgSend(v12, "getUUIDBytes:", &v18);

      CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
      Signature = 0;
      if ((CSIsNull() & 1) == 0)
        Signature = (id)CSSymbolOwnerCreateSignature();
      CSRelease();
    }
    else
    {
      v9 = v8;
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      v21 = sub_222B22500;
      v22 = sub_222B22510;
      v23 = 0;
      v17 = 0uLL;
      objc_msgSend(v7, "getUUIDBytes:", &v17);
      trackingSymbolicatorQueue = self->_trackingSymbolicatorQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_222B22518;
      block[3] = &unk_24EB28300;
      block[4] = self;
      block[5] = &v18;
      v15 = v9;
      v16 = v17;
      dispatch_sync(trackingSymbolicatorQueue, block);
      Signature = (id)v19[5];
      _Block_object_dispose(&v18, 8);

    }
  }
  else
  {
    Signature = 0;
  }

  return Signature;
}

- (id)symbolicatorSignatureForPid:(id)a3 trackingSelector:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *trackingSymbolicatorQueue;
  void *v10;
  id Signature;
  _QWORD block[4];
  id v14;
  DTDeviceInfoService *v15;
  id v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_222B22500;
  v23 = sub_222B22510;
  v24 = 0;
  v8 = objc_msgSend(v6, "unsignedIntValue");
  if (v8)
  {
    trackingSymbolicatorQueue = self->_trackingSymbolicatorQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B22750;
    block[3] = &unk_24EB28328;
    v14 = v7;
    v15 = self;
    v16 = v6;
    v17 = &v19;
    v18 = v8;
    dispatch_sync(trackingSymbolicatorQueue, block);
    v10 = (void *)v20[5];
    if (!v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v26 = v8;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Device Info Service was unable to create symbolicator for PID %d", buf, 8u);
      }
      v10 = (void *)v20[5];
    }
    Signature = v10;

  }
  else
  {
    CSSymbolicatorCreateWithMachKernel();
    Signature = (id)CSSymbolicatorCreateSignature();
    CSRelease();
  }
  _Block_object_dispose(&v19, 8);

  return Signature;
}

- (void)unregisterSignatureTrackingForPid:(id)a3
{
  id v4;
  NSObject *trackingSymbolicatorQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  trackingSymbolicatorQueue = self->_trackingSymbolicatorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B228E8;
  block[3] = &unk_24EB28350;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(trackingSymbolicatorQueue, block);

}

- (void)enableExpiredPidTracking:(id)a3
{
  id v4;
  int expiredPidTrackingEnabled;
  void *v6;
  id v7;

  v4 = a3;
  expiredPidTrackingEnabled = self->_expiredPidTrackingEnabled;
  v7 = v4;
  if (expiredPidTrackingEnabled != objc_msgSend(v4, "BOOLValue"))
  {
    self->_expiredPidTrackingEnabled = objc_msgSend(v7, "BOOLValue");
    +[DTExpiredPidCacheService defaultCache](DTExpiredPidCacheService, "defaultCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enableCaching:", self->_expiredPidTrackingEnabled);

  }
}

- (id)symbolicatorSignaturesForExpiredPids
{
  void *v2;
  void *v3;

  +[DTExpiredPidCacheService defaultCache](DTExpiredPidCacheService, "defaultCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allExpiredSignatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)directoryListingForPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)iconDescriptionFileForAppPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGImage *v10;
  unint64_t Width;
  unint64_t Height;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v14;
  void *v15;
  CGContext *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *logHandle;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGContext *c;
  void *v31;
  void *v32;
  CGRect v33;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (NSClassFromString(CFSTR("ISIcon")))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A98]), "initWithURL:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AA8]), "initWithSize:scale:", 32.0, 32.0, 2.0);
    objc_msgSend(v6, "prepareImageForDescriptor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = (CGImage *)objc_msgSend(v8, "CGImage");
      Width = CGImageGetWidth(v10);
      Height = CGImageGetHeight(v10);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB)
      {
        v14 = DeviceRGB;
        v31 = v7;
        v32 = v6;
        v15 = malloc_type_malloc(32 * Width * Height, 0x172A7819uLL);
        v16 = CGBitmapContextCreate(v15, Width, Height, 8uLL, 32 * Width, v14, 0x2002u);
        if (v16)
        {
          v33.size.width = (double)Width;
          v33.size.height = (double)Height;
          v33.origin.x = 0.0;
          v33.origin.y = 0.0;
          c = v16;
          CGContextDrawImage(v16, v33, v10);
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v15, 32 * Width * Height, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Width);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Height);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v17, CFSTR("imageData"), v19, CFSTR("width"), v20, CFSTR("height"), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          CGColorSpaceRelease(v14);
          CGContextRelease(c);

        }
        else
        {
          CGColorSpaceRelease(v14);
          v21 = 0;
        }
        v7 = v31;
        v6 = v32;
        goto LABEL_12;
      }
    }
    else
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        sub_222BC5A54((uint64_t)v4, logHandle, v23, v24, v25, v26, v27, v28);
    }
    v21 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v21 = 0;
LABEL_13:

  return v21;
}

- (id)createSignatureFromLibraryUUID:(id)a3 sharedCacheUUID:(id)a4 andPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_222B22500;
  v24 = sub_222B22510;
  v25 = 0;
  v26[0] = 0;
  v26[1] = 0;
  objc_msgSend(v8, "getUUIDBytes:", v26);
  v11 = -[DTDSCSymbolicatorCache symbolicatorForSharedCacheUUID:](self->_sharedCacheSymbolicators, "symbolicatorForSharedCacheUUID:", v9);
  v13 = v12;
  if ((CSIsNull() & 1) == 0)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_222B22E6C;
    v17[3] = &unk_24EB28378;
    v18 = v10;
    v19 = &v20;
    MEMORY[0x227678B34](v11, v13, v26, 0x8000000000000000, v17);

  }
  v14 = (void *)v21[5];
  if (!v14)
  {
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    CSSymbolicatorForeachSymbolicatorWithPath();
    v14 = (void *)v21[5];
  }
  v15 = v14;
  _Block_object_dispose(&v20, 8);

  return v15;
}

- (int)numberOfPhysicalCpus
{
  size_t v3;
  int v4;

  v4 = 0;
  v3 = 4;
  sysctlbyname("hw.physicalcpu_max", &v4, &v3, 0, 0);
  return v4;
}

- (int)numberOfCpus
{
  int result;

  result = DTGetCoreCount();
  if (result <= 1)
    return 1;
  return result;
}

- (int)hwCPUsubtype
{
  uint64_t v3;

  v3 = -1;
  if (DTIntegerSysctlByName("hw.cpusubtype", &v3))
    return -1;
  else
    return v3;
}

- (int)hwCPUtype
{
  uint64_t v3;

  v3 = -1;
  if (DTIntegerSysctlByName("hw.cputype", &v3))
    return -1;
  else
    return v3;
}

- (int)hwCPU64BitCapable
{
  return DTCoreIs64BitCapable();
}

- (id)hardwareInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("numberOfPhysicalCpus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[DTDeviceInfoService numberOfPhysicalCpus](self, "numberOfPhysicalCpus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("numberOfCpus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[DTDeviceInfoService numberOfCpus](self, "numberOfCpus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("hwCPUtype");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[DTDeviceInfoService hwCPUtype](self, "hwCPUtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("hwCPUsubtype");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[DTDeviceInfoService hwCPUsubtype](self, "hwCPUsubtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("hwCPU64BitCapable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[DTDeviceInfoService hwCPU64BitCapable](self, "hwCPU64BitCapable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (id)lookupSysctl:(const char *)a3
{
  void *v4;
  void *v5;
  size_t size;

  size = 0;
  sysctlbyname(a3, 0, &size, 0, 0);
  v4 = malloc_type_malloc(size, 0x46864988uLL);
  sysctlbyname(a3, v4, &size, 0, 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  free(v4);
  return v5;
}

- (id)_lookupInt32Sysctl:(const char *)a3
{
  int v3;
  void *v4;
  size_t v6;
  unsigned int v7;

  v7 = 0;
  v6 = 4;
  v3 = sysctlbyname(a3, &v7, &v6, 0, 0);
  v4 = 0;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_lookupInt64Sysctl:(const char *)a3
{
  int v3;
  void *v4;
  size_t v6;
  uint64_t v7;

  v6 = 8;
  v7 = 0;
  v3 = sysctlbyname(a3, &v7, &v6, 0, 0);
  v4 = 0;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_getIOMFBProperties
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_registry_entry_t v5;
  void *v6;
  const __CFAllocator *v7;
  void *CFProperty;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching("IOMobileFramebuffer");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
  {
    v10 = 0;
    return v10;
  }
  v5 = MatchingService;
  v6 = (void *)objc_opt_new();
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, CFSTR("IOMFB_KTRACE_API_VERSION"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = CFProperty;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = CFProperty;
      goto LABEL_10;
    }
    objc_msgSend(CFProperty, "stringValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  if (!v11)
    goto LABEL_11;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, DTDeviceInfoConfigIOMFBTracepointVersionKey);
LABEL_10:

LABEL_11:
  v12 = (void *)IORegistryEntryCreateCFProperty(v5, CFSTR("NormalModeEnable"), v7, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v12)
      goto LABEL_15;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, DTDeviceInfoConfigIOMFBAPTEnabledKey);
  }

LABEL_15:
  v13 = (void *)IORegistryEntryCreateCFProperty(v5, CFSTR("M3TimingParameters"), v7, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_24:

    goto LABEL_25;
  }
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("subframe-duration-nclks"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, DTDeviceInfoConfigIOMFBAPTQuantaTimeKey);
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("display-lead-time-nclks"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, DTDeviceInfoConfigIOMFBAPTQuantaLeadTimeKey);
    }

    goto LABEL_24;
  }
LABEL_25:
  IOObjectRelease(v5);
  if (objc_msgSend(v6, "count"))
    v10 = (void *)objc_msgSend(v6, "copy");
  else
    v10 = 0;

  return v10;
}

- (id)uniqueID
{
  __CFString *v2;
  const __CFUUID *v3;
  __CFString *v4;
  __int128 v6;
  uuid_t v7;

  v2 = (__CFString *)qword_25576F970;
  if (!qword_25576F970)
  {
    memset(v7, 0, sizeof(v7));
    v6 = xmmword_222BD1660;
    if (gethostuuid(v7, (const timespec *)&v6) == -1)
      return CFSTR("MISSING");
    v3 = CFUUIDCreateFromUUIDBytes(0, *(CFUUIDBytes *)v7);
    v4 = (__CFString *)CFUUIDCreateString(0, v3);
    objc_storeStrong((id *)&qword_25576F970, v4);
    CFRelease(v3);
    v2 = (__CFString *)qword_25576F970;
  }
  if (!v2)
    v2 = CFSTR("MISSING");
  return v2;
}

- (id)productVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ProductVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_configurationProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[DTDeviceInfoService _lookupInt32Sysctl:](self, "_lookupInt32Sysctl:", "vm.pagesize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, DTDeviceInfoConfigVMPageSizeKey);
  -[DTDeviceInfoService _lookupInt32Sysctl:](self, "_lookupInt32Sysctl:", "hw.pagesize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, DTDeviceInfoConfigHWPageSizeKey);
  -[DTDeviceInfoService _lookupInt64Sysctl:](self, "_lookupInt64Sysctl:", "hw.memsize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, DTDeviceInfoConfigMemSizeSizeKey);
  -[DTDeviceInfoService _getIOMFBProperties](self, "_getIOMFBProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  return v3;
}

- (id)traceCodesFile
{
  __CFString *v2;
  id v3;
  id v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", CFSTR("/usr/share/misc/trace.codes"), 4, &v5);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v5;
  if (v3)
  {

    NSLog(CFSTR("Error reading contents of trace.codes file: %@"), v3);
    v2 = &stru_24EB2CF78;
  }

  return v2;
}

- (id)kpepDatabase
{
  kpep_db **p_kpepDB;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  p_kpepDB = &self->_kpepDB;
  if (self->_kpepDB)
    goto LABEL_7;
  v3 = kpep_db_create();
  if ((_DWORD)v3)
  {
    v4 = v3;
    if ((_DWORD)v3 != 7 || DTCoreIs64BitCapable())
      NSLog(CFSTR("Unable to create KPEP database: %d"), v4);
  }
  v5 = *p_kpepDB;
  if (*p_kpepDB)
  {
LABEL_7:
    v6 = kpep_db_serialize();
    if ((_DWORD)v6)
    {
      NSLog(CFSTR("Unable to serialize KPEP database: %d"), v6);
      return 0;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)sysmonProcessAttributes
{
  return +[DTSysmonTapSupportedAttributes localProcessAttributes](DTSysmonTapSupportedAttributes, "localProcessAttributes");
}

- (id)sysmonSystemAttributes
{
  return +[DTSysmonTapSupportedAttributes localSystemAttributes](DTSysmonTapSupportedAttributes, "localSystemAttributes");
}

- (id)sysmonCoalitionAttributes
{
  return +[DTSysmonTapSupportedAttributes localCoalitionAttributes](DTSysmonTapSupportedAttributes, "localCoalitionAttributes");
}

- (id)networkInformation
{
  return (id)MEMORY[0x24BEDD108](DTNetworkInterfaceInfo, sel_interfaceNameMappings);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_sharedCacheSymbolicators, 0);
  objc_storeStrong((id *)&self->_dtsecurityPidWatcher, 0);
  objc_storeStrong((id *)&self->_trackingSymbolicatorQueue, 0);
  objc_storeStrong((id *)&self->_peerTrackingSelectorsByPid, 0);
}

@end
