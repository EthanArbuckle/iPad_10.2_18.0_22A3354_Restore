@implementation NFXPCServiceClient

- (NSXPCConnection)connection
{
  NFXPCServiceClient *v3;
  NSXPCConnection *xpcConnection;
  uint64_t v5;
  NSXPCConnection *v6;
  void *v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSXPCConnection *v20;
  const char *Name;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id buf;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  xpcConnection = v3->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v3->_serviceName, 4096);
    v6 = v3->_xpcConnection;
    v3->_xpcConnection = (NSXPCConnection *)v5;

    -[NFXPCServiceClient connection](v3, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (const void **)MEMORY[0x1E0DE7900];
    if (!v7)
    {
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v3);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v3);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v10(3, "%c[%{public}s %{public}s]:%i Failed to connect to NFCD", v14, ClassName, Name, 74);
      }
      dispatch_get_specific(*v8);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(v3);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v17;
        v28 = 2082;
        v29 = object_getClassName(v3);
        v30 = 2082;
        v31 = sel_getName(a2);
        v32 = 1024;
        v33 = 74;
        _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect to NFCD", (uint8_t *)&buf, 0x22u);
      }

    }
    -[NSXPCConnection setRemoteObjectInterface:](v3->_xpcConnection, "setRemoteObjectInterface:", v3->_remoteObjectInterface);
    -[NSXPCConnection setExportedInterface:](v3->_xpcConnection, "setExportedInterface:", v3->_exportedInterface);
    -[NSXPCConnection setExportedObject:](v3->_xpcConnection, "setExportedObject:", v3->_exportedObject);
    objc_initWeak(&buf, v3);
    v18 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __32__NFXPCServiceClient_connection__block_invoke;
    v25[3] = &unk_1E3B52400;
    objc_copyWeak(&v26, &buf);
    -[NSXPCConnection setInvalidationHandler:](v3->_xpcConnection, "setInvalidationHandler:", v25);
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __32__NFXPCServiceClient_connection__block_invoke_3;
    v23[3] = &unk_1E3B52400;
    objc_copyWeak(&v24, &buf);
    -[NSXPCConnection setInterruptionHandler:](v3->_xpcConnection, "setInterruptionHandler:", v23);
    if (v3->_xpcQueue)
      -[NSXPCConnection _setQueue:](v3->_xpcConnection, "_setQueue:");
    -[NSXPCConnection _queue](v3->_xpcConnection, "_queue");
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_set_specific(v19, *v8, 0, 0);

    -[NSXPCConnection resume](v3->_xpcConnection, "resume");
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&buf);
    xpcConnection = v3->_xpcConnection;
  }
  v20 = xpcConnection;
  objc_sync_exit(v3);

  return v20;
}

- (NFXPCServiceClient)initWithService:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6 xpcDispatchQueue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NFXPCServiceClient *v17;
  uint64_t v18;
  NSHashTable *delegates;
  NFXPCServiceClient *v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)NFXPCServiceClient;
  v17 = -[NFXPCServiceClient init](&v23, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    delegates = v17->_delegates;
    v17->_delegates = (NSHashTable *)v18;

    objc_storeStrong((id *)&v17->_serviceName, a3);
    objc_storeStrong((id *)&v17->_xpcQueue, a7);
    objc_storeStrong((id *)&v17->_remoteObjectInterface, a4);
    objc_storeStrong((id *)&v17->_exportedInterface, a5);
    objc_storeStrong(&v17->_exportedObject, a6);
    v20 = v17;
  }

  return v17;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NFXPCServiceClient *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  -[NSHashTable addObject:](obj->_delegates, "addObject:", v4);

  obj->_clientCount = -[NSHashTable count](obj->_delegates, "count");
  objc_sync_exit(obj);

}

- (NFXPCServiceClient)initWithService:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6
{
  return -[NFXPCServiceClient initWithService:remoteObjectInterface:exportedInterface:exportedObject:xpcDispatchQueue:](self, "initWithService:remoteObjectInterface:exportedInterface:exportedObject:xpcDispatchQueue:", a3, a4, a5, a6, 0);
}

void __32__NFXPCServiceClient_connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_19B5EB000, "XPC service client invalidated", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NFXPCServiceClient_connection__block_invoke_2;
  block[3] = &unk_1E3B52400;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __32__NFXPCServiceClient_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    v4 = (void *)objc_msgSend(v3[2], "copy");
    v5 = v3[1];
    v3[1] = 0;

    objc_sync_exit(v3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "didInvalidate", (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

void __32__NFXPCServiceClient_connection__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_19B5EB000, "XPC service client interrupted", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NFXPCServiceClient_connection__block_invoke_4;
  block[3] = &unk_1E3B52400;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __32__NFXPCServiceClient_connection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    v4 = (void *)objc_msgSend(v3[2], "copy");
    v5 = v3[1];
    objc_sync_exit(v3);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "didInterrupt:", v5, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)removeDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *xpcConnection;
  NFXPCServiceClient *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  -[NSHashTable removeObject:](obj->_delegates, "removeObject:", v4);

  v5 = -[NSHashTable count](obj->_delegates, "count");
  obj->_clientCount = v5;
  if (!v5)
  {
    -[NSXPCConnection invalidate](obj->_xpcConnection, "invalidate");
    xpcConnection = obj->_xpcConnection;
    obj->_xpcConnection = 0;

  }
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
