@implementation SORemoteExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_0);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __59__SORemoteExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549EC0C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_54);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

void __61__SORemoteExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DA3F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

}

- (void)saveRequest:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  SORemoteExtensionContext *v8;
  NSMapTable *requests;
  uint64_t v10;
  NSMapTable *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  SORemoteExtensionContext *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  requests = v8->_requests;
  if (!requests)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v8->_requests;
    v8->_requests = (NSMapTable *)v10;

    requests = v8->_requests;
  }
  -[NSMapTable setObject:forKey:](requests, "setObject:forKey:", v6, v7);
  SO_LOG_SORemoteExtensionContext();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMapTable count](v8->_requests, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[SORemoteExtensionContext saveRequest:forIdentifier:]";
    v16 = 2114;
    v17 = v13;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_20DABC000, v12, OS_LOG_TYPE_DEFAULT, "%s current requests: %{public}@ on %@", (uint8_t *)&v14, 0x20u);

  }
  objc_sync_exit(v8);

}

- (id)findRequestForIdentifier:(id)a3
{
  id v4;
  SORemoteExtensionContext *v5;
  NSMapTable *requests;
  uint64_t v7;
  NSMapTable *v8;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  requests = v5->_requests;
  if (!requests)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v5->_requests;
    v5->_requests = (NSMapTable *)v7;

    requests = v5->_requests;
  }
  -[NSMapTable objectForKey:](requests, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v9;
}

- (void)removeRequestForIdentifier:(id)a3
{
  id v4;
  SORemoteExtensionContext *v5;
  NSMapTable *requests;
  uint64_t v7;
  NSMapTable *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  SORemoteExtensionContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  requests = v5->_requests;
  if (!requests)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v5->_requests;
    v5->_requests = (NSMapTable *)v7;

    requests = v5->_requests;
  }
  -[NSMapTable removeObjectForKey:](requests, "removeObjectForKey:", v4);
  SO_LOG_SORemoteExtensionContext();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMapTable count](v5->_requests, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[SORemoteExtensionContext removeRequestForIdentifier:]";
    v13 = 2114;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_20DABC000, v9, OS_LOG_TYPE_DEFAULT, "%s current requests: %{public}@ on %@", (uint8_t *)&v11, 0x20u);

  }
  objc_sync_exit(v5);

}

