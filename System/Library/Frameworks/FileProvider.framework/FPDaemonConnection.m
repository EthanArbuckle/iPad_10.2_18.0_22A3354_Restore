@implementation FPDaemonConnection

- (id)listOfMonitoredAppsWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  v15 = 0;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__FPDaemonConnection_listOfMonitoredAppsWithError___block_invoke;
  v9[3] = &unk_1E444D440;
  v9[4] = &v16;
  v9[5] = &v10;
  objc_msgSend(v5, "fetchListOfMonitoredApps:", v9);

  if (a3)
  {
    v6 = (void *)v11[5];
    if (v6)
      *a3 = objc_retainAutorelease(v6);
  }
  v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

+ (id)synchronousSharedConnectionProxy
{
  void *v2;
  void *v3;
  void *v4;

  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedConnectionProxy
{
  void *v2;
  void *v3;

  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedConnection
{
  id v2;

  v2 = fp_default_log();
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_29);
  return (id)sharedConnection_connection;
}

- (void)providerDomainsCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke;
  v7[3] = &unk_1E444D260;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "providerDomainsCompletionHandler:", v7);

}

- (id)connectionProxy
{
  FPXPCAutomaticErrorProxy *v3;
  void *v4;
  FPXPCAutomaticErrorProxy *v5;

  v3 = [FPXPCAutomaticErrorProxy alloc];
  -[FPDaemonConnection nonErrorCheckingConnection](self, "nonErrorCheckingConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:](v3, "initWithConnection:protocol:orError:name:requestPid:", v4, &unk_1EE5F8100, 0, CFSTR("FPDaemonConnection proxy"), getpid());

  -[FPXPCAutomaticErrorProxy setSanitizeErrors:](v5, "setSanitizeErrors:", 0);
  return v5;
}

- (id)nonErrorCheckingConnection
{
  FPDaemonConnection *v2;
  FPDDaemon *connection;
  FPDDaemon *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  FPDDaemon *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD v14[4];
  id v15;
  uint8_t buf[8];

  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (connection)
  {
    v4 = connection;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_initLocalizationStrings");
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_INFO, "[INFO] Creating new FPDaemonConnection connection.", buf, 2u);
    }

    v6 = -[FPDaemonConnection newXPCConnection](v2, "newXPCConnection");
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v2);
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__FPDaemonConnection_nonErrorCheckingConnection__block_invoke;
    v14[3] = &unk_1E44499C0;
    objc_copyWeak(&v15, (id *)buf);
    objc_msgSend(v6, "setInvalidationHandler:", v14);
    location = 0;
    objc_initWeak(&location, v6);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __48__FPDaemonConnection_nonErrorCheckingConnection__block_invoke_11;
    v11[3] = &unk_1E44499C0;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "setInterruptionHandler:", v11);
    objc_msgSend(v6, "resume");
    v8 = v2->_connection;
    v2->_connection = (FPDDaemon *)v6;
    v9 = v6;

    v4 = v2->_connection;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v2);

  return v4;
}

void __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke_cold_1(v5, v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

void __38__FPDaemonConnection_sharedConnection__block_invoke()
{
  FPDaemonConnection *v0;
  void *v1;

  v0 = -[FPDaemonConnection initWithUser:]([FPDaemonConnection alloc], "initWithUser:", 0);
  v1 = (void *)sharedConnection_connection;
  sharedConnection_connection = (uint64_t)v0;

}

- (FPDaemonConnection)initWithUser:(unsigned int)a3
{
  FPDaemonConnection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPDaemonConnection;
  result = -[FPDaemonConnection init](&v5, sel_init);
  if (result)
    result->_user = a3;
  return result;
}

void __51__FPDaemonConnection_listOfMonitoredAppsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __61__FPDaemonConnection_valuesForAttributes_forItemAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __61__FPDaemonConnection_valuesForAttributes_forItemAtURL_error___block_invoke_cold_1(a1, (uint64_t)v5, v7);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

- (id)valuesForAttributes:(id)a3 forItemAtURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15;
  v29 = __Block_byref_object_dispose__15;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v24 = 0;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__FPDaemonConnection_valuesForAttributes_forItemAtURL_error___block_invoke;
  v15[3] = &unk_1E444D418;
  v12 = v9;
  v16 = v12;
  v17 = &v19;
  v18 = &v25;
  objc_msgSend(v11, "valuesForAttributes:forItemAtURL:completionHandler:", v8, v12, v15);

  if (a5)
    *a5 = objc_retainAutorelease((id)v26[5]);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAndStartEnumeratingWithSettings:observer:completionHandler:", v10, v9, v8);

}

