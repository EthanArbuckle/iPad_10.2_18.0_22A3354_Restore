@implementation EMVIPManager

+ (NSXPCInterface)remoteInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF2556F8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_observer_gotVIPs_, 0, 0);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_observer_gotVIPs_, 1, 0);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_observer_updatedVIPs_removedVIPs_, 0, 0);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_observer_updatedVIPs_removedVIPs_, 1, 0);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_observer_updatedVIPs_removedVIPs_, 2, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FBB0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterface:forSelector:argumentIndex:ofReply:", v10, sel_registerObserver_observationIdentifier_, 0, 0);
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_registerObserver_observationIdentifier_, 1, 0);
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_cancelObservation_, 0, 0);
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_saveVIPs_, 0, 0);
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_removeVIPsWithIdentifiers_, 0, 0);
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_removeVIPsWithEmailAddresses_, 0, 0);

  return (NSXPCInterface *)v11;
}

- (EMVIPManager)initWithRemoteConnection:(id)a3
{
  id v5;
  EMVIPManager *v6;
  EMVIPManager *v7;
  uint64_t v8;
  EFPromise *vipsByIdentifierPromise;
  void *v10;
  EMRemoteConnection *connection;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EMVIPManager;
  v6 = -[EMVIPManager init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_vipsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v8 = objc_claimAutoreleasedReturnValue();
    vipsByIdentifierPromise = v7->_vipsByIdentifierPromise;
    v7->_vipsByIdentifierPromise = (EFPromise *)v8;

    -[EFPromise future](v7->_vipsByIdentifierPromise, "future");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v7);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__EMVIPManager_initWithRemoteConnection___block_invoke;
    v13[3] = &unk_1E70F1F78;
    objc_copyWeak(&v14, &location);
    -[EMRemoteConnection addResetHandler:](connection, "addResetHandler:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__EMVIPManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_42 != -1)
    dispatch_once(&log_onceToken_42, block);
  return (OS_os_log *)(id)log_log_42;
}

void __19__EMVIPManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_42;
  log_log_42 = (uint64_t)v1;

}

- (EMVIPManager)init
{
  EMVIPManager *v3;

  if (sharedClientVIPManager_onceToken != -1)
    dispatch_once(&sharedClientVIPManager_onceToken, &__block_literal_global_181);
  v3 = (EMVIPManager *)(id)sharedClientVIPManager_vipManager;

  return v3;
}

void __41__EMVIPManager_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reset");

}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_observerCancelationToken, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EMVIPManager;
  -[EMVIPManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isUsingRemoteConnection
{
  void *v2;
  BOOL v3;

  -[EMVIPManager connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_startObservingVIPChangesIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  EFCancelationToken *v10;
  EFCancelationToken *observerCancelationToken;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location[2];

  if (-[EMVIPManager isUsingRemoteConnection](self, "isUsingRemoteConnection"))
  {
    os_unfair_lock_lock(&self->_vipsLock);
    if (!self->_observerCancelationToken)
    {
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, self);
      -[EMVIPManager connection](self, "connection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke;
      v16[3] = &unk_1E70F5BA0;
      objc_copyWeak(&v17, location);
      objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = -[EMObjectID initAsEphemeralID:]([EMObjectID alloc], "initAsEphemeralID:", 1);
      objc_msgSend(v5, "registerObserver:observationIdentifier:", self, v6);
      v7 = (void *)MEMORY[0x1E0D1EE90];
      v13[0] = v4;
      v13[1] = 3221225472;
      v13[2] = __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke_90;
      v13[3] = &unk_1E70F2070;
      v8 = v5;
      v14 = v8;
      v9 = v6;
      v15 = v9;
      objc_msgSend(v7, "tokenWithCancelationBlock:", v13);
      v10 = (EFCancelationToken *)objc_claimAutoreleasedReturnValue();
      observerCancelationToken = self->_observerCancelationToken;
      self->_observerCancelationToken = v10;

      objc_destroyWeak(&v17);
      objc_destroyWeak(location);
    }
    os_unfair_lock_unlock(&self->_vipsLock);
  }
  else
  {
    +[EMVIPManager log](EMVIPManager, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_DEFAULT, "Not setting up VIP observer because a remote connection is not setup.", (uint8_t *)location, 2u);
    }

  }
}

void __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[EMVIPManager log](EMVIPManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke_cold_1(v6, v7, v5);
  }

  objc_msgSend(WeakRetained, "_reset");
}

uint64_t __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke_90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelObservation:", *(_QWORD *)(a1 + 40));
}

