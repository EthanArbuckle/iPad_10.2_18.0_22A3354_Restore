@implementation BSXPCServiceConnection

+ (id)connectionWithConnection:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  id v5;
  BSXPCServiceConnection *v6;
  void *v7;
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
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_self();
  v4 = a2;
  NSClassFromString(CFSTR("BSXPCServiceConnection"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithConnection_);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v23 = v11;
      v24 = 2114;
      v25 = v13;
      v26 = 2048;
      v27 = v3;
      v28 = 2114;
      v29 = CFSTR("BSXPCServiceConnection.m");
      v30 = 1024;
      v31 = 143;
      v32 = 2114;
      v33 = v10;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79ADA4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSXPCServiceConnectionClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithConnection_);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v23 = v15;
      v24 = 2114;
      v25 = v17;
      v26 = 2048;
      v27 = v3;
      v28 = 2114;
      v29 = CFSTR("BSXPCServiceConnection.m");
      v30 = 1024;
      v31 = 143;
      v32 = 2114;
      v33 = v14;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79AEA4);
  }

  v5 = *((id *)v4 + 22);
  if ((objc_msgSend(v5, "isRoot") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this connection (%@) is not a valid type for a parent connection"), v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithConnection_);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v23 = v19;
      v24 = 2114;
      v25 = v21;
      v26 = 2048;
      v27 = v3;
      v28 = 2114;
      v29 = CFSTR("BSXPCServiceConnection.m");
      v30 = 1024;
      v31 = 145;
      v32 = 2114;
      v33 = v18;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79AF9CLL);
  }
  v6 = [BSXPCServiceConnection alloc];
  -[BSXPCServiceConnectionRootContext uniqueChildContext]((char *)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v6->super.isa, v7, *((void **)v4 + 21));

  os_unfair_lock_lock((os_unfair_lock_t)v4 + 4);
  -[BSXPCServiceConnection _lock_associateNewChildConnection:]((uint64_t)v4, (uint64_t)v8);
  os_unfair_lock_unlock((os_unfair_lock_t)v4 + 4);

  return v8;
}

- (id)_initWithContext:(void *)a3 assertionTarget:
{
  id *v3;
  id *v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v3 = a1;
  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("context"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithContext_assertionTarget_);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v23 = v18;
        v24 = 2114;
        v25 = v20;
        v26 = 2048;
        v27 = v3;
        v28 = 2114;
        v29 = CFSTR("BSXPCServiceConnection.m");
        v30 = 1024;
        v31 = 101;
        v32 = 2114;
        v33 = v17;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A79B2D4);
    }
    v21.receiver = a1;
    v21.super_class = (Class)BSXPCServiceConnection;
    v6 = (id *)objc_msgSendSuper2(&v21, sel_init);
    v3 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 22, a2);
      v7 = objc_msgSend(a3, "copy");
      v8 = v3[21];
      v3[21] = (id)v7;

      v9 = v3[22];
      if (v9)
        v10 = (void *)v9[1];
      else
        v10 = 0;
      objc_storeStrong(v3 + 1, v10);
      v3[2] = 0;
      *((_DWORD *)v3 + 6) = 0;
      v11 = -[BSXPCServiceConnectionEventHandler initWithAssertionTarget:]([BSXPCServiceConnectionEventHandler alloc], v3[21]);
      v12 = v3[18];
      v3[18] = v11;

      BSServiceXPCLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v3[1];
        objc_msgSend(v3[22], "endpointDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_19A799000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Alloc %@", buf, 0x16u);

      }
    }
  }
  return v3;
}

- (void)_lock_associateNewChildConnection:(uint64_t)a1
{
  uint64_t *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  uint64_t *v21;
  void *v22;
  id v23;
  objc_class *v24;
  uint64_t *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  objc_class *v30;
  uint64_t *v31;
  void *v32;
  id v33;
  objc_class *v34;
  uint64_t *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if (!*(_BYTE *)(a1 + 160))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Parent connection must be configured before associating children"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__lock_associateNewChildConnection_);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v37 = v19;
      v38 = 2114;
      v39 = v21;
      v40 = 2048;
      v41 = a1;
      v42 = 2114;
      v43 = CFSTR("BSXPCServiceConnection.m");
      v44 = 1024;
      v45 = 910;
      v46 = 2114;
      v47 = v18;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79BC4CLL);
  }
  objc_storeStrong((id *)(a2 + 48), *(id *)(a1 + 48));
  if (*(_BYTE *)(a1 + 166))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot associate a child connection with an invalidated root connection"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__lock_associateNewChildConnection_);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v37 = v23;
      v38 = 2114;
      v39 = v25;
      v40 = 2048;
      v41 = a1;
      v42 = 2114;
      v43 = CFSTR("BSXPCServiceConnection.m");
      v44 = 1024;
      v45 = 912;
      v46 = 2114;
      v47 = v22;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79BD44);
  }
  v4 = (uint64_t *)*(id *)(a2 + 176);
  if ((objc_msgSend(v4, "isChild") & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)a2, "description");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v26, "stringWithFormat:", CFSTR("attempt to add a child connection that wasn't a child : %s"), objc_msgSend(v27, "UTF8String"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__lock_associateNewChildConnection_);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v37 = v29;
      v38 = 2114;
      v39 = v31;
      v40 = 2048;
      v41 = a1;
      v42 = 2114;
      v43 = CFSTR("BSXPCServiceConnection.m");
      v44 = 1024;
      v45 = 914;
      v46 = 2114;
      v47 = v28;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79BE5CLL);
  }
  v5 = *(unsigned __int8 *)(a1 + 167);
  BSServiceXPCLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543618;
      v37 = v8;
      v38 = 2114;
      v39 = v4;
      _os_log_impl(&dword_19A799000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Auto-invalidating new child: %{public}@", buf, 0x16u);
    }

    -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](a2, 0);
  }
  else
  {
    if (v7)
    {
      v9 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543618;
      v37 = v9;
      v38 = 2114;
      v39 = v4;
      _os_log_impl(&dword_19A799000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding child: %{public}@", buf, 0x16u);
    }

    v10 = *(void **)(a1 + 88);
    if (!v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v11;

      v10 = *(void **)(a1 + 88);
    }
    if (objc_msgSend(v10, "containsObject:", a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we are already tracking this child"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_associateNewChildConnection_);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (uint64_t *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v37 = v33;
        v38 = 2114;
        v39 = v35;
        v40 = 2048;
        v41 = a1;
        v42 = 2114;
        v43 = CFSTR("BSXPCServiceConnection.m");
        v44 = 1024;
        v45 = 926;
        v46 = 2114;
        v47 = v32;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A79BF50);
    }
    objc_msgSend(*(id *)(a1 + 88), "addObject:", a2);
    -[BSXPCServiceConnection _setParent:](a2, (void *)a1);
    +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, *(void **)(a1 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v4)
      v15 = v4[4];
    else
      v15 = 0;
    -[BSXPCServiceConnectionMessage setChildIdentifier:](v13, v15);
    if (v4)
      v16 = *((_BYTE *)v4 + 24) != 0;
    else
      v16 = 0;
    -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](v14, (const char *)v16);
    v17 = *(void **)(a2 + 128);
    *(_QWORD *)(a2 + 128) = v14;

  }
}

- (void)_setParent:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_storeStrong((id *)(a1 + 152), a2);
    os_unfair_lock_unlock(v4);
  }
}

- (void)_lock_enqueueChildActivateEvent:(uint64_t)a3 forHandoff:
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_enqueueChildActivateEvent_forHandoff_);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v25 = v17;
        v26 = 2114;
        v27 = v19;
        v28 = 2048;
        v29 = a1;
        v30 = 2114;
        v31 = CFSTR("BSXPCServiceConnection.m");
        v32 = 1024;
        v33 = 938;
        v34 = 2114;
        v35 = v16;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A79C80CLL);
    }
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if ((objc_msgSend(*(id *)(a1 + 176), "isChild") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("may only be called on children"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_enqueueChildActivateEvent_forHandoff_);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v25 = v21;
        v26 = 2114;
        v27 = v23;
        v28 = 2048;
        v29 = a1;
        v30 = 2114;
        v31 = CFSTR("BSXPCServiceConnection.m");
        v32 = 1024;
        v33 = 941;
        v34 = 2114;
        v35 = v20;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A79C900);
    }
    if (*(_BYTE *)(a1 + 167))
    {
      BSServiceXPCLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        v25 = v7;
        _os_log_impl(&dword_19A799000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping child activate event because we have been invalidated.", buf, 0xCu);
      }

    }
    else if (*(_BYTE *)(a1 + 160) && *(_BYTE *)(a1 + 161))
    {
      v8 = *(void **)(a1 + 56);
      if (a3)
        objc_msgSend(v8, "performAsync:withHandoff:", a2, a3);
      else
        objc_msgSend(v8, "performAsync:", a2);
    }
    else
    {
      v9 = *(void **)(a1 + 96);
      if (!v9)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = *(void **)(a1 + 96);
        *(_QWORD *)(a1 + 96) = v10;

        v9 = *(void **)(a1 + 96);
      }
      v12 = (void *)objc_msgSend(a2, "copy");
      v13 = (void *)MEMORY[0x19AECAA00]();
      objc_msgSend(v9, "addObject:", v13);

      BSServiceXPCLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        v25 = v15;
        _os_log_impl(&dword_19A799000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Pending event until connection activated.", buf, 0xCu);
      }

    }
  }
}

- (BOOL)_isInvalidated
{
  BSXPCServiceConnection *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateAuditTokenFromReplyMessage:(id)a3 fromActivationGeneration:(unsigned int)a4
{
  os_unfair_lock_s *p_lock;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activated && self->_lock_activationGeneration == a4)
  {
    objc_msgSend(a3, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BSStoreTokenFromMessageToVar();

  }
  os_unfair_lock_unlock(p_lock);
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  void *v7;
  id *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v6 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v6 + 161) && *(_DWORD *)(a1 + 56) == *(_DWORD *)(v6 + 28))
    {
      objc_msgSend(a2, "XPCConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSXPCServiceConnectionPeer peerOfConnection:]((uint64_t)BSXPCServiceConnectionPeer, v7);
      v8 = (id *)objc_claimAutoreleasedReturnValue();

      BSServiceXPCLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (!v10)
      {
LABEL_22:
        -[BSXPCServiceConnection _connection_consumeLock_didActivateWithMessage:fromPeer:](*(_QWORD *)(a1 + 32), a2, v8);

        return;
      }
      if (v8)
      {
        v11 = v8[4];
        v12 = v11;
        if (v11)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "name");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v14)
          {
            objc_msgSend(v12, "bundleIdentifier");
            v16 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v16;
            if (v16)
              v15 = (const __CFString *)v16;
            else
              v15 = CFSTR("?");
          }
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%d"), v15, objc_msgSend(v12, "pid"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)

          goto LABEL_19;
        }
      }
      else
      {
        v12 = 0;
      }
      v17 = 0;
LABEL_19:
      BSServiceXPCLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v23 = v21;
        v24 = 2114;
        v25 = v17;
        _os_log_impl(&dword_19A799000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Got activation reply from server %{public}@", buf, 0x16u);
      }

      goto LABEL_22;
    }
    BSServiceXPCLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v23 = v19;
      _os_log_impl(&dword_19A799000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping activation reply because it is out of date", buf, 0xCu);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  }
}

