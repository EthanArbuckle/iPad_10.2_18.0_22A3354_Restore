@implementation SOExtension

- (SOExtension)initWithExtension:(id)a3
{
  id v5;
  SOExtension *v6;
  SOExtension *v7;
  NSArray *associatedDomains;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *pssoQueue;
  uint64_t v21;
  NSMapTable *extensionDelegates;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SOExtension;
  v6 = -[SOExtension init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    v7->_requestCount = 0;
    associatedDomains = v7->_associatedDomains;
    v7->_associatedDomains = 0;

    v9 = (void *)MEMORY[0x24BDD17C8];
    -[SOExtension localizedExtensionDisplayName](v7, "localizedExtensionDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.AppSSO.extension-queue-(%@)"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "cStringUsingEncoding:", 4), 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v15 = (void *)MEMORY[0x24BDD17C8];
    -[SOExtension localizedExtensionDisplayName](v7, "localizedExtensionDisplayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.PlatformSSO.extension-queue-(%@)"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutorelease(v17);
    v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "cStringUsingEncoding:", 4), 0);
    pssoQueue = v7->_pssoQueue;
    v7->_pssoQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    extensionDelegates = v7->_extensionDelegates;
    v7->_extensionDelegates = (NSMapTable *)v21;

    -[SOExtension _setupExtension](v7, "_setupExtension");
  }

  return v7;
}

- (int)requestCount
{
  SOExtension *v2;
  int requestCount;

  v2 = self;
  objc_sync_enter(v2);
  requestCount = v2->_requestCount;
  objc_sync_exit(v2);

  return requestCount;
}

- (void)incrementRequestCount
{
  SOExtension *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  SOExtension *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  ++v2->_requestCount;
  SO_LOG_SOExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2->_requestCount);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315650;
    v6 = "-[SOExtension incrementRequestCount]";
    v7 = 2114;
    v8 = v4;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s count now %{public}@ on %@", (uint8_t *)&v5, 0x20u);

  }
  objc_sync_exit(v2);

}

- (void)decrementRequestCount
{
  SOExtension *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  SOExtension *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  --v2->_requestCount;
  SO_LOG_SOExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2->_requestCount);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315650;
    v6 = "-[SOExtension decrementRequestCount]";
    v7 = 2114;
    v8 = v4;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s count now %{public}@ on %@", (uint8_t *)&v5, 0x20u);

  }
  objc_sync_exit(v2);

}

- (void)_setupExtension
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v5, &location);
  -[SOExtension extension](self, "extension", v4, 3221225472, __30__SOExtension__setupExtension__block_invoke, &unk_24C80C2A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestInterruptionBlock:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__SOExtension__setupExtension__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __30__SOExtension__setupExtension__block_invoke_2;
    v7[3] = &unk_24C80C1F8;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

void __30__SOExtension__setupExtension__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __30__SOExtension__setupExtension__block_invoke_2_cold_2();

  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    SO_LOG_SOExtension();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __30__SOExtension__setupExtension__block_invoke_2_cold_1();

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = 0;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    NSAllMapTableKeys(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          v12 = *(void **)(a1 + 32);
          objc_msgSend(getSOErrorHelperClass_0(), "errorWithCode:message:", -3, CFSTR("connection to extension interrupted"), (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "authorization:didCompleteWithCredential:error:", v11, 0, v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  objc_sync_exit(v3);

}

- (void)saveDelegate:(id)a3 forRequestIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOExtension *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  SOExtension *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[SOExtension saveDelegate:forRequestIdentifier:]";
    v14 = 2114;
    v15 = v7;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v12, 0x20u);
  }

  v9 = self;
  objc_sync_enter(v9);
  -[NSMapTable setObject:forKey:](v9->_extensionDelegates, "setObject:forKey:", v6, v7);
  SO_LOG_SOExtension();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMapTable count](v9->_extensionDelegates, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[SOExtension saveDelegate:forRequestIdentifier:]";
    v14 = 2114;
    v15 = v11;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEFAULT, "%s current delegate: %{public}@ on %@", (uint8_t *)&v12, 0x20u);

  }
  objc_sync_exit(v9);

}

- (id)findDelegateForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  SOExtension *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  SOExtension *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[SOExtension findDelegateForIdentifier:]";
    v11 = 2114;
    v12 = v4;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v9, 0x20u);
  }

  v6 = self;
  objc_sync_enter(v6);
  -[NSMapTable objectForKey:](v6->_extensionDelegates, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  return v7;
}

