@implementation BSServiceManager

void __52__BSServiceManager__initWithBootstrapConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 32))
    v3 = 0;
  else
    v3 = *(_QWORD *)(v2 + 40) == 0;
  *(_BYTE *)(v2 + 32) = 1;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    if (v3)
    {
      BSServiceBootstrapLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A799000, v4, OS_LOG_TYPE_DEFAULT, "automatic bootstrapping is complete", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_34);
    }
    else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    {
      BSServiceBootstrapLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_19A799000, v5, OS_LOG_TYPE_DEFAULT, "automatic bootstrap completion has been extended", v6, 2u);
      }

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

+ (BSServiceManager)sharedInstanceCreatingIfNecessary:(uint64_t)a1
{
  BSServiceManager *v3;
  BOOL v4;
  BSServiceManager *v5;
  void *v6;
  BSServiceManager *v7;
  BSServicesConfiguration **p_bootstrapConfiguration;
  BSServicesConfiguration *v9;
  uint64_t v10;
  NSMutableDictionary *lock_identifierToDomain;
  BSServicesConfiguration *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  id *v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *lock_endpointToOutgoingRootConnections;
  uint64_t v22;
  NSMutableDictionary *lock_inheritanceToEndpoint;
  uint64_t v24;
  NSMutableDictionary *lock_endpointToInheritances;
  uint64_t v26;
  NSMutableDictionary *lock_serviceIdentifierToEndpoints;
  uint64_t v28;
  NSMutableDictionary *lock_serviceIdentifierToMonitors;
  uint64_t v30;
  NSMutableDictionary *callOutLock_serviceIdentifierToEndpointsToEnvironments;
  BSServiceManager *v32;
  void (*v33)(BSServiceManager *);
  uint64_t v34;
  uint64_t v35;
  RBSService *RBSService;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  id v41;
  void *v42;
  void *v44;
  void *v45;
  BSServicesConfiguration *v46;
  id v47;
  void *v48;
  _QWORD block[4];
  BSServiceManager *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _QWORD v60[16];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_7);
  v3 = (BSServiceManager *)(id)qword_1ECD9C620;
  if (v3)
    v4 = 1;
  else
    v4 = a2 == 0;
  if (!v4)
  {
    v5 = [BSServiceManager alloc];
    +[BSServicesConfiguration bootstrapConfiguration](BSServicesConfiguration, "bootstrapConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v6;
    if (v5)
    {
      v59.receiver = v5;
      v59.super_class = (Class)BSServiceManager;
      v7 = (BSServiceManager *)objc_msgSendSuper2(&v59, sel_init);
      v5 = v7;
      if (v7)
      {
        p_bootstrapConfiguration = &v7->_bootstrapConfiguration;
        objc_storeStrong((id *)&v7->_bootstrapConfiguration, v6);
        v5->_lock._os_unfair_lock_opaque = 0;
        v9 = *p_bootstrapConfiguration;
        if (*p_bootstrapConfiguration)
          v9 = (BSServicesConfiguration *)v9->_orderedDomains;
        v46 = v9;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[BSServicesConfiguration count](v46, "count"));
        v10 = objc_claimAutoreleasedReturnValue();
        lock_identifierToDomain = v5->_lock_identifierToDomain;
        v5->_lock_identifierToDomain = (NSMutableDictionary *)v10;

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v12 = v46;
        v13 = -[BSServicesConfiguration countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v56 != v14)
                objc_enumerationMutation(v12);
              v16 = *(_QWORD **)(*((_QWORD *)&v55 + 1) + 8 * i);
              v17 = -[BSServiceDomain _initWithSpecification:]((BSService *)[BSServiceDomain alloc], v16);
              v18 = v5->_lock_identifierToDomain;
              objc_msgSend(v16, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, v19);

              if (v16 && v16[7] == 3)
                objc_msgSend(v48, "addObject:", v17);

            }
            v13 = -[BSServicesConfiguration countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
          }
          while (v13);
        }

        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        lock_endpointToOutgoingRootConnections = v5->_lock_endpointToOutgoingRootConnections;
        v5->_lock_endpointToOutgoingRootConnections = v20;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v22 = objc_claimAutoreleasedReturnValue();
        lock_inheritanceToEndpoint = v5->_lock_inheritanceToEndpoint;
        v5->_lock_inheritanceToEndpoint = (NSMutableDictionary *)v22;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v24 = objc_claimAutoreleasedReturnValue();
        lock_endpointToInheritances = v5->_lock_endpointToInheritances;
        v5->_lock_endpointToInheritances = (NSMutableDictionary *)v24;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v26 = objc_claimAutoreleasedReturnValue();
        lock_serviceIdentifierToEndpoints = v5->_lock_serviceIdentifierToEndpoints;
        v5->_lock_serviceIdentifierToEndpoints = (NSMutableDictionary *)v26;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v28 = objc_claimAutoreleasedReturnValue();
        lock_serviceIdentifierToMonitors = v5->_lock_serviceIdentifierToMonitors;
        v5->_lock_serviceIdentifierToMonitors = (NSMutableDictionary *)v28;

        v5->_callOutLock._os_unfair_lock_opaque = 0;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v30 = objc_claimAutoreleasedReturnValue();
        callOutLock_serviceIdentifierToEndpointsToEnvironments = v5->_callOutLock_serviceIdentifierToEndpointsToEnvironments;
        v5->_callOutLock_serviceIdentifierToEndpointsToEnvironments = (NSMutableDictionary *)v30;

        v32 = v5;
        *(_QWORD *)&v51 = 0;
        *((_QWORD *)&v51 + 1) = &v51;
        *(_QWORD *)&v52 = 0x2020000000;
        v33 = (void (*)(BSServiceManager *))off_1ECD9C628;
        *((_QWORD *)&v52 + 1) = off_1ECD9C628;
        v34 = MEMORY[0x1E0C809B0];
        if (!off_1ECD9C628)
        {
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __getRBSServiceInitializeSymbolLoc_block_invoke;
          v60[3] = &unk_1E390CE38;
          v60[4] = &v51;
          __getRBSServiceInitializeSymbolLoc_block_invoke(v60);
          v33 = *(void (**)(BSServiceManager *))(*((_QWORD *)&v51 + 1) + 24);
        }
        _Block_object_dispose(&v51, 8);
        if (!v33)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "RBSService *softlinkRBSServiceInitialize(id<RBSServiceDelegate>  _Nullable __strong)");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("BSServiceManager.m"), 28, CFSTR("%s"), dlerror());

          __break(1u);
        }
        v33(v32);
        v35 = objc_claimAutoreleasedReturnValue();

        RBSService = v32->_RBSService;
        v32->_RBSService = (RBSService *)v35;

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v37 = v48;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v52 != v39)
                objc_enumerationMutation(v37);
              v41 = -[BSServiceDomain _activate](*(os_unfair_lock_s **)(*((_QWORD *)&v51 + 1) + 8 * j));
            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          }
          while (v38);
        }

        block[0] = v34;
        block[1] = 3221225472;
        block[2] = __52__BSServiceManager__initWithBootstrapConfiguration___block_invoke;
        block[3] = &unk_1E390D210;
        v5 = v32;
        v50 = v5;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }

    v42 = (void *)qword_1ECD9C620;
    qword_1ECD9C620 = (uint64_t)v5;

    v3 = v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_7);
  return v3;
}

