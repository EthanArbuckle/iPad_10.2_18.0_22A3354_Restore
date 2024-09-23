@implementation NWConcrete_nw_path_evaluator

- (NWConcrete_nw_path_evaluator)init
{
  NWConcrete_nw_path_evaluator *v2;
  NWConcrete_nw_path_evaluator *v3;
  NWConcrete_nw_path_evaluator *v4;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  os_log_type_t v13;
  char v14;
  os_log_type_t type;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_path_evaluator;
  v2 = -[NWConcrete_nw_path_evaluator init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path_evaluator init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_evaluator init]";
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v11 = type;
      v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_path_evaluator init]";
          v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_evaluator init]";
        _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_evaluator init]";
        _os_log_impl(&dword_182FBE000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v7)
    free(v7);
LABEL_3:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  char *backtrace_string;
  os_log_type_t v13;
  _BOOL4 v14;
  os_log_type_t v15;
  uint8_t *v16;
  int v17;
  objc_super v18;
  char v19;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
    v23 = 1042;
    v24 = 16;
    v25 = 2098;
    v26 = (char *)self + 80;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %{public,uuid}.16P", buf, 0x1Cu);
  }

  v4 = nw_parameters_copy_context(*((void **)self + 1));
  v5 = nw_path_shared_necp_fd(v4);

  if ((v5 & 0x80000000) == 0 && !uuid_is_null((const unsigned __int8 *)self + 80) && necp_client_action())
  {
    v6 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    v8 = v7;
    if (v6 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
        v23 = 1024;
        v24 = 2;
        _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}s NECP_CLIENT_ACTION_REMOVE error %{darwin.errno}d", buf, 0x12u);
      }

      goto LABEL_5;
    }
    *(_DWORD *)buf = 136446466;
    v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
    v23 = 1024;
    v24 = v6;
    v17 = 18;
    v16 = buf;
    v9 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v19 = 0;
    if (!__nwlog_fault(v9, &type, &v19))
      goto LABEL_16;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
        v23 = 1024;
        v24 = v6;
        _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s NECP_CLIENT_ACTION_REMOVE error %{darwin.errno}d", buf, 0x12u);
      }
LABEL_15:

LABEL_16:
      if (!v9)
        goto LABEL_5;
LABEL_17:
      free(v9);
      goto LABEL_5;
    }
    if (!v19)
    {
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
        v23 = 1024;
        v24 = v6;
        _os_log_impl(&dword_182FBE000, v10, v15, "%{public}s NECP_CLIENT_ACTION_REMOVE error %{darwin.errno}d, backtrace limit exceeded", buf, 0x12u);
      }
      goto LABEL_15;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = type;
    v14 = os_log_type_enabled(v10, type);
    if (!backtrace_string)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
        v23 = 1024;
        v24 = v6;
        _os_log_impl(&dword_182FBE000, v10, v13, "%{public}s NECP_CLIENT_ACTION_REMOVE error %{darwin.errno}d, no backtrace", buf, 0x12u);
      }
      goto LABEL_15;
    }
    if (v14)
    {
      *(_DWORD *)buf = 136446722;
      v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
      v23 = 1024;
      v24 = v6;
      v25 = 2082;
      v26 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v10, v13, "%{public}s NECP_CLIENT_ACTION_REMOVE error %{darwin.errno}d, dumping backtrace:%{public}s", buf, 0x1Cu);
    }

    free(backtrace_string);
    if (v9)
      goto LABEL_17;
  }
LABEL_5:
  v18.receiver = self;
  v18.super_class = (Class)NWConcrete_nw_path_evaluator;
  -[NWConcrete_nw_path_evaluator dealloc](&v18, sel_dealloc, v16, v17);
}

- (id)redactedDescription
{
  char *v2;

  v2 = nw_path_evaluator_copy_description_level(self, 2);
  if (v2)
    v2 = (char *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  return v2;
}

- (NSString)description
{
  char *v2;

  v2 = nw_path_evaluator_copy_description(self);
  if (v2)
    v2 = (char *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  return (NSString *)v2;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 24) = 0;
  return self;
}

@end
