@implementation EXPKService

- (void)beganUsingServicePersonality:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__EXPKService_beganUsingServicePersonality___block_invoke;
  block[3] = &unk_1E2CFC438;
  block[4] = self;
  if (beganUsingServicePersonality__onceToken != -1)
    dispatch_once(&beganUsingServicePersonality__onceToken, block);
}

void __44__EXPKService_beganUsingServicePersonality___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[8];
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "timerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__EXPKService_beganUsingServicePersonality___block_invoke_2;
  block[3] = &unk_1E2CFC438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

  pklog_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartup", ", v4, 2u);
  }

}

void __44__EXPKService_beganUsingServicePersonality___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setFirstHostRequestTimer:", 0);
  }
}

+ (void)main
{
  NSObject *v2;
  NSObject *v3;
  int current_persona;
  NSObject *v5;
  void *v6;
  uint8_t v7[4];
  uid_t v8;
  __int16 v9;
  uid_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint8_t buf[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartup", ", buf, 2u);
  }

  pklog_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartupXPCReady", ", buf, 2u);
  }

  current_persona = voucher_get_current_persona();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_DWORD *)buf = 1;
  pklog_get_persona_type_and_name();
  pklog_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v7 = 67110146;
    v8 = geteuid();
    v9 = 1024;
    v10 = getuid();
    v11 = 1024;
    v12 = current_persona;
    v13 = 2080;
    v14 = 0;
    v15 = 2080;
    v16 = 0;
    _os_log_impl(&dword_190C25000, v5, OS_LOG_TYPE_DEFAULT, "Hello, I'm launching as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v7, 0x28u);
  }

  objc_msgSend((id)objc_opt_class(), "defaultService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "run");

}

- (EXPKService)init
{
  Class v3;
  void *v4;
  EXPKService *v5;
  id v7;

  v3 = NSClassFromString(CFSTR("PKProxyFactory"));
  if (!v3)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99DA0]);
    objc_exception_throw((id)objc_msgSend(v7, "initWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("\"EXPKService\" init failed due to missing required class \"PKProxyFactory\"!"), 0));
  }
  -[objc_class defaultFactory](v3, "defaultFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EXPKService initWithProxyFactory:](self, "initWithProxyFactory:", v4);

  return v5;
}

- (EXPKService)initWithProxyFactory:(id)a3
{
  id v5;
  EXPKService *v6;
  EXPKService *v7;
  void *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *timerQueue;
  uint64_t active_platform;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EXPKService;
  v6 = -[EXPKService init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxyFactory, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EXPKService setPersonalities:](v7, "setPersonalities:", v8);

    v9 = dispatch_queue_create("timer queue", 0);
    timerQueue = v7->_timerQueue;
    v7->_timerQueue = (OS_dispatch_queue *)v9;

    v7->_personalityLock._os_unfair_lock_opaque = 0;
    active_platform = dyld_get_active_platform();
    pklog_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v16 = active_platform;
      _os_log_impl(&dword_190C25000, v12, OS_LOG_TYPE_INFO, "setting extensionPointPlatform: %u", buf, 8u);
    }

    -[EXPKService setExtensionPointPlatform:](v7, "setExtensionPointPlatform:", active_platform);
  }

  return v7;
}

+ (id)defaultService
{
  if (defaultService_once != -1)
    dispatch_once(&defaultService_once, &__block_literal_global_15);
  return (id)defaultService__service;
}

void __29__EXPKService_defaultService__block_invoke()
{
  EXPKService *v0;
  void *v1;

  v0 = objc_alloc_init(EXPKService);
  v1 = (void *)defaultService__service;
  defaultService__service = (uint64_t)v0;

}

- (BOOL)supportsAutoreleasePoolDuringPlugInLaunch
{
  return dyld_program_sdk_at_least();
}

- (void)run
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[8];
  _QWORD block[5];

  if (-[EXPKService supportsAutoreleasePoolDuringPlugInLaunch](self, "supportsAutoreleasePoolDuringPlugInLaunch"))
  {
    v3 = (void *)MEMORY[0x194018140]();
    -[EXPKService _prepareToRun](self, "_prepareToRun");
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    -[EXPKService _prepareToRun](self, "_prepareToRun");
  }
  -[EXPKService timerQueue](self, "timerQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__EXPKService_run__block_invoke;
  block[3] = &unk_1E2CFC438;
  block[4] = self;
  dispatch_async(v4, block);

  pklog_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_190C25000, v5, OS_LOG_TYPE_DEFAULT, "Bootstrapping; Bootstrap complete. Ready for handshake from host.",
      v8,
      2u);
  }

  pklog_handle_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartupXPCReady", ", v8, 2u);
  }

  -[EXPKService serviceListener](self, "serviceListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x194017D80]();

  exit(1);
}