- (void)removeDelegateForRequestIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  SOExtension *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  SOExtension *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[SOExtension removeDelegateForRequestIdentifier:]";
    v11 = 2114;
    v12 = v4;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v9, 0x20u);
  }

  v6 = self;
  objc_sync_enter(v6);
  -[NSMapTable removeObjectForKey:](v6->_extensionDelegates, "removeObjectForKey:", v4);
  SO_LOG_SOExtension();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMapTable count](v6->_extensionDelegates, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "-[SOExtension removeDelegateForRequestIdentifier:]";
    v11 = 2114;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "%s current delegates: %{public}@ on %@", (uint8_t *)&v9, 0x20u);

  }
  objc_sync_exit(v6);

}

- (void)setupNonUISessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension setupNonUISessionWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__SOExtension_setupNonUISessionWithCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

uint64_t __47__SOExtension_setupNonUISessionWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupNonUISessionIfNecessaryWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)requestAuthorizationViewControllerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension requestAuthorizationViewControllerWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__SOExtension_requestAuthorizationViewControllerWithCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

uint64_t __64__SOExtension_requestAuthorizationViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupSessionIfNecessaryWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  SOExtension *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v17 = "-[SOExtension beginAuthorizationWithRequestParameters:completion:]";
    v18 = 2114;
    v19 = v9;
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", buf, 0x20u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SOExtension_beginAuthorizationWithRequestParameters_completion___block_invoke;
  block[3] = &unk_24C80C2F0;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(queue, block);

}

uint64_t __66__SOExtension_beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginAuthorizationWithRequestParameters:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4
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
  const char *v16;
  __int16 v17;
  SOExtension *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SOExtension beginAuthorizationWithServiceXPCEndpoint:completion:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SOExtension_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke;
  block[3] = &unk_24C80C2F0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

uint64_t __67__SOExtension_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginAuthorizationWithServiceXPCEndpoint:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
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
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  SOExtension *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SOExtension cancelAuthorization:completion:]";
    v17 = 2114;
    v18 = v6;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SOExtension_cancelAuthorization_completion___block_invoke;
  block[3] = &unk_24C80C368;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

}

void __46__SOExtension_cancelAuthorization_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v17;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_2(a1, v6, v7);

    v8 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__SOExtension_cancelAuthorization_completion___block_invoke_10;
    v13[3] = &unk_24C80C340;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v3, "cancelAuthorization:completion:", v9, v13);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      objc_msgSend(getSOErrorHelperClass_0(), "errorWithCode:", -2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

      objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
    }
  }

}

void __46__SOExtension_cancelAuthorization_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SOExtension_cancelAuthorization_completion___block_invoke_2;
  block[3] = &unk_24C80C318;
  v13 = v5;
  v14 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __46__SOExtension_cancelAuthorization_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__SOExtension_cancelAuthorization_completion___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 56), "decrementRequestCount");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __88__SOExtension_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke;
  v14[3] = &unk_24C80C390;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __88__SOExtension_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "findDelegateForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __88__SOExtension_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(v2, "presentAuthorizationViewControllerWithHints:requestIdentifier:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SOExtension findDelegateForIdentifier:](self, "findDelegateForIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOExtension();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413059;
    v23 = v11;
    v24 = 2113;
    v25 = v9;
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_20DABC000, v12, OS_LOG_TYPE_DEFAULT, "Notifying delegate %@ that extension has finished with credential: %{private}@, identifier: %{public}@, error: %{public}@", buf, 0x2Au);
  }

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__SOExtension_authorization_didCompleteWithCredential_error___block_invoke;
  v17[3] = &unk_24C80C3B8;
  v18 = v11;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], v17);

}

uint64_t __61__SOExtension_authorization_didCompleteWithCredential_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "authorization:didCompleteWithCredential:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
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
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  SOExtension *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SOExtension finishAuthorization:completion:]";
    v17 = 2114;
    v18 = v6;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SOExtension_finishAuthorization_completion___block_invoke;
  block[3] = &unk_24C80C2F0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

uint64_t __46__SOExtension_finishAuthorization_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishAuthorization:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_finishAuthorization:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, _QWORD, id);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  SOExtension *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[SOExtension _finishAuthorization:withCompletion:]";
    v20 = 2114;
    v21 = v6;
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  -[SOExtension _contextForSession](self, "_contextForSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "remoteContextWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  SO_LOG_SOExtension();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    v7[2](v7, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SOExtension _finishAuthorization:withCompletion:].cold.1();

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __51__SOExtension__finishAuthorization_withCompletion___block_invoke;
    v14[3] = &unk_24C80C408;
    v14[4] = self;
    v16 = v7;
    v15 = v6;
    objc_msgSend(v10, "finishAuthorization:completion:", v15, v14);

  }
}

void __51__SOExtension__finishAuthorization_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SOExtension__finishAuthorization_withCompletion___block_invoke_2;
  block[3] = &unk_24C80C3E0;
  v13 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v12 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __51__SOExtension__finishAuthorization_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __51__SOExtension__finishAuthorization_withCompletion___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "decrementRequestCount");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "removeDelegateForRequestIdentifier:", *(_QWORD *)(a1 + 48));
}

- (void)requestReauthenticationWithRequestIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a4;
  -[SOExtension findDelegateForIdentifier:](self, "findDelegateForIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_remoteViewController && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "requestReauthenticationWithCompletion:", v7);
  else
    v7[2](v7, 0);

}

- (void)_setupNonUISessionIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  SOExtension *v6;
  NSUUID *sessionID;
  NSObject *v8;
  _BOOL4 v9;
  _QWORD v10[5];
  void (**v11)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  SOExtension *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[SOExtension _setupNonUISessionIfNecessaryWithCompletion:]";
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[SOExtension incrementRequestCount](self, "incrementRequestCount");
  v6 = self;
  objc_sync_enter(v6);
  sessionID = v6->_sessionID;
  objc_sync_exit(v6);

  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (sessionID)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v13 = (const char *)v6;
      _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "Using existing session for extension %@", buf, 0xCu);
    }

    v4[2](v4, 1, 0);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v13 = (const char *)v6;
      _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "Setting up new session for extension %@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__SOExtension__setupNonUISessionIfNecessaryWithCompletion___block_invoke;
    v10[3] = &unk_24C80C430;
    v10[4] = v6;
    v11 = v4;
    -[SOExtension _setupNonUISessionWithCompletion:](v6, "_setupNonUISessionWithCompletion:", v10);

  }
}

void __59__SOExtension__setupNonUISessionIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "Finished setting up new session for extension %{public}@ with error %{public}@ and session ID %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  }
  else
  {
    v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "_contextForSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContextExtension:", v11);

    objc_sync_exit(v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_setupSessionIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(id, SORemoteExtensionViewController *, _QWORD);
  NSObject *v5;
  SOExtension *v6;
  NSUUID *v7;
  NSObject *v8;
  SORemoteExtensionViewController *remoteViewController;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  void (**v14)(id, SORemoteExtensionViewController *, _QWORD);
  _BYTE *v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  dispatch_semaphore_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, SORemoteExtensionViewController *, _QWORD))a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOExtension _setupSessionIfNecessaryWithCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[SOExtension incrementRequestCount](self, "incrementRequestCount");
  v6 = self;
  objc_sync_enter(v6);
  v7 = v6->_sessionID;
  objc_sync_exit(v6);

  if (!v7)
    goto LABEL_8;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "Using existing session for extension %@", buf, 0xCu);
  }

  remoteViewController = v6->_remoteViewController;
  if (remoteViewController)
  {
    v4[2](v4, remoteViewController, 0);
  }
  else
  {
LABEL_8:
    SO_LOG_SOExtension();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEFAULT, "Setting up new session for extension %@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = dispatch_semaphore_create(0);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__SOExtension__setupSessionIfNecessaryWithCompletion___block_invoke;
    v13[3] = &unk_24C80C458;
    v13[4] = v6;
    v14 = v4;
    v15 = buf;
    -[SOExtension _setupSessionWithCompletion:](v6, "_setupSessionWithCompletion:", v13);
    v11 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
    v12 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v11, v12);

    _Block_object_dispose(buf, 8);
  }

}

void __54__SOExtension__setupSessionIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "Finished setting up new session for extension %{public}@ with error %{public}@ and session ID %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  }
  else
  {
    v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "_contextForSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContextExtension:", v11);

    objc_sync_exit(v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)_finishedSettingUpSession:(id)a3
{
  id v5;
  NSObject *v6;
  SOExtension *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  SOExtension *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SO_LOG_SOExtension();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[SOExtension _finishedSettingUpSession:]";
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_20DABC000, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_sessionID, a3);
  -[SOExtension _contextForSession](v7, "_contextForSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContextExtension:", v7);

  objc_sync_exit(v7);
}

- (void)_setupNonUISessionWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SOExtension extension](self, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "Beginning request for extension %@", buf, 0xCu);

  }
  -[SOExtension extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v7, "beginExtensionRequestWithInputItems:error:", 0, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;

  if (v9)
  {
    SO_LOG_SOExtension();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SOExtension _setupNonUISessionWithCompletion:].cold.1(self, (uint64_t)v9, v10);

    v4[2](v4, 0, v9);
  }
  else if (v4)
  {
    ((void (**)(id, void *, id))v4)[2](v4, v8, 0);
  }

}

- (void)_setupSessionHelperForIOSWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SOExtension extension](self, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "Instantiating view controller %@", buf, 0xCu);

  }
  -[SOExtension extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__SOExtension__setupSessionHelperForIOSWithCompletion___block_invoke;
  v9[3] = &unk_24C80C480;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", MEMORY[0x24BDBD1A8], 0, v9);

}

