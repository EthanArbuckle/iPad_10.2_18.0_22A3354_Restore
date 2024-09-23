@implementation BMBlockMonitoring

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_sharedManager;
}

void __34__BMBlockMonitoring_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BMBlockMonitoring initForTesting:bootArgs:]([BMBlockMonitoring alloc], "initForTesting:bootArgs:", 0, 0);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (id)initForTesting:(BOOL)a3 bootArgs:(id)a4
{
  _BOOL4 v5;
  id v7;
  BMBlockMonitoring *v8;
  BMBlockMonitoring *v9;
  os_log_t v10;
  OS_os_log *logger;
  int has_internal_diagnostics;
  unsigned __int8 *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  _BOOL4 v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  _BOOL4 v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  uint64_t v45;
  NSString *osVersion;
  NSObject *v47;
  unsigned __int8 v48;
  void *v49;
  id v50;
  unsigned __int8 v51;
  NSObject *v52;
  dispatch_queue_t v53;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v55;
  unsigned int *v56;
  NSObject *v57;
  NSObject *v58;
  const char *v59;
  _BOOL4 enabled;
  unsigned __int8 v61;
  unsigned __int8 v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  unsigned __int8 v66;
  uint64_t v68;
  _QWORD block[4];
  BMBlockMonitoring *v70;
  _QWORD v71[4];
  unsigned int *v72;
  id v73;
  _QWORD v74[4];
  unsigned __int8 *v75;
  uint64_t *v76;
  objc_super v77;
  _BYTE v78[14];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  uint64_t v83;

  v5 = a3;
  v83 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v77.receiver = self;
  v77.super_class = (Class)BMBlockMonitoring;
  v8 = -[BMBlockMonitoring init](&v77, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_87;
  v8->_testing = v5;
  if (v5)
    objc_storeStrong((id *)&v8->_test_bootArgs, a4);
  *(_OWORD *)&v9->_executionDuration = xmmword_2373F93A0;
  v10 = os_log_create("com.apple.blockmonitoring", "BMBlockMonitoring");
  logger = v9->_logger;
  v9->_logger = (OS_os_log *)v10;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9->_enabled = has_internal_diagnostics;
  if (!has_internal_diagnostics)
    goto LABEL_22;
  if (MGGetBoolAnswer())
  {
    if (os_log_type_enabled((os_log_t)v9->_logger, OS_LOG_TYPE_ERROR))
      -[BMBlockMonitoring initForTesting:bootArgs:].cold.7();
    v9->_enabled = 0;
    goto LABEL_22;
  }
  if (!v9->_enabled)
    goto LABEL_22;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke;
  v74[3] = &unk_2508A5A78;
  v76 = &v79;
  v13 = v9;
  v75 = v13;
  +[BMBlockMonitoring readEntitlement:withBlock:](BMBlockMonitoring, "readEntitlement:withBlock:", CFSTR("com.apple.security.exception.sysctl.read-only"), v74);
  if (*((_BYTE *)v80 + 24))
  {
    *(_QWORD *)v78 = 0;
    if (objc_msgSend(v13, "parseBootArgInt:where:", CFSTR("debug"), v78) && (v78[1] & 4) != 0)
    {
      v9->_enabled = 1;
    }
    else
    {
      v14 = v9->_logger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[BMBlockMonitoring initForTesting:bootArgs:].cold.9((uint64_t)v78, v14, v15, v16, v17, v18, v19, v20);
      v9->_enabled = 0;
      if ((objc_msgSend(v13, "parseBootArgInt:where:", CFSTR("blockmonitoringnoui"), 0) & 1) == 0)
      {
        atomic_store(1u, v13 + 41);
        *((_QWORD *)v13 + 6) = *(_QWORD *)v78;
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)v9->_logger, OS_LOG_TYPE_ERROR))
      -[BMBlockMonitoring initForTesting:bootArgs:].cold.8();
    v9->_enabled = 0;
  }

  _Block_object_dispose(&v79, 8);
  if (!v9->_enabled)
  {
LABEL_22:
    v21 = atomic_load((unsigned __int8 *)&v9->_presentAlert);
    if ((v21 & 1) == 0)
      goto LABEL_37;
  }
  v79 = 0;
  v22 = -[BMBlockMonitoring parseBootArgInt:where:](v9, "parseBootArgInt:where:", CFSTR("wdt"), &v79);
  if (v79 == -1 && v22)
  {
    v24 = v9->_logger;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[BMBlockMonitoring initForTesting:bootArgs:].cold.6((uint64_t)&v79, v24, v25, v26, v27, v28, v29, v30);
    v9->_enabled = 0;
    atomic_store(0, (unsigned __int8 *)&v9->_presentAlert);
  }
  v79 = -1;
  v31 = -[BMBlockMonitoring parseBootArgInt:where:](v9, "parseBootArgInt:where:", CFSTR("blockmonitoring"), &v79);
  if (v79)
    v32 = 0;
  else
    v32 = v31;
  if (v32)
  {
    v33 = v9->_logger;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[BMBlockMonitoring initForTesting:bootArgs:].cold.5((uint64_t)&v79, v33, v34, v35, v36, v37, v38, v39);
    v9->_enabled = 0;
    atomic_store(0, (unsigned __int8 *)&v9->_presentAlert);
  }
LABEL_37:
  if (v9->_enabled || (v40 = atomic_load((unsigned __int8 *)&v9->_presentAlert), (v40 & 1) != 0))
  {
    v41 = (void *)MEMORY[0x23B810280]();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bundleIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v43, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) == 0
      && (objc_msgSend(v43, "isEqualToString:", CFSTR("com.apple.backboardd")) & 1) == 0
      && !v9->_testing)
    {
      if (os_log_type_enabled((os_log_t)v9->_logger, OS_LOG_TYPE_ERROR))
        -[BMBlockMonitoring initForTesting:bootArgs:].cold.4();
      v9->_enabled = 0;
      atomic_store(0, (unsigned __int8 *)&v9->_presentAlert);
    }

    objc_autoreleasePoolPop(v41);
  }
  LOBYTE(v79) = 0;
  if (v9->_enabled || (v44 = atomic_load((unsigned __int8 *)&v9->_presentAlert), (v44 & 1) != 0))
  {
    *(_QWORD *)v78 = 20;
    if (sysctlbyname("kern.osversion", &v79, (size_t *)v78, 0, 0) < 0)
    {
      v47 = v9->_logger;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[BMBlockMonitoring initForTesting:bootArgs:].cold.3(v47);
      v9->_enabled = 0;
      atomic_store(0, (unsigned __int8 *)&v9->_presentAlert);
    }
    else
    {
      BYTE3(v81) = 0;
      v45 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", &v79, 4);
      osVersion = v9->_osVersion;
      v9->_osVersion = (NSString *)v45;

    }
  }
  if (v9->_enabled || (v48 = atomic_load((unsigned __int8 *)&v9->_presentAlert), (v48 & 1) != 0))
  {
    *(_QWORD *)v78 = -1;
    v73 = 0;
    +[BMBlockMonitoring computePersistencePath:error:](BMBlockMonitoring, "computePersistencePath:error:", v78, &v73);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v73;
    if (v49)
    {
      objc_storeStrong((id *)&v9->_persistencePath, v49);
      v9->_sandboxHandle = *(_QWORD *)v78;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)v9->_logger, OS_LOG_TYPE_ERROR))
        -[BMBlockMonitoring initForTesting:bootArgs:].cold.2();
      if (*(_QWORD *)v78 != -1)
        sandbox_extension_release();
      v9->_enabled = 0;
      atomic_store(0, (unsigned __int8 *)&v9->_presentAlert);
    }

  }
  if (v9->_enabled || (v51 = atomic_load((unsigned __int8 *)&v9->_presentAlert), (v51 & 1) != 0))
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = dispatch_queue_create("com.apple.blockmonitoring.BMBlockMonitoring", v52);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v53;

    v55 = v9->_queue;
    if (!v55)
      -[BMBlockMonitoring initForTesting:bootArgs:].cold.1();

  }
  if (!v9->_enabled)
  {
    atomic_store(0, &v9->_deviceState);
    goto LABEL_80;
  }
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke_29;
  v71[3] = &unk_2508A5AA0;
  v56 = v9;
  v72 = v56;
  +[BMBlockMonitoring readEntitlement:withBlock:](BMBlockMonitoring, "readEntitlement:withBlock:", CFSTR("com.apple.private.allow-ext_paniclog"), v71);
  if (*((_BYTE *)v56 + 88))
  {
    v57 = v9->_logger;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v78 = 0;
      _os_log_impl(&dword_2373F4000, v57, OS_LOG_TYPE_DEFAULT, "Process is properly entitled", v78, 2u);
    }
    getpid();
    v68 = 185;
    *((_BYTE *)v56 + 88) = sandbox_check() == 0;
  }
  v58 = v9->_logger;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v56 + 88))
      v59 = " ";
    else
      v59 = " not ";
    *(_DWORD *)v78 = 136315138;
    *(_QWORD *)&v78[4] = v59;
    _os_log_impl(&dword_2373F4000, v58, OS_LOG_TYPE_DEFAULT, "BM will%sbe using panic_with_data", v78, 0xCu);
  }

  enabled = v9->_enabled;
  atomic_store(0, v56 + 23);
  if (!enabled)
  {
LABEL_80:
    v61 = atomic_load((unsigned __int8 *)&v9->_presentAlert);
    if ((v61 & 1) == 0)
      goto LABEL_82;
  }
  -[BMBlockMonitoring lookForDeviceReadiness](v9, "lookForDeviceReadiness", v68);
