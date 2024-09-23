@implementation BSXPCServiceConnectionListener

void __51__BSXPCServiceConnectionListener_activateSuspended__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _BYTE v19[24];
  void *v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = MEMORY[0x19AECADB4](a2);
  if (v8 != MEMORY[0x1E0C812E0])
  {
    if (v8 == MEMORY[0x1E0C81310])
    {
      *(_QWORD *)v19 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v19[8] = 3221225472;
      *(_QWORD *)&v19[16] = ____handleEvent_block_invoke_184;
      v20 = &unk_1E390DCD8;
      v21 = v6;
      v22 = a2;
      -[BSXPCServiceConnectionListener _invalidateWithLockBlock:]((uint64_t)WeakRetained, (uint64_t)v19);
      if (v7)
      {
        BSServiceConnectionErrorCreate(2uLL, a2, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);

      }
    }
    else
    {
      BSServiceXPCErrorsLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v19 = 138543618;
        *(_QWORD *)&v19[4] = v6;
        *(_WORD *)&v19[12] = 2112;
        *(_QWORD *)&v19[14] = a2;
        _os_log_impl(&dword_19A799000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ unexpected event (%@)", v19, 0x16u);
      }

    }
    goto LABEL_25;
  }
  if (!WeakRetained)
  {
    BSServiceXPCLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v6;
      _os_log_impl(&dword_19A799000, v12, OS_LOG_TYPE_INFO, "%{public}@ Rejecting incoming connection after listener deallocation", v19, 0xCu);
    }

    goto LABEL_24;
  }
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
  if (*((_BYTE *)WeakRetained + 117))
  {
    BSServiceXPCLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v6;
      _os_log_impl(&dword_19A799000, v10, OS_LOG_TYPE_INFO, "%{public}@ Rejecting incoming connection after invalidation", v19, 0xCu);
    }
LABEL_23:

    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);
LABEL_24:
    +[BSXPCServiceConnection _invalidateIncomingXPCConnection:]((uint64_t)BSXPCServiceConnection, a2);
    goto LABEL_25;
  }
  +[BSXPCServiceConnection _connectionWithIncomingXPCConnection:endpointDescription:]((uint64_t)BSXPCServiceConnection, a2, *((void **)WeakRetained + 6));
  v13 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    BSServiceXPCErrorsLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v6;
      _os_log_error_impl(&dword_19A799000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to wrap incoming connection - invalidating", v19, 0xCu);
    }
    goto LABEL_23;
  }
  objc_msgSend(*((id *)WeakRetained + 12), "addObject:", v13);
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);
  -[BSXPCServiceConnection _setParent:]((uint64_t)v13, WeakRetained);
  *(_QWORD *)v19 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v19[8] = 3221225472;
  *(_QWORD *)&v19[16] = ____handleEvent_block_invoke;
  v20 = &unk_1E390DD48;
  v21 = WeakRetained;
  -[BSXPCServiceConnection configure:]((uint64_t)v13, (uint64_t)v19);
  BSServiceXPCLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v13[22];
    v16 = v15;
    if (v15)
      v17 = (void *)*((_QWORD *)v15 + 1);
    else
      v17 = 0;
    v18 = v17;
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_19A799000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Incoming connection %{public}@", buf, 0x16u);

  }
  (*(void (**)(uint64_t, id *))(v5 + 16))(v5, v13);

LABEL_25:
}

- (void)_invalidateChildConnection:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSHashTable containsObject:](self->_lock_childConnections, "containsObject:", a3))
    -[NSHashTable removeObject:](self->_lock_childConnections, "removeObject:", a3);
  os_unfair_lock_unlock(p_lock);
  -[BSXPCServiceConnection _setParent:]((uint64_t)a3, 0);
}

