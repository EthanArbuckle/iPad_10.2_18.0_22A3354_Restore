@implementation BSServiceConnectionListener

- (void)didReceiveConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *service;
  NSString *domain;
  BSServiceConnectionListenerDelegate *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activated && !self->_lock_invalidated)
  {
    v11 = self->_lock_delegate;
    os_unfair_lock_unlock(p_lock);
    if (v11)
    {
      -[BSServiceConnection _clientContext]((uint64_t)a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSServiceConnectionListenerDelegate listener:didReceiveConnection:withContext:](v11, "listener:didReceiveConnection:withContext:", self, a3, v7);

      return;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  BSServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a3, "instance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    domain = self->_domain;
    service = self->_service;
    *(_DWORD *)buf = 138413058;
    v13 = v8;
    v14 = 2112;
    v15 = service;
    v16 = 2112;
    v17 = domain;
    v18 = 2112;
    v19 = a3;
    _os_log_error_impl(&dword_19A799000, v6, OS_LOG_TYPE_ERROR, "invalidating connection to instance %@ of service %@ of domain %@ because there is no delegate to handle it : %@", buf, 0x2Au);

  }
  objc_msgSend(a3, "invalidate");
}

- (BSServiceConnectionEndpoint)endpoint
{
  os_unfair_lock_s *p_lock;
  BSServiceConnectionEndpoint *lock_endpoint;
  BSServiceConnectionEndpoint *v6;
  BSServiceConnectionEndpoint *v7;
  BSServiceConnectionEndpoint *v8;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  BSServiceConnectionListener *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_7;
  }
  lock_endpoint = self->_lock_endpoint;
  if (!lock_endpoint)
  {
    +[BSServiceConnectionEndpoint _endpointForManager:domain:service:instance:]((uint64_t)BSServiceConnectionEndpoint, self->_manager, self->_domain, self->_service, self->_instance);
    v7 = (BSServiceConnectionEndpoint *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lock_endpoint;
    self->_lock_endpoint = v7;

    v6 = v7;
    os_unfair_lock_unlock(p_lock);
    if (v6)
      return v6;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to fetch endpoint for %@"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = CFSTR("BSServiceConnectionListener.m");
      v22 = 1024;
      v23 = 91;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B3FA4);
  }
  v6 = lock_endpoint;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BSServiceConnectionListener)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceConnectionListener *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceConnectionListener *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSServiceConnectionListener"));
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
    v16 = CFSTR("BSServiceConnectionListener.m");
    v17 = 1024;
    v18 = 41;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceConnectionListener *)_bs_set_crash_log_message();
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
  BSServiceConnectionListener *v15;
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
      v17 = CFSTR("BSServiceConnectionListener.m");
      v18 = 1024;
      v19 = 65;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D7444);
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)BSServiceConnectionListener;
  -[BSServiceConnectionListener dealloc](&v9, sel_dealloc);
}

