@implementation NEExtensionTunnelProviderContext

- (void)didSetReasserting:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  NEExtensionTunnelProviderContext *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "%@: reasserting set to %d", (uint8_t *)&v8, 0x12u);
  }

  -[NEExtensionProviderContext hostContext](self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSetReasserting:", v3);

}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  int is_debug_logging_enabled;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  void *v13;
  int v14;
  NEExtensionTunnelProviderContext *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  ne_log_large_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (is_debug_logging_enabled)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "descriptionWithIndent:options:", 0, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEFAULT, "%@: provider set tunnel configuration to %@", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    _os_log_debug_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEBUG, "%@: provider set tunnel configuration to %@", (uint8_t *)&v14, 0x16u);
  }

  -[NEExtensionProviderContext hostContext](self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTunnelConfiguration:completionHandler:", v6, v7);

}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  id v6;
  _BYTE *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  NEExtensionTunnelProviderContext *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NEExtensionTunnelProviderContext;
  -[NEExtensionProviderContext setConfiguration:extensionIdentifier:](&v26, sel_setConfiguration_extensionIdentifier_, v6, a4);
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v28 = self;
    v18 = "%@: no provider found";
LABEL_19:
    _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v28 = self;
    v18 = "%@: not setting configuration because provider is not an NETunnelProvider";
    goto LABEL_19;
  }
  objc_msgSend(v6, "alwaysOnVPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "alwaysOnVPN");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activeInterfaceProtocolKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_INFO, "%@: AlwaysOn VPN configuration: activeInterfaceProtocolKey %@", buf, 0x16u);

    }
    objc_msgSend(v6, "alwaysOnVPN");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "interfaceProtocolMapping");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alwaysOnVPN");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activeInterfaceProtocolKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProtocolConfiguration:", v16);

    v7[42] = 1;
  }
  else
  {
    objc_msgSend(v6, "VPN");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || (objc_msgSend(v6, "appVPN"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7[41] = objc_msgSend(v19, "isOnDemandEnabled");
      objc_msgSend(v19, "protocol");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProtocolConfiguration:", v20);

      objc_msgSend(v6, "appVPN");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v6, "appVPN");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appRules");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAppRules:", v23);

      }
      objc_msgSend(v19, "protocol");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "type");

    }
  }
  objc_msgSend(v7, "protocolConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      v18 = "%@: configuration has no VPN configuration";
      goto LABEL_19;
    }
LABEL_20:

  }
}

- (void)handleIPCDetached
{
  NEExtensionTunnelProviderContext *v2;
  const char *v3;
  id Property;
  id v5;
  const char *v6;
  SEL v7;
  const char *v8;
  NSObject *v9;
  SEL v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  NEExtensionTunnelProviderContext *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 88, 1);
  else
    Property = 0;
  v5 = Property;
  -[NEIPC stop](v5);

  if (v2)
  {
    objc_setProperty_atomic(v2, v6, 0, 88);
    if (objc_getProperty(v2, v7, 96, 1))
    {
      v9 = objc_getProperty(v2, v8, 96, 1);
      dispatch_source_cancel(v9);
      objc_setProperty_atomic(v2, v10, 0, 96);
    }
  }
  ne_log_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v2;
    _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, "%@: IPC detached", (uint8_t *)&v14, 0xCu);
  }

  -[NEExtensionProviderContext hostContext](v2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleIPCDetached");

  objc_sync_exit(v2);
}