- (BSXPCServiceConnectionListener)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSXPCServiceConnectionListener *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSXPCServiceConnectionListener *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSXPCServiceConnectionListener"));
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
    v16 = CFSTR("BSXPCServiceConnectionListener.m");
    v17 = 1024;
    v18 = 55;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSXPCServiceConnectionListener *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (_BYTE)_initWithServiceName:(char)a3 isXPCService:
{
  unint64_t v5;
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  do
  {
    v5 = __ldxr(&_initWithServiceName_isXPCService____uniqueCounter);
    v6 = v5 + 1;
  }
  while (__stxr(v5 + 1, &_initWithServiceName_isXPCService____uniqueCounter));
  v20.receiver = a1;
  v20.super_class = (Class)BSXPCServiceConnectionListener;
  v7 = objc_msgSendSuper2(&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7[112] = a3;
    v9 = objc_msgSend(a2, "copy");
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    *((_QWORD *)v8 + 2) = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[L:%llx]"), v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v11;

    *((_DWORD *)v8 + 8) = 0;
    if (*((_QWORD *)v8 + 1))
      v13 = (__CFString *)*((_QWORD *)v8 + 1);
    else
      v13 = CFSTR("<anonymous>");
    objc_storeStrong((id *)v8 + 6, v13);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v8 + 12);
    *((_QWORD *)v8 + 12) = v14;

    BSServiceXPCLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *((_QWORD *)v8 + 3);
      v18 = *((_QWORD *)v8 + 6);
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_19A799000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Alloc (%@)", buf, 0x16u);
    }

  }
  return v8;
}

- (void)dealloc
{
  NSObject *v4;
  NSString *proem;
  NSString *lock_debugDesc;
  void *v7;
  NSString *v8;
  objc_class *v9;
  NSString *v10;
  objc_super v11;
  uint8_t buf[4];
  NSString *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  BSXPCServiceConnectionListener *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  BSServiceXPCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    proem = self->_proem;
    lock_debugDesc = self->_lock_debugDesc;
    if (!lock_debugDesc)
      lock_debugDesc = self->_config_eDesc;
    *(_DWORD *)buf = 138543618;
    v13 = proem;
    v14 = 2112;
    v15 = lock_debugDesc;
    _os_log_impl(&dword_19A799000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Dealloc %@", buf, 0x16u);
  }

  if (!self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must be invalidated before dealloc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v8;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSXPCServiceConnectionListener.m");
      v20 = 1024;
      v21 = 79;
      v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D2930);
  }
  v11.receiver = self;
  v11.super_class = (Class)BSXPCServiceConnectionListener;
  -[BSXPCServiceConnectionListener dealloc](&v11, sel_dealloc);
}

+ (_BYTE)listener
{
  objc_opt_self();
  return -[BSXPCServiceConnectionListener _initWithServiceName:isXPCService:]([BSXPCServiceConnectionListener alloc], 0, 0);
}

+ (_BYTE)listenerWithServiceName:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_self();
  v4 = a2;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_listenerWithServiceName_);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v7;
      v16 = 2114;
      v17 = v9;
      v18 = 2048;
      v19 = v3;
      v20 = 2114;
      v21 = CFSTR("BSXPCServiceConnectionListener.m");
      v22 = 1024;
      v23 = 89;
      v24 = 2114;
      v25 = v6;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D2B64);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_listenerWithServiceName_);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2048;
      v19 = v3;
      v20 = 2114;
      v21 = CFSTR("BSXPCServiceConnectionListener.m");
      v22 = 1024;
      v23 = 89;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D2C64);
  }

  return -[BSXPCServiceConnectionListener _initWithServiceName:isXPCService:]([BSXPCServiceConnectionListener alloc], v4, 0);
}

+ (_BYTE)XPCServiceListener
{
  objc_opt_self();
  return -[BSXPCServiceConnectionListener _initWithServiceName:isXPCService:]([BSXPCServiceConnectionListener alloc], 0, 1);
}

+ (_BYTE)XPCServiceListenerWithSubserviceName:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_self();
  v4 = a2;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_XPCServiceListenerWithSubserviceName_);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v7;
      v16 = 2114;
      v17 = v9;
      v18 = 2048;
      v19 = v3;
      v20 = 2114;
      v21 = CFSTR("BSXPCServiceConnectionListener.m");
      v22 = 1024;
      v23 = 98;
      v24 = 2114;
      v25 = v6;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D2EA4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_XPCServiceListenerWithSubserviceName_);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2048;
      v19 = v3;
      v20 = 2114;
      v21 = CFSTR("BSXPCServiceConnectionListener.m");
      v22 = 1024;
      v23 = 98;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D2FA4);
  }

  return -[BSXPCServiceConnectionListener _initWithServiceName:isXPCService:]([BSXPCServiceConnectionListener alloc], v4, 1);
}