- (uint64_t)newConnectionWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(uint64_t)a5 targetPID:(void *)a6 description:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  xpc_object_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  xpc_object_t object;
  id v33;
  uint8_t v34[4];
  NSObject *v35;
  __int128 buf;
  void (*v37)(_QWORD *, void *);
  void *v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a6;
  v14 = 0;
  if (a1 && v11)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v15 = v11;
    v16 = v12;
    v17 = v13;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    object = v15;
    v33 = v16;
    v18 = v17;
    objc_opt_self();
    v19 = objc_opt_new();
    v20 = xpc_copy(object);
    v21 = *(void **)(v19 + 8);
    *(_QWORD *)(v19 + 8) = v20;

    v22 = objc_msgSend(v33, "copy");
    v23 = *(void **)(v19 + 16);
    *(_QWORD *)(v19 + 16) = v22;

    *(_DWORD *)(v19 + 32) = a5;
    v24 = objc_msgSend(v18, "copy");
    v25 = *(void **)(v19 + 24);
    *(_QWORD *)(v19 + 24) = v24;

    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      BSServiceLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_19A799000, v27, OS_LOG_TYPE_INFO, "found existing rootConnection by endpoint (%@)", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      +[BSXPCServiceConnection connectionWithEndpoint:oneshot:nonLaunching:targetPID:description:]((uint64_t)BSXPCServiceConnection, object, v33, a4, a5, v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v37 = __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke;
        v38 = &unk_1E390DA20;
        v28 = v18;
        v39 = v28;
        v40 = a1;
        v31 = (id)v19;
        v41 = v31;
        -[BSXPCServiceConnection configure:]((uint64_t)v26, (uint64_t)&buf);
        BSServiceLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v34 = 138412290;
          v35 = v28;
          _os_log_impl(&dword_19A799000, v29, OS_LOG_TYPE_INFO, "created rootConnection with endpoint=%@", v34, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v26, v31);
        -[BSXPCServiceConnection activateNowOrWhenReady:]((uint64_t)v26, 0);

        v27 = v39;
      }
      else
      {
        BSServiceLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_19A799000, v27, OS_LOG_TYPE_INFO, "failed to create rootConnection for endpoint=%@", (uint8_t *)&buf, 0xCu);
        }
        v26 = 0;
      }
    }

    if (v26)
    {
      +[BSXPCServiceConnection connectionWithConnection:]((uint64_t)BSXPCServiceConnection, v26);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

  }
  return v14;
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSXPCRootOut:%@"), a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v3[18];
    v3[18] = v6;

  }
  +[BSServiceQuality userInteractive](BSServiceQuality, "userInteractive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)v3[21];
    v3[21] = v10;

    *((_BYTE *)v3 + 128) = 1;
    v12 = objc_msgSend(&__block_literal_global_130, "copy");
    v9 = (void *)v3[12];
    v3[12] = v12;
  }

  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_131;
  v25[3] = &unk_1E390DA48;
  v14 = (void *)a1[6];
  v25[4] = a1[5];
  v26 = v14;
  if (v3)
  {
    v15 = objc_msgSend(v25, "copy");
    v16 = (void *)v3[9];
    v3[9] = v15;

    v17 = objc_msgSend(&__block_literal_global_134, "copy");
    v18 = (void *)v3[10];
    v3[10] = v17;

  }
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_4;
  v23[3] = &unk_1E390D970;
  v19 = (void *)a1[6];
  v23[4] = a1[5];
  v20 = v19;
  v24 = v20;
  if (v3)
  {
    v21 = objc_msgSend(v23, "copy");
    v22 = (void *)v3[11];
    v3[11] = v21;

    v20 = v24;
  }

}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  os_unfair_lock_s *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  -[BSXPCServiceConnection peer](v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 32);
  else
    v5 = 0;
  v6 = v5;

  BSServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(v6, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = 138543874;
    v11 = v9;
    v12 = 1026;
    v13 = objc_msgSend(v6, "pid");
    v14 = 2114;
    v15 = v2;
    _os_log_impl(&dword_19A799000, v7, OS_LOG_TYPE_DEFAULT, "Activated root connection to %{public}@:%{public}d: %{public}@", (uint8_t *)&v10, 0x1Cu);
    if (!v8)

  }
}

