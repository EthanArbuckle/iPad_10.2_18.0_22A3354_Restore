@implementation EXConcreteExtensionContextVendor

- (void)_tearDownContextWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _EXExtensionGetGlobalStateQueue(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__EXConcreteExtensionContextVendor__tearDownContextWithUUID___block_invoke;
  v7[3] = &unk_1E2CFC638;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_beginRequestWithExtensionItems:(id)a3 listenerEndpoint:(id)a4 withContextUUID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  os_activity_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  _QWORD block[4];
  os_activity_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  EXConcreteExtensionContextVendor *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _EXLegacyLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v33 = v12;
    v34 = 2114;
    v35 = v11;
    v36 = 2112;
    v37 = v10;
    _os_log_debug_impl(&dword_190C25000, v14, OS_LOG_TYPE_DEBUG, "beginning request with UUID: %{public}@ with endpoint: %{public}@ for items: %@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = _os_activity_create(&dword_190C25000, "beginning extension request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  _EXExtensionGetGlobalStateQueue(0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke;
  block[3] = &unk_1E2CFD168;
  v25 = v16;
  v26 = v10;
  v27 = v11;
  v28 = v12;
  v29 = v15;
  v30 = self;
  v31 = v13;
  v18 = v13;
  v19 = v15;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  v23 = v16;
  dispatch_async(v17, block);

}

void __52__EXConcreteExtensionContextVendor__startListening___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, *MEMORY[0x1E0CB29D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v5);
  v7 = (void *)_startListening__listener;
  _startListening__listener = v6;

  v8 = (void *)_startListening__listener;
  +[_NSExtensionContextVendor _sharedExtensionContextVendor](EXConcreteExtensionContextVendor, "_sharedExtensionContextVendor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v9);

  objc_msgSend((id)_startListening__listener, "resume");
  LODWORD(v8) = *(unsigned __int8 *)(a1 + 32);
  _EXLegacyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v8)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190C25000, v10, OS_LOG_TYPE_DEFAULT, "Cecking in with launchd immediately", buf, 2u);
    }

    +[EXXPCUtil checkInWithLaunchd](EXXPCUtil, "checkInWithLaunchd");
  }
  else
  {
    if (v11)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_190C25000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling launchd after initial event", v12, 2u);
    }

    _EXExtensionInstallRunloopObserverToPingLaunchdAfterEvent();
  }

}

