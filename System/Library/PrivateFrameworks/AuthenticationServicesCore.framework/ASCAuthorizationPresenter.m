@implementation ASCAuthorizationPresenter

- (ASCAuthorizationPresenter)init
{
  ASCAuthorizationPresenter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *invalidationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *interfaceUpdateQueue;
  ASCAuthorizationPresenter *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASCAuthorizationPresenter;
  v2 = -[ASCAuthorizationPresenter init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationPresenterInvalidationQueue", 0);
    invalidationQueue = v2->_invalidationQueue;
    v2->_invalidationQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationPresenterInterfaceUpdateQueue", 0);
    interfaceUpdateQueue = v2->_interfaceUpdateQueue;
    v2->_interfaceUpdateQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)presentAuthorizationWithContext:(id)a3 forProcess:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id credentialResultHandler;
  NSXPCListener *v17;
  NSXPCListener *remoteListener;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  SBSRemoteAlertHandle *v25;
  SBSRemoteAlertHandle *remoteAlertHandle;
  char v27;
  SBSRemoteAlertHandle *v28;
  NSObject *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v43 = 0;
  v11 = -[ASCAuthorizationPresenter _isPresentationContextValid:error:](self, "_isPresentationContextValid:error:", v8, &v43);
  v12 = v43;
  if (v11)
  {
    v42 = v12;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v42);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v42;

    if (v13)
    {
      v15 = _Block_copy(v10);
      credentialResultHandler = self->_credentialResultHandler;
      self->_credentialResultHandler = v15;

      objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
      v17 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
      remoteListener = self->_remoteListener;
      self->_remoteListener = v17;

      -[NSXPCListener setDelegate:](self->_remoteListener, "setDelegate:", self);
      -[NSXPCListener resume](self->_remoteListener, "resume");
      v46 = CFSTR("ASCAuthorizationPresentationContextData");
      v47[0] = v13;
      v40 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(MEMORY[0x24BEB0AE8]);
      v21 = objc_msgSend(v20, "initWithServiceName:viewControllerClassName:", authenticationServicesViewServiceBundleIdentifier, CFSTR("ASViewServiceViewController"));
      v22 = (void *)objc_opt_new();
      -[NSXPCListener endpoint](self->_remoteListener, "endpoint");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_endpoint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setXpcEndpoint:", v24);

      objc_msgSend(v22, "setUserInfo:", v19);
      v41 = (void *)v21;
      v25 = (SBSRemoteAlertHandle *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v21, v22);
      remoteAlertHandle = self->_remoteAlertHandle;
      self->_remoteAlertHandle = v25;

      v27 = objc_opt_respondsToSelector();
      v28 = self->_remoteAlertHandle;
      if ((v27 & 1) != 0)
        -[SBSRemoteAlertHandle registerObserver:](v28, "registerObserver:", self);
      else
        -[SBSRemoteAlertHandle addObserver:](v28, "addObserver:", self);
      v30 = MKBGetDeviceLockState();
      v13 = v40;
      if (v30 && v30 != 3)
      {
        v35 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[ASCAuthorizationPresenter presentAuthorizationWithContext:forProcess:completionHandler:].cold.2();
        v36 = (void *)MEMORY[0x24BDD1540];
        v44 = *MEMORY[0x24BDD0FD8];
        v45 = CFSTR("Device must be unlocked to perform request.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1, v19);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAuthorizationPresenter _invalidateWithError:](self, "_invalidateWithError:", v37);

        v19 = v39;
      }
      else
      {
        v31 = (void *)objc_opt_new();
        if (v9)
        {
          objc_msgSend(MEMORY[0x24BEB0B10], "predicateForProcess:", v9);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "windowSceneIdentifier");
          v38 = v19;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setScenePersistentIdentifier:", v33);

          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0B08]), "initWithTargetPredicate:", v32);
          objc_msgSend(v31, "setPresentationTarget:", v34);

          v19 = v38;
        }
        -[SBSRemoteAlertHandle activateWithContext:](self->_remoteAlertHandle, "activateWithContext:", v31);
      }

    }
    else
    {
      v29 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ASCAuthorizationPresenter presentAuthorizationWithContext:forProcess:completionHandler:].cold.1(v29);
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v14);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
    v14 = v12;
  }

}