- (id)endpoint
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 8;
    os_unfair_lock_lock(a1 + 8);
    -[BSXPCServiceConnectionListener _lock_ensureEndpoint]((uint64_t)v1);
    v1 = (id *)v1[13];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_lock_ensureEndpoint
{
  _xpc_connection_s *v2;
  xpc_endpoint_t v3;
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  uint8_t buf[4];
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
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    if (!*(_QWORD *)(a1 + 104))
    {
      v2 = *(_xpc_connection_s **)(a1 + 88);
      if (!v2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sanity - this shouldn't be possible"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__lock_ensureEndpoint);
          v6 = (id)objc_claimAutoreleasedReturnValue();
          v7 = (objc_class *)objc_opt_class();
          NSStringFromClass(v7);
          *(_DWORD *)buf = 138544642;
          v14 = v6;
          v15 = 2114;
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v8;
          v17 = 2048;
          v18 = a1;
          v19 = 2114;
          v20 = CFSTR("BSXPCServiceConnectionListener.m");
          v21 = 1024;
          v22 = 298;
          v23 = 2114;
          v24 = v5;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7D31F4);
      }
      v3 = xpc_endpoint_create(v2);
      v4 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v3;

      if (!*(_QWORD *)(a1 + 104))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to retrieve an endpoint from listener=%@"), *(_QWORD *)(a1 + 88));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__lock_ensureEndpoint);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          *(_DWORD *)buf = 138544642;
          v14 = v10;
          v15 = 2114;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v12;
          v17 = 2048;
          v18 = a1;
          v19 = 2114;
          v20 = CFSTR("BSXPCServiceConnectionListener.m");
          v21 = 1024;
          v22 = 300;
          v23 = 2114;
          v24 = v9;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7D32F4);
      }
      if (xpc_connection_get_bs_type() == 3)
        *(_BYTE *)(a1 + 113) = 1;
    }
  }
}

- (uint64_t)isNonLaunching
{
  uint64_t v1;
  os_unfair_lock_s *v2;

  v1 = (uint64_t)a1;
  if (a1)
  {
    v2 = a1 + 8;
    os_unfair_lock_lock(a1 + 8);
    -[BSXPCServiceConnectionListener _lock_ensureEndpoint](v1);
    v1 = *(_BYTE *)(v1 + 113) != 0;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)configure:(uint64_t)a1
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v21 = v5;
        v22 = 2114;
        v23 = v7;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = CFSTR("BSXPCServiceConnectionListener.m");
        v28 = 1024;
        v29 = 119;
        v30 = 2114;
        v31 = v4;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D3520);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(_BYTE *)(a1 + 114))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot configure after sealing"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v21 = v9;
        v22 = 2114;
        v23 = v11;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = CFSTR("BSXPCServiceConnectionListener.m");
        v28 = 1024;
        v29 = 121;
        v30 = 2114;
        v31 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D3618);
    }
    if (*(_BYTE *)(a1 + 118))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot configure after invalidation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v21 = v13;
        v22 = 2114;
        v23 = v15;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = CFSTR("BSXPCServiceConnectionListener.m");
        v28 = 1024;
        v29 = 122;
        v30 = 2114;
        v31 = v12;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D3710);
    }
    if (*(_BYTE *)(a1 + 117))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sanity - this shouldn't be possible"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v21 = v17;
        v22 = 2114;
        v23 = v19;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = CFSTR("BSXPCServiceConnectionListener.m");
        v28 = 1024;
        v29 = 123;
        v30 = 2114;
        v31 = v16;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D3808);
    }
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  }
}

