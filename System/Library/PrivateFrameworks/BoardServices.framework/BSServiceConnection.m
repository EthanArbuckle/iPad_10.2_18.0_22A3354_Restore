@implementation BSServiceConnection

- (id)remoteTarget
{
  return -[BSXPCServiceConnection remoteTargetWithAssertionAttributes:enforcingLaunchConstraints:]((os_unfair_lock_s *)self->_connection, 0, 0);
}

+ (BSServiceConnectionContext)currentContext
{
  return (BSServiceConnectionContext *)+[BSServiceConnection _currentConnection]();
}

+ (id)connectionWithEndpoint:(id)a3 clientContextBuilder:(id)a4
{
  return +[BSServiceConnection _connectionWithEndpoint:clientContextBuilder:]((uint64_t)BSServiceConnection, (uint64_t)a3, (uint64_t)a4);
}

- (NSCopying)userInfo
{
  os_unfair_lock_s *p_lock;
  NSCopying *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)configureConnection:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__BSServiceConnection_configureConnection___block_invoke;
  v3[3] = &unk_1E390D288;
  v3[4] = a3;
  -[BSServiceConnection _configureConnection:](self, "_configureConnection:", v3);
}

- (void)_configureConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BSServiceConnection *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_config)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("configure called after activation or invalidation"));
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
      v18 = CFSTR("BSServiceConnection.m");
      v19 = 1024;
      v20 = 477;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A50F8);
  }
  (*((void (**)(id))a3 + 2))(a3);
  objc_storeStrong((id *)&self->_userInfo, self->_lock_config->_userInfo);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __43__BSServiceConnection_configureConnection___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_currentConnection
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  objc_opt_self();
  +[BSXPCServiceConnection currentContext]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  v2 = v0;
  if (v1)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (NSString)service
{
  return self->_service;
}

- (id)_clientContext
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0D018A0];
    -[BSXPCServiceConnection initiatingContext](*(os_unfair_lock_s **)(a1 + 8));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("clientContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "coderWithMessage:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)instance
{
  return self->_instance;
}