void __18__EXPKService_run__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *v7;

  objc_msgSend(*(id *)(a1 + 32), "timerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v2);
  objc_msgSend(*(id *)(a1 + 32), "setFirstHostRequestTimer:", v3);

  objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_event_handler(v4, &__block_literal_global_7_0);

  v5 = dispatch_time(0, 2000000000);
  objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v7);

}

void __18__EXPKService_run__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  pklog_handle_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __18__EXPKService_run__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)_prepareToRun
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "Bootstrapping; service delegate class %{public}@ does not conform to PKServiceDelegate",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

+ (int)_defaultRun:(int)a3 arguments:(const char *)a4
{
  objc_msgSend(a1, "main", *(_QWORD *)&a3, a4);
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  -[EXPKService serviceListener](self, "serviceListener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v10 = objc_alloc(NSClassFromString(CFSTR("PKServicePersonality")));
    -[EXPKService proxyFactory](self, "proxyFactory");
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pklog_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EXPKService listener:shouldAcceptNewConnection:].cold.1();
  }

  return v8 == v6;
}

- (id)_subDictionaryOfSDKWithKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CA58E0];
  v4 = a3;
  objc_msgSend(v3, "extensionPointRecordForCurrentProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SDKDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:ofClass:", v4, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_xpcServiceDict
{
  return -[EXPKService _subDictionaryOfSDKWithKey:](self, "_subDictionaryOfSDKWithKey:", CFSTR("XPCService"));
}

- (id)_subServices
{
  void *v2;
  void *v3;

  -[EXPKService _xpcServiceDict](self, "_xpcServiceDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_AdditionalSubServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_serviceType
{
  void *v2;
  void *v3;

  -[EXPKService _xpcServiceDict](self, "_xpcServiceDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ServiceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subsystems
{
  void *v2;
  void *v3;

  -[EXPKService _subDictionaryOfSDKWithKey:](self, "_subDictionaryOfSDKWithKey:", *MEMORY[0x1E0D7D470]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D7D490]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_processDefaultSubsystemName:(id)a3
{
  return 1;
}

- (void)discoverSubsystems
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_190C25000, log, OS_LOG_TYPE_FAULT, "Bootstrapping; Error: Unexpected class for bootstrap for key 'SUBSYSTEM_OPTIONS'. This value must be an NSDictionary.",
    v1,
    2u);
}

- (id)configuredSubsystemList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D7D470]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D7D478]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPKService mergeSubsystems:from:](self, "mergeSubsystems:from:", v6, v5);

  return v6;
}

- (void)mergeSubsystems:(id)a3 from:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D7D490]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPKService mergeSubsystemList:from:](self, "mergeSubsystemList:from:", v11, v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D7D480]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D7D488]),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EXPKService _subsystems](self, "_subsystems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EXPKService mergeSubsystemList:from:](self, "mergeSubsystemList:from:", v11, v9);

    -[EXPKService _serviceType](self, "_serviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("System")))
      -[EXPKService setIsSystemService:](self, "setIsSystemService:", 1);

  }
}

- (void)mergeSubsystemList:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v5, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
  }

}

- (id)discoverSubsystemNamed:(id)a3 options:(id)a4 required:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  Class v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_retainAutorelease(v7);
  v10 = objc_lookUpClass((const char *)objc_msgSend(v9, "UTF8String"));
  pklog_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (v5)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[EXPKService discoverSubsystemNamed:options:required:].cold.1();
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_190C25000, v12, OS_LOG_TYPE_INFO, "Bootstrapping; external subsystem [%{public}@] not present, skipping",
        (uint8_t *)&v17,
        0xCu);
    }
    goto LABEL_19;
  }
  if (os_signpost_enabled(v11))
  {
    v17 = 138543362;
    v18 = v9;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionSubsystemInit", " name=%{public, signpost.description:attribute}@ ", (uint8_t *)&v17, 0xCu);
  }

  pklog_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_190C25000, v13, OS_LOG_TYPE_INFO, "Bootstrapping; external subsystem [%{public}@] initializing",
      (uint8_t *)&v17,
      0xCu);
  }

  __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_INIT__();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    v17 = 138543618;
    v18 = v9;
    v19 = 1026;
    v20 = v14 != 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionSubsystemInit", " name=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d ", (uint8_t *)&v17, 0x12u);
  }

  if (!v14)
  {
    pklog_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[EXPKService discoverSubsystemNamed:options:required:].cold.2();
    goto LABEL_19;
  }
  if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EE211D98) & 1) == 0)
  {

    pklog_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[EXPKService discoverSubsystemNamed:options:required:].cold.3();
LABEL_19:

    v14 = 0;
  }

  return v14;
}