- (id)registerMonitor:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("monitorToRegister"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_registerMonitor_);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v19;
        v31 = 2114;
        v32 = v21;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSServiceManager.m");
        v37 = 1024;
        v38 = 380;
        v39 = 2114;
        v40 = v18;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B20BCLL);
    }
    objc_msgSend(v3, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("asked to register a monitor with a nil service : monitor=%@"), v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_registerMonitor_);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v23;
        v31 = 2114;
        v32 = v25;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSServiceManager.m");
        v37 = 1024;
        v38 = 383;
        v39 = 2114;
        v40 = v22;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B21B4);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "containsObject:", v4))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already tracking monitor for service %@ : %@"), v5, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_registerMonitor_);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v30 = v9;
          v31 = 2114;
          v32 = v11;
          v33 = 2048;
          v34 = a1;
          v35 = 2114;
          v36 = CFSTR("BSServiceManager.m");
          v37 = 1024;
          v38 = 389;
          v39 = 2114;
          v40 = v8;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7B1E64);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:");
    }
    objc_msgSend(v7, "addObject:", v4);
    objc_initWeak((id *)buf, v4);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 96), "objectForKey:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = v12;
    else
      v14 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v4, "serialCallOut_didUpdateEndpointEnvironments:", v14);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v15 = objc_alloc(MEMORY[0x1E0D01868]);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __36__BSServiceManager_registerMonitor___block_invoke;
    v26[3] = &unk_1E390D8E0;
    v26[4] = a1;
    objc_copyWeak(&v28, (id *)buf);
    v16 = v5;
    v27 = v16;
    a1 = objc_msgSend(v15, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.boardservices.manager.monitor"), v16, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

  }
  return (id)a1;
}

- (void)service:(id)a3 didReceiveInheritances:(id)a4
{
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = a4;
  BSServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v21;
    _os_log_debug_impl(&dword_19A799000, v4, OS_LOG_TYPE_DEBUG, "BSServiceMonitor received inheritances %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v21;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        BSServiceEndpointGrantNamespace();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endowmentNamespace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {
          objc_msgSend(v10, "endowment");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[BSServiceConnectionEndpoint _endpointFromEndowmentRepresentation:]((uint64_t)BSServiceConnectionEndpoint, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v5, "setObject:forKey:", v15, v10);
          }
          else
          {
            BSServiceLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v10;
              v31 = 2112;
              v32 = v14;
              _os_log_error_impl(&dword_19A799000, v16, OS_LOG_TYPE_ERROR, "Ignoring invalid service endowment : %@ -> %@", buf, 0x16u);
            }

          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    os_unfair_lock_lock(&self->_callOutLock);
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __51__BSServiceManager_service_didReceiveInheritances___block_invoke;
    v22[3] = &unk_1E390D9C0;
    v22[4] = self;
    v24 = a2;
    v18 = v17;
    v23 = v18;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v22);
    os_unfair_lock_unlock(&self->_lock);
    -[BSServiceManager _callOutLock_noteEndpointsChangedForServices:]((os_unfair_lock_s *)self, v18);
    os_unfair_lock_unlock(&self->_callOutLock);

  }
}