+ (id)_connectionFromIncomingConnection:(char)a3 requiresMessagingAfterHandshake:
{
  void *v5;
  void *v6;
  BSServiceConnection *v7;
  void *v8;
  id *v9;

  objc_opt_self();
  -[BSXPCServiceConnection initiatingContext](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeStringForKey:", CFSTR("s"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [BSServiceConnection alloc];
    objc_msgSend(v5, "decodeStringForKey:", CFSTR("i"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BSServiceConnection _initWithConnection:service:instance:requiresMessagingAfterHandshake:clientContext:]((id *)&v7->super.isa, a2, v6, v8, a3, 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceConnection *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_lock_noAssertInvalidatedOnDealloc && !self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidation must occur before letting the connection dealloc for %@ : cnx=%@"), self->_name, self->_connection);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BSServiceConnection.m");
      v17 = 1024;
      v18 = 202;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A640CLL);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSServiceConnection;
  -[BSServiceConnection dealloc](&v8, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  _BSServiceConnectionConfiguration *lock_config;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_config = self->_lock_config;
  self->_lock_config = 0;

  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  -[BSXPCServiceConnection invalidate](self->_connection, "invalidate");
}

+ (id)_connectionWithEndpoint:(uint64_t)a3 clientContextBuilder:
{
  void *v5;
  void *v6;
  void *v7;
  BSServiceConnection *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  uint64_t v17;
  void *v18;

  objc_opt_self();
  objc_msgSend((id)a2, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_12;
  if (objc_msgSend((id)a2, "isNullEndpoint"))
  {
    +[BSXPCServiceConnection nullConnection]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_4;
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v13 = *(id *)(a2 + 40);
    v14 = *(void **)(a2 + 48);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  v15 = v14;
  v16 = objc_msgSend((id)a2, "isNonLaunching");
  if (a2)
    v17 = *(unsigned int *)(a2 + 16);
  else
    v17 = 0;
  objc_msgSend((id)a2, "targetDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[BSServiceManager newConnectionWithEndpoint:oneshot:nonLaunching:targetPID:description:]((uint64_t)v12, v13, v15, v16, v17, v18);

  if (!v6)
    goto LABEL_12;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0D018A0], "coder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v7);
  v8 = [BSServiceConnection alloc];
  objc_msgSend((id)a2, "instance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BSServiceConnection _initWithConnection:service:instance:requiresMessagingAfterHandshake:clientContext:]((id *)&v8->super.isa, v6, v5, v9, 0, v10);

LABEL_13:
  return v11;
}

- (id)_initWithConnection:(void *)a3 service:(void *)a4 instance:(char)a5 requiresMessagingAfterHandshake:(void *)a6 clientContext:
{
  id *v6;
  id v11;
  id v12;
  id *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  id v24;
  _BSServiceConnectionConfiguration *v25;
  id *v26;
  id *v27;
  id v28;
  void *v30;
  id v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  objc_class *v36;
  void *v37;
  void *v38;
  id v39;
  objc_class *v40;
  void *v41;
  objc_super v42;
  _BYTE v43[22];
  __int16 v44;
  id *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v6 = a1;
  v52 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("connection"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithConnection_service_instance_requiresMessagingAfterHandshake_clientContext_);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v43 = 138544642;
        *(_QWORD *)&v43[4] = v31;
        *(_WORD *)&v43[12] = 2114;
        *(_QWORD *)&v43[14] = v33;
        v44 = 2048;
        v45 = v6;
        v46 = 2114;
        v47 = CFSTR("BSServiceConnection.m");
        v48 = 1024;
        v49 = 185;
        v50 = 2114;
        v51 = v30;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v43, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A7558);
    }
    v11 = a3;
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithConnection_service_instance_requiresMessagingAfterHandshake_clientContext_);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v43 = 138544642;
        *(_QWORD *)&v43[4] = v35;
        *(_WORD *)&v43[12] = 2114;
        *(_QWORD *)&v43[14] = v37;
        v44 = 2048;
        v45 = v6;
        v46 = 2114;
        v47 = CFSTR("BSServiceConnection.m");
        v48 = 1024;
        v49 = 186;
        v50 = 2114;
        v51 = v34;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v43, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A7658);
    }

    v12 = a4;
    if (v12)
    {
      NSClassFromString(CFSTR("NSString"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithConnection_service_instance_requiresMessagingAfterHandshake_clientContext_);
          v39 = (id)objc_claimAutoreleasedReturnValue();
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v43 = 138544642;
          *(_QWORD *)&v43[4] = v39;
          *(_WORD *)&v43[12] = 2114;
          *(_QWORD *)&v43[14] = v41;
          v44 = 2048;
          v45 = v6;
          v46 = 2114;
          v47 = CFSTR("BSServiceConnection.m");
          v48 = 1024;
          v49 = 187;
          v50 = 2114;
          v51 = v38;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v43, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7A7758);
      }
    }

    v42.receiver = v6;
    v42.super_class = (Class)BSServiceConnection;
    v13 = (id *)objc_msgSendSuper2(&v42, sel_init);
    v6 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a2);
      v14 = objc_msgSend(v11, "copy");
      v15 = v6[8];
      v6[8] = (id)v14;

      v16 = objc_msgSend(v12, "copy");
      v17 = v6[9];
      v6[9] = (id)v16;

      v18 = v6[8];
      v19 = v6[9];
      objc_opt_self();
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("BSCnx:"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (a6)
        v22 = CFSTR("client:");
      else
        v22 = CFSTR("host:");
      objc_msgSend(v20, "appendString:", v22);
      objc_msgSend(v21, "appendString:", v18);
      if (v19)
      {
        objc_msgSend(v21, "appendString:", CFSTR(":"));
        objc_msgSend(v21, "appendString:", v19);
      }
      v23 = objc_msgSend(v21, "copy");

      v24 = v6[2];
      v6[2] = (id)v23;

      *((_DWORD *)v6 + 8) = 0;
      *((_BYTE *)v6 + 58) = a5;
      v25 = [_BSServiceConnectionConfiguration alloc];
      if (v25)
      {
        *(_QWORD *)v43 = v25;
        *(_QWORD *)&v43[8] = _BSServiceConnectionConfiguration;
        v26 = (id *)objc_msgSendSuper2((objc_super *)v43, sel_init);
        v27 = v26;
        if (v26)
        {
          v26[1] = v6 + 4;
          objc_storeStrong(v26 + 2, a6);
        }
      }
      else
      {
        v27 = 0;
      }
      v28 = v6[5];
      v6[5] = v27;

    }
  }
  return v6;
}