void __61__EXConcreteExtensionContextVendor__tearDownContextWithUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalImplementation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterruptionHandler:", 0);
  objc_msgSend(v3, "setInvalidationHandler:", 0);
  objc_msgSend(v3, "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __56__EXConcreteExtensionContextVendor__extensionDictionary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D7D438], "defaultService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("solePersonality"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("bundleInfoDictionary"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("NSExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)_extensionDictionary___extensionDictionary;
  _extensionDictionary___extensionDictionary = v3;

}

- (EXConcreteExtensionContextVendor)init
{
  EXConcreteExtensionContextVendor *v2;
  uint64_t v3;
  NSMutableDictionary *extensionContexts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EXConcreteExtensionContextVendor;
  v2 = -[_NSExtensionContextVendor _init](&v6, sel__init);
  if (v2)
  {
    v3 = objc_opt_new();
    extensionContexts = v2->__extensionContexts;
    v2->__extensionContexts = (NSMutableDictionary *)v3;

  }
  return v2;
}

void __58__EXConcreteExtensionContextVendor__extensionContextClass__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  +[EXConcreteExtensionContextVendor _extensionDictionary](EXConcreteExtensionContextVendor, "_extensionDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NSExtensionContextClass"));
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("NSExtensionContextClass"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v6 = objc_opt_class();
      v5 = 0;
      _extensionContextClass___extensionContextClass = v6;
      goto LABEL_6;
    }
  }
  v7 = objc_retainAutorelease(v2);
  _extensionContextClass___extensionContextClass = (uint64_t)objc_getClass((const char *)objc_msgSend(v7, "UTF8String"));
  if (_extensionContextClass___extensionContextClass)
  {
    v5 = v7;
LABEL_6:

    return;
  }
  NSLog(CFSTR("%s - %s:%d: Unable to find NSExtensionContextClass (%@) in extension bundle - did you link the framework that declares the extension point?"), "__extensionContextClass != nil", "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSupport/EXConcreteExtensionContextVendor.m", 129, v7);
  __break(1u);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a4;
  +[EXXPCUtil assertIsExtensionProcess](EXXPCUtil, "assertIsExtensionProcess");
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_extensionContextClass"), "_allowedErrorClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _EXLegacyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[EXConcreteExtensionContextVendor listener:shouldAcceptNewConnection:].cold.1();

  +[EXExtensionContextImplementation _extensionContextHostProtocolWithAllowedErrorClasses:](EXExtensionContextImplementation, "_extensionContextHostProtocolWithAllowedErrorClasses:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v8);

  +[EXExtensionContextImplementation _extensionContextVendorProtocolWithAllowedErrorClasses:](EXExtensionContextImplementation, "_extensionContextVendorProtocolWithAllowedErrorClasses:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v9);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v2 = +[EXConcreteExtensionContextVendor _extensionContextClass](EXConcreteExtensionContextVendor, "_extensionContextClass");
  v3 = (void *)objc_msgSend([v2 alloc], "initWithInputItems:listenerEndpoint:contextUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "internalImplementation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 64);
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
  }
  v35[0] = v36;
  v35[1] = v37;
  objc_msgSend(v4, "_setExtensionHostAuditToken:", v35);
  if (v3)
  {
    v6 = *(_QWORD *)(a1 + 72);
    if (!*(_QWORD *)(v6 + 8))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(_QWORD *)(a1 + 72);
      v9 = *(void **)(v8 + 8);
      *(_QWORD *)(v8 + 8) = v7;

      v6 = *(_QWORD *)(a1 + 72);
    }
    objc_msgSend(*(id *)(v6 + 16), "setObject:forKey:", v3, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 8), "setObject:forKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__3;
    v33[4] = __Block_byref_object_dispose__3;
    v34 = *(id *)(a1 + 72);
    v10 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_85;
    v30[3] = &unk_1E2CFD118;
    v32 = v33;
    v31 = *(id *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "setInterruptionHandler:", v30);
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_86;
    v27[3] = &unk_1E2CFD118;
    v29 = v33;
    v28 = *(id *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "setInvalidationHandler:", v27);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__3;
    v25[4] = __Block_byref_object_dispose__3;
    v26 = 0;
    v11 = *(void **)(a1 + 64);
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_87;
    v24[3] = &unk_1E2CFD038;
    v24[4] = v25;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setExtensionHostProxy:", v12);

    if (objc_msgSend(*(id *)(a1 + 72), "_shouldCreatePrincipalObject"))
    {
      v13 = objc_alloc_init(+[EXConcreteExtensionContextVendor _extensionPrincipalClass](EXConcreteExtensionContextVendor, "_extensionPrincipalClass"));
      _EXLegacyLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 72), "_onGlobalStateQueueOnly_setPrincipalObject:forUUID:", v13, *(_QWORD *)(a1 + 56));
    }
    else
    {
      _EXLegacyLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_cold_2();

      v13 = 0;
    }
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_89;
    v18[3] = &unk_1E2CFD140;
    v19 = *(id *)(a1 + 56);
    v23 = v25;
    v22 = *(id *)(a1 + 80);
    v16 = v13;
    v20 = v16;
    v17 = v3;
    v21 = v17;
    objc_msgSend(v4, "_willPerformHostCallback:", v18);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v33, 8);

    os_activity_scope_leave(&state);
  }
  else
  {
    NSLog(CFSTR("%s - %s:%d: _extensionContextClass: (%@) returned nil from initializer!"), "extensionContext != nil", "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSupport/EXConcreteExtensionContextVendor.m", 223, v2);
    __break(1u);
  }
}

+ (Class)_extensionContextClass
{
  if (_extensionContextClass_onceToken != -1)
    dispatch_once(&_extensionContextClass_onceToken, &__block_literal_global_64);
  return (Class)(id)_extensionContextClass___extensionContextClass;
}

