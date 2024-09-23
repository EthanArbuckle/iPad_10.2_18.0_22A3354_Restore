@implementation BSXPCServiceConnectionRootClientEndpointContext

- (BOOL)isClient
{
  return 1;
}

+ (BSXPCServiceConnectionRootClientEndpointContext)uniqueClientContextWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(void *)a5 description:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  BSXPCServiceConnectionRootClientEndpointContext *v14;
  id v15;
  id v16;
  id v17;
  OS_xpc_object *v18;
  OS_xpc_object *endpoint;
  uint64_t v20;
  NSUUID *oneshot;
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
  id v36;
  objc_class *v37;
  void *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = objc_opt_self();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueClientContextWithEndpoint_oneshot_nonLaunching_description_);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = v24;
      v41 = 2114;
      v42 = v26;
      v43 = 2048;
      v44 = v11;
      v45 = 2114;
      v46 = CFSTR("BSXPCServiceConnectionContext.m");
      v47 = 1024;
      v48 = 247;
      v49 = 2114;
      v50 = v23;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AE25CLL);
  }
  v12 = v9;
  if (v12)
  {
    NSClassFromString(CFSTR("NSUUID"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_uniqueClientContextWithEndpoint_oneshot_nonLaunching_description_);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v40 = v36;
        v41 = 2114;
        v42 = v38;
        v43 = 2048;
        v44 = v11;
        v45 = 2114;
        v46 = CFSTR("BSXPCServiceConnectionContext.m");
        v47 = 1024;
        v48 = 248;
        v49 = 2114;
        v50 = v35;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AE55CLL);
    }
  }

  v13 = v10;
  NSClassFromString(CFSTR("NSString"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueClientContextWithEndpoint_oneshot_nonLaunching_description_);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = v28;
      v41 = 2114;
      v42 = v30;
      v43 = 2048;
      v44 = v11;
      v45 = 2114;
      v46 = CFSTR("BSXPCServiceConnectionContext.m");
      v47 = 1024;
      v48 = 249;
      v49 = 2114;
      v50 = v27;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AE35CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueClientContextWithEndpoint_oneshot_nonLaunching_description_);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = v32;
      v41 = 2114;
      v42 = v34;
      v43 = 2048;
      v44 = v11;
      v45 = 2114;
      v46 = CFSTR("BSXPCServiceConnectionContext.m");
      v47 = 1024;
      v48 = 249;
      v49 = 2114;
      v50 = v31;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AE45CLL);
  }

  v14 = [BSXPCServiceConnectionRootClientEndpointContext alloc];
  v15 = v8;
  v16 = v12;
  v17 = v13;
  if (v14)
  {
    v14 = (BSXPCServiceConnectionRootClientEndpointContext *)-[BSXPCServiceConnectionRootContext _initWithType:eDesc:](v14, 0x43u, v17);
    if (v14)
    {
      v18 = (OS_xpc_object *)xpc_copy(v15);
      endpoint = v14->_endpoint;
      v14->_endpoint = v18;

      v20 = objc_msgSend(v16, "copy");
      oneshot = v14->_oneshot;
      v14->_oneshot = (NSUUID *)v20;

      v14->_nonLaunching = a4;
    }
  }

  return v14;
}

- (BOOL)isNonLaunching
{
  return self->_nonLaunching;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneshot, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