void __31__BSServiceConnection_activate__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  _QWORD v59[4];
  void *v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[5];
  void *v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id location;
  _QWORD v75[5];

  objc_msgSend(MEMORY[0x1E0D018B0], "referenceWithObject:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSXPCServiceConnectionEventHandler setContext:]((uint64_t)a2, v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD **)(v5 + 40);
  v7 = MEMORY[0x1E0C809B0];
  if (v6[2])
  {
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __31__BSServiceConnection_activate__block_invoke_2;
    v75[3] = &unk_1E390D2B0;
    v75[4] = v5;
    -[BSXPCServiceConnectionEventHandler encodeInitiatingContext:]((uint64_t)a2, (uint64_t)v75);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD **)(v5 + 40);
  }
  v8 = (void *)v6[4];
  if (!v8)
    v8 = *(void **)(v5 + 16);
  if (a2)
  {
    v9 = objc_msgSend(v8, "copy");
    v10 = (void *)a2[18];
    a2[18] = v9;

    v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 40), "copy");
    v12 = (void *)a2[21];
    a2[21] = v11;

    v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
    v13 = (void *)v6[6];
    if (v13)
    {
      v14 = objc_msgSend(v13, "copy");
      v15 = (void *)a2[22];
      a2[22] = v14;

      v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
    }
  }
  v16 = (void *)v6[7];
  if (v16)
  {
    -[BSXPCServiceConnectionEventHandler setInterfaceTarget:]((uint64_t)a2, v16);
    v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
  }
  v17 = (void *)v6[11];
  if (v17)
  {
    -[BSXPCServiceConnectionEventHandler setTargetQueue:]((uint64_t)a2, v17);
    v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
  }
  v18 = (void *)v6[12];
  if (v18)
  {
    -[BSXPCServiceConnectionEventHandler setTargetDispatchingQueue:]((uint64_t)a2, v18);
    v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
  }
  v19 = (void *)MEMORY[0x19AECAA00](v6[13]);
  if (v19)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v71[0] = v7;
    v71[1] = 3221225472;
    v71[2] = __31__BSServiceConnection_activate__block_invoke_3;
    v71[3] = &unk_1E390D2D8;
    objc_copyWeak(&v73, &location);
    v20 = v19;
    v72 = v20;
    if (a2)
    {
      v21 = objc_msgSend(v71, "copy");
      v22 = (void *)a2[15];
      a2[15] = v21;

      v20 = v72;
    }

    objc_destroyWeak(&v73);
    objc_destroyWeak(&location);
  }
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(_QWORD *)(v23 + 40);
  v25 = *(void **)(v24 + 112);
  if (v25)
  {
    if (a2)
    {
      v26 = objc_msgSend(v25, "copy");
      v27 = (void *)a2[10];
      a2[10] = v26;

      v28 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(*(_QWORD *)(v28 + 40) + 120))
      {
        *(_BYTE *)(v28 + 57) = 1;
LABEL_24:
        v29 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 120), "copy");
        v30 = (void *)a2[11];
        a2[11] = v29;

      }
    }
    else if (*(_QWORD *)(v24 + 120))
    {
      *(_BYTE *)(v23 + 57) = 1;
    }
  }
  else if (*(_QWORD *)(v24 + 120))
  {
    *(_BYTE *)(v23 + 57) = 1;
    if (a2)
      goto LABEL_24;
  }
  v31 = objc_msgSend(*(id *)(a1 + 40), "isServer");
  v32 = *(_QWORD *)(a1 + 32);
  if ((v31 & 1) != 0 || *(_BYTE *)(v32 + 57))
  {
    v33 = *(_QWORD **)(v32 + 40);
    if (v33[8])
    {
      v69[0] = v7;
      v69[1] = 3221225472;
      v69[2] = __31__BSServiceConnection_activate__block_invoke_4;
      v69[3] = &unk_1E390D300;
      v70 = (id)MEMORY[0x19AECAA00]();
      v34 = v70;
      v35 = v34;
      if (a2)
      {
        v36 = objc_msgSend(v69, "copy");
        v37 = (void *)a2[12];
        a2[12] = v36;

        v35 = v70;
      }

      v33 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
    }
    if (v33[9])
    {
      v67[0] = v7;
      v67[1] = 3221225472;
      v67[2] = __31__BSServiceConnection_activate__block_invoke_140;
      v67[3] = &unk_1E390D300;
      v68 = (id)MEMORY[0x19AECAA00]();
      v38 = v68;
      v39 = v38;
      if (a2)
      {
        v40 = objc_msgSend(v67, "copy");
        v41 = (void *)a2[13];
        a2[13] = v40;

        v39 = v68;
      }

      v33 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
    }
    v42 = (void *)MEMORY[0x19AECAA00](v33[10]);
    v65[0] = v7;
    v65[1] = 3221225472;
    v65[2] = __31__BSServiceConnection_activate__block_invoke_143;
    v65[3] = &unk_1E390D328;
    v65[4] = *(_QWORD *)(a1 + 32);
    v66 = v42;
    v43 = v42;
    v44 = v43;
    if (a2)
    {
      v45 = objc_msgSend(v65, "copy");
      v46 = (void *)a2[14];
      a2[14] = v45;

      v44 = v66;
    }
  }
  else
  {
    v47 = *(_QWORD **)(v32 + 40);
    if (v47[8])
    {
      v63[0] = v7;
      v63[1] = 3221225472;
      v63[2] = __31__BSServiceConnection_activate__block_invoke_146;
      v63[3] = &unk_1E390D300;
      v64 = (id)MEMORY[0x19AECAA00]();
      v48 = v64;
      v49 = v48;
      if (a2)
      {
        v50 = objc_msgSend(v63, "copy");
        v51 = (void *)a2[12];
        a2[12] = v50;

        v49 = v64;
      }

      v47 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
    }
    if (v47[9])
    {
      v61[0] = v7;
      v61[1] = 3221225472;
      v61[2] = __31__BSServiceConnection_activate__block_invoke_147;
      v61[3] = &unk_1E390D300;
      v62 = (id)MEMORY[0x19AECAA00]();
      v52 = v62;
      v53 = v52;
      if (a2)
      {
        v54 = objc_msgSend(v61, "copy");
        v55 = (void *)a2[13];
        a2[13] = v54;

        v53 = v62;
      }

      v47 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
    }
    v56 = (void *)MEMORY[0x19AECAA00](v47[10]);
    v59[0] = v7;
    v59[1] = 3221225472;
    v59[2] = __31__BSServiceConnection_activate__block_invoke_148;
    v59[3] = &unk_1E390D300;
    v60 = v56;
    v43 = v56;
    v44 = v43;
    if (a2)
    {
      v57 = objc_msgSend(v59, "copy");
      v58 = (void *)a2[14];
      a2[14] = v57;

      v44 = v60;
    }
  }

}