LABEL_82:
  if (!v9->_enabled)
  {
    v62 = atomic_load((unsigned __int8 *)&v9->_presentAlert);
    if ((v62 & 1) != 0)
    {
      v63 = v9->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke_33;
      block[3] = &unk_2508A5AC8;
      v70 = v9;
      dispatch_async(v63, block);

    }
  }
  v64 = v9->_logger;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = v9->_enabled;
    v66 = atomic_load((unsigned __int8 *)&v9->_presentAlert);
    *(_DWORD *)v78 = 67109376;
    *(_DWORD *)&v78[4] = v65;
    *(_WORD *)&v78[8] = 1024;
    *(_DWORD *)&v78[10] = v66 & 1;
    _os_log_impl(&dword_2373F4000, v64, OS_LOG_TYPE_DEFAULT, "BM state: %d - %d", v78, 0xEu);
  }
LABEL_87:

  return v9;
}

void __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke(uint64_t a1, void *cf, uint64_t a3)
{
  NSObject *v5;
  CFTypeID v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_impl(&dword_2373F4000, v5, OS_LOG_TYPE_DEFAULT, "Failed gathering entitlement for boot-args reading: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (cf)
  {
    v7 = CFGetTypeID(cf);
    if (v7 == CFArrayGetTypeID())
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(cf, "containsObject:", CFSTR("kern.bootargs"));
  }
}

void __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke_29(uint64_t a1, CFTypeRef cf, uint64_t a3)
{
  NSObject *v5;
  CFTypeID v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_impl(&dword_2373F4000, v5, OS_LOG_TYPE_DEFAULT, "Failed gathering entitlement for panic_with_data: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (cf)
  {
    v7 = CFGetTypeID(cf);
    if (v7 == CFBooleanGetTypeID())
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = CFBooleanGetValue((CFBooleanRef)cf) != 0;
  }
}

uint64_t __45__BMBlockMonitoring_initForTesting_bootArgs___block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showBootArgsAlertWithCheckingFirst:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[BMBlockMonitoring cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)BMBlockMonitoring;
  -[BMBlockMonitoring dealloc](&v3, sel_dealloc);
}

- (void)cleanup
{
  if (self->_sandboxHandle != -1)
  {
    sandbox_extension_release();
    self->_sandboxHandle = -1;
  }
}

- (BOOL)parseBootArgInt:(id)a3 where:(int64_t *)a4
{
  id v6;
  NSDictionary *test_bootArgs;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  if (self->_testing
    && (test_bootArgs = self->_test_bootArgs) != 0
    && (-[NSDictionary objectForKey:](test_bootArgs, "objectForKey:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    if (a4)
    {
      -[NSDictionary objectForKey:](self->_test_bootArgs, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[BMBlockMonitoring initForTesting:bootArgs:].cold.1();
      *a4 = objc_msgSend(v9, "longLongValue");

    }
    v10 = 1;
  }
  else
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v10 = os_parse_boot_arg_int();
  }

  return v10;
}

- (void)lookForDeviceReadiness
{
  OS_dispatch_queue *v3;
  void *v4;
  uint64_t v5;
  NSObject *queue;
  id *v7;
  void *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  _QWORD v14[5];
  _QWORD handler[5];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = self->_queue;
  if (!v3)
    -[BMBlockMonitoring initForTesting:bootArgs:].cold.1();

  v4 = (void *)MEMORY[0x23B810280]();
  v5 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke;
  handler[3] = &unk_2508A5AF0;
  handler[4] = self;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &lookForDeviceReadiness_firstUnlockToken, queue, handler);
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v16 = xmmword_2508A5B78;
    v17 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (SetupAssistantLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)&v16 = 0;
    *((_QWORD *)&v16 + 1) = &v16;
    v17 = 0x2020000000;
    v7 = (id *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
    v18 = getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
    if (!getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr)
    {
      v8 = (void *)SetupAssistantLibrary();
      v7 = (id *)dlsym(v8, "BYSetupAssistantFinishedDarwinNotification");
      *(_QWORD *)(*((_QWORD *)&v16 + 1) + 24) = v7;
      getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v16, 8);
    if (!v7)
    {
      -[BMBlockMonitoring lookForDeviceReadiness].cold.2();
      __break(1u);
    }
    v9 = objc_retainAutorelease(*v7);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = self->_queue;
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke_40;
    v14[3] = &unk_2508A5AF0;
    v14[4] = self;
    notify_register_dispatch(v10, &lookForDeviceReadiness_buddyToken, v11, v14);

  }
  v12 = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke_42;
  block[3] = &unk_2508A5AC8;
  block[4] = self;
  dispatch_async(v12, block);
  objc_autoreleasePoolPop(v4);
}

void __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke(uint64_t a1, int token)
{
  unsigned int *v3;
  unsigned int v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  notify_cancel(token);
  v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 92);
  do
    v4 = __ldxr(v3);
  while (__stxr(v4 | 1, v3));
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "Device has been unlocked";
    v8 = 1024;
    v9 = v4 | 1;
    _os_log_impl(&dword_2373F4000, v5, OS_LOG_TYPE_DEFAULT, "%s (state: %d)", (uint8_t *)&v6, 0x12u);
  }
}

