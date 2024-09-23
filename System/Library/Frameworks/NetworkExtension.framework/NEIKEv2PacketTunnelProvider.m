@implementation NEIKEv2PacketTunnelProvider

- (id)description
{
  id v3;
  int64_t tunnelKind;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t ifIndex;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    tunnelKind = self->_tunnelKind;
    v5 = &stru_1E3CC53C8;
    if (tunnelKind == 2)
      v5 = CFSTR("Fallback Tunnel");
    if (tunnelKind == 1)
      v6 = CFSTR("Primary Tunnel");
    else
      v6 = (__CFString *)v5;
    v7 = v6;
    ifIndex = self->_ifIndex;
  }
  else
  {
    v7 = 0;
    ifIndex = 0;
  }
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<NEIKEv2Provider: %@ (ifIndex %lu)>: "), v7, ifIndex);

  return v9;
}

- (NEIKEv2PacketTunnelProvider)init
{
  NEIKEv2PacketTunnelProvider *v2;
  NSObject *v3;
  void *v4;
  SEL v5;
  sigaction v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = -[NEPacketTunnelProvider initWithVirtualInterfaceType:](self, "initWithVirtualInterfaceType:", 2);
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(v7.__sigaction_u.__sa_handler) = 138412290;
    *(void (__cdecl **)(int, __siginfo *, void *))((char *)&v7.__sigaction_u.__sa_sigaction + 4) = (void (__cdecl *)(int, __siginfo *, void *))v2;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: Init with IPSec virtual interface type", (uint8_t *)&v7, 0xCu);
  }

  if (NEIKEv2PacketTunnelProviderCopyQueue_onceToken != -1)
    dispatch_once(&NEIKEv2PacketTunnelProviderCopyQueue_onceToken, &__block_literal_global_270);
  objc_storeStrong((id *)&v2->_queue, (id)NEIKEv2PacketTunnelProviderCopyQueue_queue);
  -[NEIKEv2PacketTunnelProvider addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, CFSTR("protocolConfiguration"), 5, 0);
  -[NEIKEv2PacketTunnelProvider addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, CFSTR("defaultPath"), 5, 0);
  *(&v2->_isObserving + 1) = 1;
  -[NEProvider defaultPath](v2, "defaultPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v2, v5, v4, 208);

  v2->_randomLocalPortFallbackRetryCount = 0;
  v7.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(_QWORD *)&v7.sa_mask = 0;
  sigaction(13, &v7, 0);
  return v2;
}

- (void)dealloc
{
  NEIKEv2Server *server;
  OS_dispatch_queue *queue;
  id startTunnelCompletionHandler;
  id stopTunnelCompletionHandler;
  void *v7;

  -[NEIKEv2PacketTunnelProvider reset:]((uint64_t)self, 1);
  server = self->_server;
  self->_server = 0;

  queue = self->_queue;
  self->_queue = 0;

  startTunnelCompletionHandler = self->_startTunnelCompletionHandler;
  self->_startTunnelCompletionHandler = 0;

  stopTunnelCompletionHandler = self->_stopTunnelCompletionHandler;
  self->_stopTunnelCompletionHandler = 0;

  -[NEPacketTunnelProvider packetFlow](self, "packetFlow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPacketTunnelFlow closeVirtualInterface](v7);

  exit(0);
}

- (void)startTunnelWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  NEIKEv2PacketTunnelProvider *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: startTunnelWithOptions Invoked", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__NEIKEv2PacketTunnelProvider_startTunnelWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E3CC3A30;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)stopTunnelWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  int64_t v12;
  uint8_t buf[4];
  NEIKEv2PacketTunnelProvider *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEFAULT, "%@: stopTunnelWithReason Invoked", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke;
  block[3] = &unk_1E3CC3B80;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)wake
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  NEIKEv2PacketTunnelProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: wake Invoked", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NEIKEv2PacketTunnelProvider_wake__block_invoke;
  block[3] = &unk_1E3CC41F0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  const char *v11;
  id Property;
  NSObject *queue;
  _QWORD block[5];
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NEIKEv2PacketTunnelProvider;
  -[NEProvider observerHelperHandler:ofObject:change:context:](&v15, sel_observerHelperHandler_ofObject_change_context_, a3, v10, a5, a6);
  if (self)
    Property = objc_getProperty(self, v11, 136, 1);
  else
    Property = 0;
  if (Property == v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__NEIKEv2PacketTunnelProvider_observerHelperHandler_ofObject_change_context___block_invoke;
    block[3] = &unk_1E3CC41F0;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  NEIKEv2PacketTunnelProvider *v10;
  const char *v11;
  id v12;
  id Property;
  NEIKEv2PacketTunnelProvider *v14;
  NSObject *queue;
  _QWORD *v16;
  int v17;
  _QWORD v18[5];
  _QWORD block[5];
  _QWORD v20[5];

  v9 = a3;
  v10 = (NEIKEv2PacketTunnelProvider *)a4;
  v12 = a5;
  if (v10 == self)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("protocolConfiguration")))
    {
      queue = v10->_queue;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v20[3] = &unk_1E3CC41F0;
      v20[4] = v10;
      v16 = v20;
      goto LABEL_12;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("defaultPath")))
    {
      queue = v10->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      block[3] = &unk_1E3CC41F0;
      block[4] = v10;
      v16 = block;
      goto LABEL_12;
    }
  }
  if (self)
    Property = objc_getProperty(self, v11, 272, 1);
  else
    Property = 0;
  v14 = (NEIKEv2PacketTunnelProvider *)Property;
  if (v14 == v10)
  {
    v17 = objc_msgSend(v9, "isEqualToString:", CFSTR("path"));

    if (!v17)
      goto LABEL_13;
    queue = self->_queue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v18[3] = &unk_1E3CC41F0;
    v18[4] = self;
    v16 = v18;
LABEL_12:
    dispatch_async(queue, v16);
    goto LABEL_13;
  }

LABEL_13:
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  NEIKEv2PacketTunnelProvider *v16;
  id v17;
  id v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _BYTE *v23;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  NEIKEv2PacketTunnelProvider *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v9 = "(Set)";
    else
      v9 = "(Clear)";
    -[NEProvider defaultPath](self, "defaultPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scopedInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProvider defaultPath](self, "defaultPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      objc_msgSend(v12, "scopedInterface");
    else
      objc_msgSend(v12, "interface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interfaceName");
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v25 = v15;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: Performing setTunnelNetworkSettings %s (%@)", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__11403;
  v26 = __Block_byref_object_dispose__11404;
  v16 = self;
  v27 = v16;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__NEIKEv2PacketTunnelProvider_setTunnelNetworkSettings_completionHandler___block_invoke;
  v20[3] = &unk_1E3CC1538;
  v23 = buf;
  v17 = v6;
  v21 = v17;
  v18 = v7;
  v22 = v18;
  v19.receiver = v16;
  v19.super_class = (Class)NEIKEv2PacketTunnelProvider;
  -[NEPacketTunnelProvider setTunnelNetworkSettings:completionHandler:](&v19, sel_setTunnelNetworkSettings_completionHandler_, v17, v20);

  _Block_object_dispose(buf, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedPathEvaluator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_companionProxyDatapath, 0);
  objc_storeStrong((id *)&self->_g_notification, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_dnsResolverCompletionHandler, 0);
  objc_storeStrong(&self->_stopTunnelCompletionHandler, 0);
  objc_storeStrong(&self->_startTunnelCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mobikeHandle, 0);
  objc_storeStrong((id *)&self->_getSocketSemaphore, 0);
  objc_storeStrong((id *)&self->_rekey, 0);
  objc_storeStrong((id *)&self->_resolverWaitTimer, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_remoteTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_localTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_ikeConfig, 0);
}

void __74__NEIKEv2PacketTunnelProvider_setTunnelNetworkSettings_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id Property;
  const char *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  id v18;
  const char *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (a1[4])
      v8 = "(Set)";
    else
      v8 = "(Clear)";
    if (v7)
      Property = objc_getProperty(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), v6, 208, 1);
    else
      Property = 0;
    objc_msgSend(Property, "scopedInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v11)
    {
      if (v12)
        v12 = objc_getProperty(v12, v10, 208, 1);
      v13 = v12;
      objc_msgSend(v13, "scopedInterface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
        v12 = objc_getProperty(v12, v10, 208, 1);
      v13 = v12;
      objc_msgSend(v13, "interface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = v14;
    objc_msgSend(v14, "interfaceName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138413058;
    v27 = v7;
    v28 = 2080;
    v29 = v8;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v3;
    _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%@: setTunnelNetworkSettings %s failed (%@): %@", (uint8_t *)&v26, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v16 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (a1[4])
      v17 = "(Set)";
    else
      v17 = "(Clear)";
    if (v16)
      v18 = objc_getProperty(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), v15, 208, 1);
    else
      v18 = 0;
    objc_msgSend(v18, "scopedInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v11)
    {
      if (v20)
        v20 = objc_getProperty(v20, v19, 208, 1);
      v13 = v20;
      objc_msgSend(v13, "scopedInterface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v20)
        v20 = objc_getProperty(v20, v19, 208, 1);
      v13 = v20;
      objc_msgSend(v13, "interface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;
    objc_msgSend(v21, "interfaceName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412802;
    v27 = v16;
    v28 = 2080;
    v29 = v17;
    v30 = 2112;
    v31 = v23;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings %s completed (%@)", (uint8_t *)&v26, 0x20u);
  }

LABEL_27:
  if (a1[5])
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v26 = 138412290;
      v27 = v25;
      _os_log_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings calling completionHandler", (uint8_t *)&v26, 0xCu);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }

}

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  NSObject *v4;
  SEL v5;
  NSObject *v6;
  NEIKEv2Server *v7;
  SEL v8;
  void *v9;
  void *v10;
  SEL v11;
  id Property;
  const char *v13;
  NEIKEv2MOBIKE *v14;
  SEL v15;
  id v16;
  id *v17;
  SEL v18;
  SEL v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int128 buf;
  void *v33;
  void *v34;
  id v35[2];

  v35[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 && (*(_BYTE *)(v1 + 77) & 1) == 0)
  {
    v2 = *(_QWORD *)(v1 + 248);
    v3 = *(_BYTE *)(v1 + 73);
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v1;
      _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_INFO, "%@: handleConfigChange", (uint8_t *)&buf, 0xCu);
    }

    if (objc_getProperty((id)v1, v5, 240, 1))
    {
      if ((*(_BYTE *)(v1 + 78) & 1) != 0)
      {
        *(_BYTE *)(v1 + 77) = 1;
        objc_initWeak((id *)&v28, (id)v1);
        ne_log_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_19BD16000, v27, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel due to config change", (uint8_t *)&buf, 0xCu);
        }

        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v33 = __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke;
        v34 = &unk_1E3CC39A8;
        objc_copyWeak(v35, (id *)&v28);
        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((_BYTE *)v1, 0, &buf);
        objc_destroyWeak(v35);
        objc_destroyWeak((id *)&v28);
      }
      else
      {
        ne_log_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel due to Config Change", (uint8_t *)&buf, 0xCu);
        }

        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((_BYTE *)v1, 0, 0);
        v7 = objc_alloc_init(NEIKEv2Server);
        objc_setProperty_atomic((id)v1, v8, v7, 128);

        objc_msgSend((id)v1, "protocolConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "serverAddress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        Property = objc_getProperty((id)v1, v11, 128, 1);
        if (Property)
          objc_setProperty_atomic(Property, v13, v10, 16);

        *(_QWORD *)(v1 + 248) = v2;
        *(_BYTE *)(v1 + 73) = v3;
        v14 = [NEIKEv2MOBIKE alloc];
        v16 = objc_getProperty((id)v1, v15, 264, 1);
        v17 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v14->super.isa, v16, (void *)v1);
        objc_setProperty_atomic((id)v1, v18, v17, 168);

        v20 = objc_getProperty((id)v1, v19, 128, 1);
        if (v20)
          objc_setProperty_atomic(v20, v21, 0, 24);
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v33 = __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke_142;
        v34 = &unk_1E3CC1408;
        v35[0] = (id)v1;
        -[NEIKEv2PacketTunnelProvider resolveServerAddressIfNeeded:]((_QWORD *)v1, &buf);
        objc_msgSend((id)v1, "setReasserting:", (~*(_DWORD *)(v1 + 84) & 0xF) == 0);
        *(_DWORD *)(v1 + 84) &= 0xFFFFFFF0;
        v22 = *(void **)(v1 + 88);
        *(_QWORD *)(v1 + 88) = 0;

        v23 = *(void **)(v1 + 96);
        *(_QWORD *)(v1 + 96) = 0;

        v24 = *(void **)(v1 + 104);
        *(_QWORD *)(v1 + 104) = 0;

        ne_log_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412546;
          v29 = v1;
          v30 = 2080;
          v31 = "-[NEIKEv2PacketTunnelProvider handleConfigChange]";
          _os_log_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEFAULT, "%@: %s: bringing up tunnel", (uint8_t *)&v28, 0x16u);
        }

      }
    }
    else
    {
      ne_log_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v1;
        _os_log_debug_impl(&dword_19BD16000, v26, OS_LOG_TYPE_DEBUG, "%@: No tunnel, ignore config change", (uint8_t *)&buf, 0xCu);
      }

    }
  }
}

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SEL v21;
  id Property;
  const char *v23;
  id v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SEL v33;
  int *v34;
  uint64_t v35;
  SEL v36;
  const char *v37;
  void *v38;
  SEL v39;
  id v40;
  void *v41;
  SEL v42;
  SEL v43;
  void *v44;
  SEL v45;
  id v46;
  void *v47;
  void *v48;
  const char *v49;
  SEL v50;
  void *v51;
  SEL v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  id v62;
  const char *v63;
  id v64;
  void *v65;
  os_unfair_lock_s *v66;
  unsigned int v67;
  const char *v68;
  NSObject *v69;
  const char *v70;
  NSObject *v71;
  uint32_t v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  _QWORD *v76;
  const char *v77;
  uint64_t v78;
  id v79;
  SEL v80;
  const char *v81;
  _DWORD *v82;
  int v83;
  const char *v84;
  SEL v85;
  _BYTE *v86;
  const char *v87;
  id v88;
  const char *v89;
  id v90;
  char v91;
  NSObject *v92;
  uint64_t v93;
  const char *v94;
  char v95;
  const char *v96;
  const char *v97;
  NSObject *v98;
  NSObject *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  char v103;
  void *v104;
  char v105;
  uint8_t buf[4];
  uint64_t v107;
  __int16 v108;
  _BYTE v109[10];
  uint64_t v110;
  __int16 v111;
  const char *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!v1 || (*(_BYTE *)(v1 + 77) & 1) != 0)
    return;
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v1, "defaultPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scopedInterface");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "defaultPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v5;
    if (v4)
      objc_msgSend(v5, "scopedInterface");
    else
      objc_msgSend(v5, "interface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interfaceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "defaultPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scopedInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "defaultPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v102 = (void *)v4;
    v104 = v3;
    if (v9)
      objc_msgSend(v10, "scopedInterface");
    else
      objc_msgSend(v10, "interface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "interfaceIndex");
    objc_msgSend((id)v1, "defaultPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v107 = v1;
    v108 = 2112;
    *(_QWORD *)v109 = v7;
    *(_WORD *)&v109[8] = 2048;
    v110 = v13;
    v111 = 1024;
    LODWORD(v112) = objc_msgSend(v14, "status") == 1;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "%@: New scoped interface %@ (%lu) (SATISFIED: %d)", buf, 0x26u);

  }
  objc_msgSend((id)v1, "defaultPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scopedInterface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v1, "defaultPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "scopedInterface");
  else
    objc_msgSend(v17, "interface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "interfaceIndex");
  Property = objc_getProperty((id)v1, v21, 240, 1);
  if (v20 == -[NEIKEv2Session interfaceIndex]((uint64_t)Property))
  {
    v24 = objc_getProperty((id)v1, v23, 240, 1);
    v25 = -[NEIKEv2Session interfaceIndex]((uint64_t)v24);

    if (v25)
    {
      ne_log_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = *(_QWORD *)(v1 + 248);
        objc_msgSend((id)v1, "defaultPath");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "scopedInterface");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v1, "defaultPath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29)
          objc_msgSend(v30, "scopedInterface");
        else
          objc_msgSend(v30, "interface");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "interfaceIndex");
        *(_DWORD *)buf = 138412802;
        v107 = v1;
        v108 = 2048;
        *(_QWORD *)v109 = v27;
        *(_WORD *)&v109[8] = 2048;
        v110 = v74;
        _os_log_impl(&dword_19BD16000, v26, OS_LOG_TYPE_INFO, "%@: Ignoring interface change to: %lu --> %lu\n", buf, 0x20u);

      }
LABEL_85:

      return;
    }
  }
  else
  {

  }
  objc_msgSend((id)v1, "defaultPath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic((id)v1, v33, v32, 208);

  v34 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
  v35 = *(_QWORD *)(v1 + 248);
  v103 = *(_BYTE *)(v1 + 75);
  v105 = *(_BYTE *)(v1 + 74);
  if (objc_msgSend(objc_getProperty((id)v1, v36, 208, 1), "status") == 1)
  {
    objc_msgSend(objc_getProperty((id)v1, v37, 208, 1), "scopedInterface");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_getProperty((id)v1, v39, 208, 1);
    if (v38)
      objc_msgSend(v40, "scopedInterface");
    else
      objc_msgSend(v40, "interface");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v1 + 248) = objc_msgSend(v41, "interfaceIndex");

    *(_QWORD *)(v1 + 256) = objc_msgSend(objc_getProperty((id)v1, v42, 208, 1), "status");
    objc_msgSend(objc_getProperty((id)v1, v43, 208, 1), "scopedInterface");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_getProperty((id)v1, v45, 208, 1);
    v47 = v46;
    if (v44)
      objc_msgSend(v46, "scopedInterface");
    else
      objc_msgSend(v46, "interface");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "type") == 2)
      *(_BYTE *)(v1 + 73) = 1;
    else
      *(_BYTE *)(v1 + 73) = objc_msgSend(objc_getProperty((id)v1, v49, 208, 1), "usesInterfaceType:", 2);

    objc_msgSend(objc_getProperty((id)v1, v50, 208, 1), "scopedInterface");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_getProperty((id)v1, v52, 208, 1);
    if (v51)
      objc_msgSend(v53, "scopedInterface");
    else
      objc_msgSend(v53, "interface");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v1 + 74) = objc_msgSend(v54, "subtype") == 5001;

  }
  else
  {
    *(_QWORD *)(v1 + 248) = 0;
    *(_QWORD *)(v1 + 256) = 2;
    *(_BYTE *)(v1 + 73) = 0;
    *(_BYTE *)(v1 + 74) = 0;
  }
  *(_BYTE *)(v1 + 75) = 0;
  objc_msgSend(objc_getProperty((id)v1, v37, 208, 1), "interface");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "subtype");

  if (v56 != 5001)
    goto LABEL_72;
  v58 = 1;
  if ((objc_msgSend(objc_getProperty((id)v1, v57, 208, 1), "usesInterfaceType:", 1) & 1) == 0)
  {
    v58 = 2;
    if (!objc_msgSend(objc_getProperty((id)v1, v59, 208, 1), "usesInterfaceType:", 2))
      v58 = 0;
  }
  if (objc_msgSend(objc_getProperty((id)v1, v59, 208, 1), "usesInterfaceType:", 3))
    v61 = 3;
  else
    v61 = v58;
  *(_BYTE *)(v1 + 75) = v61 != 0;
  v62 = objc_getProperty((id)v1, v60, 128, 1);
  if (!v62
    || (v64 = objc_getProperty(v62, v63, 56, 1)) == 0
    || (v65 = v64,
        v66 = (os_unfair_lock_s *)objc_getProperty((id)v1, v63, 232, 1),
        v67 = -[NEIKEv2CompanionDatapath connected](v66),
        v65,
        !v67))
  {
    v88 = objc_getProperty((id)v1, v63, 128, 1);
    if (v88)
    {
      v90 = objc_getProperty(v88, v89, 56, 1);
      v34 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
      if (v90)
      {
        v91 = *(_BYTE *)(v1 + 75);

        if ((v91 & 1) == 0)
        {
          ne_log_obj();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v107 = v1;
            _os_log_impl(&dword_19BD16000, v26, OS_LOG_TYPE_DEFAULT, "%@: No outbound companion path detected. Ignoring companion path", buf, 0xCu);
          }
          goto LABEL_85;
        }
      }
    }
    else
    {
      v34 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
    }
    if ((v105 & 1) != 0 && (*(_BYTE *)(v1 + 75) & 1) != 0 && (v103 & 1) == 0)
    {
      ne_log_obj();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v107 = v1;
        _os_log_impl(&dword_19BD16000, v98, OS_LOG_TYPE_DEFAULT, "%@: outbound companion path detected", buf, 0xCu);
      }

      goto LABEL_91;
    }
    goto LABEL_72;
  }
  if (objc_msgSend(objc_getProperty((id)v1, v63, 208, 1), "status") == 1)
  {
    if ((*(_BYTE *)(v1 + 75) & 1) == 0)
    {
      ne_log_obj();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v107 = v1;
        v70 = "%@: No companion outbound path detected. Cancelling companion path";
        v71 = v69;
        v72 = 12;
LABEL_63:
        _os_log_impl(&dword_19BD16000, v71, OS_LOG_TYPE_DEFAULT, v70, buf, v72);
        goto LABEL_64;
      }
      goto LABEL_64;
    }
    v76 = objc_getProperty((id)v1, v68, 232, 1);
    if (v76)
      v78 = v76[3];
    else
      v78 = 0;
    if (v61 != v78 || (*(_BYTE *)(v1 + 79) & 1) != 0)
    {
      ne_log_obj();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v82 = objc_getProperty((id)v1, v81, 232, 1);
        if (v82)
          v83 = v82[6];
        else
          v83 = 0;
        *(_DWORD *)buf = 138412802;
        v107 = v1;
        v108 = 1024;
        *(_DWORD *)v109 = v83;
        *(_WORD *)&v109[4] = 1024;
        *(_DWORD *)&v109[6] = v61;
        v70 = "%@: MOBIKE tunnel due to Companion network path change %u --> %u";
        v71 = v69;
        v72 = 24;
        goto LABEL_63;
      }
