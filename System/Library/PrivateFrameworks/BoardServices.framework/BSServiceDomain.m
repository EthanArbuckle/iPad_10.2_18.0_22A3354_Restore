@implementation BSServiceDomain

void __42__BSServiceDomain__initWithSpecification___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  os_unfair_lock_s *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  os_unfair_lock_s *v27;
  void *v28;
  void *v29;
  os_unfair_lock_s *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  os_unfair_lock_s *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v5 = *(_QWORD *)(v5 + 56);
  +[BSServiceConnection _connectionFromIncomingConnection:requiresMessagingAfterHandshake:]((uint64_t)BSServiceConnection, v4, v5 == 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "service");
    v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      BSServiceLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v26;
        v33 = 2114;
        v34 = v8;
        _os_log_error_impl(&dword_19A799000, v15, OS_LOG_TYPE_ERROR, "[BSServiceDomain-%{public}@] Unknown service \"%{public}@\" for incoming connection. Invalidating the connection.", buf, 0x16u);

      }
      objc_msgSend(v7, "invalidate");
      goto LABEL_28;
    }
    v10 = v7;
    objc_msgSend(v10, "instance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(v9 + 24));
    v12 = *(void **)(v9 + 32);
    if (v12)
      v13 = 1;
    else
      v13 = v11 == 0;
    if (v13)
    {
      v16 = v12;
    }
    else
    {
      objc_msgSend(*(id *)(v9 + 40), "objectForKey:", v11);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;
    if (v16)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
      objc_msgSend(v17, "object");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        -[NSObject didReceiveConnection:](v18, "didReceiveConnection:", v10);
      }
      else
      {
        BSServiceBootstrapLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(v9 + 8), "identifier");
          v30 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v9 + 16), "identifier");
          *(_DWORD *)buf = 138413058;
          v32 = v11;
          v33 = 2112;
          v34 = v30;
          v35 = 2112;
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = 2112;
          v38 = v10;
          v29 = (void *)v36;
          _os_log_error_impl(&dword_19A799000, v23, OS_LOG_TYPE_ERROR, "invalidating connection to instance %@ of service %@ of domain %@ because the listener has gone away : %@", buf, 0x2Au);

        }
        objc_msgSend(v10, "invalidate");
        v19 = 0;
      }
    }
    else
    {
      v20 = *(void **)(v9 + 48);
      if (!v20)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
        BSServiceBootstrapLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(v9 + 8), "identifier");
          v27 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v9 + 16), "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v32 = v11;
          v33 = 2112;
          v34 = v27;
          v35 = 2112;
          v36 = (uint64_t)v28;
          v37 = 2112;
          v38 = v10;
          _os_log_error_impl(&dword_19A799000, v24, OS_LOG_TYPE_ERROR, "invalidating connection to instance %@ of service %@ of domain %@ because there is no listener to handle it : %@", buf, 0x2Au);

        }
        objc_msgSend(v10, "invalidate");
        goto LABEL_27;
      }
      objc_msgSend(v20, "addObject:", v10);
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
      BSServiceBootstrapLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(v9 + 8), "identifier");
        v21 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 16), "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v32 = v11;
        v33 = 2112;
        v34 = v21;
        v35 = 2112;
        v36 = (uint64_t)v22;
        v37 = 2112;
        v38 = v10;
        _os_log_debug_impl(&dword_19A799000, v19, OS_LOG_TYPE_DEBUG, "pending connection to instance %@ of service %@ of domain %@ because there is no listener to handle it : %@", buf, 0x2Au);

      }
    }

LABEL_27:
LABEL_28:

    goto LABEL_29;
  }
  BSServiceLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v25;
    v33 = 2112;
    v34 = v4;
    _os_log_error_impl(&dword_19A799000, v14, OS_LOG_TYPE_ERROR, "failed to wrap raw connection to domain %@ : %@", buf, 0x16u);

  }
  -[os_unfair_lock_s invalidate](v4, "invalidate");
LABEL_29:

}

void __42__BSServiceDomain__initWithSpecification___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[BSXPCServiceConnection peer](v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 32);
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(v7, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%d"), v10, objc_msgSend(v7, "pid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  BSServiceLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 2114;
    v24 = v11;
    _os_log_impl(&dword_19A799000, v12, OS_LOG_TYPE_DEFAULT, "[BSServiceDomain-%{public}@] Incoming connection from %{public}@", buf, 0x16u);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_81;
  v17[3] = &unk_1E390DA20;
  v14 = v11;
  v18 = v14;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  -[BSXPCServiceConnection configure:]((uint64_t)v3, (uint64_t)v17);
  BSServiceLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_19A799000, v15, OS_LOG_TYPE_DEFAULT, "[BSServiceDomain-%{public}@] Activating incoming root connection for %{public}@", buf, 0x16u);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObject:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  -[BSXPCServiceConnection activateNowOrWhenReady:]((uint64_t)v3, 0);

}