void __60__EXConcreteExtensionContextVendor__extensionPrincipalClass__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  Class Class;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[EXConcreteExtensionContextVendor _extensionDictionary](EXConcreteExtensionContextVendor, "_extensionDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_EX_stringForKey:", CFSTR("NSExtensionPrincipalClass"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_EX_dictionaryForKey:", CFSTR("NSExtension"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_EX_stringForKey:", CFSTR("NSExtensionPrincipalClass"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
    {

    }
    else
    {
      objc_msgSend(v3, "_EX_stringForKey:", CFSTR("NSExtensionPrincipalClass"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v1)
      {
        v5 = 0;
        goto LABEL_13;
      }
    }
  }
  v5 = objc_retainAutorelease(v1);
  Class = objc_getClass((const char *)objc_msgSend(v5, "UTF8String"));
  _extensionPrincipalClass___extensionPrincipalClass = (uint64_t)Class;
  if (!Class)
  {
    _EXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __60__EXConcreteExtensionContextVendor__extensionPrincipalClass__block_invoke_cold_1();

    Class = (Class)_extensionPrincipalClass___extensionPrincipalClass;
  }
  if ((-[objc_class conformsToProtocol:](Class, "conformsToProtocol:", &unk_1EE21CA78) & 1) == 0)
  {
    _EXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
    }

  }
LABEL_13:

}

- (BOOL)_shouldCreatePrincipalObject
{
  void *v2;
  int v3;
  void *v4;
  char v5;

  +[EXConcreteExtensionContextVendor _extensionDictionary](EXConcreteExtensionContextVendor, "_extensionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_EX_BOOLForKey:defaultValue:", CFSTR("NSExtensionShouldCreatePrincipalObject"), 1);

  if (v3
    && (+[EXConcreteExtensionContextVendor _extensionMainStoryboard](EXConcreteExtensionContextVendor, "_extensionMainStoryboard"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4)&& +[EXConcreteExtensionContextVendor _extensionPrincipalClass](EXConcreteExtensionContextVendor, "_extensionPrincipalClass"))
  {
    v5 = objc_opt_respondsToSelector() ^ 1;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

+ (id)_extensionDictionary
{
  if (_extensionDictionary_onceToken != -1)
    dispatch_once(&_extensionDictionary_onceToken, &__block_literal_global_7);
  return (id)_extensionDictionary___extensionDictionary;
}

+ (Class)_extensionPrincipalClass
{
  if (_extensionPrincipalClass_onceToken != -1)
    dispatch_once(&_extensionPrincipalClass_onceToken, &__block_literal_global_13);
  return (Class)(id)_extensionPrincipalClass___extensionPrincipalClass;
}

- (void)_onGlobalStateQueueOnly_setPrincipalObject:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSMutableDictionary **p_extensionPrincipalObjects;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  _EXExtensionGetGlobalStateQueue(0);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v7)
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[EXConcreteExtensionContextVendor _onGlobalStateQueueOnly_setPrincipalObject:forUUID:].cold.2();

  }
  p_extensionPrincipalObjects = &self->__extensionPrincipalObjects;
  -[NSMutableDictionary objectForKey:](self->__extensionPrincipalObjects, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[EXConcreteExtensionContextVendor _onGlobalStateQueueOnly_setPrincipalObject:forUUID:].cold.1((id *)&self->__extensionPrincipalObjects, (uint64_t)v6, v12);

  }
  v13 = *p_extensionPrincipalObjects;
  if (!*p_extensionPrincipalObjects)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = *p_extensionPrincipalObjects;
    *p_extensionPrincipalObjects = v14;

    v13 = *p_extensionPrincipalObjects;
  }
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v7, v6);
  -[NSMutableDictionary objectForKey:](self->__extensionContexts, "objectForKey:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "internalImplementation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setPrincipalObject:", v7);

}

