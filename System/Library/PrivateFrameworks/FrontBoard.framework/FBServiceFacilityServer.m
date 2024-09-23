@implementation FBServiceFacilityServer

uint64_t __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_facilityQueue_facility:handleMessage:client:", *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
}

void __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v12[3] = &unk_1E4A12558;
  v5 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = *(id *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v6, "setMessageHandler:", v12);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v9[3] = &unk_1E4A12580;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v6, "setErrorHandler:", v9);
  objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServiceQuality:", v7);

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTargetDispatchingQueue:", v8);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  uint64_t v14;
  void *v15;
  FBServiceFacilityServerClientHandle *v16;
  void *v17;
  FBServiceFacilityServerClientHandle *v18;
  uint64_t v19;
  id v20;
  FBServiceFacilityServerClientHandle *v21;
  NSMutableSet *lock_pendingConnects;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  FBServiceFacilityServerClientHandle *v31;

  v7 = a4;
  v8 = a5;
  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "registerProcessForHandle:", v10);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v8, "decodeStringForKey:", *MEMORY[0x1E0D22E68]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13
    && (-[NSMutableDictionary objectForKey:](self->_lock_facilitiesByIdentifier, "objectForKey:", v13),
        (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = (void *)v14;
    v16 = [FBServiceFacilityServerClientHandle alloc];
    objc_msgSend(v15, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[FBServiceFacilityServerClientHandle initWithFacilityID:connection:](v16, "initWithFacilityID:connection:", v17, v7);

    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke;
    v29[3] = &unk_1E4A125A8;
    v29[4] = self;
    v20 = v15;
    v30 = v20;
    v21 = v18;
    v31 = v21;
    objc_msgSend(v7, "_configureConnection:", v29);
    if (-[FBServiceFacilityServer _lock_areFacilityPrerequisitesSatisfied:](self, "_lock_areFacilityPrerequisitesSatisfied:", v20))
    {
      objc_msgSend(v7, "activate");
    }
    else
    {
      lock_pendingConnects = self->_lock_pendingConnects;
      v24 = v19;
      v25 = 3221225472;
      v26 = __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_4;
      v27 = &unk_1E4A12348;
      v28 = v7;
      +[_FBServiceFacilityServerPendingConnection pendingConnectionToFacility:completion:](_FBServiceFacilityServerPendingConnection, "pendingConnectionToFacility:completion:", v20, &v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](lock_pendingConnects, "addObject:", v23, v24, v25, v26, v27);

    }
  }
  else
  {
    objc_msgSend(v7, "invalidate");
  }
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)_lock_areFacilityPrerequisitesSatisfied:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  char v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  objc_msgSend(v5, "_prerequisiteMilestones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "count"))
    v7 = objc_msgSend(v6, "isSubsetOfSet:", self->_lock_completedMilestones);
  else
    v7 = 1;

  return v7;
}

- (void)_facilityQueue_facility:(id)a3 handleMessage:(id)a4 client:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x1E0D22E70];
  v10 = a3;
  v11 = objc_msgSend(v7, "decodeInt64ForKey:", v9);
  if (v11 == 0x636F6E6E656374)
  {
    FBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "prettyProcessDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "facilityID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_1A359A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client %{public}@ connected to service %{public}@", (uint8_t *)&v23, 0x20u);

    }
    objc_msgSend(v7, "createReply");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithBSXPCMessage:ownReply:", v7, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v10, "queue_clientDidConnect:withMessage:", v8, v18);

    objc_msgSend(v17, "encodeBool:forKey:", v19, *MEMORY[0x1E0D22E78]);
    if ((_DWORD)v19)
      v20 = 0;
    else
      v20 = CFSTR("Connection rejected by service facility");
    objc_msgSend(v17, "encodeObject:forKey:", v20, *MEMORY[0x1E0D22E60]);
    objc_msgSend(v17, "send");
    if ((v19 & 1) == 0)
      objc_msgSend(v8, "invalidate");

  }
  else
  {
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithBSXPCMessage:ownReply:", v7, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queue_handleMessage:withType:fromClient:", v22, v21, v8);

  }
}