- (BSServiceDomain)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceDomain *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceDomain *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not available on BSServiceDomain"));
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
    v16 = CFSTR("BSServiceDomain.m");
    v17 = 1024;
    v18 = 278;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceDomain *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithSpecification:(BSService *)a1
{
  id v4;
  _QWORD *v5;
  id *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  BSService *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  BSService *v32;
  BSService *v33;
  id *p_specification;
  id *p_domainSpecification;
  uint64_t v36;
  NSMutableArray *lock_pendedConnections;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v44;
  id v45;
  objc_class *v46;
  void *v47;
  void *v48;
  id v49;
  objc_class *v50;
  void *v51;
  void *v52;
  id v53;
  objc_class *v54;
  void *v55;
  void *v56;
  id v57;
  objc_class *v58;
  void *v59;
  void *v60;
  id v61;
  objc_class *v62;
  void *v63;
  void *v64;
  id v65;
  objc_class *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id *v71;
  void *v72;
  id *v73;
  id obj;
  uint64_t v75;
  char *v76;
  void *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id *v84;
  id *v85;
  objc_super v86;
  _BYTE v87[128];
  _BYTE v88[22];
  __int16 v89;
  BSService *v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v70 = v4;
  if (!a1)
    goto LABEL_8;
  v5 = v4;
  v72 = v5;
  NSClassFromString(CFSTR("BSServiceDomainSpecification"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__initWithSpecification_);
      v61 = (id)objc_claimAutoreleasedReturnValue();
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v88 = 138544642;
      *(_QWORD *)&v88[4] = v61;
      *(_WORD *)&v88[12] = 2114;
      *(_QWORD *)&v88[14] = v63;
      v89 = 2048;
      v90 = a1;
      v91 = 2114;
      v92 = CFSTR("BSServiceDomain.m");
      v93 = 1024;
      v94 = 283;
      v95 = 2114;
      v96 = v60;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v60), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7CEED4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceDomainSpecificationClass]"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__initWithSpecification_);
      v65 = (id)objc_claimAutoreleasedReturnValue();
      v66 = (objc_class *)objc_opt_class();
      NSStringFromClass(v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v88 = 138544642;
      *(_QWORD *)&v88[4] = v65;
      *(_WORD *)&v88[12] = 2114;
      *(_QWORD *)&v88[14] = v67;
      v89 = 2048;
      v90 = a1;
      v91 = 2114;
      v92 = CFSTR("BSServiceDomain.m");
      v93 = 1024;
      v94 = 283;
      v95 = 2114;
      v96 = v64;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v64), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7CEFD8);
  }

  v86.receiver = a1;
  v86.super_class = (Class)BSServiceDomain;
  v6 = (id *)-[BSService init](&v86, sel_init);
  if (v6)
  {
    v73 = v6;
    v76 = (char *)(v6 + 1);
    objc_storeStrong(v6 + 1, a2);
    *((_DWORD *)v73 + 4) = 0;
    objc_msgSend(v5, "machName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v7;
    if (v5[7] == 3)
    {
      -[BSServiceDomainSpecification _xpcSubserviceName]((uint64_t)v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
        +[BSXPCServiceConnectionListener XPCServiceListenerWithSubserviceName:]((uint64_t)BSXPCServiceConnectionListener, v8);
      else
        +[BSXPCServiceConnectionListener XPCServiceListener]();
      v9 = objc_claimAutoreleasedReturnValue();
      v13 = v73[3];
      v73[3] = (id)v9;

      objc_msgSend(v5, "machName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __xpcInstance();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      BSServiceConnectionEndpointTargetDescriptionForServiceListener(v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v73[4];
      v73[4] = (id)v16;

    }
    else if (v7)
    {
      +[BSXPCServiceConnectionListener listenerWithServiceName:]((uint64_t)BSXPCServiceConnectionListener, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v73[3];
      v73[3] = (id)v10;

      __escaped(v68);
      v12 = objc_claimAutoreleasedReturnValue();
      v8 = v73[4];
      v73[4] = (id)v12;
    }
    else
    {
      +[BSXPCServiceConnectionListener listener]();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v73[3];
      v73[3] = (id)v18;

      objc_msgSend(v5, "identifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      BSServiceConnectionEndpointTargetDescriptionForAnonymousDomain(v8);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v73[4];
      v73[4] = (id)v20;

    }
    v22 = (uint64_t)v73[3];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __42__BSServiceDomain__initWithSpecification___block_invoke;
    v83[3] = &unk_1E390DB10;
    v71 = v73;
    v84 = v71;
    v23 = v72;
    v85 = v23;
    -[BSXPCServiceConnectionListener configure:](v22, (uint64_t)v83);
    v69 = v23[6];
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v69, "count"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v69;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    if (v24)
    {
      v75 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v80 != v75)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          v27 = [BSService alloc];
          v28 = *(void **)v76;
          v29 = v26;
          v78 = v28;
          if (v27)
          {
            v30 = v29;
            NSClassFromString(CFSTR("BSServiceSpecification"));
            if (!v30)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__initWithServiceSpecification_domainSpecification_);
                v45 = (id)objc_claimAutoreleasedReturnValue();
                v46 = (objc_class *)objc_opt_class();
                NSStringFromClass(v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v88 = 138544642;
                *(_QWORD *)&v88[4] = v45;
                *(_WORD *)&v88[12] = 2114;
                *(_QWORD *)&v88[14] = v47;
                v89 = 2048;
                v90 = v27;
                v91 = 2114;
                v92 = CFSTR("BSServiceDomain.m");
                v93 = 1024;
                v94 = 69;
                v95 = 2114;
                v96 = v44;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7CEAB8);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceSpecificationClass]"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__initWithServiceSpecification_domainSpecification_);
                v49 = (id)objc_claimAutoreleasedReturnValue();
                v50 = (objc_class *)objc_opt_class();
                NSStringFromClass(v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v88 = 138544642;
                *(_QWORD *)&v88[4] = v49;
                *(_WORD *)&v88[12] = 2114;
                *(_QWORD *)&v88[14] = v51;
                v89 = 2048;
                v90 = v27;
                v91 = 2114;
                v92 = CFSTR("BSServiceDomain.m");
                v93 = 1024;
                v94 = 69;
                v95 = 2114;
                v96 = v48;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7CEBC0);
            }

            v31 = v78;
            NSClassFromString(CFSTR("BSServiceDomainSpecification"));
            if (!v31)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__initWithServiceSpecification_domainSpecification_);
                v53 = (id)objc_claimAutoreleasedReturnValue();
                v54 = (objc_class *)objc_opt_class();
                NSStringFromClass(v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v88 = 138544642;
                *(_QWORD *)&v88[4] = v53;
                *(_WORD *)&v88[12] = 2114;
                *(_QWORD *)&v88[14] = v55;
                v89 = 2048;
                v90 = v27;
                v91 = 2114;
                v92 = CFSTR("BSServiceDomain.m");
                v93 = 1024;
                v94 = 70;
                v95 = 2114;
                v96 = v52;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7CECC8);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceDomainSpecificationClass]"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__initWithServiceSpecification_domainSpecification_);
                v57 = (id)objc_claimAutoreleasedReturnValue();
                v58 = (objc_class *)objc_opt_class();
                NSStringFromClass(v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v88 = 138544642;
                *(_QWORD *)&v88[4] = v57;
                *(_WORD *)&v88[12] = 2114;
                *(_QWORD *)&v88[14] = v59;
                v89 = 2048;
                v90 = v27;
                v91 = 2114;
                v92 = CFSTR("BSServiceDomain.m");
                v93 = 1024;
                v94 = 70;
                v95 = 2114;
                v96 = v56;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7CEDD0);
            }

            *(_QWORD *)v88 = v27;
            *(_QWORD *)&v88[8] = BSService;
            v32 = (BSService *)objc_msgSendSuper2((objc_super *)v88, sel_init);
            v33 = v32;
            v27 = v32;
            if (v32)
            {
              p_specification = (id *)&v32->_specification;
              objc_storeStrong((id *)&v32->_specification, v26);
              p_domainSpecification = (id *)&v33->_domainSpecification;
              objc_storeStrong(p_domainSpecification, v28);
              v27->_lock._os_unfair_lock_opaque = 0;
              if ((!*p_domainSpecification || !*((_QWORD *)*p_domainSpecification + 7))
                && (objc_msgSend(*p_specification, "isHiddenAtLaunch") & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v36 = objc_claimAutoreleasedReturnValue();
                lock_pendedConnections = v27->_lock_pendedConnections;
                v27->_lock_pendedConnections = (NSMutableArray *)v36;

              }
            }
          }

          objc_msgSend(v29, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKey:", v27, v38);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
      }
      while (v24);
    }

    v39 = objc_msgSend(v77, "copy");
    v40 = v71[5];
    v71[5] = (id)v39;

    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = v71[6];
    v71[6] = v41;

    -[BSXPCServiceConnectionListener activateSuspended]((uint64_t)v73[3]);
    if (!*(_QWORD *)v76 || !*(_QWORD *)(*(_QWORD *)v76 + 56))
      -[BSXPCServiceConnectionListener resume]((uint64_t)v73[3]);

  }
  else
  {
LABEL_8:
    v71 = 0;
  }

  return v71;
}

