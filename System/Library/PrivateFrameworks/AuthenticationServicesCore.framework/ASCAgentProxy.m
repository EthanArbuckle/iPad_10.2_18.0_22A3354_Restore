@implementation ASCAgentProxy

- (ASCAgentProxy)init
{
  return -[ASCAgentProxy initWithFailureHandler:](self, "initWithFailureHandler:", 0);
}

- (ASCAgentProxy)initWithFailureHandler:(id)a3
{
  id v4;
  ASCAgentProxy *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  id failureHandler;
  ASCAgentProxy *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASCAgentProxy;
  v5 = -[ASCAgentProxy init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1988]);
    ASCAgentServiceName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithMachServiceName:options:", v7, 0);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v8;

    v5->_connectionLock._os_unfair_lock_opaque = 0;
    v10 = _Block_copy(v4);
    failureHandler = v5->_failureHandler;
    v5->_failureHandler = v10;

    -[ASCAgentProxy _setUpConnection:](v5, "_setUpConnection:", v5->_connection);
    v12 = v5;
  }

  return v5;
}

- (void)_setUpConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  +[ASCAgentInterface xpcInterface](ASCAgentInterface, "xpcInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__ASCAgentProxy__setUpConnection___block_invoke;
  aBlock[3] = &unk_24C97F4D8;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v9 = v6;
  v7 = _Block_copy(aBlock);
  objc_msgSend(v6, "setInvalidationHandler:", v7);
  objc_msgSend(v6, "setInterruptionHandler:", v7);
  objc_msgSend(v6, "resume");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __34__ASCAgentProxy__setUpConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 4;
    v7 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    v4 = v7;
    v5 = *(void **)(a1 + 32);
    if (v5 == *(void **)&v7[2]._os_unfair_lock_opaque)
    {
      *(_QWORD *)&v7[2]._os_unfair_lock_opaque = 0;

      v4 = v7;
    }
    v6 = *(_QWORD *)&v4[8]._os_unfair_lock_opaque;
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    os_unfair_lock_unlock(v3);
    WeakRetained = v7;
  }

}

- (void)dealloc
{
  os_unfair_lock_s *p_connectionLock;
  NSXPCConnection *v4;
  objc_super v5;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_connectionLock);
  -[NSXPCConnection invalidate](v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)ASCAgentProxy;
  -[ASCAgentProxy dealloc](&v5, sel_dealloc);
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[ASCAgentProxy _reconnectIfNecessary](self, "_reconnectIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__ASCAgentProxy__remoteObjectProxyWithErrorHandler___block_invoke;
  v13[3] = &unk_24C97F500;
  v6 = v4;
  v14 = v6;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:].cold.1(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x24BDD1128], 14, CFSTR("Failed to acquire remote object proxy."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v11);

  }
  return v8;
}

void __52__ASCAgentProxy__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__ASCAgentProxy__remoteObjectProxyWithErrorHandler___block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)performAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ASCAgentProxy _savedAccountContextFromSafariApplicationWithRequestContext:](self, "_savedAccountContextFromSafariApplicationWithRequestContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSavedAccountContext:", v8);

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke;
  v15[3] = &unk_24C97F528;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_7;
  v13[3] = &unk_24C97E8F0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "performAuthorizationRequestsForContext:withCompletionHandler:", v7, v13);

}

void __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97E868;
  v7 = v3;
  v5 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

uint64_t __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearAllPlatformPublicKeyCredentialsWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke;
  v9[3] = &unk_24C97F578;
  v9[4] = self;
  v11 = a2;
  v6 = v5;
  v10 = v6;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "clearAllPlatformPublicKeyCredentialsWithCompletionHandler:", v6);

}

void __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(a1[5] + 16))();

}

void __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  ASCAgentProxy *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __75__ASCAgentProxy_getShouldUseAlternateCredentialStoreWithCompletionHandler___block_invoke;
  v10 = &unk_24C97F528;
  v11 = self;
  v12 = v4;
  v5 = v4;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getShouldUseAlternateCredentialStoreWithCompletionHandler:", v5, v7, v8, v9, v10, v11);

}

void __75__ASCAgentProxy_getShouldUseAlternateCredentialStoreWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ASCAgentProxy_getShouldUseAlternateCredentialStoreWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97E868;
  v7 = v3;
  v5 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __75__ASCAgentProxy_getShouldUseAlternateCredentialStoreWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ASCAgentProxy *v14;
  id v15;

  v6 = a4;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __79__ASCAgentProxy_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke;
  v13 = &unk_24C97F528;
  v14 = self;
  v15 = v6;
  v7 = v6;
  v8 = a3;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getArePasskeysDisallowedForRelyingParty:withCompletionHandler:", v8, v7, v10, v11, v12, v13, v14);

}

