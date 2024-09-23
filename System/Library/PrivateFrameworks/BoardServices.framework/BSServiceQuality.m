@implementation BSServiceQuality

+ (_QWORD)_serviceWithClass:(uint64_t)a3 relativePriority:(unsigned int)a4 main:
{
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  __CFString *v10;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
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
  v7 = objc_opt_self();
  HIDWORD(v9) = a2 - 9;
  LODWORD(v9) = a2 - 9;
  v8 = v9 >> 2;
  if (v8 >= 7 || ((0x5Du >> v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown qos=%u"), a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__serviceWithClass_relativePriority_main_);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v19;
      v32 = 2114;
      v33 = v21;
      v34 = 2048;
      v35 = v7;
      v36 = 2114;
      v37 = CFSTR("BSServiceQuality.m");
      v38 = 1024;
      v39 = 57;
      v40 = 2114;
      v41 = v18;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79B6CCLL);
  }
  v10 = off_1E390DD68[v8];
  if ((_DWORD)a3)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot ask for main with relative priority : qos=%u rp=%i"), a2, a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__serviceWithClass_relativePriority_main_);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v31 = v27;
        v32 = 2114;
        v33 = v29;
        v34 = 2048;
        v35 = v7;
        v36 = 2114;
        v37 = CFSTR("BSServiceQuality.m");
        v38 = 1024;
        v39 = 88;
        v40 = 2114;
        v41 = v26;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A79B8C8);
    }
    return -[BSServiceQuality _initWithClass:name:relativePriority:singleton:main:]([BSServiceQuality alloc], a2, v10, a3, 0, 0);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_9);
    if (a4)
    {
      v12 = (_QWORD *)qword_1ECD9C660;
      if (!qword_1ECD9C660)
      {
        v12 = -[BSServiceQuality _initWithClass:name:relativePriority:singleton:main:]([BSServiceQuality alloc], a2, v10, 0, 1, 1);
        v13 = (void *)qword_1ECD9C660;
        qword_1ECD9C660 = (uint64_t)v12;

      }
      v14 = v12;
    }
    else
    {
      objc_msgSend((id)qword_1ECD9C668, "objectForKey:", a2);
      v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v14 = -[BSServiceQuality _initWithClass:name:relativePriority:singleton:main:]([BSServiceQuality alloc], a2, v10, 0, 1, 0);
        v15 = (void *)qword_1ECD9C668;
        if (!qword_1ECD9C668)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0D017B8]);
          v17 = (void *)qword_1ECD9C668;
          qword_1ECD9C668 = (uint64_t)v16;

          v15 = (void *)qword_1ECD9C668;
        }
        objc_msgSend(v15, "setObject:forKey:", v14, a2);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_9);
    if (*((_DWORD *)v14 + 5) != (_DWORD)a2
      || *((_DWORD *)v14 + 6)
      || !*((_BYTE *)v14 + 16)
      || *((unsigned __int8 *)v14 + 17) != a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cached properties aren't consistent : qos=%u main=%i cached=%@"), a2, a4, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__serviceWithClass_relativePriority_main_);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v31 = v23;
        v32 = 2114;
        v33 = v25;
        v34 = 2048;
        v35 = v7;
        v36 = 2114;
        v37 = CFSTR("BSServiceQuality.m");
        v38 = 1024;
        v39 = 84;
        v40 = 2114;
        v41 = v22;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A79B7CCLL);
    }
    return v14;
  }
}

+ (id)utility
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, 17, 0, 0);
}

- (_QWORD)_initWithClass:(void *)a3 name:(int)a4 relativePriority:(char)a5 singleton:(char)a6 main:
{
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
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
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (a1)
  {
    v12 = objc_opt_class();
    if (v12 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSServiceQuality is not intended to be subclassed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithClass_name_relativePriority_singleton_main_);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v23 = v18;
        v24 = 2114;
        v25 = v20;
        v26 = 2048;
        v27 = a1;
        v28 = 2114;
        v29 = CFSTR("BSServiceQuality.m");
        v30 = 1024;
        v31 = 31;
        v32 = 2114;
        v33 = v17;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A79CFE8);
    }
    v21.receiver = a1;
    v21.super_class = (Class)BSServiceQuality;
    v13 = objc_msgSendSuper2(&v21, sel_init);
    if (v13)
    {
      v14 = objc_msgSend(v11, "copy");
      v15 = (void *)v13[1];
      v13[1] = v14;

      *((_DWORD *)v13 + 5) = a2;
      *((_DWORD *)v13 + 6) = a4;
      *((_BYTE *)v13 + 16) = a5;
      *((_BYTE *)v13 + 17) = a6;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)relativePriority
{
  return self->_relativePriority;
}

+ (id)userInitiated
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, 25, 0, 0);
}

+ (id)userInteractive
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, 33, 0, 0);
}

- (unsigned)serviceClass
{
  return self->_serviceClass;
}

+ (id)serviceWithClass:(unsigned int)a3
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, *(uint64_t *)&a3, 0, 0);
}

+ (id)main
{
  uint64_t v2;

  v2 = qos_class_main();
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, v2, 0, 1u);
}

- (BSServiceQuality)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceQuality *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceQuality *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BSServiceQuality"));
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
    v16 = CFSTR("BSServiceQuality.m");
    v17 = 1024;
    v18 = 26;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceQuality *)_bs_set_crash_log_message();
  __break(0);
  return result;
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
  BSServiceQuality *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_singleton)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can not deallocate a singleton BSServiceQuality : %@"), self);
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
      v16 = CFSTR("BSServiceQuality.m");
      v17 = 1024;
      v18 = 94;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7D6388);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSServiceQuality;
  -[BSServiceQuality dealloc](&v8, sel_dealloc);
}

+ (id)background
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, 9, 0, 0);
}

+ (id)serviceWithClass:(unsigned int)a3 relativePriority:(int)a4
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, *(uint64_t *)&a3, *(uint64_t *)&a4, 0);
}

- (unint64_t)hash
{
  return (101333 * self->_relativePriority) ^ (106853 * self->_serviceClass);
}

- (BOOL)isEqual:(id)a3
{
  BSServiceQuality *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BSServiceQuality *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && self->_serviceClass == v4->_serviceClass
      && self->_relativePriority == v4->_relativePriority;
  }

  return v6;
}

- (id)description
{
  NSString *serviceClassName;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t relativePriority;
  uint64_t v8;
  const __CFString *v9;
  void *v10;

  serviceClassName = self->_serviceClassName;
  if (serviceClassName)
  {
    v4 = serviceClassName;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%x>"), self->_serviceClass);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (self->_main)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("main(%@)"), v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  relativePriority = self->_relativePriority;
  if ((_DWORD)relativePriority)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%+i"), v5, relativePriority);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  if (self->_singleton)
    v9 = CFSTR("<BSServiceQuality:(%p) %@>");
  else
    v9 = CFSTR("<BSServiceQuality:%p %@>");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, self, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClassName, 0);
}

@end
