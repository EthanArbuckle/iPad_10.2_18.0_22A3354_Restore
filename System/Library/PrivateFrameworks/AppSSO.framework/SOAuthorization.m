@implementation SOAuthorization

uint64_t __63__SOAuthorization_canPerformAuthorizationWithURL_responseCode___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(getSOAuthorizationCoreClass(), "canPerformAuthorizationWithURL:responseCode:", a1[4], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  __int128 *v12;
  int64_t v13;
  _QWORD activity_block[4];
  id v15;
  __int128 *v16;
  int64_t v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    v18 = xmmword_24C80CB70;
    v19 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_8 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    *(_QWORD *)&v18 = 0;
    *((_QWORD *)&v18 + 1) = &v18;
    v19 = 0x2020000000;
    v20 = 0;
    if (_originatorBundleIdentifier)
    {
      activity_block[0] = MEMORY[0x24BDAC760];
      activity_block[1] = 3221225472;
      activity_block[2] = __63__SOAuthorization_canPerformAuthorizationWithURL_responseCode___block_invoke;
      activity_block[3] = &unk_24C80C970;
      v16 = &v18;
      v15 = v5;
      v17 = a4;
      _os_activity_initiate(&dword_20DABC000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
      v6 = v15;
    }
    else
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __63__SOAuthorization_canPerformAuthorizationWithURL_responseCode___block_invoke_2;
      v10[3] = &unk_24C80C970;
      v12 = &v18;
      v11 = v5;
      v13 = a4;
      _os_activity_initiate(&dword_20DABC000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, v10);
      v6 = v11;
    }

    v8 = *(_BYTE *)(*((_QWORD *)&v18 + 1) + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    SO_LOG_SOAuthorization();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (SOAuthorization)init
{
  NSObject *v3;
  SOAuthorization *v4;
  SOAuthorizationCore *v5;
  SOAuthorizationCore *authorizationCore;
  objc_super v8;
  _BYTE buf[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOAuthorization();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOAuthorization init]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)SOAuthorization;
  v4 = -[SOAuthorization init](&v8, sel_init);
  if (v4)
  {
    if (!AppSSOCoreLibraryCore_frameworkLibrary_8)
    {
      *(_OWORD *)buf = xmmword_24C80CB70;
      *(_QWORD *)&buf[16] = 0;
      AppSSOCoreLibraryCore_frameworkLibrary_8 = _sl_dlopen();
    }
    if (AppSSOCoreLibraryCore_frameworkLibrary_8)
    {
      v5 = (SOAuthorizationCore *)objc_alloc_init((Class)getSOAuthorizationCoreClass());
      authorizationCore = v4->_authorizationCore;
      v4->_authorizationCore = v5;

    }
    v4->_enableEmbeddedAuthorizationViewController = 1;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SOAuthorization;
  -[SOAuthorization dealloc](&v4, sel_dealloc);
}

+ (void)setOriginatorBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&_originatorBundleIdentifier, a3);
}

+ (NSString)originatorBundleIdentifier
{
  return (NSString *)(id)_originatorBundleIdentifier;
}

uint64_t __63__SOAuthorization_canPerformAuthorizationWithURL_responseCode___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(getSOAuthorizationCoreClass(), "canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:", a1[4], a1[6], _originatorBundleIdentifier, 1);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 useInternalExtensions:(BOOL)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  __int128 *v14;
  int64_t v15;
  BOOL v16;
  _QWORD activity_block[4];
  id v18;
  __int128 *v19;
  int64_t v20;
  __int128 v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    v21 = xmmword_24C80CB70;
    v22 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_8 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    *(_QWORD *)&v21 = 0;
    *((_QWORD *)&v21 + 1) = &v21;
    v22 = 0x2020000000;
    v23 = 0;
    if (_originatorBundleIdentifier)
    {
      activity_block[0] = MEMORY[0x24BDAC760];
      activity_block[1] = 3221225472;
      activity_block[2] = __85__SOAuthorization_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke;
      activity_block[3] = &unk_24C80C970;
      v19 = &v21;
      v18 = v7;
      v20 = a4;
      _os_activity_initiate(&dword_20DABC000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
      v8 = v18;
    }
    else
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __85__SOAuthorization_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke_2;
      v12[3] = &unk_24C80C998;
      v14 = &v21;
      v13 = v7;
      v15 = a4;
      v16 = a5;
      _os_activity_initiate(&dword_20DABC000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, v12);
      v8 = v13;
    }

    v10 = *(_BYTE *)(*((_QWORD *)&v21 + 1) + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    SO_LOG_SOAuthorization();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    v10 = 0;
  }

  return v10;
}

