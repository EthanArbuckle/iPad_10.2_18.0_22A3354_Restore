@implementation BSXPCServiceConnectionRootServerContext

- (BOOL)isServer
{
  return 1;
}

+ (_QWORD)uniqueServerContextWithEndpointDescription:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v4 = v2;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueServerContextWithEndpointDescription_);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v16 = v8;
      v17 = 2114;
      v18 = v10;
      v19 = 2048;
      v20 = v3;
      v21 = 2114;
      v22 = CFSTR("BSXPCServiceConnectionContext.m");
      v23 = 1024;
      v24 = 203;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AE8ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueServerContextWithEndpointDescription_);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      v19 = 2048;
      v20 = v3;
      v21 = 2114;
      v22 = CFSTR("BSXPCServiceConnectionContext.m");
      v23 = 1024;
      v24 = 203;
      v25 = 2114;
      v26 = v11;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AE9ECLL);
  }

  v5 = -[BSXPCServiceConnectionRootContext _initWithType:eDesc:]([BSXPCServiceConnectionRootServerContext alloc], 0x53u, v4);
  return v5;
}

@end