- (void)activateSuspended
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t bs_service_listener;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _xpc_connection_s *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  xpc_connection_t v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id v37;
  objc_class *v38;
  void *v39;
  void *v40;
  id v41;
  objc_class *v42;
  void *v43;
  _QWORD handler[4];
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(_BYTE *)(a1 + 115))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot seal after activation"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateSuspended);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v29;
        v51 = 2114;
        v52 = v31;
        v53 = 2048;
        v54 = a1;
        v55 = 2114;
        v56 = CFSTR("BSXPCServiceConnectionListener.m");
        v57 = 1024;
        v58 = 130;
        v59 = 2114;
        v60 = v28;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D3CA4);
    }
    if (*(_BYTE *)(a1 + 118))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot seal after invalidation"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateSuspended);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v33;
        v51 = 2114;
        v52 = v35;
        v53 = 2048;
        v54 = a1;
        v55 = 2114;
        v56 = CFSTR("BSXPCServiceConnectionListener.m");
        v57 = 1024;
        v58 = 131;
        v59 = 2114;
        v60 = v32;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D3D9CLL);
    }
    if (*(_BYTE *)(a1 + 114))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot seal twice"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateSuspended);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v37;
        v51 = 2114;
        v52 = v39;
        v53 = 2048;
        v54 = a1;
        v55 = 2114;
        v56 = CFSTR("BSXPCServiceConnectionListener.m");
        v57 = 1024;
        v58 = 132;
        v59 = 2114;
        v60 = v36;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D3E94);
    }
    if (!*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("connection handler must be set before sealing"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateSuspended);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v41;
        v51 = 2114;
        v52 = v43;
        v53 = 2048;
        v54 = a1;
        v55 = 2114;
        v56 = CFSTR("BSXPCServiceConnectionListener.m");
        v57 = 1024;
        v58 = 133;
        v59 = 2114;
        v60 = v40;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D3F8CLL);
    }
    *(_BYTE *)(a1 + 114) = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSXPCLsn:%llx:%@"), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 48));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v3;

    BSServiceXPCLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 24);
      v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v50 = v6;
      v51 = 2112;
      v52 = v7;
      _os_log_impl(&dword_19A799000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Sealed %@", buf, 0x16u);
    }

    v8 = *(void **)(a1 + 56);
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      +[BSServiceQuality userInitiated](BSServiceQuality, "userInitiated");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceClass:relativePriority:", objc_msgSend(v10, "serviceClass"), objc_msgSend(v10, "relativePriority"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = BSDispatchQueueCreate();
    v14 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v13;

    v15 = *(void **)(a1 + 8);
    if (*(_BYTE *)(a1 + 112))
    {
      objc_msgSend(v15, "UTF8String");
      bs_service_listener = xpc_connection_create_bs_service_listener();
    }
    else
    {
      if (!v15)
      {
        v27 = xpc_connection_create(0, *(dispatch_queue_t *)(a1 + 80));
        v17 = *(void **)(a1 + 88);
        *(_QWORD *)(a1 + 88) = v27;
        goto LABEL_16;
      }
      bs_service_listener = (uint64_t)xpc_connection_create_mach_service((const char *)objc_msgSend(v15, "UTF8String"), *(dispatch_queue_t *)(a1 + 80), 1uLL);
    }
    v17 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = bs_service_listener;
LABEL_16:

    xpc_connection_set_bs_type();
    objc_initWeak((id *)buf, (id)a1);
    v18 = *(id *)(a1 + 24);
    v19 = (void *)MEMORY[0x19AECAA00](*(_QWORD *)(a1 + 64));
    v20 = (void *)MEMORY[0x19AECAA00](*(_QWORD *)(a1 + 72));
    v21 = *(_xpc_connection_s **)(a1 + 88);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __51__BSXPCServiceConnectionListener_activateSuspended__block_invoke;
    handler[3] = &unk_1E390DC68;
    objc_copyWeak(&v48, (id *)buf);
    v45 = v18;
    v46 = v19;
    v47 = v20;
    v22 = v20;
    v23 = v19;
    v24 = v18;
    xpc_connection_set_event_handler(v21, handler);
    v25 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v26 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    os_unfair_lock_unlock(v2);
    objc_destroyWeak(&v48);

    objc_destroyWeak((id *)buf);
  }
}