- (ASAuthorizationProviderExtensionAuthorizationRequestHandler)extensionViewController
{
  ASAuthorizationProviderExtensionAuthorizationRequestHandler *extensionAuthorizationRequestHandler;

  extensionAuthorizationRequestHandler = self->_extensionAuthorizationRequestHandler;
  if (extensionAuthorizationRequestHandler)
    return extensionAuthorizationRequestHandler;
  -[SORemoteExtensionContext _principalObject](self, "_principalObject");
  return (ASAuthorizationProviderExtensionAuthorizationRequestHandler *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)authorizationRequestHandlerWithRequestParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;

  if (objc_msgSend(a3, "isUserInteractionEnabled"))
  {
    -[SORemoteExtensionContext extensionViewController](self, "extensionViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 && !v6)
    {
      objc_msgSend(getSOErrorHelperClass(), "internalErrorWithMessage:", CFSTR("failed to get extension view controller"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      *a4 = v7;
    }
  }
  else
  {
    -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:](self, "extensionAuthorizationRequestHandlerWithError:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)extensionAuthorizationRequestHandlerWithError:(id *)a3
{
  ASAuthorizationProviderExtensionAuthorizationRequestHandler *v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  objc_class *v20;
  ASAuthorizationProviderExtensionAuthorizationRequestHandler *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  ASAuthorizationProviderExtensionAuthorizationRequestHandler *extensionAuthorizationRequestHandler;
  NSObject *v31;
  id SOErrorHelperClass;
  const __CFString *v33;
  NSObject *v34;
  NSObject *v35;

  if (!self->_extensionAuthorizationRequestHandler)
  {
    SO_LOG_SORemoteExtensionContext();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:].cold.4(v7, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "infoDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = NSClassFromString(v18);
      if (v20)
      {
        v21 = (ASAuthorizationProviderExtensionAuthorizationRequestHandler *)objc_alloc_init(v20);
        goto LABEL_14;
      }
      SO_LOG_SORemoteExtensionContext();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:].cold.3();

      if (a3)
      {
        SOErrorHelperClass = getSOErrorHelperClass();
        v33 = CFSTR("failed to get extension principalClass");
LABEL_24:
        objc_msgSend(SOErrorHelperClass, "internalErrorWithMessage:", v33);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("NSExtensionMainStoryboard"));
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        SO_LOG_SORemoteExtensionContext();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:].cold.1();

        if (!a3)
          goto LABEL_30;
        SOErrorHelperClass = getSOErrorHelperClass();
        v33 = CFSTR("failed to get extension NSExtensionPrincipalClass or NSExtensionMainStoryboard");
        goto LABEL_24;
      }
      v23 = (void *)v22;
      v24 = (void *)MEMORY[0x24BDF6E00];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "storyboardWithName:bundle:", v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "instantiateInitialViewController");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v21 = (ASAuthorizationProviderExtensionAuthorizationRequestHandler *)v27;

LABEL_14:
        objc_msgSend(MEMORY[0x24BDD19B0], "_sharedExtensionContextVendor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SORemoteExtensionContext _UUID](self, "_UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_setPrincipalObject:forUUID:", v21, v29);

        extensionAuthorizationRequestHandler = self->_extensionAuthorizationRequestHandler;
        self->_extensionAuthorizationRequestHandler = v21;

        if (!a3)
          goto LABEL_4;
        goto LABEL_3;
      }
      SO_LOG_SORemoteExtensionContext();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:].cold.2();

      if (a3)
      {
        objc_msgSend(getSOErrorHelperClass(), "internalErrorWithMessage:", CFSTR("failed to instantiate initial view controller from storyboard"));
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
LABEL_30:

    v5 = 0;
    return v5;
  }
  if (a3)
LABEL_3:
    *a3 = 0;
LABEL_4:
  v5 = self->_extensionAuthorizationRequestHandler;
  return v5;
}

- (id)hostContextWithError:(id *)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[SORemoteExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SORemoteExtensionContext_hostContextWithError___block_invoke;
  v7[3] = &unk_24C80C180;
  v7[4] = &v8;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__SORemoteExtensionContext_hostContextWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  SO_LOG_SORemoteExtensionContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__SORemoteExtensionContext_hostContextWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (id)synchronousHostContextWithError:(id *)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[SORemoteExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__SORemoteExtensionContext_synchronousHostContextWithError___block_invoke;
  v7[3] = &unk_24C80C180;
  v7[4] = &v8;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __60__SORemoteExtensionContext_synchronousHostContextWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  SO_LOG_SORemoteExtensionContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__SORemoteExtensionContext_synchronousHostContextWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  SORemoteExtensionContext *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  SORemoteExtensionContext *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  SO_LOG_SORemoteExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v23 = "-[SORemoteExtensionContext beginAuthorizationWithRequestParameters:completion:]";
    v24 = 2114;
    v25 = v9;
    v26 = 2114;
    v27 = v6;
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@, %{public}@ on %@", buf, 0x2Au);

  }
  v21 = 0;
  -[SORemoteExtensionContext authorizationRequestHandlerWithRequestParameters:error:](self, "authorizationRequestHandlerWithRequestParameters:error:", v6, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (!v10)
  {
    if (v7)
      v7[2](v7, 0, v11);
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "requestedOperation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("configuration_removed")))
    {
      v13 = dyld_program_sdk_at_least();

      if ((v13 & 1) == 0)
      {
        SO_LOG_SORemoteExtensionContext();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DABC000, v14, OS_LOG_TYPE_INFO, "SOAuthorizationOperationConfigurationRemoved requires extension built with newer SDK", buf, 2u);
        }

        if (v7)
        {
          objc_msgSend(getSOErrorHelperClass(), "errorWithCode:", -5);
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v16 = (void *)v15;
          v7[2](v7, 0, (id)v15);

          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
    -[SORemoteExtensionContext _disableAppSSOInCFNetwork](self, "_disableAppSSOInCFNetwork");
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke;
    v17[3] = &unk_24C80C1A8;
    v18 = v6;
    v19 = self;
    v20 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v17);
    if (v7)
      v7[2](v7, 1, 0);

    goto LABEL_20;
  }
  if (v7)
  {
    objc_msgSend(getSOErrorHelperClass(), "internalErrorWithMessage:", CFSTR("required beginAuthorizationWithRequest is not implemented in extension"));
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_20:

}

void __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1)
{
  SOAuthorizationRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;

  v2 = -[SOAuthorizationRequest initWithRequestParameters:remoteExtensionContext:]([SOAuthorizationRequest alloc], "initWithRequestParameters:remoteExtensionContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_msgSend(objc_alloc((Class)getASAuthorizationProviderExtensionAuthorizationRequestClass()), "initWithAuthorizationRequest:", v2);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveRequest:forIdentifier:", v3, v5);

  SO_LOG_SORemoteExtensionContext();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 48), "beginAuthorizationWithRequest:", v3);
  SO_LOG_SORemoteExtensionContext();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_1();

}

