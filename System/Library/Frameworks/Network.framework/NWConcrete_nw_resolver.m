@implementation NWConcrete_nw_resolver

- (nw_endpoint_t)initWithEndpoint:(void *)a3 parameters:(void *)a4 path:(uint64_t)a5 log_str:
{
  NSObject *v10;
  id v11;
  id v12;
  nw_endpoint_type_t v13;
  nw_endpoint_type_t v14;
  BOOL v17;
  nw_endpoint_t *v18;
  nw_endpoint_t *v19;
  nw_endpoint_t *v20;
  nw_parameters_t v21;
  nw_endpoint_t v22;
  NSObject *v23;
  nw_endpoint_t v24;
  id v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  nw_endpoint_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  char *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  NSObject *v37;
  nw_endpoint_t v38;
  _BOOL8 v39;
  nw_endpoint_t v40;
  char v41;
  nw_endpoint_t v42;
  char v43;
  char v44;
  char v45;
  nw_endpoint_t v46;
  uint64_t v47;
  void *v48;
  char v49;
  char v50;
  uint64_t v51;
  char *v52;
  unint64_t v53;
  int v54;
  NSObject *v55;
  const char *logging_description;
  nw_endpoint_t v57;
  os_log_type_t v58;
  NSObject *v59;
  int v60;
  const char *v61;
  nw_endpoint_t v62;
  void *v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  char *backtrace_string;
  os_log_type_t v69;
  _BOOL4 v70;
  os_log_type_t v71;
  _QWORD v72[6];
  os_log_type_t type[8];
  os_log_type_t *v74;
  uint64_t v75;
  int v76;
  char v77;
  objc_super v78;
  _BYTE buf[48];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  if (!a1)
    goto LABEL_90;
  v13 = nw_endpoint_get_type(v10);
  v14 = v13;
  v17 = v13 - 4 < 0xFFFFFFFE && v13 - 7 < 0xFFFFFFFE && v13 != nw_endpoint_type_address;
  if (v13 <= (nw_endpoint_type_url|nw_endpoint_type_host))
  {
    if (((1 << v13) & 0x6E) != 0)
      goto LABEL_13;
    if (v13 == nw_endpoint_type_invalid)
      goto LABEL_37;
  }
  v32 = nw_endpoint_copy_custom_resolver_block(v10);

  if (!v32)
  {
LABEL_37:
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v37 = (id)gLogObj;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14;
      _os_log_impl(&dword_182FBE000, v37, OS_LOG_TYPE_ERROR, "%{public}s nw_resolver_create_with_endpoint failed due to unsupported endpoint type %d", buf, 0x12u);
    }

    goto LABEL_90;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v33 = (id)gLogObj;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v14;
    _os_log_impl(&dword_182FBE000, v33, OS_LOG_TYPE_DEBUG, "%{public}s Creating resolver with custom endpoint type %u", buf, 0x12u);
  }

