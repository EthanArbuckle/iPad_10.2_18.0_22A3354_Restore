@implementation CacheDeleteListener

void __58__CacheDeleteListener_listener_shouldAcceptNewConnection___block_invoke_4()
{
  NSObject *v0;
  uint8_t v1[16];

  CDGetLogHandle((uint64_t)"client");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1A3662000, v0, OS_LOG_TYPE_DEBUG, "newConnection invalidated", v1, 2u);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char IsEntitled;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CDGetLogHandle((uint64_t)"client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412290;
    v21 = v6;
    _os_log_debug_impl(&dword_1A3662000, v8, OS_LOG_TYPE_DEBUG, "listener: %@", (uint8_t *)&v20, 0xCu);
  }

  -[CacheDeleteListener requiredEntitlements](self, "requiredEntitlements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {

    goto LABEL_9;
  }
  -[CacheDeleteListener requiredEntitlements](self, "requiredEntitlements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IsEntitled = connectionIsEntitled(v7, v11);

  if ((IsEntitled & 1) != 0)
  {
LABEL_9:
    v15 = (void *)MEMORY[0x1E0CB3B50];
    -[CacheDeleteListener protocol](self, "protocol");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interfaceWithProtocol:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v17);

    -[CacheDeleteListener xObj](self, "xObj");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedObject:", v18);

    objc_msgSend(v7, "setInterruptionHandler:", &__block_literal_global_6);
    objc_msgSend(v7, "setInvalidationHandler:", &__block_literal_global_5);
    objc_msgSend(v7, "resume");
    v14 = 1;
    goto LABEL_10;
  }
  CDGetLogHandle((uint64_t)"client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20) = 0;
    _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "Connection is not entitled!", (uint8_t *)&v20, 2u);
  }

  v14 = 0;
LABEL_10:

  return v14;
}

- (NSMutableSet)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (id)xObj
{
  return self->_xObj;
}

- (void)setIsResumed:(BOOL)a3
{
  self->_isResumed = a3;
}

- (void)resume
{
  void *v3;

  if (!-[CacheDeleteListener isResumed](self, "isResumed"))
  {
    -[CacheDeleteListener listener](self, "listener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resume");

    -[CacheDeleteListener setIsResumed:](self, "setIsResumed:", 1);
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (BOOL)isResumed
{
  return self->_isResumed;
}

- (CacheDeleteListener)initWithName:(id)a3 listener:(id)a4 protocol:(id)a5 exportedObj:(id)a6 isExtension:(BOOL)a7
{
  id v13;
  NSXPCListener *v14;
  id v15;
  id v16;
  CacheDeleteListener *v17;
  CacheDeleteListener *v18;
  uint64_t v19;
  NSMutableSet *requiredEntitlements;
  NSXPCListener *listener;
  NSObject *v22;
  CacheDeleteListener *v23;
  uint8_t v25[16];
  objc_super v26;

  v13 = a3;
  v14 = (NSXPCListener *)a4;
  v15 = a5;
  v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CacheDeleteListener;
  v17 = -[CacheDeleteListener init](&v26, sel_init);
  if (v17)
  {
    v18 = v17;
    objc_storeStrong((id *)&v17->_protocol, a5);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    requiredEntitlements = v18->_requiredEntitlements;
    v18->_requiredEntitlements = (NSMutableSet *)v19;

    objc_storeStrong((id *)&v18->_serviceName, a3);
    if (v14
      || a7
      || (v14 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v13)) != 0)
    {
      objc_storeStrong(&v18->_xObj, a6);
      -[NSXPCListener setDelegate:](v14, "setDelegate:", v18);
      listener = v18->_listener;
      v18->_listener = v14;
      v22 = v14;

      v18 = v18;
      v23 = v18;
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v25 = 0;
        _os_log_error_impl(&dword_1A3662000, v22, OS_LOG_TYPE_ERROR, "failed to create listener!", v25, 2u);
      }
      v23 = 0;
    }
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1A3662000, v22, OS_LOG_TYPE_ERROR, "super init failed", v25, 2u);
    }
    v23 = 0;
    v18 = (CacheDeleteListener *)v14;
  }

  return v23;
}

- (void)addRequiredEntitlement:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *requiredEntitlements;
  int v7;
  NSMutableSet *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableSet addObject:](self->_requiredEntitlements, "addObject:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NSMutableSet addObjectsFromArray:](self->_requiredEntitlements, "addObjectsFromArray:", v4);
  }
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    requiredEntitlements = self->_requiredEntitlements;
    v7 = 138412290;
    v8 = requiredEntitlements;
    _os_log_debug_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEBUG, "entitlements: %@", (uint8_t *)&v7, 0xCu);
  }

}

void __58__CacheDeleteListener_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  CDGetLogHandle((uint64_t)"client");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1A3662000, v0, OS_LOG_TYPE_DEBUG, "Client connection interrupted.", v1, 2u);
  }

}

- (void)suspend
{
  void *v3;

  if (-[CacheDeleteListener isResumed](self, "isResumed"))
  {
    -[CacheDeleteListener listener](self, "listener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suspend");

    -[CacheDeleteListener setIsResumed:](self, "setIsResumed:", 0);
  }
}

- (void)setXObj:(id)a3
{
  objc_storeStrong(&self->_xObj, a3);
}

- (void)setRequiredEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_requiredEntitlements, a3);
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_requiredEntitlements, 0);
  objc_storeStrong(&self->_xObj, 0);
}

@end