void __55__SOExtension__setupSessionHelperForIOSWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    SO_LOG_SOExtension();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __55__SOExtension__setupSessionHelperForIOSWithCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
    objc_msgSend(*(id *)(a1 + 32), "_connectContextToSessionWithRequestIdentifier:completion:", v7, *(_QWORD *)(a1 + 40));
  }

}

- (void)_connectContextToSessionWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SORemoteExtensionViewController *remoteViewController;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "Passing session ID to remote view", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  remoteViewController = self->_remoteViewController;
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke;
  v17[3] = &unk_24C80C4A8;
  v11 = v6;
  v18 = v11;
  v19 = buf;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](remoteViewController, "serviceViewControllerProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke_20;
    v14[3] = &unk_24C80C4D0;
    v16 = v7;
    v15 = v11;
    objc_msgSend(v12, "connectToContextWithSessionID:completion:", v15, v14);

  }
  else
  {
    SO_LOG_SOExtension();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SOExtension _connectContextToSessionWithRequestIdentifier:completion:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, *((_QWORD *)v21 + 5));
  }

  _Block_object_dispose(buf, 8);
}

void __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  SO_LOG_SOExtension();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)_beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD, id);
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[SOExtension _contextForSession](self, "_contextForSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "remoteContextWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  SO_LOG_SOExtension();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    v7[2](v7, 0, v10);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SOExtension _beginAuthorizationWithRequestParameters:completion:].cold.1();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke;
    v13[3] = &unk_24C80C520;
    v14 = v7;
    objc_msgSend(v9, "beginAuthorizationWithRequestParameters:completion:", v6, v13);

  }
}

void __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke_2;
  block[3] = &unk_24C80C4F8;
  v10 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke_2_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD, id);
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[SOExtension _contextForSession](self, "_contextForSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "remoteContextWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  SO_LOG_SOExtension();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    v7[2](v7, 0, v10);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SOExtension _beginAuthorizationWithServiceXPCEndpoint:completion:].cold.1();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke;
    v13[3] = &unk_24C80C520;
    v14 = v7;
    objc_msgSend(v9, "beginAuthorizationWithServiceXPCEndpoint:completion:", v6, v13);

  }
}

void __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2;
  block[3] = &unk_24C80C4F8;
  v10 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_contextForSession
{
  SOExtension *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[SOExtension extension](v2, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_extensionContextForUUID:", v2->_sessionID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForSession
{
  void *v4;
  void *v5;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  id v7;

  -[SOExtension _contextForSession](self, "_contextForSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "auditToken");
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (void)unload
{
  NSObject *v3;
  SOExtension *v4;
  void *v5;
  NSUUID *sessionID;
  SORemoteExtensionViewController *remoteViewController;
  int v8;
  const char *v9;
  __int16 v10;
  SOExtension *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SOExtension unload]";
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_sessionID)
  {
    -[SOExtension extension](v4, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelExtensionRequestWithIdentifier:", v4->_sessionID);

    sessionID = v4->_sessionID;
    v4->_sessionID = 0;

    remoteViewController = v4->_remoteViewController;
    v4->_remoteViewController = 0;

  }
  objc_sync_exit(v4);

}

- (NSString)containerAppPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SOExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)localizedExtensionDisplayName
{
  void *v2;
  void *v3;

  -[NSExtension objectForInfoDictionaryKey:](self->_extension, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD1D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)containerAppBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1488];
  -[SOExtension containerAppPath](self, "containerAppPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)extensionBundleIdentifier
{
  void *v2;
  void *v3;

  -[SOExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)extensionRequestsMode
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (!_os_feature_enabled_impl()
      || (-[SOExtension extensionBundleIdentifier](self, "extensionBundleIdentifier"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = +[SOExtensionManager isAppleConnectExtensionBundleIdentifier:](SOExtensionManager, "isAppleConnectExtensionBundleIdentifier:", v3), v3, !v4))
    {
      -[NSExtension infoDictionary](self->_extension, "infoDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSExtension"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SOExtensionRequestsMode"));
      v5 = objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_11;
        if ((-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("Concurrent")) & 1) != 0)
          goto LABEL_9;
        if ((-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("Queue")) & 1) == 0)
        {
LABEL_11:
          SO_LOG_SOExtension();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v11 = 138543362;
            v12 = v5;
            _os_log_impl(&dword_20DABC000, v9, OS_LOG_TYPE_DEFAULT, "invalid SOExtensionRequestsMode: %{public}@, using default", (uint8_t *)&v11, 0xCu);
          }

        }
      }
      v6 = 1;
      goto LABEL_15;
    }
  }
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
LABEL_9:
    v6 = 2;
    goto LABEL_15;
  }
  LOWORD(v11) = 0;
  v6 = 2;
  _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "SOExtensionRequestsModeConcurrent enabled by the feature flag", (uint8_t *)&v11, 2u);
LABEL_15:

  return v6;
}