uint64_t __31__BSServiceConnection_activate__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), CFSTR("s"));
  objc_msgSend(a2, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), CFSTR("i"));
  return objc_msgSend(a2, "encodeXPCObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16), CFSTR("clientContext"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_lock_activatedSignal, 0);
  objc_storeStrong((id *)&self->_lock_config, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (BSAuditToken)remoteToken
{
  return (BSAuditToken *)-[BSXPCServiceConnection auditToken]((os_unfair_lock_s *)self->_connection);
}

- (void)activate
{
  os_unfair_lock_s *p_lock;
  BSXPCServiceConnection *connection;
  BSXPCServiceConnection *v6;
  _BSServiceConnectionConfiguration *lock_config;
  BSServiceInterface *interface;
  void *v9;
  int v10;
  BSServiceInterface *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BSXPCServiceConnection *v19;
  BSXPCServiceConnection *v20;
  _BSServiceConnectionConfiguration *v21;
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
  void *v34;
  id v35;
  objc_class *v36;
  void *v37;
  void *v38;
  id v39;
  objc_class *v40;
  void *v41;
  void *v42;
  id v43;
  objc_class *v44;
  void *v45;
  void *v46;
  id v47;
  objc_class *v48;
  void *v49;
  _QWORD v50[5];
  BSXPCServiceConnection *v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  BSServiceConnection *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_config)
  {
    connection = self->_connection;
    if (connection)
      connection = (BSXPCServiceConnection *)connection->_context;
    v6 = connection;
    lock_config = self->_lock_config;
    if (!lock_config->_serviceQuality)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("serviceQuality must be specified before activation"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v53 = v27;
        v54 = 2114;
        v55 = v29;
        v56 = 2048;
        v57 = self;
        v58 = 2114;
        v59 = CFSTR("BSServiceConnection.m");
        v60 = 1024;
        v61 = 298;
        v62 = 2114;
        v63 = v26;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A9FE8);
    }
    interface = lock_config->_interface;
    if (interface)
    {
      -[BSServiceInterface identifier](interface, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && !-[NSString isEqualToString:](self->_service, "isEqualToString:", v9))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interface's identifier doesn't match our service"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v53 = v31;
          v54 = 2114;
          v55 = v33;
          v56 = 2048;
          v57 = self;
          v58 = 2114;
          v59 = CFSTR("BSServiceConnection.m");
          v60 = 1024;
          v61 = 302;
          v62 = 2114;
          v63 = v30;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7AA0DCLL);
      }
      if (self->_requiresMessagingAfterHandshake
        && -[BSServiceInterface clientMessagingExpectation](self->_lock_config->_interface, "clientMessagingExpectation") != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("incompatible clientMessagingExpectation for this connection"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v35 = (id)objc_claimAutoreleasedReturnValue();
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v53 = v35;
          v54 = 2114;
          v55 = v37;
          v56 = 2048;
          v57 = self;
          v58 = 2114;
          v59 = CFSTR("BSServiceConnection.m");
          v60 = 1024;
          v61 = 304;
          v62 = 2114;
          v63 = v34;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7AA1D0);
      }
      v10 = -[BSXPCServiceConnection isClient](v6, "isClient");
      v11 = self->_lock_config->_interface;
      if (v10)
        -[BSServiceInterface client](v11, "client");
      else
        -[BSServiceInterface server](v11, "server");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "methods");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 && !self->_lock_config->_target)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("target must be specified if the local interface is not empty"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v39 = (id)objc_claimAutoreleasedReturnValue();
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          *(_DWORD *)buf = 138544642;
          v53 = v39;
          v54 = 2114;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v41;
          v56 = 2048;
          v57 = self;
          v58 = 2114;
          v59 = CFSTR("BSServiceConnection.m");
          v60 = 1024;
          v61 = 308;
          v62 = 2114;
          v63 = v38;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7AA2C4);
      }

      lock_config = self->_lock_config;
    }
    else
    {
      if (lock_config->_target)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interface must be specified if you specified a target"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v53 = v23;
          v54 = 2114;
          v55 = v25;
          v56 = 2048;
          v57 = self;
          v58 = 2114;
          v59 = CFSTR("BSServiceConnection.m");
          v60 = 1024;
          v61 = 300;
          v62 = 2114;
          v63 = v22;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7A9EF4);
      }
      if (!lock_config->_messageHandler)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("some form of interface handler must be specified before activation"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v47 = (id)objc_claimAutoreleasedReturnValue();
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v53 = v47;
          v54 = 2114;
          v55 = v49;
          v56 = 2048;
          v57 = self;
          v58 = 2114;
          v59 = CFSTR("BSServiceConnection.m");
          v60 = 1024;
          v61 = 311;
          v62 = 2114;
          v63 = v46;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7AA4ACLL);
      }
      if (self->_requiresMessagingAfterHandshake)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("raw message handlers aren't supported on this connection"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v53 = v13;
          v54 = 2114;
          v55 = v15;
          v56 = 2048;
          v57 = self;
          v58 = 2114;
          v59 = CFSTR("BSServiceConnection.m");
          v60 = 1024;
          v61 = 312;
          v62 = 2114;
          v63 = v12;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7A9D08);
      }
    }
    if (!lock_config->_invalidationHandler && !lock_config->_errorHandler)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you must configure an invalidation handler"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v53 = v43;
        v54 = 2114;
        v55 = v45;
        v56 = 2048;
        v57 = self;
        v58 = 2114;
        v59 = CFSTR("BSServiceConnection.m");
        v60 = 1024;
        v61 = 314;
        v62 = 2114;
        v63 = v42;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AA3B8);
    }
    v19 = self->_connection;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __31__BSServiceConnection_activate__block_invoke;
    v50[3] = &unk_1E390D1D0;
    v50[4] = self;
    v20 = v6;
    v51 = v20;
    -[BSXPCServiceConnection configure:]((uint64_t)v19, (uint64_t)v50);
    v21 = self->_lock_config;
    self->_lock_config = 0;

  }
  -[BSXPCServiceConnection activateNowOrWhenReady:]((uint64_t)self->_connection, 0);
  os_unfair_lock_unlock(p_lock);
}

