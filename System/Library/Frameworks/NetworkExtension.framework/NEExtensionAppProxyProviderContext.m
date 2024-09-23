@implementation NEExtensionAppProxyProviderContext

- (void)setInitialFlowDivertControlSocket:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  SEL v12;
  SEL v13;
  id v14;
  void *v15;
  id v16;
  id v17[5];
  id v18;
  id location;
  _BYTE buf[24];
  void *v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 48, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "appVPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v5;
  if (self)
  {
    objc_initWeak(&location, self);
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_INFO, "%@: Setting initial flow divert control socket to %p", buf, 0x16u);
    }

    dup(objc_msgSend(v16, "fileDescriptor"));
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("NEFlow queue", v10);
    objc_setProperty_atomic(self, v12, v11, 112);

    v14 = objc_getProperty(self, v13, 112, 1);
    self->_director = (_NEFlowDirector *)NEFlowDirectorCreate();

    if (self->_director)
    {
      if (self->_delegateInterfaceIndex)
        NEFlowDirectorSetDelegateInterface();
      v15 = (void *)MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke;
      v21 = &unk_1E3CC39A8;
      objc_copyWeak(v22, &location);
      NEFlowDirectorSetOpenControlSocketCallback();
      if (v8)
      {
        v17[1] = v15;
        v17[2] = (id)3221225472;
        v17[3] = __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke_2;
        v17[4] = &unk_1E3CC06D0;
        objc_copyWeak(&v18, &location);
        NEFlowDirectorSetMatchRulesCallback();
        objc_destroyWeak(&v18);
      }
      objc_copyWeak(v17, &location);
      NEFlowDirectorSetNewFlowCallback();
      objc_destroyWeak(v17);
      objc_destroyWeak(v22);
    }
    objc_destroyWeak(&location);
  }

}

- (void)setDelegateInterface:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  NEExtensionAppProxyProviderContext *v7;
  __int16 v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 1024;
    v9 = a3;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Setting flow divert delegate interface to %u", (uint8_t *)&v6, 0x12u);
  }

  if (self)
  {
    self->_delegateInterfaceIndex = a3;
    if (self->_director)
      NEFlowDirectorSetDelegateInterface();
  }
}

- (void)openFlowDivertControlSocketWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  int v8;
  NEExtensionAppProxyProviderContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "%@: Opening new flow divert control socket", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v6, "openFlowDivertControlSocketWithCompletionHandler:", v4);
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  objc_super v13;
  uint8_t buf[4];
  NEExtensionAppProxyProviderContext *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)NEExtensionAppProxyProviderContext;
  -[NEExtensionProviderContext startWithOptions:completionHandler:](&v13, sel_startWithOptions_completionHandler_, v6, v7);

  if (self && self->_director)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2048;
      v17 = v6;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "%@: Calling startProxyWithOptions with options %p", buf, 0x16u);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__NEExtensionAppProxyProviderContext_startWithOptions_completionHandler___block_invoke;
    v12[3] = &unk_1E3CC45C8;
    v12[4] = self;
    objc_msgSend(v8, "startProxyWithOptions:completionHandler:", v6, v12);
  }
  else
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "%@: Cannot start the proxy because the flow director is nil", buf, 0xCu);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NEAppProxyFlowErrorDomain"), 8, 0);
    -[NEExtensionProviderContext startedWithError:](self, "startedWithError:", v11);

  }
}

- (void)stopWithReason:(int)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  NEExtensionAppProxyProviderContext *v11;
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
    _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEFAULT, "%@: Calling stopProxyWithReason because: %s", buf, 0x16u);
  }

  if (self && (a3 - 1) <= 0x28)
    v7 = qword_19BED5F68[a3 - 1];
  else
    v7 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NEExtensionAppProxyProviderContext_stopWithReason___block_invoke;
  v8[3] = &unk_1E3CC1388;
  v9 = a3;
  v8[4] = self;
  objc_msgSend(v5, "stopProxyWithReason:completionHandler:", v7, v8);

}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  NEExtensionAppProxyProviderContext *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (self && self->_director)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __54__NEExtensionAppProxyProviderContext_cancelWithError___block_invoke;
    v10 = &unk_1E3CC2F98;
    v11 = self;
    v12 = v4;
    NEFlowDirectorDestroy();

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NEExtensionAppProxyProviderContext;
    -[NEExtensionTunnelProviderContext cancelWithError:](&v6, sel_cancelWithError_, v4);
  }

}

- (id)extensionPoint
{
  return CFSTR("com.apple.networkextension.app-proxy");
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowQueue, 0);
}

id __54__NEExtensionAppProxyProviderContext_cancelWithError___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
  {
    v1[15] = 0;
    v1 = *(_QWORD **)(a1 + 32);
  }
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = v1;
  v4.super_class = (Class)NEExtensionAppProxyProviderContext;
  return objc_msgSendSuper2(&v4, sel_cancelWithError_, v2);
}

id __53__NEExtensionAppProxyProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)NEExtensionAppProxyProviderContext;
  return objc_msgSendSuper2(&v3, sel_stopWithReason_, v1);
}

void __73__NEExtensionAppProxyProviderContext_startWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = a2;
    objc_msgSend(v3, "handleIPCDetached");
  }
  else
  {
    NEFlowDirectorStart();
  }
  objc_msgSend(*(id *)(a1 + 32), "startedWithError:", a2);

}

void __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[1] = 3221225472;
    v3[2] = __65__NEExtensionAppProxyProviderContext_flowDivertOpenControlSocket__block_invoke;
    v3[3] = &unk_1E3CC3170;
    v3[4] = WeakRetained;
    v2 = WeakRetained;
    v3[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(WeakRetained, "openFlowDivertControlSocketWithCompletionHandler:", v3);
    WeakRetained = v2;
  }

}