- (void)service:(id)a3 didLoseInheritances:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  BSServiceManager *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_callOutLock);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_lock_inheritanceToEndpoint, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[NSMutableDictionary objectForKey:](self->_lock_endpointToInheritances, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("endpointToInheritances is missing an entry for an inheritance in inheritanceToEndpoint : inheritance=%@ endpoint=%@"), v12, v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v18 = (id)objc_claimAutoreleasedReturnValue();
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v32 = v18;
              v33 = 2114;
              v34 = v20;
              v35 = 2048;
              v36 = self;
              v37 = 2114;
              v38 = CFSTR("BSServiceManager.m");
              v39 = 1024;
              v40 = 594;
              v41 = 2114;
              v42 = v17;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7B9480);
          }
          -[NSMutableDictionary removeObjectForKey:](self->_lock_inheritanceToEndpoint, "removeObjectForKey:", v12);
          if ((unint64_t)objc_msgSend(v14, "count") < 2)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_lock_endpointToInheritances, "removeObjectForKey:", v13);
            objc_msgSend(v13, "service");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](self->_lock_serviceIdentifierToEndpoints, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "containsObject:", v13) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("serviceIdentifierToEndpoints is missing an entry for a lost endpoint : service=%@ endpoint=%@"), v15, v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                v22 = (id)objc_claimAutoreleasedReturnValue();
                v23 = (objc_class *)objc_opt_class();
                NSStringFromClass(v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                v32 = v22;
                v33 = 2114;
                v34 = v24;
                v35 = 2048;
                v36 = self;
                v37 = 2114;
                v38 = CFSTR("BSServiceManager.m");
                v39 = 1024;
                v40 = 605;
                v41 = 2114;
                v42 = v21;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7B9578);
            }
            if ((unint64_t)objc_msgSend(v16, "count") < 2)
              -[NSMutableDictionary removeObjectForKey:](self->_lock_serviceIdentifierToEndpoints, "removeObjectForKey:", v15);
            else
              objc_msgSend(v16, "removeObject:", v13);
            objc_msgSend(v7, "addObject:", v15);

          }
          else
          {
            objc_msgSend(v14, "removeObject:", v12);
            objc_msgSend(v13, "service");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);
          }

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_lock);
  -[BSServiceManager _callOutLock_noteEndpointsChangedForServices:]((os_unfair_lock_s *)self, v7);
  os_unfair_lock_unlock(&self->_callOutLock);

}

- (void)_callOutLock_noteEndpointsChangedForServices:(os_unfair_lock_s *)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_unfair_lock_s *lock;
  void *v25;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  id v34;
  os_unfair_lock_s *v35;
  void *v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 22);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = a1;
    lock = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v26;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (!v28)
      goto LABEL_37;
    v29 = *(_QWORD *)v47;
    while (1)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(obj);
        v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(*(id *)&v35[18]._os_unfair_lock_opaque, "objectForKey:", lock);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v30, "count");
        v4 = *(void **)&v35[24]._os_unfair_lock_opaque;
        if (v3)
        {
          objc_msgSend(v4, "objectForKey:", v33);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (void *)objc_msgSend(v32, "mutableCopy");
          v6 = v5;
          if (v5)
          {
            v7 = v5;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v7 = (id)objc_claimAutoreleasedReturnValue();
          }
          v36 = v7;

          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v34 = v30;
          v8 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v43 != v9)
                  objc_enumerationMutation(v34);
                v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                objc_msgSend(*(id *)&v35[16]._os_unfair_lock_opaque, "objectForKey:", v11);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                if (v14)
                {
                  v15 = *(_QWORD *)v39;
                  do
                  {
                    for (k = 0; k != v14; ++k)
                    {
                      if (*(_QWORD *)v39 != v15)
                        objc_enumerationMutation(v13);
                      objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "environment");
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v17)
                        objc_msgSend(v12, "addObject:", v17);

                    }
                    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                  }
                  while (v14);
                }

                objc_msgSend(v36, "objectForKey:", v11);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = BSEqualObjects();

                if ((v19 & 1) == 0)
                {
                  v20 = (void *)objc_msgSend(v12, "copy");
                  objc_msgSend(v36, "setObject:forKey:", v20, v11);

                }
              }
              v8 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
            }
            while (v8);
          }

          v21 = v36;
          if ((BSEqualObjects() & 1) != 0)
            goto LABEL_34;
          v22 = *(void **)&v35[24]._os_unfair_lock_opaque;
          v23 = (void *)objc_msgSend(v36, "copy");
          objc_msgSend(v22, "setObject:forKey:", v23, v33);

        }
        else
        {
          objc_msgSend(v4, "removeObjectForKey:", v33);
        }
        objc_msgSend(*(id *)&v35[20]._os_unfair_lock_opaque, "objectForKey:", v33);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v32, "count"))
          goto LABEL_35;
        v21 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(v25, "setObject:forKey:", v21, v33);