LABEL_64:

      -[NEIKEv2PacketTunnelProvider invalidateCompanionProxyDatapath]((void *)v1, v84);
      v86 = objc_getProperty((id)v1, v85, 128, 1);
      -[NEIKEv2Server resetPathProxyState](v86, v87);
      v34 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
LABEL_91:
      ne_log_obj();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        v100 = *(_QWORD *)(v1 + v34[334]);
        *(_DWORD *)buf = 138412802;
        v107 = v1;
        v108 = 2048;
        *(_QWORD *)v109 = v35;
        *(_WORD *)&v109[8] = 2048;
        v110 = v100;
        _os_log_impl(&dword_19BD16000, v99, OS_LOG_TYPE_INFO, "%@: Scoped interface changed: %lu --> %lu\n", buf, 0x20u);
      }

      -[NEIKEv2PacketTunnelProvider handleInterfaceChange:](v1, (const char *)1);
      return;
    }
    v79 = objc_getProperty((id)v1, v77, 240, 1);
    objc_msgSend(v79, "sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:", 3, 1000, objc_getProperty((id)v1, v80, 264, 1), &__block_literal_global_11663);

    v34 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
LABEL_72:
    ne_log_obj();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      v93 = *(_QWORD *)(v1 + v34[334]);
      if (*(_QWORD *)(v1 + 256) == 1)
        v94 = "SATISFIED";
      else
        v94 = "UNSATISFIED";
      v95 = *(_BYTE *)(v1 + 73);
      *(_DWORD *)buf = 138413058;
      if ((v95 & 1) != 0)
        v96 = " Cellular";
      else
        v96 = "";
      v107 = v1;
      v108 = 2048;
      *(_QWORD *)v109 = v93;
      *(_WORD *)&v109[8] = 2080;
      v110 = (uint64_t)v94;
      v111 = 2080;
      v112 = v96;
      _os_log_impl(&dword_19BD16000, v92, OS_LOG_TYPE_INFO, "%@: Updated scoped ifIndex %lu (%s%s)", buf, 0x2Au);
    }

    if (v35 == *(_QWORD *)(v1 + v34[334]) && (!v35 || objc_getProperty((id)v1, v97, 240, 1)))
    {
      ne_log_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v107 = v1;
        _os_log_debug_impl(&dword_19BD16000, v26, OS_LOG_TYPE_DEBUG, "%@: Scoped interface unchanged, ignore\n", buf, 0xCu);
      }
      goto LABEL_85;
    }
    goto LABEL_91;
  }
  ne_log_obj();
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v107 = v1;
    _os_log_impl(&dword_19BD16000, v75, OS_LOG_TYPE_DEFAULT, "%@: tearing down tunnel due to Companion link loss", buf, 0xCu);
  }

  -[NEIKEv2PacketTunnelProvider handleInterfaceDown]((void *)v1);
}

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  _BYTE *v1;
  NSObject *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  SEL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SEL v11;
  void *v12;
  void *v13;
  SEL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SEL v20;
  void *v21;
  SEL v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  SEL v26;
  const char *v27;
  SEL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  _BYTE *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v1 = *(_BYTE **)(a1 + 32);
  if (v1 && (v1[77] & 1) == 0)
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(objc_getProperty(v1, v3, 272, 1), "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scopedInterface");
      v5 = objc_claimAutoreleasedReturnValue();
      v7 = objc_getProperty(v1, v6, 272, 1);
      objc_msgSend(v7, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)v5;
      v33 = v4;
      v30 = v8;
      if (v5)
        objc_msgSend(v8, "scopedInterface");
      else
        objc_msgSend(v8, "interface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "interfaceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc_getProperty(v1, v11, 272, 1), "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scopedInterface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_getProperty(v1, v14, 272, 1);
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v31 = v7;
      v29 = v9;
      if (v13)
        objc_msgSend(v16, "scopedInterface");
      else
        objc_msgSend(v16, "interface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "interfaceIndex");
      objc_msgSend(objc_getProperty(v1, v20, 272, 1), "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v35 = v1;
      v36 = 2112;
      v37 = v10;
      v38 = 2048;
      v39 = v19;
      v40 = 1024;
      v41 = objc_msgSend(v21, "status") == 1;
      _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "%@: Scoped path changed %@ (%lu) (SATISFIED: %d)", buf, 0x26u);

    }
    objc_msgSend(objc_getProperty(v1, v22, 272, 1), "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "status");

    if (v24 != 1)
    {
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v1;
        _os_log_impl(&dword_19BD16000, v25, OS_LOG_TYPE_INFO, "%@: Scoped path went UNSATISFIED, flap tunnel", buf, 0xCu);
      }

      if (objc_getProperty(v1, v26, 272, 1))
      {
        objc_msgSend(objc_getProperty(v1, v27, 272, 1), "removeObserver:forKeyPath:", v1, CFSTR("path"));
        objc_setProperty_atomic(v1, v28, 0, 272);
      }
      -[NEIKEv2PacketTunnelProvider handleInterfaceChange:]((uint64_t)v1, (const char *)1);
    }
  }
}

- (void)handleInterfaceChange:(uint64_t)a1
{
  int v2;
  SEL v4;
  id v5;
  const char *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  SEL v16;
  id Property;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  SEL v24;
  id v25;
  SEL v26;
  id v27;
  const char *v28;
  _BYTE *v29;
  const char *v30;
  id v31;
  NSObject *v32;
  id v33;
  const char *v34;
  void *v35;
  SEL v36;
  id v37;
  const char *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  _QWORD v44[5];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = (int)a2;
  -[NEIKEv2PacketTunnelProvider configureProxyPathIfNeeded]((void *)a1, a2);
  v5 = objc_getProperty((id)a1, v4, 240, 1);
  if (v5)
    v7 = 1;
  else
    v7 = v2 == 0;
  if (v7)
  {

  }
  else if ((*(_BYTE *)(a1 + 78) & 1) == 0)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 248);
      *(_DWORD *)buf = 138412546;
      v46 = a1;
      v47 = 2048;
      v48 = v9;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting tunnel on scoped interface UP (%lu)", buf, 0x16u);
    }

    if (*(_QWORD *)(a1 + 256) == 1)
    {
      objc_msgSend((id)a1, "protocolConfiguration");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend((id)a1, "protocolConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          ne_log_obj();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = *(_QWORD *)(a1 + 248);
            *(_DWORD *)buf = 138412546;
            v46 = a1;
            v47 = 2048;
            v48 = v15;
            _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_INFO, "%@: Calling startIKEv2TunnelWithOptions on scoped interface UP (%lu)", buf, 0x16u);
          }

          -[NEIKEv2PacketTunnelProvider reset:](a1, 1);
          Property = objc_getProperty((id)a1, v16, 112, 1);
          -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:](a1, Property);
        }
      }
    }
    return;
  }
  if ((*(_BYTE *)(a1 + 79) & 1) != 0)
  {
    v23 = objc_getProperty((id)a1, v6, 128, 1);
    v25 = objc_getProperty((id)a1, v24, 208, 1);
    -[NEIKEv2Server getViableServerAddressForPath:](v23, v25);
    v43 = (id)objc_claimAutoreleasedReturnValue();

    v27 = objc_getProperty((id)a1, v26, 168, 1);
    if (v27)
      objc_setProperty_atomic(v27, v28, 0, 16);
    v29 = objc_getProperty((id)a1, v28, 128, 1);
    if (v29 && (v29[8] & 1) != 0)
    {
      if ((*(_BYTE *)(a1 + 75) & 1) != 0)
      {
        v33 = objc_getProperty((id)a1, v30, 128, 1);
        if (v33)
          v33 = objc_getProperty(v33, v34, 56, 1);
        v31 = v33;
        objc_msgSend(v31, "port");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_getProperty((id)a1, v36, 168, 1);
        if (v37)
          objc_setProperty_atomic(v37, v38, v35, 16);

      }
      else
      {
        v31 = v43;
        v43 = 0;
      }

    }
    v39 = objc_getProperty((id)a1, v30, 168, 1);
    v40 = *(void **)(a1 + 248);
    v41 = v39;
    objc_msgSend((id)a1, "defaultPath");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2MOBIKE initiateMOBIKE:pathStatus:serverAddress:earlyDisconnect:]((uint64_t)v41, v40, objc_msgSend(v42, "status"), v43, 0);

  }
  else if (v2)
  {
    if ((*(_BYTE *)(a1 + 78) & 1) != 0)
      goto LABEL_32;
    if (*(_QWORD *)(a1 + 256) != 1)
      goto LABEL_32;
    objc_msgSend((id)a1, "protocolConfiguration");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_32;
    v19 = (void *)v18;
    objc_msgSend((id)a1, "protocolConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "serverAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = a1;
        _os_log_impl(&dword_19BD16000, v22, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel before reattempting on new path", buf, 0xCu);
      }

      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke;
      v44[3] = &unk_1E3CC41F0;
      v44[4] = a1;
      -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((_BYTE *)a1, 0, v44);
    }
    else
    {
LABEL_32:
      ne_log_obj();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = a1;
        _os_log_impl(&dword_19BD16000, v32, OS_LOG_TYPE_DEFAULT, "%@: Disconnect tunnel: scoped interface changed / status not satisfied", buf, 0xCu);
      }

      -[NEIKEv2PacketTunnelProvider handleInterfaceDown]((void *)a1);
    }
  }
}

- (void)configureProxyPathIfNeeded
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  SEL v23;
  _BYTE *Property;
  const char *v25;
  _BYTE *v26;
  void *v27;
  void *v28;
  void *v29;
  SEL v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id self;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(objc_getProperty(a1, a2, 208, 1), "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "subtype") != 5001)
  {

    goto LABEL_20;
  }
  objc_msgSend(objc_getProperty(a1, v4, 208, 1), "proxySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_20:
    -[NEIKEv2PacketTunnelProvider invalidateCompanionProxyDatapath](a1, v6);
    Property = objc_getProperty(a1, v23, 128, 1);
    -[NEIKEv2Server resetPathProxyState](Property, v25);
    return;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  self = a1;
  objc_msgSend(objc_getProperty(a1, v6, 208, 1), "proxySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v34)
  {
    v8 = *(_QWORD *)v43;
    v9 = *MEMORY[0x1E0CE8F38];
    v10 = *MEMORY[0x1E0CE8F40];
    v37 = v7;
    v33 = *(_QWORD *)v43;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v7);
        v35 = v11;
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v11);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v39 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v18, "objectForKeyedSubscript:", v9);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v10);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kCFStreamPropertySOCKSVersion"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "isEqualToString:", CFSTR("shoes")))
              {
                v26 = objc_getProperty(self, v22, 128, 1);
                if (v26)
                  v26[8] = 1;
                v27 = (void *)MEMORY[0x1E0CCEC80];
                objc_msgSend(v19, "stringValue");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "endpointWithHostname:port:", v20, v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_getProperty(self, v30, 128, 1);
                if (v31)
                  objc_setProperty_atomic(v31, v32, v29, 56);

                v7 = v37;
                goto LABEL_26;
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v15)
              continue;
            break;
          }
        }

        v11 = v35 + 1;
        v7 = v37;
        v8 = v33;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v34);
  }
LABEL_26:

}

- (void)reset:(uint64_t)a1
{
  NSObject *v4;
  const char *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  SEL v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v23 = 138412290;
      v24 = a1;
      _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_INFO, "%@: Reset", (uint8_t *)&v23, 0xCu);
    }

    if (a2 && objc_getProperty((id)a1, v5, 240, 1))
      objc_setProperty_atomic((id)a1, v6, 0, 240);
    v7 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

    v8 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    v9 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = 0;

    *(_DWORD *)(a1 + 84) = 0;
    *(_QWORD *)(a1 + 120) = 0;
    *(_BYTE *)(a1 + 76) = 0;
    v10 = *(void **)(a1 + 192);
    *(_QWORD *)(a1 + 192) = 0;

    v11 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;

    v12 = *(void **)(a1 + 168);
    *(_QWORD *)(a1 + 168) = 0;

    *(_BYTE *)(a1 + 79) = 0;
    *(_BYTE *)(a1 + 80) = 0;
    v14 = *(void **)(a1 + 152);
    if (v14)
    {
      -[NEIKEv2Rekey invalidateTimers](v14, v13);
      v15 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = 0;

    }
    v16 = *(void **)(a1 + 136);
    if (v16)
    {
      objc_msgSend((id)a1, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObserver:forKeyPath:", v17, CFSTR("resolvedEndpoints"));

      v18 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = 0;

    }
    v19 = *(NSObject **)(a1 + 144);
    if (v19)
    {
      dispatch_source_cancel(v19);
      v20 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

    }
    if (objc_getProperty((id)a1, v13, 272, 1))
    {
      objc_msgSend(objc_getProperty((id)a1, v21, 272, 1), "removeObserver:forKeyPath:", a1, CFSTR("path"));
      objc_setProperty_atomic((id)a1, v22, 0, 272);
    }
  }
}

- (void)startIKEv2TunnelWithOptions:(uint64_t)a1
{
  const char *v3;
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NEPacketTunnelNetworkSettings *v20;
  NEIPv4Settings *v21;
  id v22;
  NEIPv4Route *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  NEIKEv2Server *v35;
  SEL v36;
  NEIKEv2MOBIKE *v37;
  SEL v38;
  id Property;
  id *v40;
  SEL v41;
  void *v42;
  void *v43;
  SEL v44;
  id v45;
  const char *v46;
  SEL v47;
  void *v48;
  SEL v49;
  id v50;
  void *v51;
  SEL v52;
  void *v53;
  NSObject *v54;
  _QWORD v55[5];
  _QWORD v56[4];
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 77) & 1) != 0)
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = a1;
        _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Start IKEv2 Tunnel Skipped, provider disposed", buf, 0xCu);
      }
      goto LABEL_9;
    }
    if (objc_getProperty((id)a1, v3, 240, 1))
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = a1;
        _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Start IKEv2 Tunnel Skipped, has active ike session", buf, 0xCu);
      }
LABEL_9:

      goto LABEL_10;
    }
    if (!v4)
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = a1;
        _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Start IKEv2 Tunnel Skipped, null options", buf, 0xCu);
      }
      goto LABEL_9;
    }
    objc_msgSend((id)a1, "protocolConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend((id)a1, "protocolConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 200) = objc_msgSend(v8, "tunnelKind");

    }
    objc_setProperty_atomic((id)a1, v7, v4, 112);
    if (!*(_QWORD *)(a1 + 248) || *(_QWORD *)(a1 + 256) != 1)
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(void **)(a1 + 248);
        v25 = *(_QWORD *)(a1 + 256);
        *(_DWORD *)buf = 138412802;
        v59 = a1;
        v60 = 2048;
        v61 = v24;
        v62 = 2048;
        v63 = v25;
        _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "%@: Start IKEv2 Tunnel Skipped, interface not ready (ifindex %lu, Satisfied %lu)", buf, 0x20u);
      }
      goto LABEL_9;
    }
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 248);
      *(_DWORD *)buf = 138412546;
      v59 = a1;
      v60 = 2048;
      v61 = v10;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "%@: Starting IKEv2 Tunnel on scoped ifindex %lu", buf, 0x16u);
    }

    objc_msgSend((id)a1, "protocolConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_33;
    objc_msgSend((id)a1, "protocolConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
LABEL_33:
      ne_log_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v59 = a1;
        _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, "%@: NULL configuration / serverAddress", buf, 0xCu);
      }

      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:]((_BYTE *)a1, (const char *)0xA);
    }
    else
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "protocolConfiguration");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = a1;
        v60 = 2112;
        v61 = v53;
        _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "%@: Starting IKEv2 Tunnel with configuration %@", buf, 0x16u);

      }
      if (ne_session_disable_restrictions()
        && (objc_msgSend((id)a1, "protocolConfiguration"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v16, "serverAddress"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("0.0.0.0")),
            v17,
            v16,
            v18))
      {
        ne_log_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v59 = a1;
          _os_log_debug_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEBUG, "%@: Starting a tunnel to 0.0.0.0, marking connected immediately", buf, 0xCu);
        }

        v20 = -[NETunnelNetworkSettings initWithTunnelRemoteAddress:]([NEPacketTunnelNetworkSettings alloc], "initWithTunnelRemoteAddress:", CFSTR("0.0.0.0"));
        v21 = -[NEIPv4Settings initWithAddresses:subnetMasks:]([NEIPv4Settings alloc], "initWithAddresses:subnetMasks:", &unk_1E3D03A28, &unk_1E3D03A40);
        v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v23 = -[NEIPv4Route initWithDestinationAddress:subnetMask:]([NEIPv4Route alloc], "initWithDestinationAddress:subnetMask:", CFSTR("0.0.0.0"), CFSTR("255.255.255.255"));
        objc_msgSend(v22, "addObject:", v23);

        -[NEIPv4Settings setIncludedRoutes:](v21, "setIncludedRoutes:", v22);
        -[NEPacketTunnelNetworkSettings setIPv4Settings:](v20, "setIPv4Settings:", v21);
        objc_initWeak((id *)buf, (id)a1);
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke;
        v56[3] = &unk_1E3CC3148;
        objc_copyWeak(&v57, (id *)buf);
        objc_msgSend((id)a1, "setTunnelNetworkSettings:completionHandler:", v20, v56);
        objc_destroyWeak(&v57);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        objc_msgSend((id)a1, "protocolConfiguration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v27, "useExtendedAuthentication"))
          goto LABEL_40;
        objc_msgSend(v27, "username");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length") == 0;

        if (v29)
          goto LABEL_40;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Password"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30 == 0;

        if (!v31)
          goto LABEL_40;
        objc_msgSend(v27, "passwordKeychainItem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "persistentReference");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33 == 0;

        if (v34)
        {
          if (!-[NEIKEv2PacketTunnelProvider NEIKEv2ProviderAuthenticate:]((_BYTE *)a1, v4))
          {
            ne_log_obj();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v59 = a1;
              _os_log_error_impl(&dword_19BD16000, v54, OS_LOG_TYPE_ERROR, "%@: Cancel IKEv2 tunnel, popping prompt for password failed", buf, 0xCu);
            }

            -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:]((_BYTE *)a1, (const char *)0x17);
          }
        }
        else
        {
LABEL_40:
          v35 = objc_alloc_init(NEIKEv2Server);
          objc_setProperty_atomic((id)a1, v36, v35, 128);

          v37 = [NEIKEv2MOBIKE alloc];
          Property = objc_getProperty((id)a1, v38, 264, 1);
          v40 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v37->super.isa, Property, (void *)a1);
          objc_setProperty_atomic((id)a1, v41, v40, 168);

          objc_msgSend((id)a1, "protocolConfiguration");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "serverAddress");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_getProperty((id)a1, v44, 128, 1);
          if (v45)
            objc_setProperty_atomic(v45, v46, v43, 16);

          objc_msgSend(objc_getProperty((id)a1, v47, 208, 1), "scopedInterface");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_getProperty((id)a1, v49, 208, 1);
          if (v48)
            objc_msgSend(v50, "scopedInterface");
          else
            objc_msgSend(v50, "interface");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(a1 + 248) = objc_msgSend(v51, "interfaceIndex");

          *(_QWORD *)(a1 + 256) = objc_msgSend(objc_getProperty((id)a1, v52, 208, 1), "status");
          v55[0] = MEMORY[0x1E0C809B0];
          v55[1] = 3221225472;
          v55[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_93;
          v55[3] = &unk_1E3CC1408;
          v55[4] = a1;
          -[NEIKEv2PacketTunnelProvider resolveServerAddressIfNeeded:]((_QWORD *)a1, v55);
        }

      }
    }
  }