- (void)presentError:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v7 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__ASCAuthorizationPresenter_presentError_forService_completionHandler___block_invoke;
  v10[3] = &unk_24C97F748;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __71__ASCAuthorizationPresenter_presentError_forService_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  __CFString *alertHeader;

  v2 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, *(_QWORD *)(a1 + 32));
  alertHeader = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceClass");

  if (v5 == 3)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
  }
  else
  {
    if (v5 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x24BDD17C8];
  }
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, *(_QWORD *)(a1 + 32));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v9 = (const __CFString *)_WBSLocalizedString();
  CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, alertHeader, v8, v9, 0, 0, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateInterfaceWithLoginChoices:(id)a3
{
  id v4;
  NSObject *interfaceUpdateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ASCAuthorizationPresenter_updateInterfaceWithLoginChoices___block_invoke;
  v7[3] = &unk_24C97EE08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(interfaceUpdateQueue, v7);

}

void __61__ASCAuthorizationPresenter_updateInterfaceWithLoginChoices___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(v2 + 48);
  if (v3)
    objc_msgSend(v3, "updateInterfaceWithLoginChoices:", v1);
  else
    objc_storeStrong((id *)(v2 + 64), v1);
}

- (void)presentPINEntryInterface
{
  NSObject *interfaceUpdateQueue;
  _QWORD block[5];

  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__ASCAuthorizationPresenter_presentPINEntryInterface__block_invoke;
  block[3] = &unk_24C97E868;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

void *__53__ASCAuthorizationPresenter_presentPINEntryInterface__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *result;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(void **)(v1 + 48);
  if (result)
    return (void *)objc_msgSend(result, "presentPINEntryInterface");
  *(_BYTE *)(v1 + 72) = 1;
  return result;
}

- (void)updateInterfaceForUserVisibleError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"));

  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(v4, "code");
    if ((unint64_t)(v7 - 4) < 4 || v7 == 13)
    {
      -[ASCViewServiceProtocol updateInterfaceForUserVisibleError:](self->_viewServiceProxy, "updateInterfaceForUserVisibleError:", v4);
    }
    else
    {
      v9 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ASCAuthorizationPresenter updateInterfaceForUserVisibleError:].cold.1(v9);
    }
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ASCAuthorizationPresenter updateInterfaceForUserVisibleError:].cold.2(v8);
  }

}

- (void)dismiss
{
  NSObject *interfaceUpdateQueue;
  _QWORD block[5];

  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__ASCAuthorizationPresenter_dismiss__block_invoke;
  block[3] = &unk_24C97E868;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

uint64_t __36__ASCAuthorizationPresenter_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "dismiss");
}

- (void)dismissWithError:(id)a3
{
  id v4;
  NSObject *interfaceUpdateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__ASCAuthorizationPresenter_dismissWithError___block_invoke;
  v7[3] = &unk_24C97EE08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(interfaceUpdateQueue, v7);

}

uint64_t __46__ASCAuthorizationPresenter_dismissWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "dismissWithError:", *(_QWORD *)(a1 + 40));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char HasEntitlement;
  void *v10;
  void *v11;
  ASCViewServiceProtocol *v12;
  ASCViewServiceProtocol *viewServiceProxy;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "auditToken");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  HasEntitlement = WBSAuditTokenHasEntitlement();
  if ((HasEntitlement & 1) != 0)
  {
    objc_storeStrong((id *)&self->_viewServiceConnection, a4);
    +[ASCAuthorizationPresenterHostInterface xpcInterface](ASCAuthorizationPresenterHostInterface, "xpcInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_viewServiceConnection, "setExportedInterface:", v10);

    -[NSXPCConnection setExportedObject:](self->_viewServiceConnection, "setExportedObject:", self);
    +[ASCViewServiceInterface xpcInterface](ASCViewServiceInterface, "xpcInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_viewServiceConnection, "setRemoteObjectInterface:", v11);

    -[NSXPCConnection resume](self->_viewServiceConnection, "resume");
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_viewServiceConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
    v12 = (ASCViewServiceProtocol *)objc_claimAutoreleasedReturnValue();
    viewServiceProxy = self->_viewServiceProxy;
    self->_viewServiceProxy = v12;

    -[ASCAuthorizationPresenter _performQueuedUpdatesIfNecessary](self, "_performQueuedUpdatesIfNecessary");
    v14 = WBS_LOG_CHANNEL_PREFIXServiceLifecycle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_20E648000, v14, OS_LOG_TYPE_DEFAULT, "Accepting connection", v17, 2u);
    }
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ASCAuthorizationPresenter listener:shouldAcceptNewConnection:].cold.1();
    -[SBSRemoteAlertHandle invalidate](self->_remoteAlertHandle, "invalidate");
  }

  return HasEntitlement;
}