- (void)beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOExtensionServiceConnection *v9;
  SOExtensionServiceConnection *extensionServiceConnection;
  SOExtensionServiceConnection *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  SORemoteExtensionContext *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SORemoteExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SORemoteExtensionContext beginAuthorizationWithServiceXPCEndpoint:completion:]";
    v17 = 2114;
    v18 = v6;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  v9 = (SOExtensionServiceConnection *)objc_msgSend((id)objc_opt_new(), "initWithListenerEndpoint:", v6);
  extensionServiceConnection = self->_extensionServiceConnection;
  self->_extensionServiceConnection = v9;

  v11 = self->_extensionServiceConnection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke;
  v13[3] = &unk_24C80C1D0;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  -[SOExtensionServiceConnection beginAuthorizationWithCompletion:](v11, "beginAuthorizationWithCompletion:", v13);

}

void __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v7);
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v21 = 0;
    objc_msgSend(v9, "authorizationRequestHandlerWithRequestParameters:error:", v5, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v10)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_disableAppSSOInCFNetwork");
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2;
        v17[3] = &unk_24C80C1A8;
        v11 = v5;
        v12 = *(_QWORD *)(a1 + 32);
        v18 = v11;
        v19 = v12;
        v20 = v10;
        dispatch_async(MEMORY[0x24BDAC9B8], v17);
        v13 = *(_QWORD *)(a1 + 40);
        if (v13)
          (*(void (**)(uint64_t, uint64_t, _QWORD))(v13 + 16))(v13, 1, 0);

      }
      else
      {
        v15 = *(_QWORD *)(a1 + 40);
        if (v15)
        {
          objc_msgSend(getSOErrorHelperClass(), "internalErrorWithMessage:", CFSTR("required beginAuthorizationWithRequest is not implemented in extension"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

        }
      }
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
        (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v7);
    }

  }
}

void __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2(uint64_t a1)
{
  SOAuthorizationRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;

  v2 = -[SOAuthorizationRequest initWithRequestParameters:remoteExtensionContext:]([SOAuthorizationRequest alloc], "initWithRequestParameters:remoteExtensionContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_msgSend(objc_alloc((Class)getASAuthorizationProviderExtensionAuthorizationRequestClass()), "initWithAuthorizationRequest:", v2);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveRequest:forIdentifier:", v3, v5);

  SO_LOG_SORemoteExtensionContext();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2_cold_2();

  objc_msgSend(*(id *)(a1 + 48), "beginAuthorizationWithRequest:", v3);
  SO_LOG_SORemoteExtensionContext();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_1();

}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  SORemoteExtensionContext *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  SORemoteExtensionContext *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  SO_LOG_SORemoteExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[SORemoteExtensionContext cancelAuthorization:completion:]";
    v27 = 2114;
    v28 = v6;
    v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@ on %@", buf, 0x20u);
  }

  -[SORemoteExtensionContext findRequestForIdentifier:](self, "findRequestForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SORemoteExtensionContext removeRequestForIdentifier:](self, "removeRequestForIdentifier:", v6);
  if (v9)
  {
    objc_msgSend(v9, "authorizationRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAuthorizationCanceled:", 1);

    objc_msgSend(v9, "authorizationRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCanceledAuthorizationCredential:", 0);

    objc_msgSend(getSOErrorHelperClass(), "errorWithCode:", -2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authorizationRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCanceledAuthorizationError:", v12);

    if (v7)
    {
      objc_msgSend(v9, "authorizationRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "canceledAuthorizationCredential");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "authorizationRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "canceledAuthorizationError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v15, v17);

    }
    -[SORemoteExtensionContext extensionViewController](self, "extensionViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke;
      v22[3] = &unk_24C80C1F8;
      v23 = v9;
      v24 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v22);

    }
    else
    {
      SO_LOG_SORemoteExtensionContext();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DABC000, v21, OS_LOG_TYPE_DEFAULT, "optional API cancelAuthorizationWithRequest is not implemented in extension", buf, 2u);
      }

    }
  }
  else
  {
    SO_LOG_SORemoteExtensionContext();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DABC000, v20, OS_LOG_TYPE_DEFAULT, "Request already completed.", buf, 2u);
    }

    v7[2](v7, 0, 0);
  }

}