void __51__BSServiceConnection__extractUnderlyingConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__BSServiceConnection__extractUnderlyingConnection__block_invoke_2;
    v7[3] = &unk_1E390D350;
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v4;
    -[BSXPCServiceConnectionEventHandler encodeInitiatingContext:](a2, (uint64_t)v7);

  }
  if (a2)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "copy");
    v6 = *(void **)(a2 + 144);
    *(_QWORD *)(a2 + 144) = v5;

  }
}

uint64_t __51__BSServiceConnection__extractUnderlyingConnection__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), CFSTR("s"));
  objc_msgSend(a2, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), CFSTR("i"));
  return objc_msgSend(a2, "encodeXPCObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("clientContext"));
}

- (id)remoteTargetWithLaunchingAssertionAttributes:(id)a3
{
  return -[BSXPCServiceConnection remoteTargetWithAssertionAttributes:enforcingLaunchConstraints:]((os_unfair_lock_s *)self->_connection, a3, 1);
}

- (id)createMessage
{
  return -[BSXPCServiceConnection createMessageWithOptions:]((uint64_t)self->_connection, 0);
}

- (BSProcessHandle)remoteProcess
{
  _QWORD *v2;
  void *v3;
  BSProcessHandle *v4;

  -[BSXPCServiceConnection peer]((os_unfair_lock_s *)self->_connection);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[4];
  v4 = v2;

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BSXPCServiceConnection name]((os_unfair_lock_s *)self->_connection);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>"), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)createMessageWithCompletion:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;

  -[BSXPCServiceConnection createMessageWithOptions:]((uint64_t)self->_connection, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v5, a3, 80);
  return v6;
}