LABEL_10:

}

void __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke(uint64_t a1, const char *a2)
{
  NSObject *Property;
  uint64_t v4;
  _QWORD block[5];

  Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, a2, 264, 1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke_2;
  block[3] = &unk_1E3CC41F0;
  block[4] = v4;
  dispatch_async(Property, block);
}

- (void)stopIKEv2TunnelWithReason:(void *)a3 completionHandler:
{
  void (**v5)(_QWORD);
  NSObject *v6;
  SEL v7;
  id Property;
  const char *v9;
  const char *v10;
  SEL v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  SEL v18;
  id v19;
  void *v20;
  SEL v21;
  _QWORD v22[5];
  void (**v23)(_QWORD);
  _BYTE buf[24];
  void *v25;
  _BYTE *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@: Stopping IKEv2 Tunnel with reason %ld", buf, 0x16u);
    }

    Property = objc_getProperty(a1, v7, 128, 1);
    if (Property)
      objc_setProperty_atomic(Property, v9, 0, 64);
    if (objc_getProperty(a1, v9, 240, 1))
    {
      -[NEIKEv2PacketTunnelProvider reset:]((uint64_t)a1, 0);
      if (objc_getProperty(a1, v11, 240, 1))
      {
        if ((a1[42] & 1) != 0)
        {
          ne_log_obj();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = a1;
            _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEFAULT, "%@: tunnelTeardown (graceful) - Clearing tunnel configuration", buf, 0xCu);
          }

          objc_msgSend(a1, "setTunnelNetworkSettings:completionHandler:", 0, 0);
          ne_log_obj();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = a1;
            _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEFAULT, "%@: tunnelTeardown (graceful) - Invalidating session", buf, 0xCu);
          }

          v19 = objc_getProperty(a1, v18, 240, 1);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __45__NEIKEv2PacketTunnelProvider_tunnelTeardown__block_invoke;
          v25 = &unk_1E3CC41F0;
          v26 = a1;
          objc_msgSend(v19, "invalidateWithCompletionHandler:completionHandler:", 1, buf);
        }
        else
        {
          objc_msgSend(objc_getProperty(a1, v12, 240, 1), "invalidate");
          ne_log_obj();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_getProperty(a1, v14, 240, 1);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            _os_log_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEFAULT, "%@: Invalidated session (%@)", buf, 0x16u);
          }

        }
      }
      if ((a1[42] & 1) != 0)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __75__NEIKEv2PacketTunnelProvider_stopIKEv2TunnelWithReason_completionHandler___block_invoke;
        v22[3] = &unk_1E3CC46A8;
        v22[4] = a1;
        v23 = v5;
        v20 = _Block_copy(v22);
        objc_setProperty_atomic_copy(a1, v21, v20, 184);

        goto LABEL_22;
      }
      objc_setProperty_atomic(a1, v12, 0, 240);
    }
    -[NEIKEv2PacketTunnelProvider invalidateCompanionProxyDatapath](a1, v10);
    if (v5)
      v5[2](v5);
  }
LABEL_22:

}

- (void)handleInterfaceDown
{
  _BYTE *v1;
  NSObject *v2;
  _QWORD v3[5];
  _QWORD v4[5];
  id v5;
  uint8_t buf[4];
  _BYTE *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__11403;
  v4[4] = __Block_byref_object_dispose__11404;
  v1 = a1;
  v5 = v1;
  v1[77] = 1;
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v1;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel since interface is down", buf, 0xCu);
  }

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke;
  v3[3] = &unk_1E3CC14A8;
  v3[4] = v4;
  objc_msgSend(v1, "setTunnelNetworkSettings:completionHandler:", 0, v3);
  _Block_object_dispose(v4, 8);

}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  NSObject *Property;
  _QWORD block[5];

  v3 = *(_QWORD *)(a1 + 32);
  Property = *(NSObject **)(*(_QWORD *)(v3 + 8) + 40);
  if (Property)
  {
    Property = objc_getProperty(Property, a2, 264, 1);
    v3 = *(_QWORD *)(a1 + 32);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_2;
  block[3] = &unk_1E3CC1480;
  block[4] = v3;
  dispatch_async(Property, block);
}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_BYTE **)(*(_QWORD *)(v1 + 8) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_3;
  v3[3] = &unk_1E3CC1480;
  v3[4] = v1;
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v2, 3, v3);
}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_3(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (const char *)4);
}

- (void)invokeCancelTunnel:(_BYTE *)a1
{
  int v2;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (int)a2;
    a1[77] = 1;
    objc_setProperty_atomic(a1, a2, 0, 216);
    -[NEIKEv2PacketTunnelProvider stopObserving](a1);
    NEResourcesCopyLocalizedNSString(CFSTR("VPN_HEADER"), CFSTR("VPN_HEADER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = 0;
    switch(v2)
    {
      case 4:
        v7 = CFSTR("VPN Error 5");
        goto LABEL_14;
      case 5:
      case 6:
      case 8:
      case 9:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 19:
      case 21:
      case 22:
        break;
      case 7:
      case 18:
      case 28:
        v7 = CFSTR("VPN Error 1");
        goto LABEL_14;
      case 10:
        v7 = CFSTR("VPN Error 6");
        goto LABEL_14;
      case 17:
        v7 = CFSTR("VPN Error 4");
        goto LABEL_14;
      case 20:
        v7 = CFSTR("VPN Error 8");
        goto LABEL_14;
      case 23:
        v7 = CFSTR("VPN Error 14");
        goto LABEL_14;
      case 24:
      case 25:
        v7 = CFSTR("VPN Error 3");
        goto LABEL_14;
      case 26:
        v7 = CFSTR("VPN Error 20");
        goto LABEL_14;
      case 27:
        v7 = CFSTR("VPN Error 21");
        goto LABEL_14;
      case 29:
        v7 = CFSTR("VPN Error 22");
        goto LABEL_14;
      case 30:
        v7 = CFSTR("VPN Error 23");
LABEL_14:
        NEResourcesCopyLocalizedNSString(v7, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v5 = (void *)v8;
        v6 = 0;
        if (v4 && v8)
        {
          v9 = *MEMORY[0x1E0CB2D50];
          v11[0] = CFSTR("LocalizedHeader");
          v11[1] = v9;
          v12[0] = v4;
          v12[1] = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        break;
      default:
        v6 = 0;
        break;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IKEv2ProviderDisconnectionErrorDomain"), v2, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:]((uint64_t)a1, v10) & 1) == 0)
      objc_msgSend(a1, "cancelTunnelWithError:", v10);

  }
}

- (_BYTE)stopObserving
{
  _BYTE *v1;

  if (result)
  {
    v1 = result;
    if ((result[81] & 1) != 0)
    {
      objc_msgSend(result, "removeObserver:forKeyPath:", result, CFSTR("protocolConfiguration"));
      result = (_BYTE *)objc_msgSend(v1, "removeObserver:forKeyPath:", v1, CFSTR("defaultPath"));
      v1[81] = 0;
    }
  }
  return result;
}

- (uint64_t)invokeStartTunnelCompletionHandler:(uint64_t)a1
{
  const char *v3;
  id v4;
  const char *v5;
  void (**Property)(id, id);
  SEL v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    if (objc_getProperty((id)a1, v3, 176, 1))
    {
      Property = (void (**)(id, id))objc_getProperty((id)a1, v5, 176, 1);
      Property[2](Property, v4);
      objc_setProperty_atomic_copy((id)a1, v7, 0, 176);
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412546;
        v11 = a1;
        v12 = 2080;
        v13 = "-[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:]";
        _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: %s: Invoked start tunnel completion handler", (uint8_t *)&v10, 0x16u);
      }

      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

uint64_t __75__NEIKEv2PacketTunnelProvider_stopIKEv2TunnelWithReason_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t result;

  -[NEIKEv2PacketTunnelProvider invalidateCompanionProxyDatapath](*(void **)(a1 + 32), a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invalidateCompanionProxyDatapath
{
  const char *v3;
  os_unfair_lock_s *Property;
  const char *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_getProperty(a1, a2, 232, 1))
  {
    Property = (os_unfair_lock_s *)objc_getProperty(a1, v3, 232, 1);
    if (Property)
    {
      v6 = (uint64_t)Property;
      v7 = Property + 3;
      os_unfair_lock_lock(Property + 3);
      objc_storeWeak((id *)(v6 + 88), 0);
      if (*(_BYTE *)(v6 + 9) != 3)
      {
        ne_log_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 138412290;
          v10 = v6;
          _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: cancel", (uint8_t *)&v9, 0xCu);
        }

        -[NEIKEv2CompanionDatapath cancelLocked](v6);
      }
      os_unfair_lock_unlock(v7);
    }
    objc_setProperty_atomic(a1, v5, 0, 232);
  }
}

void __45__NEIKEv2PacketTunnelProvider_tunnelTeardown__block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void (**Property)(void);
  const char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 184, 1))
  {
    Property = *(void (***)(void))(a1 + 32);
    if (Property)
      Property = (void (**)(void))objc_getProperty(Property, v4, 184, 1);
    Property[2]();
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_setProperty_atomic_copy(v7, v6, 0, 184);
  }
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = objc_getProperty(*(id *)(a1 + 32), v9, 240, 1);
    else
      v11 = 0;
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: tunnelTeardown (graceful) - Invalidated session (%@)", (uint8_t *)&v14, 0x16u);
  }

  v13 = *(void **)(a1 + 32);
  if (v13)
    objc_setProperty_atomic(v13, v12, 0, 240);
}

void __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke_2(uint64_t a1)
{
  const char *v2;
  NEIKEv2MOBIKE *v3;
  void *v4;
  id Property;
  void *v6;
  const char *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = [NEIKEv2MOBIKE alloc];
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    Property = objc_getProperty(v4, v2, 264, 1);
    v6 = *(void **)(a1 + 32);
  }
  else
  {
    v6 = 0;
    Property = 0;
  }
  v8 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v3->super.isa, Property, v6);
  v9 = *(void **)(a1 + 32);
  if (v9)
    objc_setProperty_atomic(v9, v7, v8, 168);

  v10 = -[NEIKEv2PacketTunnelProvider tunnelBringup](*(_QWORD *)(a1 + 32));
  if ((_DWORD)v10)
  {
    v11 = (const char *)v10;
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v13;
      v16 = 2080;
      v17 = "-[NEIKEv2PacketTunnelProvider handleInterfaceChange:]_block_invoke_2";
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "%@: %s: Failed tunnel bringup on new path", (uint8_t *)&v14, 0x16u);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v11);
  }
}

- (uint64_t)tunnelBringup
{
  _QWORD *v1;
  uint64_t v2;
  const char *v3;
  void *v4;
  SEL v5;
  id Property;
  uint64_t v7;
  id v8;
  SEL v9;
  id v10;
  SEL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NEIKEv2IKESAConfiguration *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  BOOL v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  NEIKEv2ChildSAConfiguration *v54;
  NEIKEv2TrafficSelector *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NEIKEv2TrafficSelector *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  BOOL v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  SEL v78;
  id v79;
  id v80;
  id v81;
  NEIKEv2SessionConfiguration *v82;
  const __CFString *v83;
  NSObject *v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  __CFString *v89;
  char *v90;
  uint64_t v91;
  __CFString *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  __CFString *v99;
  char *v100;
  uint64_t v101;
  __CFString *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  NEIKEv2AuthenticationProtocol *v107;
  NEIKEv2AuthenticationProtocol *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  BOOL v113;
  void *v114;
  void *v115;
  void *v116;
  BOOL v117;
  const char *v118;
  void *v119;
  id v120;
  void *v121;
  BOOL v122;
  const char *v123;
  id v124;
  void *v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  NSObject *v132;
  void *v133;
  BOOL v134;
  uint64_t v135;
  void *v136;
  BOOL v137;
  void *v138;
  void *v139;
  BOOL v140;
  void *v141;
  void *v142;
  BOOL v143;
  void *v144;
  void *v145;
  BOOL v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  NEIKEv2IPv6SubnetAttribute *v155;
  void *v156;
  NEIKEv2IPv6SubnetAttribute *v157;
  id v158;
  id v159;
  id v160;
  NEIKEv2ConfigurationMessage *v161;
  const char *v162;
  NEIKEv2ConfigurationMessage *v163;
  void *v164;
  const char *v165;
  void *v166;
  id v167;
  id v168;
  void *v169;
  BOOL v170;
  void *v171;
  const char *v172;
  void *v173;
  id v174;
  id v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  NSObject *v181;
  void *v182;
  void *v183;
  void *v184;
  BOOL v185;
  void *v186;
  NSObject *v187;
  uint64_t Socket;
  NEIPSecSAKernelSession *v189;
  NEIKEv2Session *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  NEIKEv2Session *v194;
  SEL v195;
  SEL v196;
  NSObject *v197;
  const char *v198;
  id v199;
  SEL v200;
  id v201;
  uint64_t v202;
  SEL v203;
  id v204;
  SEL v205;
  id v206;
  SEL v207;
  id v208;
  const char *v209;
  _DWORD *v210;
  _BOOL4 v211;
  NSObject *v212;
  const char *v213;
  id v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  int v218;
  void *v219;
  char v220;
  const char *v221;
  _QWORD *v222;
  NSObject *v223;
  const char *v224;
  NSObject *v225;
  id *v227;
  id *v228;
  id v229;
  char v230;
  NSObject *oslog;
  _QWORD v233[4];
  id v234;
  id location;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  _QWORD v240[4];
  id v241;
  _QWORD v242[4];
  id v243;
  _QWORD v244[4];
  id v245;
  uint8_t v246[8];
  uint64_t v247;
  void (*v248)(uint64_t, int, void *, void *);
  void *v249;
  id v250[2];
  uint8_t v251[8];
  uint64_t v252;
  void (*v253)(uint64_t, void *);
  void *v254;
  id v255;
  id from;
  _BYTE buf[24];
  void *v258;
  uint64_t v259;
  id v260[15];

  v260[12] = *(id *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "packetFlow");
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v1)
      v2 = v1[11];
    else
      v2 = 0;
    *(_QWORD *)(a1 + 120) = v2;

    if (!*(_QWORD *)(a1 + 120))
    {
      ne_log_obj();
      oslog = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a1;
        _os_log_error_impl(&dword_19BD16000, oslog, OS_LOG_TYPE_ERROR, "%@: null virtualInterface, skip tunnel bringup", buf, 0xCu);
      }
      v22 = 10;
      goto LABEL_254;
    }
    -[NEIKEv2PacketTunnelProvider configureProxyPathIfNeeded]((void *)a1, v3);
    objc_msgSend((id)a1, "protocolConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    Property = objc_getProperty((id)a1, v5, 208, 1);
    v7 = *(_QWORD *)(a1 + 248);
    v8 = Property;
    v10 = objc_getProperty((id)a1, v9, 112, 1);
    v12 = objc_getProperty((id)a1, v11, 128, 1);
    v13 = v4;
    v228 = (id *)v8;
    v14 = v10;
    v15 = v12;
    objc_opt_self();
    if (NEInitCFTypes_onceToken != -1)
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
    if (v13)
    {
      v16 = objc_alloc_init(NEIKEv2IKESAConfiguration);
      if ((_DWORD)v7 && if_indextoname(v7, buf))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAConfiguration setOutgoingInterfaceName:](v16, "setOutgoingInterfaceName:", v17);

      }
      if (objc_msgSend(v13, "tunnelKind") == 2)
        -[NEIKEv2IKESAConfiguration setRandomizeLocalPort:](v16, "setRandomizeLocalPort:", 1);
      v19 = v15;
      if (v15)
      {
        if (objc_getProperty(v15, v18, 56, 1))
        {
          objc_msgSend(objc_getProperty(v15, v20, 56, 1), "port");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v21, "intValue"));
          v227 = (id *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v227 = 0;
        }
        v19 = v15;
      }
      else
      {
        v227 = 0;
      }
      v23 = (const __CFString *)-[NEIKEv2Server getViableServerAddressForPath:](v19, v228);
      v24 = NECreateAddressStructFromString(v23, (uint64_t)v227, 0);
      if (v24)
      {
        v25 = v24;
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAConfiguration setRemoteEndpoint:](v16, "setRemoteEndpoint:", v26);

        free(v25);
        if ((objc_msgSend(v13, "disableRedirect") & 1) == 0)
        {
          if (v15 && objc_getProperty(v15, v27, 32, 1))
          {
            v29 = (const __CFString *)objc_getProperty(v15, v28, 32, 1);
            v30 = NECreateAddressStructFromString(v29, 0, 0);
            if (v30)
            {
              v31 = v30;
              objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NEIKEv2IKESAConfiguration setRedirectedFromServer:](v16, "setRedirectedFromServer:", v32);

              free(v31);
            }
          }
          else
          {
            -[NEIKEv2IKESAConfiguration setAllowRedirect:](v16, "setAllowRedirect:", 1);
          }
        }
        *(_DWORD *)v251 = 0;
        v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v13, "IKESecurityAssociationParametersArray");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count") == 0;

        if (v36)
        {
          objc_msgSend(v13, "IKESecurityAssociationParameters");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]((uint64_t)NEIKEv2Helper, v13, v42, v14, (unsigned int *)v251);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
            objc_msgSend(v34, "addObject:", v37);
        }
        else
        {
          v238 = 0u;
          v239 = 0u;
          v236 = 0u;
          v237 = 0u;
          objc_msgSend(v13, "IKESecurityAssociationParametersArray");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v236, buf, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v237;
            do
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v237 != v39)
                  objc_enumerationMutation(v37);
                +[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]((uint64_t)NEIKEv2Helper, v13, *(void **)(*((_QWORD *)&v236 + 1) + 8 * i), v14, (unsigned int *)v251);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41)
                  objc_msgSend(v34, "addObject:", v41);

              }
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v236, buf, 16);
            }
            while (v38);
          }
        }

        if (objc_msgSend(v34, "count"))
        {
          -[NEIKEv2IKESAConfiguration setNonceSize:](v16, "setNonceSize:", *(unsigned int *)v251);
          -[NEIKEv2IKESAConfiguration setStrictNonceSizeChecks:](v16, "setStrictNonceSizeChecks:", 1);
          -[NEIKEv2IKESAConfiguration setProposals:](v16, "setProposals:", v34);
          objc_msgSend(v13, "ppkConfiguration");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v43;
          if (v43)
            v46 = objc_getProperty(v43, v44, 32, 1);
          else
            v46 = 0;
          v47 = v46;
          objc_msgSend(v47, "persistentReference");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48 == 0;

          if (!v49)
            -[NEIKEv2IKESAConfiguration setRequestPPK:](v16, "setRequestPPK:", 1);
          objc_opt_self();
          oslog = v16;
        }
        else
        {
          ne_log_obj();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v246 = 0;
            _os_log_error_impl(&dword_19BD16000, v50, OS_LOG_TYPE_ERROR, "empty ike proposals array", v246, 2u);
          }

          oslog = 0;
        }

      }
      else
      {
        ne_log_obj();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v228;
          _os_log_error_impl(&dword_19BD16000, v33, OS_LOG_TYPE_ERROR, "no viable server address found for path %@", buf, 0xCu);
        }

        oslog = 0;
      }

    }
    else
    {
      ne_log_obj();
      v16 = (NEIKEv2IKESAConfiguration *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, &v16->super, OS_LOG_TYPE_ERROR, "createIKESAConfigFromProtocol: null protocol", buf, 2u);
      }
      oslog = 0;
    }

    if (!oslog)
    {
      ne_log_obj();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a1;
        _os_log_error_impl(&dword_19BD16000, v73, OS_LOG_TYPE_ERROR, "%@: failed to create ikeConfig", buf, 0xCu);
      }
      v22 = 10;
      goto LABEL_253;
    }
    if (*(_QWORD *)(a1 + 224))
    {
      ne_log_obj();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[NEIKEv2PacketTunnelProvider tunnelBringup]";
        _os_log_impl(&dword_19BD16000, v51, OS_LOG_TYPE_DEFAULT, "%@: %s: Fallback to use random local port", buf, 0x16u);
      }

      -[NSObject setRandomizeLocalPort:](oslog, "setRandomizeLocalPort:", 1);
    }
    ne_log_large_obj();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = oslog;
      _os_log_debug_impl(&dword_19BD16000, v52, OS_LOG_TYPE_DEBUG, "%@: ikeConfig %@", buf, 0x16u);
    }

    objc_msgSend((id)a1, "protocolConfiguration");
    v53 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    if (NEInitCFTypes_onceToken == -1)
    {
      if (v53)
      {
LABEL_67:
        v54 = objc_alloc_init(NEIKEv2ChildSAConfiguration);
        -[NEIKEv2ChildSAConfiguration setMode:](v54, "setMode:", 2);
        v229 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v55 = objc_alloc_init(NEIKEv2TrafficSelector);
        v56 = NECreateAddressStructFromString(CFSTR("0.0.0.0"), 0, 0);
        v57 = NECreateAddressStructFromString(CFSTR("255.255.255.255"), 0, 0);
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setStartAddress:](v55, "setStartAddress:", v58);

        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setEndAddress:](v55, "setEndAddress:", v59);

        -[NEIKEv2TrafficSelector setStartPort:](v55, "setStartPort:", 0);
        -[NEIKEv2TrafficSelector setEndPort:](v55, "setEndPort:", 0xFFFFLL);
        -[NEIKEv2TrafficSelector setIpProtocol:](v55, "setIpProtocol:", 0);
        objc_msgSend(v229, "addObject:", v55);
        free(v56);
        free(v57);
        v60 = objc_alloc_init(NEIKEv2TrafficSelector);

        v61 = NECreateAddressStructFromString(CFSTR("::"), 0, 0);
        v62 = NECreateAddressStructFromString(CFSTR("ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"), 0, 0);
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setStartAddress:](v60, "setStartAddress:", v63);

        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setEndAddress:](v60, "setEndAddress:", v64);

        -[NEIKEv2TrafficSelector setStartPort:](v60, "setStartPort:", 0);
        -[NEIKEv2TrafficSelector setEndPort:](v60, "setEndPort:", 0xFFFFLL);
        -[NEIKEv2TrafficSelector setIpProtocol:](v60, "setIpProtocol:", 0);
        objc_msgSend(v229, "addObject:", v60);
        free(v61);
        free(v62);
        -[NEIKEv2ChildSAConfiguration setLocalTrafficSelectors:](v54, "setLocalTrafficSelectors:", v229);
        -[NEIKEv2ChildSAConfiguration setRemoteTrafficSelectors:](v54, "setRemoteTrafficSelectors:", v229);
        v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v53, "childSecurityAssociationParametersArray");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "count") == 0;

        if (v67)
        {
          objc_msgSend(v53, "childSecurityAssociationParameters");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          +[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]((uint64_t)NEIKEv2Helper, v53, v74);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          if (v68)
            objc_msgSend(v65, "addObject:", v68);
        }
        else
        {
          v238 = 0u;
          v239 = 0u;
          v236 = 0u;
          v237 = 0u;
          objc_msgSend(v53, "childSecurityAssociationParametersArray");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v236, buf, 16);
          if (v69)
          {
            v70 = *(_QWORD *)v237;
            do
            {
              for (j = 0; j != v69; ++j)
              {
                if (*(_QWORD *)v237 != v70)
                  objc_enumerationMutation(v68);
                +[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]((uint64_t)NEIKEv2Helper, v53, *(void **)(*((_QWORD *)&v236 + 1) + 8 * j));
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                if (v72)
                  objc_msgSend(v65, "addObject:", v72);

              }
              v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v236, buf, 16);
            }
            while (v69);
          }
        }

        if (objc_msgSend(v65, "count"))
        {
          -[NEIKEv2ChildSAConfiguration setProposals:](v54, "setProposals:", v65);
          -[NEIKEv2ChildSAConfiguration setOpportunisticPFS:](v54, "setOpportunisticPFS:", objc_msgSend(v53, "opportunisticPFS"));
          v73 = v54;
        }
        else
        {
          ne_log_obj();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v251 = 0;
            _os_log_error_impl(&dword_19BD16000, v75, OS_LOG_TYPE_ERROR, "empty child proposals array", v251, 2u);
          }

          v73 = 0;
        }

        goto LABEL_93;
      }
    }
    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
      if (v53)
        goto LABEL_67;
    }
    ne_log_obj();
    v54 = (NEIKEv2ChildSAConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v54->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, &v54->super, OS_LOG_TYPE_ERROR, "createIKEv2ChildSAConfigFromProtocol: null protocol", buf, 2u);
    }
    v73 = 0;
