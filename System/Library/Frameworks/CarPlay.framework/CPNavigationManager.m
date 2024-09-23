@implementation CPNavigationManager

uint64_t __51__CPNavigationManager_initWithIdentifier_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupConnection");
}

- (void)setSupportsAccNav:(BOOL)a3
{
  self->_supportsAccNav = a3;
}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.navigation.service"), 4096);
  CRNavigationClientInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v4);

  objc_msgSend(v3, "setExportedObject:", self);
  CRNavigationServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __39__CPNavigationManager__setupConnection__block_invoke;
  v17[3] = &unk_24C77C7E8;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v17);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __39__CPNavigationManager__setupConnection__block_invoke_2;
  v15[3] = &unk_24C77C7E8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v15);
  CarPlayFrameworkACCNavLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v3;
    _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit navigation service %{public}@.", buf, 0xCu);
  }

  objc_msgSend(v3, "resume");
  -[CPNavigationManager setConnection:](self, "setConnection:", v3);
  -[CPNavigationManager navigationService](self, "navigationService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __39__CPNavigationManager__setupConnection__block_invoke_75;
  v13[3] = &unk_24C77C810;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v8, "fetchNavigationOwnerWithReply:", v13);

  -[CPNavigationManager navigationService](self, "navigationService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __39__CPNavigationManager__setupConnection__block_invoke_77;
  v11[3] = &unk_24C77C838;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v9, "fetchNavigationIdentifiersWithReply:", v11);

  -[CPNavigationManager navigationService](self, "navigationService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginObserving");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (CRNavigationService)navigationService
{
  void *v2;
  void *v3;

  -[CPNavigationManager connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRNavigationService *)v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

uint64_t __52__CPNavigationManager_navigationOwnershipChangedTo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  int v9;
  __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkACCNavLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = CFSTR("None");
    if (v3 == 1)
      v4 = CFSTR("iOS");
    if (v3 == 2)
      v5 = CFSTR("Car");
    else
      v5 = (__CFString *)v4;
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "Updating navigationOwnershipChangedTo: %{public}@ delegate=%@", (uint8_t *)&v9, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setOwner:", *(_QWORD *)(a1 + 40));
}

- (void)setOwner:(unint64_t)a3
{
  NSObject *v5;
  unint64_t owner;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  int v13;
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_owner != a3)
  {
    CarPlayFrameworkACCNavLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      owner = self->_owner;
      if (owner == 1)
        v7 = CFSTR("iOS");
      else
        v7 = CFSTR("None");
      if (owner == 2)
        v8 = CFSTR("Car");
      else
        v8 = (__CFString *)v7;
      v9 = v8;
      if (a3 == 1)
        v10 = CFSTR("iOS");
      else
        v10 = CFSTR("None");
      if (a3 == 2)
        v10 = CFSTR("Car");
      v11 = v10;
      v13 = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Navigation owner changed from %{public}@ to %{public}@", (uint8_t *)&v13, 0x16u);

    }
    self->_owner = a3;
    -[CPNavigationManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationOwnershipChangedToOwner:", a3);

    -[CPNavigationManager _resendInfo](self, "_resendInfo");
  }
}

- (CPNavigationManagerDelegate)delegate
{
  return (CPNavigationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)navigationOwnershipChangedTo:(unint64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkACCNavLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("None");
    if (a3 == 1)
      v6 = CFSTR("iOS");
    if (a3 == 2)
      v6 = CFSTR("Car");
    v7 = v6;
    -[CPNavigationManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Dispatching navigationOwnershipChangedTo: %{public}@ delegate=%@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__CPNavigationManager_navigationOwnershipChangedTo___block_invoke;
  v9[3] = &unk_24C77C8A0;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);
}

- (void)activeNavigationIdentifiersChangedTo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CPNavigationManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__CPNavigationManager_activeNavigationIdentifiersChangedTo___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __60__CPNavigationManager_activeNavigationIdentifiersChangedTo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkACCNavLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "activeNavigationIdentifiers=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLastNavigatingBundleIdentifier:", v4);

}

- (void)setLastNavigatingBundleIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *lastNavigatingBundleIdentifier;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSString isEqualToString:](self->_lastNavigatingBundleIdentifier, "isEqualToString:", v5))
  {
    CarPlayFrameworkACCNavLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      lastNavigatingBundleIdentifier = self->_lastNavigatingBundleIdentifier;
      v8 = 138543618;
      v9 = lastNavigatingBundleIdentifier;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_20D6F4000, v6, OS_LOG_TYPE_DEFAULT, "updating lastNavigatingBundleIdentifier from %{public}@ to %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)&self->_lastNavigatingBundleIdentifier, a3);
    -[CPNavigationManager _resendInfo](self, "_resendInfo");
  }

}