+ (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonErrorCheckingConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonErrorCheckingConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)connectionForUser:(unsigned int)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  FPDaemonConnection *v8;
  void *v9;
  void *v10;

  v3 = *(_QWORD *)&a3;
  v4 = fp_default_log();
  if (connectionForUser__onceToken != -1)
    dispatch_once(&connectionForUser__onceToken, &__block_literal_global_1_0);
  v5 = (id)connectionForUser__connectionByUID;
  objc_sync_enter(v5);
  v6 = (void *)connectionForUser__connectionByUID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (FPDaemonConnection *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = -[FPDaemonConnection initWithUser:]([FPDaemonConnection alloc], "initWithUser:", v3);
    v9 = (void *)connectionForUser__connectionByUID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_sync_exit(v5);

  return v8;
}

void __40__FPDaemonConnection_connectionForUser___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)connectionForUser__connectionByUID;
  connectionForUser__connectionByUID = v0;

}

+ (void)setDisallowedConnectionReason:(id)a3
{
  id v4;
  void *v5;
  id obj;

  v4 = a3;
  obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)daemonConnectionDisallowedReason;
  daemonConnectionDisallowedReason = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (NSString)disallowedConnectionReason
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)daemonConnectionDisallowedReason;
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (id)newXPCConnection
{
  FPDaemonConnection *v2;
  void *v3;
  void *v4;
  void *v6;
  NSObject *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (daemonConnectionDisallowedReason)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Establishing connection to fileproviderd is disallowed in this context: %@"), daemonConnectionDisallowedReason);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[FPDaemonConnection newXPCConnection].cold.1();

    __assert_rtn("-[FPDaemonConnection newXPCConnection]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPDaemonConnection.m", 125, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  }
  objc_sync_exit(v2);

  FPDDaemonXPCInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.FileProvider"), 0);
  objc_msgSend(v4, "setRemoteObjectInterface:", v3);

  return v4;
}

void __48__FPDaemonConnection_nonErrorCheckingConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_sync_enter(v3);
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_INFO, "[INFO] FPDaemonConnection invalidated.", v6, 2u);
    }

    v5 = (void *)v3[6];
    v3[6] = 0;

    objc_sync_exit(v3);
  }

}

void __48__FPDaemonConnection_nonErrorCheckingConnection__block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_INFO, "[INFO] FPDaemonConnection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

+ (BOOL)runningInSyncBubble
{
  if (runningInSyncBubble_onceToken != -1)
    dispatch_once(&runningInSyncBubble_onceToken, &__block_literal_global_225_0);
  return runningInSyncBubble_res;
}

void __41__FPDaemonConnection_runningInSyncBubble__block_invoke()
{
  void *v0;
  int v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isSharedIPad") & 1) != 0)
  {
    objc_msgSend(v2, "currentUser");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "uid");
    runningInSyncBubble_res = v1 != geteuid();

  }
  else
  {
    runningInSyncBubble_res = 0;
  }

}

- (void)wakeUpForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__FPDaemonConnection_wakeUpForURL_completionHandler___block_invoke;
  v10[3] = &unk_1E444D238;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "wakeUpForURL:completionHandler:", v7, v10);

}

void __53__FPDaemonConnection_wakeUpForURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__FPDaemonConnection_wakeUpForURL_completionHandler___block_invoke_cold_1(v5, v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)extendSandboxForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  FPNotSupportedError();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a6 + 2))(v7, 0, v8);

}

- (void)extendSandboxAndCreatePlaceholderForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  FPNotSupportedError();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD, _QWORD, _QWORD))a6 + 2))(v7, v8, 0, 0, 0);

}

- (void)startProvidingItemAtURL:(id)a3 fromProviderID:(id)a4 forConsumerID:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  FPNotSupportedError();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);

}

- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = a5;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__FPDaemonConnection_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler___block_invoke;
  v18[3] = &unk_1E4449AF8;
  v19 = v10;
  v20 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v13, "evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:completionHandler:", v15, v8, v12, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __98__FPDaemonConnection_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __98__FPDaemonConnection_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler___block_invoke_cold_1(a1, v3);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = *MEMORY[0x1E0CB28A8];
    v16[0] = CFSTR("NSFileProviderErrorDomain");
    v16[1] = v5;
    v16[2] = *MEMORY[0x1E0CB2FE0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fp_unwrappedErrorForDomains:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "fp_isPOSIXErrorCode:", 16))
    {
      objc_msgSend(v3, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2938]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(_QWORD *)(a1 + 40);
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB3388];
      v15 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v5, 255, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (void)evictItemWithID:(id)a3 completionHandler:(id)a4
{
  -[FPDaemonConnection evictItemWithID:evictionReason:completionHandler:](self, "evictItemWithID:evictionReason:completionHandler:", a3, 2, a4);
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__FPDaemonConnection_evictItemWithID_evictionReason_completionHandler___block_invoke;
  v13[3] = &unk_1E4449AF8;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "evictItemWithID:evictionReason:completionHandler:", v12, v6, v13);

}

void __71__FPDaemonConnection_evictItemWithID_evictionReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__FPDaemonConnection_evictItemWithID_evictionReason_completionHandler___block_invoke_cold_1(a1, v3);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)pinItemWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pinItemWithID:completionHandler:", v7, v6);

}

- (void)unpinItemWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unpinItemWithID:completionHandler:", v7, v6);

}

- (void)providersCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FPDaemonConnection_providersCompletionHandler___block_invoke;
  v7[3] = &unk_1E444D260;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "providerDomainsCompletionHandler:", v7);

}

void __49__FPDaemonConnection_providersCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke_cold_1(v5, v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)fetchDomainServicerForProviderDomainID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__FPDaemonConnection_fetchDomainServicerForProviderDomainID_handler___block_invoke;
  v11[3] = &unk_1E444D288;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "fetchDomainServicerForProviderDomainID:handler:", v10, v11);

}

void __69__FPDaemonConnection_fetchDomainServicerForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __69__FPDaemonConnection_fetchDomainServicerForProviderDomainID_handler___block_invoke_cold_1(a1, v9);

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v7, v8, v9);

}

- (void)extendBookmarkForFileURL:(id)a3 toConsumerID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__FPDaemonConnection_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke;
  v14[3] = &unk_1E444D2B0;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "extendBookmarkForFileURL:toConsumerID:completionHandler:", v13, v10, v14);

}

void __78__FPDaemonConnection_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__FPDaemonConnection_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke_cold_1(a1, v6);

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)updateLastUsedDateForFileURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDaemonConnection.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateLastUsedDate:completionHandler:", v10, v7);

}

- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDaemonConnection.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__FPDaemonConnection_forceIngestionForItemID_completionHandler___block_invoke;
  v12[3] = &unk_1E4449A88;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "forceIngestionForItemID:completionHandler:", v7, v12);

}

void __64__FPDaemonConnection_forceIngestionForItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__FPDaemonConnection_forceIngestionForItemID_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)forceIngestionForItemIDs:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDaemonConnection.m"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__FPDaemonConnection_forceIngestionForItemIDs_completionHandler___block_invoke;
  v12[3] = &unk_1E444D2D8;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "forceIngestionForItemIDs:completionHandler:", v7, v12);

}

void __65__FPDaemonConnection_forceIngestionForItemIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__FPDaemonConnection_forceIngestionForItemIDs_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDaemonConnection.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__FPDaemonConnection_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke;
  v12[3] = &unk_1E444D300;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "forceLatestVersionOnDiskForItemID:completionHandler:", v7, v12);

}

void __74__FPDaemonConnection_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74__FPDaemonConnection_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke_cold_1(v6, v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)detachItemWithID:(id)a3 relocatingAtURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  FPDaemonConnection *v20;
  id v21;
  unint64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__FPDaemonConnection_detachItemWithID_relocatingAtURL_options_completionHandler___block_invoke;
  v17[3] = &unk_1E444D328;
  v18 = v10;
  v19 = v11;
  v21 = v12;
  v22 = a5;
  v20 = self;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v13, "documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v15, 1, 1, v17);

}