- (void)_invalidateChildConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  BSXPCServiceConnectionEventHandler *v6;
  BSServiceDispatchingQueue *configured_connectionQueue;
  BSXPCServiceConnectionEventHandler *v8;
  _QWORD v9[4];
  BSXPCServiceConnectionEventHandler *v10;
  BSXPCServiceConnection *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray containsObject:](self->_lock_childConnections, "containsObject:", a3))
  {
    -[NSMutableArray removeObjectIdenticalTo:](self->_lock_childConnections, "removeObjectIdenticalTo:", a3);
    -[BSXPCServiceConnection _setParent:]((uint64_t)a3, 0);
    if (!-[NSMutableArray count](self->_lock_childConnections, "count") && self->_lock_configured)
    {
      v6 = self->_lock_eventHandler;
      configured_connectionQueue = self->_configured_connectionQueue;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__BSXPCServiceConnection__invalidateChildConnection___block_invoke;
      v9[3] = &unk_1E390D478;
      v10 = v6;
      v11 = self;
      v8 = v6;
      -[BSServiceDispatchingQueue performAsync:](configured_connectionQueue, "performAsync:", v9);

    }
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __42__BSXPCServiceConnection__lock_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChildConnection:", *(_QWORD *)(a1 + 40));
}

- (uint64_t)_lock_activateNowOrWhenReady:(const os_unfair_lock *)a1
{
  uint64_t v2;
  const os_unfair_lock *v4;
  char v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  id *v14;
  int v15;
  int v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _xpc_endpoint_s *v46;
  xpc_connection_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id *v53;
  void *v54;
  void *v55;
  _BYTE *v56;
  _QWORD *v57;
  void *v58;
  uint64_t v59;
  _BOOL8 v60;
  id *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  _BOOL8 v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _xpc_connection_s *v71;
  _xpc_connection_s *v72;
  id v73;
  void **v74;
  int v75;
  void *v76;
  _QWORD *v77;
  _QWORD *v78;
  void *v79;
  const char *v80;
  id v81;
  void *v82;
  void *v83;
  _xpc_connection_s *v84;
  uint64_t v85;
  id v86;
  BOOL v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v100;
  id v101;
  objc_class *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  objc_class *v108;
  void *v109;
  void *v110;
  id v111;
  objc_class *v112;
  void *v113;
  void *v114;
  id v115;
  objc_class *v116;
  void *v117;
  void *v118;
  id v119;
  objc_class *v120;
  void *v121;
  void *v122;
  id v123;
  objc_class *v124;
  void *v125;
  void *v126;
  id v127;
  objc_class *v128;
  void *v129;
  void *v130;
  id v131;
  objc_class *v132;
  void *v133;
  void *v134;
  id v135;
  objc_class *v136;
  void *v137;
  const char *aSelector;
  id *v139;
  _QWORD v140[4];
  id v141;
  uint64_t v142;
  _QWORD v143[6];
  _QWORD v144[5];
  id v145;
  uint64_t v146;
  _QWORD v147[5];
  _QWORD newValue[6];
  id v149;
  int v150;
  _QWORD handler[5];
  _QWORD v152[5];
  _QWORD v153[5];
  _BYTE buf[22];
  __int16 v155;
  uint64_t v156;
  __int16 v157;
  const __CFString *v158;
  __int16 v159;
  int v160;
  __int16 v161;
  void *v162;
  uint64_t v163;

  v2 = (uint64_t)a1;
  v163 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v2;
  aSelector = sel__lock_activateNowOrWhenReady_;
  os_unfair_lock_assert_owner(a1 + 4);
  if (objc_msgSend(*(id *)(v2 + 176), "isChild")
    && (v4 = (const os_unfair_lock *)*(id *)(v2 + 152)) != 0)
  {
    v139 = (id *)v4;
    os_unfair_lock_assert_owner(v4 + 4);
    v5 = 0;
  }
  else
  {
    v139 = 0;
    v5 = 1;
  }
  if (!*(_BYTE *)(v2 + 160))
  {
    if (*(_BYTE *)(v2 + 166))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API misuse: connection cannot be activated once invalidated"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
        v111 = (id)objc_claimAutoreleasedReturnValue();
        v112 = (objc_class *)objc_opt_class();
        NSStringFromClass(v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v111;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v113;
        v155 = 2048;
        v156 = v2;
        v157 = 2114;
        v158 = CFSTR("BSXPCServiceConnection.m");
        v159 = 1024;
        v160 = 578;
        v161 = 2114;
        v162 = v110;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v110), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A05BCLL);
    }
    v6 = *(_QWORD *)(v2 + 144);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_eventHandler"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
        v115 = (id)objc_claimAutoreleasedReturnValue();
        v116 = (objc_class *)objc_opt_class();
        NSStringFromClass(v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v115;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v117;
        v155 = 2048;
        v156 = v2;
        v157 = 2114;
        v158 = CFSTR("BSXPCServiceConnection.m");
        v159 = 1024;
        v160 = 580;
        v161 = 2114;
        v162 = v114;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v114), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A06C0);
    }
    if (!*(_QWORD *)(v6 + 112) && !*(_QWORD *)(v6 + 88))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we must have an error or invalidation handler"));
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
        v127 = (id)objc_claimAutoreleasedReturnValue();
        v128 = (objc_class *)objc_opt_class();
        NSStringFromClass(v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v127;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v129;
        v155 = 2048;
        v156 = v2;
        v157 = 2114;
        v158 = CFSTR("BSXPCServiceConnection.m");
        v159 = 1024;
        v160 = 581;
        v161 = 2114;
        v162 = v126;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v126), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A09A8);
    }
    *(_BYTE *)(v2 + 160) = 1;
    objc_msgSend(*(id *)(v2 + 176), "endpointDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD **)(v2 + 144);
    if (v8)
      v8 = (_QWORD *)v8[18];
    v9 = v8;

    if (v9)
    {
      v10 = *(_QWORD **)(v2 + 144);
      if (v10)
        v10 = (_QWORD *)v10[18];
      v11 = v10;
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" (%@)"), v11, sel__lock_activateNowOrWhenReady_);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
    v13 = *(_QWORD **)(v2 + 144);
    if (v13)
      v13 = (_QWORD *)v13[20];
    v14 = v13;
    v15 = objc_msgSend(*(id *)(v2 + 176), "isRoot");
    if (v14)
      v16 = v15;
    else
      v16 = 0;
    if (v16 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Root connections may not specify a <BSServiceDispatchingQueue>."));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v119 = (id)objc_claimAutoreleasedReturnValue();
        v120 = (objc_class *)objc_opt_class();
        NSStringFromClass(v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v119;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v121;
        v155 = 2048;
        v156 = v2;
        v157 = 2114;
        v158 = CFSTR("BSXPCServiceConnection.m");
        v159 = 1024;
        v160 = 590;
        v161 = 2114;
        v162 = v118;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v118), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A07B8);
    }
    if (!v14)
    {
      v17 = *(_QWORD *)(v2 + 144);
      if (v17 && (v18 = *(id *)(v17 + 168)) != 0)
      {
        v19 = v18;
        v20 = v19;
      }
      else
      {
        +[BSServiceQuality userInitiated](BSServiceQuality, "userInitiated");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
      }

      objc_msgSend(MEMORY[0x1E0D01760], "serial");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serviceClass:relativePriority:", objc_msgSend(v20, "serviceClass"), objc_msgSend(v20, "relativePriority"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *(_QWORD **)(v2 + 144);
      if (v23)
        v23 = (_QWORD *)v23[19];
      v24 = v23;

      if (v24)
      {
        v25 = *(_QWORD **)(v2 + 144);
        if (v25)
          v25 = (_QWORD *)v25[19];
        v26 = v25;
        objc_msgSend(v22, "targetQueue:", v26);
        v27 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSXPCCnx:%@"), v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)BSDispatchQueueCreate();

      if (objc_msgSend(*(id *)(v2 + 176), "isRoot"))
        objc_storeStrong((id *)(v2 + 48), v29);
      v14 = -[_BSServiceDispatchingQueueImpl initWithQueue:]((id *)[_BSServiceDispatchingQueueImpl alloc], v29);
      -[BSXPCServiceConnectionEventHandler setTargetQueue:](*(_QWORD *)(v2 + 144), v29);
      -[BSXPCServiceConnectionEventHandler setTargetDispatchingQueue:](*(_QWORD *)(v2 + 144), v14);

    }
    objc_storeStrong((id *)(v2 + 56), v14);
    v30 = *(_QWORD *)(v2 + 144);
    if (v30)
      v31 = *(void **)(v30 + 120);
    else
      v31 = 0;
    objc_storeStrong((id *)(v2 + 64), v31);

  }
  v32 = MEMORY[0x1E0C809B0];
  if (!*(_BYTE *)(v2 + 161))
  {
    v33 = *(_QWORD *)(v2 + 144);
    if (v33)
    {
      v34 = *(id *)(v33 + 144);

      BSServiceXPCLog();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v36)
        {
          v37 = *(_QWORD *)(v2 + 8);
          v38 = *(_QWORD **)(v2 + 144);
          if (v38)
            v38 = (_QWORD *)v38[18];
          v39 = v38;
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v39;
          _os_log_impl(&dword_19A799000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Client activate (\"%{public}@\").", buf, 0x16u);

        }
      }
      else if (v36)
      {
        v42 = *(_QWORD *)(v2 + 8);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v42;
        _os_log_impl(&dword_19A799000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Client activate.", buf, 0xCu);
      }

      *(_BYTE *)(v2 + 161) = 1;
      ++*(_DWORD *)(v2 + 28);
    }
    else
    {
      if (!*(_BYTE *)(v2 + 167))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must be invalidated if there is no event handler"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          v123 = (id)objc_claimAutoreleasedReturnValue();
          v124 = (objc_class *)objc_opt_class();
          NSStringFromClass(v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v123;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v125;
          v155 = 2048;
          v156 = v2;
          v157 = 2114;
          v158 = CFSTR("BSXPCServiceConnection.m");
          v159 = 1024;
          v160 = 623;
          v161 = 2114;
          v162 = v122;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v122), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7A08B0);
      }
      BSServiceXPCLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = *(_QWORD *)(v2 + 8);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v41;
        _os_log_impl(&dword_19A799000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring client re-activate after invalidation.", buf, 0xCu);
      }

    }
    if (!*(_BYTE *)(v2 + 167))
    {
      if (objc_msgSend(*(id *)(v2 + 176), "isRoot"))
      {
        if (objc_msgSend(*(id *)(v2 + 176), "isClient"))
        {
          v43 = objc_opt_class();
          if (v43 == objc_opt_class())
          {
            v70 = *(void **)(v2 + 56);
            v153[0] = v32;
            v153[1] = 3221225472;
            v153[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke;
            v153[3] = &unk_1E390D210;
            v153[4] = v2;
            objc_msgSend(v70, "performAsync:", v153);
          }
          else
          {
            v44 = objc_opt_class();
            if (v44 != objc_opt_class())
            {
              v104 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(v2 + 176), "description");
              v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v104, "stringWithFormat:", CFSTR("unknown root context %s"), objc_msgSend(v105, "UTF8String"));
              v106 = (void *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(aSelector);
                v107 = (id)objc_claimAutoreleasedReturnValue();
                v108 = (objc_class *)objc_opt_class();
                NSStringFromClass(v108);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                *(_QWORD *)&buf[4] = v107;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v109;
                v155 = 2048;
                v156 = v2;
                v157 = 2114;
                v158 = CFSTR("BSXPCServiceConnection.m");
                v159 = 1024;
                v160 = 647;
                v161 = 2114;
                v162 = v106;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v106), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7A04C4);
            }
            v45 = *(_QWORD **)(v2 + 176);
            if (v45)
              v45 = (_QWORD *)v45[6];
            v46 = v45;
            v47 = xpc_connection_create_from_endpoint(v46);
            v48 = *(void **)(v2 + 80);
            *(_QWORD *)(v2 + 80) = v47;

            objc_msgSend(*(id *)(v2 + 176), "isNonLaunching");
            xpc_connection_set_bs_type();
            v49 = *(_QWORD *)(v2 + 176);
            if (v49)
            {
              v50 = *(id *)(v49 + 56);
              v51 = v50;
              if (v50)
              {
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = 0;
                objc_msgSend(v50, "getUUIDBytes:", buf);
                xpc_connection_set_oneshot_instance();
              }
            }
            else
            {
              v51 = 0;
            }
            objc_storeStrong((id *)(v2 + 72), *(id *)(v2 + 80));

            +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, *(void **)(v2 + 72), *(void **)(v2 + 48), 0, 0, 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[BSXPCServiceConnectionMessage setMessageID:](v52, CFSTR("connect"));
            v53 = -[BSXPCServiceConnectionActivationMessage initWithMessage:]([BSXPCServiceConnectionActivationMessage alloc], v52);
            v54 = *(void **)(v2 + 112);
            *(_QWORD *)(v2 + 112) = v53;

            v55 = *(void **)(v2 + 128);
            *(_QWORD *)(v2 + 128) = 0;

          }
        }
        else
        {
          if (!*(_QWORD *)(v2 + 80))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("server connection must already posess an xpc connection"));
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v131 = (id)objc_claimAutoreleasedReturnValue();
              v132 = (objc_class *)objc_opt_class();
              NSStringFromClass(v132);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              *(_QWORD *)&buf[4] = v131;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v133;
              v155 = 2048;
              v156 = v2;
              v157 = 2114;
              v158 = CFSTR("BSXPCServiceConnection.m");
              v159 = 1024;
              v160 = 660;
              v161 = 2114;
              v162 = v130;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v130), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7A0AA0);
          }
          v67 = *(void **)(v2 + 72);
          if (!v67)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("server connection must already posess a last known xpc connection"));
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v135 = (id)objc_claimAutoreleasedReturnValue();
              v136 = (objc_class *)objc_opt_class();
              NSStringFromClass(v136);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              *(_QWORD *)&buf[4] = v135;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v137;
              v155 = 2048;
              v156 = v2;
              v157 = 2114;
              v158 = CFSTR("BSXPCServiceConnection.m");
              v159 = 1024;
              v160 = 661;
              v161 = 2114;
              v162 = v134;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v134), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7A0B98);
          }
          if (!*(_QWORD *)(v2 + 128))
          {
            +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, v67);
            v68 = objc_claimAutoreleasedReturnValue();
            v69 = *(void **)(v2 + 128);
            *(_QWORD *)(v2 + 128) = v68;

          }
        }
      }
      else
      {
        if ((v5 & 1) != 0)
        {
          *(_BYTE *)(v2 + 162) = 0;
        }
        else
        {
          v152[0] = v32;
          v152[1] = 3221225472;
          v152[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_124;
          v152[3] = &unk_1E390DEE8;
          v152[4] = v2;
          *(_BYTE *)(v2 + 162) = -[BSXPCServiceConnection _lock_activateNowOrWhenReady:](v139, v152) ^ 1;
          objc_storeStrong((id *)(v2 + 72), v139[9]);
        }
        v56 = *(id *)(v2 + 176);
        v57 = v56;
        if (!v56 || !v56[24])
        {
          +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, *(void **)(v2 + 72), *(void **)(v2 + 48), 0, 0, 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSXPCServiceConnectionMessage setMessageID:](v58, CFSTR("connect"));
          if (v57)
            v59 = v57[4];
          else
            v59 = 0;
          -[BSXPCServiceConnectionMessage setChildIdentifier:](v58, v59);
          if (v57)
            v60 = *((_BYTE *)v57 + 24) != 0;
          else
            v60 = 0;
          -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](v58, (const char *)v60);
          v61 = -[BSXPCServiceConnectionActivationMessage initWithMessage:]([BSXPCServiceConnectionActivationMessage alloc], v58);
          v62 = *(void **)(v2 + 112);
          *(_QWORD *)(v2 + 112) = v61;

        }
        if (objc_msgSend(v57, "isClient") && !*(_QWORD *)(v2 + 128))
        {
          +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, *(void **)(v2 + 72));
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = *(void **)(v2 + 128);
          *(_QWORD *)(v2 + 128) = v63;

          if (v57)
            v65 = v57[4];
          else
            v65 = 0;
          -[BSXPCServiceConnectionMessage setChildIdentifier:](*(void **)(v2 + 128), v65);
          if (v57)
            v66 = *((_BYTE *)v57 + 24) != 0;
          else
            v66 = 0;
          -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](*(void **)(v2 + 128), (const char *)v66);
        }

      }
    }
    v71 = *(_xpc_connection_s **)(v2 + 80);
    if (v71)
    {
      xpc_connection_set_target_queue(v71, *(dispatch_queue_t *)(v2 + 48));
      v72 = *(_xpc_connection_s **)(v2 + 80);
      handler[0] = v32;
      handler[1] = 3221225472;
      handler[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_2;
      handler[3] = &unk_1E390DF10;
      handler[4] = v2;
      xpc_connection_set_event_handler(v72, handler);
      if (!xpc_connection_get_context(*(xpc_connection_t *)(v2 + 80)))
      {
        xpc_connection_set_context(*(xpc_connection_t *)(v2 + 80), *(id *)(v2 + 176));
        xpc_connection_set_finalizer_f(*(xpc_connection_t *)(v2 + 80), (xpc_finalizer_t)CFBridgingRelease);
      }
    }
    -[BSXPCServiceConnectionEventHandler connectionInitialized:withActivationGeneration:activeXPCConnection:xpcConnectionTargetQueue:](*(_QWORD *)(v2 + 144), (void *)v2, *(_DWORD *)(v2 + 28), *(void **)(v2 + 72), *(void **)(v2 + 48));
    if (*(_QWORD *)(v2 + 112))
    {
      v73 = *(id *)(v2 + 8);
      v74 = (void **)(id)v2;
      v75 = *(_DWORD *)(v2 + 28);
      -[BSXPCServiceConnectionMessage setReplyQueue:](*(_QWORD *)(*(_QWORD *)(v2 + 112) + 8), v74[7]);
      v76 = *(void **)(*(_QWORD *)(v2 + 112) + 8);
      v77 = *(_QWORD **)(v2 + 144);
      if (v77)
        v77 = (_QWORD *)v77[23];
      v78 = v77;
      objc_msgSend(v76, "encodeObject:forKey:", v78, CFSTR("bsxpc_context"));

      v79 = *(void **)(*(_QWORD *)(v2 + 112) + 8);
      newValue[0] = v32;
      newValue[1] = 3221225472;
      newValue[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_3;
      newValue[3] = &unk_1E390DF38;
      newValue[4] = v74;
      newValue[5] = v74;
      v150 = v75;
      v81 = v73;
      v149 = v81;
      v82 = v81;
      if (v79)
      {
        objc_setProperty_nonatomic_copy(v79, v80, newValue, 80);
        v82 = v149;
      }

    }
    if (*(_QWORD *)(v2 + 120))
    {
      *(_BYTE *)(v2 + 163) = 1;
      v83 = *(void **)(v2 + 56);
      v147[0] = v32;
      v147[1] = 3221225472;
      v147[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_131;
      v147[3] = &unk_1E390D210;
      v147[4] = v2;
      objc_msgSend(v83, "performAsync:", v147);
    }
    v84 = *(_xpc_connection_s **)(v2 + 80);
    if (!v84)
      goto LABEL_108;
    xpc_connection_activate(v84);
    if (xpc_connection_get_bs_type() == 3)
    {
      *(_BYTE *)(v2 + 162) = 1;
    }
    else if (!*(_BYTE *)(v2 + 162))
    {
      goto LABEL_108;
    }
    v85 = *(_QWORD *)(v2 + 144);
    if (!v85)
      goto LABEL_107;
    if (!*(_BYTE *)(v85 + 128))
    {
      v85 = *(_QWORD *)(v85 + 176);
LABEL_107:
      v86 = (id)v85;
      v87 = objc_msgSend(v86, "clientMessagingExpectation") == 1;

      if (!v87)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("non-launching ports can only be used with services that are explicitly non-launching aware or whose interface supports BSServiceInterfaceMessagingExpectationAfterHandshake"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          v101 = (id)objc_claimAutoreleasedReturnValue();
          v102 = (objc_class *)objc_opt_class();
          NSStringFromClass(v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v101;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v103;
          v155 = 2048;
          v156 = v2;
          v157 = 2114;
          v158 = CFSTR("BSXPCServiceConnection.m");
          v159 = 1024;
          v160 = 761;
          v161 = 2114;
          v162 = v100;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v100), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7A03A8);
      }
    }
LABEL_108:
    if ((objc_msgSend(*(id *)(v2 + 176), "isRoot") & 1) != 0 || !*(_BYTE *)(v2 + 162))
    {
      objc_msgSend(*(id *)(v2 + 112), "sendIfNecessary");
      v88 = *(void **)(v2 + 112);
      *(_QWORD *)(v2 + 112) = 0;

    }
    objc_msgSend(*(id *)(v2 + 120), "send");
    v89 = *(void **)(v2 + 120);
    *(_QWORD *)(v2 + 120) = 0;

    v90 = *(id *)(v2 + 144);
    v144[0] = v32;
    v144[1] = 3221225472;
    v144[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_134;
    v144[3] = &unk_1E390DF60;
    v145 = v90;
    v146 = a2;
    v144[4] = v2;
    v91 = v90;
    -[BSXPCServiceConnection _lock_enqueueConnectionEstablishedEvent:](v2, v144);

    goto LABEL_112;
  }
  v143[0] = MEMORY[0x1E0C809B0];
  v143[1] = 3221225472;
  v143[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_135;
  v143[3] = &unk_1E390DDF8;
  v143[4] = v2;
  v143[5] = a2;
  -[BSXPCServiceConnection _lock_enqueueConnectionEstablishedEvent:](v2, v143);
LABEL_112:
  if (*(_BYTE *)(v2 + 167))
  {
    v92 = *(id *)(v2 + 144);
    v93 = v92;
    if (v92)
    {
      v94 = *(void **)(v2 + 56);
      v140[0] = v32;
      v140[1] = 3221225472;
      v140[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_2_136;
      v140[3] = &unk_1E390D478;
      v141 = v92;
      v142 = v2;
      objc_msgSend(v94, "performAsync:", v140);

    }
    v95 = *(void **)(v2 + 144);
    *(_QWORD *)(v2 + 144) = 0;

    v96 = *(void **)(v2 + 64);
    *(_QWORD *)(v2 + 64) = 0;

    v97 = *(void **)(v2 + 96);
    *(_QWORD *)(v2 + 96) = 0;

    v98 = *(void **)(v2 + 104);
    *(_QWORD *)(v2 + 104) = 0;

  }
  v2 = *(_BYTE *)(v2 + 162) == 0;

  return v2;
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  BSXPCServiceConnectionMessage *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  unsigned int v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BSXPCServiceConnection *v30;
  void *v31;
  id *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id obj;
  _BYTE buf[24];
  void *v41;
  _BYTE v42[10];
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return;
  objc_msgSend(*(id *)(v2 + 56), "assertBarrierOnQueue");
  v4 = MEMORY[0x19AECADB4](a2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    v5 = -[BSXPCServiceConnectionMessage initWithMessage:]([BSXPCServiceConnectionMessage alloc], "initWithMessage:", a2);
    if (xpc_dictionary_expects_reply())
      v6 = a2;
    else
      v6 = 0;
    v7 = v6;
    -[BSXPCServiceConnectionMessage messageID](v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("connect")))
      {
        -[BSXPCCoder XPCConnection](v5, "XPCConnection");
        v10 = objc_claimAutoreleasedReturnValue();
        +[BSXPCServiceConnectionPeer peerOfConnection:]((uint64_t)BSXPCServiceConnectionPeer, v10);
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v2 + 56), "assertBarrierOnQueue");
        os_unfair_lock_lock((os_unfair_lock_t)(v2 + 16));
        if (*(_BYTE *)(v2 + 167))
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
          BSServiceXPCLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_QWORD *)(v2 + 8);
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v13;
            _os_log_impl(&dword_19A799000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring activation message because this connection has been invalidated", buf, 0xCu);
          }
          goto LABEL_35;
        }
        v15 = -[BSXPCServiceConnectionMessage childIdentifier](v5, v11);
        v12 = *(id *)(v2 + 144);
        -[BSXPCServiceConnectionMessage createReply](v5, "createReply");
        v38 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          BSServiceXPCLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = *(_QWORD *)(v2 + 8);
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v27;
            _os_log_impl(&dword_19A799000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Activation message received.", buf, 0xCu);
          }

          objc_msgSend(v38, "send");
          -[BSXPCCoder decodeObjectOfClass:forKey:](v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bsxpc_context"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSXPCServiceConnectionEventHandler setInitiatingContext:]((uint64_t)v12, v28);

          -[BSXPCServiceConnection _connection_consumeLock_didActivateWithMessage:fromPeer:](v2, v5, obj);
          goto LABEL_34;
        }
        v17 = -[BSXPCServiceConnectionMessage childIdentifierIsRemotelyDefined](v5, v16);
        if (((objc_msgSend(*(id *)(v2 + 176), "isRoot") ^ 1 | v17) & 1) == 0)
        {
          -[BSXPCCoder message](v5, "message");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          BSStoreTokenFromMessageToVar();

          v30 = [BSXPCServiceConnection alloc];
          -[BSXPCServiceConnectionRootContext childContextWithRemoteIdentifier:](*(_QWORD **)(v2 + 176), (uint64_t)v15);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v30->super.isa, v31, *(void **)(v2 + 168));

          -[BSXPCServiceConnection _eventHandler]((os_unfair_lock_s *)v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSXPCCoder decodeObjectOfClass:forKey:](v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bsxpc_context"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSXPCServiceConnectionEventHandler setInitiatingContext:]((uint64_t)v33, v34);

          objc_storeStrong(v32 + 4, obj);
          objc_storeStrong(v32 + 5, 0);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __71__BSXPCServiceConnection__connection_handleActivationMessage_fromPeer___block_invoke;
          v41 = &unk_1E390DD48;
          v35 = v12;
          *(_QWORD *)v42 = v35;
          -[BSXPCServiceConnection configure:]((uint64_t)v32, (uint64_t)buf);
          objc_storeStrong(v32 + 15, v38);
          -[BSXPCServiceConnection _lock_associateNewChildConnection:](v2, (uint64_t)v32);
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
          -[BSXPCServiceConnectionEventHandler connection:handleConnection:]((uint64_t)v35, (os_unfair_lock_s *)v2, (uint64_t)v32);

LABEL_34:
LABEL_35:

          goto LABEL_36;
        }
        BSServiceXPCErrorsLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
        if ((v17 & 1) != 0)
        {
          if (v19)
          {
            v20 = *(_QWORD *)(v2 + 8);
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v15;
            v21 = "%{public}@ new children must have remotely defined identifiers : %llx";
LABEL_40:
            _os_log_error_impl(&dword_19A799000, v18, OS_LOG_TYPE_ERROR, v21, buf, 0x16u);
          }
        }
        else if (v19)
        {
          v37 = *(_QWORD *)(v2 + 8);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v15;
          v21 = "%{public}@ we don't support grandchildren %llx";
          goto LABEL_40;
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
        goto LABEL_34;
      }
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("invalidate")) & 1) != 0
        || objc_msgSend(v9, "isEqualToString:", CFSTR("interrupt")))
      {
        -[BSXPCServiceConnection _connection_handleInvalidateMessage:withHandoff:](v2, v5, (uint64_t)v7);
LABEL_37:

        return;
      }
      BSServiceXPCErrorsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v36 = *(_QWORD *)(v2 + 8);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_error_impl(&dword_19A799000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Ignoring message with unknown messageID : %@", buf, 0x16u);
      }
    }
    else
    {
      -[BSXPCCoder XPCConnection](v5, "XPCConnection");
      v10 = objc_claimAutoreleasedReturnValue();
      +[BSXPCServiceConnectionPeer peerOfConnection:]((uint64_t)BSXPCServiceConnectionPeer, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _connection_handleMessage:fromPeer:withHandoff:](v2, v5, v14, (uint64_t)v7);

    }