void __42__BSServiceDomain__initWithSpecification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "setEndpointDescription:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  +[BSServiceQuality userInteractive](BSServiceQuality, "userInteractive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_2;
  v8[3] = &unk_1E390DA48;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setConnectionHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_92;
  v6[3] = &unk_1E390DAE8;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setErrorHandler:", v6);

}

void __42__BSServiceDomain__initWithSpecification___block_invoke_81(id *a1, void *a2)
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
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSXPCRootIn:%@"), a1[4]);
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

    v12 = objc_msgSend(&__block_literal_global_6, "copy");
    v9 = (void *)v3[10];
    v3[10] = v12;
  }

  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_3;
  v23[3] = &unk_1E390DA98;
  v24 = a1[5];
  v25 = a1[6];
  if (v3)
  {
    v14 = objc_msgSend(v23, "copy");
    v15 = (void *)v3[8];
    v3[8] = v14;

  }
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_88;
  v19[3] = &unk_1E390DAC0;
  v20 = a1[5];
  v21 = a1[4];
  v16 = a1[6];
  v22 = v16;
  if (v3)
  {
    v17 = objc_msgSend(v19, "copy");
    v18 = (void *)v3[11];
    v3[11] = v17;

    v16 = v22;
  }

}

void __42__BSServiceDomain__initWithSpecification___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  BSServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "succinctDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_19A799000, v7, OS_LOG_TYPE_DEFAULT, "[BSServiceDomain-%{public}@] Error on connection from %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "removeObjectIdenticalTo:", v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
  objc_msgSend(v5, "invalidate");

}