LABEL_93:

    if (!v73)
    {
      ne_log_obj();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a1;
        _os_log_error_impl(&dword_19BD16000, v84, OS_LOG_TYPE_ERROR, "%@: failed to create childConfig", buf, 0xCu);
      }
      v22 = 10;
      goto LABEL_252;
    }
    ne_log_large_obj();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v73;
      _os_log_debug_impl(&dword_19BD16000, v76, OS_LOG_TYPE_DEBUG, "%@: childConfig %@", buf, 0x16u);
    }

    objc_msgSend((id)a1, "protocolConfiguration");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_getProperty((id)a1, v78, 112, 1);
    v230 = *(_BYTE *)(a1 + 41);
    v80 = v77;
    v81 = v79;
    objc_opt_self();
    if (NEInitCFTypes_onceToken == -1)
    {
      if (v80)
        goto LABEL_98;
    }
    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
      if (v80)
      {
LABEL_98:
        v82 = objc_alloc_init(NEIKEv2SessionConfiguration);
        if (objc_msgSend(v80, "minimumTLSVersion") == 1)
        {
          v83 = CFSTR("1.0");
        }
        else if (objc_msgSend(v80, "minimumTLSVersion") == 2)
        {
          v83 = CFSTR("1.1");
        }
        else
        {
          if (objc_msgSend(v80, "minimumTLSVersion") != 3)
            goto LABEL_108;
          v83 = CFSTR("1.2");
        }
        -[NEIKEv2SessionConfiguration setTlsMinimumVersion:](v82, "setTlsMinimumVersion:", v83);
LABEL_108:
        if (objc_msgSend(v80, "maximumTLSVersion") == 1)
        {
          v85 = CFSTR("1.0");
        }
        else if (objc_msgSend(v80, "maximumTLSVersion") == 2)
        {
          v85 = CFSTR("1.1");
        }
        else
        {
          if (objc_msgSend(v80, "maximumTLSVersion") != 3)
            goto LABEL_115;
          v85 = CFSTR("1.2");
        }
        -[NEIKEv2SessionConfiguration setTlsMaximumVersion:](v82, "setTlsMaximumVersion:", v85);
LABEL_115:
        -[NEIKEv2SessionConfiguration setBlackholeDetectionEnabled:](v82, "setBlackholeDetectionEnabled:", v230 & 1);
        objc_msgSend(v80, "localIdentifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v86)
          goto LABEL_126;
        objc_msgSend(v80, "localIdentifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)NEIKEv2Helper, v87);

        if (v88 == 5)
        {
          objc_msgSend(v80, "localIdentifier");
          v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v90 = (char *)NECreateAddressStructFromString(v92, 0, 0);

          if (v90)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v90 + 8, 16);
            v91 = objc_claimAutoreleasedReturnValue();
            goto LABEL_122;
          }
        }
        else
        {
          if (v88 != 1)
          {
            objc_msgSend(v80, "localIdentifier");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "dataUsingEncoding:", 4);
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_125;
          }
          objc_msgSend(v80, "localIdentifier");
          v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v90 = (char *)NECreateAddressStructFromString(v89, 0, 0);

          if (v90)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v90 + 4, 4);
            v91 = objc_claimAutoreleasedReturnValue();
LABEL_122:
            v93 = (void *)v91;
            free(v90);
LABEL_125:
            v95 = +[NEIKEv2Identifier createIdentifierWithType:data:](NEIKEv2Identifier, "createIdentifierWithType:data:", v88, v93);
            -[NEIKEv2SessionConfiguration setLocalIdentifier:](v82, "setLocalIdentifier:", v95);

LABEL_126:
            objc_msgSend(v80, "remoteIdentifier");
            v96 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v96)
              goto LABEL_137;
            objc_msgSend(v80, "remoteIdentifier");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)NEIKEv2Helper, v97);

            if (v98 == 5)
            {
              objc_msgSend(v80, "remoteIdentifier");
              v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v100 = (char *)NECreateAddressStructFromString(v102, 0, 0);

              if (v100)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v100 + 8, 16);
                v101 = objc_claimAutoreleasedReturnValue();
                goto LABEL_133;
              }
            }
            else
            {
              if (v98 != 1)
              {
                objc_msgSend(v80, "remoteIdentifier");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "dataUsingEncoding:", 4);
                v103 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_136;
              }
              objc_msgSend(v80, "remoteIdentifier");
              v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v100 = (char *)NECreateAddressStructFromString(v99, 0, 0);

              if (v100)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v100 + 4, 4);
                v101 = objc_claimAutoreleasedReturnValue();
LABEL_133:
                v103 = (void *)v101;
                free(v100);
LABEL_136:
                v105 = +[NEIKEv2Identifier createIdentifierWithType:data:](NEIKEv2Identifier, "createIdentifierWithType:data:", v98, v103);
                -[NEIKEv2SessionConfiguration setRemoteIdentifier:](v82, "setRemoteIdentifier:", v105);

LABEL_137:
                v106 = objc_msgSend(v80, "authenticationMethod");
                if (v106 == 2)
                {
                  v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]([NEIKEv2AuthenticationProtocol alloc], "initWithMethod:", 2);
                }
                else if (v106 == 1)
                {
                  switch(objc_msgSend(v80, "certificateType"))
                  {
                    case 2:
                      v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]([NEIKEv2AuthenticationProtocol alloc], "initWithMethod:", 9);
                      break;
                    case 3:
                      v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]([NEIKEv2AuthenticationProtocol alloc], "initWithMethod:", 10);
                      break;
                    case 4:
                      v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]([NEIKEv2AuthenticationProtocol alloc], "initWithMethod:", 11);
                      break;
                    case 5:
                      v107 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:]([NEIKEv2AuthenticationProtocol alloc], "initWithDigitalSignature:", 3);
                      break;
                    case 6:
                      v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]([NEIKEv2AuthenticationProtocol alloc], "initWithMethod:", 245);
                      break;
                    case 7:
                      v107 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:]([NEIKEv2AuthenticationProtocol alloc], "initWithDigitalSignature:", 4);
                      break;
                    default:
                      v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]([NEIKEv2AuthenticationProtocol alloc], "initWithMethod:", 1);
                      break;
                  }
                }
                else
                {
                  v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]([NEIKEv2AuthenticationProtocol alloc], "initWithMethod:", 0);
                }
                v108 = v107;
                -[NEIKEv2SessionConfiguration setAuthenticationProtocol:](v82, "setAuthenticationProtocol:", v107);

                -[NEIKEv2SessionConfiguration authenticationProtocol](v82, "authenticationProtocol");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                v110 = (void *)objc_msgSend(v109, "copy");
                -[NEIKEv2SessionConfiguration setRemoteAuthentication:](v82, "setRemoteAuthentication:", v110);

                objc_msgSend(v80, "sharedSecretKeychainItem");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "persistentReference");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                v113 = v112 == 0;

                if (!v113)
                {
                  objc_msgSend(v80, "sharedSecretKeychainItem");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "persistentReference");
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2SessionConfiguration setSharedSecretReference:](v82, "setSharedSecretReference:", v115);

                }
                objc_msgSend(v80, "identityReferenceInternal");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                v117 = v116 == 0;

                if (!v117)
                {
                  objc_msgSend(v80, "identityReferenceInternal");
                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2SessionConfiguration setLocalCertificateReference:](v82, "setLocalCertificateReference:", v119);

                }
                v120 = objc_getProperty(v80, v118, 96, 1);
                objc_msgSend(v120, "keyPersistentReference");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                v122 = v121 == 0;

                if (!v122)
                {
                  v124 = objc_getProperty(v80, v123, 96, 1);
                  objc_msgSend(v124, "keyPersistentReference");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2SessionConfiguration setLocalCertificateKeyReference:](v82, "setLocalCertificateKeyReference:", v125);

                }
                v126 = objc_getProperty(v80, v123, 96, 1);
                -[NEIKEv2SessionConfiguration setLocalCertificateIsModernSystem:](v82, "setLocalCertificateIsModernSystem:", objc_msgSend(v126, "isModernSystem"));

                if (objc_msgSend(v80, "natKeepAliveOffloadEnable") == 2)
                {
                  -[NEIKEv2SessionConfiguration setNatTraversalKeepaliveOffloadEnabled:](v82, "setNatTraversalKeepaliveOffloadEnabled:", 1);
                  if (objc_msgSend(v80, "natKeepAliveOffloadInterval"))
                    -[NEIKEv2SessionConfiguration setNatTraversalKeepaliveOffloadInterval:](v82, "setNatTraversalKeepaliveOffloadInterval:", (int)objc_msgSend(v80, "natKeepAliveOffloadInterval"));
                }
                if (objc_msgSend(v80, "deadPeerDetectionRate"))
                {
                  v127 = objc_msgSend(v80, "deadPeerDetectionRate");
                  objc_opt_self();
                  v128 = v127 - 1;
                  if ((unint64_t)(v127 - 1) <= 2)
                  {
                    v129 = qword_19BED7168[v128];
                    v130 = dword_19BED7180[v128];
                    -[NEIKEv2SessionConfiguration setDeadPeerDetectionEnabled:](v82, "setDeadPeerDetectionEnabled:", 1);
                    -[NEIKEv2SessionConfiguration setDeadPeerDetectionMaxRetryCount:](v82, "setDeadPeerDetectionMaxRetryCount:", v130);
                    -[NEIKEv2SessionConfiguration setDeadPeerDetectionRetryIntervalMilliseconds:](v82, "setDeadPeerDetectionRetryIntervalMilliseconds:", 1000);
                    -[NEIKEv2SessionConfiguration setDeadPeerDetectionInterval:](v82, "setDeadPeerDetectionInterval:", v129);
                  }
                }
                if (objc_msgSend(v80, "disconnectOnIdle")
                  && objc_msgSend(v80, "disconnectOnIdleTimeout"))
                {
                  -[NEIKEv2SessionConfiguration setIdleTimeoutEnabled:](v82, "setIdleTimeoutEnabled:", 1);
                  v131 = (int)objc_msgSend(v80, "disconnectOnIdleTimeout");
                }
                else
                {
                  if ((v230 & 1) == 0 && objc_msgSend(v80, "tunnelKind") != 2)
                  {
LABEL_164:
                    if ((objc_msgSend(v80, "disableMOBIKE") & 1) == 0)
                      -[NEIKEv2SessionConfiguration setNegotiateMOBIKE:](v82, "setNegotiateMOBIKE:", 1);
                    if (objc_msgSend(v80, "enableRevocationCheck"))
                    {
                      -[NEIKEv2SessionConfiguration setEnableCertificateRevocationCheck:](v82, "setEnableCertificateRevocationCheck:", 1);
                      if (objc_msgSend(v80, "strictRevocationCheck"))
                        -[NEIKEv2SessionConfiguration setStrictCertificateRevocationCheck:](v82, "setStrictCertificateRevocationCheck:", 1);
                    }
                    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("AccountName"));
                    v133 = (void *)objc_claimAutoreleasedReturnValue();
                    v134 = v133 == 0;

                    if (v134)
                    {
                      objc_msgSend(v80, "username");
                      v136 = (void *)objc_claimAutoreleasedReturnValue();
                      v137 = v136 == 0;

                      if (v137)
                        goto LABEL_174;
                      objc_msgSend(v80, "username");
                      v135 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("AccountName"));
                      v135 = objc_claimAutoreleasedReturnValue();
                    }
                    v138 = (void *)v135;
                    -[NEIKEv2SessionConfiguration setUsername:](v82, "setUsername:", v135);

LABEL_174:
                    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("Password"));
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    v140 = v139 == 0;

                    if (v140)
                    {
                      objc_msgSend(v80, "passwordKeychainItem");
                      v182 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v182)
                        goto LABEL_177;
                      objc_msgSend(v80, "passwordKeychainItem");
                      v183 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v183, "persistentReference");
                      v184 = (void *)objc_claimAutoreleasedReturnValue();
                      v185 = v184 == 0;

                      if (v185)
                        goto LABEL_177;
                      objc_msgSend(v80, "passwordKeychainItem");
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v141, "persistentReference");
                      v186 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPasswordReference:](v82, "setPasswordReference:", v186);

                    }
                    else
                    {
                      objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("Password"));
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPassword:](v82, "setPassword:", v141);
                    }

