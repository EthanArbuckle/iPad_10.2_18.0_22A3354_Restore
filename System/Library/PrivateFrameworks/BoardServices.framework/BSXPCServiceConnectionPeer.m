@implementation BSXPCServiceConnectionPeer

+ (id)peerOfConnection:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  os_unfair_lock_s *v6;
  id v7;
  NSObject *v8;
  BSXPCServiceConnectionPeer *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  _BYTE v23[22];
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
  v2 = a2;
  v3 = objc_opt_self();
  if (!v2)
  {
    v18 = v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("connection"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_peerOfConnection_);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138544642;
      *(_QWORD *)&v23[4] = v20;
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v22;
      v24 = 2048;
      v25 = v18;
      v26 = 2114;
      v27 = CFSTR("BSXPCServiceConnectionPeer.m");
      v28 = 1024;
      v29 = 57;
      v30 = 2114;
      v31 = v19;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v23, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A1F48);
  }
  v4 = BSPIDForXPCConnection();
  if ((int)v4 < 1)
  {
    BSServiceXPCLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 138412290;
      *(_QWORD *)&v23[4] = v2;
      _os_log_error_impl(&dword_19A799000, v8, OS_LOG_TYPE_ERROR, "Unable to create a peer for a connection with no PID: %@", v23, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_4);
    objc_msgSend((id)qword_1ECD9C5C0, "objectForKey:", v5);
    v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      os_unfair_lock_lock(v6 + 2);
      objc_msgSend(*((id *)v7 + 2), "addObject:", v2);
      ++*((_QWORD *)v7 + 3);
      os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
    }
    else
    {
      v9 = [BSXPCServiceConnectionPeer alloc];
      v10 = v2;
      if (v9)
      {
        *(_QWORD *)v23 = v9;
        *(_QWORD *)&v23[8] = BSXPCServiceConnectionPeer;
        v7 = objc_msgSendSuper2((objc_super *)v23, sel_init);
        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0D01828], "processHandleForXPCConnection:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)*((_QWORD *)v7 + 4);
          *((_QWORD *)v7 + 4) = v11;

          *((_DWORD *)v7 + 2) = 0;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v10);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)*((_QWORD *)v7 + 2);
          *((_QWORD *)v7 + 2) = v13;

        }
      }
      else
      {
        v7 = 0;
      }

      if (qword_1ECD9C5C0)
      {
        objc_msgSend((id)qword_1ECD9C5C0, "setObject:forKey:", v7, v5);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v7, v5);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)qword_1ECD9C5C0;
        qword_1ECD9C5C0 = v15;

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_4);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_lock_connections, 0);
}

+ (void)invalidateConnection:(uint64_t)a1
{
  id v2;
  void *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  os_unfair_lock_s *v9;
  id v10;
  uint64_t v11;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BSPIDForXPCConnection());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_4);
    objc_msgSend((id)qword_1ECD9C5C0, "objectForKey:", v3);
    v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      os_unfair_lock_lock(v4 + 2);
      if (objc_msgSend(*(id *)&v5[4]._os_unfair_lock_opaque, "count"))
      {
        objc_msgSend(*(id *)&v5[4]._os_unfair_lock_opaque, "removeObject:", v2);
        v6 = *(_QWORD *)&v5[6]._os_unfair_lock_opaque;
        if (!objc_msgSend(*(id *)&v5[4]._os_unfair_lock_opaque, "count"))
        {
          dispatch_get_global_queue(17, 0);
          v7 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __51__BSXPCServiceConnectionPeer_invalidateConnection___block_invoke;
          block[3] = &unk_1E390D408;
          v9 = v5;
          v11 = v6;
          v10 = v3;
          dispatch_async(v7, block);

        }
      }
      os_unfair_lock_unlock(v5 + 2);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_4);

  }
}

void __51__BSXPCServiceConnectionPeer_invalidateConnection___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  v2 = (_QWORD *)a1[4];
  if (a1[6] == v2[3])
  {
    objc_msgSend((id)qword_1ECD9C5C0, "objectForKey:", a1[5]);
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v2 == v3)
      objc_msgSend((id)qword_1ECD9C5C0, "removeObjectForKey:", a1[5]);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_4);
}

- (BSXPCServiceConnectionPeer)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSXPCServiceConnectionPeer *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSXPCServiceConnectionPeer *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSXPCServiceConnectionPeer"));
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
    v16 = CFSTR("BSXPCServiceConnectionPeer.m");
    v17 = 1024;
    v18 = 36;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSXPCServiceConnectionPeer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)description
{
  return (NSString *)-[BSXPCServiceConnectionPeer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSXPCServiceConnectionPeer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableSet count](self->_lock_connections, "count");
  os_unfair_lock_unlock(&self->_lock);
  -[BSProcessHandle name](self->_processHandle, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSProcessHandle bundleIdentifier](self->_processHandle, "bundleIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
      v9 = v5;
    else
      v9 = (void *)v6;
    v8 = v9;
  }
  v10 = v8;
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v8, 0);
  v12 = (id)objc_msgSend(v3, "appendInt:withName:", -[BSProcessHandle pid](self->_processHandle, "pid"), CFSTR("pid"));
  v13 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", v4, CFSTR("count"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSXPCServiceConnectionPeer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[BSXPCServiceConnectionPeer succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