void __42__BSServiceDomain__initWithSpecification___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSServiceXPCErrorsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v6 = (void *)qword_1ECD9C648;
    v13 = qword_1ECD9C648;
    if (!qword_1ECD9C648)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getRBSProcessIdentityClass_block_invoke;
      v9[3] = &unk_1E390CE38;
      v9[4] = &v10;
      __getRBSProcessIdentityClass_block_invoke((uint64_t)v9);
      v6 = (void *)v11[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v7, "identityOfCurrentProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v5;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v3;
    _os_log_error_impl(&dword_19A799000, v4, OS_LOG_TYPE_ERROR, "[BSServiceDomain-%{public}@] unexpected error on listener connection for %{public}@ (is the system going down or the domain misconfigured?): %{public}@", buf, 0x20u);

  }
}

- (id)debugDescription
{
  return -[BSServiceDomain _debugDescriptionWithMultilinePrefix:]((uint64_t)self, 0);
}

- (id)_debugDescriptionWithMultilinePrefix:(uint64_t)a1
{
  id v3;
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 40), "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_123);
    v8 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_2;
    v18[3] = &unk_1E390D478;
    v9 = v4;
    v19 = v9;
    v20 = a1;
    v10 = (id)objc_msgSend(v9, "modifyProem:", v18);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_3;
    v15[3] = &unk_1E390D4A0;
    v15[4] = a1;
    v11 = v9;
    v16 = v11;
    v12 = v7;
    v17 = v12;
    objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v15);
    os_unfair_lock_unlock(v5);
    objc_msgSend(v11, "build");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (os_unfair_lock_s)listenerEndpoint
{
  if (a1)
  {
    -[BSXPCServiceConnectionListener endpoint](a1[3]);
    a1 = (os_unfair_lock_s **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)listenerEndpointOneshot
{
  uint64_t v1;

  if (a1)
  {
    v1 = a1[1];
    if (v1 && *(_QWORD *)(v1 + 56) == 3)
    {
      __xpcInstance();
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)registerListener:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  __CFString *v7;
  uint64_t v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  objc_class *v44;
  void *v45;
  void *v46;
  id v47;
  objc_class *v48;
  void *v49;
  void *v50;
  id v51;
  objc_class *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  objc_class *v60;
  void *v61;
  void *v62;
  id v63;
  objc_class *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  objc_class *v71;
  void *v72;
  void *v73;
  id v74;
  objc_class *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  objc_class *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  objc_class *v90;
  void *v91;
  void *v92;
  void *v93;
  __CFString *v94;
  void *v95;
  void *v96;
  void *v97;
  _QWORD v98[5];
  __CFString *v99;
  id v100;
  id location;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  id v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  const __CFString *v113;
  __int16 v114;
  int v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v96 = v3;
  if (!a1)
  {
    v38 = 0;
    goto LABEL_40;
  }
  v4 = v3;
  if (!v3)
  {
    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 8), "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("asked to register a nil listener of domain %@"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_registerListener_);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v107 = v43;
      v108 = 2114;
      v109 = v45;
      v110 = 2048;
      v111 = a1;
      v112 = 2114;
      v113 = CFSTR("BSServiceDomain.m");
      v114 = 1024;
      v115 = 403;
      v116 = 2114;
      v117 = v42;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D00ACLL);
  }
  objc_msgSend(v3, "service");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v92;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_registerListener_);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v107 = v47;
      v108 = 2114;
      v109 = v49;
      v110 = 2048;
      v111 = a1;
      v112 = 2114;
      v113 = CFSTR("BSServiceDomain.m");
      v114 = 1024;
      v115 = 406;
      v116 = 2114;
      v117 = v46;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D01ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_registerListener_);
      v51 = (id)objc_claimAutoreleasedReturnValue();
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v107 = v51;
      v108 = 2114;
      v109 = v53;
      v110 = 2048;
      v111 = a1;
      v112 = 2114;
      v113 = CFSTR("BSServiceDomain.m");
      v114 = 1024;
      v115 = 406;
      v116 = 2114;
      v117 = v50;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D02ACLL);
  }

  v7 = v5;
  if (v7)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_registerListener_);
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v75 = (objc_class *)objc_opt_class();
        NSStringFromClass(v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v107 = v74;
        v108 = 2114;
        v109 = v76;
        v110 = 2048;
        v111 = a1;
        v112 = 2114;
        v113 = CFSTR("BSServiceDomain.m");
        v114 = 1024;
        v115 = 407;
        v116 = 2114;
        v117 = v73;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v73), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D06F8);
    }
  }

  v95 = v6;
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v54 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 8), "identifier");
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v55;
    v57 = CFSTR("<any>");
    if (v7)
      v57 = v7;
    objc_msgSend(v54, "stringWithFormat:", CFSTR("failed to activate listener for instance %@ of service %@ in domain %@ because the service was not initialized"), v57, v95, v55);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_registerListener_);
      v59 = (id)objc_claimAutoreleasedReturnValue();
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v107 = v59;
      v108 = 2114;
      v109 = v61;
      v110 = 2048;
      v111 = a1;
      v112 = 2114;
      v113 = CFSTR("BSServiceDomain.m");
      v114 = 1024;
      v115 = 409;
      v116 = 2114;
      v117 = v58;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D03D4);
  }
  v9 = v4;
  v10 = v7;
  objc_msgSend(MEMORY[0x1E0D018B0], "referenceWithObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  v97 = v11;
  if (*(_BYTE *)(v8 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot register listener on an invalidated service"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__registerListener_forInstance_);
      v63 = (id)objc_claimAutoreleasedReturnValue();
      v64 = (objc_class *)objc_opt_class();
      NSStringFromClass(v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v107 = v63;
      v108 = 2114;
      v109 = v65;
      v110 = 2048;
      v111 = v8;
      v112 = 2114;
      v113 = CFSTR("BSServiceDomain.m");
      v114 = 1024;
      v115 = 112;
      v116 = 2114;
      v117 = v62;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D04C8);
  }
  if (*(_QWORD *)(v8 + 32))
  {
    v66 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(v8 + 8), "identifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v8 + 16), "identifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringWithFormat:", CFSTR("already have a global listener for service %@ of domain %@ : old=%@ new=%@"), v67, v68, *(_QWORD *)(v8 + 32), v9);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__registerListener_forInstance_);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      v71 = (objc_class *)objc_opt_class();
      NSStringFromClass(v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v107 = v70;
      v108 = 2114;
      v109 = v72;
      v110 = 2048;
      v111 = v8;
      v112 = 2114;
      v113 = CFSTR("BSServiceDomain.m");
      v114 = 1024;
      v115 = 113;
      v116 = 2114;
      v117 = v69;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D05F4);
  }
  v12 = *(void **)(v8 + 40);
  if (v7)
  {
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v77 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(v8 + 8), "identifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v8 + 16), "identifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v8 + 40), "objectForKey:", v10);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "stringWithFormat:", CFSTR("already have a listener for instance %@ of service %@ of domain %@ : old=%@ new=%@"), v10, v78, v79, v80, v9);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__registerListener_forInstance_);
          v82 = (id)objc_claimAutoreleasedReturnValue();
          v83 = (objc_class *)objc_opt_class();
          NSStringFromClass(v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v107 = v82;
          v108 = 2114;
          v109 = v84;
          v110 = 2048;
          v111 = v8;
          v112 = 2114;
          v113 = CFSTR("BSServiceDomain.m");
          v114 = 1024;
          v115 = 116;
          v116 = 2114;
          v117 = v81;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v81), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7D0840);
      }
      objc_msgSend(*(id *)(v8 + 40), "setObject:forKey:", v11, v10);
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v11, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v16;
  }
  else
  {
    if (v12)
    {
      v85 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(v8 + 8), "identifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v8 + 16), "identifier");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "stringWithFormat:", CFSTR("already have a listener for service %@ of domain %@ : old=%@ new=%@"), v86, v87, *(_QWORD *)(v8 + 40), v9);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__registerListener_forInstance_);
        v89 = (id)objc_claimAutoreleasedReturnValue();
        v90 = (objc_class *)objc_opt_class();
        NSStringFromClass(v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v107 = v89;
        v108 = 2114;
        v109 = v91;
        v110 = 2048;
        v111 = v8;
        v112 = 2114;
        v113 = CFSTR("BSServiceDomain.m");
        v114 = 1024;
        v115 = 122;
        v116 = 2114;
        v117 = v88;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v88), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D096CLL);
    }
    v14 = v11;
    v15 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v14;
  }