- (void)resume
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  xpc_endpoint_t v9;
  int bs_type;
  uint64_t v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(_BYTE *)(a1 + 118))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot resume after invalidation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_resume);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v33 = v13;
        v34 = 2114;
        v35 = v15;
        v36 = 2048;
        v37 = a1;
        v38 = 2114;
        v39 = CFSTR("BSXPCServiceConnectionListener.m");
        v40 = 1024;
        v41 = 167;
        v42 = 2114;
        v43 = v12;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D4320);
    }
    if (!*(_BYTE *)(a1 + 114))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must be activated before resume"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_resume);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v33 = v17;
        v34 = 2114;
        v35 = v19;
        v36 = 2048;
        v37 = a1;
        v38 = 2114;
        v39 = CFSTR("BSXPCServiceConnectionListener.m");
        v40 = 1024;
        v41 = 168;
        v42 = 2114;
        v43 = v16;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D4418);
    }
    if (*(_BYTE *)(a1 + 116))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must call suspend before calling resume a second time"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_resume);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v33 = v21;
        v34 = 2114;
        v35 = v23;
        v36 = 2048;
        v37 = a1;
        v38 = 2114;
        v39 = CFSTR("BSXPCServiceConnectionListener.m");
        v40 = 1024;
        v41 = 169;
        v42 = 2114;
        v43 = v20;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D4510);
    }
    *(_BYTE *)(a1 + 116) = 1;
    if (!*(_BYTE *)(a1 + 117))
    {
      if (*(_BYTE *)(a1 + 115))
      {
        BSServiceXPCLog();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v4 = *(void **)(a1 + 24);
          v5 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v33 = v4;
          v34 = 2112;
          v35 = v5;
          _os_log_impl(&dword_19A799000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Resumed %@", buf, 0x16u);
        }

        xpc_connection_resume(*(xpc_connection_t *)(a1 + 88));
      }
      else
      {
        *(_BYTE *)(a1 + 115) = 1;
        BSServiceXPCLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(void **)(a1 + 24);
          v8 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v33 = v7;
          v34 = 2112;
          v35 = v8;
          _os_log_impl(&dword_19A799000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Activated %@", buf, 0x16u);
        }

        if (!*(_BYTE *)(a1 + 112))
        {
          xpc_connection_activate(*(xpc_connection_t *)(a1 + 88));
          if (*(_QWORD *)(a1 + 104))
          {
            v9 = xpc_endpoint_create(*(xpc_connection_t *)(a1 + 88));
            bs_type = xpc_connection_get_bs_type();
            if (!xpc_equal(*(xpc_object_t *)(a1 + 104), v9))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("activation endpoint is not equivalent to previous sealing endpoint : new=%@ old=%@"), v9, *(_QWORD *)(a1 + 104));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel_resume);
                v25 = (id)objc_claimAutoreleasedReturnValue();
                v26 = (objc_class *)objc_opt_class();
                NSStringFromClass(v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                v33 = v25;
                v34 = 2114;
                v35 = v27;
                v36 = 2048;
                v37 = a1;
                v38 = 2114;
                v39 = CFSTR("BSXPCServiceConnectionListener.m");
                v40 = 1024;
                v41 = 187;
                v42 = 2114;
                v43 = v24;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7D460CLL);
            }
            v11 = *(unsigned __int8 *)(a1 + 113);
            if ((_DWORD)v11 != (bs_type == 3))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("activation endpoint is not the same bs_type as the previous sealing endpoint : new=%{BOOL}i old=%{BOOL}i"), bs_type == 3, v11);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel_resume);
                v29 = (id)objc_claimAutoreleasedReturnValue();
                v30 = (objc_class *)objc_opt_class();
                NSStringFromClass(v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                v33 = v29;
                v34 = 2114;
                v35 = v31;
                v36 = 2048;
                v37 = a1;
                v38 = 2114;
                v39 = CFSTR("BSXPCServiceConnectionListener.m");
                v40 = 1024;
                v41 = 188;
                v42 = 2114;
                v43 = v28;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7D4704);
            }

          }
          else
          {
            -[BSXPCServiceConnectionListener _lock_ensureEndpoint](a1);
          }
        }
      }
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)suspendWithCompletion:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  _QWORD v28[6];
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
  if (a1)
  {
    if (*(_BYTE *)(a1 + 112))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xpc services cannot be suspended"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
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
        v36 = CFSTR("BSXPCServiceConnectionListener.m");
        v37 = 1024;
        v38 = 199;
        v39 = 2114;
        v40 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D49E4);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(_BYTE *)(a1 + 118))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot suspend after invalidation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v13;
        v31 = 2114;
        v32 = v15;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSXPCServiceConnectionListener.m");
        v37 = 1024;
        v38 = 201;
        v39 = 2114;
        v40 = v12;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D4ADCLL);
    }
    if (!*(_BYTE *)(a1 + 116))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must call resume before calling suspend"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v17;
        v31 = 2114;
        v32 = v19;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSXPCServiceConnectionListener.m");
        v37 = 1024;
        v38 = 202;
        v39 = 2114;
        v40 = v16;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D4BD4);
    }
    if (!*(_BYTE *)(a1 + 114))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sanity - this shouldn't be possible"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v21;
        v31 = 2114;
        v32 = v23;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSXPCServiceConnectionListener.m");
        v37 = 1024;
        v38 = 203;
        v39 = 2114;
        v40 = v20;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D4CCCLL);
    }
    if (!*(_BYTE *)(a1 + 115))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sanity - this shouldn't be possible"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v25;
        v31 = 2114;
        v32 = v27;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSXPCServiceConnectionListener.m");
        v37 = 1024;
        v38 = 204;
        v39 = 2114;
        v40 = v24;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D4DC4);
    }
    *(_BYTE *)(a1 + 116) = 0;
    if (!*(_BYTE *)(a1 + 117))
    {
      xpc_connection_suspend(*(xpc_connection_t *)(a1 + 88));
      BSServiceXPCLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(void **)(a1 + 24);
        v6 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v30 = v5;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_19A799000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Suspended %@", buf, 0x16u);
      }

    }
    v7 = *(NSObject **)(a1 + 80);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __56__BSXPCServiceConnectionListener_suspendWithCompletion___block_invoke;
    v28[3] = &unk_1E390DD00;
    v28[4] = a1;
    v28[5] = a2;
    dispatch_async(v7, v28);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  }
}