- (NSArray)authenticationMethods
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSExtension infoDictionary](self->_extension, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SOExtensionSSOGrantTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v13 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("password")))
            objc_msgSend(v5, "addObject:", &unk_24C813028);
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("urn:ietf:params:oauth:grant-type:jwt-bearer")))
          {
            objc_msgSend(v5, "addObject:", &unk_24C813040);
            objc_msgSend(v5, "addObject:", &unk_24C813058);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v4 = v13;
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)removeExpiredEntriesFromCache:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v11, "doubleValue");
          objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timeIntervalSinceNow");
          v15 = v14;
          objc_msgSend(&unk_24C813010, "doubleValue");
          if (v15 < v16 || (objc_msgSend(v13, "timeIntervalSinceNow"), v17 > 0.0))
            objc_msgSend(v3, "removeObjectForKey:", v10);

        }
        else
        {
          objc_msgSend(v3, "removeObjectForKey:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)checkAssociatedDomainsWithCache:(id)a3
{
  NSObject *v4;
  SOExtension *v5;
  NSArray *associatedDomains;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  SOExtension *v40;
  NSObject *v41;
  void *v42;
  char *v43;
  id v44;
  void *v45;
  id *location;
  SOExtension *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  SOExtension *v61;
  __int16 v62;
  NSObject *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v52 = a3;
  if (!-[SOExtension hasAssociatedDomainsApproved](self, "hasAssociatedDomainsApproved"))
  {
    SO_LOG_SOExtension();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[SOExtension checkAssociatedDomainsWithCache:]";
      v60 = 2112;
      v61 = self;
      _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
    }

    -[SOExtension removeExpiredEntriesFromCache:](self, "removeExpiredEntriesFromCache:", v52);
    v5 = self;
    objc_sync_enter(v5);
    associatedDomains = v5->_associatedDomains;
    v5->_associatedDomains = (NSArray *)MEMORY[0x24BDBD1A8];

    objc_sync_exit(v5);
    v7 = (void *)MEMORY[0x24BDC1588];
    -[SOExtension extension](v5, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_extensionBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pluginKitProxyForURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "containingBundle");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject entitlementValueForKey:ofClass:](v12, "entitlementValueForKey:ofClass:", CFSTR("application-identifier"), objc_opt_class());
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = objc_alloc(MEMORY[0x24BE8F730]);
          v15 = objc_msgSend(v14, "initWithServiceType:applicationIdentifier:domain:", *MEMORY[0x24BE8F750], v13, 0);
          v57 = 0;
          objc_msgSend(MEMORY[0x24BE8F728], "serviceDetailsWithServiceSpecifier:error:", v15, &v57);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v57;
          v18 = v17;
          if (v16)
          {
            v44 = v17;
            location = (id *)&v5->_associatedDomains;
            v47 = v5;
            v48 = v15;
            v49 = v13;
            v50 = v12;
            v51 = v11;
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v19 = objc_claimAutoreleasedReturnValue();
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v45 = v16;
            v20 = v16;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v54;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v54 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                  objc_msgSend(v25, "serviceSpecifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "domainHost");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v25, "serviceSpecifier");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "domainPort");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v29)
                  {
                    objc_msgSend(v25, "serviceSpecifier");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "domainPort");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(":%@"), v31);
                    v32 = objc_claimAutoreleasedReturnValue();

                    v27 = (void *)v32;
                  }
                  if (objc_msgSend(v25, "isApproved"))
                  {
                    SO_LOG_SOExtension();
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543362;
                      v59 = (const char *)v27;
                      _os_log_impl(&dword_20DABC000, v33, OS_LOG_TYPE_INFO, "Associated domain: %{public}@ is approved", buf, 0xCu);
                    }

                    -[NSObject addObject:](v19, "addObject:", v27);
                    v34 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend(MEMORY[0x24BDBCE60], "date");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "timeIntervalSince1970");
                    objc_msgSend(v34, "numberWithDouble:");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "setObject:forKeyedSubscript:", v36, v27);

                  }
                  else
                  {
                    objc_msgSend(v52, "objectForKeyedSubscript:", v27);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();

                    SO_LOG_SOExtension();
                    v38 = objc_claimAutoreleasedReturnValue();
                    v39 = v38;
                    if (v37)
                    {
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        v59 = (const char *)v27;
                        _os_log_impl(&dword_20DABC000, v39, OS_LOG_TYPE_INFO, "Associated domain: %{public}@ is cached", buf, 0xCu);
                      }

                      -[NSObject addObject:](v19, "addObject:", v27);
                    }
                    else
                    {
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        v59 = (const char *)v27;
                        _os_log_error_impl(&dword_20DABC000, v39, OS_LOG_TYPE_ERROR, "Associated domain: %{public}@ is not approved", buf, 0xCu);
                      }

                    }
                  }

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
              }
              while (v22);
            }

            v40 = v47;
            objc_sync_enter(v40);
            objc_storeStrong(location, v19);
            objc_sync_exit(v40);

            SO_LOG_SOExtension();
            v41 = objc_claimAutoreleasedReturnValue();
            v11 = v51;
            v13 = v49;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v51, "containingBundle");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "bundleURL");
              v43 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v59 = v43;
              v60 = 2112;
              v61 = (SOExtension *)v19;
              v62 = 2112;
              v63 = v49;
              v64 = 2112;
              v65 = v20;
              _os_log_impl(&dword_20DABC000, v41, OS_LOG_TYPE_INFO, "Associated domain: for app %@: %@, appID: %@, services: %@", buf, 0x2Au);

            }
            v12 = v50;
            v15 = v48;
            v18 = v44;
            v16 = v45;
          }
          else
          {
            SO_LOG_SOExtension();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[SOExtension checkAssociatedDomainsWithCache:].cold.3();
          }

        }
        else
        {
          SO_LOG_SOExtension();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[SOExtension checkAssociatedDomainsWithCache:].cold.2(v12, v15);
        }

      }
      else
      {
        SO_LOG_SOExtension();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[SOExtension checkAssociatedDomainsWithCache:].cold.4();
      }

    }
    else
    {
      SO_LOG_SOExtension();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOExtension checkAssociatedDomainsWithCache:].cold.1(v5, v12);
    }

  }
}