uint64_t __85__SOAuthorization_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(getSOAuthorizationCoreClass(), "canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:", a1[4], a1[6], _originatorBundleIdentifier, 1);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __85__SOAuthorization_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(getSOAuthorizationCoreClass(), "canPerformAuthorizationWithURL:responseCode:useInternalExtensions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6
{
  id v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  _QWORD activity_block[4];
  id v15;
  id v16;
  __int128 *v17;
  int64_t v18;
  BOOL v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    v20 = xmmword_24C80CB70;
    v21 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_8 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    *(_QWORD *)&v20 = 0;
    *((_QWORD *)&v20 + 1) = &v20;
    v21 = 0x2020000000;
    v22 = 0;
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __108__SOAuthorization_canPerformAuthorizationWithURL_responseCode_callerBundleIdentifier_useInternalExtensions___block_invoke;
    activity_block[3] = &unk_24C80C9C0;
    v17 = &v20;
    v15 = v9;
    v18 = a4;
    v16 = v10;
    v19 = a6;
    _os_activity_initiate(&dword_20DABC000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    v11 = *(_BYTE *)(*((_QWORD *)&v20 + 1) + 24) != 0;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    SO_LOG_SOAuthorization();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    v11 = 0;
  }

  return v11;
}

uint64_t __108__SOAuthorization_canPerformAuthorizationWithURL_responseCode_callerBundleIdentifier_useInternalExtensions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(getSOAuthorizationCoreClass(), "canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (OS_dispatch_queue)delegateDispatchQueue
{
  SOAuthorization *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SOAuthorizationCore delegateDispatchQueue](v2->_authorizationCore, "delegateDispatchQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (OS_dispatch_queue *)v3;
}

- (void)setDelegateDispatchQueue:(id)a3
{
  SOAuthorization *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SOAuthorizationCore setDelegateDispatchQueue:](v4->_authorizationCore, "setDelegateDispatchQueue:", v5);
  objc_sync_exit(v4);

}

- (NSDictionary)authorizationOptions
{
  SOAuthorization *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SOAuthorizationCore authorizationOptions](v2->_authorizationCore, "authorizationOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setAuthorizationOptions:(id)a3
{
  SOAuthorization *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SOAuthorizationCore setAuthorizationOptions:](v4->_authorizationCore, "setAuthorizationOptions:", v5);
  objc_sync_exit(v4);

}

- (BOOL)isUserInteractionEnabled
{
  SOAuthorization *v2;
  char v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[SOAuthorizationCore isUserInteractionEnabled](v2->_authorizationCore, "isUserInteractionEnabled");
  objc_sync_exit(v2);

  return v3;
}

- (void)setEnableUserInteraction:(BOOL)a3
{
  _BOOL8 v3;
  SOAuthorization *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[SOAuthorizationCore setEnableUserInteraction:](obj->_authorizationCore, "setEnableUserInteraction:", v3);
  objc_sync_exit(obj);

}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SOAuthorizationCore *authorizationCore;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  SOAuthorization *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  SO_LOG_SOAuthorization();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SOAuthorization getAuthorizationHintsWithURL:responseCode:completion:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  authorizationCore = self->_authorizationCore;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__SOAuthorization_getAuthorizationHintsWithURL_responseCode_completion___block_invoke;
  v13[3] = &unk_24C80C9E8;
  v14 = v8;
  v12 = v8;
  -[SOAuthorizationCore getAuthorizationHintsWithURL:responseCode:completion:](authorizationCore, "getAuthorizationHintsWithURL:responseCode:completion:", v9, a4, v13);

}

void __72__SOAuthorization_getAuthorizationHintsWithURL_responseCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  SOAuthorizationHints *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOAuthorization();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "hints: %{public}@, error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (v5)
    {
      v9 = -[SOAuthorizationHints initWithAuthorizationHintsCore:]([SOAuthorizationHints alloc], "initWithAuthorizationHintsCore:", v5);
      v8 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(uint64_t, SOAuthorizationHints *, id))(v8 + 16))(v8, v9, v6);

  }
}

- (void)beginAuthorizationWithURL:(id)a3 httpHeaders:(id)a4 httpBody:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SOAuthorizationParameters *v12;
  int v13;
  const char *v14;
  __int16 v15;
  SOAuthorization *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  SO_LOG_SOAuthorization();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[SOAuthorization beginAuthorizationWithURL:httpHeaders:httpBody:]";
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_20DABC000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v13, 0x16u);
  }

  v12 = objc_alloc_init(SOAuthorizationParameters);
  -[SOAuthorizationParameters setUrl:](v12, "setUrl:", v10);

  -[SOAuthorizationParameters setHttpHeaders:](v12, "setHttpHeaders:", v9);
  -[SOAuthorizationParameters setHttpBody:](v12, "setHttpBody:", v8);

  -[SOAuthorizationParameters setUseInternalExtensions:](v12, "setUseInternalExtensions:", 1);
  -[SOAuthorization beginAuthorizationWithParameters:](self, "beginAuthorizationWithParameters:", v12);

}

- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  SOAuthorizationParameters *v15;
  int v16;
  const char *v17;
  __int16 v18;
  SOAuthorization *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  SO_LOG_SOAuthorization();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[SOAuthorization beginAuthorizationWithOperation:url:httpHeaders:httpBody:]";
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_20DABC000, v14, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v16, 0x16u);
  }

  v15 = objc_alloc_init(SOAuthorizationParameters);
  -[SOAuthorizationParameters setOperation:](v15, "setOperation:", v13);

  -[SOAuthorizationParameters setUrl:](v15, "setUrl:", v12);
  -[SOAuthorizationParameters setHttpHeaders:](v15, "setHttpHeaders:", v11);

  -[SOAuthorizationParameters setHttpBody:](v15, "setHttpBody:", v10);
  -[SOAuthorizationParameters setUseInternalExtensions:](v15, "setUseInternalExtensions:", 1);
  -[SOAuthorization beginAuthorizationWithParameters:](self, "beginAuthorizationWithParameters:", v15);

}