+ (id)_extensionMainStoryboard
{
  void *v2;
  void *v3;

  +[EXConcreteExtensionContextVendor _extensionDictionary](EXConcreteExtensionContextVendor, "_extensionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NSExtensionMainStoryboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_startListening:(BOOL)a3
{
  _QWORD block[4];
  BOOL v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EXConcreteExtensionContextVendor__startListening___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  if (_startListening__onceToken != -1)
    dispatch_once(&_startListening__onceToken, block);
}

void __61__EXConcreteExtensionContextVendor__tearDownContextWithUUID___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__EXConcreteExtensionContextVendor__tearDownContextWithUUID___block_invoke_2;
  v2[3] = &unk_1E2CFC638;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  _os_activity_initiate(&dword_190C25000, "tearing down extension context", OS_ACTIVITY_FLAG_DEFAULT, v2);

}

+ (void)_startListening
{
  objc_msgSend(a1, "_startListening:", 0);
}

+ (id)_completionConcurrentQueue
{
  if (_completionConcurrentQueue_onceToken != -1)
    dispatch_once(&_completionConcurrentQueue_onceToken, &__block_literal_global_71);
  return (id)_completionConcurrentQueue_queue;
}

void __62__EXConcreteExtensionContextVendor__completionConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.NSExtensionContest-completion-concurrent", v2);
  v1 = (void *)_completionConcurrentQueue_queue;
  _completionConcurrentQueue_queue = (uint64_t)v0;

}

+ (id)_expirationConcurrentQueue
{
  if (_expirationConcurrentQueue_onceToken != -1)
    dispatch_once(&_expirationConcurrentQueue_onceToken, &__block_literal_global_73);
  return (id)_expirationConcurrentQueue_queue;
}

void __62__EXConcreteExtensionContextVendor__expirationConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.NSExtensionContest-completion-concurrent", v2);
  v1 = (void *)_expirationConcurrentQueue_queue;
  _expirationConcurrentQueue_queue = (uint64_t)v0;

}

uint64_t __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_85(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _EXLegacyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190C25000, v2, OS_LOG_TYPE_DEFAULT, "tearing down context in extension due to interruption", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_tearDownContextWithUUID:", *(_QWORD *)(a1 + 32));
}

uint64_t __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_86(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _EXLegacyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190C25000, v2, OS_LOG_TYPE_DEFAULT, "tearing down context in extension due to invalidation", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_tearDownContextWithUUID:", *(_QWORD *)(a1 + 32));
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _EXLegacyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_87_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_89(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _EXLegacyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_190C25000, v2, OS_LOG_TYPE_DEFAULT, "in _willPerformHostCallback: block(UUID: %{public}@ error: %{public}@)", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_1EE21CA78))
    objc_msgSend(*(id *)(a1 + 40), "beginRequestWithExtensionContext:", *(_QWORD *)(a1 + 48));
  v5 = (void *)os_transaction_create();
  objc_msgSend(*(id *)(a1 + 48), "internalImplementation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setTransaction:", v5);

}

- (void)_hostDidEnterBackgroundForContextUUID:(id)a3 completion:(id)a4
{
  _NSExtensionContextEmitNotifications(self, a3, CFSTR("UIApplicationDidEnterBackgroundNotification"), (void *)*MEMORY[0x1E0CB29F0], a4);
}

- (void)_hostWillEnterForegroundForContextUUID:(id)a3 completion:(id)a4
{
  _NSExtensionContextEmitNotifications(self, a3, CFSTR("UIApplicationWillEnterForegroundNotification"), (void *)*MEMORY[0x1E0CB29F8], a4);
}

- (void)_hostWillResignActiveForContextUUID:(id)a3 completion:(id)a4
{
  _NSExtensionContextEmitNotifications(self, a3, CFSTR("UIApplicationWillResignActiveNotification"), (void *)*MEMORY[0x1E0CB2A00], a4);
}

- (void)_hostDidBecomeActiveForContextUUID:(id)a3 completion:(id)a4
{
  _NSExtensionContextEmitNotifications(self, a3, CFSTR("UIApplicationDidBecomeActiveNotification"), (void *)*MEMORY[0x1E0CB29E8], a4);
}