- (BOOL)hasURLApprovedAssociatedDomain:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  SOExtension *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtension();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v25 = "-[SOExtension hasURLApprovedAssociatedDomain:cache:]";
    v26 = 2160;
    v27 = 1752392040;
    v28 = 2117;
    v29 = v6;
    v30 = 2112;
    v31 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s url: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  objc_msgSend(v6, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "port");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "port");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(":%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  -[SOExtension associatedDomains](self, "associatedDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v9);

  if ((v14 & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v16, "doubleValue");
      objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceNow");
      v21 = v20;
      objc_msgSend(&unk_24C813010, "doubleValue");
      v15 = v21 > v22;

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (BOOL)hasAssociatedDomainsApproved
{
  SOExtension *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSArray count](v2->_associatedDomains, "count");
  SO_LOG_SOExtension();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[SOExtension extensionBundleIdentifier](v2, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 1024;
    v10 = v3 != 0;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_INFO, "%{public}@ hasAssociatedDomainsApproved = %d", (uint8_t *)&v7, 0x12u);

  }
  objc_sync_exit(v2);

  return v3 != 0;
}

- (BOOL)isEqualToExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SOExtension extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  SOExtension *v4;
  SOExtension *v5;
  BOOL v6;

  v4 = (SOExtension *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SOExtension isEqualToExtension:](self, "isEqualToExtension:", v5);

  return v6;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SOExtension extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSExtension _extensionBundle](self->_extension, "_extensionBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, bundleID=%@, path=%@, associatedDomains=%@>"), v4, self, v5, v8, self->_associatedDomains);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  SOExtension *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  SOExtension *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[SOExtension viewServiceDidTerminateWithError:]";
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (v4)
  {
    v6 = self;
    objc_sync_enter(v6);
    NSAllMapTableKeys(v6->_extensionDelegates);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v6);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          objc_msgSend(getSOErrorHelperClass_0(), "errorWithCode:message:", -3, CFSTR("connection to extension interrupted"), (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SOExtension authorization:didCompleteWithCredential:error:](v6, "authorization:didCompleteWithCredential:error:", v12, 0, v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *pssoQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  SOExtension *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  SO_LOG_SOExtension();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SOExtension beginDeviceRegistrationUsingOptions:extensionData:completion:]";
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  pssoQueue = self->_pssoQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke;
  v14[3] = &unk_24C80C598;
  v16 = v9;
  v17 = a3;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  v13 = v9;
  dispatch_async(pssoQueue, v14);

}

void __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_cold_1();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_57;
    v10[3] = &unk_24C80C570;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(id *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v3, "beginDeviceRegistrationUsingOptions:extensionData:completion:", v8, v7, v10);

  }
}

void __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_57(uint64_t a1, uint64_t a2)
{
  id v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2;
  block[3] = &unk_24C80C548;
  v6 = a2;
  v3 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_cold_1(a1, v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
}

- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *pssoQueue;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  SOExtension *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  SO_LOG_SOExtension();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SOExtension beginUserRegistrationUsingUserName:authenticationMethod:options:extensionData:completion:]";
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_20DABC000, v15, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  pssoQueue = self->_pssoQueue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke;
  v20[3] = &unk_24C80C5C0;
  v20[4] = self;
  v21 = v12;
  v25 = a4;
  v23 = v14;
  v24 = a5;
  v22 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v14;
  dispatch_async(pssoQueue, v20);

}