- (CPNavigationManager)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CPNavigationManager *v8;
  NSObject *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *bundleName;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSString *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSString *v22;
  uint64_t v23;
  NSMutableDictionary *accNavControllersIndexed;
  uint64_t v25;
  NSMutableDictionary *maneuversIndexed;
  uint64_t v27;
  NSMutableDictionary *laneGuidanceIndexed;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *connectionQueue;
  NSObject *v32;
  _QWORD v34[4];
  CPNavigationManager *v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CPNavigationManager;
  v8 = -[CPNavigationManager init](&v37, sel_init);
  if (v8)
  {
    CarPlayFrameworkACCNavLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v39 = v6;
      v40 = 2112;
      v41 = v7;
      _os_log_impl(&dword_20D6F4000, v9, OS_LOG_TYPE_DEFAULT, "init! identifier=%{public}@ delegate=%@", buf, 0x16u);
    }

    v10 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v8->_ownershipRequested = 0;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Maps")))
    {
      CPLocalizedStringForKey(CFSTR("APPLE_MAPS"));
      v12 = objc_claimAutoreleasedReturnValue();
      bundleName = v8->_bundleName;
      v8->_bundleName = (NSString *)v12;
LABEL_17:

      v23 = objc_opt_new();
      accNavControllersIndexed = v8->_accNavControllersIndexed;
      v8->_accNavControllersIndexed = (NSMutableDictionary *)v23;

      v25 = objc_opt_new();
      maneuversIndexed = v8->_maneuversIndexed;
      v8->_maneuversIndexed = (NSMutableDictionary *)v25;

      v27 = objc_opt_new();
      laneGuidanceIndexed = v8->_laneGuidanceIndexed;
      v8->_laneGuidanceIndexed = (NSMutableDictionary *)v27;

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = dispatch_queue_create("com.apple.carkit.navigation.xpcConnection", v29);
      connectionQueue = v8->_connectionQueue;
      v8->_connectionQueue = (OS_dispatch_queue *)v30;

      -[CPNavigationManager connectionQueue](v8, "connectionQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __51__CPNavigationManager_initWithIdentifier_delegate___block_invoke;
      v34[3] = &unk_24C77C5B0;
      v35 = v8;
      dispatch_sync(v32, v34);

      goto LABEL_18;
    }
    v36 = 0;
    objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithApplicationIdentifier:error:", v6, &v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    bundleName = (NSString *)v36;
    objc_opt_class();
    v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v15)
      {
        -[NSObject localizedNameWithContext:](v15, "localizedNameWithContext:", CFSTR("Car"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          -[NSObject localizedName](v15, "localizedName");
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        v22 = v8->_bundleName;
        v8->_bundleName = v18;

        v20 = v15;
        goto LABEL_16;
      }
    }
    else
    {

      if (v15)
      {
        -[NSObject localizedName](v15, "localizedName");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v8->_bundleName;
        v8->_bundleName = (NSString *)v19;
LABEL_16:

        goto LABEL_17;
      }
    }
    CarPlayFrameworkACCNavLogging();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[NSString description](bundleName, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v21;
      _os_log_impl(&dword_20D6F4000, v20, OS_LOG_TYPE_DEFAULT, "Unable to retrieve app record: %@", buf, 0xCu);

    }
    goto LABEL_16;
  }
LABEL_18:

  return v8;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)_resendInfo
{
  NSObject *v3;
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[CPNavigationManager ownsNavigation](self, "ownsNavigation")
    && -[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "resending Info", (uint8_t *)&v11, 2u);
    }

    -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", &__block_literal_global_1);
  }
  else
  {
    CarPlayFrameworkACCNavLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("YES");
      if (-[CPNavigationManager ownsNavigation](self, "ownsNavigation"))
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      if (!-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
        v5 = CFSTR("NO");
      v7 = -[CPNavigationManager owner](self, "owner");
      v8 = CFSTR("None");
      if (v7 == 1)
        v8 = CFSTR("iOS");
      if (v7 == 2)
        v8 = CFSTR("Car");
      v9 = v8;
      -[CPNavigationManager lastNavigatingBundleIdentifier](self, "lastNavigatingBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v6;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "resending Info failed ownsNavigation=%@ supportsAccNav=%@ owner=%@ lastNavigatingBundleIdentifier=%@", (uint8_t *)&v11, 0x2Au);

    }
  }
}