+ (id)sharedInstanceDomain
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (sharedInstanceDomain_onceToken != -1)
    dispatch_once(&sharedInstanceDomain_onceToken, v3);
  return (id)sharedInstanceDomain___domain;
}

void __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "queue_clientDidDisconnect:", v3);
  objc_msgSend(v4, "invalidate");

}

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__FBServiceFacilityServer_sharedInstance__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, v3);
  return (id)sharedInstance___instance_0;
}

void __41__FBServiceFacilityServer_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[FBServiceFacilityServer sharedInstanceDomain](FBServiceFacilityServer, "sharedInstanceDomain");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = (id)v2;
    v3 = -[FBServiceFacilityServer _initWithDomain:]([FBServiceFacilityServer alloc], "_initWithDomain:", v2);
    v4 = (void *)sharedInstance___instance_0;
    sharedInstance___instance_0 = (uint64_t)v3;

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D23290], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23048], "bootstrapConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("must have a valid domain for %@ : bootstrapConfiguration = %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __41__FBServiceFacilityServer_sharedInstance__block_invoke_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0D23048], "bootstrapConfiguration");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23290], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "domainsContainingServiceIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") != 1)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D23290], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("must have one and only one domain specify %@ : domains=%@"), v11, v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke_cold_2(a1);
LABEL_12:
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35C9CCCLL);
    }
    objc_msgSend(v3, "anyObject");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sharedInstanceDomain___domain;
    sharedInstanceDomain___domain = v4;

  }
  objc_msgSend(MEMORY[0x1E0D22FD8], "environmentAliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolveMachService:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "domainForMachName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v9 != (void *)sharedInstanceDomain___domain)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D23290], "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("if we own the defaultShellMachName then %@ must be registered there"), v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke_cold_1(a1);
    goto LABEL_12;
  }

}

- (FBServiceFacilityServer)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBServiceFacilityServer *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBServiceFacilityServer *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBServiceFacilityServer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBServiceFacilityServer.m");
    v17 = 1024;
    v18 = 116;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBServiceFacilityServer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithDomain:(id)a3
{
  id v5;
  void *v6;
  FBServiceFacilityServer *v7;
  FBServiceFacilityServer *v8;
  NSMutableSet *v9;
  NSMutableSet *lock_pendingConnects;
  NSMutableSet *v11;
  NSMutableSet *lock_completedMilestones;
  NSMutableDictionary *v13;
  NSMutableDictionary *lock_facilitiesByIdentifier;
  NSMutableDictionary *v15;
  NSMutableDictionary *lock_suspendedFacilitiesByIdentifier;
  void *v17;
  FBServiceFacilityServer *v18;
  uint64_t v19;
  BSServiceConnectionListener *serviceListener;
  id result;
  void *v22;
  _QWORD v23[4];
  FBServiceFacilityServer *v24;
  objc_super v25;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v25.receiver = self;
    v25.super_class = (Class)FBServiceFacilityServer;
    v7 = -[FBServiceFacilityServer init](&v25, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v7->_domain, a3);
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      lock_pendingConnects = v8->_lock_pendingConnects;
      v8->_lock_pendingConnects = v9;

      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      lock_completedMilestones = v8->_lock_completedMilestones;
      v8->_lock_completedMilestones = v11;

      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      lock_facilitiesByIdentifier = v8->_lock_facilitiesByIdentifier;
      v8->_lock_facilitiesByIdentifier = v13;

      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      lock_suspendedFacilitiesByIdentifier = v8->_lock_suspendedFacilitiesByIdentifier;
      v8->_lock_suspendedFacilitiesByIdentifier = v15;

      v17 = (void *)MEMORY[0x1E0D23030];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __43__FBServiceFacilityServer__initWithDomain___block_invoke;
      v23[3] = &unk_1E4A12530;
      v18 = v8;
      v24 = v18;
      objc_msgSend(v17, "listenerWithConfigurator:", v23);
      v19 = objc_claimAutoreleasedReturnValue();
      serviceListener = v18->_serviceListener;
      v18->_serviceListener = (BSServiceConnectionListener *)v19;

      FBSSetServiceFacilityManager();
    }

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("domain"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBServiceFacilityServer _initWithDomain:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __43__FBServiceFacilityServer__initWithDomain___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDomain:", v4);

  objc_msgSend(MEMORY[0x1E0D23290], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setService:", v5);

  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this is a singleton, yo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FBServiceFacilityServer dealloc]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138544130;
    v5 = v3;
    v6 = 2114;
    v7 = CFSTR("FBServiceFacilityServer.m");
    v8 = 1024;
    v9 = 142;
    v10 = 2114;
    v11 = v2;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v4, 0x26u);

  }
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activate");
}

