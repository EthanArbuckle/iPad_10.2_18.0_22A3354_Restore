@implementation BSServiceConnectionEndpointMonitor

- (void)activate
{
  os_unfair_lock_s *p_lock;
  NSObject *v5;
  NSString *service;
  BSInvalidatable *v7;
  BSInvalidatable *registrationLock_assertion;
  void *v9;
  NSString *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSString *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  NSString *v18;
  objc_class *v19;
  void *v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  BSServiceConnectionEndpointMonitor *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate after invalidation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v22 = v10;
      v23 = 2114;
      v24 = v12;
      v25 = 2048;
      v26 = self;
      v27 = 2114;
      v28 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v29 = 1024;
      v30 = 85;
      v31 = 2114;
      v32 = v9;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B1A44);
  }
  if (self->_lock_activated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate twice"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v22 = v14;
      v23 = 2114;
      v24 = v16;
      v25 = 2048;
      v26 = self;
      v27 = 2114;
      v28 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v29 = 1024;
      v30 = 86;
      v31 = 2114;
      v32 = v13;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B1B3CLL);
  }
  self->_lock_activated = 1;
  os_unfair_lock_lock(&self->_registrationLock);
  os_unfair_lock_unlock(p_lock);
  BSServiceInjectionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412290;
    v22 = service;
    _os_log_impl(&dword_19A799000, v5, OS_LOG_TYPE_DEFAULT, "activating monitor for service %@", buf, 0xCu);
  }

  -[BSServiceManager registerMonitor:]((uint64_t)self->_manager, self);
  v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  registrationLock_assertion = self->_registrationLock_assertion;
  self->_registrationLock_assertion = v7;

  if (!self->_registrationLock_assertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to register monitor for service %@"), self->_service);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v22 = v18;
      v23 = 2114;
      v24 = v20;
      v25 = 2048;
      v26 = self;
      v27 = 2114;
      v28 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v29 = 1024;
      v30 = 93;
      v31 = 2114;
      v32 = v17;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B1C3CLL);
  }
  os_unfair_lock_unlock(&self->_registrationLock);
}

- (NSString)service
{
  return self->_service;
}

- (void)serialCallOut_didUpdateEndpointEnvironments:(id)a3
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BSServiceConnectionEndpointMonitorDelegate *v13;
  NSMutableSet *v14;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  BSServiceConnectionEndpointMonitor *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpointToEnvironments"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v24;
      v45 = 2114;
      v46 = v26;
      v47 = 2048;
      v48 = self;
      v49 = 2114;
      v50 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v51 = 1024;
      v52 = 131;
      v53 = 2114;
      v54 = v23;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B266CLL);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v27;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }

  v12 = (void *)objc_msgSend(v7, "mutableCopy");
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_endpointToEnvironments, a3);
  v13 = self->_lock_delegate;
  v14 = self->_lock_serialCallOut_endpoints;
  objc_storeStrong((id *)&self->_lock_serialCallOut_endpoints, v7);
  os_unfair_lock_unlock(&self->_lock);
  if (v14)
    objc_msgSend(v12, "minusSet:", v14);
  -[NSMutableSet minusSet:](v14, "minusSet:", v7);
  if (v13)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v14;
    v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v15);
          -[BSServiceConnectionEndpointMonitorDelegate monitor:willLoseEndpoint:](v13, "monitor:willLoseEndpoint:", self, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v16);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v29;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v19);
          -[BSServiceConnectionEndpointMonitorDelegate monitor:didReceiveEndpoint:](v13, "monitor:didReceiveEndpoint:", self, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v22++));
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v20);
    }

  }
}

- (void)setDelegate:(id)a3
{
  BSServiceConnectionEndpointMonitorDelegate *v5;
  BSServiceConnectionEndpointMonitorDelegate *lock_delegate;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BSServiceConnectionEndpointMonitor *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (BSServiceConnectionEndpointMonitorDelegate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot set the delegate after activation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544642;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v19 = 1024;
      v20 = 78;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B9D40);
  }
  lock_delegate = self->_lock_delegate;
  self->_lock_delegate = v5;

  os_unfair_lock_unlock(&self->_lock);
}