LABEL_18:
  v17 = objc_msgSend(*(id *)(v8 + 48), "count");
  v94 = v7;
  if (v17)
  {
    if (v7)
    {
      v18 = 0;
      v19 = 0;
      do
      {
        objc_msgSend(*(id *)(v8 + 48), "objectAtIndex:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "instance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = BSEqualStrings();

        if (v22)
        {
          if (!v19)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v17);
            v19 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v19, "addObject:", v20);
          objc_msgSend(*(id *)(v8 + 48), "removeObjectAtIndex:", v18);
          --v17;
        }
        else
        {
          ++v18;
        }

      }
      while (v18 < v17);
    }
    else
    {
      v19 = *(id *)(v8 + 48);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(v8 + 48);
      *(_QWORD *)(v8 + 48) = v23;

    }
  }
  else
  {
    v19 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v25 = v19;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v103 != v27)
          objc_enumerationMutation(v25);
        objc_msgSend(v9, "didReceiveConnection:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i));
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
    }
    while (v26);
  }

  objc_initWeak(&location, (id)v8);
  v29 = objc_alloc(MEMORY[0x1E0D01868]);
  v30 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(v8 + 16), "identifier");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("com.apple.boardservices.domain:%@"), v93);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(v8 + 8), "identifier");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  v35 = CFSTR("<any>");
  if (v94)
    v35 = v10;
  objc_msgSend(v32, "stringWithFormat:", CFSTR("listener:\"%@\"-\"%@\" -> %p"), v33, v35, v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __43__BSService__registerListener_forInstance___block_invoke;
  v98[3] = &unk_1E390DA70;
  objc_copyWeak(&v100, &location);
  v98[4] = v97;
  v37 = v10;
  v99 = v37;
  v38 = (void *)objc_msgSend(v29, "initWithIdentifier:forReason:invalidationBlock:", v31, v36, v98);

  objc_destroyWeak(&v100);
  objc_destroyWeak(&location);

LABEL_40:
  return v38;
}