- (void)_reset
{
  os_unfair_lock_s *p_vipsLock;
  void *v4;
  void *v5;
  void *v6;
  EFCancelationToken *observerCancelationToken;
  void *v8;
  id v9;

  p_vipsLock = &self->_vipsLock;
  os_unfair_lock_lock(&self->_vipsLock);
  if (self->_observerCancelationToken)
  {
    -[EMVIPManager vipsByIdentifierPromise](self, "vipsByIdentifierPromise");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMVIPManager setVipsByIdentifierPromise:](self, "setVipsByIdentifierPromise:", v4);

    -[EMVIPManager vipsByIdentifierPromise](self, "vipsByIdentifierPromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "future");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    -[EAEmailAddressSet removeAllObjects](self->_cachedEmailAddresses, "removeAllObjects");
    -[EFCancelationToken removeAllCancelationBlocks](self->_observerCancelationToken, "removeAllCancelationBlocks");
    observerCancelationToken = self->_observerCancelationToken;
    self->_observerCancelationToken = 0;

    os_unfair_lock_unlock(p_vipsLock);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ef_cancelledError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "finishWithError:", v8);

    }
  }
  else
  {
    os_unfair_lock_unlock(p_vipsLock);
  }
}

- (BOOL)hasVIPs
{
  os_unfair_lock_s *v2;
  void *v3;
  BOOL v4;

  v2 = (os_unfair_lock_s *)self;
  -[EMVIPManager _vipsByIdentifier](self, "_vipsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 += 2;
  os_unfair_lock_lock(v2);
  v4 = objc_msgSend(v3, "count") != 0;
  os_unfair_lock_unlock(v2);

  return v4;
}

- (BOOL)isVIPAddress:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[EMVIPManager allVIPEmailAddresses](self, "allVIPEmailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)allVIPWaitForResult
{
  void *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_vipsLock;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;

  if (!-[EMVIPManager isUsingRemoteConnection](self, "isUsingRemoteConnection"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMVIPManager.m"), 199, CFSTR("This can only be called when using a remote connection."));

  }
  -[EMVIPManager vipsByIdentifierPromise](self, "vipsByIdentifierPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMVIPManager _startObservingVIPChangesIfNecessary](self, "_startObservingVIPChangesIfNecessary");
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  p_vipsLock = &self->_vipsLock;
  os_unfair_lock_lock(p_vipsLock);
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v6, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  os_unfair_lock_unlock(p_vipsLock);
  if (v10)
    v11 = v10;
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v12 = v11;

  return (NSSet *)v12;
}

- (NSSet)allVIPs
{
  os_unfair_lock_s *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (os_unfair_lock_s *)self;
  -[EMVIPManager _vipsByIdentifier](self, "_vipsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 += 2;
  os_unfair_lock_lock(v2);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  os_unfair_lock_unlock(v2);
  if (v6)
    v7 = v6;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v8 = v7;

  return (NSSet *)v8;
}

- (EAEmailAddressSet)allVIPEmailAddresses
{
  void *v3;
  os_unfair_lock_s *p_vipsLock;
  EAEmailAddressSet *cachedEmailAddresses;
  id v6;
  id v7;
  EAEmailAddressSet *v8;
  EAEmailAddressSet *v9;
  EAEmailAddressSet *v10;
  EAEmailAddressSet *v11;
  EAEmailAddressSet *v12;
  _QWORD v14[4];
  id v15;

  -[EMVIPManager _vipsByIdentifier](self, "_vipsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_vipsLock = &self->_vipsLock;
  os_unfair_lock_lock(&self->_vipsLock);
  cachedEmailAddresses = self->_cachedEmailAddresses;
  if (!cachedEmailAddresses)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D1E458]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__EMVIPManager_allVIPEmailAddresses__block_invoke;
    v14[3] = &unk_1E70F6780;
    v7 = v6;
    v15 = v7;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v14);
    v8 = (EAEmailAddressSet *)objc_msgSend(v7, "copy");
    v9 = self->_cachedEmailAddresses;
    self->_cachedEmailAddresses = v8;

    cachedEmailAddresses = self->_cachedEmailAddresses;
  }
  v10 = cachedEmailAddresses;
  os_unfair_lock_unlock(p_vipsLock);
  if (v10)
    v11 = v10;
  else
    v11 = (EAEmailAddressSet *)objc_alloc_init(MEMORY[0x1E0D1E458]);
  v12 = v11;

  return v12;
}

void __36__EMVIPManager_allVIPEmailAddresses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "emailAddresses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:");

}

- (id)vipWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMVIPManager _vipsByIdentifier](self, "_vipsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self = (EMVIPManager *)((char *)self + 8);
  os_unfair_lock_lock((os_unfair_lock_t)self);
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)self);

  return v6;
}