void __64__ASCAuthorizationPresenter_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __64__ASCAuthorizationPresenter_listener_shouldAcceptNewConnection___block_invoke_cold_1();
}

- (BOOL)_isPresentationContextValid:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "cableAuthenticatorURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_2;
  objc_msgSend(v5, "loginChoices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

  }
  else
  {
    v10 = objc_msgSend(v5, "isProxiedRequest");

    if ((v10 & 1) == 0)
    {
      if (!a4)
      {
LABEL_14:
        v7 = 0;
        goto LABEL_3;
      }
      v12 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0FD8];
      v20[0] = CFSTR("Invalid request: 0 login choices");
      v13 = (void *)MEMORY[0x24BDBCE70];
      v14 = (const __CFString **)v20;
      v15 = &v19;
LABEL_13:
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
  }
  if (!objc_msgSend(v5, "isRegistrationRequest"))
  {
LABEL_2:
    v7 = 1;
    goto LABEL_3;
  }
  v11 = objc_msgSend(v5, "requestTypes");
  v7 = (v11 & 0xFFFFFFFFFFFFFFABLL) == 0;
  if (a4 && (v11 & 0xFFFFFFFFFFFFFFABLL) != 0)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FD8];
    v18 = CFSTR("Registration requests cannot be used with other types of requests.");
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = &v18;
    v15 = &v17;
    goto LABEL_13;
  }
LABEL_3:

  return v7;
}

- (void)_performQueuedUpdatesIfNecessary
{
  NSObject *interfaceUpdateQueue;
  _QWORD block[5];

  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ASCAuthorizationPresenter__performQueuedUpdatesIfNecessary__block_invoke;
  block[3] = &unk_24C97E868;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

void __61__ASCAuthorizationPresenter__performQueuedUpdatesIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 64))
  {
    objc_msgSend(*(id *)(v2 + 48), "updateInterfaceWithLoginChoices:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 72))
  {
    objc_msgSend(*(id *)(v2 + 48), "presentPINEntryInterface");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 73))
  {
    objc_msgSend(*(id *)(v2 + 48), "cableClientWillConnect");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 74))
  {
    objc_msgSend(*(id *)(v2 + 48), "cableClientWillAuthenticate");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 74) = 0;
  }
}

- (void)_invalidateWithError:(id)a3
{
  id v4;
  NSObject *invalidationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  invalidationQueue = self->_invalidationQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__ASCAuthorizationPresenter__invalidateWithError___block_invoke;
  v7[3] = &unk_24C97EE08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(invalidationQueue, v7);

}

void __50__ASCAuthorizationPresenter__invalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
}

- (void)cableClientWillConnect
{
  NSObject *interfaceUpdateQueue;
  _QWORD block[5];

  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ASCAuthorizationPresenter_cableClientWillConnect__block_invoke;
  block[3] = &unk_24C97E868;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

void *__51__ASCAuthorizationPresenter_cableClientWillConnect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *result;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(void **)(v1 + 48);
  if (result)
    return (void *)objc_msgSend(result, "cableClientWillConnect");
  *(_BYTE *)(v1 + 73) = 1;
  return result;
}

