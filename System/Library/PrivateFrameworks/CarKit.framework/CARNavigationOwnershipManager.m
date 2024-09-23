@implementation CARNavigationOwnershipManager

- (CARNavigationOwnershipManager)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CARNavigationOwnershipManager *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CARNavigationOwnershipManager;
  v8 = -[CARNavigationOwnershipManager init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v8->_ownershipRequested = 0;
    -[CARNavigationOwnershipManager _setupConnection](v8, "_setupConnection");
  }

  return v8;
}

- (void)invalidate
{
  id v2;

  -[CARNavigationOwnershipManager connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)requestNavigationOwnership
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD block[5];

  -[CARNavigationOwnershipManager connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARNavigationOwnershipManager identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addNavigationOwnerWithIdentifier:", v5);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CARNavigationOwnershipManager_requestNavigationOwnership__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__CARNavigationOwnershipManager_requestNavigationOwnership__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOwnershipRequested:", 1);
}

- (void)releaseNavigationOwnership
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD block[5];

  -[CARNavigationOwnershipManager connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARNavigationOwnershipManager identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNavigationOwnerWithIdentifier:", v5);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CARNavigationOwnershipManager_releaseNavigationOwnership__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__CARNavigationOwnershipManager_releaseNavigationOwnership__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOwnershipRequested:", 0);
}

- (unint64_t)owner
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  unint64_t v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[CARNavigationOwnershipManager connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__CARNavigationOwnershipManager_owner__block_invoke;
  v10[3] = &unk_1E5429CD8;
  v12 = &v13;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "fetchNavigationOwnerWithReply:", v10);

  v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

intptr_t __38__CARNavigationOwnershipManager_owner__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)lastNavigatingBundleIdentifier
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  -[CARNavigationOwnershipManager connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__CARNavigationOwnershipManager_lastNavigatingBundleIdentifier__block_invoke;
  v10[3] = &unk_1E5429D00;
  v12 = &v13;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "fetchNavigationIdentifierWithReply:", v10);

  v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSString *)v8;
}

void __63__CARNavigationOwnershipManager_lastNavigatingBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.navowners.service"), 4096);
  CRCarPlayNavigationOwnerClientInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v4);

  objc_msgSend(v3, "setExportedObject:", self);
  CRCarPlayNavigationOwnersServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v5);

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__CARNavigationOwnershipManager__setupConnection__block_invoke;
  v8[3] = &unk_1E5428130;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  CarGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit navigation ownership service.", v7, 2u);
  }

  objc_msgSend(v3, "resume");
  -[CARNavigationOwnershipManager setConnection:](self, "setConnection:", v3);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __49__CARNavigationOwnershipManager__setupConnection__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setupConnection");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_handleConnectionReset");

}

- (void)_handleConnectionReset
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CARNavigationOwnershipManager__handleConnectionReset__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__CARNavigationOwnershipManager__handleConnectionReset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "ownershipRequested"))
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addNavigationOwnerWithIdentifier:", v3);

  }
}

- (void)navigationOwnershipChangedTo:(unint64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  CARNavigationOwnershipManager *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("None");
    if (a3 == 1)
      v6 = CFSTR("iOS");
    if (a3 == 2)
      v6 = CFSTR("Car");
    v7 = v6;
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "%@: Navigation ownership changed to %@", buf, 0x16u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__CARNavigationOwnershipManager_navigationOwnershipChangedTo___block_invoke;
  v8[3] = &unk_1E54293C8;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);
}

void __62__CARNavigationOwnershipManager_navigationOwnershipChangedTo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationOwnershipChangedToOwner:", *(_QWORD *)(a1 + 40));

}

- (BOOL)supportsAccNav
{
  return self->_supportsAccNav;
}

- (void)setSupportsAccNav:(BOOL)a3
{
  self->_supportsAccNav = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CARNavigationOwnershipManagerDelegate)delegate
{
  return (CARNavigationOwnershipManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