LABEL_13:
  v78.receiver = a1;
  v78.super_class = (Class)NWConcrete_nw_resolver;
  v18 = (nw_endpoint_t *)objc_msgSendSuper2(&v78, sel_init);
  v19 = v18;
  if (!v18)
  {
    __nwlog_obj();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
    v65 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v77 = 0;
    if (__nwlog_fault(v65, type, &v77))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = type[0];
        if (os_log_type_enabled(v66, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl(&dword_182FBE000, v66, v67, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v77)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v66 = objc_claimAutoreleasedReturnValue();
        v69 = type[0];
        v70 = os_log_type_enabled(v66, type[0]);
        if (backtrace_string)
        {
          if (v70)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v66, v69, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_108;
        }
        if (v70)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl(&dword_182FBE000, v66, v69, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v66 = objc_claimAutoreleasedReturnValue();
        v71 = type[0];
        if (os_log_type_enabled(v66, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl(&dword_182FBE000, v66, v71, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_108:
    if (v65)
      free(v65);
    goto LABEL_90;
  }
  *((_DWORD *)v18 + 21) = 0;
  *((_DWORD *)v18 + 2) = 0;
  v20 = v18 + 3;
  objc_storeStrong((id *)v18 + 3, a2);
  if (v11)
    v21 = (nw_parameters_t)v11;
  else
    v21 = nw_parameters_create();
  v22 = v19[2];
  v19[2] = v21;

  v23 = nw_parameters_copy_context(v19[2]);
  v24 = v19[4];
  v19[4] = v23;

  if (nw_context_is_inline(v19[4]))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
    v26 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v77 = 0;
    if (__nwlog_fault(v26, type, &v77))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        v28 = type[0];
        if (os_log_type_enabled(v27, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl(&dword_182FBE000, v27, v28, "%{public}s Cannot use nw_resolver on inline contexts", buf, 0xCu);
        }
      }
      else if (v77)
      {
        v34 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        v35 = type[0];
        v36 = os_log_type_enabled(v27, type[0]);
        if (v34)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v34;
            _os_log_impl(&dword_182FBE000, v27, v35, "%{public}s Cannot use nw_resolver on inline contexts, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v34);
          if (!v26)
            goto LABEL_89;
          goto LABEL_88;
        }
        if (v36)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl(&dword_182FBE000, v27, v35, "%{public}s Cannot use nw_resolver on inline contexts, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        v58 = type[0];
        if (os_log_type_enabled(v27, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl(&dword_182FBE000, v27, v58, "%{public}s Cannot use nw_resolver on inline contexts, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
    if (!v26)
    {
LABEL_89:

LABEL_90:
      v19 = 0;
      goto LABEL_91;
    }
LABEL_88:
    free(v26);
    goto LABEL_89;
  }
  objc_storeStrong((id *)v19 + 25, a4);
  v29 = v19[25];
  if (v29)
  {
    v30 = v29;
    if ((nw_path_may_span_multiple_interfaces(v30) & 1) != 0)
      v31 = 0;
    else
      v31 = nw_path_copy_scoped_interface(v30);

    v38 = v19[26];
    v19[26] = v31;

  }
  v39 = nw_array_create();
  v40 = v19[18];
  v19[18] = (nw_endpoint_t)v39;

  v41 = *((_BYTE *)v19 + 346) & 0xFE | v17;
  *((_BYTE *)v19 + 346) = v41;
  v42 = v19[25];
  if (v42)
  {
    *((_DWORD *)v19 + 14) = nw_path_get_dns_service_id(v42, 1);
    if (nw_path_has_unsatisfied_route(v19[25]))
      v43 = 16 * (nw_endpoint_get_type(*v20) == nw_endpoint_type_host);
    else
      v43 = 0;
    *((_BYTE *)v19 + 346) = *((_BYTE *)v19 + 346) & 0xEF | v43;
    if (nw_path_has_ipv4(v19[25]))
      v44 = 64;
    else
      v44 = 0;
    *((_BYTE *)v19 + 346) = *((_BYTE *)v19 + 346) & 0xBF | v44;
    if (nw_path_has_ipv6(v19[25]))
      v45 = 0x80;
    else
      v45 = 0;
    *((_BYTE *)v19 + 346) = v45 & 0x80 | *((_BYTE *)v19 + 346) & 0x7F;
    *((_BYTE *)v19 + 347) = *((_BYTE *)v19 + 347) & 0xFE | nw_path_has_nat64_prefixes(v19[25]);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__5622;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__5623;
    *(_QWORD *)&buf[40] = 0;
    *(_QWORD *)type = 0;
    v74 = type;
    v76 = 0;
    v75 = 0x2020000000;
    v46 = v19[25];
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __67__NWConcrete_nw_resolver_initWithEndpoint_parameters_path_log_str___block_invoke;
    v72[3] = &unk_1E149AC78;
    v72[4] = type;
    v72[5] = buf;
    nw_path_enumerate_resolver_configs(v46, v72);
    v47 = *(_QWORD *)&buf[8];
    v48 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v48)
    {
      if (*((_DWORD *)v74 + 6) == 4)
      {
        *((_BYTE *)v19 + 347) |= 0x20u;
        v48 = *(void **)(v47 + 40);
      }
      if (nw_resolver_config_get_allow_failover(v48))
        v49 = 64;
      else
        v49 = 0;
      *((_BYTE *)v19 + 347) = *((_BYTE *)v19 + 347) & 0xBF | v49;
      nw_resolver_config_get_identifier(*(void **)(*(_QWORD *)&buf[8] + 40), v19 + 29);
    }
    _Block_object_dispose(type, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    *((_BYTE *)v19 + 346) = v41 | 0xC0;
    *((_BYTE *)v19 + 347) &= ~1u;
  }
  *((_DWORD *)v19 + 62) = 0;
  if (nw_parameters_get_logging_disabled((uint64_t)v19[2]))
    v50 = 32;
  else
    v50 = 0;
  *((_BYTE *)v19 + 346) = *((_BYTE *)v19 + 346) & 0xDF | v50;
  *((_BYTE *)v19 + 348) = *((_BYTE *)v19 + 348) & 0xFD | (2
                                                        * (nw_parameters_get_expired_dns_behavior(v19[2]) == (nw_parameters_expired_dns_behavior_prohibit|nw_parameters_expired_dns_behavior_allow)));
  if (a5)
  {
    v51 = 0;
    v52 = (char *)(v19 + 32);
    v53 = 84;
    while (1)
    {
      v54 = *(unsigned __int8 *)(a5 + v51);
      v52[v51] = v54;
      if (!v54)
        break;
      --v53;
      ++v51;
      if (v53 <= 1)
      {
        v52[v51] = 0;
        break;
      }
    }
  }
  else
  {
    if (!nw_parameters_get_sensitive_redacted(v19[2]))
      nw_endpoint_set_do_not_redact(*v20);
    *((_DWORD *)v19 + 85) = nw_resolver_get_next_log_id();
    *((_BYTE *)v19 + 347) |= 0x10u;
    if ((*((_BYTE *)v19 + 346) & 0x20) == 0)
    {
      if (*((_BYTE *)v19 + 256))
      {
        if (__nwlog_connection_log::onceToken != -1)
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
        v55 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          logging_description = nw_endpoint_get_logging_description(*v20);
          v57 = v19[2];
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v19 + 32;
          *(_WORD *)&buf[22] = 2082;
          *(_QWORD *)&buf[24] = logging_description;
          *(_WORD *)&buf[32] = 2112;
          *(_QWORD *)&buf[34] = v57;
          _os_log_impl(&dword_182FBE000, v55, OS_LOG_TYPE_DEFAULT, "%{public}s [C%{public}s] created for %{public}s using: %@", buf, 0x2Au);
        }

      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v59 = (id)gLogObj;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = *((_DWORD *)v19 + 85);
          v61 = nw_endpoint_get_logging_description(v19[3]);
          v62 = v19[2];
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v60;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = v61;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v62;
          _os_log_impl(&dword_182FBE000, v59, OS_LOG_TYPE_DEFAULT, "%{public}s [R%u] created for %{public}s using: %@", buf, 0x26u);
        }

      }
    }
  }
LABEL_91:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 27, 0);
  objc_storeStrong((id *)self + 26, 0);
  objc_storeStrong((id *)self + 25, 0);
  objc_storeStrong((id *)self + 24, 0);
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 21, 0);
  objc_storeStrong((id *)self + 19, 0);
  objc_storeStrong((id *)self + 18, 0);
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
}

- (void)dealloc
{
  id v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  int v8;
  os_log_type_t v9;
  int v10;
  const char *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  char *backtrace_string;
  os_log_type_t v16;
  _BOOL4 v17;
  int v18;
  os_log_type_t v19;
  os_log_type_t v20;
  os_log_type_t v21;
  int v22;
  int v23;
  id v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  id v28;
  int v29;
  os_log_type_t v30;
  int v31;
  const char *v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  char *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  int v39;
  os_log_type_t v40;
  os_log_type_t v41;
  os_log_type_t v42;
  int v43;
  int v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint8_t *v49;
  int v50;
  objc_super v51;
  _QWORD v52[5];
  char v53;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  _BYTE v58[18];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!*((_QWORD *)self + 27) || (*((_BYTE *)self + 346) & 0x20) != 0)
    goto LABEL_50;
  if (!*((_BYTE *)self + 256))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    v8 = *((_DWORD *)self + 85);
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWConcrete_nw_resolver dealloc]";
    v57 = 1024;
    *(_DWORD *)v58 = v8;
    v50 = 18;
    v49 = buf;
    v4 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (!__nwlog_fault(v4, &type, &v53))
      goto LABEL_48;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v9 = type;
      if (os_log_type_enabled(v5, type))
      {
        v10 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 1024;
        *(_DWORD *)v58 = v10;
        _os_log_impl(&dword_182FBE000, v5, v9, "%{public}s [R%u] over-release of nw_resolver_t! Object should not be internally retained and deallocating", buf, 0x12u);
      }
      goto LABEL_47;
    }
    if (!v53)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v21 = type;
      if (os_log_type_enabled(v5, type))
      {
        v22 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 1024;
        *(_DWORD *)v58 = v22;
        _os_log_impl(&dword_182FBE000, v5, v21, "%{public}s [R%u] over-release of nw_resolver_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0x12u);
      }
      goto LABEL_47;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    v16 = type;
    v17 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (v17)
      {
        v23 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 1024;
        *(_DWORD *)v58 = v23;
        _os_log_impl(&dword_182FBE000, v5, v16, "%{public}s [R%u] over-release of nw_resolver_t! Object should not be internally retained and deallocating, no backtrace", buf, 0x12u);
      }
      goto LABEL_47;
    }
    if (v17)
    {
      v18 = *((_DWORD *)self + 85);
      *(_DWORD *)buf = 136446722;
      v56 = "-[NWConcrete_nw_resolver dealloc]";
      v57 = 1024;
      *(_DWORD *)v58 = v18;
      *(_WORD *)&v58[4] = 2082;
      *(_QWORD *)&v58[6] = backtrace_string;
      _os_log_impl(&dword_182FBE000, v5, v16, "%{public}s [R%u] over-release of nw_resolver_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x1Cu);
    }

    free(backtrace_string);
    if (!v4)
      goto LABEL_50;
LABEL_49:
    free(v4);
    goto LABEL_50;
  }
  if (__nwlog_connection_log::onceToken != -1)
    dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
  v3 = (id)gconnectionLogObj;
  *(_DWORD *)buf = 136446466;
  v56 = "-[NWConcrete_nw_resolver dealloc]";
  v57 = 2082;
  *(_QWORD *)v58 = (char *)self + 256;
  v50 = 22;
  v49 = buf;
  v4 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v53 = 0;
  if (!__nwlog_fault(v4, &type, &v53))
  {
LABEL_48:
    if (!v4)
      goto LABEL_50;
    goto LABEL_49;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v5 = (id)gconnectionLogObj;
    v6 = type;
    if (os_log_type_enabled(v5, type))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[NWConcrete_nw_resolver dealloc]";
      v57 = 2082;
      *(_QWORD *)v58 = (char *)self + 256;
      _os_log_impl(&dword_182FBE000, v5, v6, "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not be internally retained and deallocating", buf, 0x16u);
    }
LABEL_47:

    goto LABEL_48;
  }
  if (!v53)
  {
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v5 = (id)gconnectionLogObj;
    v19 = type;
    if (os_log_type_enabled(v5, type))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[NWConcrete_nw_resolver dealloc]";
      v57 = 2082;
      *(_QWORD *)v58 = (char *)self + 256;
      _os_log_impl(&dword_182FBE000, v5, v19, "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0x16u);
    }
    goto LABEL_47;
  }
  v11 = __nw_create_backtrace_string();
  if (!v11)
  {
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v5 = (id)gconnectionLogObj;
    v20 = type;
    if (os_log_type_enabled(v5, type))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[NWConcrete_nw_resolver dealloc]";
      v57 = 2082;
      *(_QWORD *)v58 = (char *)self + 256;
      _os_log_impl(&dword_182FBE000, v5, v20, "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not be internally retained and deallocating, no backtrace", buf, 0x16u);
    }
    goto LABEL_47;
  }
  v12 = (char *)v11;
  if (__nwlog_connection_log::onceToken != -1)
    dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
  v13 = (id)gconnectionLogObj;
  v14 = type;
  if (os_log_type_enabled(v13, type))
  {
    *(_DWORD *)buf = 136446722;
    v56 = "-[NWConcrete_nw_resolver dealloc]";
    v57 = 2082;
    *(_QWORD *)v58 = (char *)self + 256;
    *(_WORD *)&v58[8] = 2082;
    *(_QWORD *)&v58[10] = v12;
    _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x20u);
  }

  free(v12);
  if (v4)
    goto LABEL_49;