LABEL_34:

LABEL_35:
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (!v28)
      {
LABEL_37:

        os_unfair_lock_unlock(lock);
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __65__BSServiceManager__callOutLock_noteEndpointsChangedForServices___block_invoke;
        v37[3] = &unk_1E390D998;
        v37[4] = v35;
        objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v37);

        break;
      }
    }
  }

}

- (BSServiceManager)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceManager *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceManager *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BSServiceManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BSServiceManager.m");
    v17 = 1024;
    v18 = 126;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __52__BSServiceManager__initWithBootstrapConfiguration___block_invoke_32(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  _QWORD *v4;
  uint64_t v5;
  id *v6;

  v3 = a3;
  v6 = v3;
  if (!v3 || (v4 = v3[1]) == 0 || (v5 = v4[7], v4, !v5))
    -[BSServiceDomain _enforceListenerRegistrationForReason:]((uint64_t)v6, CFSTR("automatic bootstrap complete"));

}

+ (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x19AECA850](a1, a2);
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *lock_identifierToDomain;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BSServiceManager *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  BSServiceManager *v29;
  _QWORD v30[5];
  id v31;
  id v32;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  lock_identifierToDomain = self->_lock_identifierToDomain;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __36__BSServiceManager_debugDescription__block_invoke;
  v30[3] = &unk_1E390D758;
  v30[4] = self;
  v8 = v5;
  v31 = v8;
  v9 = v4;
  v32 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lock_identifierToDomain, "enumerateKeysAndObjectsUsingBlock:", v30);
  objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_39);
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_39);
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __36__BSServiceManager_debugDescription__block_invoke_3;
  v25[3] = &unk_1E390D7C0;
  v10 = v3;
  v26 = v10;
  v11 = v8;
  v27 = v11;
  v12 = v9;
  v28 = v12;
  v29 = self;
  v13 = (id)objc_msgSend(v10, "modifyProem:", v25);
  objc_msgSend(v10, "activeMultilinePrefix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __36__BSServiceManager_debugDescription__block_invoke_4;
  v20[3] = &unk_1E390D7C0;
  v15 = v10;
  v21 = v15;
  v16 = v11;
  v22 = v16;
  v17 = v12;
  v23 = v17;
  v24 = self;
  objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", 0, v14, v20);

  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v15, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

void __36__BSServiceManager_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "domainForIdentifier:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 40;
  if (!v6)
    v7 = 48;
  objc_msgSend(*(id *)(a1 + v7), "addObject:", v5);

}

uint64_t __36__BSServiceManager_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if (a2)
    v5 = *(void **)(a2 + 8);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = (void *)v4[1];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

id __36__BSServiceManager_debugDescription__block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  const __CFString *v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "count"), CFSTR("bootstrapDomains"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 48), "count"), CFSTR("dynamicDomains"));
  v4 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(v4 + 32))
  {
    if (*(_QWORD *)(v4 + 40))
      v5 = CFSTR("extended");
    else
      v5 = CFSTR("complete");
  }
  else
  {
    v5 = CFSTR("initialized");
  }
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v5, CFSTR("automaticStart"));
}

void __36__BSServiceManager_debugDescription__block_invoke_4(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __36__BSServiceManager_debugDescription__block_invoke_5;
  v41[3] = &unk_1E390D478;
  v42 = *(id *)(a1 + 40);
  v43 = *v3;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("bootstrapDomains"), v4, v41);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v5;
  v38[1] = 3221225472;
  v38[2] = __36__BSServiceManager_debugDescription__block_invoke_6;
  v38[3] = &unk_1E390D478;
  v39 = *(id *)(a1 + 48);
  v40 = *(id *)(a1 + 32);
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("dynamicDomains"), v7, v38);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 64), "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "sortUsingSelector:", sel_compare_);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "activeMultilinePrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __36__BSServiceManager_debugDescription__block_invoke_7;
  v34[3] = &unk_1E390D4A0;
  v12 = v9;
  v35 = v12;
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 56);
  v36 = v13;
  v37 = v14;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("inheritedEndpoints"), v11, v34);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_57);
  v17 = *(void **)(a1 + 32);
  objc_msgSend(v17, "activeMultilinePrefix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v5;
  v33[1] = 3221225472;
  v33[2] = __36__BSServiceManager_debugDescription__block_invoke_9;
  v33[3] = &unk_1E390D828;
  v33[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v17, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", v16, CFSTR("outgoingRootConnections"), v18, 0, v33);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 80), "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sortedArrayUsingSelector:", sel_compare_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v44, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 80), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allObjects");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObjectsFromArray:", v26);

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v44, 16);
    }
    while (v22);
  }

  v27 = *(void **)(a1 + 32);
  objc_msgSend(v27, "activeMultilinePrefix");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v19, CFSTR("monitors"), v28, 0);

}

