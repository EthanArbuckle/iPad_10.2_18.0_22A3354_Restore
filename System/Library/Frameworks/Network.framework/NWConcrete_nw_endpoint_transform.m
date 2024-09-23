@implementation NWConcrete_nw_endpoint_transform

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  id v6;
  void *v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned __int8 *child_endpoint_handlers;
  OS_nw_array *v11;
  OS_nw_array *failed_child_endpoint_handlers;
  OS_nw_array *blocked_protocols;
  OS_xpc_object *fallback_modes;
  uint64_t v15;
  void *child_timer;
  id v17;
  const char *v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  char *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  const char *v26;
  os_log_type_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  os_log_type_t v31;
  char *backtrace_string;
  os_log_type_t v33;
  _BOOL4 v34;
  os_log_type_t v35;
  _QWORD v36[4];
  BOOL v37;
  char v38;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v38 = 0;
    if (__nwlog_fault(v19, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v31 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v20, v31, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_36;
      }
      if (!v38)
      {
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v35 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v20, v35, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_36;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v33 = type;
      v34 = os_log_type_enabled(v20, type);
      if (!backtrace_string)
      {
        if (v34)
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl(&dword_182FBE000, v20, v33, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_36;
      }
      if (v34)
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
        v42 = 2082;
        v43 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v20, v33, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_37:
    if (!v19)
      goto LABEL_39;
LABEL_38:
    free(v19);
    goto LABEL_39;
  }
  v8 = (unsigned int *)v6;
  v9 = v8[29];

  if ((_DWORD)v9 == 5)
  {
    child_endpoint_handlers = (unsigned __int8 *)self->child_endpoint_handlers;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __61__NWConcrete_nw_endpoint_transform_cancelWithHandler_forced___block_invoke;
    v36[3] = &__block_descriptor_33_e35_B24__0Q8__NSObject_OS_nw_object__16l;
    v37 = a4;
    nw_array_apply(child_endpoint_handlers, (uint64_t)v36);
    v11 = self->child_endpoint_handlers;
    self->child_endpoint_handlers = 0;

    failed_child_endpoint_handlers = self->failed_child_endpoint_handlers;
    self->failed_child_endpoint_handlers = 0;

    blocked_protocols = self->blocked_protocols;
    self->blocked_protocols = 0;

    self->next_child_endpoint_index = 0;
    fallback_modes = self->fallback_modes;
    self->fallback_modes = 0;

    child_timer = self->child_timer;
    if (child_timer)
    {
      nw_queue_cancel_source((uint64_t)child_timer, v15);
      self->child_timer = 0;
    }
    goto LABEL_39;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v17 = (id)gLogObj;
  if (v9 > 5)
    v18 = "unknown-mode";
  else
    v18 = off_1E149FC18[v9];
  *(_DWORD *)buf = 136446722;
  v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
  v42 = 2082;
  v43 = (void *)v18;
  v44 = 2082;
  v45 = "transform";
  v19 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v38 = 0;
  if (!__nwlog_fault(v19, &type, &v38))
    goto LABEL_37;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v20 = (id)gLogObj;
    v21 = type;
    if (os_log_type_enabled(v20, type))
    {
      if (v9 > 5)
        v22 = "unknown-mode";
      else
        v22 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
      v42 = 2082;
      v43 = (void *)v22;
      v44 = 2082;
      v45 = "transform";
      _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_36:

    goto LABEL_37;
  }
  if (!v38)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v20 = (id)gLogObj;
    v27 = type;
    if (os_log_type_enabled(v20, type))
    {
      if (v9 > 5)
        v28 = "unknown-mode";
      else
        v28 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
      v42 = 2082;
      v43 = (void *)v28;
      v44 = 2082;
      v45 = "transform";
      _os_log_impl(&dword_182FBE000, v20, v27, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_36;
  }
  v23 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v20 = (id)gLogObj;
  v24 = type;
  v25 = os_log_type_enabled(v20, type);
  if (!v23)
  {
    if (v25)
    {
      if (v9 > 5)
        v29 = "unknown-mode";
      else
        v29 = off_1E149FC18[v9];
      *(_DWORD *)buf = 136446722;
      v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
      v42 = 2082;
      v43 = (void *)v29;
      v44 = 2082;
      v45 = "transform";
      _os_log_impl(&dword_182FBE000, v20, v24, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_36;
  }
  if (v25)
  {
    if (v9 > 5)
      v26 = "unknown-mode";
    else
      v26 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446978;
    v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
    v42 = 2082;
    v43 = (void *)v26;
    v44 = 2082;
    v45 = "transform";
    v46 = 2082;
    v47 = v23;
    _os_log_impl(&dword_182FBE000, v20, v24, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v23);
  if (v19)
    goto LABEL_38;
LABEL_39:

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_endpoint_transform;
  -[NWConcrete_nw_endpoint_transform dealloc](&v2, sel_dealloc);
}

- (NWConcrete_nw_endpoint_transform)init
{
  NWConcrete_nw_endpoint_transform *v2;
  NWConcrete_nw_endpoint_transform *v3;
  NWConcrete_nw_endpoint_transform *v4;
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
  v16.super_class = (Class)NWConcrete_nw_endpoint_transform;
  v2 = -[NWConcrete_nw_endpoint_transform init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
          v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
  objc_storeStrong((id *)&self->primary_endpoint, 0);
  objc_storeStrong((id *)&self->connected_child, 0);
  objc_storeStrong((id *)&self->blocked_protocols, 0);
  objc_storeStrong((id *)&self->fallback_modes, 0);
  objc_storeStrong((id *)&self->failed_child_endpoint_handlers, 0);
  objc_storeStrong((id *)&self->child_endpoint_handlers, 0);
}

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
  char *v18;
  char *v19;
  uint64_t v20;
  const char *v21;
  id v22;
  const char *v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  char *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  const char *v31;
  os_log_type_t v32;
  const char *v33;
  void **v34;
  void **v35;
  unsigned int v36;
  const char *v37;
  const char *v38;
  void **v39;
  id v40;
  OS_nw_endpoint *v41;
  OS_nw_endpoint *primary_endpoint;
  NWConcrete_nw_endpoint_handler *v43;
  void *v44;
  os_log_type_t v45;
  char *backtrace_string;
  os_log_type_t v47;
  _BOOL4 v48;
  os_log_type_t v49;
  const char *v50;
  char *v51;
  const char *logging_description;
  char v53;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
    v24 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (__nwlog_fault(v24, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        v45 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v25, v45, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_55;
      }
      if (!v53)
      {
        __nwlog_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        v49 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v25, v49, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_55;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      v47 = type;
      v48 = os_log_type_enabled(v25, type);
      if (!backtrace_string)
      {
        if (v48)
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl(&dword_182FBE000, v25, v47, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_55;
      }
      if (v48)
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
        v57 = 2082;
        v58 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v25, v47, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_56:
    if (!v24)
      goto LABEL_58;
LABEL_57:
    free(v24);
    goto LABEL_58;
  }
  v6 = (unsigned int *)v4;
  v7 = v6[29];

  if ((_DWORD)v7 == 5)
  {
    v8 = v6;
    v9 = v8[30];

    if (v9 == 1)
    {
      v10 = v8;
      v11 = *((_BYTE *)v10 + 268);

      if ((v11 & 0x20) == 0)
      {
        if (__nwlog_connection_log::onceToken != -1)
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
        v12 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = v10;

          v14 = v13;
          v15 = *((_BYTE *)v10 + 268);

          if ((v15 & 1) != 0)
            v16 = "dry-run ";
          else
            v16 = "";
          v17 = nw_endpoint_handler_copy_endpoint(v14);
          logging_description = nw_endpoint_get_logging_description(v17);
          v51 = v13 + 168;
          v18 = v14;
          v19 = v18;
          v20 = v8[30];
          if (v20 > 5)
            v21 = "unknown-state";
          else
            v21 = off_1E149FC48[v20];
          v50 = v21;

          v34 = v19;
          v35 = v34;
          v36 = v6[29];
          v37 = "path";
          switch(v36)
          {
            case 0u:
              break;
            case 1u:
              v37 = "resolver";
              break;
            case 2u:
              v37 = nw_endpoint_flow_mode_string(v34[31]);
              break;
            case 3u:
              v37 = "proxy";
              break;
            case 4u:
              v37 = "fallback";
              break;
            case 5u:
              v37 = "transform";
              break;
            default:
              v37 = "unknown-mode";
              break;
          }

          v39 = v35;
          os_unfair_lock_lock((os_unfair_lock_t)v39 + 28);
          v40 = v39[8];
          os_unfair_lock_unlock((os_unfair_lock_t)v39 + 28);

          *(_DWORD *)buf = 136447746;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          v57 = 2082;
          v58 = v51;
          v59 = 2082;
          v60 = v16;
          v61 = 2082;
          v62 = (void *)logging_description;
          v63 = 2082;
          v64 = v50;
          v65 = 2082;
          v66 = v37;
          v67 = 2114;
          v68 = v40;
          _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

        }
      }
      v41 = (OS_nw_endpoint *)nw_endpoint_handler_copy_endpoint(v10);
      primary_endpoint = self->primary_endpoint;
      self->primary_endpoint = v41;

      v43 = v10;
      v8[30] = 2;

      v43->event = (nw_endpoint_handler_event_s)65543;
      nw_endpoint_handler_report(v43, 0, &v43->event.domain, 0);
      nw_endpoint_transform_add_children(v43);
      nw_endpoint_transform_start_next_child(v43);
    }
    goto LABEL_58;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v22 = (id)gLogObj;
  if (v7 > 5)
    v23 = "unknown-mode";
  else
    v23 = off_1E149FC18[v7];
  *(_DWORD *)buf = 136446722;
  v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
  v57 = 2082;
  v58 = (void *)v23;
  v59 = 2082;
  v60 = "transform";
  v24 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v53 = 0;
  if (!__nwlog_fault(v24, &type, &v53))
    goto LABEL_56;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    v26 = type;
    if (os_log_type_enabled(v25, type))
    {
      if (v7 > 5)
        v27 = "unknown-mode";
      else
        v27 = off_1E149FC18[v7];
      *(_DWORD *)buf = 136446722;
      v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
      v57 = 2082;
      v58 = (void *)v27;
      v59 = 2082;
      v60 = "transform";
      _os_log_impl(&dword_182FBE000, v25, v26, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_55:

    goto LABEL_56;
  }
  if (!v53)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    v32 = type;
    if (os_log_type_enabled(v25, type))
    {
      if (v7 > 5)
        v33 = "unknown-mode";
      else
        v33 = off_1E149FC18[v7];
      *(_DWORD *)buf = 136446722;
      v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
      v57 = 2082;
      v58 = (void *)v33;
      v59 = 2082;
      v60 = "transform";
      _os_log_impl(&dword_182FBE000, v25, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_55;
  }
  v28 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v25 = (id)gLogObj;
  v29 = type;
  v30 = os_log_type_enabled(v25, type);
  if (!v28)
  {
    if (v30)
    {
      if (v7 > 5)
        v38 = "unknown-mode";
      else
        v38 = off_1E149FC18[v7];
      *(_DWORD *)buf = 136446722;
      v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
      v57 = 2082;
      v58 = (void *)v38;
      v59 = 2082;
      v60 = "transform";
      _os_log_impl(&dword_182FBE000, v25, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_55;
  }
  if (v30)
  {
    if (v7 > 5)
      v31 = "unknown-mode";
    else
      v31 = off_1E149FC18[v7];
    *(_DWORD *)buf = 136446978;
    v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
    v57 = 2082;
    v58 = (void *)v31;
    v59 = 2082;
    v60 = "transform";
    v61 = 2082;
    v62 = v28;
    _os_log_impl(&dword_182FBE000, v25, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v28);
  if (v24)
    goto LABEL_57;
LABEL_58:

}

- (void)updatePathWithHandler:(id)a3
{
  id v3;
  void *v4;
  unsigned int *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  char *backtrace_string;
  os_log_type_t v14;
  _BOOL4 v15;
  const char *v16;
  os_log_type_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  os_log_type_t v21;
  char *v22;
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
  if (v3)
  {
    v5 = (unsigned int *)v3;
    v6 = v5[29];

    if ((_DWORD)v6 == 5)
      goto LABEL_37;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (v6 > 5)
      v8 = "unknown-mode";
    else
      v8 = off_1E149FC18[v6];
    *(_DWORD *)buf = 136446722;
    v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
    v30 = 2082;
    v31 = (void *)v8;
    v32 = 2082;
    v33 = "transform";
    v9 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v26 = 0;
    if (!__nwlog_fault(v9, &type, &v26))
      goto LABEL_35;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        if (v6 > 5)
          v12 = "unknown-mode";
        else
          v12 = off_1E149FC18[v6];
        *(_DWORD *)buf = 136446722;
        v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        v30 = 2082;
        v31 = (void *)v12;
        v32 = 2082;
        v33 = "transform";
        _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
      }
    }
    else if (v26)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v14 = type;
      v15 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v15)
        {
          if (v6 > 5)
            v16 = "unknown-mode";
          else
            v16 = off_1E149FC18[v6];
          *(_DWORD *)buf = 136446978;
          v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
          v30 = 2082;
          v31 = (void *)v16;
          v32 = 2082;
          v33 = "transform";
          v34 = 2082;
          v35 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v10, v14, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
        }

        free(backtrace_string);
        if (v9)
          goto LABEL_36;
        goto LABEL_37;
      }
      if (v15)
      {
        if (v6 > 5)
          v19 = "unknown-mode";
        else
          v19 = off_1E149FC18[v6];
        *(_DWORD *)buf = 136446722;
        v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        v30 = 2082;
        v31 = (void *)v19;
        v32 = 2082;
        v33 = "transform";
        _os_log_impl(&dword_182FBE000, v10, v14, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v17 = type;
      if (os_log_type_enabled(v10, type))
      {
        if (v6 > 5)
          v18 = "unknown-mode";
        else
          v18 = off_1E149FC18[v6];
        *(_DWORD *)buf = 136446722;
        v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        v30 = 2082;
        v31 = (void *)v18;
        v32 = 2082;
        v33 = "transform";
        _os_log_impl(&dword_182FBE000, v10, v17, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
      }
    }
    goto LABEL_34;
  }
  __nwlog_obj();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
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
        v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v10, v21, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v26)
    {
      v22 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      v24 = os_log_type_enabled(v10, type);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
          v30 = 2082;
          v31 = v22;
          _os_log_impl(&dword_182FBE000, v10, v23, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v22);
        if (v9)
          goto LABEL_36;
        goto LABEL_37;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v10, v23, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v25 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl(&dword_182FBE000, v10, v25, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_34:

  }
LABEL_35:
  if (v9)
LABEL_36:
    free(v9);
LABEL_37:

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
    v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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

  if ((_DWORD)v9 != 5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    if (v9 > 5)
      v13 = "unknown-mode";
    else
      v13 = off_1E149FC18[v9];
    *(_DWORD *)buf = 136446722;
    v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
    v43 = 2082;
    v44 = (void *)v13;
    v45 = 2082;
    v46 = "transform";
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
          v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v17;
          v45 = 2082;
          v46 = "transform";
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
            v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
            v43 = 2082;
            v44 = (void *)v21;
            v45 = 2082;
            v46 = "transform";
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
          v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v24;
          v45 = 2082;
          v46 = "transform";
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
          v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
          v43 = 2082;
          v44 = (void *)v23;
          v45 = 2082;
          v46 = "transform";
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
    v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
        _os_log_impl(&dword_182FBE000, v15, v33, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
      v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v15, v33, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_60;
  }
  child_endpoint_handlers = (unsigned __int8 *)self->child_endpoint_handlers;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __64__NWConcrete_nw_endpoint_transform_applyWithHandler_toChildren___block_invoke;
  v37[3] = &unk_1E14AC278;
  v38 = v7;
  v11 = nw_array_apply(child_endpoint_handlers, (uint64_t)v37);

LABEL_40:
  return v11;
}

@end
