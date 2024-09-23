@implementation NEExtensionPacketTunnelProviderContext

- (void)completeSession
{
  int has_internal_diagnostics;
  objc_super v4;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!self || !has_internal_diagnostics || !self->_testDisconnectAndDisposeTimeout)
  {
    v4.receiver = self;
    v4.super_class = (Class)NEExtensionPacketTunnelProviderContext;
    -[NEExtensionProviderContext completeSession](&v4, sel_completeSession);
  }
}

- (void)dispose
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!self || !self->super.super._isDisposed)
  {
    -[NEExtensionProviderContext _principalObject](self, "_principalObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "packetFlow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEPacketTunnelFlow closeVirtualInterface](v4);

    v5.receiver = self;
    v5.super_class = (Class)NEExtensionPacketTunnelProviderContext;
    -[NEExtensionProviderContext dispose](&v5, sel_dispose);

  }
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  _QWORD v12[5];
  objc_super v13;
  uint8_t buf[4];
  NEExtensionPacketTunnelProviderContext *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)NEExtensionPacketTunnelProviderContext;
  -[NEExtensionProviderContext startWithOptions:completionHandler:](&v13, sel_startWithOptions_completionHandler_, v6, v7);

  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    v16 = 2048;
    v17 = v6;
    _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "%@: Calling startTunnelWithOptions with options %p", buf, 0x16u);
  }

  if (isa_nsdictionary(v6))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("test-disconnect-dispose-timeout"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsnumber(v10))
    {
      v11 = objc_msgSend(v10, "BOOLValue");
      if (self)
        self->_testDisconnectAndDisposeTimeout = v11;
    }

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__NEExtensionPacketTunnelProviderContext_startWithOptions_completionHandler___block_invoke;
  v12[3] = &unk_1E3CC45C8;
  v12[4] = self;
  objc_msgSend(v8, "startTunnelWithOptions:completionHandler:", v6, v12);

}

- (void)stopWithReason:(int)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  NEExtensionPacketTunnelProviderContext *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2080;
    v13 = ne_session_stop_reason_to_string();
    _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEFAULT, "%@: Calling stopTunnelWithReason because: %s", buf, 0x16u);
  }

  if (self && (a3 - 1) <= 0x28)
    v7 = qword_19BED5F68[a3 - 1];
  else
    v7 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__NEExtensionPacketTunnelProviderContext_stopWithReason___block_invoke;
  v8[3] = &unk_1E3CC1388;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "stopTunnelWithReason:completionHandler:", v7, v8);

}

- (void)setupVirtualInterface:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v14;
  SEL v15;
  const char *v16;
  id v17;
  SEL v18;
  id v19;

  v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "packetFlow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    if (v7[11])
      -[NEPacketTunnelFlow closeVirtualInterface](v7);
    if (dyld_get_program_sdk_version() < 0xF0000)
    {
      objc_msgSend(v6, "controlSocket");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSocket:", v9);

    }
    v10 = objc_getProperty(v7, v8, 24, 1);
    v7[11] = objc_msgSend(v6, "createVirtualInterfaceWithQueue:clientInfo:", v10, 0);

    v12 = v7[11];
    if (v12)
      v7[10] = *(_QWORD *)(v12 + 256);
    if (objc_getProperty(v7, v11, 96, 1))
    {
      v14 = objc_getProperty(v7, v13, 96, 1);
      objc_setProperty_atomic_copy(v7, v15, 0, 96);
      objc_msgSend(v7, "readPacketsWithCompletionHandler:", v14);

    }
    if (objc_getProperty(v7, v13, 32, 1))
    {
      v17 = objc_getProperty(v7, v16, 32, 1);
      objc_setProperty_atomic_copy(v7, v18, 0, 32);
      objc_msgSend(v7, "readPacketObjectsWithCompletionHandler:", v17);

    }
    objc_sync_exit(v7);

  }
}

- (void)fetchVirtualInterfaceTypeWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, _QWORD))a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "packetFlow");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(_QWORD *)(v5 + 80);
  else
    v7 = 0;
  v4[2](v4, v7);

}

- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  int v19;
  NEExtensionPacketTunnelProviderContext *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v10 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v12;
    _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "%@: Requesting IKE socket for interface %@", (uint8_t *)&v19, 0x16u);
  }

  -[NEExtensionProviderContext hostContext](self, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestSocket:interface:local:remote:completionHandler:", v10, v12, v15, v14, v13);

}

- (void)setAppUUIDMap:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NEFlowMetaData *v18;
  id v19;
  id v20;
  NEExtensionPacketTunnelProviderContext *v21;
  uint64_t v22;
  NSData *sourceAppUniqueIdentifier;
  void *v24;
  SEL v25;
  NSObject *selfa;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  objc_super v35;
  uint8_t buf[4];
  NEExtensionPacketTunnelProviderContext *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = self;
      _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEFAULT, "%@: Setting the app UUID map", buf, 0xCu);
    }

    v27 = v5;
    objc_msgSend(v5, "packetFlow");
    v7 = objc_claimAutoreleasedReturnValue();
    v28 = v4;
    v8 = v4;
    v9 = v8;
    if (v7)
    {
      selfa = v7;
      objc_msgSend(v8, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      obj = v10;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v9, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = [NEFlowMetaData alloc];
            v19 = v16;
            v20 = v17;
            if (v18)
            {
              v35.receiver = v18;
              v35.super_class = (Class)NEFlowMetaData;
              v21 = -[NEExtensionPacketTunnelProviderContext init](&v35, sel_init);
              v18 = (NEFlowMetaData *)v21;
              if (v21)
              {
                objc_storeStrong((id *)&v21->super.super._hostContext, v17);
                v34 = objc_msgSend(v19, "hash");
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v34, 8);
                v22 = objc_claimAutoreleasedReturnValue();
                sourceAppUniqueIdentifier = v18->_sourceAppUniqueIdentifier;
                v18->_sourceAppUniqueIdentifier = (NSData *)v22;

              }
            }

            objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v19);
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
        }
        while (v13);
      }

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v11);
      v7 = selfa;
      objc_setProperty_atomic(selfa, v25, v24, 72);

    }
    v5 = v27;
    v4 = v28;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v37 = self;
    _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "%@: No provider when setting the app UUID map", buf, 0xCu);
  }

}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__NEExtensionPacketTunnelProviderContext_setTunnelConfiguration_completionHandler___block_invoke;
  v10[3] = &unk_1E3CBFF30;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)NEExtensionPacketTunnelProviderContext;
  -[NEExtensionTunnelProviderContext setTunnelConfiguration:completionHandler:](&v9, sel_setTunnelConfiguration_completionHandler_, v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)extensionPoint
{
  return CFSTR("com.apple.networkextension.packet-tunnel");
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

void __83__NEExtensionPacketTunnelProviderContext_setTunnelConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_principalObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "packetFlow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
        objc_sync_enter(v9);
        v9[8] = 0;
        objc_sync_exit(v9);

      }
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
    }
  }
  else
  {
    v6 = 0;
  }

}

id __57__NEExtensionPacketTunnelProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  id result;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  result = (id)os_variant_has_internal_diagnostics();
  v3 = *(_QWORD *)(a1 + 32);
  if (!(_DWORD)result || !v3 || !*(_BYTE *)(v3 + 104))
  {
    v4 = *(unsigned int *)(a1 + 40);
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)NEExtensionPacketTunnelProviderContext;
    return objc_msgSendSuper2(&v5, sel_stopWithReason_, v4);
  }
  return result;
}

void __77__NEExtensionPacketTunnelProviderContext_startWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "handleIPCDetached");
  objc_msgSend(*(id *)(a1 + 32), "startedWithError:", v3);

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2347 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2347, &__block_literal_global_2348);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2349;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2344 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2344, &__block_literal_global_74);
  return (id)_extensionAuxiliaryHostProtocol_protocol_2345;
}

void __73__NEExtensionPacketTunnelProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419B78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2345;
  _extensionAuxiliaryHostProtocol_protocol_2345 = v0;

}

void __75__NEExtensionPacketTunnelProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419AE0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2349;
  _extensionAuxiliaryVendorProtocol_protocol_2349 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol_protocol_2349, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_setAppUUIDMap_, 0, 0);

}

@end
