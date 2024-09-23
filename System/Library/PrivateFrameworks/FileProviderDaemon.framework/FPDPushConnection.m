@implementation FPDPushConnection

- (FPDPushConnection)init
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should not call this"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDPushConnection init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDPushConnection.m", 78, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (FPDPushConnection)initWithExtensionManager:(id)a3
{
  id v4;
  FPDPushConnection *v5;
  FPDPushConnection *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *pushQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *payloadDeliveryQueue;
  uint64_t v13;
  NSMutableDictionary *messageDelegates;
  uint64_t v15;
  NSMutableDictionary *clientConnections;
  uint64_t v17;
  NSMutableDictionary *bundleIdentifierForTopic;
  uint64_t v19;
  NSMutableDictionary *topicsForBundleIdentifier;
  uint64_t v21;
  FPProviderMonitor *providerMonitor;
  uint64_t v23;
  NSMutableDictionary *pushConnectionsByEnvironment;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FPDPushConnection;
  v5 = -[FPDPushConnection init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_manager, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("push worker queue", v7);
    pushQueue = v6->_pushQueue;
    v6->_pushQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("push delivery queue", v10);
    payloadDeliveryQueue = v6->_payloadDeliveryQueue;
    v6->_payloadDeliveryQueue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new();
    messageDelegates = v6->_messageDelegates;
    v6->_messageDelegates = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    clientConnections = v6->_clientConnections;
    v6->_clientConnections = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    bundleIdentifierForTopic = v6->_bundleIdentifierForTopic;
    v6->_bundleIdentifierForTopic = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    topicsForBundleIdentifier = v6->_topicsForBundleIdentifier;
    v6->_topicsForBundleIdentifier = (NSMutableDictionary *)v19;

    v21 = objc_opt_new();
    providerMonitor = v6->_providerMonitor;
    v6->_providerMonitor = (FPProviderMonitor *)v21;

    v23 = objc_opt_new();
    pushConnectionsByEnvironment = v6->_pushConnectionsByEnvironment;
    v6->_pushConnectionsByEnvironment = (NSMutableDictionary *)v23;

  }
  return v6;
}

- (id)_pushConnectionWithEnvironmentName:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  -[NSMutableDictionary objectForKey:](self->_pushConnectionsByEnvironment, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFE130]))
      v6 = CFSTR("com.apple.fileprovider.extension.push");
    else
      v6 = CFSTR("com.apple.fileprovider.extension.push.development");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE148]), "initWithEnvironmentName:namedDelegatePort:queue:", v4, v6, self->_pushQueue);
    objc_msgSend(v5, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKey:](self->_pushConnectionsByEnvironment, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)start
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDPushConnection began listening", v1, 2u);
}

id __26__FPDPushConnection_start__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_pushConnectionWithEnvironmentName:", *MEMORY[0x1E0CFE130]);
  return (id)objc_msgSend(*(id *)(a1 + 32), "_pushConnectionWithEnvironmentName:", *MEMORY[0x1E0CFE128]);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (listener_shouldAcceptNewConnection__once != -1)
    dispatch_once(&listener_shouldAcceptNewConnection__once, &__block_literal_global_23);
  objc_msgSend(v7, "setExportedInterface:", listener_shouldAcceptNewConnection__serverInterface);
  objc_msgSend(v7, "setRemoteObjectInterface:", listener_shouldAcceptNewConnection__clientInterface);
  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(v7, "resume");
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPDPushConnection listener:shouldAcceptNewConnection:].cold.1();

  return 1;
}

void __56__FPDPushConnection_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFBB2438);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)listener_shouldAcceptNewConnection__serverInterface;
  listener_shouldAcceptNewConnection__serverInterface = v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFBBBAD0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)listener_shouldAcceptNewConnection__clientInterface;
  listener_shouldAcceptNewConnection__clientInterface = v2;

}