void __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_cold_1();

    v7 = *(unsigned int *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_59;
    v12[3] = &unk_24C80C570;
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(id *)(a1 + 56);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v11;
    objc_msgSend(v3, "beginUserRegistrationUsingUserName:authenticationMethod:options:extensionData:completion:", v8, v7, v10, v9, v12);

  }
}

void __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_59(uint64_t a1, uint64_t a2)
{
  id v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2;
  block[3] = &unk_24C80C548;
  v6 = a2;
  v3 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_cold_1(a1, v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
}

- (void)registrationDidCompleteWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *pssoQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension registrationDidCompleteWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  pssoQueue = self->_pssoQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(pssoQueue, v8);

}

void __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_cold_1();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_60;
    v8[3] = &unk_24C80C4D0;
    v7 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v3, "registrationDidCompleteWithCompletion:", v8);

  }
}

uint64_t __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_60(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_60_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
}

- (void)registrationDidCancelWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension registrationDidCancelWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[SOExtension incrementRequestCount](self, "incrementRequestCount");
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__SOExtension_registrationDidCancelWithCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __51__SOExtension_registrationDidCancelWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_cold_1();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_61;
    v8[3] = &unk_24C80C4D0;
    v7 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v3, "registrationDidCancelWithCompletion:", v8);

  }
}

uint64_t __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_61(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_61_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
}

- (void)supportedGrantTypesCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension supportedGrantTypesCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SOExtension_supportedGrantTypesCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __45__SOExtension_supportedGrantTypesCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __45__SOExtension_supportedGrantTypesCompletion___block_invoke_cold_1();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__SOExtension_supportedGrantTypesCompletion___block_invoke_62;
    v8[3] = &unk_24C80C570;
    v7 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v3, "supportedGrantTypesCompletion:", v8);

  }
}

void __45__SOExtension_supportedGrantTypesCompletion___block_invoke_62(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45__SOExtension_supportedGrantTypesCompletion___block_invoke_62_cold_1();

}

- (void)protocolVersionCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension protocolVersionCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SOExtension_protocolVersionCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __41__SOExtension_protocolVersionCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __41__SOExtension_protocolVersionCompletion___block_invoke_cold_1();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __41__SOExtension_protocolVersionCompletion___block_invoke_63;
    v8[3] = &unk_24C80C570;
    v7 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v3, "protocolVersionCompletion:", v8);

  }
}

void __41__SOExtension_protocolVersionCompletion___block_invoke_63(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __41__SOExtension_protocolVersionCompletion___block_invoke_63_cold_1();

}

- (void)canPerformRegistrationCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension canPerformRegistrationCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__SOExtension_canPerformRegistrationCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __48__SOExtension_canPerformRegistrationCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __48__SOExtension_canPerformRegistrationCompletion___block_invoke_cold_2();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__SOExtension_canPerformRegistrationCompletion___block_invoke_64;
    v9[3] = &unk_24C80C5E8;
    v7 = *(id *)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v7;
    objc_msgSend(v3, "canPerformRegistrationCompletion:", v9);
    SO_LOG_SOExtension();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __48__SOExtension_canPerformRegistrationCompletion___block_invoke_cold_1();

  }
}

uint64_t __48__SOExtension_canPerformRegistrationCompletion___block_invoke_64(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
}

- (void)supportedDeviceSigningAlgorithmsCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension supportedDeviceSigningAlgorithmsCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_cold_1();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_66;
    v8[3] = &unk_24C80C610;
    v7 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v3, "supportedDeviceSigningAlgorithmsCompletion:", v8);

  }
}

void __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_66(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_66_cold_1();

}

- (void)supportedDeviceEncryptionAlgorithmsCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension supportedDeviceEncryptionAlgorithmsCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_cold_1();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_68;
    v8[3] = &unk_24C80C610;
    v7 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v3, "supportedDeviceEncryptionAlgorithmsCompletion:", v8);

  }
}

void __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_68(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_68_cold_1();

}

- (void)supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOExtension *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtension supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke;
  v8[3] = &unk_24C80C2C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_cold_1();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_69;
    v8[3] = &unk_24C80C610;
    v7 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v3, "supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:", v8);

  }
}

void __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_69(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_69_cold_1();

}

- (void)keyWillRotateForKeyType:(int64_t)a3 keyProxyEndpoint:(id)a4 extensionData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke;
  block[3] = &unk_24C80C638;
  v20 = v12;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(v13, block);

}

void __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_contextForSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "remoteContextWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  SO_LOG_SOExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_70;
    v11[3] = &unk_24C80C570;
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(id *)(a1 + 56);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v3, "keyWillRotateForKeyType:keyProxyEndpoint:extensionData:completion:", v9, v7, v8, v11);

  }
}