void __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  SO_LOG_SORemoteExtensionContext();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke_cold_2(a1, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 40), "extensionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v10 = a1 + 32;
  objc_msgSend(v9, "cancelAuthorizationWithRequest:", v11);

  SO_LOG_SORemoteExtensionContext();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);

}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  id finishAuthorizationCompletion;
  void *v16;
  void *v17;
  int v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  SORemoteExtensionContext *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  SO_LOG_SORemoteExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315650;
    v20 = "-[SORemoteExtensionContext finishAuthorization:completion:]";
    v21 = 2114;
    v22 = v6;
    v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@ on %@", (uint8_t *)&v19, 0x20u);
  }

  -[SORemoteExtensionContext findRequestForIdentifier:](self, "findRequestForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorizationRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  objc_msgSend(v9, "authorizationRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "secKeyProxiesConnectedClients");

  if (v12)
  {
    SO_LOG_SORemoteExtensionContext();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "authorizationRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "secKeyProxiesConnectedClients");
      v19 = 67109120;
      LODWORD(v20) = v18;
      _os_log_debug_impl(&dword_20DABC000, v13, OS_LOG_TYPE_DEBUG, "postponing finishAuthorization completion because of connected secKeyProxies clients (%d)", (uint8_t *)&v19, 8u);

    }
    v14 = (void *)MEMORY[0x212BAEC18](v7);
    finishAuthorizationCompletion = self->_finishAuthorizationCompletion;
    self->_finishAuthorizationCompletion = v14;

    objc_sync_exit(v10);
  }
  else
  {
    objc_msgSend(v9, "authorizationRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSecKeyProxies:", 0);

    objc_sync_exit(v10);
    if (v7)
      v7[2](v7, 1, 0);
    -[SORemoteExtensionContext removeRequestForIdentifier:](self, "removeRequestForIdentifier:", v6);
  }

}

- (void)completeFinishAuthorization:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void (**finishAuthorizationCompletion)(id, BOOL, id);
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  SORemoteExtensionContext *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SORemoteExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315906;
    v22 = "-[SORemoteExtensionContext completeFinishAuthorization:error:]";
    v23 = 2114;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@, error: %{public}@ on %@", (uint8_t *)&v21, 0x2Au);
  }

  -[SORemoteExtensionContext findRequestForIdentifier:](self, "findRequestForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorizationRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  finishAuthorizationCompletion = (void (**)(id, BOOL, id))self->_finishAuthorizationCompletion;
  if (finishAuthorizationCompletion)
  {
    finishAuthorizationCompletion[2](finishAuthorizationCompletion, v7 == 0, v7);
    v12 = self->_finishAuthorizationCompletion;
    self->_finishAuthorizationCompletion = 0;

    objc_sync_exit(v10);
    -[SORemoteExtensionContext removeRequestForIdentifier:](self, "removeRequestForIdentifier:", v6);
  }
  else
  {
    SO_LOG_SORemoteExtensionContext();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SORemoteExtensionContext completeFinishAuthorization:error:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    objc_sync_exit(v10);
  }

}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  SORemoteExtensionContext *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  SO_LOG_SORemoteExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v14 = "-[SORemoteExtensionContext openURL:completionHandler:]";
    v15 = 2160;
    v16 = 1752392040;
    v17 = 2117;
    v18 = v6;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s URL: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  v12 = 0;
  -[SORemoteExtensionContext hostContextWithError:](self, "hostContextWithError:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (v9)
  {
    objc_msgSend(v9, "openURL:completionHandler:", v6, v7);
  }
  else
  {
    SO_LOG_SORemoteExtensionContext();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SORemoteExtensionContext openURL:completionHandler:].cold.1();

    if (v7)
      v7[2](v7, 0);
  }

}