- (void)run
{
  -[BSServiceConnectionListener activate](self->_serviceListener, "activate");
}

- (void)addFacility:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier != ((void *)0)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBServiceFacilityServer addFacility:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CA340);
  }
  v6 = (void *)v5;
  objc_msgSend(v4, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[facility queue] != ((void *)0)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBServiceFacilityServer addFacility:].cold.2();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CA3A4);
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_facilitiesByIdentifier, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("duplicate facility with identifier %@"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBServiceFacilityServer addFacility:].cold.3();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CA400);
  }
  FBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "succinctDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1A359A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding facility: %{public}@", buf, 0x16u);

  }
  -[NSMutableDictionary setObject:forKey:](self->_lock_facilitiesByIdentifier, "setObject:forKey:", v4, v6);
  -[NSMutableDictionary setObject:forKey:](self->_lock_suspendedFacilitiesByIdentifier, "setObject:forKey:", v4, v6);
  -[FBServiceFacilityServer _lock_evaluateSuspendedFacility:](self, "_lock_evaluateSuspendedFacility:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeFacility:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    FBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1A359A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing facility: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary removeObjectForKey:](self->_lock_facilitiesByIdentifier, "removeObjectForKey:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_lock_suspendedFacilitiesByIdentifier, "removeObjectForKey:", v5);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)noteMilestoneReached:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  FBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_1A359A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Milestone reached: %{public}@", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet addObject:](self->_lock_completedMilestones, "addObject:", v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_lock_suspendedFacilitiesByIdentifier, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[FBServiceFacilityServer _lock_evaluateSuspendedFacility:](self, "_lock_evaluateSuspendedFacility:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_evaluateSuspendedFacility:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void (**v16)(void);
  NSMutableDictionary *lock_suspendedFacilitiesByIdentifier;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[FBServiceFacilityServer _lock_areFacilityPrerequisitesSatisfied:](self, "_lock_areFacilityPrerequisitesSatisfied:", v4))
  {
    FBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v7;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_1A359A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting facility: %{public}@", buf, 0x16u);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableSet allObjects](self->_lock_pendingConnects, "allObjects", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "facility");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if (v15 == v4)
          {
            objc_msgSend(v14, "completion");
            v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v16[2]();

            -[NSMutableSet removeObject:](self->_lock_pendingConnects, "removeObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    lock_suspendedFacilitiesByIdentifier = self->_lock_suspendedFacilitiesByIdentifier;
    objc_msgSend(v4, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](lock_suspendedFacilitiesByIdentifier, "removeObjectForKey:", v18);

  }
}

- (BSServiceDomainSpecification)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_pendingConnects, 0);
  objc_storeStrong((id *)&self->_lock_suspendedFacilitiesByIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_completedMilestones, 0);
  objc_storeStrong((id *)&self->_lock_facilitiesByIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

void __41__FBServiceFacilityServer_sharedInstance__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(*(SEL *)(a1 + 32));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(*(SEL *)(a1 + 32));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(*(SEL *)(a1 + 32));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_initWithDomain:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)addFacility:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)addFacility:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)addFacility:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