LABEL_36:

    goto LABEL_37;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this should never happen. unknown message: %@"), a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__connection_handleEvent_);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      v41 = (void *)v2;
      *(_WORD *)v42 = 2114;
      *(_QWORD *)&v42[2] = CFSTR("BSXPCServiceConnection.m");
      v43 = 1024;
      v44 = 1044;
      v45 = 2114;
      v46 = v22;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A1400);
  }
  -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:](v2, a2, 1);
}

- (void)_connection_handleMessage:(void *)a3 fromPeer:(uint64_t)a4 withHandoff:
{
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  os_unfair_lock_s *v24;
  NSObject *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  os_unfair_lock_s *lock;
  os_unfair_lock_t locka;
  _QWORD v32[4];
  NSObject *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend(*(id *)(a1 + 56), "assertBarrierOnQueue");
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(_BYTE *)(a1 + 167))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    BSServiceXPCLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v41 = v10;
      _os_log_impl(&dword_19A799000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring message because the connection has been invalidated", buf, 0xCu);
    }

    return;
  }
  lock = (os_unfair_lock_s *)(a1 + 16);
  v11 = -[BSXPCServiceConnectionMessage childIdentifier](a2, v8);
  if (!objc_msgSend(*(id *)(a1 + 176), "isRoot") || !v11)
  {
    locka = (os_unfair_lock_t)*(id *)(a1 + 144);
    -[BSXPCServiceConnection _connection_consumeLock_didActivateWithMessage:fromPeer:](a1, a2, a3);
    -[BSXPCServiceConnectionEventHandler connection:handleMessage:]((uint64_t)locka, (os_unfair_lock_s *)a1, (uint64_t)a2);

    return;
  }
  v28 = a4;
  v29 = a2;
  v13 = -[BSXPCServiceConnectionMessage childIdentifierIsRemotelyDefined](a2, v12);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = *(id *)(a1 + 88);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v37;