- (void)performWithConnection:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  FPDExtensionManager **p_manager;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  int v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ %s was called with nil completion block!"), "-[FPDPushConnection performWithConnection:block:]");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      +[FPDDownloadManager releaseDownloadSlot:].cold.1();

    __assert_rtn("-[FPDPushConnection performWithConnection:block:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDPushConnection.m", 149, (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String"));
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v7;
  objc_msgSend(v6, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    p_manager = &self->_manager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    objc_msgSend(WeakRetained, "providerWithIdentifier:reason:", v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_7;
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPDPushConnection performWithConnection:block:].cold.4();

    v15 = objc_loadWeakRetained((id *)p_manager);
    objc_msgSend(v15, "defaultProviderWithTopLevelBundleIdentifier:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
LABEL_7:
      objc_msgSend(v13, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleIdentifierForPushes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0;
      v38 = &v37;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__16;
      v41 = __Block_byref_object_dispose__16;
      v42 = 0;
      objc_msgSend(v6, "valueForEntitlement:", CFSTR("aps-environment"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.developer.aps-environment"));
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v42 = v20;

      if (objc_msgSend((id)v38[5], "isEqualToString:", CFSTR("serverPreferred")))
      {
        objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.CloudDocs"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __49__FPDPushConnection_performWithConnection_block___block_invoke;
        v29[3] = &unk_1E8C78E40;
        v36 = &v37;
        v30 = v6;
        v31 = v10;
        v35 = v8;
        v32 = v9;
        v33 = v17;
        v34 = v13;
        objc_msgSend(v22, "serverPreferredPushEnvironmentWithCompletionHandler:", v29);

      }
      else
      {
        if ((objc_msgSend(MEMORY[0x1E0CFE148], "isValidEnvironment:", v38[5]) & 1) == 0)
        {
          fp_current_or_default_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = v38[5];
            objc_msgSend(v6, "processIdentifier");
            FPExecutableNameForProcessIdentifier();
            v25 = (id)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v6, "processIdentifier");
            *(_DWORD *)buf = 138413314;
            v44 = v24;
            v45 = 2112;
            v46 = CFSTR("aps-environment");
            v47 = 2112;
            v48 = v25;
            v49 = 1024;
            v50 = v26;
            v51 = 2112;
            v52 = v10;
            _os_log_error_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_ERROR, "[ERROR] invalid push environment %@ specified in %@ from %@[%d] (requested for %@)", buf, 0x30u);

          }
          ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD))v8)[2](v8, v9, 0, 0, 0);
          goto LABEL_21;
        }
        objc_msgSend(v13, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, void *, uint64_t))v8)[2](v8, v9, v17, v22, v38[5]);
      }

LABEL_21:
      _Block_object_dispose(&v37, 8);

      goto LABEL_22;
    }
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[FPDPushConnection performWithConnection:block:].cold.3();
  }
  else
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[FPDPushConnection performWithConnection:block:].cold.2();
  }

  ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD))v8)[2](v8, v9, 0, 0, 0);
LABEL_22:

}

void __49__FPDPushConnection_performWithConnection_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "processIdentifier");
      FPExecutableNameForProcessIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 32), "processIdentifier");
      v11 = *(_QWORD *)(a1 + 40);
      v17 = 138413570;
      v18 = v8;
      v19 = 2112;
      v20 = CFSTR("aps-environment");
      v21 = 2112;
      v22 = v9;
      v23 = 1024;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] could not get push environment %@ specified in %@ from %@[%d] (requested for %@): %@", (uint8_t *)&v17, 0x3Au);

    }
  }
  if (v5)
    v12 = v5;
  else
    v12 = (void *)*MEMORY[0x1E0CFE130];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v12);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 64), "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, _QWORD))(v15 + 16))(v15, v13, v14, v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

}