- (BOOL)ownsNavigation
{
  void *v3;
  void *v4;
  char v5;

  if (-[CPNavigationManager owner](self, "owner") != 1)
    return 0;
  -[CPNavigationManager lastNavigatingBundleIdentifier](self, "lastNavigatingBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationManager identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (unint64_t)owner
{
  return self->_owner;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CPNavigationManager;
  -[CPNavigationManager dealloc](&v2, sel_dealloc);
}

uint64_t __34__CPNavigationManager__resendInfo__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resendInfo");
}

- (void)invalidate
{
  void *v3;

  -[CPNavigationManager connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CPNavigationManager setConnection:](self, "setConnection:", 0);
}

- (void)requestNavigationOwnership
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkACCNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CPNavigationManager identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CPNavigationManager supportsAccNav](self, "supportsAccNav");
    v6 = CFSTR("NO");
    if (v5)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "requestNavigationOwnership for %@ supporting AccNav %@", buf, 0x16u);

  }
  -[CPNavigationManager navigationService](self, "navigationService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationManager identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addNavigationOwnerWithIdentifier:supportsAccNav:", v8, -[CPNavigationManager supportsAccNav](self, "supportsAccNav"));

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CPNavigationManager_requestNavigationOwnership__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __49__CPNavigationManager_requestNavigationOwnership__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOwnershipRequested:", 1);
}

- (void)releaseNavigationOwnership
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[16];

  CarPlayFrameworkACCNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "releaseNavigationOwnership", buf, 2u);
  }

  -[CPNavigationManager navigationService](self, "navigationService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationManager identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNavigationOwnerWithIdentifier:", v5);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CPNavigationManager_releaseNavigationOwnership__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __49__CPNavigationManager_releaseNavigationOwnership__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setOwnershipRequested:", 0);
  objc_msgSend(*(id *)(a1 + 32), "accNavControllersIndexed");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_createRouteGuidanceObject
{
  CPRouteGuidance *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_alloc_init(CPRouteGuidance);
  -[CPNavigationManager bundleName](self, "bundleName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[CPNavigationManager bundleName](self, "bundleName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPRouteGuidance setSourceName:](v3, "setSourceName:", v6);

  }
  -[CPRouteGuidance setBeingShownInApp:](v3, "setBeingShownInApp:", 1);
  -[CPRouteGuidance setSourceSupportsRouteGuidance:](v3, "setSourceSupportsRouteGuidance:", -[CPNavigationManager supportsAccNav](self, "supportsAccNav"));
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
    -[CPRouteGuidance setDestinationTimeZoneOffsetMinutes:](v3, "setDestinationTimeZoneOffsetMinutes:", -[CPNavigationManager destinationTimeZoneOffsetMinutes](self, "destinationTimeZoneOffsetMinutes"));
  return v3;
}