LABEL_50:
  if (!*((_QWORD *)self + 8))
    goto LABEL_100;
  if ((*((_BYTE *)self + 346) & 0x20) != 0)
    goto LABEL_99;
  if (!*((_BYTE *)self + 256))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v28 = (id)gLogObj;
    v29 = *((_DWORD *)self + 85);
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWConcrete_nw_resolver dealloc]";
    v57 = 1024;
    *(_DWORD *)v58 = v29;
    v50 = 18;
    v49 = buf;
    v25 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (!__nwlog_fault(v25, &type, &v53))
      goto LABEL_97;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v26 = (id)gLogObj;
      v30 = type;
      if (os_log_type_enabled(v26, type))
      {
        v31 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 1024;
        *(_DWORD *)v58 = v31;
        _os_log_impl(&dword_182FBE000, v26, v30, "%{public}s [R%u] over-release of nw_resolver_t! Object should not still have a DNS service", buf, 0x12u);
      }
    }
    else if (v53)
    {
      v36 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v26 = (id)gLogObj;
      v37 = type;
      v38 = os_log_type_enabled(v26, type);
      if (v36)
      {
        if (v38)
        {
          v39 = *((_DWORD *)self + 85);
          *(_DWORD *)buf = 136446722;
          v56 = "-[NWConcrete_nw_resolver dealloc]";
          v57 = 1024;
          *(_DWORD *)v58 = v39;
          *(_WORD *)&v58[4] = 2082;
          *(_QWORD *)&v58[6] = v36;
          _os_log_impl(&dword_182FBE000, v26, v37, "%{public}s [R%u] over-release of nw_resolver_t! Object should not still have a DNS service, dumping backtrace:%{public}s", buf, 0x1Cu);
        }

        free(v36);
        if (!v25)
          goto LABEL_99;
        goto LABEL_98;
      }
      if (v38)
      {
        v44 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 1024;
        *(_DWORD *)v58 = v44;
        _os_log_impl(&dword_182FBE000, v26, v37, "%{public}s [R%u] over-release of nw_resolver_t! Object should not still have a DNS service, no backtrace", buf, 0x12u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v26 = (id)gLogObj;
      v42 = type;
      if (os_log_type_enabled(v26, type))
      {
        v43 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 1024;
        *(_DWORD *)v58 = v43;
        _os_log_impl(&dword_182FBE000, v26, v42, "%{public}s [R%u] over-release of nw_resolver_t! Object should not still have a DNS service, backtrace limit exceeded", buf, 0x12u);
      }
    }
    goto LABEL_96;
  }
  if (__nwlog_connection_log::onceToken != -1)
    dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
  v24 = (id)gconnectionLogObj;
  *(_DWORD *)buf = 136446466;
  v56 = "-[NWConcrete_nw_resolver dealloc]";
  v57 = 2082;
  *(_QWORD *)v58 = (char *)self + 256;
  v50 = 22;
  v49 = buf;
  v25 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v53 = 0;
  if (__nwlog_fault(v25, &type, &v53))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v26 = (id)gconnectionLogObj;
      v27 = type;
      if (os_log_type_enabled(v26, type))
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 2082;
        *(_QWORD *)v58 = (char *)self + 256;
        _os_log_impl(&dword_182FBE000, v26, v27, "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not still have a DNS service", buf, 0x16u);
      }
    }
    else if (v53)
    {
      v32 = __nw_create_backtrace_string();
      if (v32)
      {
        v33 = (char *)v32;
        if (__nwlog_connection_log::onceToken != -1)
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
        v34 = (id)gconnectionLogObj;
        v35 = type;
        if (os_log_type_enabled(v34, type))
        {
          *(_DWORD *)buf = 136446722;
          v56 = "-[NWConcrete_nw_resolver dealloc]";
          v57 = 2082;
          *(_QWORD *)v58 = (char *)self + 256;
          *(_WORD *)&v58[8] = 2082;
          *(_QWORD *)&v58[10] = v33;
          _os_log_impl(&dword_182FBE000, v34, v35, "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not still have a DNS service, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(v33);
        if (!v25)
          goto LABEL_99;
        goto LABEL_98;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v26 = (id)gconnectionLogObj;
      v41 = type;
      if (os_log_type_enabled(v26, type))
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 2082;
        *(_QWORD *)v58 = (char *)self + 256;
        _os_log_impl(&dword_182FBE000, v26, v41, "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not still have a DNS service, no backtrace", buf, 0x16u);
      }
    }
    else
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v26 = (id)gconnectionLogObj;
      v40 = type;
      if (os_log_type_enabled(v26, type))
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        v57 = 2082;
        *(_QWORD *)v58 = (char *)self + 256;
        _os_log_impl(&dword_182FBE000, v26, v40, "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not still have a DNS service, backtrace limit exceeded", buf, 0x16u);
      }
    }