uint64_t __56__BSXPCServiceConnectionListener_suspendWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 117))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(v2 + 96);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), 1);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  return result;
}

- (void)invalidate
{
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
  BSXPCServiceConnectionListener *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_isXPCService)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xpc services cannot invalidate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BSXPCServiceConnectionListener.m");
      v17 = 1024;
      v18 = 226;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D50F8);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__BSXPCServiceConnectionListener_invalidate__block_invoke;
  v8[3] = &unk_1E390DC90;
  v8[4] = self;
  v8[5] = a2;
  -[BSXPCServiceConnectionListener _invalidateWithLockBlock:]((uint64_t)self, (uint64_t)v8);
}

uint64_t __44__BSXPCServiceConnectionListener_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 118))
  {
    v2 = result;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot invalidate twice"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(v2 + 40));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(v2 + 32);
      v8 = 138544642;
      v9 = v4;
      v10 = 2114;
      v11 = v6;
      v12 = 2048;
      v13 = v7;
      v14 = 2114;
      v15 = CFSTR("BSXPCServiceConnectionListener.m");
      v16 = 1024;
      v17 = 228;
      v18 = 2114;
      v19 = v3;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D528CLL);
  }
  *(_BYTE *)(v1 + 118) = 1;
  return result;
}

- (void)_invalidateWithLockBlock:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  BOOL v5;
  BOOL v6;
  _xpc_connection_s *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
    if (*(_BYTE *)(a1 + 117))
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
    }
    else
    {
      *(_BYTE *)(a1 + 117) = 1;
      v8 = *(id *)(a1 + 96);
      v9 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = 0;

      v7 = (_xpc_connection_s *)*(id *)(a1 + 88);
      if (!*(_BYTE *)(a1 + 112))
      {
        v10 = *(void **)(a1 + 88);
        *(_QWORD *)(a1 + 88) = 0;

      }
      v11 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

      v12 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      v5 = *(_BYTE *)(a1 + 115) != 0;
      v6 = *(_BYTE *)(a1 + 116) != 0;
    }
    os_unfair_lock_unlock(v4);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v13);
          -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16++), 0);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

    if (v7)
    {
      xpc_connection_set_event_handler(v7, &__block_literal_global_86);
      if (*(_BYTE *)(a1 + 112))
      {
        BSServiceXPCErrorsLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 24);
          v19 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          v25 = v18;
          v26 = 2114;
          v27 = v19;
          _os_log_impl(&dword_19A799000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ xpc-service %{public}@ is now impotent", buf, 0x16u);
        }

      }
      else
      {
        xpc_connection_cancel(v7);
        if (v5)
        {
          if (!v6)
            xpc_connection_resume(v7);
        }
        else
        {
          xpc_connection_activate(v7);
        }
      }
    }

  }
}