- (void)_resetRouteGuidanceIsRequired:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkACCNavLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    -[CPNavigationManager routeGuidance](self, "routeGuidance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCPGuidanceState(objc_msgSend(v7, "guidanceState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Resetting RouteGuidance. required=%{public}@ guidanceState=%{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[CPNavigationManager routeGuidance](self, "routeGuidance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "guidanceState");

  if (v10 || v3)
  {
    -[CPNavigationManager _createRouteGuidanceObject](self, "_createRouteGuidanceObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPNavigationManager setRouteGuidance:](self, "setRouteGuidance:", v11);

    -[CPNavigationManager maneuversIndexed](self, "maneuversIndexed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    -[CPNavigationManager laneGuidanceIndexed](self, "laneGuidanceIndexed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", &__block_literal_global_56);
  }
}

uint64_t __53__CPNavigationManager__resetRouteGuidanceIsRequired___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

- (void)_enumerateNavControllersWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CPNavigationManager accNavControllersIndexed](self, "accNavControllersIndexed", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (unsigned)guidanceState
{
  void *v2;
  unsigned __int8 v3;

  -[CPNavigationManager routeGuidance](self, "routeGuidance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "guidanceState");

  return v3;
}

- (void)resetRouteGuidance
{
  -[CPNavigationManager _resetRouteGuidanceIsRequired:](self, "_resetRouteGuidanceIsRequired:", 1);
}

- (void)modifyRouteGuidance:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    -[CPNavigationManager routeGuidance](self, "routeGuidance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    if (!v5)
    {
      -[CPNavigationManager _createRouteGuidanceObject](self, "_createRouteGuidanceObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6[2](v6, v5);
    -[CPNavigationManager setRouteGuidance:](self, "setRouteGuidance:", v5);

  }
}

- (void)startNavigationWithRouteInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "startNavigationWithRouteInfo", v9, 2u);
    }

    objc_msgSend(v4, "routeGuidance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "guidanceState");

    if ((_DWORD)v7 != 1 && (_DWORD)v7 != 6)
    {
      CarPlayFrameworkACCNavLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[CPNavigationManager startNavigationWithRouteInfo:].cold.1(v7, v8);

      v7 = 1;
    }
    -[CPNavigationManager _startNavigationWithRouteInfo:originalState:](self, "_startNavigationWithRouteInfo:originalState:", v4, v7);
  }

}

- (void)_startNavigationWithRouteInfo:(id)a3 originalState:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  char v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CarPlayFrameworkACCNavLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromCPGuidanceState(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "_startNavigationWithRouteInfo:originalState: %{public}@", buf, 0xCu);

  }
  -[CPNavigationManager resetRouteGuidance](self, "resetRouteGuidance");
  CarPlayFrameworkACCNavLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6F4000, v9, OS_LOG_TYPE_DEFAULT, "startNavigation: route reset", buf, 2u);
  }

  objc_msgSend(v6, "routeGuidance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGuidanceState:", 3);
  objc_msgSend(v6, "maneuvers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTotalManeuverCount:", (unsigned __int16)objc_msgSend(v11, "count"));

  objc_msgSend(v6, "laneGuidances");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTotalLaneGuidanceCount:", (unsigned __int16)objc_msgSend(v12, "count"));

  -[CPNavigationManager setRouteGuidance:](self, "setRouteGuidance:", v10);
  CarPlayFrameworkACCNavLogging();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6F4000, v13, OS_LOG_TYPE_DEFAULT, "startNavigation: set route guidance with loading state and counts", buf, 2u);
  }

  objc_msgSend(v6, "maneuvers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationManager setManeuvers:](self, "setManeuvers:", v14);

  objc_msgSend(v6, "laneGuidances");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationManager setLaneGuidances:](self, "setLaneGuidances:", v15);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__CPNavigationManager__startNavigationWithRouteInfo_originalState___block_invoke;
  v17[3] = &__block_descriptor_33_e25_v16__0__CPRouteGuidance_8l;
  v18 = v4;
  -[CPNavigationManager modifyRouteGuidance:](self, "modifyRouteGuidance:", v17);
  CarPlayFrameworkACCNavLogging();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6F4000, v16, OS_LOG_TYPE_DEFAULT, "startNavigation: set route guidance with original route guidance", buf, 2u);
  }

}

uint64_t __67__CPNavigationManager__startNavigationWithRouteInfo_originalState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGuidanceState:", *(unsigned __int8 *)(a1 + 32));
}

- (void)startRerouting
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[CPNavigationManager routeGuidance](self, "routeGuidance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCPGuidanceState(objc_msgSend(v4, "guidanceState"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "startRerouting: current state: %{public}@", (uint8_t *)&v11, 0xCu);

    }
    -[CPNavigationManager routeGuidance](self, "routeGuidance");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[CPNavigationManager routeGuidance](self, "routeGuidance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "guidanceState");

      if (v9)
      {
        -[CPNavigationManager modifyRouteGuidance:](self, "modifyRouteGuidance:", &__block_literal_global_58);
        CarPlayFrameworkACCNavLogging();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_20D6F4000, v10, OS_LOG_TYPE_DEFAULT, "startRerouting: set rerouting routeguidance", (uint8_t *)&v11, 2u);
        }

      }
    }
  }
}

uint64_t __37__CPNavigationManager_startRerouting__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGuidanceState:", 5);
}

- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCPRerouteReason(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "routeChangedWithReason: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v6, "routeGuidance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPNavigationManager _startNavigationWithRouteInfo:originalState:](self, "_startNavigationWithRouteInfo:originalState:", v6, objc_msgSend(v9, "guidanceState"));

  }
}