+ (id)monitorForService:(id)a3
{
  id v3;
  BSServiceConnectionEndpointMonitor *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id *v10;
  id *v11;
  uint64_t v12;
  id v13;
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
  _BYTE v31[22];
  __int16 v32;
  BSServiceConnectionEndpointMonitor *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [BSServiceConnectionEndpointMonitor alloc];
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v3;
  if (v4)
  {
    v8 = v6;
    NSClassFromString(CFSTR("BSServiceManager"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_service_);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 138544642;
        *(_QWORD *)&v31[4] = v16;
        *(_WORD *)&v31[12] = 2114;
        *(_QWORD *)&v31[14] = v18;
        v32 = 2048;
        v33 = v4;
        v34 = 2114;
        v35 = CFSTR("BSServiceConnectionEndpointMonitor.m");
        v36 = 1024;
        v37 = 44;
        v38 = 2114;
        v39 = v15;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v31, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7BA3A4);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceManagerClass]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_service_);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 138544642;
        *(_QWORD *)&v31[4] = v20;
        *(_WORD *)&v31[12] = 2114;
        *(_QWORD *)&v31[14] = v22;
        v32 = 2048;
        v33 = v4;
        v34 = 2114;
        v35 = CFSTR("BSServiceConnectionEndpointMonitor.m");
        v36 = 1024;
        v37 = 44;
        v38 = 2114;
        v39 = v19;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v31, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7BA4A4);
    }

    v9 = v7;
    NSClassFromString(CFSTR("NSString"));
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_service_);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 138544642;
        *(_QWORD *)&v31[4] = v24;
        *(_WORD *)&v31[12] = 2114;
        *(_QWORD *)&v31[14] = v26;
        v32 = 2048;
        v33 = v4;
        v34 = 2114;
        v35 = CFSTR("BSServiceConnectionEndpointMonitor.m");
        v36 = 1024;
        v37 = 45;
        v38 = 2114;
        v39 = v23;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v31, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7BA5A4);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_service_);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 138544642;
        *(_QWORD *)&v31[4] = v28;
        *(_WORD *)&v31[12] = 2114;
        *(_QWORD *)&v31[14] = v30;
        v32 = 2048;
        v33 = v4;
        v34 = 2114;
        v35 = CFSTR("BSServiceConnectionEndpointMonitor.m");
        v36 = 1024;
        v37 = 45;
        v38 = 2114;
        v39 = v27;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v31, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7BA6A4);
    }

    *(_QWORD *)v31 = v4;
    *(_QWORD *)&v31[8] = BSServiceConnectionEndpointMonitor;
    v10 = (id *)objc_msgSendSuper2((objc_super *)v31, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, v5);
      v12 = objc_msgSend(v9, "copy");
      v13 = v11[8];
      v11[8] = (id)v12;

      *((_DWORD *)v11 + 4) = 0;
      *((_DWORD *)v11 + 13) = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BSServiceConnectionEndpointMonitor)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceConnectionEndpointMonitor *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceConnectionEndpointMonitor *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSServiceConnectionEndpointMonitor"));
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
    v16 = CFSTR("BSServiceConnectionEndpointMonitor.m");
    v17 = 1024;
    v18 = 39;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceConnectionEndpointMonitor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BSServiceConnectionEndpointMonitor *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must call invalidate before dealloc"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v18 = 1024;
      v19 = 57;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D68B8);
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)BSServiceConnectionEndpointMonitor;
  -[BSServiceConnectionEndpointMonitor dealloc](&v9, sel_dealloc);
}

- (BSServiceConnectionEndpointMonitorDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  BSServiceConnectionEndpointMonitorDelegate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BSServiceConnectionEndpointMonitorDelegate *lock_delegate;
  NSObject *v5;
  NSString *service;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_invalidated = 1;
    lock_delegate = self->_lock_delegate;
    self->_lock_delegate = 0;

    os_unfair_lock_lock(&self->_registrationLock);
    os_unfair_lock_unlock(p_lock);
    -[BSInvalidatable invalidate](self->_registrationLock_assertion, "invalidate");
    BSServiceInjectionLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      service = self->_service;
      v7 = 138412290;
      v8 = service;
      _os_log_impl(&dword_19A799000, v5, OS_LOG_TYPE_DEFAULT, "invalidated monitor for service %@", (uint8_t *)&v7, 0xCu);
    }

    os_unfair_lock_unlock(&self->_registrationLock);
  }
}

- (id)endpointsForEnvironment:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  NSDictionary *lock_endpointToEnvironments;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  BSServiceConnectionEndpointMonitor *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("environment"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v30 = v15;
      v31 = 2114;
      v32 = v17;
      v33 = 2048;
      v34 = self;
      v35 = 2114;
      v36 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v37 = 1024;
      v38 = 113;
      v39 = 2114;
      v40 = v14;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D6C98);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot query after invalidation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v30 = v19;
      v31 = 2114;
      v32 = v21;
      v33 = 2048;
      v34 = self;
      v35 = 2114;
      v36 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v37 = 1024;
      v38 = 116;
      v39 = 2114;
      v40 = v18;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D6D8CLL);
  }
  if (!self->_lock_activated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot query before activation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v30 = v23;
      v31 = 2114;
      v32 = v25;
      v33 = 2048;
      v34 = self;
      v35 = 2114;
      v36 = CFSTR("BSServiceConnectionEndpointMonitor.m");
      v37 = 1024;
      v38 = 117;
      v39 = 2114;
      v40 = v22;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D6E80);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  lock_endpointToEnvironments = self->_lock_endpointToEnvironments;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __62__BSServiceConnectionEndpointMonitor_endpointsForEnvironment___block_invoke;
  v26[3] = &unk_1E390DDA8;
  v9 = v5;
  v27 = v9;
  v10 = v7;
  v28 = v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](lock_endpointToEnvironments, "enumerateKeysAndObjectsUsingBlock:", v26);
  os_unfair_lock_unlock(p_lock);
  v11 = v28;
  v12 = v10;

  return v12;
}

void __62__BSServiceConnectionEndpointMonitor_endpointsForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (NSString)description
{
  void *v3;
  os_unfair_lock_s *p_lock;
  const __CFString *v5;
  BSServiceConnectionEndpointMonitorDelegate *v6;
  void *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_service, CFSTR("service"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v5 = CFSTR("invalidated");
LABEL_3:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_4;
  }
  if (!self->_lock_activated)
  {
    v5 = CFSTR("initializing");
    goto LABEL_3;
  }
  v6 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%p>"), v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v12, CFSTR("delegate"));

    goto LABEL_5;
  }
  v5 = CFSTR("active");
LABEL_4:
  v6 = 0;
  objc_msgSend(v3, "appendString:withName:", v5, 0);
LABEL_5:
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_registrationLock_assertion, 0);
  objc_storeStrong((id *)&self->_lock_serialCallOut_endpoints, 0);
  objc_storeStrong((id *)&self->_lock_endpointToEnvironments, 0);
  objc_storeStrong((id *)&self->_lock_delegate, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