- (void)getAllVIPsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (-[EMVIPManager isUsingRemoteConnection](self, "isUsingRemoteConnection"))
  {
    -[EMVIPManager _vipsByIdentifierFuture](self, "_vipsByIdentifierFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__EMVIPManager_getAllVIPsWithCompletion___block_invoke;
    v10[3] = &unk_1E70F67A8;
    v7 = v4;
    v11 = v7;
    objc_msgSend(v5, "addSuccessBlock:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __41__EMVIPManager_getAllVIPsWithCompletion___block_invoke_2;
    v8[3] = &unk_1E70F2550;
    v9 = v7;
    objc_msgSend(v5, "addFailureBlock:", v8);

  }
  else
  {
    -[EMVIPManager allVIPs](self, "allVIPs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v5, 0);
  }

}

void __41__EMVIPManager_getAllVIPsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v7, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v6, 0);

}

uint64_t __41__EMVIPManager_getAllVIPsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveVIPs:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[EMVIPManager isUsingRemoteConnection](self, "isUsingRemoteConnection"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMVIPManager.m"), 275, CFSTR("Not supported when not using a remote connection."));

  }
  -[EMVIPManager _startObservingVIPChangesIfNecessary](self, "_startObservingVIPChangesIfNecessary");
  -[EMVIPManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reattemptingRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveVIPs:", v8);

}

- (void)removeVIPsWithIdentifiers:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[EMVIPManager isUsingRemoteConnection](self, "isUsingRemoteConnection"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMVIPManager.m"), 281, CFSTR("Not supported when not using a remote connection."));

  }
  -[EMVIPManager _startObservingVIPChangesIfNecessary](self, "_startObservingVIPChangesIfNecessary");
  -[EMVIPManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reattemptingRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeVIPsWithIdentifiers:", v8);

}

- (void)removeVIPsWithEmailAddresses:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[EMVIPManager isUsingRemoteConnection](self, "isUsingRemoteConnection"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMVIPManager.m"), 287, CFSTR("Not supported when not using a remote connection."));

  }
  -[EMVIPManager _startObservingVIPChangesIfNecessary](self, "_startObservingVIPChangesIfNecessary");
  -[EMVIPManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reattemptingRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeVIPsWithEmailAddresses:", v8);

}

- (id)_vipsByIdentifierFuture
{
  void *v4;
  void *v5;
  void *v7;

  if (!-[EMVIPManager isUsingRemoteConnection](self, "isUsingRemoteConnection"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMVIPManager.m"), 295, CFSTR("This can only be called when using a remote connection."));

  }
  -[EMVIPManager vipsByIdentifierPromise](self, "vipsByIdentifierPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMVIPManager _startObservingVIPChangesIfNecessary](self, "_startObservingVIPChangesIfNecessary");
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_vipsByIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *vipsByIdentifier;

  if (-[EMVIPManager isUsingRemoteConnection](self, "isUsingRemoteConnection"))
  {
    -[EMVIPManager _vipsByIdentifierFuture](self, "_vipsByIdentifierFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resultIfAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0C9AA70];
    if (v4)
      v5 = v4;
    v6 = v5;

  }
  else
  {
    vipsByIdentifier = self->_vipsByIdentifier;
    if (!vipsByIdentifier)
    {
      -[EMVIPManager _loadVIPs](self, "_loadVIPs");
      vipsByIdentifier = self->_vipsByIdentifier;
    }
    v6 = vipsByIdentifier;
  }
  return v6;
}

- (void)_loadVIPs
{
  NSMutableDictionary *v3;
  NSMutableDictionary *vipsByIdentifier;
  id v5;
  _QWORD v6[5];

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  vipsByIdentifier = self->_vipsByIdentifier;
  self->_vipsByIdentifier = v3;

  -[EMVIPManager _vipsDictionaryFromPlist](self, "_vipsDictionaryFromPlist");
  v6[1] = 3221225472;
  v6[2] = __25__EMVIPManager__loadVIPs__block_invoke;
  v6[3] = &unk_1E70F6358;
  v6[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __25__EMVIPManager__loadVIPs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  EMVIP *v8;
  void *v9;
  EMVIP *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EmailAddresses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [EMVIP alloc];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E458]), "initWithArray:", v7);
  v10 = -[EMVIP initWithIdentifier:name:emailAddresses:](v8, "initWithIdentifier:name:emailAddresses:", v11, v6, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v10, v11);
}

- (id)_vipsDictionaryFromPlist
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend((id)objc_opt_class(), "_plistURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfURL:", v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_plistURL
{
  if (_plistURL_onceToken != -1)
    dispatch_once(&_plistURL_onceToken, &__block_literal_global_58);
  return (id)_plistURL_url;
}

void __25__EMVIPManager__plistURL__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[EMPersistenceLayoutManager mailDataDirectory](EMPersistenceLayoutManager, "mailDataDirectory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("VIPs.plist"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_plistURL_url;
  _plistURL_url = v0;

}

- (void)observer:(id)a3 gotVIPs:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[EMVIPManager log](EMVIPManager, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "got VIPs with count %lu", buf, 0xCu);
  }

  +[EMVIPManager log](EMVIPManager, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[EMVIPManager observer:gotVIPs:].cold.1((uint64_t)v5, v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "identifier", (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }

  -[EMVIPManager vipsByIdentifierPromise](self, "vipsByIdentifierPromise");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "finishWithResult:", v8);

  if (objc_msgSend(v8, "count"))
  {
    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("VIPsUpdated");
    v26 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("VIPsDidChange"), self, v20);

  }
}