void __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke_40(uint64_t a1, int token)
{
  unsigned int *v3;
  unsigned int v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  notify_cancel(token);
  v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 92);
  do
    v4 = __ldxr(v3);
  while (__stxr(v4 | 2, v3));
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "Device has completed setup";
    v8 = 1024;
    v9 = v4 | 2;
    _os_log_impl(&dword_2373F4000, v5, OS_LOG_TYPE_DEFAULT, "%s (state: %d)", (uint8_t *)&v6, 0x12u);
  }
}

uint64_t __43__BMBlockMonitoring_lookForDeviceReadiness__block_invoke_42(uint64_t a1)
{
  uint64_t result;
  unsigned int *v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  NSObject *v11;
  _BYTE v12[24];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (MKBGetDeviceLockState() == 3 || (result = MKBDeviceUnlockedSinceBoot(), (_DWORD)result))
  {
    v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 92);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 | 1, v3));
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v12 = 136315394;
      *(_QWORD *)&v12[4] = "Device has been once unlocked";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = v4 | 1;
      _os_log_impl(&dword_2373F4000, v5, OS_LOG_TYPE_DEFAULT, "%s (state: %d)", v12, 0x12u);
    }
    result = lookForDeviceReadiness_firstUnlockToken;
    if (lookForDeviceReadiness_firstUnlockToken != -1)
      result = notify_cancel(lookForDeviceReadiness_firstUnlockToken);
  }
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)v12 = xmmword_2508A5B78;
    *(_QWORD *)&v12[16] = 0;
    result = _sl_dlopen();
    SetupAssistantLibraryCore_frameworkLibrary = result;
  }
  if (SetupAssistantLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)v12 = 0;
    *(_QWORD *)&v12[8] = v12;
    *(_QWORD *)&v12[16] = 0x2020000000;
    v6 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
    v13 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
    if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
    {
      v7 = (void *)SetupAssistantLibrary();
      v6 = dlsym(v7, "BYSetupAssistantNeedsToRun");
      *(_QWORD *)(*(_QWORD *)&v12[8] + 24) = v6;
      getBYSetupAssistantNeedsToRunSymbolLoc_ptr = v6;
    }
    _Block_object_dispose(v12, 8);
    if (!v6)
    {
      -[BMBlockMonitoring lookForDeviceReadiness].cold.2();
      __break(1u);
    }
    result = ((uint64_t (*)(uint64_t))v6)(v8);
    if ((result & 1) == 0)
    {
      v9 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 92);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 | 2, v9));
      v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v12 = 136315394;
        *(_QWORD *)&v12[4] = "Device does not require setup";
        *(_WORD *)&v12[12] = 1024;
        *(_DWORD *)&v12[14] = v10 | 2;
        _os_log_impl(&dword_2373F4000, v11, OS_LOG_TYPE_DEFAULT, "%s (state: %d)", v12, 0x12u);
      }
      result = lookForDeviceReadiness_buddyToken;
      if (lookForDeviceReadiness_buddyToken != -1)
        return notify_cancel(lookForDeviceReadiness_buddyToken);
    }
  }
  return result;
}