+ (id)NSXPCConnectionWithEndpoint:(id)a3 configurator:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v22 = v14;
      v23 = 2114;
      v24 = v16;
      v25 = 2048;
      v26 = a1;
      v27 = 2114;
      v28 = CFSTR("BSServiceConnection+NSXPCConnection.m");
      v29 = 1024;
      v30 = 23;
      v31 = 2114;
      v32 = v13;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B6FC4);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("configurator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v22 = v18;
      v23 = 2114;
      v24 = v20;
      v25 = 2048;
      v26 = a1;
      v27 = 2114;
      v28 = CFSTR("BSServiceConnection+NSXPCConnection.m");
      v29 = 1024;
      v30 = 24;
      v31 = 2114;
      v32 = v17;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B70C4);
  }
  +[BSServiceConnection connectionWithEndpoint:](BSServiceConnection, "connectionWithEndpoint:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extractNSXPCConnectionWithConfigurator:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)connectionWithEndpoint:(id)a3
{
  return +[BSServiceConnection _connectionWithEndpoint:clientContextBuilder:]((uint64_t)BSServiceConnection, (uint64_t)a3, 0);
}

- (id)extractNSXPCConnectionWithConfigurator:(id)a3
{
  id v5;
  void *v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  BSServiceConnection *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("configurator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 2048;
      v23 = self;
      v24 = 2114;
      v25 = CFSTR("BSServiceConnection+NSXPCConnection.m");
      v26 = 1024;
      v27 = 38;
      v28 = 2114;
      v29 = v10;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B7328);
  }
  -[BSServiceConnection _extractUnderlyingConnection]((os_unfair_lock_s *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("connection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v19 = v15;
      v20 = 2114;
      v21 = v17;
      v22 = 2048;
      v23 = self;
      v24 = 2114;
      v25 = CFSTR("BSServiceConnection+NSXPCConnection.m");
      v26 = 1024;
      v27 = 41;
      v28 = 2114;
      v29 = v14;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B7428);
  }
  v7 = -[BSNSXPCTransport _initWithConnection:configurator:assertionProvider:]((os_unfair_lock_s *)[BSNSXPCTransport alloc], v6, v5, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "_initWithCustomTransport:", v7);
  objc_setAssociatedObject(v8, "BSServiceConnectionTransport", v7, (void *)1);

  return v8;
}

- (os_unfair_lock_s)_extractUnderlyingConnection
{
  os_unfair_lock_s *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
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
  os_unfair_lock_s *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  os_unfair_lock_s *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v1 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock(a1 + 8);
    if (!*(_QWORD *)&v1[10]._os_unfair_lock_opaque)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot extract connection after activation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__extractUnderlyingConnection);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v20 = v9;
        v21 = 2114;
        v22 = v11;
        v23 = 2048;
        v24 = v1;
        v25 = 2114;
        v26 = CFSTR("BSServiceConnection.m");
        v27 = 1024;
        v28 = 506;
        v29 = 2114;
        v30 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B787CLL);
    }
    v2 = *(void **)&v1[2]._os_unfair_lock_opaque;
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot extract connection twice"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__extractUnderlyingConnection);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v20 = v13;
        v21 = 2114;
        v22 = v15;
        v23 = 2048;
        v24 = v1;
        v25 = 2114;
        v26 = CFSTR("BSServiceConnection.m");
        v27 = 1024;
        v28 = 507;
        v29 = 2114;
        v30 = v12;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B7970);
    }
    v3 = v2;
    v4 = *(id *)(*(_QWORD *)&v1[10]._os_unfair_lock_opaque + 16);
    v5 = *(void **)&v1[2]._os_unfair_lock_opaque;
    *(_QWORD *)&v1[2]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v1 + 8);
    -[os_unfair_lock_s invalidate](v1, "invalidate");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__BSServiceConnection__extractUnderlyingConnection__block_invoke;
    v16[3] = &unk_1E390D1D0;
    v6 = v4;
    v17 = v6;
    v18 = v1;
    -[BSXPCServiceConnection configure:]((uint64_t)v3, (uint64_t)v16);
    v1 = (os_unfair_lock_s *)v3;

  }
  return v1;
}