- (BOOL)canOpenURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  _BYTE buf[24];
  id v14;
  __int16 v15;
  SORemoteExtensionContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SORemoteExtensionContext();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    *(_QWORD *)&buf[4] = "-[SORemoteExtensionContext canOpenURL:]";
    *(_WORD *)&buf[12] = 2160;
    *(_QWORD *)&buf[14] = 1752392040;
    *(_WORD *)&buf[22] = 2117;
    v14 = v4;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s URL: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  v12 = 0;
  -[SORemoteExtensionContext synchronousHostContextWithError:](self, "synchronousHostContextWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v14) = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__SORemoteExtensionContext_canOpenURL___block_invoke;
    v11[3] = &unk_24C80C220;
    v11[4] = buf;
    objc_msgSend(v6, "canOpenURL:completionHandler:", v4, v11);
    v8 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    SO_LOG_SORemoteExtensionContext();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SORemoteExtensionContext canOpenURL:].cold.1();

    v8 = 0;
  }

  return v8;
}

uint64_t __39__SORemoteExtensionContext_canOpenURL___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  SORemoteExtensionContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, uint64_t))a5;
  SO_LOG_SORemoteExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[SORemoteExtensionContext beginDeviceRegistrationUsingOptions:extensionData:completion:]";
    v13 = 2114;
    v14 = v9;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s options = %{public}@ on %@", (uint8_t *)&v11, 0x20u);

  }
  SO_LOG_SORemoteExtensionContext();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEFAULT, "extension PSSO API beginDeviceRegistrationUsingLoginManager is not implemented in extension", (uint8_t *)&v11, 2u);
  }

  if (v7)
    v7[2](v7, 3);

}

- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7
{
  void (**v8)(id, uint64_t);
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  SORemoteExtensionContext *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a7;
  SO_LOG_SORemoteExtensionContext();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[SORemoteExtensionContext beginUserRegistrationUsingUserName:authenticationMethod:options:extensionData:completion:]";
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_20DABC000, v9, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v11, 0x16u);
  }

  SO_LOG_SORemoteExtensionContext();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEFAULT, "extension PSSO API beginUserRegistrationUsingLoginManager is not implemented in extension", (uint8_t *)&v11, 2u);
  }

  if (v8)
    v8[2](v8, 3);

}

- (void)registrationDidCompleteWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  SORemoteExtensionContext *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  SO_LOG_SORemoteExtensionContext();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SORemoteExtensionContext registrationDidCompleteWithCompletion:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  SO_LOG_SORemoteExtensionContext();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_20DABC000, v6, OS_LOG_TYPE_DEFAULT, "extension PSSO API registrationDidComplete is not implemented in extension", (uint8_t *)&v7, 2u);
  }

  v4[2](v4);
}

- (void)registrationDidCancelWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  SORemoteExtensionContext *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  SO_LOG_SORemoteExtensionContext();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SORemoteExtensionContext registrationDidCancelWithCompletion:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  SO_LOG_SORemoteExtensionContext();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_20DABC000, v6, OS_LOG_TYPE_DEFAULT, "extension PSSO API registrationDidCancel is not implemented in extension", (uint8_t *)&v7, 2u);
  }

  v4[2](v4);
}

- (void)supportedGrantTypesCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, _QWORD))a3;
  SO_LOG_SORemoteExtensionContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API supportedGrantTypes is not implemented in extension", v5, 2u);
  }

  if (v3)
    v3[2](v3, 0);

}

- (void)protocolVersionCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, _QWORD))a3;
  SO_LOG_SORemoteExtensionContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API protocolVersion is not implemented in extension", v5, 2u);
  }

  if (v3)
    v3[2](v3, 0);

}

- (void)canPerformRegistrationCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  SORemoteExtensionContext *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  SO_LOG_SORemoteExtensionContext();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SORemoteExtensionContext canPerformRegistrationCompletion:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  SO_LOG_SORemoteExtensionContext();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SORemoteExtensionContext canPerformRegistrationCompletion:].cold.1(v6);

  v4[2](v4, 0);
}