LABEL_96:

  }
LABEL_97:
  if (v25)
LABEL_98:
    free(v25);
LABEL_99:
  v45 = *((_QWORD *)self + 8);
  v46 = (void *)*((_QWORD *)self + 4);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __33__NWConcrete_nw_resolver_dealloc__block_invoke;
  v52[3] = &__block_descriptor_40_e5_v8__0l;
  v52[4] = v45;
  nw_queue_context_async_if_needed(v46, v52);
LABEL_100:
  v47 = *((_QWORD *)self + 20);
  if (v47)
  {
    nw_queue_cancel_source(v47, (uint64_t)a2);
    *((_QWORD *)self + 20) = 0;
  }
  v48 = (void *)*((_QWORD *)self + 28);
  if (v48)
  {
    free(v48);
    *((_QWORD *)self + 28) = 0;
  }
  v51.receiver = self;
  v51.super_class = (Class)NWConcrete_nw_resolver;
  -[NWConcrete_nw_resolver dealloc](&v51, sel_dealloc, v49, v50);
}

- (NSString)description
{
  int v3;
  const __CFAllocator *v4;
  __CFString *v5;

  v3 = *((unsigned __int8 *)self + 256);
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v3)
    v5 = (__CFString *)CFStringCreateWithFormat(v4, 0, CFSTR("[C%s]"), (char *)self + 256);
  else
    v5 = (__CFString *)CFStringCreateWithFormat(v4, 0, CFSTR("[R%u]"), *((unsigned int *)self + 85));
  return (NSString *)v5;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 3) = 0;
  return self;
}

@end