- (void)cableClientWillAuthenticate
{
  NSObject *interfaceUpdateQueue;
  _QWORD block[5];

  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ASCAuthorizationPresenter_cableClientWillAuthenticate__block_invoke;
  block[3] = &unk_24C97E868;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

void *__56__ASCAuthorizationPresenter_cableClientWillAuthenticate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *result;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(void **)(v1 + 48);
  if (result)
    return (void *)objc_msgSend(result, "cableClientWillAuthenticate");
  *(_BYTE *)(v1 + 74) = 1;
  return result;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  NSObject *v4;
  void *v5;

  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ASCAuthorizationPresenter remoteAlertHandleDidDeactivate:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAuthorizationPresenter _invalidateWithError:](self, "_invalidateWithError:", v5);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  v5 = a4;
  v6 = -[ASCAuthorizationPresenter _isErrorDueToNewAlertHandleRequest:](self, "_isErrorDueToNewAlertHandleRequest:", v5);
  v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      v9 = 2;
      _os_log_impl(&dword_20E648000, v8, OS_LOG_TYPE_INFO, "Alert handle deactivated by new request.", v11, 2u);
    }
    else
    {
      v9 = 2;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ASCAuthorizationPresenter remoteAlertHandle:didInvalidateWithError:].cold.1(v8);
    v9 = 1;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAuthorizationPresenter _invalidateWithError:](self, "_invalidateWithError:", v10);

}

- (BOOL)_isErrorDueToNewAlertHandleRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BEB0D08];
  v8[0] = &unk_24C990560;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "safari_matchesErrorDomainsAndCodes:", v5);

  return (char)v3;
}

- (void)authorizationRequestInitiatedWithLoginChoice:(id)a3 authenticatedContext:(id)a4 completionHandler:(id)a5
{
  ASCAuthorizationPresenterDelegate **p_delegate;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authorizationPresenter:credentialRequestedForLoginChoice:authenticatedContext:completionHandler:", self, v11, v10, v9);

}

- (void)authorizationRequestFinishedWithCredential:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id WeakRetained;
  void (**credentialResultHandler)(id, id, id);
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "authorizationPresenter:didFinishWithCredential:error:", self, v13, v8);

  credentialResultHandler = (void (**)(id, id, id))self->_credentialResultHandler;
  if (credentialResultHandler)
  {
    credentialResultHandler[2](credentialResultHandler, v13, v8);
    v12 = self->_credentialResultHandler;
    self->_credentialResultHandler = 0;

  }
  v9[2](v9);

}

- (void)validateUserEnteredPIN:(id)a3 completionHandler:(id)a4
{
  ASCAuthorizationPresenterDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authorizationPresenter:validateUserEnteredPIN:completionHandler:", self, v8, v7);

}

- (void)initializeClientToViewServiceConnection
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = WBS_LOG_CHANNEL_PREFIXServiceLifecycle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_DEFAULT, "Connection initialized", v3, 2u);
  }
}

- (void)startCABLEAuthenticationWithCompletionHandler:(id)a3
{
  ASCAuthorizationPresenterDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authorizationPresenter:startCABLEAuthenticationWithCompletionHandler:", self, v5);

}

- (ASCAuthorizationPresenterDelegate)delegate
{
  return (ASCAuthorizationPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loginChoicesForQueuedUpdate, 0);
  objc_storeStrong((id *)&self->_interfaceUpdateQueue, 0);
  objc_storeStrong((id *)&self->_viewServiceProxy, 0);
  objc_storeStrong((id *)&self->_viewServiceConnection, 0);
  objc_storeStrong((id *)&self->_invalidationQueue, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong(&self->_credentialResultHandler, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
}

- (void)presentAuthorizationWithContext:(void *)a1 forProcess:completionHandler:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Failed to get context data for presentation with error: %{private}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)presentAuthorizationWithContext:forProcess:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Cancelling request because we are trying to present UI but the device is not unlocked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateInterfaceForUserVisibleError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "code");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v2, v3, "Asked to display error with unrecognized code: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)updateInterfaceForUserVisibleError:(void *)a1 .cold.2(void *a1)
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
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Asked to present unsupported error: %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Invalid process tried to connect to AuthenticationServicesAgent acting as AuthenticationServicesUI.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __64__ASCAuthorizationPresenter_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Failed to connect client process to AuthenticationServices view service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)remoteAlertHandleDidDeactivate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20E648000, v0, v1, "Alert handle deactivated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)remoteAlertHandle:(void *)a1 didInvalidateWithError:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Alert handle invalidated with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