- (void)beginAuthorizationWithParameters:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  _BOOL4 enableEmbeddedAuthorizationViewController;
  void *v13;
  id v14;
  id v15;
  char v16;
  NSObject *v17;
  SOAuthorization *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD activity_block[5];
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE buf[24];
  void *v37;
  _BYTE v38[10];
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  _BOOL4 v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  SOAuthorization *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOAuthorization();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "operation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "httpHeaders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "httpBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auditTokenData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    enableEmbeddedAuthorizationViewController = self->_enableEmbeddedAuthorizationViewController;
    *(_DWORD *)buf = 136317955;
    *(_QWORD *)&buf[4] = "-[SOAuthorization beginAuthorizationWithParameters:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2114;
    v37 = v6;
    strcpy(v38, "p\bhash");
    v38[7] = 0;
    *(_WORD *)&v38[8] = 0;
    v39 = 2117;
    v40 = v7;
    v41 = 2113;
    v42 = v8;
    v43 = 2113;
    v44 = v9;
    v45 = 2114;
    v46 = v10;
    v47 = 2114;
    v48 = WeakRetained;
    v49 = 1024;
    v50 = enableEmbeddedAuthorizationViewController;
    v51 = 1024;
    v52 = -[SOAuthorization isUserInteractionEnabled](self, "isUserInteractionEnabled");
    v53 = 2112;
    v54 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@, operation = %{public}@, url = %{sensitive, mask.hash}@, httpHeaders = %{private}@, httpBody = %{private}@, auditToken = %{public}@, delegate = %{public}@, enableEmbeddedAVC = %d, enableUI = %d on %@", buf, 0x72u);

  }
  if (_CFMZEnabled())
    self->_enableEmbeddedAuthorizationViewController = 0;
  if (!-[SOAuthorization isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    dispatch_get_global_queue(0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOAuthorizationCore setDelegateDispatchQueue:](self->_authorizationCore, "setDelegateDispatchQueue:", v13);

  }
  if (self->_enableEmbeddedAuthorizationViewController
    && (v14 = objc_loadWeakRetained((id *)&self->_delegate)) != 0
    && (v15 = objc_loadWeakRetained((id *)&self->_delegate),
        v16 = objc_opt_respondsToSelector(),
        v15,
        v14,
        (v16 & 1) != 0))
  {
    SO_LOG_SOAuthorization();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DABC000, v17, OS_LOG_TYPE_DEFAULT, "originator will present authorization view controller", buf, 2u);
    }

    v18 = self;
    objc_sync_enter(v18);
    -[SOAuthorizationCore requestParametersCore](v18->_authorizationCore, "requestParametersCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      SO_LOG_SOAuthorization();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_20DABC000, v20, OS_LOG_TYPE_DEFAULT, "%@ is already authorizing => ignoring a new authorization request", buf, 0xCu);
      }

      objc_sync_exit(v18);
    }
    else
    {
      objc_sync_exit(v18);

      v32 = 0;
      v33 = &v32;
      v34 = 0x2050000000;
      v21 = (void *)getSOAuthorizationRequestParametersCoreClass_softClass;
      v35 = getSOAuthorizationRequestParametersCoreClass_softClass;
      v22 = MEMORY[0x24BDAC760];
      if (!getSOAuthorizationRequestParametersCoreClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getSOAuthorizationRequestParametersCoreClass_block_invoke;
        v37 = &unk_24C80C0B8;
        *(_QWORD *)v38 = &v32;
        __getSOAuthorizationRequestParametersCoreClass_block_invoke((uint64_t)buf);
        v21 = (void *)v33[3];
      }
      v23 = objc_retainAutorelease(v21);
      _Block_object_dispose(&v32, 8);
      v24 = (void *)objc_msgSend([v23 alloc], "initWithAuthorizationParameters:", v4);
      -[SOAuthorization authorizationOptions](v18, "authorizationOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAuthorizationOptions:", v25);

      objc_msgSend(v24, "setEnableUserInteraction:", -[SOAuthorization isUserInteractionEnabled](v18, "isUserInteractionEnabled"));
      v30[0] = v22;
      v30[1] = 3221225472;
      v30[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke;
      v30[3] = &unk_24C80C1F8;
      v30[4] = v18;
      v31 = v24;
      v26 = v24;
      _os_activity_initiate(&dword_20DABC000, "beginAuthorizationWithParametersEmbedded", OS_ACTIVITY_FLAG_DEFAULT, v30);

    }
  }
  else
  {
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_33;
    activity_block[3] = &unk_24C80C1F8;
    activity_block[4] = self;
    v29 = v4;
    _os_activity_initiate(&dword_20DABC000, "beginAuthorizationWithParameters", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_2;
  v6[3] = &unk_24C80CA88;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "beginAuthorizationWithRequestParameters:completion:", v4, v6);

}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  SO_LOG_SOAuthorization();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v11;
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEFAULT, "beginAuthorizationWithRequestParameters: identifier = %{public}@, extensionBundleId = %{public}@, endpoint = %{public}@, error = %{public}@", buf, 0x2Au);

  }
  if (v7 && v8)
  {
    +[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_24;
    v15[3] = &unk_24C80CA60;
    v13 = *(id *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v16 = v13;
    v17 = v14;
    v18 = v8;
    objc_msgSend(v12, "loadExtensionWithBundleIdentifer:completion:", v7, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_finishAuthorizationWithCredential:error:", 0, v9);
  }

}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  SO_LOG_SOAuthorization();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "localizedExtensionDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v9;
    v26 = 2114;
    v27 = v10;
    v28 = 2114;
    v29 = v7;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "loadExtensionWithBundleIdentifer: identifier = %{public}@, extension = %{public}@, error = %{public}@", buf, 0x20u);

  }
  v11 = *(id **)(a1 + 40);
  if (v6)
  {
    objc_storeStrong(v11 + 2, a2);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 16);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveDelegate:forRequestIdentifier:", v12, v14);

    v15 = *(void **)(a1 + 32);
    v16 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_25;
    v20[3] = &unk_24C80CA38;
    v17 = v15;
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(a1 + 48);
    v21 = v17;
    v22 = v18;
    v23 = v19;
    objc_msgSend(v16, "requestAuthorizationViewControllerWithCompletion:", v20);

  }
  else
  {
    objc_msgSend(v11, "_finishAuthorizationWithCredential:error:", 0, v7);
  }

}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  SO_LOG_SOAuthorization();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v9;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "requestAuthorizationViewControllerWithCompletion: identifier = %{public}@, remoteViewController = %{public}@, error = %{public}@", buf, 0x20u);

  }
  v10 = *(id **)(a1 + 40);
  if (v6)
  {
    objc_storeStrong(v10 + 3, a2);
    v11 = *(void **)(a1 + 32);
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    v13 = *(_QWORD *)(a1 + 48);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_28;
    v17[3] = &unk_24C80CA10;
    v14 = v11;
    v15 = *(_QWORD *)(a1 + 40);
    v18 = v14;
    v19 = v15;
    objc_msgSend(v12, "beginAuthorizationWithServiceXPCEndpoint:completion:", v13, v17);
    v16 = v18;
  }
  else
  {
    objc_msgSend(getSOErrorHelperClass_2(), "errorWithCode:message:suberror:", -1000, CFSTR("Missing remote view controller"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_finishAuthorizationWithCredential:error:", 0, v16);
  }

}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_28(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SO_LOG_SOAuthorization();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_20DABC000, v6, OS_LOG_TYPE_DEFAULT, "beginAuthorizationWithServiceXPCEndpoint: identifier = %{public}@, success = %d, error = %{public}@", (uint8_t *)&v8, 0x1Cu);

  }
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_finishAuthorizationWithCredential:error:", 0, v5);

}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_33(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "authorizationParametersCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_2_34;
  v4[3] = &unk_24C80CAB0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "beginAuthorizationWithParameters:completion:", v3, v4);

}

