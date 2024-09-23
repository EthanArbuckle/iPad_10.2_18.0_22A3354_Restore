@implementation NWConcrete_nw_context

- (BOOL)initWithIdentifier:(void *)a1
{
  id v2;
  char *v4;
  _BOOL8 result;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  void *v15;
  char *backtrace_string;
  os_log_type_t v17;
  _BOOL4 v18;
  char *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  os_log_type_t v22;
  os_log_type_t v23;
  objc_super v24;
  char v25;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v2 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (BOOL)v2;
  if (!a2)
  {
    __nwlog_obj();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
    v7 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (__nwlog_fault(v7, &type, &v25))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = type;
        if (os_log_type_enabled(v8, type))
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s called with null _identifier", buf, 0xCu);
        }
      }
      else if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        v17 = type;
        v18 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
            v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v8, v17, "%{public}s called with null _identifier, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_38;
        }
        if (v18)
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl(&dword_182FBE000, v8, v17, "%{public}s called with null _identifier, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        v22 = type;
        if (os_log_type_enabled(v8, type))
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl(&dword_182FBE000, v8, v22, "%{public}s called with null _identifier, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_38:
    if (v7)
      free(v7);

    return 0;
  }
  v24.receiver = a1;
  v24.super_class = (Class)NWConcrete_nw_context;
  v2 = objc_msgSendSuper2(&v24, sel_init);
  if (!v2)
  {
    __nwlog_obj();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
    v11 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (__nwlog_fault(v11, &type, &v25))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = type;
        if (os_log_type_enabled(v12, type))
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v25)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v20 = type;
        v21 = os_log_type_enabled(v12, type);
        if (v19)
        {
          if (v21)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
            v29 = 2082;
            v30 = v19;
            _os_log_impl(&dword_182FBE000, v12, v20, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_44;
        }
        if (v21)
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl(&dword_182FBE000, v12, v20, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v23 = type;
        if (os_log_type_enabled(v12, type))
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl(&dword_182FBE000, v12, v23, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_44:
    if (v11)
      free(v11);
    return 0;
  }
  v4 = strdup(a2);
  if (v4)
  {
LABEL_5:
    *((_QWORD *)v2 + 2) = v4;
    *((_DWORD *)v2 + 31) = 2;
    *((_DWORD *)v2 + 21) = networkd_settings_get_int64_with_default((const char *)nw_setting_context_max_cache_entries, 200);
    *((_DWORD *)v2 + 22) = networkd_settings_get_int64_with_default((const char *)nw_setting_context_target_cache_entries, 150);
    *((_DWORD *)v2 + 23) = networkd_settings_get_int64_with_default((const char *)nw_setting_context_max_idle_cache_entries, 20);
    return (BOOL)v2;
  }
  __nwlog_obj();
  v14 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v28 = "strict_strdup";
  v15 = (void *)_os_log_send_and_compose_impl();

  result = __nwlog_abort((uint64_t)v15);
  if (!result)
  {
    free(v15);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

- (NSString)description
{
  unsigned int v2;
  const char *v3;

  v2 = *((_DWORD *)self + 31) - 1;
  if (v2 > 3)
    v3 = "unknown";
  else
    v3 = off_1E149A518[v2];
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<nw_context %s (%s)>"), *((_QWORD *)self + 2), v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 16, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)*((_QWORD *)self + 2);
  if (v3)
  {
    free(v3);
    *((_QWORD *)self + 2) = 0;
  }
  nw_context_dealloc(self, 0);
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_context;
  -[NWConcrete_nw_context dealloc](&v4, sel_dealloc);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 20) = 0;
  return self;
}

@end