- (id)_activate
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[5];
  _BYTE location[12];
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v1 = (uint64_t)a1;
  v35 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)&a1[2]._os_unfair_lock_opaque;
    if (!v2 || (v3 = *(_QWORD *)(v2 + 56)) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot manually activate an automatic domain"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__activate);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138544642;
        *(_QWORD *)&location[4] = v14;
        v25 = 2114;
        v26 = v16;
        v27 = 2048;
        v28 = v1;
        v29 = 2114;
        v30 = CFSTR("BSServiceDomain.m");
        v31 = 1024;
        v32 = 425;
        v33 = 2114;
        v34 = v13;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D104CLL);
    }
    if (BYTE1(a1[16]._os_unfair_lock_opaque))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot manually activate an invalidated domain"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__activate);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138544642;
        *(_QWORD *)&location[4] = v18;
        v25 = 2114;
        v26 = v20;
        v27 = 2048;
        v28 = v1;
        v29 = 2114;
        v30 = CFSTR("BSServiceDomain.m");
        v31 = 1024;
        v32 = 426;
        v33 = 2114;
        v34 = v17;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D1140);
    }
    os_unfair_lock_lock(a1 + 4);
    v4 = *(_QWORD *)(v1 + 56);
    *(_QWORD *)(v1 + 56) = v4 + 1;
    if (v4)
    {
LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
      if (v3 == 2)
      {
LABEL_7:
        objc_initWeak((id *)location, (id)v1);
        v5 = objc_alloc(MEMORY[0x1E0D01868]);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __28__BSServiceDomain__activate__block_invoke_2;
        v21[3] = &unk_1E390DB38;
        objc_copyWeak(&v22, (id *)location);
        v1 = objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.boardservices.domain"), CFSTR("session"), v21);
        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)location);
        return (id)v1;
      }