void __36__BSServiceManager_debugDescription__block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v7, "activeMultilinePrefix", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSServiceDomain _debugDescriptionWithMultilinePrefix:](v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v7, "appendObject:withName:", v9, 0);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

void __36__BSServiceManager_debugDescription__block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v7, "activeMultilinePrefix", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSServiceDomain _debugDescriptionWithMultilinePrefix:](v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v7, "appendObject:withName:", v9, 0);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

void __36__BSServiceManager_debugDescription__block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "objectForKey:", v6, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v9, v10, v11, 0);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

uint64_t __36__BSServiceManager_debugDescription__block_invoke_8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;

  if (!a2)
    return 0;
  v2 = xpc_endpoint_compare();
  v3 = -1;
  if (v2 >= 0)
    v3 = 1;
  if (v2)
    return v3;
  else
    return 0;
}

id __36__BSServiceManager_debugDescription__block_invoke_9(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)domainWithIdentifier:(uint64_t)a1
{
  id v3;
  os_unfair_lock_s *v4;

  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v3);
    a1 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
  }

  return (id)a1;
}

- (os_unfair_lock_s)extendAutomaticBootstrapCompletion
{
  os_unfair_lock_s *v1;
  id v2;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  os_unfair_lock_s *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    BSDispatchQueueAssertMain();
    os_unfair_lock_lock(v1 + 4);
    if (LOBYTE(v1[8]._os_unfair_lock_opaque))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must call before automatic bootstrapping would complete without extensions"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_extendAutomaticBootstrapCompletion);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v10 = v5;
        v11 = 2114;
        v12 = v7;
        v13 = 2048;
        v14 = v1;
        v15 = 2114;
        v16 = CFSTR("BSServiceManager.m");
        v17 = 1024;
        v18 = 288;
        v19 = 2114;
        v20 = v4;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7CB768);
    }
    ++*(_QWORD *)&v1[10]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 4);
    v2 = objc_alloc(MEMORY[0x1E0D01868]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__BSServiceManager_extendAutomaticBootstrapCompletion__block_invoke;
    v8[3] = &unk_1E390D870;
    v8[4] = v1;
    v8[5] = sel_extendAutomaticBootstrapCompletion;
    a1 = (os_unfair_lock_s *)objc_msgSend(v2, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.boardservices.bootstrap"), CFSTR("extend"), v8);
  }
  return a1;
}

void __54__BSServiceManager_extendAutomaticBootstrapCompletion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 40);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bootstrap extension underflow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138544642;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2048;
      v18 = v12;
      v19 = 2114;
      v20 = CFSTR("BSServiceManager.m");
      v21 = 1024;
      v22 = 294;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7CB9A0);
  }
  v6 = v5 - 1;
  *(_QWORD *)(v4 + 40) = v6;
  if (!v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    {
      BSServiceBootstrapLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19A799000, v7, OS_LOG_TYPE_DEFAULT, "extended automatic bootstrapping is complete", (uint8_t *)&v13, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_75);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

void __54__BSServiceManager_extendAutomaticBootstrapCompletion__block_invoke_74(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  _QWORD *v4;
  uint64_t v5;
  id *v6;

  v3 = a3;
  v6 = v3;
  if (!v3 || (v4 = v3[1]) == 0 || (v5 = v4[7], v4, !v5))
    -[BSServiceDomain _enforceListenerRegistrationForReason:]((uint64_t)v6, CFSTR("automatic bootstrap complete"));

}

- (id)registerDynamicConfiguration:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  void *v31;
  id v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  objc_class *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  char *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v43 = v3;
  if (a1)
  {
    objc_msgSend(v3, "domains");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v48 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v10, "machName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11 == 0;

          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dynamic domains may not specificy a mach name : %@"), v10);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_registerDynamicConfiguration_);
              v28 = (id)objc_claimAutoreleasedReturnValue();
              v29 = (objc_class *)objc_opt_class();
              NSStringFromClass(v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v52 = v28;
              v53 = 2114;
              v54 = v30;
              v55 = 2048;
              v56 = a1;
              v57 = 2114;
              v58 = CFSTR("BSServiceManager.m");
              v59 = 1024;
              v60 = 316;
              v61 = 2114;
              v62 = v27;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7CBEE4);
          }
          if (!v10)
            goto LABEL_22;
          v13 = v10[7];
          if (v13 != 2)
          {
            if (v13 == 3)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dynamic domains cannot be an XPCService : %@"), v10);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel_registerDynamicConfiguration_);
                v24 = (id)objc_claimAutoreleasedReturnValue();
                v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                v52 = v24;
                v53 = 2114;
                v54 = v26;
                v55 = 2048;
                v56 = a1;
                v57 = 2114;
                v58 = CFSTR("BSServiceManager.m");
                v59 = 1024;
                v60 = 318;
                v61 = 2114;
                v62 = v23;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7CBDE8);
            }
