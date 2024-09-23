@implementation FPReachabilityMonitor

- (BOOL)isNetworkReachableForBundle:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FPReachabilityMonitor_isNetworkReachableForBundle___block_invoke;
  block[3] = &unk_1E444EEB8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __40__FPReachabilityMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)setReachabilityFlags:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_reachabilityFlags = v3;
  v5 = objc_msgSend((id)objc_opt_class(), "isNetworkReachableForFlags:", v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_reachabilityObservers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "reachabilityMonitor:didChangeReachabilityFlagsTo:", self, v3, (_QWORD)v12);
        objc_msgSend(v11, "reachabilityMonitor:didChangeReachabilityStatusTo:", self, v5, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

uint64_t __53__FPReachabilityMonitor_isNetworkReachableForBundle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24);
  if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"))|| (result = objc_msgSend(*(id *)(a1 + 32), "_isCellularAllowedForBR"), (result & 1) != 0)|| (v2 & 0x40000) == 0)
  {
    result = objc_msgSend((id)objc_opt_class(), "isNetworkReachableForFlags:", v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

uint64_t __37__FPReachabilityMonitor_addObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "reachabilityMonitor:didChangeReachabilityFlagsTo:", *(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24));
  return objc_msgSend(*(id *)(a1 + 40), "reachabilityMonitor:didChangeReachabilityStatusTo:", *(_QWORD *)(a1 + 32), objc_msgSend((id)objc_opt_class(), "isNetworkReachableForFlags:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24)));
}

+ (BOOL)isNetworkReachableForFlags:(unsigned int)a3
{
  _BOOL4 v3;

  if ((a3 & 2) != 0)
  {
    if ((a3 & 4) != 0 && ((a3 & 0x28) == 0 || (a3 & 0x10) != 0))
      return (a3 >> 18) & 1;
    else
      LOBYTE(v3) = 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isCellularAllowedForBR
{
  NSNumber *isCellularEnabledForDocumentsAndData;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSNumber *v14;
  NSNumber *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t section;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  isCellularEnabledForDocumentsAndData = self->_isCellularEnabledForDocumentsAndData;
  if (!isCellularEnabledForDocumentsAndData)
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[FPReachabilityMonitor _isCellularAllowedForBR].cold.2((uint64_t)&section, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_primaryAppleAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "aa_useCellularForDataclass:", *MEMORY[0x1E0C8F430]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v15 = self->_isCellularEnabledForDocumentsAndData;
    self->_isCellularEnabledForDocumentsAndData = v14;

    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[FPReachabilityMonitor _isCellularAllowedForBR].cold.1(v13, v16, v17, v18, v19, v20, v21, v22);

    __fp_leave_section_Debug((uint64_t)&section);
    isCellularEnabledForDocumentsAndData = self->_isCellularEnabledForDocumentsAndData;
  }
  return -[NSNumber BOOLValue](isCellularEnabledForDocumentsAndData, "BOOLValue");
}

+ (id)sharedReachabilityMonitor
{
  if (sharedReachabilityMonitor_onceToken != -1)
    dispatch_once(&sharedReachabilityMonitor_onceToken, &__block_literal_global_55);
  return (id)sharedReachabilityMonitor_monitor;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__FPReachabilityMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E4449A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FPReachabilityMonitor_removeObserver___block_invoke;
  block[3] = &unk_1E4449A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __29__FPReachabilityMonitor_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isCellularAllowedForBR");
}

void __43__FPReachabilityMonitor__notifAccountStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_notifAccountStore_notifAccountStore;
  _notifAccountStore_notifAccountStore = v0;

}

void __50__FPReachabilityMonitor_sharedReachabilityMonitor__block_invoke()
{
  FPReachabilityMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(FPReachabilityMonitor);
  v1 = (void *)sharedReachabilityMonitor_monitor;
  sharedReachabilityMonitor_monitor = (uint64_t)v0;

}

- (FPReachabilityMonitor)init
{
  FPReachabilityMonitor *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  const __SCNetworkReachability *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  SCNetworkReachabilityContext context;
  objc_super v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)FPReachabilityMonitor;
  v3 = -[FPReachabilityMonitor init](&v27, sel_init);
  v4 = (uint64_t)v3;
  if (v3)
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = v3;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.reachability", v7);
    v9 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v8;

    *(_DWORD *)(v4 + 24) = objc_msgSend((id)objc_opt_class(), "getReachabilityFlagsByCheckingNetwork");
    v10 = SCNetworkReachabilityCreateWithName(0, "apple.com");
    *(_QWORD *)(v4 + 16) = v10;
    if (!v10
      || !SCNetworkReachabilitySetCallback(v10, (SCNetworkReachabilityCallBack)fp_reachability_callback, &context)
      || !SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(v4 + 16), *(dispatch_queue_t *)(v4 + 32)))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("FPReachabilityMonitor.m"), 147, CFSTR("UNREACHABLE: unable to hook into the reachability subsystem"));

    }
    objc_msgSend((id)objc_opt_class(), "_notifAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, (id)v4);
    v28 = 0;
    if (!AppleAccountLibraryCore_frameworkLibrary)
    {
      v29 = xmmword_1E444F9A8;
      v30 = 0;
      AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (AppleAccountLibraryCore_frameworkLibrary)
    {
      v13 = v28;
      if (!v28)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __29__FPReachabilityMonitor_init__block_invoke;
        v23[3] = &unk_1E444F988;
        objc_copyWeak(&v24, &location);
        objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C8F1C0], v12, v15, v23);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(v4 + 40);
        *(_QWORD *)(v4 + 40) = v17;

        v19 = *(NSObject **)(v4 + 32);
        block[0] = v16;
        block[1] = 3221225472;
        block[2] = __29__FPReachabilityMonitor_init__block_invoke_2;
        block[3] = &unk_1E444A308;
        v22 = (id)v4;
        dispatch_async(v19, block);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);

        return (FPReachabilityMonitor *)v4;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleAccountLibrary(void)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v4, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("FPReachabilityMonitor.m"), 17, CFSTR("%s"), v28);

      __break(1u);
    }
    free(v13);
    goto LABEL_10;
  }
  return (FPReachabilityMonitor *)v4;
}