LABEL_10:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v16)
        objc_enumerationMutation(v14);
      v18 = *(id **)(*((_QWORD *)&v36 + 1) + 8 * v17);
      if (v18 && (v19 = v18[22]) != 0)
      {
        v20 = v19;
        if (v13 != (*((_BYTE *)v19 + 24) != 0))
        {
          v21 = (void *)*((_QWORD *)v19 + 4);
LABEL_17:
          if (v21 == v11)
          {
            v23 = v18;

            if (!v18)
              goto LABEL_27;
            os_unfair_lock_lock(v23 + 4);
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __73__BSXPCServiceConnection__connection_handleMessage_fromPeer_withHandoff___block_invoke;
            v32[3] = &unk_1E390D4A0;
            v24 = v23;
            v33 = v24;
            v34 = v29;
            v35 = a3;
            -[BSXPCServiceConnection _lock_enqueueChildActivateEvent:forHandoff:]((uint64_t)v24, v32, v28);
            os_unfair_lock_unlock(v23 + 4);
            v25 = v33;
            goto LABEL_29;
          }
        }
      }
      else
      {
        v20 = 0;
        v21 = 0;
        if ((v13 & 1) != 0)
          goto LABEL_17;
      }

      if (v15 == ++v17)
      {
        v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        v15 = v22;
        if (v22)
          goto LABEL_10;
        break;
      }
    }
  }

LABEL_27:
  BSServiceXPCLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = *(_QWORD *)(a1 + 8);
    v27 = CFSTR("r");
    *(_DWORD *)buf = 138543874;
    if (v13)
      v27 = &stru_1E39106C8;
    v41 = v26;
    v42 = 2050;
    v43 = v11;
    v44 = 2114;
    v45 = v27;
    _os_log_error_impl(&dword_19A799000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Ignoring connection message because no connection exists for %{public}llx%{public}@", buf, 0x20u);
  }
  v24 = 0;
LABEL_29:

  os_unfair_lock_unlock(lock);
}

- (void)_connection_consumeLock_runPendedEventsIfAppropriate
{
  os_unfair_lock_s *v2;
  int v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
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
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if (!*(_BYTE *)(a1 + 160))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we should never get here if we've never set up the connection queue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__connection_consumeLock_runPendedEventsIfAppropriate);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v17;
      v32 = 2114;
      v33 = v19;
      v34 = 2048;
      v35 = a1;
      v36 = 2114;
      v37 = CFSTR("BSXPCServiceConnection.m");
      v38 = 1024;
      v39 = 983;
      v40 = 2114;
      v41 = v16;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A2824);
  }
  objc_msgSend(*(id *)(a1 + 56), "assertBarrierOnQueue");
  v3 = *(_DWORD *)(a1 + 28);
  if (!*(_BYTE *)(a1 + 160) || !*(_BYTE *)(a1 + 161))
  {
    v4 = 0;
    goto LABEL_8;
  }
  v4 = *(id *)(a1 + 96);
  v5 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = 0;

  if (!*(_BYTE *)(a1 + 163))
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = *(id *)(a1 + 104);
  v7 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = 0;

LABEL_9:
  os_unfair_lock_unlock(v2);
  if (objc_msgSend(v4, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i) + 16))();
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
    {
      os_unfair_lock_lock(v2);
      if (!*(_BYTE *)(a1 + 163) || v3 != *(_DWORD *)(a1 + 28))
      {

        v6 = 0;
      }
      os_unfair_lock_unlock(v2);
    }
  }
  if (objc_msgSend(v6, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v12);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);
    }

  }
}

- (void)_connection_consumeLock_didActivateWithMessage:(void *)a3 fromPeer:
{
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (!*(_BYTE *)(a1 + 160))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we should never get here if we've never set up the connection queue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__connection_consumeLock_didActivateWithMessage_fromPeer_);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138544642;
        v12 = v8;
        v13 = 2114;
        v14 = v10;
        v15 = 2048;
        v16 = a1;
        v17 = 2114;
        v18 = CFSTR("BSXPCServiceConnection.m");
        v19 = 1024;
        v20 = 1050;
        v21 = 2114;
        v22 = v7;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A2A38);
    }
    objc_msgSend(*(id *)(a1 + 56), "assertBarrierOnQueue");
    *(_BYTE *)(a1 + 163) = 1;
    objc_msgSend(a2, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BSStoreTokenFromMessageToVar();

    if (!*(_QWORD *)(a1 + 32))
      objc_storeStrong((id *)(a1 + 32), a3);
    -[BSXPCServiceConnection _connection_consumeLock_runPendedEventsIfAppropriate](a1);
  }
}

- (BOOL)_isClientInvalidated
{
  BSXPCServiceConnection *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_clientInvalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __73__BSXPCServiceConnection__connection_handleMessage_fromPeer_withHandoff___block_invoke(_QWORD *a1)
{
  return -[BSXPCServiceConnection _connection_handleMessage:fromPeer:withHandoff:](a1[4], a1[5], a1[6], 0);
}

- (id)_eventHandler
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (id *)v1[18];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_lock_enqueueConnectionEstablishedEvent:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__lock_enqueueConnectionEstablishedEvent_);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      v21 = 2048;
      v22 = a1;
      v23 = 2114;
      v24 = CFSTR("BSXPCServiceConnection.m");
      v25 = 1024;
      v26 = 963;
      v27 = 2114;
      v28 = v13;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A3784);
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if (*(_BYTE *)(a1 + 167))
  {
    BSServiceXPCLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v18 = v5;
      _os_log_impl(&dword_19A799000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping established event because we have been invalidated.", buf, 0xCu);
    }

  }
  else if (*(_BYTE *)(a1 + 160) && *(_BYTE *)(a1 + 163))
  {
    objc_msgSend(*(id *)(a1 + 56), "performAsync:", a2);
  }
  else
  {
    v6 = *(void **)(a1 + 104);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v7;

      v6 = *(void **)(a1 + 104);
    }
    v9 = (void *)objc_msgSend(a2, "copy");
    v10 = (void *)MEMORY[0x19AECAA00]();
    objc_msgSend(v6, "addObject:", v10);

    BSServiceXPCLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_19A799000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Pending event until connection established.", buf, 0xCu);
    }

  }
}