- (id)signaturePath
{
  void *persistencePath;
  void *v3;

  persistencePath = self->_persistencePath;
  if (persistencePath)
  {
    +[BMBlockMonitoring signatureFileName](BMBlockMonitoring, "signatureFileName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(persistencePath, "stringByAppendingPathComponent:", v3);
    persistencePath = (void *)objc_claimAutoreleasedReturnValue();

  }
  return persistencePath;
}

- (id)alertPath
{
  void *persistencePath;
  void *v3;

  persistencePath = self->_persistencePath;
  if (persistencePath)
  {
    +[BMBlockMonitoring alertFileName](BMBlockMonitoring, "alertFileName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(persistencePath, "stringByAppendingPathComponent:", v3);
    persistencePath = (void *)objc_claimAutoreleasedReturnValue();

  }
  return persistencePath;
}

- (void)showBootArgsAlertWithCheckingFirst:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  __CFUserNotification *v11;
  void *v12;
  void *v13;
  void *v14;
  CFOptionFlags responseFlags;
  SInt32 error;
  _QWORD v17[4];
  _QWORD v18[5];

  v3 = a3;
  v18[4] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x23B810280](self, a2);
  -[BMBlockMonitoring alertPath](self, "alertPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v3 || !access((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), 0))
  {
    if (self->_testing)
    {
      self->_test_alertShown = 1;
    }
    else
    {
      error = 0;
      v8 = *MEMORY[0x24BDBD6E0];
      v17[0] = *MEMORY[0x24BDBD6D8];
      v17[1] = v8;
      v18[0] = CFSTR("Missing boot-arg");
      v18[1] = CFSTR("Your device encountered an unexpectedly long stall that requires a core dump to diagnose. Please add bit 0x400 to the \"debug\" boot-arg to enable core dumps, then reboot your device and reproduce your latest actions. A core dump will be gathered automatically at the right time. Do you want to open Livability app to update the boot-arg?");
      v9 = *MEMORY[0x24BDBD6F0];
      v17[2] = *MEMORY[0x24BDBD6F8];
      v17[3] = v9;
      v18[2] = CFSTR("Update");
      v18[3] = CFSTR("Dismiss");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
      v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 2uLL, &error, v10);
      responseFlags = 0;
      CFUserNotificationReceiveResponse(v11, 0.0, &responseFlags);
      if (!responseFlags)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("livability://boot-args/set?debug=0x%llx"), self->_bootDebugFlags | 0x400);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "openURL:withOptions:", v13, 0);

      }
      CFRelease(v11);

    }
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"));
  }

  objc_autoreleasePoolPop(v5);
}

- (void)logPanicDeny:(id)a3 reason:(unsigned __int8)a4
{
  int v4;
  id v6;
  NSObject *logger;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_testing)
    self->_test_panicDeny = v4;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    +[BMBlockMonitoring sanitizedSignature:maxLength:](BMBlockMonitoring, "sanitizedSignature:maxLength:", v6, 255);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = self->_logger;
    if (os_signpost_enabled(v9))
    {
      v10 = 138543618;
      v11 = v8;
      v12 = 1026;
      v13 = v4;
      _os_signpost_emit_with_name_impl(&dword_2373F4000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "panic_avoided", "signature=%{public,signpost.telemetry:string1,name=signature}@ reason=%{public,signpost.telemetry:number1,name=reason}d enableTelemetry=YES ", (uint8_t *)&v10, 0x12u);
    }
    v6 = (id)v8;
  }
  else if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    -[BMBlockMonitoring logPanicDeny:reason:].cold.1();
  }

}