- (void)setEndpointDescription:(id)a3
{
  id v5;
  NSString *v6;
  NSString *config_eDesc;
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
  BSXPCServiceConnectionListener *v21;
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
      v23 = CFSTR("BSXPCServiceConnectionListener.m");
      v24 = 1024;
      v25 = 245;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D56F4);
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
      v23 = CFSTR("BSXPCServiceConnectionListener.m");
      v24 = 1024;
      v25 = 245;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D57F4);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");
  config_eDesc = self->_config_eDesc;
  self->_config_eDesc = v6;

}

- (void)setServiceQuality:(id)a3
{
  id v5;
  BSServiceQuality *v6;
  BSServiceQuality *config_qos;
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
  BSXPCServiceConnectionListener *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("BSServiceQuality"));
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
      v23 = CFSTR("BSXPCServiceConnectionListener.m");
      v24 = 1024;
      v25 = 251;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D59FCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceQualityClass]"));
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
      v23 = CFSTR("BSXPCServiceConnectionListener.m");
      v24 = 1024;
      v25 = 251;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D5AFCLL);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  v6 = (BSServiceQuality *)objc_msgSend(v5, "copy");
  config_qos = self->_config_qos;
  self->_config_qos = v6;

}

- (void)setConnectionHandler:(id)a3
{
  void *v5;
  id lock_connectionHandler;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSXPCServiceConnectionListener *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSXPCServiceConnectionListener.m");
      v20 = 1024;
      v21 = 257;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D5CD8);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (void *)MEMORY[0x19AECAA00](a3);
  lock_connectionHandler = self->_lock_connectionHandler;
  self->_lock_connectionHandler = v5;

}

- (void)setErrorHandler:(id)a3
{
  void *v5;
  id lock_errorHandler;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSXPCServiceConnectionListener *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSXPCServiceConnectionListener.m");
      v20 = 1024;
      v21 = 263;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D5E80);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (void *)MEMORY[0x19AECAA00](a3);
  lock_errorHandler = self->_lock_errorHandler;
  self->_lock_errorHandler = v5;

}

- (BOOL)_isInvalidated
{
  BSXPCServiceConnectionListener *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_isClientInvalidated
{
  BSXPCServiceConnectionListener *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_clientInvalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __59__BSXPCServiceConnectionListener__invalidateWithLockBlock___block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x19AECADB4](a2) == MEMORY[0x1E0C812E0])
    +[BSXPCServiceConnection _invalidateIncomingXPCConnection:]((uint64_t)BSXPCServiceConnection, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_endpoint, 0);
  objc_storeStrong((id *)&self->_lock_childConnections, 0);
  objc_storeStrong((id *)&self->_lock_listener, 0);
  objc_storeStrong((id *)&self->_lock_queue, 0);
  objc_storeStrong(&self->_lock_errorHandler, 0);
  objc_storeStrong(&self->_lock_connectionHandler, 0);
  objc_storeStrong((id *)&self->_config_qos, 0);
  objc_storeStrong((id *)&self->_config_eDesc, 0);
  objc_storeStrong((id *)&self->_lock_debugDesc, 0);
  objc_storeStrong((id *)&self->_proem, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