- (void)launchContainingApplicationForPlugInNamed:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  pklog_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[EXPKService launchContainingApplicationForPlugInNamed:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (id)defaultsForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[EXPKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)plugInPrincipalForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[EXPKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "plugInPrincipal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hostPrincipalForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[EXPKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostPrincipal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)embeddedPrincipalForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[EXPKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedPrincipal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)connectionForPlugInNamed:(id)a3
{
  void *v3;
  void *v4;

  -[EXPKService personalityNamed:](self, "personalityNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSolePersonality:(id)a3
{
  PKServicePersonality *v4;
  PKServicePersonality *solePersonality;

  v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  solePersonality = self->_solePersonality;
  self->_solePersonality = v4;

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (PKServicePersonality)solePersonality
{
  os_unfair_lock_s *p_personalityLock;
  PKServicePersonality *v4;
  NSObject *v5;

  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  v4 = self->_solePersonality;
  os_unfair_lock_unlock(p_personalityLock);
  if (!v4)
  {
    pklog_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[EXPKService solePersonality].cold.1(self, v5);

  }
  return v4;
}

- (id)personalityNamed:(id)a3
{
  id v4;
  os_unfair_lock_s *p_personalityLock;
  void *v6;
  void *v7;
  void *v8;
  PKServicePersonality *v9;

  v4 = a3;
  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  if (v4)
  {
    -[EXPKService personalities](self, "personalities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "allValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (PKServicePersonality *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = self->_solePersonality;
  }
  os_unfair_lock_unlock(p_personalityLock);

  return v9;
}

- (id)personalityNamed:(id)a3 forHostPid:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_personalityLock;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a4;
  p_personalityLock = &self->_personalityLock;
  v7 = a3;
  os_unfair_lock_lock(p_personalityLock);
  -[EXPKService personalities](self, "personalities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_personalityLock);
  return v11;
}

- (void)registerPersonality:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  PKServicePersonality *v19;
  PKServicePersonality *solePersonality;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_personalityLock);
  -[EXPKService personalities](self, "personalities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EXPKService personalities](self, "personalities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "processIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v12);

  -[EXPKService personalities](self, "personalities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") == 1)
  {
    v14 = objc_msgSend(v7, "count");

    if (v14 == 1)
    {
      pklog_handle_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "version");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v16;
        v24 = 2112;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_190C25000, v15, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Set sole personality.", (uint8_t *)&v22, 0x20u);

      }
      v19 = (PKServicePersonality *)v4;
      solePersonality = self->_solePersonality;
      self->_solePersonality = v19;
      goto LABEL_12;
    }
  }
  else
  {

  }
  pklog_handle_for_category();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[EXPKService registerPersonality:].cold.1(v4, self, v21);

  solePersonality = self->_solePersonality;
  self->_solePersonality = 0;
LABEL_12:

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (BOOL)unregisterPersonality:(id)a3
{
  PKServicePersonality *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  PKServicePersonality *solePersonality;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  -[EXPKService personalities](self, "personalities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "count");

  if (v6)
  {
    -[EXPKService personalities](self, "personalities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKServicePersonality identifier](v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[PKServicePersonality connection](v4, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v10, "processIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v12 != 0;

    if (v12)
    {
      objc_msgSend(v9, "removeObjectForKey:", v11);
      if (self->_solePersonality == v4)
      {
        pklog_handle_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[PKServicePersonality uuid](v4, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKServicePersonality identifier](v4, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKServicePersonality version](v4, "version");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543874;
          v20 = v14;
          v21 = 2112;
          v22 = v15;
          v23 = 2112;
          v24 = v16;
          _os_log_impl(&dword_190C25000, v13, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Removed sole personality.", (uint8_t *)&v19, 0x20u);

        }
        solePersonality = self->_solePersonality;
        self->_solePersonality = 0;

      }
    }

  }
  os_unfair_lock_unlock(&self->_personalityLock);

  return (char)v6;
}

- (void)checkEnvironment:(id)a3
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char __s;
  _BYTE v7[1031];

  *(_QWORD *)&v7[1023] = *MEMORY[0x1E0C80C00];
  bzero(v7, 0x3FFuLL);
  __s = 63;
  getpid();
  if (sandbox_container_path_for_pid())
  {
    pklog_handle_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[EXPKService checkEnvironment:].cold.2(v3);

  }
  else if (strlen(&__s) > 1)
  {
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("plugin has invalid sandbox or container: error %d path %s"), *__error(), &__s);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[EXPKService checkEnvironment:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v4);
}

- (void)scheduleTermination:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[EXPKService timerQueue](self, "timerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__EXPKService_scheduleTermination___block_invoke;
  v6[3] = &unk_1E2CFD660;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

void __35__EXPKService_scheduleTermination___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;

  objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v9, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "timerQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    objc_msgSend(*(id *)(a1 + 32), "setTerminationTimer:", v5);

    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_event_handler(v6, &__block_literal_global_85_0);

    v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v8, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);
  }

}

uint64_t __35__EXPKService_scheduleTermination___block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[16];

  pklog_handle_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_190C25000, v0, OS_LOG_TYPE_DEFAULT, "Exiting when clean", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

- (void)cancelTermination
{
  NSObject *v3;
  _QWORD block[5];

  -[EXPKService timerQueue](self, "timerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EXPKService_cancelTermination__block_invoke;
  block[3] = &unk_1E2CFC438;
  block[4] = self;
  dispatch_async(v3, block);

}

void __32__EXPKService_cancelTermination__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  xpc_transaction_interrupt_clean_exit();
  objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setTerminationTimer:", 0);
  }
}

- (unsigned)extensionPointPlatform
{
  return self->_extensionPointPlatform;
}

- (void)setExtensionPointPlatform:(unsigned int)a3
{
  self->_extensionPointPlatform = a3;
}

- (os_unfair_lock_s)personalityLock
{
  return self->_personalityLock;
}

- (OS_dispatch_queue)timerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (EXPKServiceDelegate)delegate
{
  return (EXPKServiceDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSXPCListener)serviceListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)personalities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersonalities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)subsystems
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSubsystems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (OS_dispatch_source)terminationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTerminationTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_source)firstHostRequestTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirstHostRequestTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PKProxyFactory)proxyFactory
{
  return self->_proxyFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyFactory, 0);
  objc_storeStrong((id *)&self->_firstHostRequestTimer, 0);
  objc_storeStrong((id *)&self->_terminationTimer, 0);
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_personalities, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_solePersonality, 0);
}