- (void)panicDeviceIfRelevant:(id)a3 thread_id:(unint64_t)a4 timeout:(unint64_t)a5 recovered:(BOOL *)a6
{
  id v10;
  pid_t v11;
  NSObject *logger;
  uint64_t v13;
  NSObject *v14;
  unsigned int test_panicSleep;
  void *v16;
  id v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  ssize_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  double v29;
  NSObject *v30;
  int v31;
  BOOL *p_presentAlert;
  int v33;
  void *v34;
  id v35;
  int v36;
  int v37;
  NSObject *v38;
  BMBlockMonitoring *v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  NSString *osVersion;
  uint64_t v52;
  NSObject *v53;
  int v54;
  uint64_t v55;
  void *v56;
  NSString *v57;
  void *v58;
  void *v59;
  id v60;
  ssize_t v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  int v65;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  NSString *v69;
  NSString *test_panicReason;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  unint64_t v80;
  unsigned int log;
  NSObject *loga;
  pid_t v83;
  id v84;
  uint8_t v85[4];
  id v86;
  __int16 v87;
  pid_t v88;
  __int16 v89;
  unint64_t v90;
  uint8_t buf[4];
  id v92;
  __int16 v93;
  _BYTE v94[14];
  __int16 v95;
  unint64_t v96;
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];

  v99[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (!self->_enabled)
  {
    p_presentAlert = &self->_presentAlert;
    do
    {
      v33 = __ldxr((unsigned __int8 *)p_presentAlert);
      if (v33 != 1)
      {
        __clrex();
        goto LABEL_32;
      }
    }
    while (__stxr(0, (unsigned __int8 *)p_presentAlert));
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      -[BMBlockMonitoring panicDeviceIfRelevant:thread_id:timeout:recovered:].cold.1();
    v34 = (void *)MEMORY[0x23B810280]();
    -[BMBlockMonitoring alertPath](self, "alertPath");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = open((const char *)objc_msgSend(v35, "fileSystemRepresentation"), 770, 384);
    if ((v36 & 0x80000000) == 0)
    {
      v37 = v36;
      fcntl(v36, 51);
      close(v37);
    }
    -[BMBlockMonitoring showBootArgsAlertWithCheckingFirst:](self, "showBootArgsAlertWithCheckingFirst:", 0);

    objc_autoreleasePoolPop(v34);
LABEL_32:
    v39 = self;
    v40 = v10;
    v41 = 4;
    goto LABEL_94;
  }
  v11 = getpid();
  logger = self->_logger;
  v13 = os_log_type_enabled(logger, OS_LOG_TYPE_ERROR);
  if ((_DWORD)v13)
  {
    *(_DWORD *)buf = 138413058;
    v92 = v10;
    v93 = 1024;
    *(_DWORD *)v94 = v11;
    *(_WORD *)&v94[4] = 2048;
    *(_QWORD *)&v94[6] = a4;
    v95 = 2048;
    v96 = a5;
    _os_log_error_impl(&dword_2373F4000, logger, OS_LOG_TYPE_ERROR, "%@ (%u:%llu) timed out after %llu seconds", buf, 0x26u);
  }
  if (self->_testing && self->_test_panicSleep)
  {
    v14 = self->_logger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      test_panicSleep = self->_test_panicSleep;
      *(_DWORD *)buf = 138413058;
      v92 = v10;
      v93 = 1024;
      *(_DWORD *)v94 = v11;
      *(_WORD *)&v94[4] = 2048;
      *(_QWORD *)&v94[6] = a4;
      v95 = 1024;
      LODWORD(v96) = test_panicSleep;
      _os_log_impl(&dword_2373F4000, v14, OS_LOG_TYPE_INFO, "%@ (%u:%llu) sleeping for testing for %us", buf, 0x22u);
    }
    v13 = sleep(self->_test_panicSleep);
  }
  v16 = (void *)MEMORY[0x23B810280](v13);
  -[BMBlockMonitoring signaturePath](self, "signaturePath");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = open((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 770, 384);
  if (v18 < 0)
  {
    v38 = self->_logger;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[BMBlockMonitoring panicDeviceIfRelevant:thread_id:timeout:recovered:].cold.2((uint64_t)v17, v38);
    -[BMBlockMonitoring logPanicDeny:reason:](self, "logPanicDeny:reason:", v10, 7);
    goto LABEL_36;
  }
  v19 = v18;
  v83 = v11;
  v20 = malloc_type_calloc(1uLL, 0x1FA0uLL, 0xD9A8ACA9uLL);
  if (!v20)
  {
    v42 = self->_logger;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[BMBlockMonitoring panicDeviceIfRelevant:thread_id:timeout:recovered:].cold.3(v42);
    -[BMBlockMonitoring logPanicDeny:reason:](self, "logPanicDeny:reason:", v10, 6);
    close(v19);
LABEL_36:

    objc_autoreleasePoolPop(v16);
    goto LABEL_95;
  }
  v21 = v20;
  v22 = read(v19, v20, 0x1FA0uLL);
  if (v22 < 1)
  {
    if (!*a6)
    {
      v79 = v16;
      v45 = 0;
      goto LABEL_68;
    }
    v43 = 0;
  }
  else
  {
    v80 = a4;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v21, v22);
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v23, 0, 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v16;
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v74 = v24;
      v25 = v24;
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("last_panic"));
      v26 = objc_claimAutoreleasedReturnValue();
      v76 = (void *)v26;
      v77 = v25;
      if (v26 && (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v28 = v27;
        objc_msgSend(v28, "timeIntervalSinceNow");
        if (v29 <= (double)-self->_panicPacing)
        {
          log = 0;
          v31 = 1;
          v24 = v74;
        }
        else
        {
          v30 = self->_logger;
          log = 1;
          v24 = v74;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v92 = v10;
            v93 = 2112;
            *(_QWORD *)v94 = v28;
            log = 1;
            _os_log_impl(&dword_2373F4000, v30, OS_LOG_TYPE_INFO, "%@ cannot panic, last panic was at: %@", buf, 0x16u);
          }
          v31 = 0;
        }
        v72 = v31;

        v25 = v77;
      }
      else
      {
        log = 0;
        v72 = 1;
        v24 = v74;
      }
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("last_build"));
      v46 = objc_claimAutoreleasedReturnValue();
      v71 = v23;
      v75 = (void *)v46;
      if (v46 && (v47 = (void *)v46, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v48 = objc_msgSend(v47, "isEqualToString:", self->_osVersion);
      else
        v48 = 1;
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("triggered_signatures"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v44 = v72;
      if (v72 && v48 && v49)
      {
        v50 = v49;
        objc_opt_class();
        v23 = v71;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v73 = v50;
          v43 = v50;
          v44 = objc_msgSend(v43, "containsObject:", v10) ^ 1;
          if ((v44 & 1) == 0)
          {
            loga = self->_logger;
            if (os_log_type_enabled(loga, OS_LOG_TYPE_INFO))
            {
              osVersion = self->_osVersion;
              *(_DWORD *)buf = 138412546;
              v92 = v10;
              v93 = 2112;
              *(_QWORD *)v94 = osVersion;
              _os_log_impl(&dword_2373F4000, loga, OS_LOG_TYPE_INFO, "%@ cannot panic, it has already panic on %@", buf, 0x16u);
            }
            log = 2;
          }
          v49 = v73;
        }
        else
        {
          v44 = 1;
          v49 = v50;
          v43 = 0;
        }
      }
      else
      {
        v23 = v71;
      }

    }
    else
    {
      v43 = 0;
      log = 0;
      v44 = 1;
    }

    if (!*a6)
    {
      a4 = v80;
      if (!v44)
      {
        v54 = 0;
        v16 = v79;
LABEL_83:
        v55 = log;
        goto LABEL_84;
      }
      v45 = log;
      if (v43)
      {
        objc_msgSend(v43, "arrayByAddingObject:", v10);
        v52 = objc_claimAutoreleasedReturnValue();

        v43 = (id)v52;
LABEL_69:
        v97[0] = CFSTR("last_panic");
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = self->_osVersion;
        v98[0] = v56;
        v98[1] = v57;
        v97[1] = CFSTR("last_build");
        v97[2] = CFSTR("triggered_signatures");
        v98[2] = v43;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v84 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v58, 200, 0, &v84);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v84;
        if (v59)
        {
          if (ftruncate(v19, 0) < 0
            || (v60 = objc_retainAutorelease(v59),
                v61 = pwrite(v19, (const void *)objc_msgSend(v60, "bytes"), objc_msgSend(v60, "length"), 0),
                v61 != objc_msgSend(v60, "length"))
            || fcntl(v19, 51) == -1)
          {
            v62 = self->_logger;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              -[BMBlockMonitoring panicDeviceIfRelevant:thread_id:timeout:recovered:].cold.7((uint64_t)v10, v62);
            v54 = 0;
            log = 5;
          }
          else
          {
            v54 = 1;
          }
          v16 = v79;
        }
        else
        {
          v16 = v79;
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
            -[BMBlockMonitoring panicDeviceIfRelevant:thread_id:timeout:recovered:].cold.6();
          v54 = 0;
          log = 5;
        }

        a4 = v80;
        goto LABEL_83;
      }
LABEL_68:
      log = v45;
      v80 = a4;
      v99[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 1);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_69;
    }
    v16 = v79;
    a4 = v80;
  }
  v53 = self->_logger;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v92 = v10;
    v93 = 1024;
    *(_DWORD *)v94 = v83;
    *(_WORD *)&v94[4] = 2048;
    *(_QWORD *)&v94[6] = a4;
    _os_log_impl(&dword_2373F4000, v53, OS_LOG_TYPE_INFO, "%@ (%u:%llu) recovered - skipping panic", buf, 0x1Cu);
  }
  v54 = 0;
  v55 = 3;
