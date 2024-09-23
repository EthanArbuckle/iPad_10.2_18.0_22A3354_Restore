@implementation NWConcrete_nw_application_id

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)*((_QWORD *)self + 9);
  if (v3)
  {
    free(v3);
    *((_QWORD *)self + 9) = 0;
  }
  v4 = (void *)*((_QWORD *)self + 10);
  if (v4)
  {
    free(v4);
    *((_QWORD *)self + 10) = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_application_id;
  -[NWConcrete_nw_application_id dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<nw_application_id %p>"), self);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (BOOL)initWithUUID:(__int128 *)a3 auditToken:(const char *)a4 pid:(char)a5 bundleID:isBundleIDExternal:systemService:
{
  int is_null;
  NSObject *v11;
  char *v12;
  __int128 v13;
  char *v14;
  const char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  char *v20;
  int v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL8 result;
  void *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  char *backtrace_string;
  os_log_type_t v36;
  _BOOL4 v37;
  NSObject *v38;
  void *v39;
  os_log_type_t v40;
  objc_super v41;
  os_log_type_t type[16];
  __int128 v43;
  uint8_t v44[4];
  const char *v45;
  uint8_t buf[32];
  __int128 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  is_null = uuid_is_null(uu);
  if (!a4 && !a3 && is_null)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
      _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_ERROR, "%{public}s cannot create application id without application information", buf, 0xCu);
    }

    return 0;
  }
  v41.receiver = a1;
  v41.super_class = (Class)NWConcrete_nw_application_id;
  v12 = (char *)objc_msgSendSuper2(&v41, sel_init);
  if (!v12)
  {
    __nwlog_obj();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
    v28 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v44[0] = 0;
    if (__nwlog_fault(v28, type, v44))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = type[0];
        if (os_log_type_enabled(v29, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_182FBE000, v29, v30, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v44[0])
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        v36 = type[0];
        v37 = os_log_type_enabled(v29, type[0]);
        if (backtrace_string)
        {
          if (v37)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v29, v36, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_62;
        }
        if (v37)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_182FBE000, v29, v36, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        v40 = type[0];
        if (os_log_type_enabled(v29, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_182FBE000, v29, v40, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_62:
    if (v28)
      free(v28);
    return 0;
  }
  if (uuid_is_null(uu))
  {
    if (a3 && *(_QWORD *)a3 | *((_QWORD *)a3 + 1) | *((_QWORD *)a3 + 2) | *((_QWORD *)a3 + 3))
    {
      v13 = *a3;
      *(_OWORD *)(v12 + 124) = a3[1];
      *(_OWORD *)(v12 + 108) = v13;
    }
    else
    {
      if (!a4)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v25 = (id)gLogObj;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_182FBE000, v25, OS_LOG_TYPE_ERROR, "%{public}s cannot create application id without application information", buf, 0xCu);
        }

        return 0;
      }
      v14 = strdup(a4);
      if (!v14)
      {
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "strict_strdup";
        v39 = (void *)_os_log_send_and_compose_impl();

        result = __nwlog_abort((uint64_t)v39);
        if (result)
          goto LABEL_64;
        free(v39);
      }
      *((_QWORD *)v12 + 10) = v14;
      v12[104] = a5;
    }
  }
  else
  {
    *((_OWORD *)v12 + 1) = *(_OWORD *)uu;
  }
  if (nw_utilities_get_self_name::onceToken != -1)
    dispatch_once(&nw_utilities_get_self_name::onceToken, &__block_literal_global_8_44028);
  v15 = (const char *)nw_utilities_get_self_name::name;
  if (!nw_utilities_get_self_name::name)
  {
    __nwlog_obj();
    v31 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "strict_strdup";
    v32 = (void *)_os_log_send_and_compose_impl();

    result = __nwlog_abort((uint64_t)v32);
    if (result)
      goto LABEL_64;
    free(v32);
  }
  v16 = strdup(v15);
  if (v16)
    goto LABEL_21;
  __nwlog_obj();
  v33 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)&buf[4] = "strict_strdup";
  v34 = (void *)_os_log_send_and_compose_impl();

  result = __nwlog_abort((uint64_t)v34);
  if (!result)
  {
    free(v34);
LABEL_21:
    *((_QWORD *)v12 + 9) = v16;
    v17 = v12;
    v18 = v17;
    v19 = *(_OWORD *)(v17 + 124);
    *(_OWORD *)type = *(_OWORD *)(v17 + 108);
    v43 = v19;
    if (*(_QWORD *)type | *(_QWORD *)&type[8] | (unint64_t)v19 | *((_QWORD *)&v19 + 1))
    {
      v20 = v17;
      v21 = *((_DWORD *)v20 + 32);
      *((_DWORD *)v20 + 35) = v21;
      v48 = 0;
      v47 = 0u;
      memset(buf, 0, sizeof(buf));
      if (proc_pidinfo(v21, 17, 1uLL, buf, 56) == 56)
      {
        *((_OWORD *)v20 + 1) = *(_OWORD *)buf;

        return (BOOL)v20;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v23 = (id)gLogObj;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 136446210;
        v45 = "nw_application_id_validate_audit_token";
        _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_ERROR, "%{public}s Failed to convert from audit token PID to UUID", v44, 0xCu);
      }

      goto LABEL_30;
    }
    if (*((_QWORD *)v17 + 10))
    {
      v22 = nw_application_id_validate_bundle_id((NWConcrete_nw_application_id *)v17);

      if ((v22 & 1) == 0)
      {
LABEL_30:
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v24 = (id)gLogObj;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_182FBE000, v24, OS_LOG_TYPE_ERROR, "%{public}s application id validation failed", buf, 0xCu);
        }

        return 0;
      }
    }
    else
    {

    }
    return (BOOL)v18;
  }
LABEL_64:
  __break(1u);
  return result;
}

@end