void __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_70(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "decrementRequestCount");
  SO_LOG_SOExtension();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_70_cold_1();

}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_associatedDomains, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_extensionDelegates, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_pssoQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

void __30__SOExtension__setupExtension__block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_20DABC000, v0, OS_LOG_TYPE_ERROR, "Extension interrupted. Nilling out session ID", v1, 2u);
  OUTLINED_FUNCTION_8();
}

void __30__SOExtension__setupExtension__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "interruption handler running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Failed to get remote context with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_10_0(&dword_20DABC000, a2, a3, "Calling cancelAuthorizationWithCompletion on extension requestIdentifier: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __46__SOExtension_cancelAuthorization_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_14();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_debug_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEBUG, "Finished cancelAuthorizationWithCompletion result: %{private}@, error: %{public}@, requestIdentifier: %{public}@ ", v4, 0x20u);
}

void __88__SOExtension_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2113;
  v4 = v0;
  _os_log_debug_impl(&dword_20DABC000, v1, OS_LOG_TYPE_DEBUG, "Notifying delegate %{public}@ that extension wants to show UI, hints = %{private}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_finishAuthorization:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling finishAuthorizationWithCompletion on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __51__SOExtension__finishAuthorization_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_0(&dword_20DABC000, v0, v1, "Finished finishAuthorizationWithCompletion result: %d, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setupNonUISessionWithCompletion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  v8 = a2;
  OUTLINED_FUNCTION_11(&dword_20DABC000, a3, v6, "Request for extension %{public}@ failed with error %{public}@", v7);

  OUTLINED_FUNCTION_3_0();
}

void __55__SOExtension__setupSessionHelperForIOSWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Failed to instantiate view controller because of %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_connectContextToSessionWithRequestIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Session with ID %{public}@ was unable to get remote view service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_14();
  v3 = v0;
  OUTLINED_FUNCTION_11(&dword_20DABC000, v1, (uint64_t)v1, "Session with ID %{public}@ was unable to communicate with the remote service because of %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_beginAuthorizationWithRequestParameters:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling beginAuthorizationWithRequestParameters on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_0(&dword_20DABC000, v0, v1, "Finished beginAuthorizationWithRequestParameters result: %d, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_beginAuthorizationWithServiceXPCEndpoint:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling beginAuthorizationWithServiceXPCEndpoint on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_0(&dword_20DABC000, v0, v1, "Finished beginAuthorizationWithServiceXPCEndpoint result: %d, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)checkAssociatedDomainsWithCache:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_extensionBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, a2, v6, "Associated domain: failed to get extension bundle proxy at path: %{public}@", v7);

  OUTLINED_FUNCTION_3_0();
}

- (void)checkAssociatedDomainsWithCache:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, a2, v4, "Associated domain: failed to get appID for the app at path: %{public}@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)checkAssociatedDomainsWithCache:.cold.3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  v3 = v0;
  OUTLINED_FUNCTION_11(&dword_20DABC000, v1, (uint64_t)v1, "Associated domain: failed to get service details for the appID: %{public}@ with error: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)checkAssociatedDomainsWithCache:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Associated domain: failed to get app proxy for extension: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling beginDeviceRegistrationUsingLoginManager on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10_0(&dword_20DABC000, a2, v4, "Finished beginDeviceRegistrationUsingLoginManager, result = %{public}@", v5);

  OUTLINED_FUNCTION_9_0();
}

void __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling beginUserRegistrationUsingLoginManager on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10_0(&dword_20DABC000, a2, v4, "Finished beginUserRegistrationUsingLoginManager, result = %{public}@", v5);

  OUTLINED_FUNCTION_9_0();
}

void __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling registrationDidComplete on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished registrationDidComplete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling registrationDidCancelWithCompletion on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_61_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished registrationDidCancelWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __45__SOExtension_supportedGrantTypesCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling supportedGrantTypesCompletion on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __45__SOExtension_supportedGrantTypesCompletion___block_invoke_62_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished supportedGrantTypesCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __41__SOExtension_protocolVersionCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling protocolVersionCompletion on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __41__SOExtension_protocolVersionCompletion___block_invoke_63_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished protocolVersionCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __48__SOExtension_canPerformRegistrationCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished canPerformRegistration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __48__SOExtension_canPerformRegistrationCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling canPerformRegistration on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling supportedDeviceSigningAlgorithmsCompletion on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_66_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished supportedDeviceSigningAlgorithmsCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling supportedDeviceEncryptionAlgorithmsCompletion on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_68_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished supportedDeviceEncryptionAlgorithmsCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling supportedUserSecureEnclaveKeySigningAlgorithmsCompletion on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_69_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished supportedUserSecureEnclaveKeySigningAlgorithmsCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Calling keyWillRotateForKeyType on extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_70_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_20DABC000, v0, v1, "Finished keyWillRotateForKeyType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