LABEL_84:
  free(v21);
  close(v19);

  objc_autoreleasePoolPop(v16);
  if (!v54)
  {
    v39 = self;
    v40 = v10;
    v41 = v55;
LABEL_94:
    -[BMBlockMonitoring logPanicDeny:reason:](v39, "logPanicDeny:reason:", v40, v41);
    goto LABEL_95;
  }
  v63 = objc_retainAutorelease(v10);
  snprintf((char *)buf, 0x400uLL, "BMBlockMonitoring: %s (%u:%llu)", (const char *)objc_msgSend(v63, "UTF8String"), v83, a4);
  v64 = self->_logger;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v85 = 138412802;
    v86 = v63;
    v87 = 1024;
    v88 = v83;
    v89 = 2048;
    v90 = a4;
    _os_log_error_impl(&dword_2373F4000, v64, OS_LOG_TYPE_ERROR, "%@ (%u:%llu) is going to panic device", v85, 0x1Cu);
  }
  if (self->_testing && !self->_test_allowPanic)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", buf, 4);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (NSString *)objc_msgSend(v68, "copy");
    test_panicReason = self->_test_panicReason;
    self->_test_panicReason = v69;

  }
  else
  {
    if (self->_panicWithData)
    {
      v65 = panic_with_data(0, 0, 0, 0, (const char *)buf);
      v66 = self->_logger;
      v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
      if (v65 < 0)
      {
        if (v67)
          -[BMBlockMonitoring panicDeviceIfRelevant:thread_id:timeout:recovered:].cold.4(v66);
      }
      else if (v67)
      {
        -[BMBlockMonitoring panicDeviceIfRelevant:thread_id:timeout:recovered:].cold.5();
      }
    }
    MEMORY[0x23B8104A8](3072, buf);
  }
LABEL_95:

}

- (void)executeBlockWithSignature:(const char *)a3 block:(id)a4
{
  -[BMBlockMonitoring executeBlockWithSignature:timeout:block:](self, "executeBlockWithSignature:timeout:block:", a3, self->_executionDuration, a4);
}

