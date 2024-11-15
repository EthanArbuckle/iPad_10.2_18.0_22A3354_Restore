@implementation NWConcrete_tcp_connection

- (char)initWithParameters:(char *)a1
{
  id v3;
  char *v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  nw_parameters_t secure_tcp;
  void *v14;
  id v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  char *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  char *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  os_log_type_t v25;
  os_log_type_t v26;
  void *v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  char *backtrace_string;
  os_log_type_t v33;
  _BOOL4 v34;
  os_log_type_t v35;
  char v36;
  os_log_type_t type;
  objc_super v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_50;
  v38.receiver = a1;
  v38.super_class = (Class)NWConcrete_tcp_connection;
  v4 = (char *)objc_msgSendSuper2(&v38, sel_init);
  a1 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v36 = 0;
    if (__nwlog_fault(v29, &type, &v36))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = type;
        if (os_log_type_enabled(v30, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl(&dword_182FBE000, v30, v31, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v36)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v30 = objc_claimAutoreleasedReturnValue();
        v33 = type;
        v34 = os_log_type_enabled(v30, type);
        if (backtrace_string)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
            v41 = 2082;
            v42 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v30, v33, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_67;
        }
        if (v34)
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl(&dword_182FBE000, v30, v33, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v30 = objc_claimAutoreleasedReturnValue();
        v35 = type;
        if (os_log_type_enabled(v30, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl(&dword_182FBE000, v30, v35, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_67:
    if (v29)
      free(v29);
    goto LABEL_49;
  }
  *((_DWORD *)v4 + 28) = 16;
  if (v3)
  {
    v5 = v3;
    v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v5, 0, 0);

    v7 = (void *)*((_QWORD *)a1 + 6);
    *((_QWORD *)a1 + 6) = v6;

    v8 = (void *)*((_QWORD *)a1 + 6);
    if (!v8)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
      v10 = (char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v36 = 0;
      if (__nwlog_fault(v10, &type, &v36))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v11 = (id)gLogObj;
          v12 = type;
          if (os_log_type_enabled(v11, type))
          {
            *(_DWORD *)buf = 136446210;
            v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s nw_parameters_copy failed", buf, 0xCu);
          }
        }
        else if (v36)
        {
          v19 = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v11 = (id)gLogObj;
          v20 = type;
          v21 = os_log_type_enabled(v11, type);
          if (v19)
          {
            if (v21)
            {
              *(_DWORD *)buf = 136446466;
              v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
              v41 = 2082;
              v42 = v19;
              _os_log_impl(&dword_182FBE000, v11, v20, "%{public}s nw_parameters_copy failed, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v19);
            if (!v10)
              goto LABEL_48;
            goto LABEL_38;
          }
          if (v21)
          {
            *(_DWORD *)buf = 136446210;
            v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
            _os_log_impl(&dword_182FBE000, v11, v20, "%{public}s nw_parameters_copy failed, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v11 = (id)gLogObj;
          v25 = type;
          if (os_log_type_enabled(v11, type))
          {
            *(_DWORD *)buf = 136446210;
            v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
            _os_log_impl(&dword_182FBE000, v11, v25, "%{public}s nw_parameters_copy failed, backtrace limit exceeded", buf, 0xCu);
          }
        }

      }
      if (v10)
LABEL_38:
        free(v10);
LABEL_48:

LABEL_49:
      a1 = 0;
      goto LABEL_50;
    }
    goto LABEL_11;
  }
  secure_tcp = nw_parameters_create_secure_tcp(&__block_literal_global_18950, &__block_literal_global_86);
  v14 = (void *)*((_QWORD *)a1 + 6);
  *((_QWORD *)a1 + 6) = secure_tcp;

  v8 = (void *)*((_QWORD *)a1 + 6);
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v36 = 0;
    if (__nwlog_fault(v16, &type, &v36))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v17 = (id)gLogObj;
        v18 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s nw_parameters_create failed", buf, 0xCu);
        }
      }
      else if (v36)
      {
        v22 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v17 = (id)gLogObj;
        v23 = type;
        v24 = os_log_type_enabled(v17, type);
        if (v22)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
            v41 = 2082;
            v42 = v22;
            _os_log_impl(&dword_182FBE000, v17, v23, "%{public}s nw_parameters_create failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v22);
          if (!v16)
            goto LABEL_48;
          goto LABEL_47;
        }
        if (v24)
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl(&dword_182FBE000, v17, v23, "%{public}s nw_parameters_create failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v17 = (id)gLogObj;
        v26 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl(&dword_182FBE000, v17, v26, "%{public}s nw_parameters_create failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
    if (!v16)
      goto LABEL_48;
LABEL_47:
    free(v16);
    goto LABEL_48;
  }
LABEL_11:
  nw_parameters_set_data_mode(v8, 2u);
  nw_parameters_set_https_proxy_is_opaque(*((void **)a1 + 6), 1);
  nw_parameters_set_no_fullstack_fallback(*((void **)a1 + 6), 1);
  if ((nw_parameters_get_indefinite_set(*((void **)a1 + 6)) & 1) == 0)
    nw_parameters_set_indefinite(*((void **)a1 + 6), 0);
  a1[156] = 0;
  *(_QWORD *)(a1 + 116) = 0xFFFFFFFFLL;
LABEL_50:

  return a1;
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t tc_id;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  int v16;
  objc_super v17;
  char v18;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    tc_id = self->tc_id;
    *(_DWORD *)buf = 136446466;
    v21 = "-[NWConcrete_tcp_connection dealloc]";
    v22 = 2048;
    v23 = tc_id;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %llu", buf, 0x16u);
  }

  if (self->tc_internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v21 = "-[NWConcrete_tcp_connection dealloc]";
    v16 = 12;
    v15 = buf;
    v6 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v18 = 0;
    if (__nwlog_fault(v6, &type, &v18))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWConcrete_tcp_connection dealloc]";
        v9 = "%{public}s over-release of tcp_connection_t. Object should not be internally retained while deallocating";
LABEL_18:
        v13 = v7;
        v14 = v8;
        goto LABEL_19;
      }
      if (!v18)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWConcrete_tcp_connection dealloc]";
        v9 = "%{public}s over-release of tcp_connection_t. Object should not be internally retained while deallocating, b"
             "acktrace limit exceeded";
        goto LABEL_18;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      v11 = type;
      v12 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (!v12)
        {
LABEL_20:

          if (!v6)
            goto LABEL_15;
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWConcrete_tcp_connection dealloc]";
        v9 = "%{public}s over-release of tcp_connection_t. Object should not be internally retained while deallocating, no backtrace";
        v13 = v7;
        v14 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v13, v14, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v21 = "-[NWConcrete_tcp_connection dealloc]";
        v22 = 2082;
        v23 = (unint64_t)backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s over-release of tcp_connection_t. Object should not be internally retained while deallocating, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (v6)
LABEL_14:
      free(v6);
  }
LABEL_15:
  v17.receiver = self;
  v17.super_class = (Class)NWConcrete_tcp_connection;
  -[NWConcrete_tcp_connection dealloc](&v17, sel_dealloc, v15, v16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tc_internally_retained_object, 0);
  objc_storeStrong((id *)&self->tc_connection_attempt_timer, 0);
  objc_storeStrong(&self->tc_cancel_handler, 0);
  objc_storeStrong(&self->tc_event, 0);
  objc_storeStrong((id *)&self->tc_client_queue, 0);
  objc_storeStrong((id *)&self->tc_network_parameters, 0);
  objc_storeStrong((id *)&self->tc_network_endpoint, 0);
  objc_storeStrong((id *)&self->tc_nw_current_path, 0);
  objc_storeStrong((id *)&self->tc_last_nw_error, 0);
  objc_storeStrong((id *)&self->tc_nwconn, 0);
  objc_storeStrong((id *)&self->tc_context, 0);
}

@end