void __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  int v7;
  NSObject *v8;
  SEL v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  char v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id self;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
  {
    v28 = a3;
    v6 = a4;
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.webapp"));
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v35 = self;
      v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "%@: Verifying app with signing identifier %@", buf, 0x16u);
    }

    v10 = objc_getProperty(self, v9, 48, 1);
    objc_msgSend(v10, "appVPN");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appRules");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      v17 = v7 ^ 1;
LABEL_6:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v18);
        objc_msgSend(v19, "matchSigningIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v6);
        if (((v21 | v17) & 1) != 0)
        {
          v22 = v21;

          if ((v22 & 1) != 0)
            goto LABEL_16;
        }
        else
        {
          objc_msgSend(v19, "matchSigningIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.webapp"));

          if ((v24 & 1) != 0)
          {
LABEL_16:
            v26 = v19;
            v25 = v28;

            if (!v26)
              goto LABEL_18;
            objc_msgSend(v26, "matchSigningIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            NEFlowDirectorHandleMatchRulesResult();

            goto LABEL_19;
          }
        }
        if (v15 == ++v18)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
          if (v15)
            goto LABEL_6;
          break;
        }
      }
    }

    v25 = 0;
LABEL_18:
    NEFlowDirectorHandleMatchRulesResult();
    v26 = 0;
LABEL_19:

  }
}

void __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  void (**v6)(id, uint64_t);
  uint64_t FlowType;
  void *v8;
  NEAppProxyTCPFlow *v9;
  SEL v10;
  NEAppProxyUDPFlow *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NEAppProxyUDPFlow *v16;
  SEL v17;
  NEAppProxyUDPFlow *host_with_numeric_port;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  id self;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  NEAppProxyUDPFlow *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a3;
  self = objc_loadWeakRetained(v4);
  v6 = (void (**)(id, uint64_t))v5;
  if (self)
  {
    FlowType = NEFlowGetFlowType();
    objc_msgSend(self, "_principalObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (FlowType == 2)
    {
      v16 = [NEAppProxyUDPFlow alloc];
      v11 = -[NEAppProxyUDPFlow initWithNEFlow:queue:](v16, "initWithNEFlow:queue:", a2, objc_getProperty(self, v17, 112, 1));
      host_with_numeric_port = (NEAppProxyUDPFlow *)+[NEAppProxyFlow copyRemoteEndpointFromFlow:]();
      if (!host_with_numeric_port)
        host_with_numeric_port = (NEAppProxyUDPFlow *)nw_endpoint_create_host_with_numeric_port();
      ne_log_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v26 = (uint64_t)self;
        v27 = 2112;
        v28 = (const char *)v11;
        v29 = 2112;
        v30 = host_with_numeric_port;
        _os_log_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEFAULT, "%@: Calling handleNewUDPFlow with %@, remoteEndpoint = %@", buf, 0x20u);
      }

      v20 = objc_msgSend(v8, "handleNewUDPFlow:initialRemoteFlowEndpoint:", v11, host_with_numeric_port);
      ne_log_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = "rejected";
        *(_DWORD *)buf = 138412802;
        v26 = (uint64_t)self;
        if ((_DWORD)v20)
          v22 = "accepted";
        v27 = 2080;
        v28 = v22;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_19BD16000, v21, OS_LOG_TYPE_DEFAULT, "%@: provider %s new flow %@", buf, 0x20u);
      }

      v6[2](v6, v20);
    }
    else
    {
      if (FlowType != 1)
      {
        ne_log_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v26 = FlowType;
          _os_log_fault_impl(&dword_19BD16000, v23, OS_LOG_TYPE_FAULT, "Unknown flow type %ld", buf, 0xCu);
        }

        v6[2](v6, 0);
        goto LABEL_24;
      }
      v9 = [NEAppProxyTCPFlow alloc];
      v11 = -[NEAppProxyTCPFlow initWithNEFlow:queue:](v9, "initWithNEFlow:queue:", a2, objc_getProperty(self, v10, 112, 1));
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v26 = (uint64_t)self;
        v27 = 2112;
        v28 = (const char *)v11;
        _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEFAULT, "%@: Calling handleNewFlow with %@", buf, 0x16u);
      }

      v13 = objc_msgSend(v8, "handleNewFlow:", v11);
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = "rejected";
        *(_DWORD *)buf = 138412802;
        v26 = (uint64_t)self;
        if ((_DWORD)v13)
          v15 = "accepted";
        v27 = 2080;
        v28 = v15;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEFAULT, "%@: provider %s new flow %@", buf, 0x20u);
      }

      v6[2](v6, v13);
    }

LABEL_24:
  }

}

void __65__NEExtensionAppProxyProviderContext_flowDivertOpenControlSocket__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
    v5 = dup(objc_msgSend(v3, "fileDescriptor"));
  else
    v5 = -1;
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@: Received new flow divert control socket %d", (uint8_t *)&v9, 0x12u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8 && *(_QWORD *)(v8 + 120))
    NEFlowDirectorHandleNewControlSocket();

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit, &__block_literal_global_1752);
  return (id)_extensionAuxiliaryVendorProtocol_protocol;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit, &__block_literal_global_68);
  return (id)_extensionAuxiliaryHostProtocol_protocol;
}

void __69__NEExtensionAppProxyProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE418B90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol;
  _extensionAuxiliaryHostProtocol_protocol = v0;

}

void __71__NEExtensionAppProxyProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE418AF8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol;
  _extensionAuxiliaryVendorProtocol_protocol = v0;

}

uint64_t __75__NEExtensionAppProxyProviderContext_fetchFlowStatesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