uint64_t ____BSXPCServiceConnection_IS_INVOKING_A_MESSAGE_REPLY_BLOCK___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  void *v12;
  NSString *v13;
  objc_class *v14;
  void *v15;
  NSString *v16;
  objc_class *v17;
  void *v18;
  NSString *v19;
  objc_class *v20;
  uint8_t v21[4];
  NSString *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  _QWORD buf[4];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[7];
  v1 = a1[8];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = objc_opt_self();
  if (!v1)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("callOutBlock != ((void *)0)"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(sel_invokeReplyBlock_blockDescriptor_andPayload_error_forConnection_);
      v14 = (objc_class *)objc_opt_class();
      LODWORD(buf[0]) = 138544642;
      *(_QWORD *)((char *)buf + 4) = v13;
      WORD2(buf[1]) = 2114;
      *(_QWORD *)((char *)&buf[1] + 6) = NSStringFromClass(v14);
      HIWORD(buf[2]) = 2048;
      buf[3] = v6;
      LOWORD(v34) = 2114;
      *(_QWORD *)((char *)&v34 + 2) = CFSTR("BSXPCServiceConnectionProxy.m");
      WORD5(v34) = 1024;
      HIDWORD(v34) = 670;
      LOWORD(v35) = 2114;
      *(_QWORD *)((char *)&v35 + 2) = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)buf, 0x3Au);
    }
    objc_msgSend(v12, "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A3B2CLL);
  }
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  memset(buf, 0, sizeof(buf));
  v7 = (void *)objc_msgSend(v3, "blockArguments");
  v8 = v7;
  if (v5)
  {
    v9 = objc_msgSend((id)objc_msgSend(v7, "lastObject"), "argumentIndex");
    if (v9 != objc_msgSend(v8, "count") - 1)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[arguments lastObject] argumentIndex] == ([arguments count] - 1)"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = NSStringFromSelector(sel_invokeReplyBlock_blockDescriptor_andPayload_error_forConnection_);
        v17 = (objc_class *)objc_opt_class();
        *(_DWORD *)v21 = 138544642;
        v22 = v16;
        v23 = 2114;
        v24 = NSStringFromClass(v17);
        v25 = 2048;
        v26 = v6;
        v27 = 2114;
        v28 = CFSTR("BSXPCServiceConnectionProxy.m");
        v29 = 1024;
        v30 = 692;
        v31 = 2114;
        v32 = v15;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v21, 0x3Au);
      }
      objc_msgSend(v15, "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A3C08);
    }
    buf[objc_msgSend((id)objc_msgSend(v8, "lastObject"), "argumentIndex")] = v5;
  }
  else
  {
    if (!v4)
    {
      v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("payload != ((void *)0)"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v19 = NSStringFromSelector(sel_invokeReplyBlock_blockDescriptor_andPayload_error_forConnection_);
        v20 = (objc_class *)objc_opt_class();
        *(_DWORD *)v21 = 138544642;
        v22 = v19;
        v23 = 2114;
        v24 = NSStringFromClass(v20);
        v25 = 2048;
        v26 = v6;
        v27 = 2114;
        v28 = CFSTR("BSXPCServiceConnectionProxy.m");
        v29 = 1024;
        v30 = 677;
        v31 = 2114;
        v32 = v18;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v21, 0x3Au);
      }
      objc_msgSend(v18, "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A3CE4);
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D018A0]), "initWithMessage:", v4);
    +[BSXPCServiceConnectionProxy decodeArguments:outArgs:fromMessage:forConnection:]((uint64_t)BSXPCServiceConnectionProxy, v8, (uint64_t)buf, v10, v2);

  }
  result = objc_msgSend(v8, "count");
  switch(result)
  {
    case 0:
      result = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
      break;
    case 1:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(v1, buf[0]);
      break;
    case 2:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1]);
      break;
    case 3:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1], buf[2]);
      break;
    case 4:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3]);
      break;
    case 5:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34);
      break;
    case 6:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((_QWORD *)&v34 + 1));
      break;
    case 7:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((_QWORD *)&v34 + 1), v35);
      break;
    case 8:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((_QWORD *)&v34 + 1), v35, *((_QWORD *)&v35 + 1));
      break;
    case 9:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((_QWORD *)&v34 + 1), v35, *((_QWORD *)&v35 + 1), v36);
      break;
    case 10:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((_QWORD *)&v34 + 1), v35, *((_QWORD *)&v35 + 1), v36, *((_QWORD *)&v36 + 1));
      break;
    default:
      return result;
  }
  return result;
}

- (void)_connection_handleInvalidateMessage:(uint64_t)a3 withHandoff:
{
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int v23;
  os_unfair_lock_s *v24;
  os_unfair_lock_s *v25;
  NSObject *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v31[4];
  NSObject *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend(*(id *)(a1 + 56), "assertBarrierOnQueue");
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(_BYTE *)(a1 + 167))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    BSServiceXPCLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v39 = v7;
      _os_log_impl(&dword_19A799000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring invalidate because this connection has been invalidated", buf, 0xCu);
    }

    return;
  }
  v8 = -[BSXPCServiceConnectionMessage childIdentifier](a2, v5);
  if (objc_msgSend(*(id *)(a1 + 176), "isRoot") && v8)
  {
    v29 = a3;
    v10 = -[BSXPCServiceConnectionMessage childIdentifierIsRemotelyDefined](a2, v9);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = *(id *)(a1 + 88);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v35;
LABEL_10:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v11);
        v15 = *(id **)(*((_QWORD *)&v34 + 1) + 8 * v14);
        if (v15 && (v16 = v15[22]) != 0)
        {
          v17 = v16;
          if (v10 != (*((_BYTE *)v16 + 24) != 0))
          {
            v18 = (void *)*((_QWORD *)v16 + 4);
LABEL_17:
            if (v18 == v8)
            {
              v24 = v15;

              if (!v15)
                goto LABEL_30;
              os_unfair_lock_lock(v24 + 4);
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __74__BSXPCServiceConnection__connection_handleInvalidateMessage_withHandoff___block_invoke;
              v31[3] = &unk_1E390D478;
              v25 = v24;
              v32 = v25;
              v33 = a2;
              -[BSXPCServiceConnection _lock_enqueueChildActivateEvent:forHandoff:]((uint64_t)v25, v31, v29);
              os_unfair_lock_unlock(v24 + 4);
              v26 = v32;
              goto LABEL_35;
            }
          }
        }
        else
        {
          v17 = 0;
          v18 = 0;
          if ((v10 & 1) != 0)
            goto LABEL_17;
        }

        if (v12 == ++v14)
        {
          v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
          v12 = v19;
          if (v19)
            goto LABEL_10;
          break;
        }
      }
    }

LABEL_30:
    BSServiceXPCLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 8);
      v28 = CFSTR("r");
      *(_DWORD *)buf = 138543874;
      if (v10)
        v28 = &stru_1E39106C8;
      v39 = v27;
      v40 = 2050;
      v41 = v8;
      v42 = 2114;
      v43 = v28;
      _os_log_impl(&dword_19A799000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring invalidation message; no child found for %{public}llx%{public}@",
        buf,
        0x20u);
    }
    v25 = 0;
LABEL_35:

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
  else
  {
    BSServiceXPCLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v39 = v21;
      _os_log_impl(&dword_19A799000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidation message received.", buf, 0xCu);
    }

    -[BSXPCServiceConnectionMessage messageID](a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("interrupt"));

    if (v23)
    {
      -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:](a1, MEMORY[0x1E0C81258], 0);
    }
    else
    {
      *(_BYTE *)(a1 + 164) = 1;
      -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:](a1, MEMORY[0x1E0C81260], 0);
    }
  }
}

void __53__BSXPCServiceConnection__invalidateChildConnection___block_invoke(uint64_t a1)
{
  -[BSXPCServiceConnectionEventHandler connectionHandleNoMoreChildren:](*(_QWORD **)(a1 + 32), *(os_unfair_lock_s **)(a1 + 40));
}

uint64_t __74__BSXPCServiceConnection__connection_handleInvalidateMessage_withHandoff___block_invoke(uint64_t a1)
{
  return -[BSXPCServiceConnection _connection_handleInvalidateMessage:withHandoff:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

+ (id)currentContext
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("BSXPCCurrentContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (os_unfair_lock_s)initiatingContext
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  _QWORD *v3;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v3 = *(_QWORD **)&v1[36]._os_unfair_lock_opaque;
    if (v3)
      v3 = (_QWORD *)v3[23];
    v1 = v3;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)invalidate
{
  -[BSXPCServiceConnection _clientInvalidateExplicitly:]((uint64_t)self, 1);
}

- (uint64_t)remoteTargetWithAssertionAttributes:(int)a3 enforcingLaunchConstraints:
{
  uint64_t *v3;
  os_unfair_lock_s *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE buf[24];
  uint64_t *v30;
  _BYTE v31[10];
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v3 = (uint64_t *)a1;
  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    if (*((_BYTE *)v3 + 160))
    {
      if (a3)
      {
        if (*((_BYTE *)v3 + 162))
        {
          if (!objc_msgSend(a2, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("empty launch attributes"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_remoteTargetWithAssertionAttributes_enforcingLaunchConstraints_);
              v22 = (id)objc_claimAutoreleasedReturnValue();
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              *(_QWORD *)&buf[4] = v22;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v24;
              *(_WORD *)&buf[22] = 2048;
              v30 = v3;
              *(_WORD *)v31 = 2114;
              *(_QWORD *)&v31[2] = CFSTR("BSXPCServiceConnection.m");
              v32 = 1024;
              v33 = 198;
              v34 = 2114;
              v35 = v21;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7A976CLL);
          }
          v25 = 0;
          v26 = &v25;
          v27 = 0x2050000000;
          v7 = (void *)getRBSConstraintsAttributeClass_softClass_0;
          v28 = getRBSConstraintsAttributeClass_softClass_0;
          if (!getRBSConstraintsAttributeClass_softClass_0)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getRBSConstraintsAttributeClass_block_invoke_0;
            v30 = (uint64_t *)&unk_1E390CE38;
            *(_QWORD *)v31 = &v25;
            __getRBSConstraintsAttributeClass_block_invoke_0((uint64_t)buf);
            v7 = (void *)v26[3];
          }
          v8 = objc_retainAutorelease(v7);
          _Block_object_dispose(&v25, 8);
          objc_msgSend(v8, "attributeWithConstraints:", 7, v25);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v3[18];
          v11 = (void *)v3[14];
          objc_msgSend(a2, "arrayByAddingObject:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSXPCServiceConnectionEventHandler remoteTargetWithHandshake:assertionAttributes:](v10, v11, v12);
          v3 = (uint64_t *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
      }
      else
      {
        if (*((_BYTE *)v3 + 162))
          goto LABEL_15;
        v13 = (_QWORD *)v3[18];
        if (v13)
          v13 = (_QWORD *)v13[22];
        v14 = v13;
        v15 = objc_msgSend(v14, "clientMessagingExpectation");

        if (v15 == 1)
        {
LABEL_15:
          if (*((_BYTE *)v3 + 161) && !*((_BYTE *)v3 + 163))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot send a message before handshake has finished"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_remoteTargetWithAssertionAttributes_enforcingLaunchConstraints_);
              v18 = (id)objc_claimAutoreleasedReturnValue();
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              *(_QWORD *)&buf[4] = v18;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v20;
              *(_WORD *)&buf[22] = 2048;
              v30 = v3;
              *(_WORD *)v31 = 2114;
              *(_QWORD *)&v31[2] = CFSTR("BSXPCServiceConnection.m");
              v32 = 1024;
              v33 = 208;
              v34 = 2114;
              v35 = v17;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7A9678);
          }
        }
      }
      -[BSXPCServiceConnectionEventHandler remoteTargetWithHandshake:assertionAttributes:](v3[18], 0, a2);
      v3 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
LABEL_17:
    os_unfair_lock_unlock(v6);
  }
  return v3;
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
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API misuse: handler block not specified"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138544642;
        v17 = v5;
        v18 = 2114;
        v19 = v7;
        v20 = 2048;
        v21 = a1;
        v22 = 2114;
        v23 = CFSTR("BSXPCServiceConnection.m");
        v24 = 1024;
        v25 = 235;
        v26 = 2114;
        v27 = v4;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AA7B8);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(_BYTE *)(a1 + 160))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API misuse: connection cannot be mutated once activated"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138544642;
        v17 = v9;
        v18 = 2114;
        v19 = v11;
        v20 = 2048;
        v21 = a1;
        v22 = 2114;
        v23 = CFSTR("BSXPCServiceConnection.m");
        v24 = 1024;
        v25 = 238;
        v26 = 2114;
        v27 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AA8B0);
    }
    if (*(_BYTE *)(a1 + 166))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API misuse: connection cannot be mutated once invalidated"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138544642;
        v17 = v13;
        v18 = 2114;
        v19 = v15;
        v20 = 2048;
        v21 = a1;
        v22 = 2114;
        v23 = CFSTR("BSXPCServiceConnection.m");
        v24 = 1024;
        v25 = 239;
        v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AA9A8);
    }
    if (*(_QWORD *)(a1 + 144))
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (uint64_t)activateNowOrWhenReady:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  char v6;
  uint64_t v7;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (!objc_msgSend(*(id *)(a1 + 176), "isChild"))
  {
    v5 = 0;
    goto LABEL_6;
  }
  v5 = (os_unfair_lock_s *)*(id *)(a1 + 152);
  if (!v5)
  {
LABEL_6:
    v6 = 1;
    goto LABEL_7;
  }
  os_unfair_lock_unlock(v4);
  os_unfair_lock_lock(v5 + 4);
  os_unfair_lock_lock(v4);
  v6 = 0;