- (void)executeBlockWithSignature:(const char *)a3 timeout:(unint64_t)a4 block:(id)a5
{
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  NSObject *queue;
  NSObject *v11;
  dispatch_time_t v12;
  char *v13;
  _opaque_pthread_t *v14;
  unsigned __int8 *v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD handler[9];
  __uint64_t v19;

  v8 = (void (**)(_QWORD))a5;
  if (!a3)
    -[BMBlockMonitoring initForTesting:bootArgs:].cold.1();
  v9 = v8;
  if (!v8)
    -[BMBlockMonitoring initForTesting:bootArgs:].cold.1();
  queue = self->_queue;
  if (queue && (self->_enabled || self->_presentAlert) && self->_deviceState == 3)
  {
    v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, queue);
    v12 = dispatch_time(0, 1000000000 * a4);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * a4 / 0xA);
    v13 = strdup(a3);
    v19 = 0;
    v14 = pthread_self();
    pthread_threadid_np(v14, &v19);
    v15 = (unsigned __int8 *)malloc_type_malloc(1uLL, 0x100004077774924uLL);
    atomic_store(0, v15);
    v16 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __61__BMBlockMonitoring_executeBlockWithSignature_timeout_block___block_invoke;
    handler[3] = &unk_2508A5B18;
    handler[4] = self;
    handler[5] = v13;
    handler[6] = v19;
    handler[7] = a4;
    handler[8] = v15;
    dispatch_source_set_event_handler(v11, handler);
    v17[0] = v16;
    v17[1] = 3221225472;
    v17[2] = __61__BMBlockMonitoring_executeBlockWithSignature_timeout_block___block_invoke_2;
    v17[3] = &__block_descriptor_48_e5_v8__0l;
    v17[4] = v13;
    v17[5] = v15;
    dispatch_source_set_cancel_handler(v11, v17);
    dispatch_activate(v11);
    v9[2](v9);
    *v15 = 1;
    dispatch_source_cancel(v11);

  }
  else
  {
    v8[2](v8);
  }

}

void __61__BMBlockMonitoring_executeBlockWithSignature_timeout_block___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a1[5]);
  objc_msgSend(v2, "panicDeviceIfRelevant:thread_id:timeout:recovered:", v3, a1[6], a1[7], a1[8]);

}

void __61__BMBlockMonitoring_executeBlockWithSignature_timeout_block___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_bootArgs, 0);
  objc_storeStrong((id *)&self->_test_panicReason, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)monitorForTestingWithBootArgs:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[BMBlockMonitoring initForTesting:bootArgs:]([BMBlockMonitoring alloc], "initForTesting:bootArgs:", 1, v3);

  return v4;
}

- (void)_test_setExecutionDuration:(unint64_t)a3
{
  if (self->_testing)
    self->_executionDuration = a3;
}

- (void)_test_setPanicPacing:(int64_t)a3
{
  if (self->_testing)
    self->_panicPacing = a3;
}

- (void)_test_setOSVersion:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_testing)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_osVersion, a3);
    v5 = v6;
  }

}

- (void)_test_resetVariables
{
  NSString *test_panicReason;

  if (self->_testing)
  {
    self->_test_panicDeny = 0;
    test_panicReason = self->_test_panicReason;
    self->_test_panicReason = 0;

    self->_test_alertShown = 0;
  }
}

- (void)_test_allowPanic:(BOOL)a3
{
  if (self->_testing)
    self->_test_allowPanic = a3;
}

- (id)_test_getPanicReason
{
  if (self->_testing)
    return self->_test_panicReason;
  else
    return 0;
}

- (unsigned)_test_getPanicDeny
{
  if (self->_testing)
    return self->_test_panicDeny;
  else
    return 0;
}

- (void)_test_setEnabled:(BOOL)a3
{
  if (self->_testing)
    self->_enabled = a3;
}

- (BOOL)_test_getEnabled
{
  return self->_testing && self->_enabled;
}

