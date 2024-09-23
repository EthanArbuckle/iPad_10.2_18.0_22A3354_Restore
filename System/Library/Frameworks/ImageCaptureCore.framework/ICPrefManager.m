@implementation ICPrefManager

+ (id)defaultAuthManager
{
  void *v2;
  void *v3;
  NSObject *v4;

  if (defaultAuthManager__sOnceToken != -1)
    dispatch_once(&defaultAuthManager__sOnceToken, &__block_literal_global);
  v2 = (void *)defaultAuthManager__sAuthManager;
  if (!defaultAuthManager__sAuthManager)
  {
    __ICOSLogCreate();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create an instance of ICPrefManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      +[ICPrefManager defaultAuthManager].cold.1((uint64_t)v3, v4);

    v2 = (void *)defaultAuthManager__sAuthManager;
  }
  return v2;
}

void __35__ICPrefManager_defaultAuthManager__block_invoke()
{
  ICPrefManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICPrefManager);
  v1 = (void *)defaultAuthManager__sAuthManager;
  defaultAuthManager__sAuthManager = (uint64_t)v0;

}

- (id)remoteAuthManager
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[ICPrefManager authConnection](self, "authConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__ICPrefManager_remoteAuthManager__block_invoke;
  v6[3] = &unk_1E70C7150;
  v6[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __34__ICPrefManager_remoteAuthManager__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = a2;
    __ICOSLogCreate();
    v4 = CFSTR("xpc error");
    if ((unint64_t)objc_msgSend(CFSTR("xpc error"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("xpc error"), "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "authConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@?"), v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v4);
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      v13 = -[__CFString UTF8String](v10, "UTF8String");
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  SEL v10;
  id v11;

  v5 = a5;
  v7 = addSelectorToInterface_selectorString_origin__onceToken;
  v8 = (NSString *)a4;
  v11 = a3;
  if (v7 != -1)
    dispatch_once(&addSelectorToInterface_selectorString_origin__onceToken, &__block_literal_global_10);
  v9 = addSelectorToInterface_selectorString_origin__incomingClasses;
  v10 = NSSelectorFromString(v8);

  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v9, v10, 0, v5);
}

void __62__ICPrefManager_addSelectorToInterface_selectorString_origin___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_msgSend(v12, "initWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = (void *)addSelectorToInterface_selectorString_origin__incomingClasses;
  addSelectorToInterface_selectorString_origin__incomingClasses = v10;

}

- (ICPrefManager)init
{
  ICPrefManager *v2;
  ICPrefManager *v3;
  NSXPCConnection *authConnection;
  NSMutableArray *v5;
  NSMutableArray *authConnectionSemaphores;
  NSObject *v7;
  _QWORD block[4];
  ICPrefManager *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICPrefManager;
  v2 = -[ICPrefManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    authConnection = v2->_authConnection;
    v2->_authConnection = 0;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    authConnectionSemaphores = v3->_authConnectionSemaphores;
    v3->_authConnectionSemaphores = v5;

    v3->_authConnectionLock._os_unfair_lock_opaque = 0;
    -[ICPrefManager openRemoteAuthenticationManager](v3, "openRemoteAuthenticationManager");
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __21__ICPrefManager_init__block_invoke;
    block[3] = &unk_1E70C7198;
    v10 = v3;
    dispatch_async(v7, block);

  }
  return v3;
}

uint64_t __21__ICPrefManager_init__block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  id v8;
  id v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v2 = CFSTR("Auth Query");
  if ((unint64_t)objc_msgSend(CFSTR("Auth Query"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("Auth Query"), "substringWithRange:", 0, 18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".."));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetching Authorization Status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    v11 = 136446466;
    v12 = -[__CFString UTF8String](v6, "UTF8String");
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1B98FC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "getContentsAuthorizationStatus");
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "getControlAuthorizationStatus");
  return objc_msgSend(*(id *)(a1 + 32), "getGoodNewsStatus");
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_authConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ICPrefManager;
  -[ICPrefManager dealloc](&v3, sel_dealloc);
}

- (id)authManagerConnection
{
  void *v3;
  void *v4;

  -[ICPrefManager authConnection](self, "authConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.icprefd-xpc"));
    -[ICPrefManager setAuthConnection:](self, "setAuthConnection:", v4);

  }
  return -[ICPrefManager authConnection](self, "authConnection");
}