LABEL_22:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dynamic domains must specify Start to be ManualSession : %@"), v10);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_registerDynamicConfiguration_);
              v32 = (id)objc_claimAutoreleasedReturnValue();
              v33 = (objc_class *)objc_opt_class();
              NSStringFromClass(v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v52 = v32;
              v53 = 2114;
              v54 = v34;
              v55 = 2048;
              v56 = a1;
              v57 = 2114;
              v58 = CFSTR("BSServiceManager.m");
              v59 = 1024;
              v60 = 319;
              v61 = 2114;
              v62 = v31;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7CBFE0);
          }
          v14 = *(void **)(a1 + 24);
          objc_msgSend(v10, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v14) = v16 == 0;

          if ((v14 & 1) == 0)
          {
            v35 = (void *)MEMORY[0x1E0CB3940];
            v36 = *(void **)(a1 + 24);
            objc_msgSend(v10, "identifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKey:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR("connot register dynamic domain due to identifier collision : new=%@ existing=%@"), v10, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_registerDynamicConfiguration_);
              v40 = (id)objc_claimAutoreleasedReturnValue();
              v41 = (objc_class *)objc_opt_class();
              NSStringFromClass(v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v52 = v40;
              v53 = 2114;
              v54 = v42;
              v55 = 2048;
              v56 = a1;
              v57 = 2114;
              v58 = CFSTR("BSServiceManager.m");
              v59 = 1024;
              v60 = 320;
              v61 = 2114;
              v62 = v39;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7CC110);
          }
          v17 = -[BSServiceDomain _initWithSpecification:]((BSService *)[BSServiceDomain alloc], v10);
          objc_msgSend(v5, "addObject:", v17);
          v18 = *(void **)(a1 + 24);
          objc_msgSend(v10, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v17, v19);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      }
      while (v7);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    v20 = objc_alloc(MEMORY[0x1E0D01868]);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __49__BSServiceManager_registerDynamicConfiguration___block_invoke;
    v44[3] = &unk_1E390D898;
    v44[4] = a1;
    v21 = v5;
    v45 = v21;
    v46 = sel_registerDynamicConfiguration_;
    a1 = objc_msgSend(v20, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.boardservices.register"), CFSTR("dynamic"), v44);

  }
  return (id)a1;
}

void __49__BSServiceManager_registerDynamicConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7);
        if (v8)
          v9 = *(void **)(v8 + 8);
        else
          v9 = 0;
        v10 = v9;
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = v13 == (void *)v8;

        if ((v11 & 1) == 0)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
          objc_msgSend(v10, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("domain registration stomping : removing=%@ existing=%@"), v8, v20, (_QWORD)v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v31 = v22;
            v32 = 2114;
            v33 = v24;
            v34 = 2048;
            v35 = v25;
            v36 = 2114;
            v37 = CFSTR("BSServiceManager.m");
            v38 = 1024;
            v39 = 332;
            v40 = 2114;
            v41 = v21;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7CC518);
        }
        -[BSServiceDomain _invalidate](v8);
        v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(v10, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeObjectForKey:", v15);

        ++v7;
      }
      while (v5 != v7);
      v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
      v5 = v16;
    }
    while (v16);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)activateManualDomain:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    NSClassFromString(CFSTR("NSString"));
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateManualDomain_);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v32 = v16;
        v33 = 2114;
        v34 = v18;
        v35 = 2048;
        v36 = a1;
        v37 = 2114;
        v38 = CFSTR("BSServiceManager.m");
        v39 = 1024;
        v40 = 341;
        v41 = 2114;
        v42 = v15;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7CC8ACLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateManualDomain_);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v32 = v20;
        v33 = 2114;
        v34 = v22;
        v35 = 2048;
        v36 = a1;
        v37 = 2114;
        v38 = CFSTR("BSServiceManager.m");
        v39 = 1024;
        v40 = 341;
        v41 = 2114;
        v42 = v19;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7CC9ACLL);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (os_unfair_lock_s *)v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempt to activate unknown domain %@"), v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateManualDomain_);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v32 = v24;
        v33 = 2114;
        v34 = v26;
        v35 = 2048;
        v36 = a1;
        v37 = 2114;
        v38 = CFSTR("BSServiceManager.m");
        v39 = 1024;
        v40 = 344;
        v41 = 2114;
        v42 = v23;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7CCAA4);
    }
    v8 = *(id *)(v6 + 8);
    if (v8)
    {
      v9 = v8[7];

      if (v9 == 1)
      {
        if (*(_BYTE *)(a1 + 32))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("manual bootstrap must occur before automatic bootstrapping would complete without extensions"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel_activateManualDomain_);
            v28 = (id)objc_claimAutoreleasedReturnValue();
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v32 = v28;
            v33 = 2114;
            v34 = v30;
            v35 = 2048;
            v36 = a1;
            v37 = 2114;
            v38 = CFSTR("BSServiceManager.m");
            v39 = 1024;
            v40 = 347;
            v41 = 2114;
            v42 = v27;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7CCB98);
        }
      }
      else if (v9 == 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPCService domain cannot be activated via this call"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_activateManualDomain_);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v32 = v11;
          v33 = 2114;
          v34 = v13;
          v35 = 2048;
          v36 = a1;
          v37 = 2114;
          v38 = CFSTR("BSServiceManager.m");
          v39 = 1024;
          v40 = 349;
          v41 = 2114;
          v42 = v10;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7CC74CLL);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    -[BSServiceDomain _activate](v7);
    a1 = objc_claimAutoreleasedReturnValue();

  }
  return (id)a1;
}