uint64_t __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_2_34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishAuthorizationWithCredential:error:", a2, a3);
}

- (void)cancelAuthorization
{
  NSObject *v3;
  _QWORD activity_block[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SOAuthorization *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOAuthorization();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SOAuthorization cancelAuthorization]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (self->_extension)
  {
    -[SOAuthorization _cancelAuthorization](self, "_cancelAuthorization");
  }
  else
  {
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __38__SOAuthorization_cancelAuthorization__block_invoke;
    activity_block[3] = &unk_24C80CAD8;
    activity_block[4] = self;
    _os_activity_initiate(&dword_20DABC000, "cancelAuthorization", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

uint64_t __38__SOAuthorization_cancelAuthorization__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelAuthorization");
}

- (void)debugHintsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  SOAuthorization *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOAuthorization();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SOAuthorization debugHintsWithCompletion:]";
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SOAuthorization_debugHintsWithCompletion___block_invoke;
  v7[3] = &unk_24C80C2C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  _os_activity_initiate(&dword_20DABC000, "debugHintsWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v7);

}

uint64_t __44__SOAuthorization_debugHintsWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "debugHintsWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_finishAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOExtension *extension;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  SO_LOG_SOAuthorization();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOAuthorization _finishAuthorization:completion:].cold.1((uint64_t)self, v8);

  extension = self->_extension;
  if (extension)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__SOAuthorization__finishAuthorization_completion___block_invoke;
    v10[3] = &unk_24C80CB00;
    v10[4] = self;
    v11 = v7;
    -[SOExtension finishAuthorization:completion:](extension, "finishAuthorization:completion:", v6, v10);

  }
  else
  {
    -[SOAuthorizationCore finishAuthorization:completion:](self->_authorizationCore, "finishAuthorization:completion:", v6, v7);
  }

}