LABEL_22:
      v1 = 0;
      return (id)v1;
    }
    if (v3 == 3)
    {
      BSServiceBootstrapLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v1 + 8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v9;
        _os_log_impl(&dword_19A799000, v8, OS_LOG_TYPE_DEFAULT, "initializing domain %@", location, 0xCu);

      }
      if (!*(_BYTE *)(v1 + 64))
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __28__BSServiceDomain__activate__block_invoke;
        block[3] = &unk_1E390D210;
        block[4] = v1;
        dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_25:
        -[BSXPCServiceConnectionListener resume](*(_QWORD *)(v1 + 24));
        goto LABEL_6;
      }
    }
    else
    {
      if (v3 == 2)
      {
        BSServiceBootstrapLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(v1 + 8), "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412290;
          *(_QWORD *)&location[4] = v7;
          _os_log_impl(&dword_19A799000, v6, OS_LOG_TYPE_DEFAULT, "initializing session for domain %@", location, 0xCu);

        }
        if (*(_BYTE *)(v1 + 64))
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
          goto LABEL_7;
        }
        goto LABEL_24;
      }
      BSServiceBootstrapLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v1 + 8), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v11;
        _os_log_impl(&dword_19A799000, v10, OS_LOG_TYPE_DEFAULT, "manually bootstrapping domain %@", location, 0xCu);

      }
      if (!*(_BYTE *)(v1 + 64))
      {
LABEL_24:
        -[BSServiceDomain _enforceListenerRegistrationForReason:](v1, CFSTR("manual activation"));
        goto LABEL_25;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
    goto LABEL_22;
  }
  return (id)v1;
}

void __28__BSServiceDomain__activate__block_invoke(uint64_t a1)
{
  -[BSServiceDomain _enforceListenerRegistrationForReason:](*(_QWORD *)(a1 + 32), CFSTR("XPCService backstop"));
}

- (void)_enforceListenerRegistrationForReason:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v6[1] = 3221225472;
    v6[2] = __57__BSServiceDomain__enforceListenerRegistrationForReason___block_invoke;
    v6[3] = &unk_1E390DB60;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

    v3 = v5;
  }

}

void __28__BSServiceDomain__activate__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id WeakRetained;
  _BYTE buf[24];
  void *v12;
  __int128 v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
    v1 = *((_QWORD *)WeakRetained + 7);
    if (!v1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("domain activation underflow"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__deactivate);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2048;
        v12 = WeakRetained;
        LOWORD(v13) = 2114;
        *(_QWORD *)((char *)&v13 + 2) = CFSTR("BSServiceDomain.m");
        WORD5(v13) = 1024;
        HIDWORD(v13) = 531;
        v14 = 2114;
        v15 = v6;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D14C8);
    }
    if (!*((_BYTE *)WeakRetained + 65))
    {
      v2 = v1 - 1;
      *((_QWORD *)WeakRetained + 7) = v2;
      if (!v2)
      {
        BSServiceBootstrapLog();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*((id *)WeakRetained + 1), "identifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v4;
          _os_log_impl(&dword_19A799000, v3, OS_LOG_TYPE_DEFAULT, "destroying session for domain %@", buf, 0xCu);

        }
        if (!*((_BYTE *)WeakRetained + 64))
        {
          *((_BYTE *)WeakRetained + 64) = 1;
          v5 = *((_QWORD *)WeakRetained + 3);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __30__BSServiceDomain__deactivate__block_invoke;
          v12 = &unk_1E390DC08;
          *(_QWORD *)&v13 = WeakRetained;
          *((_QWORD *)&v13 + 1) = sel__deactivate;
          -[BSXPCServiceConnectionListener suspendWithCompletion:](v5, (uint64_t)buf);
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  }

}