void __81__FPDaemonConnection_detachItemWithID_relocatingAtURL_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSFileProviderKnownFolderDescriptor *v11;
  void *v12;
  void *v13;
  void *v14;
  NSFileProviderKnownFolderDescriptor *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    v18 = *(_QWORD *)(a1 + 56);
    if (v9)
    {
      (*(void (**)(_QWORD, id))(v18 + 16))(*(_QWORD *)(a1 + 56), v9);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError((uint64_t)v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v20);

    }
  }
  else
  {
    v11 = [NSFileProviderKnownFolderDescriptor alloc];
    v12 = *(void **)(a1 + 40);
    v13 = v12;
    if (!v12)
    {
      objc_msgSend(v7, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSFileProviderKnownFolderDescriptor initWithKnownFolder:logicalLocation:detachOptions:](v11, "initWithKnownFolder:logicalLocation:detachOptions:", v13, v14, *(_QWORD *)(a1 + 64));

    if (!v12)
    v16 = *(void **)(a1 + 48);
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "detachKnownFolders:completionHandler:", v17, *(_QWORD *)(a1 + 56));

  }
}

- (void)detachItemWithID:(id)a3 relocatingAtURL:(id)a4 completionHandler:(id)a5
{
  -[FPDaemonConnection detachItemWithID:relocatingAtURL:options:completionHandler:](self, "detachItemWithID:relocatingAtURL:options:completionHandler:", a3, a4, 1, a5);
}

- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detachKnownFolders:completionHandler:", v7, v6);

}

- (void)importDetachedFolder:(id)a3 parentID:(id)a4 logicalName:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  FPDaemonConnection *v25;
  id v26;
  unint64_t v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__FPDaemonConnection_importDetachedFolder_parentID_logicalName_options_completionHandler___block_invoke;
  v21[3] = &unk_1E444D350;
  v22 = v13;
  v23 = v14;
  v26 = v15;
  v27 = a6;
  v24 = v12;
  v25 = self;
  v17 = v12;
  v18 = v14;
  v19 = v13;
  v20 = v15;
  objc_msgSend(v16, "documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v19, 1, 1, v21);

}

void __90__FPDaemonConnection_importDetachedFolder_parentID_logicalName_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSFileProviderKnownFolderDescriptor *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    v16 = *(_QWORD *)(a1 + 64);
    if (v9)
    {
      (*(void (**)(_QWORD, id))(v16 + 16))(*(_QWORD *)(a1 + 64), v9);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError((uint64_t)v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v18);

    }
  }
  else
  {
    objc_msgSend(v7, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(a1 + 40), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[NSFileProviderKnownFolderDescriptor initWithKnownFolder:logicalLocation:detachOptions:]([NSFileProviderKnownFolderDescriptor alloc], "initWithKnownFolder:logicalLocation:detachOptions:", *(_QWORD *)(a1 + 48), v12, *(_QWORD *)(a1 + 72));
    v14 = *(void **)(a1 + 56);
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "detachKnownFolders:completionHandler:", v15, *(_QWORD *)(a1 + 64));

  }
}

- (void)attachItemWithID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  FPDaemonConnection *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__FPDaemonConnection_attachItemWithID_options_completionHandler___block_invoke;
  v13[3] = &unk_1E444D378;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a4;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v11, 1, 1, v13);

}

void __65__FPDaemonConnection_attachItemWithID_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      (*(void (**)(_QWORD, id))(v14 + 16))(*(_QWORD *)(a1 + 48), v9);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError((uint64_t)v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);

    }
  }
  else
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v7, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attachKnownFolders:options:completionHandler:", v13, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
}

- (void)attachItemWithID:(id)a3 completionHandler:(id)a4
{
  -[FPDaemonConnection attachItemWithID:options:completionHandler:](self, "attachItemWithID:options:completionHandler:", a3, 0, a4);
}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachKnownFolders:options:completionHandler:", v9, a4, v8);

}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v9 = a7;
  v19 = a3;
  v15 = a5;
  v16 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDaemonConnection.m"), 490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:", v19, a4, v15, a6, v9, v16);

}

- (void)bookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bookmarkableStringFromDocumentURL:completionHandler:", v7, v6);

}

- (id)bookmarkableStringFromDocumentURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__FPDaemonConnection_bookmarkableStringFromDocumentURL_error___block_invoke;
  v12[3] = &unk_1E444D3A0;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v8, "bookmarkableStringFromDocumentURL:completionHandler:", v6, v12);

  if (a4)
  {
    v9 = (void *)v14[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __62__FPDaemonConnection_bookmarkableStringFromDocumentURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)documentURLFromBookmarkableString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__FPDaemonConnection_documentURLFromBookmarkableString_completionHandler___block_invoke;
  v10[3] = &unk_1E444D3C8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v7, 1, 1, v10);

}

void __74__FPDaemonConnection_documentURLFromBookmarkableString_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = a4;
    objc_msgSend(a2, "url");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

  }
}