void __51__SOAuthorization__finishAuthorization_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_extensionCleanup");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)_cancelAuthorization
{
  OUTLINED_FUNCTION_0(&dword_20DABC000, a2, a3, "%@ already finished => ignoring cancel request", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __39__SOAuthorization__cancelAuthorization__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = (void *)objc_msgSend(objc_alloc((Class)getSOAuthorizationCredentialCoreClass()), "initWithAuthorizationCredential:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "_finishAuthorizationWithCredential:error:", a2, v6);

}

- (void)_finishAuthorizationWithCredential:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  SOAuthorization *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  int v24;
  void *v25;
  void *v26;
  SOAuthorization *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  SOAuthorization *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE buf[24];
  void *v49;
  _BYTE v50[10];
  __int16 v51;
  id v52;
  __int16 v53;
  SOAuthorization *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOAuthorization();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SOAuthorizationCore requestParametersCore](self->_authorizationCore, "requestParametersCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 136316419;
    *(_QWORD *)&buf[4] = "-[SOAuthorization _finishAuthorizationWithCredential:error:]";
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v49 = v7;
    *(_WORD *)v50 = 2114;
    *(_QWORD *)&v50[2] = v9;
    v51 = 2114;
    v52 = WeakRetained;
    v53 = 2112;
    v54 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s credentialCore = %{private}@, error = %{public}@, requestParametersCore = %{public}@, delegate = %{public}@ on %@", buf, 0x3Eu);

  }
  v11 = self;
  objc_sync_enter(v11);
  -[SOAuthorizationCore requestParametersCore](v11->_authorizationCore, "requestParametersCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
  {
    SO_LOG_SOAuthorization();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[SOAuthorization _finishAuthorizationWithCredential:error:].cold.1((uint64_t)v11, v30, v31, v32, v33, v34, v35, v36);

    objc_sync_exit(v11);
  }
  else
  {
    v14 = MEMORY[0x24BDAC760];
    if (v11->_extension || !-[SOAuthorization isUserInteractionEnabled](v11, "isUserInteractionEnabled"))
    {
      v24 = 0;
    }
    else
    {
      v44 = 0;
      v45 = &v44;
      v46 = 0x2050000000;
      v15 = (void *)getSOConfigurationClientClass_softClass;
      v47 = getSOConfigurationClientClass_softClass;
      if (!getSOConfigurationClientClass_softClass)
      {
        *(_QWORD *)buf = v14;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getSOConfigurationClientClass_block_invoke;
        v49 = &unk_24C80C0B8;
        *(_QWORD *)v50 = &v44;
        __getSOConfigurationClientClass_block_invoke((uint64_t)buf);
        v15 = (void *)v45[3];
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v44, 8);
      objc_msgSend(v16, "defaultClient");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationCore requestParametersCore](v11->_authorizationCore, "requestParametersCore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "url");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationCore requestParametersCore](v11->_authorizationCore, "requestParametersCore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "profileForURL:responseCode:", v19, objc_msgSend(v20, "responseCode"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v21, "extensionBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = +[SOExtensionManager isInternalExtensionBundleIdentifier:](SOExtensionManager, "isInternalExtensionBundleIdentifier:", v22);

        v24 = !v23;
      }
      else
      {
        v24 = 0;
      }
      SO_LOG_SOAuthorization();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[SOAuthorization _finishAuthorizationWithCredential:error:].cold.2(v24, (uint64_t)v21, v37);

    }
    -[SOAuthorizationCore requestParametersCore](v11->_authorizationCore, "requestParametersCore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[SOAuthorizationCore setRequestParametersCore:](v11->_authorizationCore, "setRequestParametersCore:", 0);
    objc_sync_exit(v11);

    v40[0] = v14;
    v40[1] = 3221225472;
    v40[2] = __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke;
    v40[3] = &unk_24C80C3B8;
    v40[4] = v11;
    v27 = v26;
    v41 = v27;
    v42 = v7;
    v43 = v6;
    v28 = (void *)MEMORY[0x212BAEC18](v40);
    v29 = v28;
    if (v24)
    {
      v38[0] = v14;
      v38[1] = 3221225472;
      v38[2] = __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_55;
      v38[3] = &unk_24C80C2C8;
      v38[4] = v11;
      v39 = v28;
      dispatch_async(MEMORY[0x24BDAC9B8], v38);

    }
    else
    {
      -[SOAuthorizationCore performBlockOnDelegateQueue:](v11->_authorizationCore, "performBlockOnDelegateQueue:", v28);
    }

    v11 = v27;
  }

}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  SOAuthorizationResult *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD v40[5];
  id v41;
  id v42;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 48))
    {
      if (objc_msgSend(getSOErrorHelperClass_2(), "error:hasCode:", *v3, -2))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SO_LOG_SOAuthorization();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
            __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_10();

          objc_msgSend(v2, "authorizationDidCancel:", *(_QWORD *)(a1 + 32));
        }
        goto LABEL_53;
      }
      if (objc_msgSend(getSOErrorHelperClass_2(), "error:hasCode:", *v3, -5))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SO_LOG_SOAuthorization();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            goto LABEL_25;
          goto LABEL_26;
        }
      }
      else
      {
        if (!objc_msgSend(getSOErrorHelperClass_2(), "error:hasCode:", *v3, -9))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            SO_LOG_SOAuthorization();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_13();

            objc_msgSend(v2, "authorization:didCompleteWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
          }
          goto LABEL_53;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SO_LOG_SOAuthorization();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
LABEL_25:
            __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_11();
LABEL_26:

          objc_msgSend(v2, "authorizationDidNotHandle:", *(_QWORD *)(a1 + 32));
        }
      }