- (id)_extensionContextForUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->__extensionContexts, "objectForKey:", a3);
}

- (void)_addExtensionContext:(id)a3
{
  NSMutableDictionary *extensionContexts;
  void *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    extensionContexts = self->__extensionContexts;
    objc_msgSend(v7, "_UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](extensionContexts, "setObject:forKey:", v7, v5);

  }
  else
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[EXConcreteExtensionContextVendor _addExtensionContext:].cold.1((uint64_t)v7, v6);

    __break(1u);
  }
}

- (void)_removeExtensionContext:(id)a3
{
  NSMutableDictionary *extensionContexts;
  void *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    extensionContexts = self->__extensionContexts;
    objc_msgSend(v7, "_UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](extensionContexts, "removeObjectForKey:", v5);

  }
  else
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[EXConcreteExtensionContextVendor _removeExtensionContext:].cold.1((uint64_t)v7, v6);

    __break(1u);
  }
}

- (void)_setPrincipalObject:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  _EXExtensionGetGlobalStateQueue(0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__EXConcreteExtensionContextVendor__setPrincipalObject_forUUID___block_invoke;
  block[3] = &unk_1E2CFD190;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __64__EXConcreteExtensionContextVendor__setPrincipalObject_forUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onGlobalStateQueueOnly_setPrincipalObject:forUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSMutableDictionary)_extensionServiceConnections
{
  return self->__extensionServiceConnections;
}

- (void)_setExtensionServiceConnections:(id)a3
{
  objc_storeStrong((id *)&self->__extensionServiceConnections, a3);
}

- (NSMutableDictionary)_extensionContexts
{
  return self->__extensionContexts;
}

- (void)_setExtensionContexts:(id)a3
{
  objc_storeStrong((id *)&self->__extensionContexts, a3);
}

- (NSMutableDictionary)_extensionPrincipalObjects
{
  return self->__extensionPrincipalObjects;
}

- (void)_setExtensionPrincipalObjects:(id)a3
{
  objc_storeStrong((id *)&self->__extensionPrincipalObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__extensionPrincipalObjects, 0);
  objc_storeStrong((id *)&self->__extensionContexts, 0);
  objc_storeStrong((id *)&self->__extensionServiceConnections, 0);
}

void __60__EXConcreteExtensionContextVendor__extensionPrincipalClass__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_20(&dword_190C25000, v0, v1, "%s - %s:%d: Unable to find NSExtensionPrincipalClass (%@) in extension bundle! Please verify that the extension links the required frameworks and that the value for NSExtensionPrincipalClass is prefixed with '$(PRODUCT_MODULE_NAME).' if the class is implemented in Swift.", (uint8_t *)v2);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "%{public}@ Making host default XPC interface, allowed error classes: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "creating principle object: %{public}@ - with extensionContext %{public}@");
  OUTLINED_FUNCTION_6();
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_190C25000, v0, OS_LOG_TYPE_DEBUG, "view services will create object for extensionContext: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_87_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_190C25000, v0, OS_LOG_TYPE_ERROR, "error from host: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)_addExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315906;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();

  OUTLINED_FUNCTION_8_1();
}

- (void)_removeExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315906;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();

  OUTLINED_FUNCTION_8_1();
}

- (void)_onGlobalStateQueueOnly_setPrincipalObject:(NSObject *)a3 forUUID:.cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  int v7[9];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136316162;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();
  v8 = v6;
  v9 = a2;
  _os_log_fault_impl(&dword_190C25000, a3, OS_LOG_TYPE_FAULT, "%s - %s:%d: There is already a principal object (%@) for UUID (%@)", (uint8_t *)v7, 0x30u);

}

- (void)_onGlobalStateQueueOnly_setPrincipalObject:forUUID:.cold.2()
{
  os_log_t v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = "principalObject != nil";
  v3 = 2080;
  v1 = 136315650;
  OUTLINED_FUNCTION_2();
  v4 = 354;
  _os_log_fault_impl(&dword_190C25000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: principal object cannot be nil!", (uint8_t *)&v1, 0x1Cu);
}

@end
