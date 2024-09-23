@implementation _LSDService

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return _LSDServiceReplaceObject((objc_object *)a5);
}

+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return _LSDServiceReplaceObject((objc_object *)a5);
}

- (void)connectionWasInvalidated:(id)a3
{
  os_unfair_lock_s *p_clientMapMutex;

  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  -[NSMapTable removeObjectForKey:](self->_clientMap, "removeObjectForKey:", a3);
  os_unfair_lock_unlock(p_clientMapMutex);
}

+ (id)synchronousXPCProxyWithErrorHandler:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_self();
  +[_LSDServiceDomain defaultServiceDomain]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCProxyForServiceClass(v3, (uint64_t)v4, 1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  NSObject *v10;

  v5 = a5;
  -[_LSDService clientForConnection:](self, "clientForConnection:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _LSDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[_LSDService connection:handleInvocation:isReply:].cold.1((uint64_t)a3, (uint64_t)self, v10);

  }
  objc_msgSend(v9, "handleXPCInvocation:isReply:", a4, v5);

}

- (id)clientForConnection:(id)a3
{
  os_unfair_lock_s *p_clientMapMutex;
  void *v6;

  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  -[NSMapTable objectForKey:](self->_clientMap, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_clientMapMutex);
  return v6;
}

+ (BOOL)XPCConnectionIsAlwaysPrivileged
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  objc_class *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id from;
  id location;

  v6 = (objc_class *)objc_msgSend((id)objc_opt_class(), "clientClass");
  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && ((v8 = -[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()), v7) ? (v9 = v8) : (v9 = 0),
        v9 == 1))
  {
    objc_msgSend((id)objc_opt_class(), "dispatchQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend([v6 alloc], "initWithXPCConnection:queue:", a4, v10);
    v12 = v11 != 0;
    if (v11)
    {
      objc_msgSend(a4, "setExportedInterface:", v7);
      objc_msgSend(a4, "setExportedObject:", v11);
      objc_msgSend(a4, "setDelegate:", self);
      objc_initWeak(&location, a4);
      objc_initWeak(&from, self);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __50___LSDService_listener_shouldAcceptNewConnection___block_invoke;
      v17 = &unk_1E1043C78;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(&v19, &location);
      objc_msgSend(a4, "setInvalidationHandler:", &v14);
      -[_LSDService clientBorn:forNewConnection:](self, "clientBorn:forNewConnection:", v11, a4, v14, v15, v16, v17);
      objc_msgSend(a4, "resume");
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)clientBorn:(id)a3 forNewConnection:(id)a4
{
  os_unfair_lock_s *p_clientMapMutex;

  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  -[NSMapTable setObject:forKey:](self->_clientMap, "setObject:forKey:", a3, a4);
  os_unfair_lock_unlock(p_clientMapMutex);
}

+ (id)dispatchQueue
{
  return 0;
}

+ (id)XPCProxyWithErrorHandler:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_self();
  +[_LSDServiceDomain defaultServiceDomain]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCProxyForServiceClass(v3, (uint64_t)v4, 0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)XPCConnectionToService
{
  void *v3;
  void *v4;
  NSObject *v5;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDServiceGetXPCConnection(a1, (uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _LSDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[_LSDService XPCConnectionToService].cold.1(v5);

    v4 = 0;
  }
  return v4;
}

- (_LSDService)initWithXPCListener:(id)a3
{
  _LSDService *v4;
  _LSDService *v5;
  uint64_t v6;
  NSMapTable *clientMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LSDService;
  v4 = -[_LSDService init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_listener, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    clientMap = v5->_clientMap;
    v5->_clientMap = (NSMapTable *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMap, 0);
  objc_destroyWeak((id *)&self->_listener);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  return self;
}

+ (unsigned)connectionType
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unimplemented method %s"), "+[_LSDService(SubclassesShouldOverride) connectionType]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

+ (Class)clientClass
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unimplemented method %s"), "+[_LSDService(SubclassesShouldOverride) clientClass]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

+ (id)XPCInterface
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unimplemented method %s"), "+[_LSDService(SubclassesShouldOverride) XPCInterface]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

+ (BOOL)isEnabled
{
  return objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer") ^ 1;
}

+ (void)XPCConnectionToService
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "Process is directly invoking +XPCConnectionToService. This method is unsupported.", v1, 2u);
}

- (void)connection:(uint64_t)a1 handleInvocation:(uint64_t)a2 isReply:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_2_3(&dword_182882000, a3, (uint64_t)a3, "client was unexpectedly nil for connection %@ for %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