- (void)startQuery:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_authConnectionLock);
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    v5 = CFSTR("Add(ONE)");
    if ((unint64_t)objc_msgSend(CFSTR("Add(ONE)"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("Add(ONE)"), "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v5);
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      v15 = -[__CFString UTF8String](v12, "UTF8String");
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1B98FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  -[NSMutableArray addObject:](self->_authConnectionSemaphores, "addObject:", v4);
  os_unfair_lock_unlock(&self->_authConnectionLock);

}

- (void)endQuery:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_authConnectionLock);
  if (v4)
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v5 = CFSTR("Rem(ONE)");
      if ((unint64_t)objc_msgSend(CFSTR("Rem(ONE)"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("Rem(ONE)"), "substringWithRange:", 0, 18);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_retainAutorelease(v5);
        v13 = v11;
        *(_DWORD *)buf = 136446466;
        v15 = -[__CFString UTF8String](v12, "UTF8String");
        v16 = 2114;
        v17 = v10;
        _os_log_impl(&dword_1B98FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    -[NSMutableArray removeObject:](self->_authConnectionSemaphores, "removeObject:", v4);
  }
  os_unfair_lock_unlock(&self->_authConnectionLock);

}

- (void)invalidateQueries
{
  os_unfair_lock_s *p_authConnectionLock;
  __CFString *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_authConnectionLock = &self->_authConnectionLock;
  os_unfair_lock_lock(&self->_authConnectionLock);
  if (-[NSMutableArray count](self->_authConnectionSemaphores, "count"))
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v4 = CFSTR("Sig(ALL)");
      if ((unint64_t)objc_msgSend(CFSTR("Sig(ALL)"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("Sig(ALL)"), "substringWithRange:", 0, 18);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_retainAutorelease(v4);
        v12 = v10;
        *(_DWORD *)buf = 136446466;
        v24 = -[__CFString UTF8String](v11, "UTF8String");
        v25 = 2114;
        v26 = v9;
        _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_authConnectionSemaphores;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((_QWORD *)&v18 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_authConnectionLock);
}

- (BOOL)openRemoteAuthenticationManager
{
  void *v3;
  void *v4;
  void *v5;
  ICPrefManager *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ICPrefManager *v13;
  ICPrefManager *v14;

  -[ICPrefManager authManagerConnection](self, "authManagerConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23FF88);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23FF88);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPrefManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v5, CFSTR("requestContentsAuthorizationStatusShouldPrompt:withReply:"), 1);
    -[ICPrefManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v5, CFSTR("requestControlAuthorizationStatusShouldPrompt:withReply:"), 1);
    -[ICPrefManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v5, CFSTR("requestGoodNewsStatusWithReply:"), 1);
    -[ICPrefManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v5, CFSTR("resetContentsAuthorizationStatusWithReply:"), 1);
    -[ICPrefManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v5, CFSTR("resetControlAuthorizationStatusWithReply:"), 1);
    objc_msgSend(v3, "setExportedInterface:", v4);
    objc_msgSend(v3, "setRemoteObjectInterface:", v5);
    objc_msgSend(v3, "setExportedObject:", self);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke;
    v12 = &unk_1E70C71C0;
    v13 = self;
    v14 = self;
    v6 = self;
    objc_msgSend(v3, "setInvalidationHandler:", &v9);
    objc_msgSend(v3, "invalidationHandler", v9, v10, v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInterruptionHandler:", v7);

    objc_msgSend(v3, "resume");
  }

  return v3 != 0;
}

void __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  double v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  _QWORD block[5];

  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke_2;
  block[3] = &unk_1E70C7198;
  v3 = *(void **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v4 = _block_invoke_onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&_block_invoke_onceToken, block);
  objc_msgSend(v5, "setAuthConnection:", 0);
  objc_msgSend(*(id *)(a1 + 40), "invalidateQueries");
  v6 = drand48();
  v7 = dispatch_time(0, (uint64_t)(v6 + 1000000000.0));
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke_61;
  v8[3] = &unk_1E70C7198;
  v8[4] = *(_QWORD *)(a1 + 40);
  dispatch_after(v7, MEMORY[0x1E0C80D38], v8);

}

void __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke_2()
{
  __CFString *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v0 = CFSTR("Auth ▼");
  if ((unint64_t)objc_msgSend(CFSTR("Auth ▼"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("Auth ▼"), "substringWithRange:", 0, 18);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingString:", CFSTR(".."));
    v0 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v0);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v10 = -[__CFString UTF8String](v7, "UTF8String");
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B98FC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

uint64_t __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke_61(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openRemoteAuthenticationManager");
}

- (id)getContentsAuthorizationStatus
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  __CFString *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = CFSTR("ICAuthorizationStatusNotDetermined");
  -[ICPrefManager authConnection](self, "authConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    -[ICPrefManager startQuery:](self, "startQuery:", v4);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__ICPrefManager_getContentsAuthorizationStatus__block_invoke;
    v13[3] = &unk_1E70C71E8;
    v15 = &v16;
    v5 = v4;
    v14 = v5;
    -[ICPrefManager requestContentsAuthorizationShouldPrompt:completion:](self, "requestContentsAuthorizationShouldPrompt:completion:", 0, v13);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v5);

  }
  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(CFSTR("🔐 ICAuth"), "length") < 0x15)
  {
    v7 = CFSTR("🔐 ICAuth");
  }
  else
  {
    objc_msgSend(CFSTR("🔐 ICAuth"), "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Contents Access: %@"), v17[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)_gICOSLog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String");
    *(_DWORD *)buf = 136446466;
    v23 = v10;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

intptr_t __47__ICPrefManager_getContentsAuthorizationStatus__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)requestContentsAuthorizationShouldPrompt:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  intptr_t (*v13)(uint64_t);
  void *v14;
  dispatch_semaphore_t v15;
  id v16;

  v4 = a3;
  v6 = a4;
  -[ICPrefManager authConnection](self, "authConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = dispatch_semaphore_create(0);
    -[ICPrefManager remoteAuthManager](self, "remoteAuthManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPrefManager startQuery:](self, "startQuery:", v8);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __69__ICPrefManager_requestContentsAuthorizationShouldPrompt_completion___block_invoke;
    v14 = &unk_1E70C7210;
    v15 = v8;
    v16 = v6;
    v10 = v8;
    objc_msgSend(v9, "requestContentsAuthorizationStatusShouldPrompt:withReply:", v4, &v11);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v10, v11, v12, v13, v14);

  }
  else
  {
    (*((void (**)(id, void *))v6 + 2))(v6, &unk_1E70D9D10);
  }

}

intptr_t __69__ICPrefManager_requestContentsAuthorizationShouldPrompt_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getControlAuthorizationStatus
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  __CFString *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = CFSTR("ICAuthorizationStatusNotDetermined");
  -[ICPrefManager authConnection](self, "authConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    -[ICPrefManager startQuery:](self, "startQuery:", v4);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__ICPrefManager_getControlAuthorizationStatus__block_invoke;
    v13[3] = &unk_1E70C71E8;
    v15 = &v16;
    v5 = v4;
    v14 = v5;
    -[ICPrefManager requestControlAuthorizationShouldPrompt:completion:](self, "requestControlAuthorizationShouldPrompt:completion:", 0, v13);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v5);

  }
  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(CFSTR("🔐 ICAuth"), "length") < 0x15)
  {
    v7 = CFSTR("🔐 ICAuth");
  }
  else
  {
    objc_msgSend(CFSTR("🔐 ICAuth"), "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Control Access:  %@"), v17[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)_gICOSLog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String");
    *(_DWORD *)buf = 136446466;
    v23 = v10;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

intptr_t __46__ICPrefManager_getControlAuthorizationStatus__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)requestControlAuthorizationShouldPrompt:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  intptr_t (*v13)(uint64_t);
  void *v14;
  dispatch_semaphore_t v15;
  id v16;

  v4 = a3;
  v6 = a4;
  -[ICPrefManager authConnection](self, "authConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = dispatch_semaphore_create(0);
    -[ICPrefManager startQuery:](self, "startQuery:", v8);
    -[ICPrefManager remoteAuthManager](self, "remoteAuthManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __68__ICPrefManager_requestControlAuthorizationShouldPrompt_completion___block_invoke;
    v14 = &unk_1E70C7210;
    v15 = v8;
    v16 = v6;
    v10 = v8;
    objc_msgSend(v9, "requestControlAuthorizationStatusShouldPrompt:withReply:", v4, &v11);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v10, v11, v12, v13, v14);

  }
  else
  {
    (*((void (**)(id, void *))v6 + 2))(v6, &unk_1E70D9D38);
  }

}