LABEL_7:
  v7 = -[BSXPCServiceConnection _lock_activateNowOrWhenReady:]((const os_unfair_lock *)a1, a2);
  os_unfair_lock_unlock(v4);
  if ((v6 & 1) == 0)
    os_unfair_lock_unlock(v5 + 4);

  return v7;
}

void __71__BSXPCServiceConnection__connection_handleActivationMessage_fromPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[21];
  v4 = v3;
  if (a2)
  {
    v7 = v4;
    v5 = objc_msgSend(v4, "copy");
    v6 = *(void **)(a2 + 168);
    *(_QWORD *)(a2 + 168) = v5;

    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_remoteAssertionTarget, 0);
  objc_storeStrong((id *)&self->_lock_parent, 0);
  objc_storeStrong((id *)&self->_lock_eventHandler, 0);
  objc_storeStrong((id *)&self->_batchLock_batchMessage, 0);
  objc_storeStrong((id *)&self->_lock_invalidationMessage, 0);
  objc_storeStrong((id *)&self->_lock_activationReply, 0);
  objc_storeStrong((id *)&self->_lock_activationMessage, 0);
  objc_storeStrong((id *)&self->_lock_connectionEstablishedEvents, 0);
  objc_storeStrong((id *)&self->_lock_connectionActivatedEvents, 0);
  objc_storeStrong((id *)&self->_lock_childConnections, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_lock_lastKnownConnection, 0);
  objc_storeStrong(&self->_configured_batchingHandler, 0);
  objc_storeStrong((id *)&self->_configured_connectionQueue, 0);
  objc_storeStrong((id *)&self->_configured_underlyingTargetQueue, 0);
  objc_storeStrong((id *)&self->_lock_auditToken, 0);
  objc_storeStrong((id *)&self->_lock_peer, 0);
  objc_storeStrong((id *)&self->_proem, 0);
}

- (id)auditToken
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (id *)v1[5];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)peer
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (id *)v1[4];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

+ (id)connectionWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(uint64_t)a5 targetPID:(void *)a6 description:
{
  uint64_t v11;
  id v12;
  void *v13;
  BSXPCServiceConnection *v14;
  void *v15;
  id *v16;
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
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = objc_opt_self();
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithEndpoint_oneshot_nonLaunching_targetPID_description_);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v19;
      v32 = 2114;
      v33 = v21;
      v34 = 2048;
      v35 = v11;
      v36 = 2114;
      v37 = CFSTR("BSXPCServiceConnection.m");
      v38 = 1024;
      v39 = 130;
      v40 = 2114;
      v41 = v18;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7ADC58);
  }
  v12 = a6;
  NSClassFromString(CFSTR("NSString"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithEndpoint_oneshot_nonLaunching_targetPID_description_);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v23;
      v32 = 2114;
      v33 = v25;
      v34 = 2048;
      v35 = v11;
      v36 = 2114;
      v37 = CFSTR("BSXPCServiceConnection.m");
      v38 = 1024;
      v39 = 131;
      v40 = 2114;
      v41 = v22;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7ADD58);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithEndpoint_oneshot_nonLaunching_targetPID_description_);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v27;
      v32 = 2114;
      v33 = v29;
      v34 = 2048;
      v35 = v11;
      v36 = 2114;
      v37 = CFSTR("BSXPCServiceConnection.m");
      v38 = 1024;
      v39 = 131;
      v40 = 2114;
      v41 = v26;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7ADE58);
  }

  if ((int)a5 < 1)
    objc_msgSend(getRBSTargetClass(), "targetWithEndpoint:", a2);
  else
    objc_msgSend(getRBSTargetClass(), "targetWithPid:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [BSXPCServiceConnection alloc];
  +[BSXPCServiceConnectionRootClientEndpointContext uniqueClientContextWithEndpoint:oneshot:nonLaunching:description:]((uint64_t)BSXPCServiceConnectionRootClientEndpointContext, a2, a3, a4, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v14->super.isa, v15, v13);

  return v16;
}

void __59__BSXPCServiceConnection__parentDisconnectedWithInterrupt___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  os_unfair_lock_s *v3;
  void *v4;
  _QWORD *v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(os_unfair_lock_s **)(a1 + 40);
  BSServiceConnectionErrorCreate(2uLL, MEMORY[0x1E0C81260], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSXPCServiceConnectionEventHandler connection:handleError:](v2, v3, v4);

  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    -[BSXPCServiceConnectionEventHandler _connectionInvalidated:](v5, *(os_unfair_lock_s **)(a1 + 40));
}

- (BOOL)_asyncToConnectionQueueIfEverActivated:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  id v6;
  _BOOL8 v7;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(_BYTE *)(a1 + 160))
    v5 = *(void **)(a1 + 56);
  else
    v5 = 0;
  v6 = v5;
  os_unfair_lock_unlock(v4);
  v7 = v6 != 0;
  if (v6)
    objc_msgSend(v6, "performAsync:", a2);

  return v7;
}

- (void)_connection_consumeLock_handleError:(int)a3 notYetLocked:
{
  os_unfair_lock_s *v5;
  os_unfair_lock *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  os_unfair_lock_s *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  const char *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD *v51;
  NSObject *v52;
  os_unfair_lock_s *v53;
  os_unfair_lock_s *v54;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = (os_unfair_lock_s *)(a1 + 16);
    v6 = (os_unfair_lock *)(a1 + 16);
    if (a3)
      os_unfair_lock_lock(v6);
    else
      os_unfair_lock_assert_owner(v6);
    if (!*(_BYTE *)(a1 + 160))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we should never get here if we've never set up the connection queue"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__connection_consumeLock_handleError_notYetLocked_);
        v45 = (id)objc_claimAutoreleasedReturnValue();
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v62 = v45;
        v63 = 2114;
        v64 = v47;
        v65 = 2048;
        v66 = a1;
        v67 = 2114;
        v68 = CFSTR("BSXPCServiceConnection.m");
        v69 = 1024;
        v70 = 1200;
        v71 = 2114;
        v72 = v44;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AFE84);
    }
    objc_msgSend(*(id *)(a1 + 56), "assertBarrierOnQueue");
    if (*(_BYTE *)(a1 + 167))
    {
      os_unfair_lock_unlock(v5);
      BSServiceXPCLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        v62 = v8;
        _os_log_impl(&dword_19A799000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring error received because the connection was invalidated", buf, 0xCu);
      }
LABEL_29:

      return;
    }
    if (*(_BYTE *)(a1 + 164))
    {
      BSServiceXPCLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v26 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        v62 = v26;
        _os_log_error_impl(&dword_19A799000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Invalidated by remote connection.", buf, 0xCu);
      }

      BSServiceConnectionErrorCreate(2uLL, a2, CFSTR("Invalidated by an external connection"));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      if (objc_msgSend(*(id *)(a1 + 176), "isServer"))
      {
        BSServiceXPCLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v40 = *(void **)(a1 + 8);
          *(_DWORD *)buf = 138543362;
          v62 = v40;
          _os_log_error_impl(&dword_19A799000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Connection interrupted but that's not possible on a server.", buf, 0xCu);
        }
      }
      else
      {
        v24 = *(_QWORD *)(a1 + 144);
        if (v24 && (*(_QWORD *)(v24 + 104) || *(_QWORD *)(v24 + 88)))
        {
          BSServiceXPCLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v42 = *(void **)(a1 + 8);
            *(_DWORD *)buf = 138543362;
            v62 = v42;
            _os_log_error_impl(&dword_19A799000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Connection interrupted.", buf, 0xCu);
          }

          BSServiceConnectionErrorCreate(1uLL, MEMORY[0x1E0C81258], 0);
          v7 = objc_claimAutoreleasedReturnValue();
          v11 = 1;
          goto LABEL_14;
        }
        BSServiceXPCLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v48 = *(void **)(a1 + 8);
          *(_DWORD *)buf = 138543362;
          v62 = v48;
          _os_log_error_impl(&dword_19A799000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Connection interrupted but there's no handler for it so sending invalidate instead.", buf, 0xCu);
        }
      }
    }
    else
    {
      if (a2 != (void *)MEMORY[0x1E0C81260])
      {
        v20 = (void *)MEMORY[0x1E0C81288];
        BSServiceXPCLog();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        if (a2 == v20)
        {
          if (v22)
          {
            v43 = *(void **)(a1 + 8);
            *(_DWORD *)buf = 138543362;
            v62 = v43;
            _os_log_error_impl(&dword_19A799000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Termination imminent.", buf, 0xCu);
          }

          BSServiceConnectionErrorCreate(2uLL, MEMORY[0x1E0C81288], 0);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        if (!v22)
          goto LABEL_35;
        v54 = v5;
        v27 = *(void **)(a1 + 8);
        v28 = (const char *)*MEMORY[0x1E0C81270];
        v29 = a2;
        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("BSXPCObjectUtilities.h"), 50, CFSTR("key must not be nil"));

        }
        v30 = v29;
        v31 = v30;
        if (v30
          && (v32 = MEMORY[0x19AECADB4](v30), v33 = MEMORY[0x1E0C812F8],
                                              v31,
                                              v31,
                                              v32 == v33))
        {
          xpc_dictionary_get_value(v31, v28);
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            v36 = MEMORY[0x19AECADB4](v34);
            v37 = MEMORY[0x1E0C81390];

            if (v36 == v37)
              v38 = v35;
            else
              v38 = 0;
            goto LABEL_65;
          }
        }
        else
        {
          v35 = 0;
        }
        v38 = 0;
LABEL_65:
        v41 = v38;

        *(_DWORD *)buf = 138543618;
        v62 = v27;
        v63 = 2112;
        v64 = v41;
        _os_log_error_impl(&dword_19A799000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Unknown: %@.", buf, 0x16u);

        v5 = v54;
LABEL_35:

        BSServiceConnectionErrorCreate(2uLL, a2, 0);
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v7 = v10;
        v11 = 0;
LABEL_14:
        v12 = *(id *)(a1 + 144);
        objc_msgSend(*(id *)(a1 + 128), "invalidate");
        v13 = *(void **)(a1 + 128);
        *(_QWORD *)(a1 + 128) = 0;

        if (v11)
        {
          -[BSXPCServiceConnection _lock_disconnect](a1);
          v51 = v12;
          v52 = v7;
          v53 = v5;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v14 = *(id *)(a1 + 88);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v57;
            v17 = MEMORY[0x1E0C809B0];
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v57 != v16)
                  objc_enumerationMutation(v14);
                v19 = *(os_unfair_lock_s **)(*((_QWORD *)&v56 + 1) + 8 * i);
                os_unfair_lock_lock(v19 + 4);
                v55[0] = v17;
                v55[1] = 3221225472;
                v55[2] = __75__BSXPCServiceConnection__connection_consumeLock_handleError_notYetLocked___block_invoke;
                v55[3] = &unk_1E390D210;
                v55[4] = v19;
                -[BSXPCServiceConnection _lock_enqueueChildActivateEvent:forHandoff:]((uint64_t)v19, v55, 0);
                os_unfair_lock_unlock(v19 + 4);
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
            }
            while (v15);
          }

          v7 = v52;
          v5 = v53;
          v12 = v51;
        }
        else
        {
          -[BSXPCServiceConnection _lock_invalidate](a1);
        }
        os_unfair_lock_unlock(v5);
        -[BSXPCServiceConnectionEventHandler connection:handleError:](v12, (os_unfair_lock_s *)a1, v7);
        if (v11)
        {
          -[BSXPCServiceConnectionEventHandler connectionInterruptedFromXPCError:](v12, (os_unfair_lock_s *)a1);
        }
        else if (v12)
        {
          -[BSXPCServiceConnectionEventHandler _connectionInvalidated:](v12, (os_unfair_lock_s *)a1);
        }

        goto LABEL_29;
      }
      BSServiceXPCLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v39 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        v62 = v39;
        _os_log_error_impl(&dword_19A799000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Connection invalidated.", buf, 0xCu);
      }
    }

    BSServiceConnectionErrorCreate(2uLL, MEMORY[0x1E0C81260], 0);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
}

