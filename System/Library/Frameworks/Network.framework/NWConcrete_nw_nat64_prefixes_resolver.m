@implementation NWConcrete_nw_nat64_prefixes_resolver

- (void)dealloc
{
  id v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  void *v12;
  char *backtrace_string;
  os_log_type_t v14;
  _BOOL4 v15;
  char *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  os_log_type_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  int v22;
  objc_super v23;
  _QWORD v24[5];
  char v25;
  os_log_type_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)self + 4))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
    v22 = 12;
    v21 = buf;
    v4 = (char *)_os_log_send_and_compose_impl();

    v26 = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (!__nwlog_fault(v4, &v26, &v25))
      goto LABEL_7;
    if (v26 == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v6 = v26;
      if (os_log_type_enabled(v5, v26))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v6, "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not be internally retained and deallocating", buf, 0xCu);
      }
LABEL_6:

LABEL_7:
      if (!v4)
        goto LABEL_9;
      goto LABEL_8;
    }
    if (!v25)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v19 = v26;
      if (os_log_type_enabled(v5, v26))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v19, "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_6;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    v14 = v26;
    v15 = os_log_type_enabled(v5, v26);
    if (!backtrace_string)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v14, "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not be internally retained and deallocating, no backtrace", buf, 0xCu);
      }
      goto LABEL_6;
    }
    if (v15)
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
      v29 = 2082;
      v30 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v5, v14, "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
    if (v4)
LABEL_8:
      free(v4);
  }
LABEL_9:
  if (*((_QWORD *)self + 6))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
    v22 = 12;
    v21 = buf;
    v8 = (char *)_os_log_send_and_compose_impl();

    v26 = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (__nwlog_fault(v8, &v26, &v25))
    {
      if (v26 == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v10 = v26;
        if (os_log_type_enabled(v9, v26))
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
          _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not still have a DNS service", buf, 0xCu);
        }
      }
      else if (v25)
      {
        v16 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v17 = v26;
        v18 = os_log_type_enabled(v9, v26);
        if (v16)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
            v29 = 2082;
            v30 = v16;
            _os_log_impl(&dword_182FBE000, v9, v17, "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not still have a DNS service, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v16);
          if (!v8)
            goto LABEL_17;
          goto LABEL_16;
        }
        if (v18)
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
          _os_log_impl(&dword_182FBE000, v9, v17, "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not still have a DNS service, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v20 = v26;
        if (os_log_type_enabled(v9, v26))
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
          _os_log_impl(&dword_182FBE000, v9, v20, "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not still have a DNS service, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
    if (!v8)
    {
LABEL_17:
      v11 = *((_QWORD *)self + 6);
      *((_QWORD *)self + 6) = 0;
      v12 = (void *)*((_QWORD *)self + 3);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __48__NWConcrete_nw_nat64_prefixes_resolver_dealloc__block_invoke;
      v24[3] = &__block_descriptor_40_e5_v8__0l;
      v24[4] = v11;
      nw_queue_context_async_if_needed(v12, v24);
      goto LABEL_18;
    }
LABEL_16:
    free(v8);
    goto LABEL_17;
  }
LABEL_18:
  v23.receiver = self;
  v23.super_class = (Class)NWConcrete_nw_nat64_prefixes_resolver;
  -[NWConcrete_nw_nat64_prefixes_resolver dealloc](&v23, sel_dealloc, v21, v22);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