- (void)addClientConnection:(id)a3 forApplicationBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](self->_clientConnections, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (void)removeClientConnection:(id)a3 forApplicationBundleIdentifier:(id)a4
{
  NSObject *pushQueue;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  pushQueue = self->_pushQueue;
  v7 = a3;
  dispatch_assert_queue_V2(pushQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  if (!objc_msgSend(v8, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_clientConnections, "removeObjectForKey:", v9);

}

- (id)clientConnectionsForApplicationBundleIdentifier:(id)a3
{
  NSObject *pushQueue;
  id v5;
  void *v6;
  void *v7;

  pushQueue = self->_pushQueue;
  v5 = a3;
  dispatch_assert_queue_V2(pushQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (void)fileProviderRegister
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __41__FPDPushConnection_fileProviderRegister__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(NSObject **)(v12 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__FPDPushConnection_fileProviderRegister__block_invoke_2;
    block[3] = &unk_1E8C75930;
    block[4] = v12;
    v15 = v9;
    v16 = v10;
    v17 = *(id *)(a1 + 32);
    v18 = v11;
    dispatch_async(v13, block);

  }
  else
  {
    objc_msgSend(a2, "fileProviderRegistrationFailed");
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

uint64_t __41__FPDPushConnection_fileProviderRegister__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "updateTopicsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "clientConnectionsForApplicationBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObserver:forProviderID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addClientConnection:forApplicationBundleIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateTopicsForApplicationBundleIdentifier:providerIdentifier:requestToken:environment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 64));
}

- (void)fileProviderUnregister
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __43__FPDPushConnection_fileProviderUnregister__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v13 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v14 = *(NSObject **)(v12 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__FPDPushConnection_fileProviderUnregister__block_invoke_2;
    block[3] = &unk_1E8C75930;
    block[4] = v12;
    v16 = v13;
    v17 = v9;
    v18 = v10;
    v19 = v11;
    dispatch_async(v14, block);

  }
  else
  {
    objc_msgSend(a2, "fileProviderRegistrationFailed");
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

void __43__FPDPushConnection_fileProviderUnregister__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeClientConnection:forApplicationBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "clientConnectionsForApplicationBundleIdentifier:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObserver:forProviderID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "updateTopicsForApplicationBundleIdentifier:providerIdentifier:requestToken:environment:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_pushConnectionWithEnvironmentName:", *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "invalidateTokenForTopic:identifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), &stru_1E8C795D8, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (id)topicsForApplicationBundleIdentifier:(id)a3
{
  NSObject *pushQueue;
  id v5;
  void *v6;

  pushQueue = self->_pushQueue;
  v5 = a3;
  dispatch_assert_queue_V2(pushQueue);
  -[NSMutableDictionary objectForKey:](self->_topicsForBundleIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_debugTopicsForApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *pushQueue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pushQueue = self->_pushQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke;
  block[3] = &unk_1E8C75240;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_sync(pushQueue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke_2;
  v14[3] = &unk_1E8C78E90;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke_3;
  v11[3] = &unk_1E8C78EB8;
  v12 = *(id *)(a1 + 48);
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

}

uint64_t __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v6, "enabledTopics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, v10);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "opportunisticTopics");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, opportunistic"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setValue:forKey:", v12, v13);
}

- (void)updateTopicsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("pushkit.fileprovider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.FileProvider.TestingHarness")))
  {
    -[NSMutableDictionary objectForKey:](self->_messageDelegates, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "customPushTopics");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_topicsForBundleIdentifier, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierForTopic, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NSMutableDictionary setObject:forKey:](self->_bundleIdentifierForTopic, "setObject:forKey:", v4, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

  -[NSMutableDictionary setObject:forKey:](self->_topicsForBundleIdentifier, "setObject:forKey:", v15, v4);
}

- (void)setMessageDelegate:(id)a3 forApplicationBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *pushQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  pushQueue = self->_pushQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__FPDPushConnection_setMessageDelegate_forApplicationBundleIdentifier___block_invoke;
  block[3] = &unk_1E8C75240;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(pushQueue, block);

}

uint64_t __71__FPDPushConnection_setMessageDelegate_forApplicationBundleIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 48), "setValue:forKey:", a1[5], a1[6]);
}