- (void)cancelRerouting
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[CPNavigationManager routeGuidance](self, "routeGuidance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCPGuidanceState(objc_msgSend(v4, "guidanceState"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "cancelRerouting guidanceState: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[CPNavigationManager routeGuidance](self, "routeGuidance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "guidanceState");

    if (v7 == 5)
    {
      CarPlayFrameworkACCNavLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_20D6F4000, v8, OS_LOG_TYPE_DEFAULT, "cancelRerouting: state was rerouting, setting to active", (uint8_t *)&v9, 2u);
      }

      -[CPNavigationManager modifyRouteGuidance:](self, "modifyRouteGuidance:", &__block_literal_global_59);
    }
  }
}

void __38__CPNavigationManager_cancelRerouting__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  CarPlayFrameworkACCNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "cancelRerouting: setting guidance state to active", v4, 2u);
  }

  objc_msgSend(v2, "setGuidanceState:", 1);
}

- (void)setRouteGuidance:(id)a3
{
  id v5;
  CPRouteGuidance *routeGuidance;
  NSObject *v7;

  v5 = a3;
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    routeGuidance = self->_routeGuidance;
    if (!routeGuidance || !-[CPRouteGuidance isEqual:](routeGuidance, "isEqual:", v5))
    {
      objc_storeStrong((id *)&self->_routeGuidance, a3);
      CarPlayFrameworkACCNavLogging();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[CPNavigationManager setRouteGuidance:].cold.1((uint64_t)v5);

      -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", &__block_literal_global_61);
    }
  }

}

uint64_t __40__CPNavigationManager_setRouteGuidance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delegateUpdatedRouteGuidance");
}

- (NSArray)maneuvers
{
  void *v2;
  void *v3;
  void *v4;

  -[CPNavigationManager maneuversIndexed](self, "maneuversIndexed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_63);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __32__CPNavigationManager_maneuvers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedShort:", objc_msgSend(a2, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "index");

  objc_msgSend(v7, "numberWithUnsignedShort:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (void)setManeuvers:(id)a3
{
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
      -[CPNavigationManager setManeuvers:].cold.2(v4, v5);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          CarPlayFrameworkACCNavLogging();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[CPNavigationManager setManeuvers:].cold.1();

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    -[CPNavigationManager maneuversIndexed](self, "maneuversIndexed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[CPNavigationManager maneuversIndexed](self, "maneuversIndexed");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v18, "index"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __36__CPNavigationManager_setManeuvers___block_invoke;
    v21[3] = &unk_24C77C6D8;
    v21[4] = self;
    -[CPNavigationManager modifyRouteGuidance:](self, "modifyRouteGuidance:", v21);
    -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", &__block_literal_global_65);
  }

}

void __36__CPNavigationManager_setManeuvers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "maneuversIndexed");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalManeuverCount:", (unsigned __int16)objc_msgSend(v4, "count"));

}

uint64_t __36__CPNavigationManager_setManeuvers___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delegateUpdatedManeuvers");
}

- (void)addManeuvers:(id)a3
{
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  _QWORD v25[5];
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
      -[CPNavigationManager addManeuvers:].cold.2(v4, v5);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          CarPlayFrameworkACCNavLogging();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[CPNavigationManager addManeuvers:].cold.1();

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v8);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v28;
      while (1)
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          -[CPNavigationManager maneuversIndexed](self, "maneuversIndexed", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v17, "index"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            if ((objc_msgSend(v20, "isEqual:", v17) & 1) != 0)
              goto LABEL_22;
            v26[0] = MEMORY[0x24BDAC760];
            v26[1] = 3221225472;
            v26[2] = __36__CPNavigationManager_addManeuvers___block_invoke;
            v26[3] = &unk_24C77C720;
            v26[4] = v17;
            -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", v26);
          }
          -[CPNavigationManager maneuversIndexed](self, "maneuversIndexed");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v17, "index"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, v22);

          v14 = 1;
LABEL_22:

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (!v13)
          goto LABEL_26;
      }
    }
    v14 = 0;
LABEL_26:

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __36__CPNavigationManager_addManeuvers___block_invoke_2;
    v25[3] = &unk_24C77C6D8;
    v25[4] = self;
    -[CPNavigationManager modifyRouteGuidance:](self, "modifyRouteGuidance:", v25);
    v4 = v23;
    if ((v14 & 1) != 0)
      -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", &__block_literal_global_66);
  }

}

uint64_t __36__CPNavigationManager_addManeuvers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delegateUpdatedManeuver:", *(_QWORD *)(a1 + 32));
}

void __36__CPNavigationManager_addManeuvers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "maneuversIndexed");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalManeuverCount:", (unsigned __int16)objc_msgSend(v4, "count"));

}