+ (id)listenerWithConfigurator:(id)a3
{
  BSServiceConnectionListener *v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
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
  void *v26;
  id v27;
  objc_class *v28;
  void *v29;
  void *v30;
  id v31;
  objc_class *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  BSServiceConnectionListener *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = [BSServiceConnectionListener alloc];
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = v5;
    NSClassFromString(CFSTR("BSServiceManager"));
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_config_);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v36 = v11;
        v37 = 2114;
        v38 = v13;
        v39 = 2048;
        v40 = v4;
        v41 = 2114;
        v42 = CFSTR("BSServiceConnectionListener.m");
        v43 = 1024;
        v44 = 46;
        v45 = 2114;
        v46 = v10;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D76E8);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceManagerClass]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_config_);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v36 = v15;
        v37 = 2114;
        v38 = v17;
        v39 = 2048;
        v40 = v4;
        v41 = 2114;
        v42 = CFSTR("BSServiceConnectionListener.m");
        v43 = 1024;
        v44 = 46;
        v45 = 2114;
        v46 = v14;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D77E8);
    }

    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_config_);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v36 = v19;
        v37 = 2114;
        v38 = v21;
        v39 = 2048;
        v40 = v4;
        v41 = 2114;
        v42 = CFSTR("BSServiceConnectionListener.m");
        v43 = 1024;
        v44 = 47;
        v45 = 2114;
        v46 = v18;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D78E8);
    }
    v34.receiver = v4;
    v34.super_class = (Class)BSServiceConnectionListener;
    v8 = objc_msgSendSuper2(&v34, sel_init);
    v4 = (BSServiceConnectionListener *)v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, v6);
      v4->_lock._os_unfair_lock_opaque = 0;
      v4->_registrationLock._os_unfair_lock_opaque = 0;
      os_unfair_lock_lock(&v4->_lock);
      (*((void (**)(id, BSServiceConnectionListener *))a3 + 2))(a3, v4);
      if (!v4->_domain)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must configure a domain"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithManager_config_);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = v23;
          v37 = 2114;
          v38 = v25;
          v39 = 2048;
          v40 = v4;
          v41 = 2114;
          v42 = CFSTR("BSServiceConnectionListener.m");
          v43 = 1024;
          v44 = 55;
          v45 = 2114;
          v46 = v22;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7D79DCLL);
      }
      if (!v4->_service)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must configure a service"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithManager_config_);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = v27;
          v37 = 2114;
          v38 = v29;
          v39 = 2048;
          v40 = v4;
          v41 = 2114;
          v42 = CFSTR("BSServiceConnectionListener.m");
          v43 = 1024;
          v44 = 56;
          v45 = 2114;
          v46 = v26;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7D7AD0);
      }
      if (!v4->_lock_delegate)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must configure a delegate"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithManager_config_);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = v31;
          v37 = 2114;
          v38 = v33;
          v39 = 2048;
          v40 = v4;
          v41 = 2114;
          v42 = CFSTR("BSServiceConnectionListener.m");
          v43 = 1024;
          v44 = 57;
          v45 = 2114;
          v46 = v30;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7D7BC4);
      }
      os_unfair_lock_unlock(&v4->_lock);
    }
  }

  return v4;
}

- (void)activate
{
  os_unfair_lock_s *p_lock;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  NSString *service;
  NSString *domain;
  BSInvalidatable *v10;
  BSInvalidatable *registrationLock_assertion;
  void *v12;
  __CFString *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  __CFString *v17;
  objc_class *v18;
  NSString *v19;
  const __CFString *instance;
  void *v21;
  __CFString *v22;
  objc_class *v23;
  NSString *v24;
  const __CFString *v25;
  void *v26;
  __CFString *v27;
  objc_class *v28;
  NSString *v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  BSServiceConnectionListener *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate after invalidation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v13;
      v32 = 2114;
      v33 = v15;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("BSServiceConnectionListener.m");
      v38 = 1024;
      v39 = 97;
      v40 = 2114;
      v41 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D7F24);
  }
  if (self->_lock_activated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate twice"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v17;
      v32 = 2114;
      v33 = v19;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("BSServiceConnectionListener.m");
      v38 = 1024;
      v39 = 98;
      v40 = 2114;
      v41 = v16;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D801CLL);
  }
  self->_lock_activated = 1;
  os_unfair_lock_lock(&self->_registrationLock);
  os_unfair_lock_unlock(p_lock);
  -[BSServiceManager domainWithIdentifier:]((uint64_t)self->_manager, self->_domain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    instance = (const __CFString *)self->_instance;
    if (!instance)
      instance = CFSTR("<any>");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to activate listener for instance %@ of service %@ in domain %@ because the domain was not initialized"), instance, self->_service, self->_domain);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v22;
      v32 = 2114;
      v33 = v24;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("BSServiceConnectionListener.m");
      v38 = 1024;
      v39 = 104;
      v40 = 2114;
      v41 = v21;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8130);
  }
  BSServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (const __CFString *)self->_instance;
    if (!v7)
      v7 = CFSTR("<any>");
    domain = self->_domain;
    service = self->_service;
    *(_DWORD *)buf = 138412802;
    v31 = v7;
    v32 = 2112;
    v33 = service;
    v34 = 2112;
    v35 = (BSServiceConnectionListener *)domain;
    _os_log_impl(&dword_19A799000, v6, OS_LOG_TYPE_INFO, "activating listener for instance %@ of service %@ in domain %@", buf, 0x20u);
  }

  -[BSServiceDomain registerListener:]((uint64_t)v5, self);
  v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  registrationLock_assertion = self->_registrationLock_assertion;
  self->_registrationLock_assertion = v10;

  if (!self->_registrationLock_assertion)
  {
    v25 = (const __CFString *)self->_instance;
    if (!v25)
      v25 = CFSTR("<any>");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to register listener for instance %@ of service %@ in domain %@"), v25, self->_service, self->_domain);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v27;
      v32 = 2114;
      v33 = v29;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("BSServiceConnectionListener.m");
      v38 = 1024;
      v39 = 107;
      v40 = 2114;
      v41 = v26;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8244);
  }
  os_unfair_lock_unlock(&self->_registrationLock);

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BSServiceConnectionListenerDelegate *lock_delegate;
  NSObject *v5;
  NSString *service;
  NSString *domain;
  int v8;
  NSString *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
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
    BSServiceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      domain = self->_domain;
      service = self->_service;
      v8 = 138412546;
      v9 = service;
      v10 = 2112;
      v11 = domain;
      _os_log_impl(&dword_19A799000, v5, OS_LOG_TYPE_INFO, "invalidated listener for service %@ in domain %@", (uint8_t *)&v8, 0x16u);
    }

    os_unfair_lock_unlock(&self->_registrationLock);
  }
}