- (void)observer:(id)a3 updatedVIPs:(id)a4 removedVIPs:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  EAEmailAddressSet *cachedEmailAddresses;
  const __CFString **v29;
  id *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  id v45;
  const __CFString *v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[EMVIPManager log](EMVIPManager, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v53 = objc_msgSend(v8, "count");
    v54 = 2048;
    v55 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "updated VIPs with count %lu and removed VIPs with count %lu", buf, 0x16u);
  }

  +[EMVIPManager log](EMVIPManager, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v53 = (uint64_t)v8;
    v54 = 2112;
    v55 = (uint64_t)v9;
    _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "updated VIPs: %@ and removed VIPs: %@", buf, 0x16u);
  }

  v12 = objc_msgSend(v8, "count");
  v35 = objc_msgSend(v9, "count");
  -[EMVIPManager vipsByIdentifierPromise](self, "vipsByIdentifierPromise");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "future");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isFinished"))
    goto LABEL_30;
  v34 = v12;

  if (__PAIR128__(v35, v12) != 0)
  {
    -[EMVIPManager vipsByIdentifierPromise](self, "vipsByIdentifierPromise");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "future");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resultIfAvailable:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMVIPManager.m"), 375, CFSTR("unexpected call to observer:updatedVIPs:removedVIPs: called before observer:gotVIPs:"));

    }
    os_unfair_lock_lock(&self->_vipsLock);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v22);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v18);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = v9;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v27);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v24);
    }

    cachedEmailAddresses = self->_cachedEmailAddresses;
    self->_cachedEmailAddresses = 0;

    os_unfair_lock_unlock(&self->_vipsLock);
    if (v34 == 0 || v35 == 0)
    {
      if (v34)
      {
        v46 = CFSTR("VIPsUpdated");
        v47 = v17;
        v29 = &v46;
        v30 = &v47;
      }
      else
      {
        v44 = CFSTR("VIPsRemoved");
        v45 = v23;
        v29 = &v44;
        v30 = &v45;
      }
      v31 = 1;
    }
    else
    {
      v48[0] = CFSTR("VIPsUpdated");
      v48[1] = CFSTR("VIPsRemoved");
      v49[0] = v17;
      v49[1] = v23;
      v29 = (const __CFString **)v48;
      v30 = (id *)v49;
      v31 = 2;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postNotificationName:object:userInfo:", CFSTR("VIPsDidChange"), self, v14);

LABEL_30:
  }

}

- (void)didStartBlockingMainThreadForFuture:(id)a3
{
  EMRemoteConnectionRecoveryAssertion *v4;
  EMRemoteConnectionRecoveryAssertion *connectionRecoveryAssertion;
  id v6;

  -[EMVIPManager connection](self, "connection", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestRecoveryAssertion");
  v4 = (EMRemoteConnectionRecoveryAssertion *)objc_claimAutoreleasedReturnValue();
  connectionRecoveryAssertion = self->_connectionRecoveryAssertion;
  self->_connectionRecoveryAssertion = v4;

}

- (void)didFinishBlockingMainThreadForFuture:(id)a3
{
  EMRemoteConnectionRecoveryAssertion *connectionRecoveryAssertion;

  -[EMRemoteConnectionRecoveryAssertion invalidate](self->_connectionRecoveryAssertion, "invalidate", a3);
  connectionRecoveryAssertion = self->_connectionRecoveryAssertion;
  self->_connectionRecoveryAssertion = 0;

}

- (EMRemoteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (EFPromise)vipsByIdentifierPromise
{
  return (EFPromise *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVipsByIdentifierPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipsByIdentifierPromise, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_vipsByIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionRecoveryAssertion, 0);
  objc_storeStrong((id *)&self->_observerCancelationToken, 0);
  objc_storeStrong((id *)&self->_cachedEmailAddresses, 0);
}

void __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "EMVIPManagerInterface failed with error: %{public}@", buf, 0xCu);

}

- (void)observer:(uint64_t)a1 gotVIPs:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_DEBUG, "got VIPs: %@", (uint8_t *)&v2, 0xCu);
}

@end