LABEL_177:
                    objc_msgSend(v80, "serverCertificateCommonName");
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    v143 = v142 == 0;

                    if (!v143)
                    {
                      objc_msgSend(v80, "serverCertificateCommonName");
                      v144 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setRemoteCertificateHostname:](v82, "setRemoteCertificateHostname:", v144);

                    }
                    objc_msgSend(v80, "serverCertificateIssuerCommonName");
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    v146 = v145 == 0;

                    if (!v146)
                    {
                      objc_msgSend(v80, "serverCertificateIssuerCommonName");
                      v147 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setRemoteCertificateAuthorityName:](v82, "setRemoteCertificateAuthorityName:", v147);

                    }
                    if (objc_msgSend(v80, "disableInitialContact"))
                      -[NEIKEv2SessionConfiguration setInitialContactDisabled:](v82, "setInitialContactDisabled:", 1);
                    v148 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v149 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2IPv4AddressAttribute alloc], "initEmptyRequest");
                    objc_msgSend(v148, "addObject:", v149);

                    if (objc_msgSend(v80, "useConfigurationAttributeInternalIPSubnet"))
                    {
                      v150 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2IPv4SubnetAttribute alloc], "initEmptyRequest");
                      objc_msgSend(v148, "addObject:", v150);

                    }
                    v151 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2IPv4NetmaskAttribute alloc], "initEmptyRequest");
                    objc_msgSend(v148, "addObject:", v151);

                    v152 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2IPv4DHCPAttribute alloc], "initEmptyRequest");
                    objc_msgSend(v148, "addObject:", v152);

                    v153 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2IPv4DNSAttribute alloc], "initEmptyRequest");
                    objc_msgSend(v148, "addObject:", v153);

                    v154 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2IPv6AddressAttribute alloc], "initEmptyRequest");
                    objc_msgSend(v148, "addObject:", v154);

                    if (objc_msgSend(v80, "useConfigurationAttributeInternalIPSubnet"))
                    {
                      v155 = [NEIKEv2IPv6SubnetAttribute alloc];
                      objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("::"), CFSTR("0"));
                      v156 = (void *)objc_claimAutoreleasedReturnValue();
                      v157 = -[NEIKEv2SubnetAttribute initWithAddress:ipv4SubnetMask:](v155, "initWithAddress:ipv4SubnetMask:", v156, 0);
                      objc_msgSend(v148, "addObject:", v157);

                    }
                    v158 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2IPv6DHCPAttribute alloc], "initEmptyRequest");
                    objc_msgSend(v148, "addObject:", v158);

                    v159 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2IPv6DNSAttribute alloc], "initEmptyRequest");
                    objc_msgSend(v148, "addObject:", v159);

                    v160 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]([NEIKEv2DNSDomainAttribute alloc], "initEmptyRequest");
                    objc_msgSend(v148, "addObject:", v160);

                    v161 = objc_alloc_init(NEIKEv2ConfigurationMessage);
                    v163 = v161;
                    if (v161)
                    {
                      v161->_configurationType = 1;
                      objc_setProperty_atomic(v161, v162, v148, 16);
                    }
                    -[NEIKEv2SessionConfiguration setConfigurationRequest:](v82, "setConfigurationRequest:", v163);
                    objc_msgSend(v80, "ppkConfiguration");
                    v164 = (void *)objc_claimAutoreleasedReturnValue();
                    v166 = v164;
                    if (v164)
                      v167 = objc_getProperty(v164, v165, 32, 1);
                    else
                      v167 = 0;
                    v168 = v167;
                    objc_msgSend(v168, "persistentReference");
                    v169 = (void *)objc_claimAutoreleasedReturnValue();
                    v170 = v169 == 0;

                    if (!v170)
                    {
                      objc_msgSend(v80, "ppkConfiguration");
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      v173 = v171;
                      if (v171)
                        v174 = objc_getProperty(v171, v172, 32, 1);
                      else
                        v174 = 0;
                      v175 = v174;
                      objc_msgSend(v175, "persistentReference");
                      v176 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPpkReference:](v82, "setPpkReference:", v176);

                      objc_msgSend(v80, "ppkConfiguration");
                      v177 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v177, "identifier");
                      v178 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v178, "dataUsingEncoding:", 4);
                      v179 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPpkID:](v82, "setPpkID:", v179);

                      -[NEIKEv2SessionConfiguration setPpkIDType:](v82, "setPpkIDType:", 2);
                      objc_msgSend(v80, "ppkConfiguration");
                      v180 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPpkMandatory:](v82, "setPpkMandatory:", objc_msgSend(v180, "isMandatory"));

                    }
                    objc_opt_self();
                    v181 = v82;

                    v84 = v181;
                    goto LABEL_209;
                  }
                  ne_log_obj();
                  v132 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19BD16000, v132, OS_LOG_TYPE_INFO, "setting idle timeout", buf, 2u);
                  }

                  -[NEIKEv2SessionConfiguration setIdleTimeoutEnabled:](v82, "setIdleTimeoutEnabled:", 1);
                  v131 = 120;
                }
                -[NEIKEv2SessionConfiguration setIdleTimeoutSeconds:](v82, "setIdleTimeoutSeconds:", v131);
                goto LABEL_164;
              }
            }
            v103 = 0;
            goto LABEL_136;
          }
        }
        v93 = 0;
        goto LABEL_125;
      }
    }
    ne_log_obj();
    v181 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v181, OS_LOG_TYPE_ERROR, "createIKEv2SessionConfigFromProtocol: null protocol", buf, 2u);
    }
    v84 = 0;
LABEL_209:

    if (v84)
    {
      ne_log_large_obj();
      v187 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v187, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v84;
        _os_log_debug_impl(&dword_19BD16000, v187, OS_LOG_TYPE_DEBUG, "%@: sessionConfig %@", buf, 0x16u);
      }

      Socket = NEIKEv2PacketTunnelProviderGetSocket((void *)a1, 0, 0, 0, 0);
      if ((Socket & 0x80000000) == 0)
      {
        v189 = -[NEIPSecSAKernelSession initWithName:delegate:pfkeySocket:]([NEIPSecSAKernelSession alloc], "initWithName:delegate:pfkeySocket:", CFSTR("IKEv2 Session Database"), 0, Socket);
        if (v189)
        {
          objc_initWeak(&location, (id)a1);
          v190 = [NEIKEv2Session alloc];
          v191 = *(_QWORD *)(a1 + 264);
          v192 = *(_QWORD *)(a1 + 120);
          v193 = MEMORY[0x1E0C809B0];
          v233[0] = MEMORY[0x1E0C809B0];
          v233[1] = 3221225472;
          v233[2] = __44__NEIKEv2PacketTunnelProvider_tunnelBringup__block_invoke;
          v233[3] = &unk_1E3CC1458;
          objc_copyWeak(&v234, &location);
          v194 = -[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:packetDelegate:](v190, "initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:packetDelegate:", oslog, v73, v84, v191, v192, v233, v189, 0);
          objc_setProperty_atomic((id)a1, v195, v194, 240);

          if (!objc_getProperty((id)a1, v196, 240, 1))
          {
            ne_log_obj();
            v223 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = a1;
              _os_log_error_impl(&dword_19BD16000, v223, OS_LOG_TYPE_ERROR, "%@: Could not create session", buf, 0xCu);
            }
            v22 = 10;
            goto LABEL_250;
          }
          ne_log_obj();
          v197 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
          {
            v199 = objc_getProperty((id)a1, v198, 240, 1);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v199;
            _os_log_impl(&dword_19BD16000, v197, OS_LOG_TYPE_INFO, "%@: Created session (%@)", buf, 0x16u);
          }

          v201 = objc_getProperty((id)a1, v200, 240, 1);
          objc_msgSend(v201, "setClientCallbackInfo:", a1);

          v202 = *(_QWORD *)(a1 + 264);
          v204 = objc_getProperty((id)a1, v203, 240, 1);
          objc_msgSend(v204, "setClientQueue:", v202);

          objc_initWeak(&from, (id)a1);
          *(_QWORD *)buf = v193;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke;
          v258 = &unk_1E3CC1430;
          objc_copyWeak(v260, &from);
          v259 = a1;
          objc_msgSend(*(id *)(a1 + 240), "setStateUpdateBlock:", buf);
          *(_QWORD *)&v236 = v193;
          *((_QWORD *)&v236 + 1) = 3221225472;
          *(_QWORD *)&v237 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_108;
          *((_QWORD *)&v237 + 1) = &unk_1E3CC20F0;
          objc_copyWeak((id *)&v238, &from);
          objc_msgSend(*(id *)(a1 + 240), "setChildStateUpdateBlock:", &v236);
          *(_QWORD *)v251 = v193;
          v252 = 3221225472;
          v253 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_111;
          v254 = &unk_1E3CC2118;
          objc_copyWeak(&v255, &from);
          objc_msgSend(*(id *)(a1 + 240), "setConfigurationUpdateBlock:", v251);
          *(_QWORD *)v246 = v193;
          v247 = 3221225472;
          v248 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_113;
          v249 = &unk_1E3CC2140;
          objc_copyWeak(v250, &from);
          objc_msgSend(*(id *)(a1 + 240), "setTrafficSelectorUpdateBlock:", v246);
          v244[0] = v193;
          v244[1] = 3221225472;
          v244[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_115;
          v244[3] = &unk_1E3CC3BF0;
          objc_copyWeak(&v245, &from);
          objc_msgSend(*(id *)(a1 + 240), "setAdditionalAddressesUpdateBlock:", v244);
          v242[0] = v193;
          v242[1] = 3221225472;
          v242[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_117;
          v242[3] = &unk_1E3CC39A8;
          objc_copyWeak(&v243, &from);
          objc_msgSend(*(id *)(a1 + 240), "setShortDPDEventBlock:", v242);
          v240[0] = v193;
          v240[1] = 3221225472;
          v240[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_118;
          v240[3] = &unk_1E3CC2168;
          objc_copyWeak(&v241, &from);
          objc_msgSend(*(id *)(a1 + 240), "setRedirectEventBlock:", v240);
          objc_destroyWeak(&v241);
          objc_destroyWeak(&v243);
          objc_destroyWeak(&v245);
          objc_destroyWeak(v250);
          objc_destroyWeak(&v255);
          objc_destroyWeak((id *)&v238);
          objc_destroyWeak(v260);
          objc_destroyWeak(&from);
          v206 = objc_getProperty((id)a1, v205, 240, 1);
          objc_msgSend(v206, "connect");

          v208 = objc_getProperty((id)a1, v207, 240, 1);
          -[NEIKEv2Session firstChildSA](v208, v209);
          v210 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          if (v210)
          {
            v211 = v210[4] == 0;

            if (!v211)
            {
              ne_log_obj();
              v212 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v212, OS_LOG_TYPE_INFO))
              {
                v214 = objc_getProperty((id)a1, v213, 240, 1);
                -[NEIKEv2Session firstChildSA](v214, v215);
                v216 = objc_claimAutoreleasedReturnValue();
                v217 = (void *)v216;
                if (v216)
                  v218 = *(_DWORD *)(v216 + 16);
                else
                  v218 = 0;
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = a1;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v218;
                _os_log_impl(&dword_19BD16000, v212, OS_LOG_TYPE_INFO, "%@: Started Child Connection %X", buf, 0x12u);

              }
              objc_msgSend((id)a1, "protocolConfiguration");
              v219 = (void *)objc_claimAutoreleasedReturnValue();
              v220 = objc_msgSend(v219, "disableRedirect");

              if ((v220 & 1) == 0)
              {
                v222 = objc_getProperty((id)a1, v221, 128, 1);
                -[NEIKEv2Server startRedirectTimer](v222);

              }
              ne_log_obj();
              v223 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = a1;
                _os_log_impl(&dword_19BD16000, v223, OS_LOG_TYPE_DEFAULT, "%@ tunnel bringup requested", buf, 0xCu);
              }
              v22 = 0;
LABEL_250:

              objc_destroyWeak(&v234);
              objc_destroyWeak(&location);
              goto LABEL_251;
            }
          }
          else
          {

          }
          ne_log_obj();
          v223 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = a1;
            _os_log_error_impl(&dword_19BD16000, v223, OS_LOG_TYPE_ERROR, "%@: Could not start child", buf, 0xCu);
          }
          v22 = 7;
          goto LABEL_250;
        }
        ne_log_obj();
        v225 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v225, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = Socket;
          _os_log_fault_impl(&dword_19BD16000, v225, OS_LOG_TYPE_FAULT, "[NEIPSecSAKernelSession init pfkeySocket=%d] failed", buf, 8u);
        }

        v189 = 0;
LABEL_236:
        v22 = 10;
LABEL_251:

LABEL_252:
LABEL_253:

LABEL_254:
        return v22;
      }
      ne_log_obj();
      v189 = (NEIPSecSAKernelSession *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v189->super.super, OS_LOG_TYPE_ERROR))
        goto LABEL_236;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = a1;
      v224 = "%@ failed to get pfkey socket";
    }
    else
    {
      ne_log_obj();
      v189 = (NEIPSecSAKernelSession *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v189->super.super, OS_LOG_TYPE_ERROR))
        goto LABEL_236;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = a1;
      v224 = "%@: failed to create sessionConfig";
    }
    _os_log_error_impl(&dword_19BD16000, &v189->super.super, OS_LOG_TYPE_ERROR, v224, buf, 0xCu);
    goto LABEL_236;
  }
  return 0;
}

uint64_t __44__NEIKEv2PacketTunnelProvider_tunnelBringup__block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4, void *a5)
{
  const char *v8;
  id WeakRetained;
  id Property;
  const char *v11;
  id v12;
  id v13;
  SEL v14;
  _BYTE *v15;
  const char *v16;
  NSObject *v17;
  id v18;
  const char *v19;
  void *v20;
  dispatch_semaphore_t v21;
  NSObject *v22;
  const char *v23;
  NEIKEv2CompanionDatapath *v24;
  id *v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  SEL v33;
  SEL v34;
  os_unfair_lock_s *v35;
  uint64_t v36;
  os_unfair_lock_s *v37;
  NSObject *v38;
  dispatch_time_t v39;
  const char *v40;
  NSObject *v41;
  const char *v42;
  os_unfair_lock_s *v43;
  const char *v44;
  os_unfair_lock_s *v45;
  int connected_socket;
  os_unfair_lock_s *v47;
  const char *v48;
  os_unfair_lock_s *v49;
  id v50;
  void *v51;
  id v52;
  const char *v53;
  SEL v54;
  id v55;
  SEL v56;
  id v57;
  const char *v58;
  id v59;
  SEL v60;
  id v61;
  SEL v62;
  os_unfair_lock_s *v63;
  os_unfair_lock_s *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  id v71;
  const char *v72;
  id v73;
  char v74;
  id v75;
  SEL v76;
  id v77;
  const char *v78;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  dispatch_semaphore_t dsema;
  void *v86;
  void *v87;
  void *v88;
  unsigned int Socket;
  id location[2];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t v94[16];
  _BYTE buf[28];
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", a3);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
        goto LABEL_4;
    }
    else
    {
      v88 = 0;
      if (a4)
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", a4);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5)
        {
LABEL_5:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
LABEL_9:
        v87 = 0;
LABEL_10:
        Property = objc_getProperty(WeakRetained, v8, 128, 1);
        if (Property)
          Property = objc_getProperty(Property, v11, 56, 1);
        v12 = Property;

        if (!v12)
        {
          Socket = NEIKEv2PacketTunnelProviderGetSocket(WeakRetained, 1, a3, a4, a5);
          goto LABEL_78;
        }
        if (!v88)
        {
          ne_log_obj();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = WeakRetained;
            _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "%@: No local endpoint for proxy path", buf, 0xCu);
          }
          Socket = -1;
          goto LABEL_80;
        }
        objc_msgSend(v88, "port");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_getProperty(WeakRetained, v14, 128, 1);
        if (!v15 || (v15[8] & 1) == 0)
        {
          Socket = -1;
LABEL_77:

LABEL_78:
          ne_log_obj();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = WeakRetained;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = Socket;
            *(_WORD *)&buf[18] = 2112;
            *(_QWORD *)&buf[20] = v88;
            v96 = 2112;
            v97 = v86;
            v98 = 2112;
            v99 = v87;
            _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEFAULT, "%@: got socket (%d) for local %@ remote %@ interface %@", buf, 0x30u);
          }
LABEL_80:

          goto LABEL_81;
        }
        v18 = objc_getProperty(WeakRetained, v16, 128, 1);
        if (v18)
          v18 = objc_getProperty(v18, v19, 16, 1);
        v82 = v13;
        v83 = v18;
        objc_msgSend(MEMORY[0x1E0CCEC80], "endpointWithHostname:port:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = dispatch_semaphore_create(0);
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = WeakRetained;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v20;
          _os_log_impl(&dword_19BD16000, v22, OS_LOG_TYPE_DEFAULT, "%@: setting up companion proxy datapath to %@", buf, 0x16u);
        }

        -[NEIKEv2PacketTunnelProvider invalidateCompanionProxyDatapath](WeakRetained, v23);
        v24 = [NEIKEv2CompanionDatapath alloc];
        v84 = v20;
        dsema = v21;
        objc_initWeak(location, WeakRetained);
        if (v24)
        {
          *(_QWORD *)buf = v24;
          *(_QWORD *)&buf[8] = NEIKEv2CompanionDatapath;
          v25 = (id *)objc_msgSendSuper2((objc_super *)buf, sel_init);
          if (v25)
          {
            if (NEIKEv2CompanionDatapathCopyQueue_onceToken != -1)
              dispatch_once(&NEIKEv2CompanionDatapathCopyQueue_onceToken, &__block_literal_global_268);
            objc_storeStrong(v25 + 9, (id)NEIKEv2CompanionDatapathCopyQueue_queue);
            do
              v26 = __ldxr(&initWithRemoteEndpoint_completionSemaphore_provider__sNEIKEv2CmpnDatapathID);
            while (__stxr(v26 + 1, &initWithRemoteEndpoint_completionSemaphore_provider__sNEIKEv2CmpnDatapathID));
            v25[2] = (id)v26;
            *((_DWORD *)v25 + 3) = 0;
            objc_storeStrong(v25 + 7, v20);
            v27 = (void *)MEMORY[0x1E0CCEC80];
            v28 = v25[7];
            objc_msgSend(v28, "port");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "endpointWithHostname:port:", CFSTR("::"), v29);
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = v25[8];
            v25[8] = (id)v30;

            objc_storeStrong(v25 + 10, v21);
            v32 = objc_loadWeakRetained(location);
            objc_storeWeak(v25 + 11, v32);
          }
          else
          {
            ne_log_obj();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v94 = 0;
              _os_log_fault_impl(&dword_19BD16000, v32, OS_LOG_TYPE_FAULT, "[super init] failed", v94, 2u);
            }
            v25 = 0;
          }

        }
        else
        {
          v25 = 0;
        }
        objc_destroyWeak(location);

        objc_setProperty_atomic(WeakRetained, v33, v25, 232);
        v35 = (os_unfair_lock_s *)objc_getProperty(WeakRetained, v34, 232, 1);
        v36 = (uint64_t)v35;
        if (v35)
        {
          v37 = v35 + 3;
          os_unfair_lock_lock(v35 + 3);
          if (*(_QWORD *)(v36 + 56))
          {
            if (!*(_BYTE *)(v36 + 9))
            {
              *(_BYTE *)(v36 + 9) = 1;
              -[NEIKEv2CompanionDatapath setupConnectionLocked](v36);
            }
          }
          else
          {
            ne_log_obj();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19BD16000, v38, OS_LOG_TYPE_FAULT, "invalid remote endpoint", buf, 2u);
            }

          }
          os_unfair_lock_unlock(v37);
        }
        v39 = dispatch_time(0x8000000000000000, 10000000000);
        if (dispatch_semaphore_wait(dsema, v39))
        {
          ne_log_obj();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v80 = objc_getProperty(WeakRetained, v42, 232, 1);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = WeakRetained;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v80;
            _os_log_error_impl(&dword_19BD16000, v41, OS_LOG_TYPE_ERROR, "%@: timed out waiting for socket from %@", buf, 0x16u);
          }
          Socket = -1;