- (id)_test_getSignaturePath
{
  void *v2;

  if (self->_testing)
  {
    -[BMBlockMonitoring signaturePath](self, "signaturePath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_test_getAlertPath
{
  void *v2;

  if (self->_testing)
  {
    -[BMBlockMonitoring alertPath](self, "alertPath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_test_getOSVersion
{
  if (self->_testing)
    return self->_osVersion;
  else
    return 0;
}

- (BOOL)_test_getAlertShown
{
  return self->_testing && self->_test_alertShown;
}

- (void)_test_setPresentAlert:(BOOL)a3
{
  if (self->_testing)
    atomic_store(1u, (unsigned __int8 *)&self->_presentAlert);
}

- (BOOL)_test_getPresentAlert
{
  unsigned __int8 v2;

  if (!self->_testing)
    return 0;
  v2 = atomic_load((unsigned __int8 *)&self->_presentAlert);
  return v2 & 1;
}

- (void)_test_setPanicSleep:(unsigned int)a3
{
  if (self->_testing)
    self->_test_panicSleep = a3;
}

- (BOOL)_test_getPanicWithData
{
  return self->_testing && self->_panicWithData;
}

+ (id)computePersistencePath:(int64_t *)a3 error:(id *)a4
{
  xpc_object_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  *a3 = -1;
  if (container_query_create())
  {
    container_query_set_class();
    v6 = xpc_string_create("group.com.apple.BlockMonitoring");
    container_query_set_group_identifiers();

    container_query_operation_set_flags();
    container_query_set_persona_unique_string();
    if (!container_query_get_single_result())
    {
      if (a4)
      {
        container_query_get_last_error();
        v10 = container_error_copy_unlocalized_description();
        if (!v10)
        {
          v9 = 0;
          *a4 = CFSTR("Unable to get sandbox result, and unable to get error string");
          goto LABEL_16;
        }
        v11 = (void *)v10;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        free(v11);
      }
      v9 = 0;
LABEL_16:
      container_query_free();
      return v9;
    }
    v7 = (void *)container_copy_sandbox_token();
    if (v7)
    {
      v8 = sandbox_extension_consume();
      if (v8 < 0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get sandbox extension: %d (handle: %lld)"), *__error(), v8);
          v9 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        goto LABEL_15;
      }
    }
    else
    {
      v8 = -1;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", container_get_path(), 4);
    *a3 = v8;
LABEL_15:
    free(v7);
    goto LABEL_16;
  }
  v9 = 0;
  if (a4)
    *a4 = CFSTR("Unable to create sandbox container query");
  return v9;
}

+ (id)signatureFileName
{
  return CFSTR("BMBlockMonitoring.plist");
}

+ (id)alertFileName
{
  return CFSTR("BMShowAlert");
}

+ (void)readEntitlement:(__CFString *)a3 withBlock:(id)a4
{
  void (**v5)(id, CFTypeRef, CFErrorRef);
  __SecTask *v6;
  __SecTask *v7;
  CFTypeRef v8;
  CFErrorRef error;

  v5 = (void (**)(id, CFTypeRef, CFErrorRef))a4;
  v6 = SecTaskCreateFromSelf(0);
  if (v6)
  {
    v7 = v6;
    error = 0;
    v8 = SecTaskCopyValueForEntitlement(v6, a3, &error);
    v5[2](v5, v8, error);
    if (error)
      CFRelease(error);
    if (v8)
      CFRelease(v8);
    CFRelease(v7);
  }
  else
  {
    v5[2](v5, 0, 0);
  }

}

+ (id)sanitizedSignature:(id)a3 maxLength:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  id v10;
  void *v11;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (sanitizedSignature_maxLength__onceToken != -1)
    dispatch_once(&sanitizedSignature_maxLength__onceToken, &__block_literal_global_135);
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", sanitizedSignature_maxLength__removedCharacters);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", &stru_2508A5EB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 <= 0)
  {
    v10 = v7;
  }
  else
  {
    v8 = objc_msgSend(v7, "length");
    if (v8 >= a4)
      v9 = a4;
    else
      v9 = v8;
    objc_msgSend(v7, "substringToIndex:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

void __59__BMBlockMonitoring_Testing__sanitizedSignature_maxLength___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1690], "alphanumericCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("_"));
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sanitizedSignature_maxLength__removedCharacters;
  sanitizedSignature_maxLength__removedCharacters = v0;

}

- (void)initForTesting:bootArgs:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_crash();
  __break(1u);
}

- (void)initForTesting:bootArgs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2373F4000, v0, v1, "Disabling feature - container not found: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initForTesting:(void *)a1 bootArgs:.cold.3(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_9(a1);
  __error();
  OUTLINED_FUNCTION_3(&dword_2373F4000, v2, v3, "Disabling feature - os version not gathered: %{errno}d", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_2();
}

- (void)initForTesting:bootArgs:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2373F4000, v0, v1, "Disabling feature - bundle identifier not allowed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initForTesting:(uint64_t)a3 bootArgs:(uint64_t)a4 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2373F4000, a2, a3, "Disabling feature - BlockMonitoring disabled: %llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initForTesting:(uint64_t)a3 bootArgs:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2373F4000, a2, a3, "Disabling feature - watchdog disabled: %llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initForTesting:bootArgs:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_2373F4000, v0, v1, "Disabling feature - virtual device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initForTesting:bootArgs:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_2373F4000, v0, v1, "Disabling feature - not allowed to read boot args", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initForTesting:(uint64_t)a3 bootArgs:(uint64_t)a4 .cold.9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2373F4000, a2, a3, "Disabling feature - coredumps not enabled: %llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (uint64_t)lookForDeviceReadiness
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[BMBlockMonitoring logPanicDeny:reason:].cold.1(v0);
}

- (void)logPanicDeny:reason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_2373F4000, v0, v1, "signposts not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)panicDeviceIfRelevant:thread_id:timeout:recovered:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2373F4000, v0, v1, "%@ took too long, prompting user to enable debug boot-args", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)panicDeviceIfRelevant:(uint64_t)a1 thread_id:(void *)a2 timeout:recovered:.cold.2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a2;
  __error();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2373F4000, v3, v4, "Failed opening %@: %{errno}d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11();
}

- (void)panicDeviceIfRelevant:(void *)a1 thread_id:timeout:recovered:.cold.3(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_9(a1);
  __error();
  OUTLINED_FUNCTION_3(&dword_2373F4000, v2, v3, "Failed allocating IO buffer: %{errno}d", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_2();
}

- (void)panicDeviceIfRelevant:(void *)a1 thread_id:timeout:recovered:.cold.4(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_9(a1);
  __error();
  OUTLINED_FUNCTION_3(&dword_2373F4000, v2, v3, "panic_with_data() failed with: %d", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_2();
}

- (void)panicDeviceIfRelevant:thread_id:timeout:recovered:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_2373F4000, v0, v1, "panic_with_data() unexpectedly returned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)panicDeviceIfRelevant:thread_id:timeout:recovered:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_2373F4000, v1, OS_LOG_TYPE_ERROR, "%@ cannot panic, serialization failed: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)panicDeviceIfRelevant:(uint64_t)a1 thread_id:(void *)a2 timeout:recovered:.cold.7(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a2;
  __error();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2373F4000, v3, v4, "%@ cannot panic, persisting or flushing failed: %{errno}d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11();
}

@end