intptr_t __68__ICPrefManager_requestControlAuthorizationShouldPrompt_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)getGoodNewsStatus
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  BOOL v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ICPrefManager authConnection](self, "authConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    -[ICPrefManager startQuery:](self, "startQuery:", v4);
    -[ICPrefManager remoteAuthManager](self, "remoteAuthManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __34__ICPrefManager_getGoodNewsStatus__block_invoke;
    v15[3] = &unk_1E70C7238;
    v17 = &v18;
    v6 = v4;
    v16 = v6;
    objc_msgSend(v5, "requestGoodNewsStatusWithReply:", v15);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v6);

  }
  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(CFSTR("🔐 ICAuth"), "length") < 0x15)
  {
    v8 = CFSTR("🔐 ICAuth");
  }
  else
  {
    objc_msgSend(CFSTR("🔐 ICAuth"), "substringWithRange:", 0, 18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(".."));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (*((_BYTE *)v19 + 24))
    v9 = "Yes";
  else
    v9 = "No";
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shown Good News: %s"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)_gICOSLog;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
    *(_DWORD *)buf = 136446466;
    v23 = v12;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  v13 = *((_BYTE *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  return v13;
}

intptr_t __34__ICPrefManager_getGoodNewsStatus__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == CFSTR("ICAuthorizationStatusAuthorized");

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)resetContentsAuthorizationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  dispatch_semaphore_t v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICPrefManager authConnection](self, "authConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    -[ICPrefManager startQuery:](self, "startQuery:", v6);
    -[ICPrefManager remoteAuthManager](self, "remoteAuthManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__ICPrefManager_resetContentsAuthorizationWithCompletion___block_invoke;
    v9[3] = &unk_1E70C7210;
    v10 = v6;
    v11 = v4;
    v8 = v6;
    objc_msgSend(v7, "resetContentsAuthorizationStatusWithReply:", v9);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v8);

  }
  else
  {
    -[ICPrefManager getContentsAuthorizationStatus](self, "getContentsAuthorizationStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("ICAuthorizationStatus");
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, NSObject *))v4 + 2))(v4, v8);
  }

}

intptr_t __58__ICPrefManager_resetContentsAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)resetControlAuthorizationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  dispatch_semaphore_t v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICPrefManager authConnection](self, "authConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    -[ICPrefManager startQuery:](self, "startQuery:", v6);
    -[ICPrefManager remoteAuthManager](self, "remoteAuthManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__ICPrefManager_resetControlAuthorizationWithCompletion___block_invoke;
    v9[3] = &unk_1E70C7210;
    v10 = v6;
    v11 = v4;
    v8 = v6;
    objc_msgSend(v7, "resetControlAuthorizationStatusWithReply:", v9);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v8);

  }
  else
  {
    -[ICPrefManager getControlAuthorizationStatus](self, "getControlAuthorizationStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("ICAuthorizationStatus");
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, NSObject *))v4 + 2))(v4, v8);
  }

}

intptr_t __57__ICPrefManager_resetControlAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSXPCConnection)authConnection
{
  return self->_authConnection;
}

- (void)setAuthConnection:(id)a3
{
  objc_storeStrong((id *)&self->_authConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authConnectionSemaphores, 0);
  objc_storeStrong((id *)&self->_authConnection, 0);
}

+ (void)defaultAuthManager
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B98FC000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