LABEL_76:

          v13 = v82;
          goto LABEL_77;
        }
        v43 = (os_unfair_lock_s *)objc_getProperty(WeakRetained, v40, 232, 1);
        v45 = v43;
        if (v43)
        {
          os_unfair_lock_lock(v43 + 3);
          if (BYTE1(v45[2]._os_unfair_lock_opaque) == 2)
          {
            connected_socket = nw_connection_get_connected_socket();
            Socket = dup(connected_socket);
            os_unfair_lock_unlock(v45 + 3);
            if ((Socket & 0x80000000) == 0)
            {
LABEL_48:
              v47 = (os_unfair_lock_s *)objc_getProperty(WeakRetained, v44, 232, 1);
              v49 = v47;
              if (v47)
              {
                os_unfair_lock_lock(v47 + 3);
                v50 = *(id *)&v49[10]._os_unfair_lock_opaque;
                v51 = v50;
                if (BYTE1(v49[2]._os_unfair_lock_opaque) == 3)
                {

                  v51 = 0;
                }
                os_unfair_lock_unlock(v49 + 3);
              }
              else
              {
                v51 = 0;
              }
              v52 = objc_getProperty(WeakRetained, v48, 128, 1);
              if (v52)
                objc_setProperty_atomic(v52, v53, v51, 64);

              v55 = objc_getProperty(WeakRetained, v54, 128, 1);
              v57 = objc_getProperty(WeakRetained, v56, 128, 1);
              if (v57)
                v57 = objc_getProperty(v57, v58, 64, 1);
              v59 = v57;
              v61 = objc_getProperty(WeakRetained, v60, 208, 1);
              -[NEIKEv2Server setServerResolvedAddress:path:](v55, v59, v61);

              v63 = (os_unfair_lock_s *)objc_getProperty(WeakRetained, v62, 232, 1);
              v64 = v63;
              if (v63)
              {
                os_unfair_lock_lock(v63 + 3);
                v65 = *(id *)&v64[12]._os_unfair_lock_opaque;
                v41 = v65;
                if (BYTE1(v64[2]._os_unfair_lock_opaque) == 3)
                {

                  v41 = 0;
                }
                os_unfair_lock_unlock(v64 + 3);
              }
              else
              {
                v41 = 0;
              }
              if (-[NSObject count](v41, "count"))
              {
                v92 = 0u;
                v93 = 0u;
                *(_OWORD *)location = 0u;
                v91 = 0u;
                v41 = v41;
                v67 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", location, buf, 16);
                if (v67)
                {
                  v68 = *(_QWORD *)v91;
                  do
                  {
                    for (i = 0; i != v67; ++i)
                    {
                      if (*(_QWORD *)v91 != v68)
                        objc_enumerationMutation(v41);
                      v70 = (void *)*((_QWORD *)location[1] + i);
                      v71 = objc_getProperty(WeakRetained, v66, 128, 1);
                      if (v71)
                        v71 = objc_getProperty(v71, v72, 64, 1);
                      v73 = v71;
                      v74 = objc_msgSend(v70, "isEqualToString:", v73);

                      if ((v74 & 1) == 0)
                      {
                        v75 = objc_getProperty(WeakRetained, v66, 128, 1);
                        v77 = objc_getProperty(WeakRetained, v76, 208, 1);
                        -[NEIKEv2Server setServerResolvedAddress:path:](v75, v70, v77);

                      }
                    }
                    v67 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", location, buf, 16);
                  }
                  while (v67);
                }

              }
              goto LABEL_76;
            }
          }
          else
          {
            os_unfair_lock_unlock(v45 + 3);
            Socket = -1;
          }
          ne_log_obj();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v81 = objc_getProperty(WeakRetained, v78, 232, 1);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = WeakRetained;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v81;
            _os_log_error_impl(&dword_19BD16000, v41, OS_LOG_TYPE_ERROR, "%@: invalid socket from %@", buf, 0x16u);
          }
          goto LABEL_76;
        }
        Socket = 0;
        goto LABEL_48;
      }
    }
    v86 = 0;
    if (a5)
      goto LABEL_5;
    goto LABEL_9;
  }
  Socket = -1;
LABEL_81:

  return Socket;
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int *v14;
  uint64_t v15;
  __CFString *v16;
  SEL v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  id v21;
  __CFString *v22;
  const char *v23;
  NSObject *v24;
  __CFString *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  SEL v32;
  id Property;
  const char *v34;
  _QWORD *v35;
  uint64_t v36;
  const char *v37;
  NSObject *v38;
  NSObject *v39;
  _QWORD v40[4];
  _BYTE *v41;
  id v42;
  _BYTE buf[24];
  void *v44;
  _BYTE *v45;
  __CFString *v46;
  __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (WeakRetained)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = WeakRetained;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_getProperty(WeakRetained, v9, 240, 1);
      _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "%@: stateUpdateBlock callback: session (%X)", buf, 0x12u);
    }

    if (a2 == 2)
    {
      -[NEIKEv2PacketTunnelProvider setInterfaceAvailability]((uint64_t)WeakRetained);
      -[NEIKEv2PacketTunnelProvider watchIKESocketChange]((uint64_t)WeakRetained, v23);
      if ((*((_DWORD *)WeakRetained + 21) & 1) == 0)
      {
        ne_log_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = WeakRetained;
          _os_log_impl(&dword_19BD16000, v24, OS_LOG_TYPE_INFO, "%@: stateUpdateBlock callback: got IKE Connected", buf, 0xCu);
        }

        *((_DWORD *)WeakRetained + 21) |= 1u;
        -[NEIKEv2PacketTunnelProvider startRekeyTimer:](WeakRetained, 1);
        NEIKEv2PacketTunnelHandleConnected(WeakRetained);
      }
    }
    else
    {
      if (a2 != 3)
        goto LABEL_46;
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = WeakRetained;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v5;
        _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_INFO, "%@: stateUpdateBlock callback: got IKE Disconnected (%@)", buf, 0x16u);
      }

      v11 = *(_QWORD *)(a1 + 32);
      v12 = MEMORY[0x1E0C809B0];
      v13 = (_QWORD *)&unk_19BED5000;
      v14 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
      if (v11 && (*(_BYTE *)(v11 + 78) & 1) != 0)
        goto LABEL_43;
      objc_msgSend(v5, "code");
      v15 = objc_msgSend(v5, "code");
      v16 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB3940]);
      objc_msgSend(objc_getProperty(WeakRetained, v17, 208, 1), "scopedInterface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "type");

      if (v19 <= 4)
      {
        v20 = off_1E3CC1630[v19];

        v16 = v20;
      }
      v21 = objc_alloc_init(MEMORY[0x1E0CB3940]);
      v13 = &unk_19BED5000;
      v22 = (unint64_t)(v15 - 3) > 0xA ? CFSTR("PluginFailed") : off_1E3CC1658[v15 - 3];
      v14 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;

      *(_QWORD *)buf = v12;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __64__NEIKEv2PacketTunnelProvider_sendAnalyticsWithDisconnectError___block_invoke;
      v44 = &unk_1E3CC1588;
      v45 = WeakRetained;
      v46 = v16;
      v47 = v22;
      v25 = v16;
      AnalyticsSendEventLazy();

      v27 = *(_QWORD *)(a1 + 32);
      if (v27)
      {
        if ((*(_BYTE *)(v27 + 78) & 1) != 0)
          goto LABEL_43;
      }
      if ((WeakRetained[77] & 1) != 0)
        goto LABEL_43;
      if (-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses](WeakRetained, v26))
        goto LABEL_46;
      v28 = v5;
      v29 = v28;
      if (*((_QWORD *)WeakRetained + 28))
      {
        ne_log_obj();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = WeakRetained;
          _os_log_impl(&dword_19BD16000, v30, OS_LOG_TYPE_DEFAULT, "%@: Random Port Fallback counter exceeded max retry count", buf, 0xCu);
        }

        goto LABEL_42;
      }
      if ((WeakRetained[78] & 1) != 0 || objc_msgSend(v28, "code") != 3)
      {
LABEL_42:

LABEL_43:
        WeakRetained[v14[339]] = 1;
        ne_log_obj();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = WeakRetained;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = 14;
          _os_log_impl(&dword_19BD16000, v39, OS_LOG_TYPE_DEFAULT, "%@: stopping tunnel since IKE disconnected %ld", buf, 0x16u);
        }

        v40[0] = v12;
        v40[1] = v13[269];
        v40[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_106;
        v40[3] = &unk_1E3CC2F98;
        v41 = WeakRetained;
        v42 = v5;
        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v41, 14, v40);

        goto LABEL_46;
      }
      ne_log_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = WeakRetained;
        _os_log_impl(&dword_19BD16000, v31, OS_LOG_TYPE_DEFAULT, "%@: Random Port Fallback is enabled, bringing up tunnel with random local port", buf, 0xCu);
      }

      ++*((_QWORD *)WeakRetained + 28);
      Property = objc_getProperty(WeakRetained, v32, 128, 1);
      if (Property)
      {
        v35 = objc_getProperty(Property, v34, 24, 1);
        if (v35)
        {
          v35[3] = 0;
          v35[4] = 0;
        }
      }
      else
      {
        v35 = 0;
      }

      v36 = -[NEIKEv2PacketTunnelProvider tunnelBringup](WeakRetained);
      if ((_DWORD)v36)
      {
        v37 = (const char *)v36;
        ne_log_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = WeakRetained;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v37;
          _os_log_error_impl(&dword_19BD16000, v38, OS_LOG_TYPE_ERROR, "%@: Random Port Fallback failed to bringup tunnel, error %d", buf, 0x12u);
        }

        -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, v37);
      }

    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "stateUpdateBlock callback: provider is nil", buf, 2u);
    }

  }
LABEL_46:

}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_108(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  _DWORD *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  signed int v20;
  NSObject *v21;
  const char *v22;
  id Property;
  const char *v24;
  uint64_t v25;
  void *v26;
  int v27;
  const char *v28;
  NSObject *v29;
  _QWORD v30[4];
  _BYTE *v31;
  signed int v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  _WORD v36[9];

  *(_QWORD *)&v36[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    if (a2
      && ((v11 = objc_getProperty(WeakRetained, v9, 240, 1),
           -[NEIKEv2Session firstChildSA](v11, v12),
           (v13 = (_DWORD *)objc_claimAutoreleasedReturnValue()) == 0)
        ? (v14 = 0)
        : (v14 = v13[4]),
          v13,
          v14 != a2))
    {
      ne_log_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        Property = objc_getProperty((id)v10, v22, 240, 1);
        -[NEIKEv2Session firstChildSA](Property, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v25)
          v27 = *(_DWORD *)(v25 + 16);
        else
          v27 = 0;
        *(_DWORD *)buf = 138412802;
        v34 = v10;
        v35 = 1024;
        *(_DWORD *)v36 = a2;
        v36[2] = 1024;
        *(_DWORD *)&v36[3] = v27;
        _os_log_impl(&dword_19BD16000, v21, OS_LOG_TYPE_INFO, "%@: childStateUpdateBlock callback: childID (%X) mismatched provider childID (%X)", buf, 0x18u);

      }
    }
    else
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v10;
        v35 = 1024;
        *(_DWORD *)v36 = a2;
        _os_log_impl(&dword_19BD16000, v15, OS_LOG_TYPE_INFO, "%@: childStateUpdateBlock callback: childID (%X)", buf, 0x12u);
      }

      if (a3 == 2)
      {
        -[NEIKEv2PacketTunnelProvider setInterfaceAvailability](v10);
        -[NEIKEv2PacketTunnelProvider watchIKESocketChange](v10, v28);
        ne_log_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v10;
          _os_log_impl(&dword_19BD16000, v29, OS_LOG_TYPE_INFO, "%@: childStateUpdateBlock callback: got Child Connected", buf, 0xCu);
        }

        *(_DWORD *)(v10 + 84) |= 2u;
        -[NEIKEv2PacketTunnelProvider startRekeyTimer:]((_QWORD *)v10, 0);
        NEIKEv2PacketTunnelHandleConnected((void *)v10);
        *(_BYTE *)(v10 + 78) = 1;
      }
      else if (a3 == 3)
      {
        ne_log_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v34 = v10;
          v35 = 2112;
          *(_QWORD *)v36 = v7;
          _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_INFO, "%@: childStateUpdateBlock callback: got Child Disconnected (%@)", buf, 0x16u);
        }

        if ((~*(_DWORD *)(v10 + 84) & 0xF) == 0
          || !-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses]((_BYTE *)v10, v17))
        {
          *(_BYTE *)(v10 + 77) = 1;
          ne_log_obj();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v34 = v10;
            v35 = 2112;
            *(_QWORD *)v36 = v7;
            _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEFAULT, "%@: stopping tunnel since Child disconnected %@", buf, 0x16u);
          }

          v19 = objc_msgSend(v7, "code");
          if ((unint64_t)(v19 - 3) > 0xC)
            v20 = 3;
          else
            v20 = dword_19BED7108[v19 - 3];
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_109;
          v30[3] = &unk_1E3CC1388;
          v31 = (id)v10;
          v32 = v20;
          -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v31, v20, v30);

        }
      }
    }
  }

}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_111(uint64_t a1, void *a2)
{
  id v3;
  _DWORD *WeakRetained;
  NSObject *v5;
  const char *v6;
  id Property;
  id v8;
  SEL v9;
  int v10;
  _DWORD *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = WeakRetained;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: configurationUpdateBlock callback: %@", (uint8_t *)&v10, 0x16u);
    }

    WeakRetained[21] |= 4u;
    if (v3)
      Property = objc_getProperty(v3, v6, 16, 1);
    else
      Property = 0;
    v8 = Property;
    objc_setProperty_atomic(WeakRetained, v9, v8, 88);

  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_113(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _DWORD *WeakRetained;
  const char *v10;
  _DWORD *v11;
  id v12;
  const char *v13;
  _DWORD *v14;
  int v15;
  NSObject *v16;
  SEL v17;
  SEL v18;
  NSObject *v19;
  const char *v20;
  id Property;
  const char *v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  _DWORD *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (a2
      && ((v12 = objc_getProperty(WeakRetained, v10, 240, 1),
           -[NEIKEv2Session firstChildSA](v12, v13),
           (v14 = (_DWORD *)objc_claimAutoreleasedReturnValue()) == 0)
        ? (v15 = 0)
        : (v15 = v14[4]),
          v14,
          v15 != a2))
    {
      ne_log_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        Property = objc_getProperty(v11, v20, 240, 1);
        -[NEIKEv2Session firstChildSA](Property, v22);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = *(_DWORD *)(v23 + 16);
        else
          v25 = 0;
        v26 = 138412802;
        v27 = v11;
        v28 = 1024;
        v29 = a2;
        v30 = 1024;
        LODWORD(v31) = v25;
        _os_log_impl(&dword_19BD16000, v19, OS_LOG_TYPE_INFO, "%@: trafficSelectorUpdateBlock callback: childID (%X) mismatched provider childID (%X)", (uint8_t *)&v26, 0x18u);

      }
    }
    else
    {
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v26 = 138413058;
        v27 = v11;
        v28 = 1024;
        v29 = a2;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v8;
        _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_INFO, "%@: trafficSelectorUpdateBlock callback: childID (%X) - localTrafficSelectors %@ remoteTrafficSelectors %@", (uint8_t *)&v26, 0x26u);
      }

      v11[21] |= 8u;
      objc_setProperty_atomic(v11, v17, v7, 96);
      objc_setProperty_atomic(v11, v18, v8, 104);
    }
  }

}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_115(uint64_t a1, void *a2)
{
  char *v3;
  id WeakRetained;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  SEL v18;
  id Property;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  SEL v23;
  id v24;
  const char *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v32 = WeakRetained;
      v33 = 2112;
      v34 = v3;
      _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: additionalAddressesUpdateBlock callback: %@", buf, 0x16u);
    }

    v6 = v3;
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, buf, 16);
      if (!v10)
        goto LABEL_17;
      v11 = v10;
      v12 = *(_QWORD *)v28;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v14, "addressFamily", (_QWORD)v27) == 2)
          {
            objc_msgSend(v14, "hostname");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v7;
          }
          else
          {
            if (objc_msgSend(v14, "addressFamily") != 30)
              continue;
            objc_msgSend(v14, "hostname");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v8;
          }
          -[NSObject addObject:](v16, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, buf, 16);
        if (!v11)
        {
LABEL_17:

          v17 = -[NSObject count](v7, "count");
          Property = objc_getProperty(WeakRetained, v18, 128, 1);
          if (Property)
          {
            if (v17)
              v21 = v7;
            else
              v21 = 0;
            objc_setProperty_atomic(Property, v20, v21, 40);
          }
          v22 = -[NSObject count](v8, "count", (_QWORD)v27);
          v24 = objc_getProperty(WeakRetained, v23, 128, 1);
          if (v24)
          {
            if (v22)
              v26 = v8;
            else
              v26 = 0;
            objc_setProperty_atomic(v24, v25, v26, 48);
          }

          goto LABEL_30;
        }
      }
    }
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v32 = WeakRetained;
      v33 = 2080;
      v34 = "-[NEIKEv2PacketTunnelProvider handleAdditionalServerAddressesNotification:]";
      _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "%@: %s: Empty address array", buf, 0x16u);
    }
LABEL_30:

  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_117(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_INFO, "%@: shortDPDEventBlock callback:", (uint8_t *)&v3, 0xCu);
    }

  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  _DWORD *Property;
  const char *v13;
  unsigned int v14;
  NSObject *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  SEL v19;
  id v20;
  const char *v21;
  id v22;
  SEL v23;
  id v24;
  const char *v25;
  SEL v26;
  id v27;
  const char *v28;
  id v29;
  const char *v30;
  id v31;
  const char *v32;
  void *v33;
  SEL v34;
  id v35;
  const char *v36;
  SEL v37;
  id v38;
  const char *v39;
  id v40;
  NEIKEv2MOBIKE *v41;
  SEL v42;
  id v43;
  id *v44;
  SEL v45;
  SEL v46;
  id v47;
  const char *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _BYTE v54[24];
  void *v55;
  _BYTE *v56;
  uint8_t buf[4];
  _BYTE *v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v54 = 138412546;
      *(_QWORD *)&v54[4] = WeakRetained;
      *(_WORD *)&v54[12] = 2112;
      *(_QWORD *)&v54[14] = v3;
      _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: redirectEventBlock callback: %@", v54, 0x16u);
    }

    objc_msgSend(WeakRetained, "protocolConfiguration");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(WeakRetained, "protocolConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "disableRedirect");

      if (v9)
      {
        ne_log_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v54 = 138412290;
          *(_QWORD *)&v54[4] = WeakRetained;
          _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_INFO, "%@: redirectEventBlock callback: received redirect but redirect is disabled", v54, 0xCu);
        }
        goto LABEL_42;
      }
    }
    v10 = v3;
    if (!v10)
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v58 = WeakRetained;
        v59 = 2080;
        v60 = "-[NEIKEv2PacketTunnelProvider handleRedirectNotification:]";
        _os_log_impl(&dword_19BD16000, v15, OS_LOG_TYPE_INFO, "%@: %s: No redirectServer received", buf, 0x16u);
      }
      goto LABEL_41;
    }
    Property = objc_getProperty(WeakRetained, v11, 128, 1);
    if (!Property)
    {
LABEL_42:

      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, (const char *)7);
      goto LABEL_43;
    }
    v14 = Property[3] + 1;
    Property[3] = v14;
    if (v14 >= 6)
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Exceeded max redirects in a specific time period", buf, 2u);
      }