LABEL_53:
      SO_LOG_SOAuthorization();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_2();

      v37 = *(void **)(a1 + 32);
      v36 = *(void **)(a1 + 40);
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_54;
      v40[3] = &unk_24C80CA10;
      v40[4] = v37;
      v41 = v36;
      objc_msgSend(v37, "_finishAuthorization:completion:", v41, v40);

      goto LABEL_56;
    }
    v6 = *(void **)(a1 + 56);
    if (!v6)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        SO_LOG_SOAuthorization();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_3();

        objc_msgSend(v2, "authorizationDidComplete:", *(_QWORD *)(a1 + 32));
      }
      goto LABEL_53;
    }
    objc_msgSend(v6, "secKeyProxyEndpoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_53;
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(*(id *)(a1 + 56), "secKeyProxyEndpoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_msgSend(v8, "createSecKeysFromSecKeyProxyEndpoints:error:", v9, &v42);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v42;

      if (v10)
      {
        v12 = objc_alloc_init(SOAuthorizationResult);
        objc_msgSend(*(id *)(a1 + 56), "httpAuthorizationHeaders");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOAuthorizationResult setHttpAuthorizationHeaders:](v12, "setHttpAuthorizationHeaders:", v13);

        objc_msgSend(*(id *)(a1 + 56), "httpResponse");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOAuthorizationResult setHttpResponse:](v12, "setHttpResponse:", v14);

        objc_msgSend(*(id *)(a1 + 56), "httpBody");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOAuthorizationResult setHttpBody:](v12, "setHttpBody:", v15);

        -[SOAuthorizationResult setPrivateKeys:](v12, "setPrivateKeys:", v10);
        SO_LOG_SOAuthorization();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_9();

        objc_msgSend(v2, "authorization:didCompleteWithAuthorizationResult:", *(_QWORD *)(a1 + 32), v12);
      }
      else
      {
        SO_LOG_SOAuthorization();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_8((uint64_t)v11, v27, v28, v29, v30, v31, v32, v33);

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SO_LOG_SOAuthorization();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_4();

          objc_msgSend(v2, "authorization:didCompleteWithError:", *(_QWORD *)(a1 + 32), v11);
        }
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "httpAuthorizationHeaders");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_53;
        SO_LOG_SOAuthorization();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_6();

        v21 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 56), "httpAuthorizationHeaders");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "authorization:didCompleteWithHTTPAuthorizationHeaders:", v21, v11);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "httpResponse");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(getSOErrorHelperClass_2(), "errorWithCode:message:", -1000, CFSTR("Invalid credential"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            SO_LOG_SOAuthorization();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_4();

            objc_msgSend(v2, "authorization:didCompleteWithError:", *(_QWORD *)(a1 + 32), v38);
          }
          goto LABEL_53;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_53;
        SO_LOG_SOAuthorization();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_5();

        v25 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 56), "httpResponse");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "httpBody");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "authorization:didCompleteWithHTTPResponse:httpBody:", v25, v11, v26);

      }
    }

    goto LABEL_53;
  }
  SO_LOG_SOAuthorization();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_1();

LABEL_56:
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_54()
{
  NSObject *v0;

  SO_LOG_SOAuthorization();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_54_cold_1();

}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_55(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState");

  if (v3)
  {
    SO_LOG_SOAuthorization();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_55_cold_1();

    v5 = MEMORY[0x212BAEC18](*(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "applicationState");

    if (v10)
    {
      v11 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_59;
      block[3] = &unk_24C80CAD8;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v11, MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_applicationActivationWithTimeout:", 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "performBlockOnDelegateQueue:", *(_QWORD *)(a1 + 40));
  }
}

uint64_t __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationActivationWithTimeout:", 1);
}

- (void)applicationDidBecomeActive:(id)a3
{
  NSObject *v4;
  uint64_t v5;

  SO_LOG_SOAuthorization();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SOAuthorization applicationDidBecomeActive:].cold.1((uint64_t)self, v4, v5);

  -[SOAuthorization _applicationActivationWithTimeout:](self, "_applicationActivationWithTimeout:", 0);
}

- (void)_applicationActivationWithTimeout:(BOOL)a3
{
  NSObject *v4;
  id pendingFinishAuthorizationBlock;
  void *v6;

  if (self->_pendingFinishAuthorizationBlock)
  {
    SO_LOG_SOAuthorization();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SOAuthorization _applicationActivationWithTimeout:].cold.1();

    -[SOAuthorizationCore performBlockOnDelegateQueue:](self->_authorizationCore, "performBlockOnDelegateQueue:", self->_pendingFinishAuthorizationBlock);
    pendingFinishAuthorizationBlock = self->_pendingFinishAuthorizationBlock;
    self->_pendingFinishAuthorizationBlock = 0;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

  }
}