+ (id)extendBootstrap
{
  os_unfair_lock_s *v2;
  void *v3;

  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[BSServiceManager extendAutomaticBootstrapCompletion](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDomain:(id)a3
{
  id v5;
  NSString *v6;
  NSString *domain;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BSServiceConnectionListener *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServiceConnectionListener.m");
      v24 = 1024;
      v25 = 143;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8600);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServiceConnectionListener.m");
      v24 = 1024;
      v25 = 143;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8700);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");
  domain = self->_domain;
  self->_domain = v6;

}

- (void)setService:(id)a3
{
  id v5;
  NSString *v6;
  NSString *service;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BSServiceConnectionListener *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServiceConnectionListener.m");
      v24 = 1024;
      v25 = 149;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8908);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServiceConnectionListener.m");
      v24 = 1024;
      v25 = 149;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8A08);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");
  service = self->_service;
  self->_service = v6;

}

- (void)setInstance:(id)a3
{
  id v5;
  NSString *v6;
  NSString *instance;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BSServiceConnectionListener *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServiceConnectionListener.m");
      v24 = 1024;
      v25 = 155;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8C10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServiceConnectionListener.m");
      v24 = 1024;
      v25 = 155;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8D10);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");
  instance = self->_instance;
  self->_instance = v6;

}

- (void)setDelegate:(id)a3
{
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BSServiceConnectionListener *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v7;
      v12 = 2114;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BSServiceConnectionListener.m");
      v18 = 1024;
      v19 = 161;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D8EE8);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  objc_storeStrong((id *)&self->_lock_delegate, a3);
}

- (NSString)description
{
  void *v3;
  os_unfair_lock_s *p_lock;
  const __CFString *v5;
  BSServiceConnectionListenerDelegate *v6;
  void *v7;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_domain, CFSTR("domain"));
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
    v5 = CFSTR("inactive");
    goto LABEL_3;
  }
  v6 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("delegate"));
    goto LABEL_5;
  }
  v5 = 0;
LABEL_4:
  v6 = 0;
  objc_msgSend(v3, "appendString:withName:", v5, 0);
LABEL_5:
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_endpoint, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_registrationLock_assertion, 0);
  objc_storeStrong((id *)&self->_lock_delegate, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
