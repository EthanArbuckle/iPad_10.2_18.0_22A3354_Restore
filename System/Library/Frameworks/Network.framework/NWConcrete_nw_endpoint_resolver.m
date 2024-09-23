@implementation NWConcrete_nw_endpoint_resolver

- (void)startWithHandler:(id)a3
{
  id v4;
  void *v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  char v11;
  NSObject *v12;
  char *v13;
  char *v14;
  char v15;
  const char *v16;
  nw_endpoint_t v17;
  const char *logging_description;
  char *v19;
  char *v20;
  uint64_t v21;
  const char *v22;
  id v23;
  const char *v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  const char *v28;
  char *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  const char *v32;
  os_log_type_t v33;
  const char *v34;
  void **v35;
  void **v36;
  unsigned int v37;
  const char *v38;
  const char *v39;
  void **v40;
  id v41;
  unsigned int *v42;
  unsigned int *v43;
  _BOOL4 v44;
  id *v45;
  id v46;
  id *v47;
  NWConcrete_nw_path *v48;
  id v49;
  NWConcrete_nw_resolver *v50;
  id *v51;
  id v52;
  nw_endpoint_t *v53;
  NWConcrete_nw_endpoint_handler *v54;
  NSObject *v55;
  nw_endpoint_type_t v56;
  __int16 v57;
  __int16 v58;
  uint64_t v59;
  NWConcrete_nw_endpoint_handler *v60;
  nw_endpoint_t *v61;
  _QWORD *v62;
  NSObject *v63;
  nw_endpoint_t v64;
  NWConcrete_nw_endpoint_handler *v65;
  nw_endpoint_t *v66;
  void *v67;
  os_log_type_t v68;
  char *backtrace_string;
  os_log_type_t v70;
  _BOOL4 v71;
  void *v72;
  const char *v73;
  char *v74;
  NSObject *v75;
  os_log_type_t v76;
  void *v77;
  char *v78;
  NSObject *v79;
  os_log_type_t v80;
  os_log_type_t v81;
  char *v82;
  _BOOL4 v83;
  char *v84;
  _BOOL4 v85;
  os_log_type_t v86;
  os_log_type_t v87;
  nw_endpoint_t v88;
  os_log_type_t v89;
  os_log_type_t v90;
  char *v91;
  id v92;
  unsigned int *v93;
  _QWORD v94[4];
  NWConcrete_nw_endpoint_handler *v95;
  nw_endpoint_t *v96;
  _QWORD v97[4];
  NWConcrete_nw_endpoint_handler *v98;
  os_log_type_t type[4];
  char v100;
  _BYTE buf[22];
  __int16 v102;
  const char *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  const char *v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
    v25 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v100 = 0;
    if (!__nwlog_fault(v25, type, &v100))
      goto LABEL_70;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      v68 = type[0];
      if (os_log_type_enabled(v26, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl(&dword_182FBE000, v26, v68, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v100)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      v70 = type[0];
      v71 = os_log_type_enabled(v26, type[0]);
      if (backtrace_string)
      {
        if (v71)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v26, v70, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_70;
      }
      if (v71)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl(&dword_182FBE000, v26, v70, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      v81 = type[0];
      if (os_log_type_enabled(v26, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl(&dword_182FBE000, v26, v81, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_69:

    goto LABEL_70;
  }
  v6 = (unsigned int *)v4;
  v7 = v6[29];

  if ((_DWORD)v7 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v23 = (id)gLogObj;
    if (v7 > 5)
      v24 = "unknown-mode";
    else
      v24 = off_1E149FC18[v7];
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v24;
    v102 = 2082;
    v103 = "resolver";
    v25 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v100 = 0;
    if (__nwlog_fault(v25, type, &v100))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v26 = (id)gLogObj;
        v27 = type[0];
        if (os_log_type_enabled(v26, type[0]))
        {
          if (v7 > 5)
            v28 = "unknown-mode";
          else
            v28 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v28;
          v102 = 2082;
          v103 = "resolver";
          _os_log_impl(&dword_182FBE000, v26, v27, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v100)
      {
        v29 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v26 = (id)gLogObj;
        v30 = type[0];
        v31 = os_log_type_enabled(v26, type[0]);
        if (v29)
        {
          if (v31)
          {
            if (v7 > 5)
              v32 = "unknown-mode";
            else
              v32 = off_1E149FC18[v7];
            *(_DWORD *)buf = 136446978;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v32;
            v102 = 2082;
            v103 = "resolver";
            v104 = 2082;
            v105 = v29;
            _os_log_impl(&dword_182FBE000, v26, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v29);
          if (!v25)
            goto LABEL_72;
LABEL_71:
          free(v25);
          goto LABEL_72;
        }
        if (v31)
        {
          if (v7 > 5)
            v39 = "unknown-mode";
          else
            v39 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v39;
          v102 = 2082;
          v103 = "resolver";
          _os_log_impl(&dword_182FBE000, v26, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v26 = (id)gLogObj;
        v33 = type[0];
        if (os_log_type_enabled(v26, type[0]))
        {
          if (v7 > 5)
            v34 = "unknown-mode";
          else
            v34 = off_1E149FC18[v7];
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v34;
          v102 = 2082;
          v103 = "resolver";
          _os_log_impl(&dword_182FBE000, v26, v33, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_69;
    }
LABEL_70:
    if (!v25)
      goto LABEL_72;
    goto LABEL_71;
  }
  v8 = v6;
  v9 = v8[30];

  if (v9 == 1)
  {
    v10 = v8;
    v11 = *((_BYTE *)v10 + 268);
    v93 = v10;

    if ((v11 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v12 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = v93;

        v14 = v13;
        v15 = *((_BYTE *)v93 + 268);

        if ((v15 & 1) != 0)
          v16 = "dry-run ";
        else
          v16 = "";
        v17 = nw_endpoint_handler_copy_endpoint(v14);
        logging_description = nw_endpoint_get_logging_description(v17);
        v88 = v17;
        v91 = v13 + 168;
        v19 = v14;
        v20 = v19;
        v21 = v8[30];
        if (v21 > 5)
          v22 = "unknown-state";
        else
          v22 = off_1E149FC48[v21];

        v35 = v20;
        v36 = v35;
        v37 = v6[29];
        v38 = "path";
        switch(v37)
        {
          case 0u:
            break;
          case 1u:
            v38 = "resolver";
            break;
          case 2u:
            v38 = nw_endpoint_flow_mode_string(v35[31]);
            break;
          case 3u:
            v38 = "proxy";
            break;
          case 4u:
            v38 = "fallback";
            break;
          case 5u:
            v38 = "transform";
            break;
          default:
            v38 = "unknown-mode";
            break;
        }

        v40 = v36;
        os_unfair_lock_lock((os_unfair_lock_t)v40 + 28);
        v41 = v40[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v40 + 28);

        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v91;
        v102 = 2082;
        v103 = v16;
        v104 = 2082;
        v105 = (void *)logging_description;
        v106 = 2082;
        v107 = v22;
        v108 = 2082;
        v109 = v38;
        v110 = 2114;
        v111 = v41;
        _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

      }
    }
    v42 = v93;
    os_unfair_lock_lock((os_unfair_lock_t)v42 + 28);
    v92 = *((id *)v42 + 8);
    os_unfair_lock_unlock((os_unfair_lock_t)v42 + 28);

    v43 = v42;
    v44 = (v93[67] & 1) == 0;

    if (v44)
      nw_path_assert_required_agents(v92);
    v45 = v43;
    v46 = v45[4];

    v47 = v45;
    v48 = (NWConcrete_nw_path *)v92;
    v49 = v46;
    if (v48)
    {
      v50 = [NWConcrete_nw_resolver alloc];
      v51 = v48;
      v52 = v51[3];

      v53 = -[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:](v50, v52, v49, v51, (uint64_t)(v47 + 21));
      goto LABEL_56;
    }
    __nwlog_obj();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
    v73 = (const char *)_os_log_send_and_compose_impl();

    v74 = (char *)v73;
    type[0] = OS_LOG_TYPE_ERROR;
    v100 = 0;
    if (__nwlog_fault(v73, type, &v100))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = type[0];
        if (os_log_type_enabled(v75, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
          _os_log_impl(&dword_182FBE000, v75, v76, "%{public}s called with null path", buf, 0xCu);
        }
      }
      else if (v100)
      {
        v82 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v75 = objc_claimAutoreleasedReturnValue();
        v89 = type[0];
        v83 = os_log_type_enabled(v75, type[0]);
        if (v82)
        {
          if (v83)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v82;
            _os_log_impl(&dword_182FBE000, v75, v89, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v82);
          goto LABEL_118;
        }
        if (v83)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
          _os_log_impl(&dword_182FBE000, v75, v89, "%{public}s called with null path, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v75 = objc_claimAutoreleasedReturnValue();
        v86 = type[0];
        if (os_log_type_enabled(v75, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
          _os_log_impl(&dword_182FBE000, v75, v86, "%{public}s called with null path, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_118:
    if (v74)
      free(v74);
    v53 = 0;
LABEL_56:

    objc_storeStrong((id *)&self->resolver, v53);
    self->last_resolver_status = 0;
    v54 = v47;
    v8[30] = 2;

    v55 = nw_endpoint_handler_copy_endpoint(v54);
    v56 = nw_endpoint_get_type(v55);
    if (v56 == (nw_endpoint_type_url|nw_endpoint_type_address))
      v57 = 6;
    else
      v57 = 1;
    if (v56 == nw_endpoint_type_bonjour_service)
      v58 = 3;
    else
      v58 = v57;

    v54->event.domain = 2;
    v54->event.event = v58;
    nw_endpoint_handler_report(v54, 0, &v54->event.domain, 0);
    *(_DWORD *)type = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    if (nw_path_get_vpn_config_uuid(v48, (unsigned __int8 (*)[16])buf, (int *)type, 1, 1))
      nw_endpoint_resolver_setup_trigger_agent_timer(v54, 0);
    v59 = MEMORY[0x1E0C809B0];
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke;
    v97[3] = &unk_1E149F9F8;
    v60 = v54;
    v98 = v60;
    v61 = v53;
    v62 = v97;
    if (v61)
    {
      os_unfair_lock_lock((os_unfair_lock_t)v61 + 3);
      v63 = _Block_copy(v62);
      v64 = v61[21];
      v61[21] = v63;

      os_unfair_lock_unlock((os_unfair_lock_t)v61 + 3);
LABEL_66:

      v94[0] = v59;
      v94[1] = 3221225472;
      v94[2] = __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke_2;
      v94[3] = &unk_1E149FA20;
      v65 = v60;
      v95 = v65;
      v66 = v61;
      v96 = v66;
      nw_resolver_set_update_handler(v66, 0, v94);
      nw_endpoint_resolver_update_path_resolver_locked(v65);

      goto LABEL_72;
    }
    __nwlog_obj();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_resolver_set_alternative_handler";
    v78 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v100 = 0;
    if (__nwlog_fault(v78, type, &v100))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v79 = objc_claimAutoreleasedReturnValue();
        v80 = type[0];
        if (os_log_type_enabled(v79, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_resolver_set_alternative_handler";
          _os_log_impl(&dword_182FBE000, v79, v80, "%{public}s called with null resolver", buf, 0xCu);
        }
      }
      else if (v100)
      {
        v84 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v79 = objc_claimAutoreleasedReturnValue();
        v90 = type[0];
        v85 = os_log_type_enabled(v79, type[0]);
        if (v84)
        {
          if (v85)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_resolver_set_alternative_handler";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v84;
            _os_log_impl(&dword_182FBE000, v79, v90, "%{public}s called with null resolver, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v84);
          goto LABEL_124;
        }
        if (v85)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_resolver_set_alternative_handler";
          _os_log_impl(&dword_182FBE000, v79, v90, "%{public}s called with null resolver, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v79 = objc_claimAutoreleasedReturnValue();
        v87 = type[0];
        if (os_log_type_enabled(v79, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_resolver_set_alternative_handler";
          _os_log_impl(&dword_182FBE000, v79, v87, "%{public}s called with null resolver, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_124:
    if (v78)
      free(v78);
    goto LABEL_66;
  }
LABEL_72:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->modified_endpoint, 0);
  objc_storeStrong((id *)&self->resolver_resolved_endpoints, 0);
  objc_storeStrong((id *)&self->path_resolved_endpoints, 0);
  objc_storeStrong((id *)&self->resolve_flow_registrations, 0);
  objc_storeStrong((id *)&self->failed_child_endpoint_handlers, 0);
  objc_storeStrong((id *)&self->child_endpoint_handlers, 0);
  objc_storeStrong((id *)&self->connected_child, 0);
  objc_storeStrong((id *)&self->resolver, 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_endpoint_resolver;
  -[NWConcrete_nw_endpoint_resolver dealloc](&v2, sel_dealloc);
}

- (NWConcrete_nw_endpoint_resolver)init
{
  NWConcrete_nw_endpoint_resolver *v2;
  NWConcrete_nw_endpoint_resolver *v3;
  NWConcrete_nw_endpoint_resolver *v4;
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
  v16.super_class = (Class)NWConcrete_nw_endpoint_resolver;
  v2 = -[NWConcrete_nw_endpoint_resolver init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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
          v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  id v6;
  void *v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned __int8 *child_endpoint_handlers;
  OS_nw_array *v11;
  OS_nw_array *failed_child_endpoint_handlers;
  uint64_t v13;
  OS_nw_resolver *resolver;
  OS_nw_resolver *v15;
  void *child_timer;
  void *trigger_agent_timer;
  void *desperate_ivan_timer;
  id v19;
  const char *v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  char *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  const char *v28;
  os_log_type_t v29;
  const char *v30;
  const char *v31;
  void *v32;
  os_log_type_t v33;
  char *backtrace_string;
  os_log_type_t v35;
  _BOOL4 v36;
  os_log_type_t v37;
  _QWORD v38[4];
  BOOL v39;
  char v40;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
    v21 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v40 = 0;
    if (__nwlog_fault(v21, &type, &v40))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v33 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v22, v33, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_42;
      }
      if (!v40)
      {
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v37 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v22, v37, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_42;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      v36 = os_log_type_enabled(v22, type);
      if (!backtrace_string)
      {
        if (v36)
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v22, v35, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_42;
      }
      if (v36)
      {
        *(_DWORD *)buf = 136446466;
        v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
        v44 = 2082;
        v45 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v22, v35, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_43:
    if (!v21)
      goto LABEL_45;
LABEL_44:
    free(v21);
    goto LABEL_45;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 == 1)
  {
    child_endpoint_handlers = (unsigned __int8 *)self->child_endpoint_handlers;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __60__NWConcrete_nw_endpoint_resolver_cancelWithHandler_forced___block_invoke;
    v38[3] = &__block_descriptor_33_e35_B24__0Q8__NSObject_OS_nw_object__16l;
    v39 = a4;
    nw_array_apply(child_endpoint_handlers, (uint64_t)v38);
    v11 = self->child_endpoint_handlers;
    self->child_endpoint_handlers = 0;

    failed_child_endpoint_handlers = self->failed_child_endpoint_handlers;
    self->failed_child_endpoint_handlers = 0;

    resolver = self->resolver;
    if (resolver)
    {
      nw_resolver_cancel(resolver);
      v15 = self->resolver;
      self->resolver = 0;

    }
    self->last_resolver_status = 0;
    child_timer = self->child_timer;
    if (child_timer)
    {
      nw_queue_cancel_source((uint64_t)child_timer, v13);
      self->child_timer = 0;
    }
    trigger_agent_timer = self->trigger_agent_timer;
    if (trigger_agent_timer)
    {
      nw_queue_cancel_source((uint64_t)trigger_agent_timer, v13);
      self->trigger_agent_timer = 0;
    }
    desperate_ivan_timer = self->desperate_ivan_timer;
    if (desperate_ivan_timer)
    {
      nw_queue_cancel_source((uint64_t)desperate_ivan_timer, v13);
      self->desperate_ivan_timer = 0;
    }
    goto LABEL_45;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v19 = (id)gLogObj;
  if (v9 > 5)
    v20 = "unknown-mode";
  else
    v20 = off_1E149FC18[v9];
  *(_DWORD *)buf = 136446722;
  v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
  v44 = 2082;
  v45 = (void *)v20;
  v46 = 2082;
  v47 = "resolver";
  v21 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v40 = 0;
  if (!__nwlog_fault(v21, &type, &v40))
    goto LABEL_43;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v22 = (id)gLogObj;
    v23 = type;
    if (os_log_type_enabled(v22, type))
    {
      if (v9 > 5)
        v24 = "unknown-mode";
      else
        v24 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
      v44 = 2082;
      v45 = (void *)v24;
      v46 = 2082;
      v47 = "resolver";
      _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_42:

    goto LABEL_43;
  }
  if (!v40)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v22 = (id)gLogObj;
    v29 = type;
    if (os_log_type_enabled(v22, type))
    {
      if (v9 > 5)
        v30 = "unknown-mode";
      else
        v30 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
      v44 = 2082;
      v45 = (void *)v30;
      v46 = 2082;
      v47 = "resolver";
      _os_log_impl(&dword_182FBE000, v22, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_42;
  }
  v25 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v22 = (id)gLogObj;
  v26 = type;
  v27 = os_log_type_enabled(v22, type);
  if (!v25)
  {
    if (v27)
    {
      if (v9 > 5)
        v31 = "unknown-mode";
      else
        v31 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
      v44 = 2082;
      v45 = (void *)v31;
      v46 = 2082;
      v47 = "resolver";
      _os_log_impl(&dword_182FBE000, v22, v26, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_42;
  }
  if (v27)
  {
    if (v9 > 5)
      v28 = "unknown-mode";
    else
      v28 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446978;
    v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
    v44 = 2082;
    v45 = (void *)v28;
    v46 = 2082;
    v47 = "resolver";
    v48 = 2082;
    v49 = v25;
    _os_log_impl(&dword_182FBE000, v22, v26, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v25);
  if (v21)
    goto LABEL_44;
LABEL_45:

}

- (void)updatePathWithHandler:(id)a3
{
  id v3;
  void *v4;
  NWConcrete_nw_endpoint_handler *v5;
  uint64_t mode;
  id v7;
  const char *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  char *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  const char *v16;
  os_log_type_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  os_log_type_t v21;
  char *backtrace_string;
  os_log_type_t v23;
  _BOOL4 v24;
  os_log_type_t v25;
  char v26;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    __nwlog_obj();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
    v9 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v26 = 0;
    if (__nwlog_fault(v9, &type, &v26))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        v21 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl(&dword_182FBE000, v10, v21, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (!v26)
      {
        __nwlog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl(&dword_182FBE000, v10, v25, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_35;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      v24 = os_log_type_enabled(v10, type);
      if (!backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446210;
          v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl(&dword_182FBE000, v10, v23, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446466;
        v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
        v30 = 2082;
        v31 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v10, v23, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_36:
    if (!v9)
      goto LABEL_38;
LABEL_37:
    free(v9);
    goto LABEL_38;
  }
  v5 = (NWConcrete_nw_endpoint_handler *)v3;
  mode = v5->mode;

  if ((_DWORD)mode == 1)
  {
    nw_endpoint_resolver_update_path_resolver_locked(v5);
    goto LABEL_38;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v7 = (id)gLogObj;
  if (mode > 5)
    v8 = "unknown-mode";
  else
    v8 = off_1E149FC18[mode];
  *(_DWORD *)buf = 136446722;
  v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
  v30 = 2082;
  v31 = (void *)v8;
  v32 = 2082;
  v33 = "resolver";
  v9 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v26 = 0;
  if (!__nwlog_fault(v9, &type, &v26))
    goto LABEL_36;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    v11 = type;
    if (os_log_type_enabled(v10, type))
    {
      if (mode > 5)
        v12 = "unknown-mode";
      else
        v12 = off_1E149FC18[mode];
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
      v30 = 2082;
      v31 = (void *)v12;
      v32 = 2082;
      v33 = "resolver";
      _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_35:

    goto LABEL_36;
  }
  if (!v26)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    v17 = type;
    if (os_log_type_enabled(v10, type))
    {
      if (mode > 5)
        v18 = "unknown-mode";
      else
        v18 = off_1E149FC18[mode];
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
      v30 = 2082;
      v31 = (void *)v18;
      v32 = 2082;
      v33 = "resolver";
      _os_log_impl(&dword_182FBE000, v10, v17, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_35;
  }
  v13 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v10 = (id)gLogObj;
  v14 = type;
  v15 = os_log_type_enabled(v10, type);
  if (!v13)
  {
    if (v15)
    {
      if (mode > 5)
        v19 = "unknown-mode";
      else
        v19 = off_1E149FC18[mode];
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
      v30 = 2082;
      v31 = (void *)v19;
      v32 = 2082;
      v33 = "resolver";
      _os_log_impl(&dword_182FBE000, v10, v14, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_35;
  }
  if (v15)
  {
    if (mode > 5)
      v16 = "unknown-mode";
    else
      v16 = off_1E149FC18[mode];
    *(_DWORD *)buf = 136446978;
    v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
    v30 = 2082;
    v31 = (void *)v16;
    v32 = 2082;
    v33 = "resolver";
    v34 = 2082;
    v35 = v13;
    _os_log_impl(&dword_182FBE000, v10, v14, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v13);
  if (v9)
    goto LABEL_37;
LABEL_38:

}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  id v6;
  id v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned __int8 *child_endpoint_handlers;
  BOOL v11;
  id v12;
  const char *v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  char *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  const char *v21;
  os_log_type_t v22;
  const char *v23;
  const char *v24;
  void *v26;
  os_log_type_t v27;
  void *v28;
  os_log_type_t v29;
  char *backtrace_string;
  os_log_type_t v31;
  _BOOL4 v32;
  os_log_type_t v33;
  _BOOL4 v34;
  os_log_type_t v35;
  os_log_type_t v36;
  _QWORD v37[4];
  id v38;
  char v39;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (!__nwlog_fault(v14, &type, &v39))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v27 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v27, "%{public}s called with null handler", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v39)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v35, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    v31 = type;
    v32 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
      v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v15, v31, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_60:

    free(backtrace_string);
    goto LABEL_37;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    if (v9 > 5)
      v13 = "unknown-mode";
    else
      v13 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446722;
    v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
    v43 = 2082;
    v44 = (void *)v13;
    v45 = 2082;
    v46 = "resolver";
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (__nwlog_fault(v14, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type;
        if (os_log_type_enabled(v15, type))
        {
          if (v9 > 5)
            v17 = "unknown-mode";
          else
            v17 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v17;
          v45 = 2082;
          v46 = "resolver";
          _os_log_impl(&dword_182FBE000, v15, v16, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v39)
      {
        v18 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v19 = type;
        v20 = os_log_type_enabled(v15, type);
        if (v18)
        {
          if (v20)
          {
            if (v9 > 5)
              v21 = "unknown-mode";
            else
              v21 = off_1E149FC18[v9];
            *(_DWORD *)buf = 136446978;
            v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
            v43 = 2082;
            v44 = (void *)v21;
            v45 = 2082;
            v46 = "resolver";
            v47 = 2082;
            v48 = v18;
            _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v18);
          if (!v14)
            goto LABEL_39;
          goto LABEL_38;
        }
        if (v20)
        {
          if (v9 > 5)
            v24 = "unknown-mode";
          else
            v24 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v24;
          v45 = 2082;
          v46 = "resolver";
          _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v22 = type;
        if (os_log_type_enabled(v15, type))
        {
          if (v9 > 5)
            v23 = "unknown-mode";
          else
            v23 = off_1E149FC18[v9];
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v23;
          v45 = 2082;
          v46 = "resolver";
          _os_log_impl(&dword_182FBE000, v15, v22, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_36;
    }
LABEL_37:
    if (!v14)
    {
LABEL_39:
      v11 = 1;
      goto LABEL_40;
    }
LABEL_38:
    free(v14);
    goto LABEL_39;
  }
  if (!v7)
  {
    __nwlog_obj();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (!__nwlog_fault(v14, &type, &v39))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v29 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v29, "%{public}s called with null applyBlock", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v39)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v36, "%{public}s called with null applyBlock, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    v33 = type;
    v34 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v33, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
      v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v15, v33, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_60;
  }
  child_endpoint_handlers = (unsigned __int8 *)self->child_endpoint_handlers;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __63__NWConcrete_nw_endpoint_resolver_applyWithHandler_toChildren___block_invoke;
  v37[3] = &unk_1E14AC278;
  v38 = v7;
  v11 = nw_array_apply(child_endpoint_handlers, (uint64_t)v37);

LABEL_40:
  return v11;
}

@end