- (void)updateTopicsForApplicationBundleIdentifier:(id)a3 providerIdentifier:(id)a4 requestToken:(BOOL)a5 environment:(id)a6
{
  id v10;
  id v11;
  NSObject *pushQueue;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v10 = a3;
  v11 = a4;
  pushQueue = self->_pushQueue;
  v13 = a6;
  dispatch_assert_queue_V2(pushQueue);
  -[FPDPushConnection _pushConnectionWithEnvironmentName:](self, "_pushConnectionWithEnvironmentName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = self->_pushQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke;
  block[3] = &unk_1E8C78EE0;
  block[4] = self;
  v20 = v10;
  v23 = a5;
  v21 = v14;
  v22 = v11;
  v16 = v11;
  v17 = v14;
  v18 = v10;
  dispatch_async(v15, block);

}

void __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "topicsForApplicationBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v3 + 8), "opportunisticTopics");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = (void *)v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  objc_msgSend(*(id *)(v3 + 8), "enabledTopics");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v8;
  v14 = v13;

  if (*(_BYTE *)(v3 + 24))
  {
    objc_msgSend(v5, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "fp_isCloudDocsPushTopic");

    if (v16)
    {
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke_cold_1(v3, v17, v18, v19, v20, v21, v22, v23);
    }
    else
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v24 = v5;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v37 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(a1 + 48), "requestTokenForTopic:identifier:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), &stru_1E8C795D8, (_QWORD)v36);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v26);
      }

      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke_cold_2();
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10, (_QWORD)v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v14);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CAACB0], "isProviderIDForeground:", *(_QWORD *)(a1 + 56)))
  {
    objc_msgSend(v30, "unionSet:", v5);
    objc_msgSend(v29, "minusSet:", v5);
  }
  else
  {
    objc_msgSend(v30, "minusSet:", v5);
    objc_msgSend(v29, "unionSet:", v5);
  }
  v31 = objc_msgSend(v10, "count");
  if (v31 != objc_msgSend(v29, "count") || (v32 = objc_msgSend(v14, "count"), v32 != objc_msgSend(v30, "count")))
  {
    v33 = *(void **)(a1 + 48);
    objc_msgSend(v30, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setEnabledTopics:ignoredTopics:opportunisticTopics:", v34, MEMORY[0x1E0C9AA60], v35);

  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierForTopic, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDPushConnection clientConnectionsForApplicationBundleIdentifier:](self, "clientConnectionsForApplicationBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[FPDPushConnection connection:didReceiveToken:forTopic:identifier:].cold.1((uint64_t)v9, v11, v12);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "remoteObjectProxy", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileProviderRegistrationSucceededWithDeviceToken:", v8);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  NSObject *payloadDeliveryQueue;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  FPDPushConnection *v20;
  __CFString *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPDPushConnection connection:didReceiveIncomingMessage:].cold.3(v7, v8);

  objc_msgSend(v7, "topic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierForTopic, "objectForKey:", v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_8;
  if (objc_msgSend(v9, "fp_isCloudDocsPushTopic"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    objc_msgSend(WeakRetained, "clouddocsExtensionIdentifier");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    -[NSMutableDictionary objectForKey:](self->_messageDelegates, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      payloadDeliveryQueue = self->_payloadDeliveryQueue;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke;
      v17[3] = &unk_1E8C773F8;
      v18 = v12;
      v19 = v7;
      v20 = self;
      v21 = v10;
      v22 = v9;
      v23 = v6;
      dispatch_async(payloadDeliveryQueue, v17);

      v15 = v18;
    }
    else
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[FPDPushConnection connection:didReceiveIncomingMessage:].cold.1();
    }

    goto LABEL_13;
  }
  if ((objc_msgSend(v9, "fp_isTestPushTopic") & 1) != 0)
  {
    v10 = CFSTR("com.apple.FileProvider.TestingHarness");
    goto LABEL_8;
  }
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[FPDPushConnection connection:didReceiveIncomingMessage:].cold.2();

  objc_msgSend(v6, "invalidateTokenForTopic:identifier:", v9, &stru_1E8C795D8);
LABEL_13:

}

void __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_2;
  v5[3] = &unk_1E8C75930;
  v2 = *(void **)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[1] = 3221225472;
  v6 = v2;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "didReceiveMessage:completionHandler:", v4, v5);

}

void __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_3;
  block[3] = &unk_1E8C75930;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  dispatch_async(v4, block);

}