LABEL_41:

      goto LABEL_42;
    }
    v16 = objc_getProperty(WeakRetained, v13, 128, 1);
    if (v16)
      v16 = objc_getProperty(v16, v17, 64, 1);
    v15 = v16;
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = WeakRetained;
      _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel due to Server Redirect", buf, 0xCu);
    }

    -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](WeakRetained, 0, 0);
    v20 = objc_getProperty(WeakRetained, v19, 128, 1);
    if (v20)
      v20 = objc_getProperty(v20, v21, 16, 1);
    v22 = v20;
    v24 = objc_getProperty(WeakRetained, v23, 128, 1);
    if (v24)
      objc_setProperty_atomic(v24, v25, v22, 32);

    v27 = objc_getProperty(WeakRetained, v26, 128, 1);
    if (v27)
      v27 = objc_getProperty(v27, v28, 56, 1);
    v29 = v27;

    if (v29)
    {
      v31 = objc_getProperty(WeakRetained, v30, 128, 1);
      if (v31)
        objc_setProperty_atomic(v31, v32, v15, 32);
    }
    -[NSObject hostname](v10, "hostname");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_getProperty(WeakRetained, v34, 128, 1);
    if (v35)
      objc_setProperty_atomic(v35, v36, v33, 16);

    v38 = objc_getProperty(WeakRetained, v37, 128, 1);
    if (v38)
      v38 = objc_getProperty(v38, v39, 16, 1);
    v40 = v38;

    if (!v40)
    {
      ne_log_obj();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = WeakRetained;
        _os_log_error_impl(&dword_19BD16000, v53, OS_LOG_TYPE_ERROR, "%@: Missing redirect information in notification", buf, 0xCu);
      }

      goto LABEL_41;
    }
    v41 = [NEIKEv2MOBIKE alloc];
    v43 = objc_getProperty(WeakRetained, v42, 264, 1);
    v44 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v41->super.isa, v43, WeakRetained);
    objc_setProperty_atomic(WeakRetained, v45, v44, 168);

    v47 = objc_getProperty(WeakRetained, v46, 128, 1);
    if (v47)
      objc_setProperty_atomic(v47, v48, 0, 24);
    *(_QWORD *)v54 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v54[8] = 3221225472;
    *(_QWORD *)&v54[16] = __58__NEIKEv2PacketTunnelProvider_handleRedirectNotification___block_invoke;
    v55 = &unk_1E3CC1408;
    v56 = WeakRetained;
    -[NEIKEv2PacketTunnelProvider resolveServerAddressIfNeeded:](WeakRetained, v54);
    v49 = *((_DWORD *)WeakRetained + 21);
    if ((~v49 & 0xF) == 0)
    {
      objc_msgSend(WeakRetained, "setReasserting:", 1);
      v49 = *((_DWORD *)WeakRetained + 21);
    }
    *((_DWORD *)WeakRetained + 21) = v49 & 0xFFFFFFF0;
    v50 = (void *)*((_QWORD *)WeakRetained + 11);
    *((_QWORD *)WeakRetained + 11) = 0;

    v51 = (void *)*((_QWORD *)WeakRetained + 12);
    *((_QWORD *)WeakRetained + 12) = 0;

    v52 = (void *)*((_QWORD *)WeakRetained + 13);
    *((_QWORD *)WeakRetained + 13) = 0;

  }
LABEL_43:

}

void __58__NEIKEv2PacketTunnelProvider_handleRedirectNotification___block_invoke(uint64_t a1, char a2)
{
  _BYTE *v3;
  const char *v4;

  v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = (const char *)-[NEIKEv2PacketTunnelProvider tunnelBringup](v3);
    if ((_DWORD)v4)
      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v4);
  }
  else
  {
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)0x11);
  }
}

- (void)resolveServerAddressIfNeeded:(_QWORD *)a1
{
  void (**v3)(id, uint64_t);
  const char *v4;
  SEL v5;
  id Property;
  const char *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  SEL v15;
  id v16;
  const char *v17;
  id v18;
  id v19;
  const char *v20;
  id v21;
  char v22;
  NSObject *v23;
  SEL v24;
  id v25;
  SEL v26;
  id v27;
  const char *v28;
  id v29;
  SEL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  SEL v35;
  id v36;
  const char *v37;
  id v38;
  void *v39;
  const char *v40;
  void *v41;
  SEL v42;
  id v43;
  NSObject *v44;
  const char *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  SEL v50;
  void *v51;
  SEL v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  id v64;
  const char *v65;
  id v66;
  int v67;
  _QWORD *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[NEIKEv2PacketTunnelProvider configureProxyPathIfNeeded](a1, v4);
  Property = objc_getProperty(a1, v5, 128, 1);
  if (Property)
    Property = objc_getProperty(Property, v7, 56, 1);
  v8 = Property;

  if (v8)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = objc_getProperty(a1, v11, 128, 1);
      if (v12)
        v12 = objc_getProperty(v12, v13, 16, 1);
      v14 = v12;
      v16 = objc_getProperty(a1, v15, 128, 1);
      if (v16)
        v16 = objc_getProperty(v16, v17, 56, 1);
      v18 = v16;
      v67 = 138412802;
      v68 = a1;
      v69 = 2112;
      v70 = v14;
      v71 = 2112;
      v72 = v18;
      _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_INFO, "%@: skipping resolution as server %@ uses proxy %@", (uint8_t *)&v67, 0x20u);

    }
LABEL_19:
    v3[2](v3, 1);
    goto LABEL_20;
  }
  v19 = objc_getProperty(a1, v9, 128, 1);
  if (v19)
    v19 = objc_getProperty(v19, v20, 16, 1);
  v21 = v19;
  v22 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)NEIKEv2Helper, v21);

  if ((v22 & 3) == 1)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v67 = 138412290;
      v68 = a1;
      _os_log_impl(&dword_19BD16000, v23, OS_LOG_TYPE_INFO, "%@: serverAddress IP address available", (uint8_t *)&v67, 0xCu);
    }

    v25 = objc_getProperty(a1, v24, 128, 1);
    v27 = objc_getProperty(a1, v26, 128, 1);
    if (v27)
      v27 = objc_getProperty(v27, v28, 16, 1);
    v29 = v27;
    v31 = objc_getProperty(a1, v30, 208, 1);
    -[NEIKEv2Server setServerResolvedAddress:path:](v25, v29, v31);

    goto LABEL_19;
  }
  v32 = _Block_copy(v3);
  v33 = (void *)a1[24];
  a1[24] = v32;

  v34 = (void *)MEMORY[0x1E0CCEC80];
  v36 = objc_getProperty(a1, v35, 128, 1);
  if (v36)
    v36 = objc_getProperty(v36, v37, 16, 1);
  v38 = v36;
  objc_msgSend(v34, "endpointWithHostname:port:", v38, CFSTR("500"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(objc_getProperty(a1, v40, 208, 1), "scopedInterface");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_getProperty(a1, v42, 208, 1);
    if (v41)
      objc_msgSend(v43, "scopedInterface");
    else
      objc_msgSend(v43, "interface");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "interfaceName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v48 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
      v49 = objc_alloc(MEMORY[0x1E0CCEC88]);
      objc_msgSend(objc_getProperty(a1, v50, 208, 1), "scopedInterface");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_getProperty(a1, v52, 208, 1);
      v54 = v53;
      if (v51)
        objc_msgSend(v53, "scopedInterface");
      else
        objc_msgSend(v53, "interface");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "interfaceName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)objc_msgSend(v49, "initWithInterfaceName:", v56);
      objc_msgSend(v48, "setRequiredInterface:", v57);

    }
    else
    {
      v48 = 0;
    }
    objc_msgSend(v48, "setIgnoreResolverStats:", 1);
    ne_log_obj();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v67 = 138412802;
      v68 = a1;
      v69 = 2112;
      v70 = v39;
      v71 = 2112;
      v72 = v48;
      _os_log_impl(&dword_19BD16000, v58, OS_LOG_TYPE_DEFAULT, "%@: Resolving %@ (%@)", (uint8_t *)&v67, 0x20u);
    }

    v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB8]), "initWithEndpoint:parameters:", v39, v48);
    v60 = (void *)a1[17];
    a1[17] = v59;

    v61 = (void *)a1[17];
    if (v61)
    {
      objc_msgSend(a1, "context");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObserver:forKeyPath:options:context:", v62, CFSTR("resolvedEndpoints"), 5, 0);

    }
    else
    {
      ne_log_obj();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v67 = 138412290;
        v68 = a1;
        _os_log_error_impl(&dword_19BD16000, v63, OS_LOG_TYPE_ERROR, "%@: Failed to create NWResolver", (uint8_t *)&v67, 0xCu);
      }

      v3[2](v3, 0);
    }

  }
  else
  {
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v64 = objc_getProperty(a1, v45, 128, 1);
      if (v64)
        v64 = objc_getProperty(v64, v65, 16, 1);
      v66 = v64;
      v67 = 138412546;
      v68 = a1;
      v69 = 2112;
      v70 = v66;
      _os_log_error_impl(&dword_19BD16000, v44, OS_LOG_TYPE_ERROR, "%@: Failed to create endpoint for resolution, serverAddress %@", (uint8_t *)&v67, 0x16u);

    }
    v3[2](v3, 0);
  }

LABEL_20:
}

- (BOOL)tryAlternateServerAddresses
{
  id v3;
  SEL v4;
  id Property;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  _BYTE *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_getProperty(a1, a2, 128, 1);
  Property = objc_getProperty(a1, v4, 208, 1);
  -[NEIKEv2Server getNextViableServerAddressForPath:](v3, Property);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v12 = a1;
      v13 = 2080;
      v14 = "-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses]";
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "%@: %s: Alternate server address available (%@), connect again", buf, 0x20u);
    }

    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = a1;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel before attempting alternate server address", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke;
    v10[3] = &unk_1E3CC41F0;
    v10[4] = a1;
    -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](a1, 0, v10);
  }

  return v6 != 0;
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_109(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), (const char *)*(unsigned int *)(a1 + 40));
}

- (void)setInterfaceAvailability
{
  int v2;
  int v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  __CFString *v13;
  __int16 v14;
  int v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 120))
  {
    v2 = socket(30, 2, 0);
    if ((v2 & 0x80000000) == 0)
    {
      v3 = v2;
      v4 = *(_QWORD *)(a1 + 120);
      if (v4)
        v5 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const char *)(v4 + 265), 0x600u);
      else
        v5 = 0;
      v16 = 0u;
      v17 = 0u;
      v6 = objc_retainAutorelease(v5);
      -[__CFString UTF8String](v6, "UTF8String");
      __strlcpy_chk();
      LOBYTE(v17) = 4;
      BYTE3(v17) = 0;
      v7 = ioctl(v3, 0xC02069A9uLL, &v16);
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 < 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v11 = a1;
          v12 = 2112;
          v13 = v6;
          _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "%@: Failed to set interface availability for %@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v11 = a1;
        v12 = 2112;
        v13 = v6;
        v14 = 1024;
        v15 = 0;
        _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "%@: Set interface availability on interface %@ to %u (0 implies 'available')", buf, 0x1Cu);
      }

      close(v3);
    }
  }
}

- (void)watchIKESocketChange
{
  id Property;
  const char *v4;
  id v5;
  const char *v6;
  void *v7;
  id v8;
  SEL v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  SEL v16;
  const char *v17;
  SEL v18;
  os_unfair_lock_s *v19;
  NSObject *v20;
  const char *v21;
  id v22;
  void *v23;
  void *v24;
  SEL v25;
  SEL v26;
  void *v27;
  SEL v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  Property = objc_getProperty((id)a1, a2, 240, 1);
  if (Property)
  {
    v5 = objc_getProperty(Property, v4, 336, 1);
    v7 = v5;
    if (v5)
      v5 = objc_getProperty(v5, v6, 64, 1);
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  v8 = v5;

  v10 = objc_getProperty((id)a1, v9, 240, 1);
  if (v10)
  {
    v12 = objc_getProperty(v10, v11, 336, 1);
    v14 = v12;
    if (v12)
      v12 = objc_getProperty(v12, v13, 72, 1);
  }
  else
  {
    v14 = 0;
    v12 = 0;
  }
  v15 = v12;

  if (objc_getProperty((id)a1, v16, 272, 1))
  {
    objc_msgSend(objc_getProperty((id)a1, v17, 272, 1), "removeObserver:forKeyPath:", a1, CFSTR("path"));
    objc_setProperty_atomic((id)a1, v18, 0, 272);
  }
  if (*(_QWORD *)(a1 + 248))
  {
    if (v8)
    {
      if (v15)
      {
        if ((*(_BYTE *)(a1 + 74) & 1) == 0
          || (v19 = (os_unfair_lock_s *)objc_getProperty((id)a1, v17, 232, 1),
              (-[NEIKEv2CompanionDatapath connected](v19) & 1) == 0))
        {
          ne_log_obj();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(objc_getProperty((id)a1, v21, 208, 1), "scopedInterface");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_getProperty((id)a1, v28, 208, 1);
            v30 = v29;
            if (v27)
              objc_msgSend(v29, "scopedInterface");
            else
              objc_msgSend(v29, "interface");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 136315906;
            v33 = "-[NEIKEv2PacketTunnelProvider watchIKESocketChange]";
            v34 = 2048;
            v35 = objc_msgSend(v31, "interfaceIndex");
            v36 = 2112;
            v37 = v8;
            v38 = 2112;
            v39 = v15;
            _os_log_debug_impl(&dword_19BD16000, v20, OS_LOG_TYPE_DEBUG, "%s: IKE is scoped on ifIndex %ld (local address %@, remote address %@)\n", (uint8_t *)&v32, 0x2Au);

          }
          v22 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC88]), "initWithInterfaceIndex:", *(_QWORD *)(a1 + 248));
          objc_msgSend(v22, "setRequiredInterface:", v23);

          objc_msgSend(v22, "setLocalAddress:", v8);
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB0]), "initWithEndpoint:parameters:", v15, v22);
          objc_setProperty_atomic((id)a1, v25, v24, 272);

          objc_msgSend(objc_getProperty((id)a1, v26, 272, 1), "addObserver:forKeyPath:options:context:", a1, CFSTR("path"), 5, 0);
        }
      }
    }
  }

}

- (void)startRekeyTimer:(_QWORD *)a1
{
  _BYTE *v4;
  char v5;
  NSObject *v6;
  const char *v7;
  _DWORD *v8;
  NEIKEv2Rekey *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  SEL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t v23[16];
  _BYTE buf[22];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "protocolConfiguration");
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4[247];

    if ((v5 & 1) != 0)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = "CHILD";
        if (a2)
          v7 = "IKE";
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@: startRekeyTimer (%s)", buf, 0x16u);
      }

      v8 = (_DWORD *)a1[19];
      if (!v8)
      {
        v9 = [NEIKEv2Rekey alloc];
        objc_msgSend(a1, "description");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          *(_QWORD *)buf = v9;
          *(_QWORD *)&buf[8] = NEIKEv2Rekey;
          v11 = objc_msgSendSuper2((objc_super *)buf, sel_init);
          if (v11)
          {
            v12 = v11;
            v13 = objc_msgSend(v10, "copy");
            objc_setProperty_atomic(v12, v14, v13, 32);
          }
          else
          {
            ne_log_obj();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v23 = 0;
              _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "[super init] failed", v23, 2u);
            }
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

        v15 = (void *)a1[19];
        a1[19] = v12;

        v8 = (_DWORD *)a1[19];
      }
      objc_msgSend(a1, "protocolConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (a2)
      {
        objc_msgSend(v16, "IKESecurityAssociationParameters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "lifetimeMinutes");
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke;
        v22[3] = &unk_1E3CC41F0;
        v22[4] = a1;
        -[NEIKEv2Rekey startIKETimer:timeoutHandler:](v8, v19, v22);
      }
      else
      {
        objc_msgSend(v16, "childSecurityAssociationParameters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "lifetimeMinutes");
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_149;
        v21[3] = &unk_1E3CC41F0;
        v21[4] = a1;
        -[NEIKEv2Rekey startChildTimer:timeoutHandler:](v8, v20, v21);
      }

    }
  }
  else
  {

  }
}

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke(uint64_t a1, const char *a2)
{
  NSObject *Property;
  uint64_t v4;
  _QWORD block[5];

  Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, a2, 264, 1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2;
  block[3] = &unk_1E3CC41F0;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_149(uint64_t a1, const char *a2)
{
  NSObject *Property;
  uint64_t v4;
  _QWORD block[5];

  Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, a2, 264, 1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2_150;
  block[3] = &unk_1E3CC41F0;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2_150(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  id v9;
  id Property;
  _DWORD *v11;
  int v12;
  const char *v13;
  id v14;
  const char *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (*(_BYTE *)(v2 + 77) & 1) == 0)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v20 = 138412290;
      v21 = v4;
      _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: REKEYING CHILD", (uint8_t *)&v20, 0xCu);
    }

    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v7 = objc_getProperty(v6, v5, 240, 1);
      if (v7)
      {
        v9 = v7;
        Property = *(id *)(a1 + 32);
        if (Property)
          Property = objc_getProperty(Property, v8, 240, 1);
        -[NEIKEv2Session firstChildSA](Property, v8);
        v11 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v11[4];

          if (!v12)
            return;
          v14 = *(id *)(a1 + 32);
          if (v14)
            v14 = objc_getProperty(v14, v13, 240, 1);
          v9 = v14;
          v16 = *(id *)(a1 + 32);
          if (v16)
            v16 = objc_getProperty(v16, v15, 240, 1);
          -[NEIKEv2Session firstChildSA](v16, v15);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = *(unsigned int *)(v17 + 16);
          else
            v19 = 0;
          objc_msgSend(v9, "forceRekeyChild:", v19);
        }
        else
        {
          v18 = 0;
        }

      }
    }
  }
}

_QWORD *__47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  id Property;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v1 = result;
  v10 = *MEMORY[0x1E0C80C00];
  v2 = result[4];
  if (!v2 || (*(_BYTE *)(v2 + 77) & 1) == 0)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v1[4];
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: REKEYING IKE", (uint8_t *)&v8, 0xCu);
    }

    result = (_QWORD *)v1[4];
    if (result)
    {
      result = objc_getProperty(result, v5, 240, 1);
      if (result)
      {
        Property = (id)v1[4];
        if (Property)
          Property = objc_getProperty(Property, v6, 240, 1);
        return (_QWORD *)objc_msgSend(Property, "forceRekeyIKE");
      }
    }
  }
  return result;
}

void __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke(uint64_t a1, const char *a2)
{
  NSObject *Property;
  uint64_t v4;
  _QWORD block[5];

  Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, a2, 264, 1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke_2;
  block[3] = &unk_1E3CC41F0;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  NEIKEv2MOBIKE *v5;
  void *v6;
  id Property;
  void *v8;
  const char *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v16 = 138412290;
    v17 = v3;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "%@: Bringing up tunnel with alternate server address", (uint8_t *)&v16, 0xCu);
  }

  v5 = [NEIKEv2MOBIKE alloc];
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    Property = objc_getProperty(v6, v4, 264, 1);
    v8 = *(void **)(a1 + 32);
  }
  else
  {
    v8 = 0;
    Property = 0;
  }
  v10 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v5->super.isa, Property, v8);
  v11 = *(void **)(a1 + 32);
  if (v11)
    objc_setProperty_atomic(v11, v9, v10, 168);

  v12 = -[NEIKEv2PacketTunnelProvider tunnelBringup](*(_QWORD *)(a1 + 32));
  if ((_DWORD)v12)
  {
    v13 = (const char *)v12;
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v15;
      v18 = 2080;
      v19 = "-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses]_block_invoke";
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@: %s: Failed tunnel Bringup with alternate server address", (uint8_t *)&v16, 0x16u);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v13);
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_106(uint64_t a1)
{
  _BYTE *v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE **)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 40), "code") - 3;
  if (v2 > 0xC)
    v3 = 3;
  else
    v3 = dword_19BED7108[v2];
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v1, (const char *)v3);
}

id __64__NEIKEv2PacketTunnelProvider_sendAnalyticsWithDisconnectError___block_invoke(_QWORD *a1)
{
  __CFString *v2;
  uint64_t info;
  const __CFString *v4;
  const char *v5;
  __CFString *v6;
  id Property;
  const char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("tunnelType");
  v2 = (__CFString *)a1[4];
  if (v2)
  {
    info = v2[6].info;
    v4 = &stru_1E3CC53C8;
    if (info == 2)
      v4 = CFSTR("Fallback Tunnel");
    if (info == 1)
      v2 = CFSTR("Primary Tunnel");
    else
      v2 = (__CFString *)v4;
  }
  v6 = v2;
  v15[0] = v6;
  v14[1] = CFSTR("serverAddress");
  Property = (id)a1[4];
  if (Property)
  {
    Property = objc_getProperty(Property, v5, 128, 1);
    if (Property)
      Property = objc_getProperty(Property, v8, 16, 1);
  }
  v9 = Property;
  v10 = a1[5];
  v11 = a1[6];
  v15[1] = v9;
  v15[2] = v10;
  v14[2] = CFSTR("interface");
  v14[3] = CFSTR("failReason");
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)handleCompanionProxyDatapathFailure:(void *)a1
{
  NSObject *Property;
  _QWORD v5[6];

  Property = objc_getProperty(a1, a2, 264, 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke;
  v5[3] = &unk_1E3CC14D0;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_async(Property, v5);
}

void __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _BYTE *Property;
  const char *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _BYTE *v20;
  const char *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  _BYTE *v32;
  _BYTE *v33;
  const char *v34;
  id v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[5];
  int v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3 || !objc_getProperty(v3, a2, 232, 1))
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v13 = "no companion proxy path present, ignoring";
      goto LABEL_14;
    }
