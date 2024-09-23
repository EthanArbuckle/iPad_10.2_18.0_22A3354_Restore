@implementation NEProviderServer

- (void)generateProviderEndpointInfoInMessage:(id)a3 extensionPoint:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  NSMutableArray *listeners;
  NSObject *v11;
  uint64_t v12;
  NEProviderXPCListener *v13;
  NEProviderServer *v14;
  NEProviderServer *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  xpc_object_t xdict;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  NSObject *v25;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  xdict = a3;
  v6 = a4;
  v7 = v6;
  if (!self)
    goto LABEL_20;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.networkextension.filter-data")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.networkextension.app-proxy"), xdict) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.networkextension.packet-tunnel")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.networkextension.dns-proxy")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.networkextension.filter-packet")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.networkextension.app-push")) & 1) != 0)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSMutableArray count](self->_listeners, "count"))
      goto LABEL_10;
    listeners = self->_listeners;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __49__NEProviderServer_getListenerForExtensionPoint___block_invoke;
    v24 = &unk_1E3CC4058;
    v11 = v9;
    v25 = v11;
    v12 = -[NSMutableArray indexOfObjectPassingTest:](listeners, "indexOfObjectPassingTest:", &v21);

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_listeners, "objectAtIndexedSubscript:", v12);
      self = (NEProviderServer *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_10:
      v13 = [NEProviderXPCListener alloc];
      v11 = v9;
      if (v13
        && (v26.receiver = v13,
            v26.super_class = (Class)NEProviderXPCListener,
            (v14 = -[NEProviderServer initWithServiceName:](&v26, sel_initWithServiceName_, &stru_1E3CC53C8)) != 0))
      {
        v15 = v14;
        objc_storeStrong((id *)&v14[2]._listeners, v9);

        -[NEProviderServer setDelegate:](v15, "setDelegate:", self);
        -[NEProviderServer resume](v15, "resume");
        v16 = self->_listeners;
        if (!v16)
        {
          v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v18 = self->_listeners;
          self->_listeners = v17;

          v16 = self->_listeners;
        }
        -[NSMutableArray addObject:](v16, "addObject:", v15, xdict, v21, v22, v23, v24);
        self = v15;
      }
      else
      {

        self = 0;
      }

    }
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v26.receiver) = 138412290;
      *(id *)((char *)&v26.receiver + 4) = v7;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Failed to create a listener, extension point is not supported: %@", (uint8_t *)&v26, 0xCu);
    }
    self = 0;
  }

  if (self)
  {
    -[NEProviderServer endpoint](self, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_endpoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(xdict, "listener-endpoint", v19);

LABEL_20:
  }

}

- (NEExtensionProviderContext)firstContext
{
  NEProviderServer *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableArray firstObject](v2->_contexts, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NEExtensionProviderContext *)v3;
}

- (void)start
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __25__NEProviderServer_start__block_invoke;
  handler[3] = &unk_1E3CC4080;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.networkextension.provider.matching", MEMORY[0x1E0C80D38], handler);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  NSString *v9;
  objc_class *v10;
  id v11;
  id v12;
  NEProviderServer *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NEProviderServer *v17;
  NSMutableArray *contexts;
  NSMutableArray *v19;
  NSMutableArray *v20;
  BOOL v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v28;
  objc_super v29;
  __int128 buf;
  void (*v31)(uint64_t);
  void *v32;
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      v22 = "Got a non-provider listener";
      v23 = v16;
      v24 = 2;
LABEL_16:
      _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&buf, v24);
    }
LABEL_19:
    v21 = 0;
    goto LABEL_20;
  }
  if (v8)
    v9 = (NSString *)v8[7];
  else
    v9 = 0;
  v10 = NSClassFromString(v9);
  if (!v10)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (v8)
        v25 = v8[7];
      else
        v25 = 0;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v25;
      v22 = "Failed to create a Class from %@";
      v23 = v16;
      v24 = 12;
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  v11 = [v10 alloc];
  v12 = v7;
  if (!v11
    || (v29.receiver = v11,
        v29.super_class = (Class)NEExtensionProviderContext,
        (v13 = -[NEProviderServer init](&v29, sel_init)) == 0))
  {

    ne_log_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (v8)
        v28 = v8[7];
      else
        v28 = 0;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v28;
      _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, "Failed to instantiate a %@ object", (uint8_t *)&buf, 0xCu);
    }

    v16 = 0;
    goto LABEL_19;
  }
  objc_msgSend((id)objc_opt_class(), "_extensionAuxiliaryHostProtocol");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteObjectInterface:", v14);

  objc_msgSend((id)objc_opt_class(), "_extensionAuxiliaryVendorProtocol");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExportedInterface:", v15);

  objc_msgSend(v12, "setExportedObject:", v13);
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v31 = __49__NEExtensionProviderContext_initWithConnection___block_invoke;
  v32 = &unk_1E3CC41F0;
  v16 = v13;
  v33 = v16;
  objc_msgSend(v12, "setInvalidationHandler:", &buf);
  objc_msgSend(v12, "resume");
  objc_storeStrong((id *)&v16[8].isa, a4);

  v17 = self;
  objc_sync_enter(v17);
  contexts = v17->_contexts;
  if (!contexts)
  {
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = v17->_contexts;
    v17->_contexts = v19;

    contexts = v17->_contexts;
  }
  -[NSMutableArray addObject:](contexts, "addObject:", v16);
  objc_sync_exit(v17);

  v21 = 1;
LABEL_20:

  return v21;
}

- (void)removeProviderContext:(id)a3
{
  NEProviderServer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_contexts, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

void __25__NEProviderServer_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  const char *v5;
  xpc_object_t reply;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  string = xpc_dictionary_get_string(v3, "extension-point");
  if (string && (v5 = string, *string))
  {
    reply = xpc_dictionary_create_reply(v3);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateProviderEndpointInfoInMessage:extensionPoint:", reply, v8);

    xpc_dictionary_send_reply();
  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "com.apple.networkextension.provider.matching";
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Received a %s event without an extension point", (uint8_t *)&v10, 0xCu);
    }

  }
}

uint64_t __49__NEProviderServer_getListenerForExtensionPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
    v2 = *(void **)(a2 + 56);
  else
    v2 = 0;
  return objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

+ (NEProviderServer)sharedServer
{
  if (sharedServer_onceToken != -1)
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_23190);
  return (NEProviderServer *)(id)sharedServer_g_server;
}

void __32__NEProviderServer_sharedServer__block_invoke()
{
  NEProviderServer *v0;
  void *v1;

  v0 = objc_alloc_init(NEProviderServer);
  v1 = (void *)sharedServer_g_server;
  sharedServer_g_server = (uint64_t)v0;

}

@end