- (void)_clientInvalidateExplicitly:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(_BYTE *)(a1 + 165))
    {
      if (a2 && !*(_BYTE *)(a1 + 166))
      {
        BSServiceXPCLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(a1 + 8);
          v13 = 138543362;
          v14 = v6;
          _os_log_impl(&dword_19A799000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Trailing client invalidation explicitly signaled.", (uint8_t *)&v13, 0xCu);
        }

        *(_BYTE *)(a1 + 166) = 1;
      }
    }
    else
    {
      BSServiceXPCLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 8);
        v13 = 138543618;
        v14 = v8;
        v15 = 1024;
        v16 = a2;
        _os_log_impl(&dword_19A799000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Client invalidation signaled. (explicit=%{BOOL}i)", (uint8_t *)&v13, 0x12u);
      }

      *(_BYTE *)(a1 + 165) = 1;
      *(_BYTE *)(a1 + 166) = a2;
      -[BSXPCServiceConnection _lock_invalidate](a1);
      v9 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

      v10 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

      v11 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = 0;

      v12 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = 0;

    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_lock_invalidate
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[4];
  id v25;
  uint64_t v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 167))
  {
    BSServiceXPCLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v29 = v3;
      _os_log_impl(&dword_19A799000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating.", buf, 0xCu);
    }

    *(_BYTE *)(a1 + 167) = 1;
    v4 = *(_QWORD **)(a1 + 144);
    if (v4)
      v4 = (_QWORD *)v4[21];
    v5 = v4;
    v6 = objc_msgSend(v5, "serviceClass");

    v7 = *(id *)(a1 + 152);
    if (v7)
    {
      dispatch_get_global_queue(v6, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__BSXPCServiceConnection__lock_invalidate__block_invoke;
      block[3] = &unk_1E390D478;
      v25 = v7;
      v26 = a1;
      dispatch_async(v8, block);

    }
    if (*(_QWORD *)(a1 + 128))
    {
      BSServiceXPCLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        v29 = v10;
        _os_log_impl(&dword_19A799000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending invalidation message", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 128), "send");
      v11 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = 0;

    }
    if (objc_msgSend(*(id *)(a1 + 88), "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = *(id *)(a1 + 88);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v21;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v12);
            -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15++), 0);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
        }
        while (v13);
      }

    }
    -[BSXPCServiceConnection _lock_disconnect](a1);
    v16 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = 0;

    v17 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

    if (*(_BYTE *)(a1 + 160))
    {
      v18 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

      v19 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

    }
  }
}

- (void)_lock_disconnect
{
  NSObject *v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD barrier[4];
  _xpc_connection_s *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 161))
  {
    BSServiceXPCLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl(&dword_19A799000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Disconnecting.", buf, 0xCu);
    }

  }
  v4 = (_xpc_connection_s *)*(id *)(a1 + 80);
  v5 = v4;
  if (v4)
  {
    xpc_connection_set_event_handler(v4, &__block_literal_global_137);
    xpc_connection_activate(v5);
    barrier[0] = MEMORY[0x1E0C809B0];
    barrier[1] = 3221225472;
    barrier[2] = __42__BSXPCServiceConnection__lock_disconnect__block_invoke_2;
    barrier[3] = &unk_1E390D210;
    v14 = v5;
    xpc_connection_send_barrier(v14, barrier);
    v6 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

  }
  -[BSXPCServiceConnectionEventHandler connectionDisconnected:](*(_QWORD *)(a1 + 144));
  v7 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = 0;

  v8 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = 0;

  *(_BYTE *)(a1 + 161) = 0;
  *(_BYTE *)(a1 + 163) = 0;
  if (objc_msgSend(*(id *)(a1 + 176), "isClient"))
  {
    v9 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
  objc_msgSend(*(id *)(a1 + 112), "invalidate");
  v10 = *(void **)(a1 + 112);
  *(_QWORD *)(a1 + 112) = 0;

  v11 = *(void **)(a1 + 128);
  *(_QWORD *)(a1 + 128) = 0;

  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 136), "commitWithReason:", CFSTR("disconnect"));
  v12 = *(void **)(a1 + 136);
  *(_QWORD *)(a1 + 136) = 0;

  os_unfair_recursive_lock_unlock();
}

- (void)dealloc
{
  NSObject *v3;
  NSString *proem;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  BSServiceXPCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    proem = self->_proem;
    -[BSXPCServiceConnectionContext endpointDescription](self->_context, "endpointDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = proem;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_19A799000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Dealloc %@", buf, 0x16u);

  }
  BSClearTokenVar();
  v6.receiver = self;
  v6.super_class = (Class)BSXPCServiceConnection;
  -[BSXPCServiceConnection dealloc](&v6, sel_dealloc);
}

- (void)_parentDisconnectedWithInterrupt:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
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
    if ((_DWORD)a2)
    {
      if ((objc_msgSend(*(id *)(a1 + 176), "isServer") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("parent interrupt is only supported on server connections"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__parentDisconnectedWithInterrupt_);
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
          v39 = CFSTR("BSXPCServiceConnection.m");
          v40 = 1024;
          v41 = 377;
          v42 = 2114;
          v43 = v20;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7B17B4);
      }
      BSServiceXPCLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        if (*(_BYTE *)(a1 + 167))
        {
LABEL_34:
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
          return;
        }
        *(_BYTE *)(a1 + 164) = 1;
        if (!*(_QWORD *)(a1 + 128) || !objc_msgSend(*(id *)(a1 + 176), "isRoot"))
        {
LABEL_19:
          v12 = *(void **)(a1 + 128);
          *(_QWORD *)(a1 + 128) = 0;

          if (objc_msgSend(*(id *)(a1 + 88), "count"))
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v13 = *(id *)(a1 + 88);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v28;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v28 != v15)
                    objc_enumerationMutation(v13);
                  -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), a2);
                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
              }
              while (v14);
            }

          }
          if (*(_BYTE *)(a1 + 160))
            v17 = *(void **)(a1 + 144);
          else
            v17 = 0;
          v18 = v17;
          -[BSXPCServiceConnection _lock_invalidate](a1);
          if (v18)
          {
            v19 = *(void **)(a1 + 56);
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __59__BSXPCServiceConnection__parentDisconnectedWithInterrupt___block_invoke;
            v24[3] = &unk_1E390D478;
            v25 = v18;
            v26 = a1;
            objc_msgSend(v19, "performAsync:", v24);

          }
          goto LABEL_34;
        }
        if ((_DWORD)a2)
        {
          -[BSXPCServiceConnectionMessage setMessageID:](*(void **)(a1 + 128), CFSTR("interrupt"));
          BSServiceXPCLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = *(void **)(a1 + 8);
            *(_DWORD *)buf = 138543362;
            v33 = v9;
            v10 = "%{public}@ Sending interruption message";
LABEL_17:
            _os_log_impl(&dword_19A799000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
          }
        }
        else
        {
          BSServiceXPCLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *(void **)(a1 + 8);
            *(_DWORD *)buf = 138543362;
            v33 = v11;
            v10 = "%{public}@ Sending invalidation message";
            goto LABEL_17;
          }
        }

        objc_msgSend(*(id *)(a1 + 128), "send");
        goto LABEL_19;
      }
      v5 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v33 = v5;
      v6 = "%{public}@ Parent simulated interrupt";
    }
    else
    {
      BSServiceXPCLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      v7 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      v33 = v7;
      v6 = "%{public}@ Parent invalidated";
    }
    _os_log_impl(&dword_19A799000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    goto LABEL_9;
  }
}

- (os_unfair_lock_s)name
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  _QWORD *v3;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v3 = *(_QWORD **)&v1[36]._os_unfair_lock_opaque;
    if (v3)
      v3 = (_QWORD *)v3[18];
    v1 = v3;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)createMessageWithOptions:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
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
  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (!*(_BYTE *)(a1 + 160))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't create a message on %@ before calling activate the first time"), *(_QWORD *)(a1 + 8));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_createMessageWithOptions_);
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
      v27 = CFSTR("BSXPCServiceConnection.m");
      v28 = 1024;
      v29 = 268;
      v30 = 2114;
      v31 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B4D9CLL);
  }
  if (*(_BYTE *)(a1 + 162) && *(_BYTE *)(a1 + 161) && !(*(unsigned __int8 *)(a1 + 163) | a2 & 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot create a message before handshake has finished"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_createMessageWithOptions_);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      v21 = v17;
      v22 = 2114;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v19;
      v24 = 2048;
      v25 = a1;
      v26 = 2114;
      v27 = CFSTR("BSXPCServiceConnection.m");
      v28 = 1024;
      v29 = 271;
      v30 = 2114;
      v31 = v16;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B4E90);
  }
  if (*(_BYTE *)(a1 + 167))
    v5 = 0;
  else
    v5 = *(void **)(a1 + 72);
  +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, v5, *(void **)(a1 + 48), *(void **)(a1 + 112), *(_DWORD *)(a1 + 28), (void *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 176), "isChild"))
  {
    v7 = *(_QWORD *)(a1 + 176);
    if (v7)
      v8 = *(_QWORD *)(v7 + 32);
    else
      v8 = 0;
    -[BSXPCServiceConnectionMessage setChildIdentifier:](v6, v8);
    v9 = *(_QWORD *)(a1 + 176);
    if (v9)
      v10 = *(unsigned __int8 *)(v9 + 24) != 0;
    else
      v10 = 0;
    -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](v6, (const char *)v10);
  }
  -[BSXPCServiceConnectionMessage setReplyQueue:]((uint64_t)v6, *(void **)(a1 + 56));
  os_unfair_lock_unlock(v4);
  return v6;
}

void __42__BSXPCServiceConnection__lock_disconnect__block_invoke_2(uint64_t a1)
{
  +[BSXPCServiceConnectionPeer invalidateConnection:]((uint64_t)BSXPCServiceConnectionPeer, *(void **)(a1 + 32));
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

- (BSXPCServiceConnection)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSXPCServiceConnection *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSXPCServiceConnection *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSXPCServiceConnection"));
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
    v16 = CFSTR("BSXPCServiceConnection.m");
    v17 = 1024;
    v18 = 96;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSXPCServiceConnection *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)nullConnection
{
  BSXPCServiceConnection *v0;
  void *v1;
  id *v2;

  objc_opt_self();
  v0 = [BSXPCServiceConnection alloc];
  +[BSXPCServiceConnectionNullContext nullContext]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v0->super.isa, v1, 0);

  return v2;
}