void __79__ASCAgentProxy_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__ASCAgentProxy_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97E868;
  v7 = v3;
  v5 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__ASCAgentProxy_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)openCABLEURL:(id)a3 fromSourceApplication:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *activity;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  SEL v21;
  _QWORD block[4];
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  activity = self->_activity;
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke;
  block[3] = &unk_24C97EE08;
  v14 = v9;
  v23 = v14;
  v15 = v10;
  v24 = v15;
  os_activity_apply(activity, block);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_9;
  v19[3] = &unk_24C97F578;
  v19[4] = self;
  v21 = a2;
  v16 = v11;
  v20 = v16;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "openCABLEURL:fromSourceApplication:withCompletionHandler:", v14, v15, v16);

}

void __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138478083;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_DEFAULT, "Open caBLE URL: %{private}@, sourceApplication: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_9(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(a1[5] + 16))();

}

void __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)browserPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *activity;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *);
  void *v18;
  ASCAgentProxy *v19;
  id v20;
  SEL v21;
  _QWORD block[4];
  id v23;

  v7 = a3;
  v8 = a4;
  activity = self->_activity;
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke;
  block[3] = &unk_24C97E868;
  v11 = v7;
  v23 = v11;
  os_activity_apply(activity, block);
  v15 = v10;
  v16 = 3221225472;
  v17 = __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke_10;
  v18 = &unk_24C97F578;
  v19 = self;
  v21 = a2;
  v12 = v8;
  v20 = v12;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "browserPasskeysForRelyingParty:completionHandler:", v11, v12, v15, v16, v17, v18, v19);

}

void __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138477827;
    v5 = v3;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_INFO, "Browser requested passkeys for %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

void __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke_10(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(a1[5] + 16))();

}

void __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __89__ASCAgentProxy_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke;
  v12[3] = &unk_24C97F578;
  v12[4] = self;
  v14 = a2;
  v9 = v8;
  v13 = v9;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "getCanCurrentProcessAccessPasskeysForRelyingParty:withCompletionHandler:", v7, v9);

}

void __89__ASCAgentProxy_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__ASCAgentProxy_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(_QWORD, BOOL))(a1[5] + 16))(a1[5], objc_msgSend(v6, "code") == 4099);

}

void __89__ASCAgentProxy_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)performSilentAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E648000, v8, OS_LOG_TYPE_INFO, "Asked to perform silent request.", buf, 2u);
  }
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_24C97E8F0;
  v10 = v6;
  v20 = v10;
  v11 = _Block_copy(aBlock);
  v14 = v9;
  v15 = 3221225472;
  v16 = __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2;
  v17 = &unk_24C97F500;
  v18 = v10;
  v12 = v10;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performSilentAuthorizationRequestsForContext:withCompletionHandler:", v7, v11, v14, v15, v16, v17);

}

uint64_t __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_20E648000, v8, OS_LOG_TYPE_INFO, "Asked to look up passkey data for %{public}@.", buf, 0xCu);
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__ASCAgentProxy_getPasskeysDataForRelyingParty_withCompletionHandler___block_invoke;
  v11[3] = &unk_24C97F500;
  v12 = v7;
  v9 = v7;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getPasskeysDataForRelyingParty:withCompletionHandler:", v6, v9);

}

void __70__ASCAgentProxy_getPasskeysDataForRelyingParty_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_20E648000, v12, OS_LOG_TYPE_INFO, "Asked to delete passkey %{public}@ for %{public}@.", buf, 0x16u);
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __81__ASCAgentProxy_deletePasskeyForRelyingParty_withCredentialID_completionHandler___block_invoke;
  v16[3] = &unk_24C97F578;
  v16[4] = self;
  v18 = a2;
  v13 = v11;
  v17 = v13;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "deletePasskeyForRelyingParty:withCredentialID:completionHandler:", v9, v10, v13);

}

void __81__ASCAgentProxy_deletePasskeyForRelyingParty_withCredentialID_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__ASCAgentProxy_deletePasskeyForRelyingParty_withCredentialID_completionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(a1[5] + 16))();

}

void __81__ASCAgentProxy_deletePasskeyForRelyingParty_withCredentialID_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl(&dword_20E648000, v9, OS_LOG_TYPE_INFO, "Asked to delete all passkeys for %{public}@.", buf, 0xCu);
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__ASCAgentProxy_deleteAllPasskeysForRelyingParty_completionHandler___block_invoke;
  v13[3] = &unk_24C97F578;
  v13[4] = self;
  v15 = a2;
  v10 = v8;
  v14 = v10;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "deleteAllPasskeysForRelyingParty:completionHandler:", v7, v10);

}

void __68__ASCAgentProxy_deleteAllPasskeysForRelyingParty_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ASCAgentProxy_deleteAllPasskeysForRelyingParty_completionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(a1[5] + 16))();

}