- (id)documentURLFromBookmarkableString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__FPDaemonConnection_documentURLFromBookmarkableString_error___block_invoke;
  v12[3] = &unk_1E444D3F0;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v8, "documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v6, 1, 1, v12);

  if (a4)
  {
    v9 = (void *)v14[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __62__FPDaemonConnection_documentURLFromBookmarkableString_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a2, "url");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

}

- (void)dumpStateTo:(id)a3 limitNumberOfItems:(BOOL)a4 providerFilter:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dumpStateTo:limitNumberOfItems:providerFilter:completionHandler:", v12, v7, v11, v10);

}

- (void)getPersonaForProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getPersonaForProvider:completionHandler:", v7, v6);

}

- (void)copyDatabaseForFPCKStartingAtPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__15;
  v17[4] = __Block_byref_object_dispose__15;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__15;
  v15[4] = __Block_byref_object_dispose__15;
  v16 = 0;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__FPDaemonConnection_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke;
  v11[3] = &unk_1E444D468;
  v13 = v17;
  v14 = v15;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "copyDatabaseForFPCKStartingAtPath:completionHandler:", v6, v11);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

}

void __74__FPDaemonConnection_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke(_QWORD *a1, void *a2, id obj)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v10 = obj;
  v6 = a2;
  v7 = objc_msgSend(v6, "copy");

  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)waitForStabilizationOfDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "waitForStabilizationOfDomainWithID:completionHandler:", v7, v6);

}

- (void)spotlightReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "spotlightReindexAllItemsForBundleID:protectionClass:completionHandler:", v10, v9, v8);

}

- (void)spotlightReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "synchronousRemoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "spotlightReindexItemsWithIdentifiers:bundleID:protectionClass:completionHandler:", v13, v12, v11, v10);

}

- (void)_test_setDocIDResolutionPolicy:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_test_setDocIDResolutionPolicy:completionHandler:", v4, v6);

}

- (void)_test_retrieveItemWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__FPDaemonConnection__test_retrieveItemWithName_completionHandler___block_invoke;
  v10[3] = &unk_1E444D040;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "_test_retrieveItemWithName:completionHandler:", v7, v10);

}

void __67__FPDaemonConnection__test_retrieveItemWithName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)_test_callFileProviderManagerAPIs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_test_callFileProviderManagerAPIs:", v4);

}

- (void)makeTopologicallySortedItemsOnDisk:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeTopologicallySortedItemsOnDisk:completionHandler:", v7, v6);

}

- (id)makeTopologicallySortedItemsOnDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__FPDaemonConnection_makeTopologicallySortedItemsOnDisk_error___block_invoke;
  v12[3] = &unk_1E444D490;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v8, "makeTopologicallySortedItemsOnDisk:completionHandler:", v6, v12);

  v9 = (void *)v14[5];
  if (v9)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    v10 = (id)v20[5];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __63__FPDaemonConnection_makeTopologicallySortedItemsOnDisk_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)getURLForContainerWithItemID:(id)a3 inDataScopeDomainWithIdentifier:(id)a4 documentsScopeDomainIdentifier:(id)a5 documentsFolderItemIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __162__FPDaemonConnection_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke;
  v19[3] = &unk_1E444D3C8;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v17, "getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier:documentsFolderItemIdentifier:completionHandler:", v16, v15, v14, v13, v19);

}

void __162__FPDaemonConnection_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  objc_msgSend(a2, "url");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, id))(v6 + 16))(v6, v10, v9, v7);
}

- (void)backUpUserURL:(id)a3 outputUserURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke;
  v13[3] = &unk_1E444ADF0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "backUpUserURL:outputUserURL:completionHandler:", v10, v9, v13);

}

void __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void (*v16)(void);
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke_cold_2();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if (v10)
    {
      v17 = 0;
      v11 = objc_msgSend(v8, "removeItemAtURL:error:", v5, &v17);
      v12 = v17;
      if ((v11 & 1) == 0)
      {
        fp_current_or_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke_cold_1();

      }
    }
    objc_msgSend(v6, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v15 = objc_msgSend(v6, "code");

      if (v15 == 4099)
      {
        v16 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_16:
        v16();

        goto LABEL_17;
      }
    }
    else
    {

    }
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_17:

}