+ (unsigned)getReachabilityFlagsByCheckingNetwork
{
  const __SCNetworkReachability *v2;
  const __SCNetworkReachability *v3;
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  flags = 0;
  *(_QWORD *)&address.sa_data[6] = 0;
  *(_QWORD *)&address.sa_len = 528;
  v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &address);
  if (v2)
  {
    v3 = v2;
    if (!SCNetworkReachabilityGetFlags(v2, &flags))
      flags = 0;
    CFRelease(v3);
    LODWORD(v2) = flags;
  }
  return v2;
}

+ (id)_notifAccountStore
{
  if (_notifAccountStore_onceToken != -1)
    dispatch_once(&_notifAccountStore_onceToken, &__block_literal_global_15);
  return (id)_notifAccountStore_notifAccountStore;
}

void __29__FPReachabilityMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accountDidChange");

}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_reachabilityRef);
  v3.receiver = self;
  v3.super_class = (Class)FPReachabilityMonitor;
  -[FPReachabilityMonitor dealloc](&v3, sel_dealloc);
}

- (void)_accountDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FPReachabilityMonitor__accountDidChange__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__FPReachabilityMonitor__accountDidChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t section;

  section = __fp_create_section();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__FPReachabilityMonitor__accountDidChange__block_invoke_cold_2((uint64_t)&section, v2, v3, v4, v5, v6, v7, v8);

  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __42__FPReachabilityMonitor__accountDidChange__block_invoke_cold_1(v9);

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = 0;

  __fp_leave_section_Debug((uint64_t)&section);
}

- (void)invalidate
{
  CFRelease(self->_reachabilityRef);
}

- (unsigned)reachabilityFlags
{
  return self->_reachabilityFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isCellularEnabledForDocumentsAndData, 0);
  objc_storeStrong((id *)&self->_accountDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reachabilityObservers, 0);
}

void __42__FPReachabilityMonitor__accountDidChange__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] forcing refresh of cellular switch", v1, 2u);
}

void __42__FPReachabilityMonitor__accountDidChange__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] ┏%llx account properties changed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_isCellularAllowedForBR
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] ┏%llx checking if cellular is enabled for D&D", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