+ (id)NSXPCConnectionWithEndpoint:(id)a3 clientContextBuilder:(id)a4 configurator:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
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
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v29 = v17;
      v30 = 2114;
      v31 = v19;
      v32 = 2048;
      v33 = a1;
      v34 = 2114;
      v35 = CFSTR("BSServiceConnection+NSXPCConnection.m");
      v36 = 1024;
      v37 = 31;
      v38 = 2114;
      v39 = v16;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BCB84);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
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
      v33 = a1;
      v34 = 2114;
      v35 = CFSTR("BSServiceConnection+NSXPCConnection.m");
      v36 = 1024;
      v37 = 32;
      v38 = 2114;
      v39 = v20;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BCC84);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("configurator"));
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
      v33 = a1;
      v34 = 2114;
      v35 = CFSTR("BSServiceConnection+NSXPCConnection.m");
      v36 = 1024;
      v37 = 33;
      v38 = 2114;
      v39 = v24;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BCD84);
  }
  +[BSServiceConnection connectionWithEndpoint:clientContextBuilder:](BSServiceConnection, "connectionWithEndpoint:clientContextBuilder:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extractNSXPCConnectionWithConfigurator:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BSServiceConnection)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceConnection *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceConnection *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSServiceConnection"));
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
    v16 = CFSTR("BSServiceConnection.m");
    v17 = 1024;
    v18 = 176;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceConnection *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __31__BSServiceConnection_activate__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __31__BSServiceConnection_activate__block_invoke_4(uint64_t a1, os_unfair_lock_s *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[BSServiceConnection _currentConnection]();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[BSXPCServiceConnection _stateDump](a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSXPCServiceConnection currentContext]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSXPCServiceConnection _eventHandler](a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSXPCServiceConnection _eventHandler](a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = *(void **)(v8 + 144);
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "threadDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: _currentConnection is nil in activation handler : context=%@ : eventHandler=%@ : name=%@ : t=%@ : tls=%@"), v5, v6, v7, v11, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSServiceConnection activate]_block_invoke_4");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v19 = v16;
      v20 = 2114;
      v21 = CFSTR("BSServiceConnection.m");
      v22 = 1024;
      v23 = 371;
      v24 = 2114;
      v25 = v15;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C2AE4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __31__BSServiceConnection_activate__block_invoke_140(uint64_t a1, os_unfair_lock_s *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[BSServiceConnection _currentConnection]();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[BSXPCServiceConnection _stateDump](a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSXPCServiceConnection currentContext]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSXPCServiceConnection _eventHandler](a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSXPCServiceConnection _eventHandler](a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = *(void **)(v8 + 144);
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "threadDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: _currentConnection is nil in interrupt handler : context=%@ : eventHandler=%@ : name=%@ : t=%@ : tls=%@"), v5, v6, v7, v11, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSServiceConnection activate]_block_invoke");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v19 = v16;
      v20 = 2114;
      v21 = CFSTR("BSServiceConnection.m");
      v22 = 1024;
      v23 = 380;
      v24 = 2114;
      v25 = v15;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C2D7CLL);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __31__BSServiceConnection_activate__block_invoke_143(uint64_t a1, os_unfair_lock_s *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[BSServiceConnection _currentConnection]();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[BSXPCServiceConnection _stateDump](a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSXPCServiceConnection currentContext]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSXPCServiceConnection _eventHandler](a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSXPCServiceConnection _eventHandler](a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = *(void **)(v8 + 144);
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "threadDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: _currentConnection is nil in invalidation handler : context=%@ : eventHandler=%@ : name=%@ : t=%@ : tls=%@"), v5, v6, v7, v11, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSServiceConnection activate]_block_invoke");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v19 = v16;
      v20 = 2114;
      v21 = CFSTR("BSServiceConnection.m");
      v22 = 1024;
      v23 = 388;
      v24 = 2114;
      v25 = v15;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C3038);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __31__BSServiceConnection_activate__block_invoke_146(uint64_t a1, os_unfair_lock_s *a2)
{
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[BSServiceConnection _currentConnection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    BSServiceXPCErrorsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[BSXPCServiceConnection _stateDump](a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      +[BSXPCServiceConnection currentContext]();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = *(void **)(v9 + 144);
      else
        v11 = 0;
      v12 = v11;
      v13 = 138413058;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v12;
      _os_log_error_impl(&dword_19A799000, v5, OS_LOG_TYPE_ERROR, "%@: dropping activation handler because _currentConnection is unexpectedly nil (client bug) : context=%@ : eventHandler=%@ : name=%@", (uint8_t *)&v13, 0x2Au);

    }
  }

}