- (void)restoreUserURL:(id)a3 completionHandler:(id)a4
{
  -[FPDaemonConnection restoreUserURL:fromBuild:restoreType:completionHandler:](self, "restoreUserURL:fromBuild:restoreType:completionHandler:", a3, 0, 0, a4);
}

- (void)restoreUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "restoreUserURL:fromBuild:restoreType:cleanupOnSuccess:completionHandler:", v13, v12, v11, 1, v10);

}

- (void)restoreUserURL:(id)a3 cleanupOnSuccess:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "restoreUserURL:fromBuild:restoreType:cleanupOnSuccess:completionHandler:", v9, 0, CFSTR("fileproviderctl"), v5, v8);

}

- (void)stateForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__FPDaemonConnection_stateForDomainWithID_completionHandler___block_invoke;
  v10[3] = &unk_1E444D4B8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "stateForDomainWithID:completionHandler:", v7, v10);

}

uint64_t __61__FPDaemonConnection_stateForDomainWithID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 url:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  -[FPDaemonConnection runFPCKForDomainWithID:databasesBackupsPath:options:reason:completionHandler:](self, "runFPCKForDomainWithID:databasesBackupsPath:options:reason:completionHandler:", a3, a4, a6, 128, a7);
}

- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 url:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 completionHandler:(id)a8
{
  -[FPDaemonConnection runFPCKForDomainWithID:databasesBackupsPath:options:reason:completionHandler:](self, "runFPCKForDomainWithID:databasesBackupsPath:options:reason:completionHandler:", a3, a4, a6, a7, a8);
}

- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 options:(unint64_t)a5 reason:(unint64_t)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v13 = a7;
  v14 = a4;
  v15 = a3;
  if (objc_msgSend(v14, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDaemonConnection.m"), 800, CFSTR("%s Too many arguments supplied for databasesBackupsPath."), "-[FPDaemonConnection runFPCKForDomainWithID:databasesBackupsPath:options:reason:completionHandler:]");

  }
  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v14, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v18);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v14, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPDaemonConnection runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:](self, "runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:", v15, v24, v22, a5, a6, 2, v13);
}

- (void)runFPCKForDomainWithID:(id)a3 domainRootURL:(id)a4 databaseBackupPath:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 launchType:(unint64_t)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v16 = a9;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:", v19, v18, v17, a6, a7, a8, v16);

}

- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dumpDatabaseAt:fullDump:writeTo:completionHandler:", v12, v7, v11, v10);

}

- (void)calculateNonPurgeableSpaceUsageOfDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calculateNonPurgeableSpaceUsageOfDomain:completionHandler:", v7, v6);

}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolveConflictAtURL:completionHandler:", v7, v6);

}

- (void)dumpIndexerInfoFor:(id)a3 withName:(id)a4 to:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FPDaemonConnection connectionProxy](self, "connectionProxy");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dumpIndexerInfoFor:withName:to:completionHandler:", v13, v12, v11, v10);

}

- (unsigned)user
{
  return self->_user;
}

- (void)setUser:(unsigned int)a3
{
  self->_user = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_getAttributeConnectionsIdleCleanupTimer, 0);
  objc_storeStrong((id *)&self->_getAttributeConnections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueueConnection, 0);
}

- (void)newXPCConnection
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __53__FPDaemonConnection_wakeUpForURL_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Cannot send wakeUp message to fileproviderd. Error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __98__FPDaemonConnection_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v5, v6, "[ERROR] Cannot evict item at URL %@ Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7();
}

void __71__FPDaemonConnection_evictItemWithID_evictionReason_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] Cannot evict item with id %@ Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Cannot query for providers. Error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __69__FPDaemonConnection_fetchDomainServicerForProviderDomainID_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] Cannot fetch remote file provider for identifier %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __78__FPDaemonConnection_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v5, v6, "[ERROR] Cannot convert URL %@ to a bookmarkable string. Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7();
}

void __64__FPDaemonConnection_forceIngestionForItemID_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Cannot forceIngestionOnDomainForItemID. Error: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __65__FPDaemonConnection_forceIngestionForItemIDs_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Cannot forceIngestionForItems. Error: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __74__FPDaemonConnection_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Cannot forceLatestVersionOnDiskForItemID. error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __61__FPDaemonConnection_valuesForAttributes_forItemAtURL_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] returning URL properties for %@\n value: %@", v6, 0x16u);

  OUTLINED_FUNCTION_7();
}

void __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] backup cleanup failed: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] backup failed: %@", v2);
  OUTLINED_FUNCTION_3();
}

@end