- (void)_extensionCleanup
{
  NSObject *v3;
  SOExtension *extension;
  SORemoteExtensionViewController *extensionViewController;
  SOUIAuthorizationViewController *authorizationViewController;
  SOExtension *v7;
  SOExtension *v8;
  SORemoteExtensionViewController *v9;
  SOUIAuthorizationViewController *v10;
  int v11;
  const char *v12;
  __int16 v13;
  SOExtension *v14;
  __int16 v15;
  SORemoteExtensionViewController *v16;
  __int16 v17;
  SOUIAuthorizationViewController *v18;
  __int16 v19;
  SOAuthorization *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOAuthorization();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    extensionViewController = self->_extensionViewController;
    authorizationViewController = self->_authorizationViewController;
    v11 = 136316162;
    v12 = "-[SOAuthorization _extensionCleanup]";
    v13 = 2114;
    v14 = extension;
    v15 = 2114;
    v16 = extensionViewController;
    v17 = 2114;
    v18 = authorizationViewController;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s extension = %{public}@, extensionViewController = %{public}@, authorizationViewController = %{public}@ on %@", (uint8_t *)&v11, 0x34u);
  }

  v7 = self->_extension;
  if (v7)
  {
    -[SOExtension unload](v7, "unload");
    v8 = self->_extension;
    self->_extension = 0;

  }
  v9 = self->_extensionViewController;
  self->_extensionViewController = 0;

  v10 = self->_authorizationViewController;
  self->_authorizationViewController = 0;

}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  SOAuthorization *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  SO_LOG_SOAuthorization();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315907;
    v12 = "-[SOAuthorization authorization:didCompleteWithCredential:error:]";
    v13 = 2113;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_20DABC000, v9, OS_LOG_TYPE_DEFAULT, "%s %{private}@, %{public}@ on %@", (uint8_t *)&v11, 0x2Au);
  }

  if (v7)
    v10 = (void *)objc_msgSend(objc_alloc((Class)getSOAuthorizationCredentialCoreClass()), "initWithAuthorizationCredential:", v7);
  else
    v10 = 0;
  -[SOAuthorization _finishAuthorizationWithCredential:error:](self, "_finishAuthorizationWithCredential:error:", v10, v8);

}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  SOUIAuthorizationViewController *v16;
  SOUIAuthorizationViewController *authorizationViewController;
  NSObject *v18;
  NSObject *v19;
  SOUIAuthorizationViewController *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE buf[24];
  void *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SO_LOG_SOAuthorization();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOAuthorization presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_20DABC000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v13 = (void *)getSOUIAuthorizationViewControllerClass_softClass;
    v28 = getSOUIAuthorizationViewControllerClass_softClass;
    v14 = MEMORY[0x24BDAC760];
    if (!getSOUIAuthorizationViewControllerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSOUIAuthorizationViewControllerClass_block_invoke;
      v30 = &unk_24C80C0B8;
      v31 = &v25;
      __getSOUIAuthorizationViewControllerClass_block_invoke((uint64_t)buf);
      v13 = (void *)v26[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v25, 8);
    v16 = (SOUIAuthorizationViewController *)objc_msgSend([v15 alloc], "initWithExtensionViewController:hints:", self->_extensionViewController, v8);
    authorizationViewController = self->_authorizationViewController;
    self->_authorizationViewController = v16;

    -[SOUIAuthorizationViewController setDelegate:](self->_authorizationViewController, "setDelegate:", self);
    SO_LOG_SOAuthorization();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SOAuthorization presentAuthorizationViewControllerWithHints:requestIdentifier:completion:].cold.3();

    SO_LOG_SOAuthorization();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[SOAuthorization presentAuthorizationViewControllerWithHints:requestIdentifier:completion:].cold.2();

    v20 = self->_authorizationViewController;
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __92__SOAuthorization_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke;
    v23[3] = &unk_24C80C520;
    v24 = v10;
    objc_msgSend(WeakRetained, "authorization:presentViewController:withCompletion:", self, v20, v23);
    v21 = v24;
    goto LABEL_15;
  }
  SO_LOG_SOAuthorization();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[SOAuthorization presentAuthorizationViewControllerWithHints:requestIdentifier:completion:].cold.1();

  if (v10)
  {
    objc_msgSend(getSOErrorHelperClass_2(), "internalErrorWithMessage:", CFSTR("no authorization delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v21);
LABEL_15:

  }
}

void __92__SOAuthorization_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  SO_LOG_SOAuthorization();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __92__SOAuthorization_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke_cold_1(a2, (uint64_t)v5, v6);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)viewControllerDidCancel:(id)a3
{
  SOUIAuthorizationViewController *v4;
  NSObject *v5;
  SOUIAuthorizationViewController *authorizationViewController;
  int v7;
  const char *v8;
  __int16 v9;
  SOUIAuthorizationViewController *v10;
  __int16 v11;
  SOUIAuthorizationViewController *v12;
  __int16 v13;
  SOAuthorization *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (SOUIAuthorizationViewController *)a3;
  SO_LOG_SOAuthorization();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    authorizationViewController = self->_authorizationViewController;
    v7 = 136315906;
    v8 = "-[SOAuthorization viewControllerDidCancel:]";
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = authorizationViewController;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s viewController = %{public}@, authorizationViewController = %{public}@ on %@", (uint8_t *)&v7, 0x2Au);
  }

  if (self->_authorizationViewController == v4)
    -[SOAuthorization _cancelAuthorization](self, "_cancelAuthorization");

}

