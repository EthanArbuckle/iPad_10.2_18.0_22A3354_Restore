@implementation NFWalletPresentation

- (NFWalletPresentation)init
{
  NFWalletPresentation *v2;
  NFWalletPresentation *v3;
  NFWalletPresentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFWalletPresentation;
  v2 = -[NFWalletPresentation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_xpcClientLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NFXPCServiceClient removeDelegate:](self->_xpcClient, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)NFWalletPresentation;
  -[NFWalletPresentation dealloc](&v3, sel_dealloc);
}

void __33__NFWalletPresentation_xpcClient__block_invoke(uint64_t a1)
{
  NFXPCServiceClient *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40DE78);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = -[NFXPCServiceClient initWithService:remoteObjectInterface:exportedInterface:exportedObject:]([NFXPCServiceClient alloc], "initWithService:remoteObjectInterface:exportedInterface:exportedObject:", CFSTR("com.apple.nfcd.wallet.presentation"), v5, 0, 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addDelegate:");
  }
}

- (void)invalidateXPCClient
{
  os_unfair_lock_s *v2;
  void *v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 8), "removeDelegate:", a1);
    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (void)didInterrupt:(id)a3
{
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(4, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 68);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    *(_DWORD *)buf = 67109890;
    v17 = v14;
    v18 = 2082;
    v19 = object_getClassName(self);
    v20 = 2082;
    v21 = sel_getName(a2);
    v22 = 1024;
    v23 = 68;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

}

- (void)didInvalidate
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  NFXPCServiceClient *xpcClient;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(4, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 72);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    *(_DWORD *)buf = 67109890;
    v17 = v13;
    v18 = 2082;
    v19 = object_getClassName(self);
    v20 = 2082;
    v21 = sel_getName(a2);
    v22 = 1024;
    v23 = 72;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  os_unfair_lock_lock(&self->_xpcClientLock);
  xpcClient = self->_xpcClient;
  self->_xpcClient = 0;

  os_unfair_lock_unlock(&self->_xpcClientLock);
}

- (void)present
{
  uint64_t v4;
  NFXPCServiceClient *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[6];
  uint8_t buf[8];
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  NFWalletPresentation *v15;

  v4 = MEMORY[0x1E0C809B0];
  if (self)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __33__NFWalletPresentation_xpcClient__block_invoke;
    v14 = &unk_1E3B51A60;
    v15 = self;
    os_unfair_lock_lock(&self->_xpcClientLock);
    __33__NFWalletPresentation_xpcClient__block_invoke((uint64_t)buf);
    os_unfair_lock_unlock(&self->_xpcClientLock);
    v5 = self->_xpcClient;
  }
  else
  {
    v5 = 0;
  }
  if (self->_xpcClient)
  {
    -[NFXPCServiceClient connection](v5, "connection");
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __31__NFWalletPresentation_present__block_invoke;
    v10[3] = &unk_1E3B51410;
    v10[4] = self;
    v10[5] = a2;
    -[NSObject synchronousRemoteObjectProxyWithErrorHandler:](v6, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NFSharedSignpostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B5EB000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[NFWalletPresentation present]", (const char *)&unk_19B692E4A, buf, 2u);
    }

    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __31__NFWalletPresentation_present__block_invoke_10;
    v9[3] = &unk_1E3B51A60;
    v9[4] = self;
    objc_msgSend(v7, "presentWithCompletion:", v9);

  }
  else
  {
    NFSharedLogGetLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19B5EB000, v6, OS_LOG_TYPE_FAULT, "Unable to acquire XPC service", buf, 2u);
    }
  }

}

void __31__NFWalletPresentation_present__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 92, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 92;
    v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

  -[NFWalletPresentation invalidateXPCClient](*(_QWORD *)(a1 + 32));
}

void __31__NFWalletPresentation_present__block_invoke_10(uint64_t a1)
{
  -[NFWalletPresentation invalidateXPCClient](*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

@end