void __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id obj;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "clientConnectionsForApplicationBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v2;
    obj = v2;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v25;
      v6 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v25 != v5)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v8, "remoteObjectProxy", v17);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v6;
          v19[1] = 3221225472;
          v19[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_69;
          v19[3] = &unk_1E8C78F08;
          v10 = *(id *)(a1 + 48);
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(void **)(a1 + 40);
          v20 = v10;
          v21 = v11;
          v22 = v8;
          v23 = v12;
          objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 64), "userInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fileProviderPayloadReceived:", v14);

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v4);
    }

    v2 = v17;
  }
  else
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v30 = v16;
      _os_log_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Missing push connection for topic %@. This can happen if the provider doesn't register for pushes on startup. Invalidating push topic.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "invalidateTokenForTopic:identifier:", *(_QWORD *)(a1 + 48), &stru_1E8C795D8);
  }

}

void __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  NSObject *v8;
  _QWORD block[4];
  __int128 v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "fp_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Error sending push for topic %@: %@", buf, 0x16u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  block[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_70;
  block[3] = &unk_1E8C75240;
  v10 = v7;
  v11 = *(id *)(a1 + 56);
  dispatch_async(v8, block);

}

uint64_t __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeClientConnection:forApplicationBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)updateTopicsForProvider:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *pushQueue;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDPushConnection updateTopicsForProvider:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  pushQueue = self->_pushQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__FPDPushConnection_updateTopicsForProvider___block_invoke;
  v15[3] = &unk_1E8C75850;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  dispatch_async(pushQueue, v15);

}

void __45__FPDPushConnection_updateTopicsForProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "providerWithIdentifier:reason:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifierForPushes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientConnectionsForApplicationBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__FPDPushConnection_updateTopicsForProvider___block_invoke_2;
    v11[3] = &unk_1E8C78E68;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    objc_msgSend(v7, "performWithConnection:block:", v8, v11);

  }
}

void __45__FPDPushConnection_updateTopicsForProvider___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v11 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(NSObject **)(v10 + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__FPDPushConnection_updateTopicsForProvider___block_invoke_72;
    v15[3] = &unk_1E8C77420;
    v15[4] = v10;
    v16 = v11;
    v17 = v8;
    v18 = v9;
    dispatch_async(v12, v15);

  }
  else
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Invalid push connection for app bundle identifier %@, not updating topics", buf, 0xCu);
    }

  }
}

uint64_t __45__FPDPushConnection_updateTopicsForProvider___block_invoke_72(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTopicsForApplicationBundleIdentifier:providerIdentifier:requestToken:environment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerMonitor, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_topicsForBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForTopic, 0);
  objc_storeStrong((id *)&self->_messageDelegates, 0);
  objc_storeStrong((id *)&self->_pushConnectionsByEnvironment, 0);
  objc_storeStrong((id *)&self->_payloadDeliveryQueue, 0);
  objc_storeStrong((id *)&self->_pushQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] FPDPushConnection accepted connection %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)performWithConnection:block:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CF55F000, v0, v1, "[ERROR] Couldn't find valid provider for connection %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)performWithConnection:block:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CF55F000, v0, v1, "[ERROR] Couldn't find provider for registering bundle %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)performWithConnection:block:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] couldn't find extension with identifier %@, trying application", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] skipping token request for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v1, (uint64_t)v1, "[DEBUG] requested tokens for topics %@ for application %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)connection:(NSObject *)a3 didReceiveToken:forTopic:identifier:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a3, v4, "[DEBUG] received token for topic %@, informing %lu clients", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_0();
}

- (void)connection:didReceiveIncomingMessage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_1CF55F000, v1, OS_LOG_TYPE_FAULT, "[CRIT] No delegate found for topic %@ for bundle identifier %@", v2, 0x16u);
  OUTLINED_FUNCTION_8_0();
}

- (void)connection:didReceiveIncomingMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CF55F000, v0, v1, "[ERROR] Received push for unregistered topic %@; invalidating token.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)connection:(void *)a1 didReceiveIncomingMessage:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] received push for topic %@", v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

- (void)updateTopicsForProvider:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a1, a3, "[DEBUG] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

@end