- (SOAuthorizationDelegate)delegate
{
  return (SOAuthorizationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enableEmbeddedAuthorizationViewController
{
  return self->_enableEmbeddedAuthorizationViewController;
}

- (void)setEnableEmbeddedAuthorizationViewController:(BOOL)a3
{
  self->_enableEmbeddedAuthorizationViewController = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_pendingFinishAuthorizationBlock, 0);
  objc_storeStrong((id *)&self->_authorizationViewController, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_authorizationCore, 0);
}

+ (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  id v5;
  __int128 v6;
  NSObject *v7;
  _QWORD activity_block[4];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    v12 = xmmword_24C80CB70;
    v13 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_8 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __72__SOAuthorization_Process__isExtensionProcessWithAuditToken_completion___block_invoke;
    activity_block[3] = &unk_24C80CB50;
    v6 = *(_OWORD *)&a3->var0[4];
    v10 = *(_OWORD *)a3->var0;
    v11 = v6;
    v9 = v5;
    _os_activity_initiate(&dword_20DABC000, "isExtensionProcessWithAuditToken", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else
  {
    SO_LOG_SOAuthorization();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    if (v5)
      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

uint64_t __72__SOAuthorization_Process__isExtensionProcessWithAuditToken_completion___block_invoke(uint64_t a1)
{
  id SOAuthorizationCoreClass;
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];

  SOAuthorizationCoreClass = getSOAuthorizationCoreClass();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  return objc_msgSend(SOAuthorizationCoreClass, "isExtensionProcessWithAuditToken:completion:", v6, v3);
}

- (id)realms
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  SOAuthorization *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOAuthorization();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SOAuthorization(Kerberos) realms]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }

  -[SOAuthorizationCore realms](self->_authorizationCore, "realms");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)kerberosProfiles
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  SOAuthorization *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOAuthorization();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SOAuthorization(Kerberos) kerberosProfiles]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }

  -[SOAuthorizationCore kerberosProfiles](self->_authorizationCore, "kerberosProfiles");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)canPerformAuthorizationWithURL:responseCode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_20DABC000, v0, v1, "AppSSOCore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_finishAuthorization:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 136315650;
  v4 = "-[SOAuthorization _finishAuthorization:completion:]";
  v5 = 2112;
  v6 = v2;
  v7 = 2112;
  v8 = a1;
  _os_log_debug_impl(&dword_20DABC000, a2, OS_LOG_TYPE_DEBUG, "%s extension = %@ on %@", (uint8_t *)&v3, 0x20u);
}

- (void)_finishAuthorizationWithCredential:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DABC000, a2, a3, "%@ already finished => ignoring finish request", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_finishAuthorizationWithCredential:(NSObject *)a3 error:.cold.2(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109379;
  HIDWORD(v3) = a1 & 1;
  LOWORD(v4) = 2113;
  *(_QWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_10_1(&dword_20DABC000, a2, a3, "checkApplicationStateBeforeFinishing = %d, profile = %{private}@", v3, (_QWORD)v4, HIWORD(a2));
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "no SPI authorization delegate, identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "finished SPI authorization delegate call: identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorizationDidComplete: identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2_3(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithError:  identifier = %{public}@ (error = %{public}@)");
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithHTTPResponse:httpBody: identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithHTTPAuthorizationHeaders: identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DABC000, a2, a3, "failed to create SecKeys from SecKeyProxyEndpoints: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithAuthorizationResult: identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorizationDidCancel: identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorizationDidNotHandle: identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_13()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_3(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithError: identifier = %{public}@ (error = %{public}@)");
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_54_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_1(&dword_20DABC000, v0, v1, "%{public}@ has finished: identifier = %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_55_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "application not active => authorization pending until application activation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)applicationDidBecomeActive:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[SOAuthorization applicationDidBecomeActive:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_0_1(&dword_20DABC000, a2, a3, "%s  on %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_applicationActivationWithTimeout:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "application activation %@=> finishing pending authorization", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)presentAuthorizationViewControllerWithHints:requestIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_20DABC000, v0, v1, "no SPI authorization delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)presentAuthorizationViewControllerWithHints:requestIdentifier:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "calling SPI authorization delegate authorization:presentViewController:withCompletion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)presentAuthorizationViewControllerWithHints:requestIdentifier:completion:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_3(&dword_20DABC000, v0, v1, "extensionViewController = %{public}@, authorizationViewController = %{public}@");
  OUTLINED_FUNCTION_1();
}

void __92__SOAuthorization_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a1 & 1;
  LOWORD(v4) = 2114;
  *(_QWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_10_1(&dword_20DABC000, a2, a3, "finished SPI authorization delegate authorization:presentViewController:withCompletion: (success = %d, error = %{public}@)", v3, (_QWORD)v4, HIWORD(a2));
  OUTLINED_FUNCTION_1();
}

@end