- (void)_disableAppSSOInCFNetwork
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  SORemoteExtensionContext *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SORemoteExtensionContext();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SORemoteExtensionContext _disableAppSSOInCFNetwork]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1850], "_disableAppSSO");
}

- (void)supportedDeviceSigningAlgorithmsCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, _QWORD))a3;
  SO_LOG_SORemoteExtensionContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API supportedDeviceSigningAlgorithms is not implemented in extension", v5, 2u);
  }

  if (v3)
    v3[2](v3, 0);

}

- (void)supportedDeviceEncryptionAlgorithmsCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, _QWORD))a3;
  SO_LOG_SORemoteExtensionContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API supportedDeviceEncryptionAlgorithms is not implemented in extension", v5, 2u);
  }

  if (v3)
    v3[2](v3, 0);

}

- (void)supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, _QWORD))a3;
  SO_LOG_SORemoteExtensionContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_DEFAULT, "extension PSSO API supportedUserSecureEnclaveKeySigningAlgorithms is not implemented in extension", v5, 2u);
  }

  if (v3)
    v3[2](v3, 0);

}

- (void)keyWillRotateForKeyType:(int64_t)a3 keyProxyEndpoint:(id)a4 extensionData:(id)a5 completion:(id)a6
{
  void (**v6)(id, uint64_t);
  NSObject *v7;
  uint8_t v8[16];

  v6 = (void (**)(id, uint64_t))a6;
  SO_LOG_SORemoteExtensionContext();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "extension PSSO API keyWillRotateForKeyType is not implemented in extension", v8, 2u);
  }

  if (v6)
    v6[2](v6, 1);

}

- (SOExtensionViewService)viewService
{
  return (SOExtensionViewService *)objc_loadWeakRetained((id *)&self->_viewService);
}

- (void)setViewService:(id)a3
{
  objc_storeWeak((id *)&self->_viewService, a3);
}

- (id)registrationCompletion
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setRegistrationCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)rotationCompletion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setRotationCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rotationCompletion, 0);
  objc_storeStrong(&self->_registrationCompletion, 0);
  objc_destroyWeak((id *)&self->_viewService);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong(&self->_finishAuthorizationCompletion, 0);
  objc_storeStrong((id *)&self->_extensionAuthorizationRequestHandler, 0);
  objc_storeStrong((id *)&self->_extensionServiceConnection, 0);
}

- (void)extensionAuthorizationRequestHandlerWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Failed to get NSExtensionPrincipalClass or NSExtensionMainStoryboard: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extensionAuthorizationRequestHandlerWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Failed to instantiate initial view controller from storyboard: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extensionAuthorizationRequestHandlerWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Failed to get extension principalClass for principalClassName: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extensionAuthorizationRequestHandlerWithError:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20DABC000, a1, a3, "creating extension authorization request handler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __49__SORemoteExtensionContext_hostContextWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Error getting host context %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SORemoteExtensionContext_synchronousHostContextWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Error getting synchronous host context %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_9(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_20DABC000, v2, v3, "finished extension API beginAuthorizationWithRequest, requestIdentifier = %{public}@, %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __79__SORemoteExtensionContext_beginAuthorizationWithRequestParameters_completion___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_9(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_20DABC000, v2, v3, "calling extension API beginAuthorizationWithRequest, requestIdentifier = %{public}@ %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __80__SORemoteExtensionContext_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_9(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_20DABC000, v2, v3, "calling extension API beginAuthorizationWithRequest, requestIdentifier = %{public}@, %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DABC000, a2, a3, "finished extension API cancelAuthorizationWithRequest, %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__SORemoteExtensionContext_cancelAuthorization_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DABC000, a2, a3, "calling extension API cancelAuthorizationWithRequest, %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)completeFinishAuthorization:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20DABC000, a1, a3, "no finishAuthorization completion block => ignoring complete request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)openURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "failed to get host context to open URL, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)canOpenURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "failed to get synchronous host context to open URL, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)canPerformRegistrationCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DABC000, log, OS_LOG_TYPE_ERROR, "Extension has not implemented registration protocol.", v1, 2u);
  OUTLINED_FUNCTION_8();
}

@end