- (void)establishIPCWithCompletionHandler:(id)a3
{
  const char *v4;
  void (**v5)(id, _QWORD);
  const char *v6;
  id Property;
  const char *v8;
  id v9;
  SEL v10;
  id v11;
  NSObject *v12;
  id v13;
  SEL v14;
  NEIPC *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t *v19;
  NEIPC *v20;
  SEL v21;
  void *v22;
  xpc_connection_t v23;
  SEL v24;
  SEL v25;
  _xpc_connection_s *v26;
  id v27;
  SEL v28;
  _xpc_connection_s *v29;
  SEL v30;
  _xpc_connection_s *v31;
  xpc_endpoint_t v32;
  const char *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, int, uint64_t, void *, void *);
  void *v39;
  id v40;
  id location;
  __int128 handler;
  void (*v43)(uint64_t, void *);
  void *v44;
  NEIPC *v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  if (self && objc_getProperty(self, v4, 88, 1))
  {
    Property = objc_getProperty(self, v6, 88, 1);
    if (Property
      && (v9 = Property,
          objc_sync_enter(v9),
          v11 = objc_getProperty(v9, v10, 16, 1),
          objc_sync_exit(v9),
          v9,
          v11))
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(handler) = 138412290;
        *(_QWORD *)((char *)&handler + 4) = self;
        _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "%@: IPC is already established", (uint8_t *)&handler, 0xCu);
      }

      v5[2](v5, 0);
    }
    else
    {
      v13 = objc_getProperty(self, v8, 88, 1);
      -[NEIPC stop](v13);
      objc_setProperty_atomic(self, v14, 0, 88);
    }
  }
  v15 = objc_alloc_init(NEIPC);
  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C80D38];
  v17 = MEMORY[0x1E0C809B0];
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __70__NEExtensionTunnelProviderContext_establishIPCWithCompletionHandler___block_invoke;
  v39 = &unk_1E3CC3A58;
  objc_copyWeak(&v40, &location);
  v18 = MEMORY[0x1E0C80D38];
  v19 = &v36;
  if (v15)
  {
    v20 = v15;
    objc_sync_enter(v20);
    objc_setProperty_atomic_copy(v20, v21, v19, 8);
    v22 = (void *)MEMORY[0x1E0C80D38];
    v23 = xpc_connection_create(0, MEMORY[0x1E0C80D38]);
    objc_setProperty_atomic(v20, v24, v23, 24);

    v26 = (_xpc_connection_s *)objc_getProperty(v20, v25, 24, 1);
    *(_QWORD *)&handler = v17;
    *((_QWORD *)&handler + 1) = 3221225472;
    v43 = __51__NEIPC_startInListenModeWithQueue_messageHandler___block_invoke;
    v44 = &unk_1E3CC1B98;
    v45 = v20;
    v27 = v22;
    v46 = v22;
    xpc_connection_set_event_handler(v26, &handler);

    v29 = (_xpc_connection_s *)objc_getProperty(v20, v28, 24, 1);
    xpc_connection_resume(v29);

    v31 = (_xpc_connection_s *)objc_getProperty(v20, v30, 24, 1);
    v32 = xpc_endpoint_create(v31);

    objc_sync_exit(v20);
  }
  else
  {
    v32 = 0;
  }

  if (!v32)
  {
    v34 = 0;
    if (!self)
      goto LABEL_16;
    goto LABEL_15;
  }
  v34 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
  objc_msgSend(v34, "_setEndpoint:", v32, v36, v37, v38, v39);
  if (self)
LABEL_15:
    objc_setProperty_atomic(self, v33, v15, 88);
LABEL_16:
  ne_log_obj();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    LODWORD(handler) = 138412290;
    *(_QWORD *)((char *)&handler + 4) = self;
    _os_log_impl(&dword_19BD16000, v35, OS_LOG_TYPE_INFO, "%@: created IPC listener", (uint8_t *)&handler, 0xCu);
  }

  ((void (**)(id, id))v5)[2](v5, v34);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

}

- (void)cancelWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[NEExtensionTunnelProviderContext handleIPCDetached](self, "handleIPCDetached");
  v5.receiver = self;
  v5.super_class = (Class)NEExtensionTunnelProviderContext;
  -[NEExtensionProviderContext cancelWithError:](&v5, sel_cancelWithError_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipcIdleTimer, 0);
  objc_storeStrong((id *)&self->_ipc, 0);
}

void __70__NEExtensionTunnelProviderContext_establishIPCWithCompletionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  SEL v13;
  const char *v14;
  NSObject *Property;
  NSObject *v16;
  id v17;
  void *v18;
  SEL v19;
  id v20;
  _QWORD v21[5];

  v20 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "handleIPCDetached");
    }
    else if (v20)
    {
      objc_msgSend(WeakRetained, "_principalObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      objc_sync_enter(v12);
      if (objc_getProperty(v12, v13, 96, 1))
      {
        Property = objc_getProperty(v12, v14, 96, 1);
        dispatch_source_cancel(Property);
      }
      v16 = MEMORY[0x1E0C80D38];
      v17 = MEMORY[0x1E0C80D38];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__NEExtensionTunnelProviderContext_resetIPCIdleTimer__block_invoke;
      v21[3] = &unk_1E3CC41F0;
      v21[4] = v12;
      NECreateTimerSource(v16, 60, v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v12, v19, v18, 96);

      objc_sync_exit(v12);
      objc_msgSend(v11, "handleAppMessage:completionHandler:", v20, v8);

    }
  }

}

void __53__NEExtensionTunnelProviderContext_resetIPCIdleTimer__block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "handleIPCDetached");
  objc_sync_exit(obj);

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2912 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2912, &__block_literal_global_2913);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2914;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2909 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2909, &__block_literal_global_62);
  return (id)_extensionAuxiliaryHostProtocol_protocol_2910;
}

void __67__NEExtensionTunnelProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE418A98);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2910;
  _extensionAuxiliaryHostProtocol_protocol_2910 = v0;

}

void __69__NEExtensionTunnelProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4189D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2914;
  _extensionAuxiliaryVendorProtocol_protocol_2914 = v0;

}

@end