uint64_t __36__CPNavigationManager_addManeuvers___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delegateUpdatedManeuvers");
}

- (NSArray)laneGuidances
{
  void *v2;
  void *v3;
  void *v4;

  -[CPNavigationManager laneGuidanceIndexed](self, "laneGuidanceIndexed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __36__CPNavigationManager_laneGuidances__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedShort:", objc_msgSend(a2, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "index");

  objc_msgSend(v7, "numberWithUnsignedShort:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (void)setLaneGuidances:(id)a3
{
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
      -[CPNavigationManager setLaneGuidances:].cold.2(v4, v5);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          CarPlayFrameworkACCNavLogging();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[CPNavigationManager setLaneGuidances:].cold.1();

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    -[CPNavigationManager laneGuidanceIndexed](self, "laneGuidanceIndexed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[CPNavigationManager laneGuidanceIndexed](self, "laneGuidanceIndexed");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v18, "index"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __40__CPNavigationManager_setLaneGuidances___block_invoke;
    v21[3] = &unk_24C77C6D8;
    v21[4] = self;
    -[CPNavigationManager modifyRouteGuidance:](self, "modifyRouteGuidance:", v21);
    -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", &__block_literal_global_69);
  }

}

void __40__CPNavigationManager_setLaneGuidances___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "laneGuidanceIndexed");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalLaneGuidanceCount:", (unsigned __int16)objc_msgSend(v4, "count"));

}

uint64_t __40__CPNavigationManager_setLaneGuidances___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delegateUpdatedLaneGuidances");
}

- (void)addLaneGuidances:(id)a3
{
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  _QWORD v25[5];
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
  {
    CarPlayFrameworkACCNavLogging();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
      -[CPNavigationManager addLaneGuidances:].cold.2(v4, v5);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          CarPlayFrameworkACCNavLogging();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[CPNavigationManager addLaneGuidances:].cold.1();

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v8);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v28;
      while (1)
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          -[CPNavigationManager laneGuidanceIndexed](self, "laneGuidanceIndexed", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v17, "index"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            if ((objc_msgSend(v20, "isEqual:", v17) & 1) != 0)
              goto LABEL_22;
            v26[0] = MEMORY[0x24BDAC760];
            v26[1] = 3221225472;
            v26[2] = __40__CPNavigationManager_addLaneGuidances___block_invoke;
            v26[3] = &unk_24C77C720;
            v26[4] = v17;
            -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", v26);
          }
          -[CPNavigationManager laneGuidanceIndexed](self, "laneGuidanceIndexed");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v17, "index"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, v22);

          v14 = 1;
LABEL_22:

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (!v13)
          goto LABEL_26;
      }
    }
    v14 = 0;
LABEL_26:

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __40__CPNavigationManager_addLaneGuidances___block_invoke_2;
    v25[3] = &unk_24C77C6D8;
    v25[4] = self;
    -[CPNavigationManager modifyRouteGuidance:](self, "modifyRouteGuidance:", v25);
    v4 = v23;
    if ((v14 & 1) != 0)
      -[CPNavigationManager _enumerateNavControllersWithBlock:](self, "_enumerateNavControllersWithBlock:", &__block_literal_global_70);
  }

}

uint64_t __40__CPNavigationManager_addLaneGuidances___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delegateUpdatedLaneGuidance:", *(_QWORD *)(a1 + 32));
}

void __40__CPNavigationManager_addLaneGuidances___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "laneGuidanceIndexed");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalLaneGuidanceCount:", (unsigned __int16)objc_msgSend(v4, "count"));

}

uint64_t __40__CPNavigationManager_addLaneGuidances___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delegateUpdatedLaneGuidances");
}

void __39__CPNavigationManager__setupConnection__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionRetryDelay");
  v4 = v3;
  CarPlayFrameworkACCNavLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = WeakRetained;
    v14 = 2114;
    v15 = v6;
    v16 = 2048;
    v17 = v4;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "connection interrupted %{public}@ %{public}@. Reconnect in %.2f seconds", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  objc_msgSend(WeakRetained, "setConnection:", 0);
  v8 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  objc_msgSend(WeakRetained, "connectionQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CPNavigationManager__setupConnection__block_invoke_74;
  block[3] = &unk_24C77C7E8;
  objc_copyWeak(&v11, v1);
  dispatch_after(v8, v9, block);

  objc_destroyWeak(&v11);
}

void __39__CPNavigationManager__setupConnection__block_invoke_74(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setupConnection");
  objc_msgSend(WeakRetained, "_handleConnectionReset");

}