void __68__ASCAgentProxy_deleteAllPasskeysForRelyingParty_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E648000, v5, OS_LOG_TYPE_INFO, "Asked to preflight creating passkey in iCloud Keychain.", buf, 2u);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__ASCAgentProxy_preflightCanCreateICloudKeychainPasskeyWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C97F500;
  v9 = v4;
  v6 = v4;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:", v6);

}

void __78__ASCAgentProxy_preflightCanCreateICloudKeychainPasskeyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    v17 = v8;
    v18 = 2113;
    v19 = v9;
    _os_log_impl(&dword_20E648000, v11, OS_LOG_TYPE_INFO, "Asked to rename passkey %{public}@ to %{private}@.", buf, 0x16u);
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__ASCAgentProxy_renamePasskeyWithCredentialID_newName_completionHandler___block_invoke;
  v14[3] = &unk_24C97F500;
  v15 = v10;
  v12 = v10;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renamePasskeyWithCredentialID:newName:completionHandler:", v8, v9, v12);

}

void __73__ASCAgentProxy_renamePasskeyWithCredentialID_newName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)openCredentialProviderAppSettingsWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__ASCAgentProxy_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke;
  v9[3] = &unk_24C97F578;
  v9[4] = self;
  v11 = a2;
  v6 = v5;
  v10 = v6;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "openCredentialProviderAppSettingsWithCompletionHandler:", v6);

}

void __72__ASCAgentProxy_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ASCAgentProxy_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(a1[5] + 16))();

}

void __72__ASCAgentProxy_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)openVerificationCodeAppSettingsWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__ASCAgentProxy_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke;
  v9[3] = &unk_24C97F578;
  v9[4] = self;
  v11 = a2;
  v6 = v5;
  v10 = v6;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "openVerificationCodeAppSettingsWithCompletionHandler:", v6);

}

void __70__ASCAgentProxy_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ASCAgentProxy_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(a1[5] + 16))();

}

void __70__ASCAgentProxy_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__ASCAgentProxy_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke;
  v9[3] = &unk_24C97F578;
  v9[4] = self;
  v11 = a2;
  v6 = v5;
  v10 = v6;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "requestToTurnOnCredentialProviderExtensionWithCompletionHandler:", v6);

}

void __81__ASCAgentProxy_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(NSObject **)(a1[4] + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__ASCAgentProxy_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C97F550;
  v5 = a1[6];
  v8 = v3;
  v9 = v5;
  v6 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(a1[5] + 16))();

}

void __81__ASCAgentProxy_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (void)cancelCurrentRequest
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  os_activity_apply((os_activity_t)self->_activity, &__block_literal_global_2);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__ASCAgentProxy_cancelCurrentRequest__block_invoke_11;
  v6[3] = &unk_24C97F5C0;
  v6[4] = self;
  v6[5] = a2;
  -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "cancelCurrentRequest");

}

void __37__ASCAgentProxy_cancelCurrentRequest__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E648000, v0, OS_LOG_TYPE_DEFAULT, "Client asked to cancel request.", v1, 2u);
  }
}

void __37__ASCAgentProxy_cancelCurrentRequest__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ASCAgentProxy_cancelCurrentRequest__block_invoke_2;
  block[3] = &unk_24C97F550;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  os_activity_apply(v5, block);

}

void __37__ASCAgentProxy_cancelCurrentRequest__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
}

- (id)_savedAccountContextFromSafariApplicationWithRequestContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  Class v7;
  Class v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE82DC0], "defaultContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_isSafariFamilyApplicationBundle");

  if ((v6 & 1) != 0 && (v7 = NSClassFromString(CFSTR("UIApplication"))) != 0)
  {
    v8 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class sharedApplication](v8, "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_254A4D2B8))
    {
      objc_msgSend(v3, "globalFrameID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "webPageID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "savedAccountContextForWebPageID:", objc_msgSend(v12, "unsignedLongLongValue"));
      v13 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v13;
    }
    v10 = v4;

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (id)_reconnectIfNecessary
{
  os_unfair_lock_s *p_connectionLock;
  NSXPCConnection *connection;
  id v5;
  void *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  connection = self->_connection;
  if (!connection)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    ASCAgentServiceName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", v6, 0);
    v8 = self->_connection;
    self->_connection = v7;

    -[ASCAgentProxy _setUpConnection:](self, "_setUpConnection:", self->_connection);
    connection = self->_connection;
  }
  v9 = connection;
  os_unfair_lock_unlock(p_connectionLock);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_remoteObjectProxyWithErrorHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E648000, log, OS_LOG_TYPE_ERROR, "Failed to acquire remote object proxy.", v1, 2u);
}

void __52__ASCAgentProxy__remoteObjectProxyWithErrorHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Remote proxy object error handler invoked with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v4, v5, "Connection to agent service interrupted with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_4_1(a1, a2);
  v4 = (const char *)OUTLINED_FUNCTION_7();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20E648000, v6, v7, "Could not create AuthenticationServicesAgent proxy object in %{public}@: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_3_1();
}

void __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Connection to agent service interrupted with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