- (void)enforceXPCServiceListenerRegistration
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 24), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_110);
    os_unfair_lock_unlock(v2);
  }
}

void __57__BSServiceManager_enforceXPCServiceListenerRegistration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  _QWORD *v4;
  uint64_t v5;
  id *v6;

  v3 = a3;
  v6 = v3;
  if (v3)
  {
    v4 = v3[1];
    if (v4)
    {
      v5 = v4[7];

      if (v5 == 3)
        -[BSServiceDomain _enforceListenerRegistrationForReason:]((uint64_t)v6, CFSTR("activateXPCService"));
    }
  }

}

void __36__BSServiceManager_registerMonitor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(void **)(a1 + 40);
  v7 = WeakRetained;
  v5 = v4;
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 16));
    objc_msgSend(*(id *)(v2 + 80), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "removeObject:", v7);
    if (!objc_msgSend(v6, "count"))
      objc_msgSend(*(id *)(v2 + 80), "removeObjectForKey:", v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));

  }
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  int v13;

  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_DWORD *)(v4 + 36) + 1;
  *(_DWORD *)(v4 + 36) = v5;
  v6 = dispatch_time(0, 5000000000);
  dispatch_get_global_queue(17, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_2_132;
  v10[3] = &unk_1E390D948;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v11 = v8;
  v12 = v3;
  v9 = v3;
  dispatch_after(v6, v7, v10);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_2_132(uint64_t a1)
{
  void *v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  if (*(_DWORD *)(a1 + 56) == *(_DWORD *)(*(_QWORD *)(a1 + 40) + 36)
    && (-[BSXPCServiceConnection hasChildren](*(os_unfair_lock_s **)(a1 + 48)) & 1) == 0
    && (v2 = *(void **)(a1 + 48),
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40)),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2 == v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  }
}

void __96__BSServiceManager__lock_rootConnectionWithEndpoint_oneshot_nonLaunching_targetPID_description___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  os_unfair_lock_s *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  os_unfair_lock_s *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  BSServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "succinctDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_19A799000, v7, OS_LOG_TYPE_DEFAULT, "Error on outgoing connection %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  if (objc_msgSend(v6, "isBSServiceConnectionError")
    && objc_msgSend(v6, "code") == 1
    && (-[BSXPCServiceConnection hasChildren](v5) & 1) != 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    -[os_unfair_lock_s invalidate](v5, "invalidate");
  }

}

void __65__BSServiceManager__callOutLock_noteEndpointsChangedForServices___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKey:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA70];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "serialCallOut_didUpdateEndpointEnvironments:", v9, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

void __51__BSServiceManager_service_didReceiveInheritances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("already have an endpoint for inheritance=%@ : old=%@ new=%@"), v27, v21, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544642;
      v29 = v23;
      v30 = 2114;
      v31 = v25;
      v32 = 2048;
      v33 = v26;
      v34 = 2114;
      v35 = CFSTR("BSServiceManager.m");
      v36 = 1024;
      v37 = 560;
      v38 = 2114;
      v39 = v22;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7CD5D4);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v10 = *(void **)(v9 + 56);
    objc_msgSend(v7, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v12, v27);
    objc_msgSend(v7, "addObject:", v27);
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v12, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);
  }
  else
  {
    v15 = *(void **)(v9 + 64);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v5, v27);
    objc_msgSend(v5, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (v17)
    {
      objc_msgSend(v17, "addObject:", v5);
    }
    else
    {
      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v19, v12);

      v14 = 0;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_RBSService, 0);
  objc_storeStrong((id *)&self->_callOutLock_serviceIdentifierToEndpointsToEnvironments, 0);
  objc_storeStrong((id *)&self->_lock_serviceIdentifierToMonitors, 0);
  objc_storeStrong((id *)&self->_lock_serviceIdentifierToEndpoints, 0);
  objc_storeStrong((id *)&self->_lock_endpointToInheritances, 0);
  objc_storeStrong((id *)&self->_lock_inheritanceToEndpoint, 0);
  objc_storeStrong((id *)&self->_lock_endpointToOutgoingRootConnections, 0);
  objc_storeStrong((id *)&self->_lock_identifierToDomain, 0);
  objc_storeStrong((id *)&self->_bootstrapConfiguration, 0);
}

@end