void __39__CPNavigationManager__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CarPlayFrameworkACCNavLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543618;
    v6 = WeakRetained;
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated %{public}@ %{public}@", (uint8_t *)&v5, 0x16u);

  }
  objc_msgSend(WeakRetained, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(WeakRetained, "setConnection:", 0);
}

void __39__CPNavigationManager__setupConnection__block_invoke_75(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  CarPlayFrameworkACCNavLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "inital fetch of owner", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationOwnershipChangedTo:", a2);

}

void __39__CPNavigationManager__setupConnection__block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  v3 = a2;
  CarPlayFrameworkACCNavLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "inital fetch of navigationIdentifiers", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activeNavigationIdentifiersChangedTo:", v3);

}

- (double)_connectionRetryDelay
{
  if (_connectionRetryDelay_onceToken != -1)
    dispatch_once(&_connectionRetryDelay_onceToken, &__block_literal_global_79);
  return *(double *)&_connectionRetryDelay_xpcRetryDelay;
}

void __44__CPNavigationManager__connectionRetryDelay__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("CPXPCRetryDelay"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v1 = v3;
  }
  else
  {
    v2 = 15.0;
  }
  _connectionRetryDelay_xpcRetryDelay = *(_QWORD *)&v2;

}

- (void)_handleConnectionReset
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CPNavigationManager__handleConnectionReset__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __45__CPNavigationManager__handleConnectionReset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "ownershipRequested"))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addNavigationOwnerWithIdentifier:supportsAccNav:", v3, objc_msgSend(*(id *)(a1 + 32), "supportsAccNav"));

    objc_msgSend(*(id *)(a1 + 32), "navigationService");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginObserving");

  }
}

- (void)didUpdateActiveComponents:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CPNavigationManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__CPNavigationManager_didUpdateActiveComponents___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __49__CPNavigationManager_didUpdateActiveComponents___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkACCNavLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v38 = v3;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "activeComponents=%{public}@", buf, 0xCu);
  }

  v4 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "accNavControllersIndexed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    v10 = MEMORY[0x24BDBD1C0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    v15 = MEMORY[0x24BDBD1C8];
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v17, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v18);

        objc_msgSend(*(id *)(a1 + 40), "accNavControllersIndexed");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15298]), "initWithComponent:delegate:", v17, *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 40), "accNavControllersIndexed");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uuid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v13);
  }

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __49__CPNavigationManager_didUpdateActiveComponents___block_invoke_84;
  v26[3] = &unk_24C77C8F0;
  v26[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v26);

}

void __49__CPNavigationManager_didUpdateActiveComponents___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(a3, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accNavControllersIndexed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (CRAccNavInfoProviding)routeGuidanceProviding
{
  id v2;
  id v3;

  -[CPNavigationManager routeGuidance](self, "routeGuidance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_2549DB8A0))
    v3 = v2;
  else
    v3 = 0;

  return (CRAccNavInfoProviding *)v3;
}

- (void)sendInfo:(id)a3 toComponentUID:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (-[CPNavigationManager supportsAccNav](self, "supportsAccNav"))
    {
      v8 = -[CPNavigationManager ownsNavigation](self, "ownsNavigation");
      CarPlayFrameworkACCNavLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        if (v10)
          -[CPNavigationManager sendInfo:toComponentUID:].cold.2();

        -[CPNavigationManager navigationService](self, "navigationService");
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSObject sendInfo:toComponentUID:](v9, "sendInfo:toComponentUID:", v6, v7);
      }
      else if (v10)
      {
        -[CPNavigationManager sendInfo:toComponentUID:].cold.3((uint64_t)v7, self, v9);
      }
    }
    else
    {
      CarPlayFrameworkACCNavLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CPNavigationManager sendInfo:toComponentUID:].cold.4((uint64_t)v7, self, v9);
    }
  }
  else
  {
    CarPlayFrameworkACCNavLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CPNavigationManager sendInfo:toComponentUID:].cold.1();
  }

}

- (NSString)lastNavigatingBundleIdentifier
{
  return self->_lastNavigatingBundleIdentifier;
}

- (BOOL)supportsAccNav
{
  return self->_supportsAccNav;
}

- (signed)destinationTimeZoneOffsetMinutes
{
  return self->_destinationTimeZoneOffsetMinutes;
}

- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3
{
  self->_destinationTimeZoneOffsetMinutes = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (BOOL)ownershipRequested
{
  return self->_ownershipRequested;
}

- (void)setOwnershipRequested:(BOOL)a3
{
  self->_ownershipRequested = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CPRouteGuidance)routeGuidance
{
  return self->_routeGuidance;
}

- (NSMutableDictionary)maneuversIndexed
{
  return self->_maneuversIndexed;
}

- (NSMutableDictionary)laneGuidanceIndexed
{
  return self->_laneGuidanceIndexed;
}

- (NSMutableDictionary)accNavControllersIndexed
{
  return self->_accNavControllersIndexed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accNavControllersIndexed, 0);
  objc_storeStrong((id *)&self->_laneGuidanceIndexed, 0);
  objc_storeStrong((id *)&self->_maneuversIndexed, 0);
  objc_storeStrong((id *)&self->_routeGuidance, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastNavigatingBundleIdentifier, 0);
}

- (void)startNavigationWithRouteInfo:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  NSStringFromCPGuidanceState(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_20D6F4000, a2, OS_LOG_TYPE_FAULT, "unexpected state in startNavigation: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)setRouteGuidance:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20D6F4000, v2, v3, "Setting RouteGuidance: {\n%{public}@\n}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)setManeuvers:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4();
  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8((uint64_t)v1, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_20D6F4000, v2, v3, "Setting Maneuvers: {\n%{public}@\n}");

  OUTLINED_FUNCTION_3();
}

- (void)setManeuvers:(void *)a1 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20D6F4000, v2, v3, "Setting Maneuvers: maneuvers.count=%lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2();
}

- (void)addManeuvers:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4();
  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8((uint64_t)v1, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_20D6F4000, v2, v3, "Adding Maneuvers: {\n%{public}@\n}");

  OUTLINED_FUNCTION_3();
}

- (void)addManeuvers:(void *)a1 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20D6F4000, v2, v3, "Adding Maneuvers: maneuvers.count=%lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2();
}

- (void)setLaneGuidances:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4();
  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8((uint64_t)v1, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_20D6F4000, v2, v3, "Setting LaneGuidances: {\n%{public}@\n}");

  OUTLINED_FUNCTION_3();
}

- (void)setLaneGuidances:(void *)a1 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20D6F4000, v2, v3, "Setting LaneGuidances: laneGuidances.count=%lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2();
}

- (void)addLaneGuidances:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4();
  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8((uint64_t)v1, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_20D6F4000, v2, v3, "Adding LaneGuidances: {\n%{public}@\n}");

  OUTLINED_FUNCTION_3();
}

- (void)addLaneGuidances:(void *)a1 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20D6F4000, v2, v3, "Adding LaneGuidances: laneGuidances.count=%lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2();
}

- (void)sendInfo:toComponentUID:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_20D6F4000, v0, OS_LOG_TYPE_DEBUG, "%s: componentUID=%{public}@ nothing to send", (uint8_t *)v1, 0x16u);
}

- (void)sendInfo:toComponentUID:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_7(&dword_20D6F4000, v2, (uint64_t)v2, "%s: componentUID=%{public}@ info=%{public}@", (uint8_t *)v3);
}

- (void)sendInfo:(NSObject *)a3 toComponentUID:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "owner");
  v8 = CFSTR("None");
  if (v7 == 1)
    v8 = CFSTR("iOS");
  if (v7 == 2)
    v8 = CFSTR("Car");
  v9 = v8;
  objc_msgSend(a2, "lastNavigatingBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 136316162;
  v12 = "-[CPNavigationManager sendInfo:toComponentUID:]";
  v13 = 2114;
  v14 = a1;
  v15 = 2114;
  v16 = v6;
  v17 = 2114;
  v18 = v9;
  v19 = 2114;
  v20 = v10;
  _os_log_debug_impl(&dword_20D6F4000, a3, OS_LOG_TYPE_DEBUG, "%s: componentUID=%{public}@ %{public}@ does not own navigation (owner=%{public}@ lastNavigatingBundleIdentifier=%{public}@)", (uint8_t *)&v11, 0x34u);

}

- (void)sendInfo:(NSObject *)a3 toComponentUID:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[CPNavigationManager sendInfo:toComponentUID:]";
  v9 = 2114;
  v10 = a1;
  v11 = 2114;
  v12 = v5;
  OUTLINED_FUNCTION_7(&dword_20D6F4000, a3, v6, "%s: componentUID=%{public}@ %{public}@ does not support acc nav", (uint8_t *)&v7);

}

@end