void __57__BSServiceDomain__enforceListenerRegistrationForReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint8_t v35[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v21 = *(id *)(a1 + 32);
  if (a3)
  {
    v4 = (os_unfair_lock_s *)(a3 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
    v22 = a3;
    if ((objc_msgSend(*(id *)(a3 + 8), "isHiddenAtLaunch") & 1) == 0
      && !*(_QWORD *)(a3 + 32)
      && !objc_msgSend(*(id *)(a3 + 40), "count"))
    {
      BSServiceBootstrapLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(*(id *)(a3 + 16), "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(v22 + 8);
        *(_DWORD *)v35 = 138543874;
        v36 = v19;
        v37 = 2114;
        v38 = v20;
        v39 = 2112;
        v40 = v21;
        _os_log_fault_impl(&dword_19A799000, v5, OS_LOG_TYPE_FAULT, "domain=%{public}@ service=%{public}@ : no listener at %@", v35, 0x20u);

      }
      a3 = v22;
    }
    v6 = *(id *)(a3 + 48);
    v7 = a3;
    v8 = v6;
    v9 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = 0;

    os_unfair_lock_unlock(v4);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
          BSServiceBootstrapLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "instance");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v22 + 8), "identifier");
            v17 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v22 + 16), "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v28 = v16;
            v29 = 2112;
            v30 = v17;
            v31 = 2112;
            v32 = v18;
            v33 = 2112;
            v34 = v14;
            _os_log_error_impl(&dword_19A799000, v15, OS_LOG_TYPE_ERROR, "invalidating connection to instance %@ of service %@ of domain %@ because pending has been disabled : %@", buf, 0x2Au);

          }
          objc_msgSend(v14, "invalidate");
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v11);
    }

  }
}

- (void)_invalidate
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(_BYTE *)(a1 + 65))
    {
      *(_BYTE *)(a1 + 65) = 1;
      BSServiceBootstrapLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 8), "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 138412290;
        v6 = v4;
        _os_log_impl(&dword_19A799000, v3, OS_LOG_TYPE_DEFAULT, "invalidating domain %@", (uint8_t *)&v5, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 40), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_121);
      objc_msgSend(*(id *)(a1 + 24), "invalidate");
    }
    os_unfair_lock_unlock(v2);
  }
}

void __30__BSServiceDomain__invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (os_unfair_lock_s *)(a3 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
    if (*(_BYTE *)(a3 + 56))
    {
      v5 = 0;
    }
    else
    {
      *(_BYTE *)(a3 + 56) = 1;
      v5 = *(id *)(a3 + 48);
      v6 = *(void **)(a3 + 32);
      *(_QWORD *)(a3 + 32) = 0;

      v7 = *(void **)(a3 + 40);
      *(_QWORD *)(a3 + 40) = 0;

      v8 = *(void **)(a3 + 48);
      *(_QWORD *)(a3 + 48) = 0;

    }
    os_unfair_lock_unlock(v4);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "invalidate", (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

uint64_t __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke(uint64_t a1, id *a2, void *a3)
{
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[BSService _identifier](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSService _identifier](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  BOOL v9;
  const __CFString *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 8);
  if (v5 && *(_QWORD *)(v5 + 56))
  {
    if (*(_BYTE *)(v4 + 65))
    {
      v6 = CFSTR("invalid");
    }
    else
    {
      v7 = *(unsigned __int8 *)(v4 + 64);
      v8 = CFSTR("active");
      v9 = *(_QWORD *)(v4 + 56) == 0;
      v10 = CFSTR("reactivating");
      if (v9)
      {
        v8 = CFSTR("inactive");
        v10 = CFSTR("deactivating");
      }
      if (v7)
        v6 = v10;
      else
        v6 = v8;
    }
    v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v6, CFSTR("state"));
  }
}

void __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v2, "activeMultilinePrefix");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[BSServiceDomainSpecification _appendManagerDumpBodyToBuilder:withMultilinePrefix:](v3, v2, v14);

  v4 = -[BSXPCServiceConnectionListener isNonLaunching](*(os_unfair_lock_s **)(*(_QWORD *)(a1 + 32) + 24));
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v4)
  {
    objc_msgSend(CFSTR("NL:"), "stringByAppendingString:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v15 = v6;
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v6, CFSTR("endpoint"));
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "activeMultilinePrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_4;
  v16[3] = &unk_1E390D478;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 40);
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("services"), v9, v16);

  v10 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("rootListener"));
  v11 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v11, "activeMultilinePrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v12, CFSTR("incomingRootConnections"), v13, 0);

}

void __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_4(uint64_t a1)
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
        -[BSService _debugDescriptionWithMultilinePrefix:](v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v7, "appendObject:withName:", v9, 0);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

void __30__BSServiceDomain__deactivate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sanity - this shouldn't be possible"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = v8;
      v15 = 2114;
      v16 = CFSTR("BSServiceDomain.m");
      v17 = 1024;
      v18 = 538;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D2134);
  }
  *(_BYTE *)(v2 + 64) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 56))
  {
    -[BSServiceDomain _enforceListenerRegistrationForReason:](v3, CFSTR("manual activation"));
    -[BSXPCServiceConnectionListener resume](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v3 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 16));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_incomingConnections, 0);
  objc_storeStrong((id *)&self->_identifierToService, 0);
  objc_storeStrong((id *)&self->_listenerEndpointDescription, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_specification, 0);
}

@end