LABEL_15:

    return;
  }
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v5 && (v7 = objc_getProperty(v5, v4, 232, 1)) != 0)
  {
    v8 = v7[2];

  }
  else
  {
    v8 = 0;
  }
  if (v6 == v8)
  {
    v9 = *(void **)(a1 + 32);
    if (!v9 || (Property = objc_getProperty(v9, v4, 128, 1)) == 0 || (Property[8] & 1) == 0)
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v13 = "no companion proxy present, ignoring";
LABEL_14:
        _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_INFO, v13, buf, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    v20 = *(_BYTE **)(a1 + 32);
    if (!v20 || (v20[75] & 1) == 0)
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_WORD *)buf = 0;
      v13 = "no companion outbound datapath detected, ignoring";
      goto LABEL_14;
    }
    v22 = objc_getProperty(v20, v11, 232, 1);
    v23 = *(void **)(a1 + 32);
    if (v23)
    {
      v24 = objc_getProperty(v23, v21, 232, 1);
      v25 = v24;
      if (v24)
      {
        v26 = (void *)*((_QWORD *)v24 + 12);
LABEL_30:
        v27 = -[NEIKEv2CompanionDatapath getStopReasonFromConnectionError:]((uint64_t)v22, v26);

        v29 = *(id *)(a1 + 32);
        if (v29)
          v29 = objc_getProperty(v29, v28, 240, 1);
        v31 = objc_msgSend(v29, "state");
        v32 = *(_BYTE **)(a1 + 32);
        if (v31 == 2 && v32 && (v32[79] & 1) != 0)
        {
          v33 = objc_getProperty(v32, v30, 168, 1);
          if (!v33 || (v33[8] & 1) == 0)
          {
            v35 = *(id *)(a1 + 32);
            if (v27 == 4)
            {
              if (v35 && (v35 = objc_getProperty(v35, v34, 168, 1), (v36 = *(_QWORD *)(a1 + 32)) != 0))
                v37 = *(void **)(v36 + 248);
              else
                v37 = 0;
              -[NEIKEv2MOBIKE initiateMOBIKE:pathStatus:serverAddress:earlyDisconnect:]((uint64_t)v35, v37, 2, 0, 0);
            }
            else
            {
              -[NEIKEv2PacketTunnelProvider handleInterfaceChange:]((uint64_t)v35, 0);
            }
          }
        }
        else
        {
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke_133;
          v38[3] = &unk_1E3CC1388;
          v38[4] = v32;
          v39 = v27;
          objc_msgSend(v32, "stopTunnelWithReason:completionHandler:", 14, v38);
        }
        return;
      }
    }
    else
    {
      v25 = 0;
    }
    v26 = 0;
    goto LABEL_30;
  }
  ne_log_obj();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    if (v16 && (v18 = objc_getProperty(v16, v15, 232, 1)) != 0)
    {
      v19 = v18[2];

    }
    else
    {
      v19 = 0;
    }
    *(_DWORD *)buf = 134218240;
    v41 = v17;
    v42 = 2048;
    v43 = v19;
    _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_INFO, "companion proxy datapath don't match %llu != %llu, ignoring", buf, 0x16u);
  }

}

void __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke_133(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), (const char *)*(unsigned int *)(a1 + 40));
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  id Property;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (a2)
  {
    if (WeakRetained)
      Property = objc_getProperty(WeakRetained, v5, 264, 1);
    else
      Property = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_2;
    block[3] = &unk_1E3CC39A8;
    v8 = Property;
    objc_copyWeak(&v11, v3);
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
  }
  else
  {
    objc_msgSend(WeakRetained, "setReasserting:", 0);
    -[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:]((uint64_t)v6, 0);
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "%@: Tunnel Status: UP", buf, 0xCu);
    }

  }
}

- (BOOL)NEIKEv2ProviderAuthenticate:(_BYTE *)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SEL v11;
  NEUserNotification *v12;
  SEL v13;
  id Property;
  id v15;
  SEL v16;
  SEL v17;
  _QWORD v19[4];
  id v20;
  _BYTE *v21;
  void *v22;
  uint8_t buf[4];
  _BYTE *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 1;
  if ((a1[80] & 1) == 0)
  {
    a1[80] = 1;
    if ((isa_nsdictionary(v3) & 1) != 0)
    {
      NEResourcesCopyLocalizedNSString(CFSTR("VPN_HEADER"), CFSTR("VPN_HEADER"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      NEResourcesCopyLocalizedNSString(CFSTR("PROMPT_REQUEST_AUTH"), CFSTR("PROMPT_REQUEST_AUTH"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9B810]);

      NEResourcesCopyLocalizedNSString(CFSTR("PASSWORD"), CFSTR("PASSWORD"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9B878]);

      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E3D03A58, *MEMORY[0x1E0C9B880]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E3D03A70, CFSTR("SBUserNotificationTextAutocapitalizationType"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E3D03A88, CFSTR("SBUserNotificationTextAutocorrectionType"));
      objc_msgSend(objc_getProperty(a1, v11, 216, 1), "cancel");
      v12 = [NEUserNotification alloc];
      Property = objc_getProperty(a1, v13, 264, 1);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __59__NEIKEv2PacketTunnelProvider_NEIKEv2ProviderAuthenticate___block_invoke;
      v19[3] = &unk_1E3CC1560;
      v20 = v4;
      v21 = a1;
      v15 = -[NEUserNotification initAndShowAuthenticationWithHeader:options:flags:callbackQueue:callbackHandler:](v12, "initAndShowAuthenticationWithHeader:options:flags:callbackQueue:callbackHandler:", v6, v7, 0x10000, Property, v19);
      objc_setProperty_atomic(a1, v16, v15, 216);

      v5 = objc_getProperty(a1, v17, 216, 1) != 0;
    }
    else
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = a1;
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "%@: Calling NEIKEv2ProviderAuthenticate with non-nsdictionary tunnelOptions", buf, 0xCu);
      }
      v5 = 0;
    }

  }
  return v5;
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_93(uint64_t a1, char a2)
{
  _BYTE *v3;
  const char *v4;

  v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = (const char *)-[NEIKEv2PacketTunnelProvider tunnelBringup]((uint64_t)v3);
    if ((_DWORD)v4)
      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v4);
  }
  else
  {
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)0xA);
  }
}

void __59__NEIKEv2PacketTunnelProvider_NEIKEv2ProviderAuthenticate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, CFSTR("Password"));
    -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@: Cancel IKEv2 tunnel, no password entered", (uint8_t *)&v11, 0xCu);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 40), (const char *)0x17);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    *(_BYTE *)(v9 + 80) = 0;

}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v2;
  _BYTE *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  _BYTE *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "%@: Stopping tunnel due to set tunnel network settings failed", buf, 0xCu);
  }

  if (WeakRetained)
    WeakRetained[77] = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_87;
  v4[3] = &unk_1E3CC41F0;
  v5 = WeakRetained;
  v3 = WeakRetained;
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v3, 9, v4);

}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_87(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), (const char *)0x1F);
}

void __54__NEIKEv2PacketTunnelProvider_handleDefaultPathChange__block_invoke(uint64_t a1, int a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2)
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_INFO, "received keepalive response", v3, 2u);
    }

  }
}

void __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, 0);
    WeakRetained = v2;
  }

}

void __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke_142(uint64_t a1, char a2)
{
  _BYTE *v3;
  const char *v4;

  v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = (const char *)-[NEIKEv2PacketTunnelProvider tunnelBringup]((uint64_t)v3);
    if ((_DWORD)v4)
      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v4);
  }
  else
  {
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)0x11);
  }
}

void __77__NEIKEv2PacketTunnelProvider_observerHelperHandler_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  int *v10;
  id Property;
  const char *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  int *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SEL v29;
  id v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  SEL v37;
  const char *v38;
  const char *v39;
  NSObject *v40;
  SEL v41;
  void (**v42)(id, uint64_t);
  SEL v43;
  void *v44;
  void *v45;
  void *v46;
  const char *v47;
  NSObject *v48;
  void *v49;
  SEL v50;
  id v51;
  const char *v52;
  id v53;
  __int128 v54;
  id v55;
  void *v56;
  uint64_t v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[24];
  const char *v64;
  _BYTE v65[10];
  __int16 v66;
  void *v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  const char *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 && (*(_BYTE *)(v1 + 77) & 1) == 0 && *(_QWORD *)(v1 + 136))
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v1 + 136), "resolvedEndpoints");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "count");
      v5 = objc_msgSend(*(id *)(v1 + 136), "status");
      v6 = "In progress";
      *(_DWORD *)buf = 138412802;
      v69 = v1;
      if (v5 == 2)
        v6 = "Complete";
      v70 = 2048;
      v71 = v4;
      v72 = 2080;
      v73 = v6;
      _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "%@: handleDNSResolution (resolvedEndpoints count %lu) (query status %s)", buf, 0x20u);

    }
    objc_msgSend(*(id *)(v1 + 136), "resolvedEndpoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v10 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
      Property = objc_getProperty((id)v1, v9, 128, 1);
      if (Property)
        Property = objc_getProperty(Property, v12, 16, 1);
      v55 = Property;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend(*(id *)(v1 + 136), "resolvedEndpoints");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, buf, 16);
      if (v13)
      {
        v15 = v13;
        v16 = 0;
        v17 = *(_QWORD *)v60;
        *(_QWORD *)&v14 = 138413314;
        v54 = v14;
        v18 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
        do
        {
          v19 = 0;
          v57 = v15;
          do
          {
            if (*(_QWORD *)v60 != v17)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v19);
            ne_log_obj();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = v17;
              v23 = v10;
              if (objc_msgSend(v20, "addressFamily") == 2)
                v24 = "IPv4";
              else
                v24 = "IPv6";
              objc_msgSend(v20, "hostname", v54);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "port");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v63 = v54;
              *(_QWORD *)&v63[4] = v1;
              *(_WORD *)&v63[12] = 2112;
              *(_QWORD *)&v63[14] = v55;
              *(_WORD *)&v63[22] = 2080;
              v64 = v24;
              v10 = v23;
              v17 = v22;
              v15 = v57;
              *(_WORD *)v65 = 2112;
              *(_QWORD *)&v65[2] = v25;
              v66 = 2112;
              v67 = v26;
              _os_log_impl(&dword_19BD16000, v21, OS_LOG_TYPE_INFO, "%@: Resolved %@: %s address %@:%@", v63, 0x34u);

              v18 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
            }

            v27 = *(void **)(v1 + v10[330]);
            objc_msgSend(v20, "hostname");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_getProperty((id)v1, v29, v18[342], 1);
            -[NEIKEv2Server setServerResolvedAddress:path:](v27, v28, v30);

            v16 |= objc_msgSend(v20, "addressFamily") == 30;
            ++v19;
          }
          while (v15 != v19);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, buf, 16);
        }
        while (v15);
      }
      else
      {
        v16 = 0;
      }

      if (objc_getProperty((id)v1, v37, 192, 1))
      {
        if ((v16 & 1) != 0 || objc_msgSend(*(id *)(v1 + 136), "status") == 2)
        {
          if (objc_getProperty((id)v1, v38, 144, 1))
          {
            v40 = objc_getProperty((id)v1, v39, 144, 1);
            dispatch_source_cancel(v40);
            objc_setProperty_atomic((id)v1, v41, 0, 144);
          }
          v42 = (void (**)(id, uint64_t))objc_getProperty((id)v1, v39, 192, 1);
          v42[2](v42, 1);
          objc_setProperty_atomic_copy((id)v1, v43, 0, 192);
        }
        else if (!objc_getProperty((id)v1, v38, 144, 1))
        {
          v48 = objc_getProperty((id)v1, v47, 264, 1);
          *(_QWORD *)v63 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v63[8] = 3221225472;
          *(_QWORD *)&v63[16] = __50__NEIKEv2PacketTunnelProvider_handleDNSResolution__block_invoke;
          v64 = (const char *)&unk_1E3CC41F0;
          *(_QWORD *)v65 = v1;
          NECreateTimerSource(v48, 1, v63);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic((id)v1, v50, v49, 144);

        }
      }
      if (objc_msgSend(*(id *)(v1 + 136), "status", v54) == 2)
      {
        v44 = *(void **)(v1 + 136);
        objc_msgSend((id)v1, "context");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "removeObserver:forKeyPath:", v45, CFSTR("resolvedEndpoints"));

        v46 = *(void **)(v1 + 136);
        *(_QWORD *)(v1 + 136) = 0;

      }
    }
    else if (objc_msgSend(*(id *)(v1 + 136), "status") == 2)
    {
      ne_log_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v51 = objc_getProperty((id)v1, v32, 128, 1);
        if (v51)
          v51 = objc_getProperty(v51, v52, 16, 1);
        v53 = v51;
        *(_DWORD *)buf = 138412546;
        v69 = v1;
        v70 = 2112;
        v71 = (uint64_t)v53;
        _os_log_error_impl(&dword_19BD16000, v31, OS_LOG_TYPE_ERROR, "%@: Failed to resolve %@", buf, 0x16u);

      }
      v33 = *(void **)(v1 + 136);
      objc_msgSend((id)v1, "context");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObserver:forKeyPath:", v34, CFSTR("resolvedEndpoints"));

      v35 = *(void **)(v1 + 136);
      *(_QWORD *)(v1 + 136) = 0;

      v36 = *(_QWORD *)(v1 + 192);
      if (v36)
      {
        (*(void (**)(uint64_t, _QWORD))(v36 + 16))(v36, 0);
        v56 = *(void **)(v1 + 192);
        *(_QWORD *)(v1 + 192) = 0;

      }
    }
  }
}

void __50__NEIKEv2PacketTunnelProvider_handleDNSResolution__block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  NSObject *Property;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v12;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return;
  if (!objc_getProperty(v3, a2, 144, 1))
    goto LABEL_7;
  Property = *(NSObject **)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v4, 144, 1);
  dispatch_source_cancel(Property);
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_atomic(v7, v6, 0, 144);
LABEL_7:
    v8 = *(void **)(a1 + 32);
    if (v8 && objc_getProperty(v8, v4, 192, 1))
    {
      v10 = *(id *)(a1 + 32);
      if (v10)
        v10 = objc_getProperty(v10, v9, 192, 1);
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
      v12 = *(void **)(a1 + 32);
      if (v12)
        objc_setProperty_atomic_copy(v12, v11, 0, 192);
    }
  }
}

void __35__NEIKEv2PacketTunnelProvider_wake__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2;
  const char *v3;
  id v4;
  SEL v5;
  id Property;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  char v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  SEL v17;
  id v18;
  void *v19;
  id v20;
  SEL v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  SEL v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  void (*v30)(uint64_t, int);
  void *v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (*(_BYTE *)(v2 + 77) & 1) == 0)
  {
    if (!objc_getProperty(*(id *)(a1 + 32), a2, 240, 1))
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(_QWORD *)((char *)&v29 + 4) = v2;
        _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "%@: Wake_up: Session down, ignore WakeUp", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_29;
    }
    v4 = objc_getProperty((id)v2, v3, 128, 1);
    Property = objc_getProperty((id)v2, v5, 208, 1);
    -[NEIKEv2Server getViableServerAddressForPath:](v4, Property);
    v7 = objc_claimAutoreleasedReturnValue();

    if ((*(_BYTE *)(v2 + 79) & 1) != 0)
    {
      objc_msgSend((id)v2, "protocolConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "disableMOBIKERetryOnWake") != 0;

      v18 = objc_getProperty((id)v2, v17, 168, 1);
      v19 = *(void **)(v2 + 248);
      v20 = v18;
      v22 = objc_msgSend(objc_getProperty((id)v2, v21, 208, 1), "status");
      -[NEIKEv2MOBIKE initiateMOBIKE:pathStatus:serverAddress:earlyDisconnect:]((uint64_t)v20, v19, v22, v7, v16);

      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(_QWORD *)((char *)&v29 + 4) = v2;
        v24 = "%@: Waking, kick off MOBIKE";
LABEL_18:
        _os_log_impl(&dword_19BD16000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v29, 0xCu);
      }
    }
    else
    {
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(_QWORD *)((char *)&v29 + 4) = v2;
        _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "%@: Waking, kick off DPD", (uint8_t *)&v29, 0xCu);
      }

      objc_msgSend((id)v2, "protocolConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "deadPeerDetectionRate");
      v11 = *(_BYTE *)(v2 + 76);
      objc_opt_self();
      if (v10 < 2)
      {
        v13 = 5;
        v25 = 1000;
LABEL_28:

        v27 = objc_getProperty((id)v2, v26, 240, 1);
        v28 = *(_QWORD *)(v2 + 264);
        *(_QWORD *)&v29 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v29 + 1) = 3221225472;
        v30 = __40__NEIKEv2PacketTunnelProvider_wakeIKEv2__block_invoke;
        v31 = &unk_1E3CC1408;
        v32 = v2;
        objc_msgSend(v27, "sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:", v13, v25, v28, &v29);
        goto LABEL_29;
      }
      if (v10 == 3)
      {
        v12 = (v11 & 1) == 0;
        if ((v11 & 1) != 0)
          v13 = 1;
        else
          v13 = 3;
        v14 = 3000;
        goto LABEL_25;
      }
      if (v10 == 2)
      {
        v12 = (v11 & 1) == 0;
        if ((v11 & 1) != 0)
          v13 = 1;
        else
          v13 = 5;
        v14 = 5000;
LABEL_25:
        if (v12)
          v25 = 1000;
        else
          v25 = v14;
        goto LABEL_28;
      }

      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(_QWORD *)((char *)&v29 + 4) = v2;
        v24 = "%@: Wake_up: failed to get DPD attributes";
        goto LABEL_18;
      }
    }

LABEL_29:
  }
}

void __40__NEIKEv2PacketTunnelProvider_wakeIKEv2__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        v7 = *(_QWORD *)(v6 + 248);
      else
        v7 = 0;
      v11 = 138412546;
      v12 = v6;
      v13 = 2048;
      v14 = v7;
      v8 = "%@: Wake_up: [%lu] WakeUP: DPD succeeded";
LABEL_10:
      _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v5)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(_QWORD *)(v9 + 248);
    else
      v10 = 0;
    v11 = 138412546;
    v12 = v9;
    v13 = 2048;
    v14 = v10;
    v8 = "%@: Wake_up: [%lu] WakeUP: DPD failed";
    goto LABEL_10;
  }

}

void __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    *(_BYTE *)(v1 + 77) = 1;
    v2 = *(_BYTE **)(a1 + 32);
  }
  else
  {
    v2 = 0;
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke_2;
  v4[3] = &unk_1E3CC46A8;
  v4[4] = v2;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v2, v3, v4);

}

uint64_t __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke_2(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider stopObserving](*(_BYTE **)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__NEIKEv2PacketTunnelProvider_startTunnelWithOptions_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    *(_BYTE *)(v3 + 77) = 0;
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_setProperty_atomic_copy(v4, a2, *(id *)(a1 + 48), 176);
      v4 = *(void **)(a1 + 32);
    }
  }
  else
  {
    v4 = 0;
  }
  -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:]((uint64_t)v4, *(void **)(a1 + 40));
}

@end
