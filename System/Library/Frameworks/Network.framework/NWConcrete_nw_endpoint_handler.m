@implementation NWConcrete_nw_endpoint_handler

- (id).cxx_construct
{
  *((_DWORD *)self + 37) = 0;
  return self;
}

- (id)initWithEndpoint:(void *)a3 parameters:(void *)a4 reportCallback:(void *)a5 context:(void *)a6 parent:(unsigned int)a7 identifier:
{
  id v14;
  id v15;
  id v16;
  NWConcrete_nw_endpoint_handler *v17;
  id *v18;
  id v19;
  id v20;
  char v21;
  void *v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  char *backtrace_string;
  os_log_type_t v28;
  _BOOL4 v29;
  os_log_type_t v30;
  char v31;
  os_log_type_t type;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (!a1)
    goto LABEL_7;
  v33.receiver = a1;
  v33.super_class = (Class)NWConcrete_nw_endpoint_handler;
  v18 = (id *)objc_msgSendSuper2(&v33, sel_init);
  a1 = v18;
  if (v18)
  {
    objc_storeStrong(v18 + 3, a2);
    objc_storeStrong(a1 + 4, a3);
    a1[1] = a4;
    objc_storeWeak(a1 + 2, v16);
    *((_DWORD *)a1 + 30) = 0;
    *((_DWORD *)a1 + 28) = 0;
    v19 = nw_parameters_copy_context(v15);
    v20 = a1[5];
    a1[5] = v19;

    *((_DWORD *)a1 + 66) = 0;
    if (nw_parameters_get_logging_disabled((uint64_t)v15))
      v21 = 32;
    else
      v21 = 0;
    *((_BYTE *)a1 + 268) = *((_BYTE *)a1 + 268) & 0xDF | v21;
    nw_endpoint_handler_inherit_from_parent((NWConcrete_nw_endpoint_handler *)a1, v17, a7);
    goto LABEL_7;
  }
  __nwlog_obj();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
  v24 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v31 = 0;
  if (__nwlog_fault(v24, &type, &v31))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
        _os_log_impl(&dword_182FBE000, v25, v26, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v31)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      v28 = type;
      v29 = os_log_type_enabled(v25, type);
      if (backtrace_string)
      {
        if (v29)
        {
          *(_DWORD *)buf = 136446466;
          v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
          v36 = 2082;
          v37 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v25, v28, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_24;
      }
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
        _os_log_impl(&dword_182FBE000, v25, v28, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      v30 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v35 = "-[NWConcrete_nw_endpoint_handler initWithEndpoint:parameters:reportCallback:context:parent:identifier:]";
        _os_log_impl(&dword_182FBE000, v25, v30, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_24:
  if (v24)
    free(v24);
  a1 = 0;
LABEL_7:

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->override_evaluator, 0);
  objc_storeStrong((id *)&self->mode_handler, 0);
  objc_storeStrong((id *)&self->triggered_agent_uuids, 0);
  objc_storeStrong((id *)&self->inactive_agent_dictionaries, 0);
  objc_storeStrong((id *)&self->inactive_agent_uuids, 0);
  objc_storeStrong((id *)&self->parent_handler, 0);
  objc_storeStrong((id *)&self->current_path, 0);
  objc_storeStrong((id *)&self->association, 0);
  objc_storeStrong(&self->migration_callback, 0);
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
  objc_destroyWeak((id *)&self->callback_context);
}

- (void)dealloc
{
  NWConcrete_nw_endpoint_handler *v2;
  int state;
  BOOL v4;
  NWConcrete_nw_endpoint_handler *v5;
  char v6;
  id v7;
  NWConcrete_nw_endpoint_handler *v8;
  NWConcrete_nw_endpoint_handler *v9;
  char v10;
  const char *v11;
  nw_endpoint_t v12;
  const char *logging_description;
  NWConcrete_nw_endpoint_handler *v14;
  NWConcrete_nw_endpoint_handler *v15;
  uint64_t v16;
  const char *v17;
  void **v18;
  void **v19;
  const char *v20;
  void **v21;
  id v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  char *v26;
  char *v27;
  _BOOL4 v28;
  const char *v29;
  nw_endpoint_t v30;
  const char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  const char *v35;
  const char *backtrace_string;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  char *v40;
  char *v41;
  _BOOL4 v42;
  const char *v43;
  nw_endpoint_t v44;
  const char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  const char *v49;
  os_log_type_t v50;
  char *v51;
  char *v52;
  _BOOL4 v53;
  const char *v54;
  nw_endpoint_t v55;
  const char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  const char *v60;
  void **v61;
  void **v62;
  const char *v63;
  os_log_type_t v64;
  const char *id_string;
  const char *v66;
  nw_endpoint_t v67;
  const char *v68;
  const char *v69;
  const char *v70;
  id v71;
  void **v72;
  void **v73;
  const char *v74;
  void **v75;
  void **v76;
  const char *v77;
  void **v78;
  id v79;
  void **v80;
  id v81;
  void **v82;
  id v83;
  uint8_t *v84;
  int v85;
  const char *v86;
  const char *v87;
  const char *v88;
  os_unfair_lock_s *lock;
  void **v90;
  id *v91;
  NWConcrete_nw_endpoint_handler *v92;
  char *id_str;
  const char *v94;
  objc_super v95;
  char v96;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  const char *v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  id v111;
  __int16 v112;
  char *v113;
  uint64_t v114;

  v2 = self;
  v114 = *MEMORY[0x1E0C80C00];
  state = self->state;
  if (state)
    v4 = state == 5;
  else
    v4 = 1;
  if (v4)
    goto LABEL_87;
  v5 = self;
  v6 = *((_BYTE *)v5 + 268);

  if ((v6 & 0x20) != 0)
    goto LABEL_87;
  if (__nwlog_connection_log::onceToken != -1)
    dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
  v7 = (id)gconnectionLogObj;
  v8 = v5;

  v9 = v8;
  v10 = *((_BYTE *)v5 + 268);

  if ((v10 & 1) != 0)
    v11 = "dry-run ";
  else
    v11 = "";
  v12 = nw_endpoint_handler_copy_endpoint(v9);
  logging_description = nw_endpoint_get_logging_description(v12);
  id_str = v8->id_str;
  v14 = v9;
  v15 = v14;
  v92 = v2;
  v16 = v2->state;
  if (v16 > 5)
    v17 = "unknown-state";
  else
    v17 = off_1E149FC48[v16];

  v18 = v15;
  v19 = v18;
  v20 = "path";
  switch(*((_DWORD *)v18 + 29))
  {
    case 0:
      break;
    case 1:
      v20 = "resolver";
      break;
    case 2:
      v20 = nw_endpoint_flow_mode_string(v18[31]);
      break;
    case 3:
      v20 = "proxy";
      break;
    case 4:
      v20 = "fallback";
      break;
    case 5:
      v20 = "transform";
      break;
    default:
      v20 = "unknown-mode";
      break;
  }

  v90 = v19;
  v21 = v19;
  os_unfair_lock_lock((os_unfair_lock_t)v21 + 28);
  v22 = v21[8];
  lock = (os_unfair_lock_s *)(v21 + 14);
  os_unfair_lock_unlock((os_unfair_lock_t)v21 + 28);
  v91 = v21;

  *(_DWORD *)buf = 136447746;
  v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
  v100 = 2082;
  v101 = id_str;
  v102 = 2082;
  v103 = v11;
  v104 = 2082;
  v105 = logging_description;
  v106 = 2082;
  v107 = v17;
  v108 = 2082;
  v109 = v20;
  v110 = 2114;
  v111 = v22;
  v85 = 72;
  v84 = buf;
  v94 = (const char *)_os_log_send_and_compose_impl();

  v2 = v92;
  type = OS_LOG_TYPE_ERROR;
  v96 = 0;
  v23 = (char *)v94;
  if (__nwlog_fault(v94, &type, &v96))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v24 = (id)gconnectionLogObj;
      v25 = type;
      if (os_log_type_enabled(v24, type))
      {
        v26 = v21;

        v27 = v26;
        v28 = (*((_BYTE *)v5 + 268) & 1) == 0;

        if (v28)
          v29 = "";
        else
          v29 = "dry-run ";
        v30 = nw_endpoint_handler_copy_endpoint(v27);
        v31 = nw_endpoint_get_logging_description(v30);
        v32 = v27;
        v33 = v32;
        v34 = v92->state;
        if (v34 > 5)
          v35 = "unknown-state";
        else
          v35 = off_1E149FC48[v34];
        v88 = v35;

        v61 = v33;
        v62 = v61;
        v63 = "path";
        switch(*((_DWORD *)v90 + 29))
        {
          case 0:
            break;
          case 1:
            v63 = "resolver";
            break;
          case 2:
            v63 = nw_endpoint_flow_mode_string(v61[31]);
            break;
          case 3:
            v63 = "proxy";
            break;
          case 4:
            v63 = "fallback";
            break;
          case 5:
            v63 = "transform";
            break;
          default:
            v63 = "unknown-mode";
            break;
        }

        v78 = v62;
        os_unfair_lock_lock(lock);
        v79 = v91[8];
        os_unfair_lock_unlock(lock);

        *(_DWORD *)buf = 136447746;
        v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
        v100 = 2082;
        v101 = id_str;
        v102 = 2082;
        v103 = v29;
        v104 = 2082;
        v105 = v31;
        v106 = 2082;
        v107 = v88;
        v108 = 2082;
        v109 = v63;
        v110 = 2114;
        v111 = v79;
        _os_log_impl(&dword_182FBE000, v24, v25, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] deallocated in unexpected state", buf, 0x48u);

      }
    }
    else if (v96)
    {
      backtrace_string = __nw_create_backtrace_string();
      if (backtrace_string)
      {
        v37 = (char *)backtrace_string;
        if (__nwlog_connection_log::onceToken != -1)
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
        v38 = (id)gconnectionLogObj;
        v39 = type;
        if (os_log_type_enabled(v38, type))
        {
          v40 = v21;

          v41 = v40;
          v42 = (*((_BYTE *)v5 + 268) & 1) == 0;

          if (v42)
            v43 = "";
          else
            v43 = "dry-run ";
          v44 = nw_endpoint_handler_copy_endpoint(v41);
          v45 = nw_endpoint_get_logging_description(v44);
          v46 = v41;
          v47 = v46;
          v48 = v92->state;
          v86 = v45;
          if (v48 > 5)
            v49 = "unknown-state";
          else
            v49 = off_1E149FC48[v48];

          v72 = v47;
          v73 = v72;
          v74 = "path";
          switch(*((_DWORD *)v90 + 29))
          {
            case 0:
              break;
            case 1:
              v74 = "resolver";
              break;
            case 2:
              v74 = nw_endpoint_flow_mode_string(v72[31]);
              break;
            case 3:
              v74 = "proxy";
              break;
            case 4:
              v74 = "fallback";
              break;
            case 5:
              v74 = "transform";
              break;
            default:
              v74 = "unknown-mode";
              break;
          }

          v80 = v73;
          os_unfair_lock_lock(lock);
          v81 = v91[8];
          os_unfair_lock_unlock(lock);

          *(_DWORD *)buf = 136448002;
          v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
          v100 = 2082;
          v101 = id_str;
          v102 = 2082;
          v103 = v43;
          v104 = 2082;
          v105 = v86;
          v106 = 2082;
          v107 = v49;
          v108 = 2082;
          v109 = v74;
          v110 = 2114;
          v111 = v81;
          v112 = 2082;
          v113 = v37;
          _os_log_impl(&dword_182FBE000, v38, v39, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] deallocated in unexpected state, dumping backtrace:%{public}s", buf, 0x52u);

        }
        free(v37);
        goto LABEL_84;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v24 = (id)gconnectionLogObj;
      v64 = type;
      if (os_log_type_enabled(v24, type))
      {
        id_string = nw_endpoint_handler_get_id_string(v21);
        v66 = nw_endpoint_handler_dry_run_string(v21);
        v67 = nw_endpoint_handler_copy_endpoint(v21);
        v68 = nw_endpoint_get_logging_description(v67);
        v69 = nw_endpoint_handler_state_string(v21);
        v70 = nw_endpoint_handler_mode_string(v21);
        v71 = nw_endpoint_handler_copy_current_path(v21);
        *(_DWORD *)buf = 136447746;
        v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
        v100 = 2082;
        v101 = id_string;
        v102 = 2082;
        v103 = v66;
        v104 = 2082;
        v105 = v68;
        v106 = 2082;
        v107 = v69;
        v108 = 2082;
        v109 = v70;
        v110 = 2114;
        v111 = v71;
        _os_log_impl(&dword_182FBE000, v24, v64, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] deallocated in unexpected state, no backtrace", buf, 0x48u);

        v2 = v92;
      }
    }
    else
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v24 = (id)gconnectionLogObj;
      v50 = type;
      if (os_log_type_enabled(v24, type))
      {
        v51 = v21;

        v52 = v51;
        v53 = (*((_BYTE *)v5 + 268) & 1) == 0;

        if (v53)
          v54 = "";
        else
          v54 = "dry-run ";
        v55 = nw_endpoint_handler_copy_endpoint(v52);
        v56 = nw_endpoint_get_logging_description(v55);
        v57 = v52;
        v58 = v57;
        v59 = v92->state;
        v87 = v56;
        if (v59 > 5)
          v60 = "unknown-state";
        else
          v60 = off_1E149FC48[v59];

        v75 = v58;
        v76 = v75;
        v77 = "path";
        switch(*((_DWORD *)v90 + 29))
        {
          case 0:
            break;
          case 1:
            v77 = "resolver";
            break;
          case 2:
            v77 = nw_endpoint_flow_mode_string(v75[31]);
            break;
          case 3:
            v77 = "proxy";
            break;
          case 4:
            v77 = "fallback";
            break;
          case 5:
            v77 = "transform";
            break;
          default:
            v77 = "unknown-mode";
            break;
        }

        v82 = v76;
        os_unfair_lock_lock(lock);
        v83 = v91[8];
        os_unfair_lock_unlock(lock);

        *(_DWORD *)buf = 136447746;
        v99 = "-[NWConcrete_nw_endpoint_handler dealloc]";
        v100 = 2082;
        v101 = id_str;
        v102 = 2082;
        v103 = v54;
        v104 = 2082;
        v105 = v87;
        v106 = 2082;
        v107 = v60;
        v108 = 2082;
        v109 = v77;
        v110 = 2114;
        v111 = v83;
        _os_log_impl(&dword_182FBE000, v24, v50, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] deallocated in unexpected state, backtrace limit exceeded", buf, 0x48u);

      }
    }

LABEL_84:
    v23 = (char *)v94;
  }
  if (v23)
    free(v23);
LABEL_87:
  v95.receiver = v2;
  v95.super_class = (Class)NWConcrete_nw_endpoint_handler;
  -[NWConcrete_nw_endpoint_handler dealloc](&v95, sel_dealloc, v84, v85);
}

@end