void __31__BSServiceConnection_activate__block_invoke_147(uint64_t a1, os_unfair_lock_s *a2)
{
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[BSServiceConnection _currentConnection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    BSServiceXPCErrorsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[BSXPCServiceConnection _stateDump](a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      +[BSXPCServiceConnection currentContext]();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = *(void **)(v9 + 144);
      else
        v11 = 0;
      v12 = v11;
      v13 = 138413058;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v12;
      _os_log_error_impl(&dword_19A799000, v5, OS_LOG_TYPE_ERROR, "%@: dropping interrupt handler because _currentConnection is unexpectedly nil (client bug) : context=%@ : eventHandler=%@ : name=%@", (uint8_t *)&v13, 0x2Au);

    }
  }

}

void __31__BSServiceConnection_activate__block_invoke_148(uint64_t a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[BSServiceConnection _currentConnection]();
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    os_unfair_lock_lock(v4 + 8);
    LOBYTE(v5[14]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v5 + 8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    BSServiceXPCErrorsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[BSXPCServiceConnection _stateDump](a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      +[BSXPCServiceConnection currentContext]();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a2);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = *(void **)(v10 + 144);
      else
        v12 = 0;
      v13 = v12;
      v14 = 138413058;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v13;
      _os_log_error_impl(&dword_19A799000, v6, OS_LOG_TYPE_ERROR, "%@: dropping invalidation handler because _currentConnection is unexpectedly nil (client bug) : context=%@ : eventHandler=%@ : name=%@", (uint8_t *)&v14, 0x2Au);

    }
  }

}

- (id)remoteTargetWithAssertionAttributes:(id)a3
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
  BSServiceConnection *v15;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("attributes"));
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
      v17 = CFSTR("BSServiceConnection.m");
      v18 = 1024;
      v19 = 447;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C3794);
  }
  return -[BSXPCServiceConnection remoteTargetWithAssertionAttributes:enforcingLaunchConstraints:]((os_unfair_lock_s *)self->_connection, a3, 0);
}

- (RBSTarget)remoteAssertionTarget
{
  BSXPCServiceConnection *connection;

  connection = self->_connection;
  if (connection)
    return connection->_remoteAssertionTarget;
  else
    return 0;
}

- (BSServiceConnectionMessageBatching)activeMessageBatch
{
  return (BSServiceConnectionMessageBatching *)-[BSXPCServiceConnection activeMessageBatch]((id *)&self->_connection->super.isa);
}

@end