void __18__EXPKService_run__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_190C25000, a1, a3, "WARNING: Did not receive handshake message from the host after waiting ~%0.0f seconds. THIS MAY BE A SPURIOUS LAUNCH OF THE PLUGIN due to a message to an XPC endpoint other than the main service endpoint, or the CPU is highly contended and this extension or its host is not getting enough CPU time.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "Bootstrapping; PlugInKit listener %{public}@ unexpected (rejecting)",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

- (void)discoverSubsystemNamed:options:required:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_190C25000, v0, OS_LOG_TYPE_FAULT, "Bootstrapping; misconfigured plugin; external subsystem [%{public}@] not present; possible missing linkage",
    v1,
    0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)discoverSubsystemNamed:options:required:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "Bootstrapping; external subsystem %{public}@ refused setup",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

- (void)discoverSubsystemNamed:options:required:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "Bootstrapping; external subsystem initializer %{public}@ does not conform to PKModularService",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

- (void)launchContainingApplicationForPlugInNamed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_190C25000, a1, a3, "%s unsupported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)solePersonality
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "personalities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_190C25000, a2, OS_LOG_TYPE_ERROR, "WARNING! Sole personality requested when nil; THIS MAY BE A SPURIOUS LAUNCH OF THE PLUGIN due to a message to an XPC"
    " endpoint other than the main service endpoint; personalities: %@",
    v4,
    0xCu);

}

- (void)registerPersonality:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "personalities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138544130;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_error_impl(&dword_190C25000, a3, OS_LOG_TYPE_ERROR, "[u %{public}@] [%@(%@)] WARNING! Sole personality is ambiguous; this may lead to erratic behavior; personalities: %@",
    (uint8_t *)&v10,
    0x2Au);

}

- (void)checkEnvironment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)checkEnvironment:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190C25000, log, OS_LOG_TYPE_ERROR, "Bootstrapping; failed to get my own sandbox container",
    v1,
    2u);
}

@end