- (os_unfair_lock_s)hasChildren
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (os_unfair_lock_s *)(objc_msgSend(*(id *)&v1[22]._os_unfair_lock_opaque, "count") != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)sendBarrierBlock:(uint64_t)a1
{
  void *v4;
  _xpc_connection_s *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_sendBarrierBlock_);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v20 = v9;
        v21 = 2114;
        v22 = v11;
        v23 = 2048;
        v24 = a1;
        v25 = 2114;
        v26 = CFSTR("BSXPCServiceConnection.m");
        v27 = 1024;
        v28 = 288;
        v29 = 2114;
        v30 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7DB344);
    }
    os_unfair_recursive_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 136), "commitWithReason:", CFSTR("send-barrier"));
    v4 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = 0;

    os_unfair_recursive_lock_unlock();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(_BYTE *)(a1 + 160))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't use a sendBarrier on %@ before calling activate the first time"), *(_QWORD *)(a1 + 8));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_sendBarrierBlock_);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v20 = v13;
        v21 = 2114;
        v22 = v15;
        v23 = 2048;
        v24 = a1;
        v25 = 2114;
        v26 = CFSTR("BSXPCServiceConnection.m");
        v27 = 1024;
        v28 = 296;
        v29 = 2114;
        v30 = v12;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7DB444);
    }
    v5 = *(_xpc_connection_s **)(a1 + 72);
    if (v5)
    {
      xpc_connection_send_barrier(v5, a2);
    }
    else
    {
      v6 = *(id *)(a1 + 56);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __43__BSXPCServiceConnection_sendBarrierBlock___block_invoke;
      v16[3] = &unk_1E390DD00;
      v17 = v6;
      v18 = a2;
      v7 = v6;
      objc_msgSend(v7, "performAsync:", v16);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

uint64_t __43__BSXPCServiceConnection_sendBarrierBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "assertBarrierOnQueue");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)activeMessageBatch
{
  id *v1;

  v1 = a1;
  if (a1)
  {
    os_unfair_recursive_lock_lock_with_options();
    v1 = (id *)v1[17];
    os_unfair_recursive_lock_unlock();
  }
  return v1;
}

+ (void)_invalidateIncomingXPCConnection:(uint64_t)a1
{
  void *v3;
  _QWORD barrier[5];

  objc_opt_self();
  +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_set_event_handler((xpc_connection_t)a2, &__block_literal_global_7);
  xpc_connection_activate((xpc_connection_t)a2);
  objc_msgSend(v3, "send");
  barrier[0] = MEMORY[0x1E0C809B0];
  barrier[1] = 3221225472;
  barrier[2] = __59__BSXPCServiceConnection__invalidateIncomingXPCConnection___block_invoke_2;
  barrier[3] = &unk_1E390D210;
  barrier[4] = a2;
  xpc_connection_send_barrier((xpc_connection_t)a2, barrier);

}

+ (id)_invalidationMessageForXPCConnection:(uint64_t)a1
{
  void *v3;

  objc_opt_self();
  +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, a2, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSXPCServiceConnectionMessage setMessageID:](v3, CFSTR("invalidate"));
  return v3;
}

void __59__BSXPCServiceConnection__invalidateIncomingXPCConnection___block_invoke_2(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

+ (id)_connectionWithIncomingXPCConnection:(void *)a3 endpointDescription:
{
  void *v5;
  uint64_t v6;
  void *v7;
  BSXPCServiceConnection *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  id v12;

  objc_opt_self();
  +[BSXPCServiceConnectionPeer peerOfConnection:]((uint64_t)BSXPCServiceConnectionPeer, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSStoreTokenFromXPCConnectionToVar();
  v6 = objc_msgSend(0, "pid");
  if ((int)v6 < 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(getRBSTargetClass(), "targetWithPid:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = [BSXPCServiceConnection alloc];
  +[BSXPCServiceConnectionRootServerContext uniqueServerContextWithEndpointDescription:]((uint64_t)BSXPCServiceConnectionRootServerContext, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v8->super.isa, v9, v7);

  objc_storeStrong(v10 + 9, a2);
  objc_storeStrong(v10 + 10, a2);
  objc_storeStrong(v10 + 4, v5);
  objc_storeStrong(v10 + 5, 0);
  +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, a2);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v10[16];
  v10[16] = (id)v11;

  return v10;
}

- (void)_makingInterruptCallout
{
  os_unfair_lock_s *v1;

  if (a1)
  {
    v1 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    BSClearTokenVar();
    os_unfair_lock_unlock(v1);
  }
}

- (unsigned)_stateDump
{
  unsigned __int8 *v1;
  os_unfair_lock_s *v2;

  v1 = (unsigned __int8 *)a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: p=<%@:%p> ch=%lu c=%i a=%i w=%i e=%i ri=%i ci=%i cie=%i i=%i>"), *((_QWORD *)v1 + 22), objc_opt_class(), *((_QWORD *)v1 + 19), objc_msgSend(*((id *)v1 + 11), "count"), v1[160], v1[161], v1[162], v1[163], v1[164], v1[165], v1[166], v1[167]);
    v1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (BOOL)shouldSendMessage:(id)a3
{
  BSXPCServiceConnectionMessageBatch *batchLock_batchMessage;
  void *v7;
  id v8;
  BSXPCServiceConnectionMessageBatch *v9;
  BSXPCServiceConnectionMessageBatch *v10;
  BSXPCServiceConnectionContext *v11;
  BSXPCServiceConnectionContext *v12;
  uint64_t isa;
  _BOOL8 v14;
  BSXPCServiceConnectionMessageBatch *v16;
  NSObject *v17;
  void *v18;
  BSXPCServiceConnectionMessageBatch *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  BSXPCServiceConnection *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  if (a3 && self->_configured_batchingHandler && *((_BYTE *)a3 + 60))
  {
    if (!-[BSXPCServiceConnectionMessageBatch appendMessage:](self->_batchLock_batchMessage, "appendMessage:", a3))
    {
      batchLock_batchMessage = self->_batchLock_batchMessage;
      if (batchLock_batchMessage
        && !-[BSXPCServiceConnectionMessageBatch didCommit](batchLock_batchMessage, "didCommit"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("previous batch message was not comitted"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v29 = v25;
          v30 = 2114;
          v31 = v27;
          v32 = 2048;
          v33 = self;
          v34 = 2114;
          v35 = CFSTR("BSXPCServiceConnection.m");
          v36 = 1024;
          v37 = 510;
          v38 = 2114;
          v39 = v24;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7DBD10);
      }
      -[BSXPCServiceConnectionMessage connection]((char *)a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *((id *)a3 + 9);
      +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessageBatch, v7, v8, 0, *((_DWORD *)a3 + 16), self);
      v9 = (BSXPCServiceConnectionMessageBatch *)objc_claimAutoreleasedReturnValue();
      v10 = self->_batchLock_batchMessage;
      self->_batchLock_batchMessage = v9;

      -[BSXPCServiceConnectionMessage setReplyQueue:]((uint64_t)self->_batchLock_batchMessage, self->_configured_connectionQueue);
      -[BSXPCServiceConnectionMessageBatch setBatchHandler:](self->_batchLock_batchMessage, "setBatchHandler:", self->_configured_batchingHandler);
      if (-[BSXPCServiceConnectionContext isChild](self->_context, "isChild"))
      {
        v11 = self->_context;
        v12 = v11;
        if (v11)
          isa = (uint64_t)v11[2].super.isa;
        else
          isa = 0;
        -[BSXPCServiceConnectionMessage setChildIdentifier:](self->_batchLock_batchMessage, isa);
        if (v12)
          v14 = LOBYTE(v12[1]._proem) != 0;
        else
          v14 = 0;
        -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](self->_batchLock_batchMessage, (const char *)v14);

      }
      if (!-[BSXPCServiceConnectionMessageBatch appendMessage:](self->_batchLock_batchMessage, "appendMessage:", a3))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("batched"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v29 = v21;
          v30 = 2114;
          v31 = v23;
          v32 = 2048;
          v33 = self;
          v34 = 2114;
          v35 = CFSTR("BSXPCServiceConnection.m");
          v36 = 1024;
          v37 = 524;
          v38 = 2114;
          v39 = v20;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7DBC1CLL);
      }
    }
    os_unfair_recursive_lock_unlock();
    return 0;
  }
  else
  {
    v16 = self->_batchLock_batchMessage;
    if (v16)
    {
      if (v16 == a3)
      {
        self->_batchLock_batchMessage = 0;

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (-[BSXPCServiceConnectionMessageBatch commitWithReason:](self->_batchLock_batchMessage, "commitWithReason:", CFSTR("non-batching-message")))
          {
            BSServiceXPCBatchLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              -[BSXPCServiceConnectionMessage selectorName](a3);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v29 = v18;
              _os_log_impl(&dword_19A799000, v17, OS_LOG_TYPE_DEFAULT, "force-commit batched message due to non-batching message: %{public}@", buf, 0xCu);

            }
          }
          v19 = self->_batchLock_batchMessage;
          self->_batchLock_batchMessage = 0;

        }
      }
    }
    os_unfair_recursive_lock_unlock();
    return 1;
  }
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke(uint64_t a1)
{
  -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:](*(_QWORD *)(a1 + 32), MEMORY[0x1E0C81260], 1);
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_124(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "sendIfNecessary");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_131(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  -[BSXPCServiceConnection _connection_consumeLock_runPendedEventsIfAppropriate](*(_QWORD *)(a1 + 32));
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_134(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  BSServiceXPCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19A799000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Established.", (uint8_t *)&v5, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
  -[BSXPCServiceConnectionEventHandler connectionActivated:](*(_QWORD **)(a1 + 40), *(os_unfair_lock_s **)(a1 + 32));
}

uint64_t __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_135(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_2_136(uint64_t a1)
{
  _QWORD *v2;
  os_unfair_lock_s *v3;
  void *v4;
  _QWORD *v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(os_unfair_lock_s **)(a1 + 40);
  BSServiceConnectionErrorCreate(2uLL, MEMORY[0x1E0C81260], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSXPCServiceConnectionEventHandler connection:handleError:](v2, v3, v4);

  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    -[BSXPCServiceConnectionEventHandler _connectionInvalidated:](v5, *(os_unfair_lock_s **)(a1 + 40));
}

uint64_t __75__BSXPCServiceConnection__connection_consumeLock_handleError_notYetLocked___block_invoke()
{
  return -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:]();
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  BSXPCServiceConnectionPeer *lock_peer;
  BSXPCServiceConnectionPeer *v5;
  void *v6;
  BSXPCServiceConnectionContext *context;
  void *v8;
  BSXPCServiceConnectionContext *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_peer = self->_lock_peer;
  if (lock_peer)
    lock_peer = (BSXPCServiceConnectionPeer *)lock_peer->_processHandle;
  v5 = lock_peer;
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  if (context)
    context = (BSXPCServiceConnectionContext *)context->_proem;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = context;
  -[BSXPCServiceConnectionContext endpointDescription](self->_context, "endpointDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v11, 0);

  if (v5)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[BSXPCServiceConnectionPeer name](v5, "name");
    v9 = (BSXPCServiceConnectionContext *)objc_claimAutoreleasedReturnValue();
    v13 = v9 == 0;
    v14 = (const __CFString *)v9;
    if (!v9)
    {
      -[BSXPCServiceConnectionPeer bundleIdentifier](v5, "bundleIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v15;
      if (v15)
        v14 = (const __CFString *)v15;
      else
        v14 = CFSTR("?");
    }
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:%d"), v14, -[BSXPCServiceConnectionPeer pid](v5, "pid"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v16 = CFSTR("TBD");
  }
  objc_msgSend(v6, "appendString:withName:", v16, CFSTR("peer"));
  if (v5)

  if (v13)
  if (v5)

  objc_msgSend(v6, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

@end
