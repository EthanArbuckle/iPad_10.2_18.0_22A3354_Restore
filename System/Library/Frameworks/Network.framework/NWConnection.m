@implementation NWConnection

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("connectionState")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("viable")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("hasBetterPath")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("error")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("currentPath")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWConnection;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (id)connectionWithEndpoint:(id)a3 parameters:(id)a4
{
  id v5;
  id v6;
  __objc2_class *v7;
  void *v8;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  const char *v15;
  char *backtrace_string;
  _BOOL4 v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  char v22;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "dataMode") == 2)
  {
    v7 = NWStreamConnection;
LABEL_7:
    v8 = (void *)objc_msgSend([v7 alloc], "initWithEndpoint:parameters:", v5, v6);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "dataMode") == 1)
  {
    v7 = NWDatagramConnection;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "dataMode") == 3)
  {
    v7 = NWMessageConnection;
    goto LABEL_7;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v10 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
  v26 = 1024;
  v27 = objc_msgSend(v6, "dataMode");
  LODWORD(v21) = 18;
  v11 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v22 = 0;
  if (__nwlog_fault(v11, &type, &v22))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        v14 = objc_msgSend(v6, "dataMode", buf, v21);
        *(_DWORD *)buf = 136446466;
        v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
        v26 = 1024;
        v27 = v14;
        v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u)";
LABEL_22:
        _os_log_impl(&dword_182FBE000, v12, v13, v15, buf, 0x12u);
      }
    }
    else
    {
      if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v13 = type;
        v17 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v17)
          {
            v18 = objc_msgSend(v6, "dataMode", buf, v21);
            *(_DWORD *)buf = 136446722;
            v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
            v26 = 1024;
            v27 = v18;
            v28 = 2082;
            v29 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s Parameters must specify a valid data mode for new connections (received %u), dumping backtrace:%{public}s", buf, 0x1Cu);
          }

          free(backtrace_string);
          goto LABEL_24;
        }
        if (!v17)
          goto LABEL_23;
        v20 = objc_msgSend(v6, "dataMode", buf, v21);
        *(_DWORD *)buf = 136446466;
        v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
        v26 = 1024;
        v27 = v20;
        v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), no backtrace";
        goto LABEL_22;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        v19 = objc_msgSend(v6, "dataMode", buf, v21);
        *(_DWORD *)buf = 136446466;
        v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
        v26 = 1024;
        v27 = v19;
        v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), backtrace limit exceeded";
        goto LABEL_22;
      }
    }
LABEL_23:

  }
LABEL_24:
  if (v11)
    free(v11);
  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)connectionWithConnectedSocket:(int)a3
{
  id v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  const char *v7;
  char *backtrace_string;
  os_log_type_t v9;
  _BOOL4 v10;
  NSObject *v12;
  os_log_type_t v13;
  char v14;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v17 = "+[NWConnection connectionWithConnectedSocket:]";
  v4 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v14 = 0;
  if (__nwlog_fault(v4, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v6 = type;
      if (!os_log_type_enabled(v5, type))
        goto LABEL_17;
      *(_DWORD *)buf = 136446210;
      v17 = "+[NWConnection connectionWithConnectedSocket:]";
      v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection";
LABEL_15:
      v12 = v5;
      v13 = v6;
      goto LABEL_16;
    }
    if (!v14)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v6 = type;
      if (!os_log_type_enabled(v5, type))
        goto LABEL_17;
      *(_DWORD *)buf = 136446210;
      v17 = "+[NWConnection connectionWithConnectedSocket:]";
      v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, backtrace limit exceeded";
      goto LABEL_15;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    v9 = type;
    v10 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (!v10)
      {
LABEL_17:

        if (!v4)
          return 0;
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136446210;
      v17 = "+[NWConnection connectionWithConnectedSocket:]";
      v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, no backtrace";
      v12 = v5;
      v13 = v9;
LABEL_16:
      _os_log_impl(&dword_182FBE000, v12, v13, v7, buf, 0xCu);
      goto LABEL_17;
    }
    if (v10)
    {
      *(_DWORD *)buf = 136446466;
      v17 = "+[NWConnection connectionWithConnectedSocket:]";
      v18 = 2082;
      v19 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v5, v9, "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v4)
LABEL_11:
    free(v4);
  return 0;
}

+ (id)connectionWithInternalConnection:(id)a3
{
  NSObject *v3;
  nw_parameters_t v4;
  int data_mode;
  __objc2_class *v6;
  void *v7;
  int v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  char *backtrace_string;
  os_log_type_t v15;
  _BOOL4 v16;
  NSObject *v18;
  os_log_type_t v19;
  char v20;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = nw_connection_copy_parameters(v3);
  data_mode = nw_parameters_get_data_mode(v4);
  if (data_mode == 1)
  {
    v6 = NWDatagramConnection;
    goto LABEL_5;
  }
  if (data_mode != 2)
  {
    v8 = data_mode;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v23 = "+[NWConnection connectionWithInternalConnection:]";
    v24 = 1024;
    v25 = v8;
    v10 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v20 = 0;
    if (__nwlog_fault(v10, &type, &v20))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (!os_log_type_enabled(v11, type))
          goto LABEL_23;
        *(_DWORD *)buf = 136446466;
        v23 = "+[NWConnection connectionWithInternalConnection:]";
        v24 = 1024;
        v25 = v8;
        v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u)";
LABEL_21:
        v18 = v11;
        v19 = v12;
        goto LABEL_22;
      }
      if (!v20)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (!os_log_type_enabled(v11, type))
          goto LABEL_23;
        *(_DWORD *)buf = 136446466;
        v23 = "+[NWConnection connectionWithInternalConnection:]";
        v24 = 1024;
        v25 = v8;
        v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), backtrace limit exceeded";
        goto LABEL_21;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      v15 = type;
      v16 = os_log_type_enabled(v11, type);
      if (!backtrace_string)
      {
        if (!v16)
        {
LABEL_23:

          if (!v10)
            goto LABEL_17;
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446466;
        v23 = "+[NWConnection connectionWithInternalConnection:]";
        v24 = 1024;
        v25 = v8;
        v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), no backtrace";
        v18 = v11;
        v19 = v15;
LABEL_22:
        _os_log_impl(&dword_182FBE000, v18, v19, v13, buf, 0x12u);
        goto LABEL_23;
      }
      if (v16)
      {
        *(_DWORD *)buf = 136446722;
        v23 = "+[NWConnection connectionWithInternalConnection:]";
        v24 = 1024;
        v25 = v8;
        v26 = 2082;
        v27 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v11, v15, "%{public}s Parameters must specify a valid data mode for new connections (received %u), dumping backtrace:%{public}s", buf, 0x1Cu);
      }

      free(backtrace_string);
    }
    if (!v10)
    {
LABEL_17:
      v7 = 0;
      goto LABEL_18;
    }
LABEL_16:
    free(v10);
    goto LABEL_17;
  }
  v6 = NWStreamConnection;
LABEL_5:
  v7 = (void *)objc_msgSend([v6 alloc], "initWithInternalConnection:", v3);
LABEL_18:

  return v7;
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD handler[4];
  id v18;
  id location;

  objc_initWeak(&location, self);
  -[NWConnection internalConnection](self, "internalConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __21__NWConnection_start__block_invoke;
  handler[3] = &unk_1E14AC888;
  objc_copyWeak(&v18, &location);
  nw_connection_set_state_changed_handler(v3, handler);

  -[NWConnection internalConnection](self, "internalConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __21__NWConnection_start__block_invoke_11;
  v15[3] = &unk_1E149C288;
  objc_copyWeak(&v16, &location);
  nw_connection_set_viability_changed_handler(v5, v15);

  -[NWConnection internalConnection](self, "internalConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __21__NWConnection_start__block_invoke_15;
  v13[3] = &unk_1E149C288;
  objc_copyWeak(&v14, &location);
  nw_connection_set_better_path_available_handler(v6, v13);

  -[NWConnection internalConnection](self, "internalConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __21__NWConnection_start__block_invoke_16;
  v11[3] = &unk_1E14AC8E0;
  objc_copyWeak(&v12, &location);
  nw_connection_set_path_changed_handler(v7, v11);

  -[NWConnection internalConnection](self, "internalConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v9 = (id)NWCopyInternalQueue_nwQueue;
  nw_connection_set_queue(v8, v9);

  -[NWConnection internalConnection](self, "internalConnection");
  v10 = objc_claimAutoreleasedReturnValue();
  nw_connection_start(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (NWConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  NWConnection *v8;
  void *v9;
  char indefinite_set;
  NSObject *v11;
  NSObject *v12;
  nw_connection_t v13;
  NWConnection *v14;
  void *v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  char *backtrace_string;
  _BOOL4 v22;
  char v23;
  os_log_type_t type;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NWConnection;
  v8 = -[NWConnection init](&v25, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "internalParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    indefinite_set = nw_parameters_get_indefinite_set(v9);

    if ((indefinite_set & 1) == 0)
      objc_msgSend(v7, "setIndefinite:", 0);
    objc_msgSend(v6, "internalEndpoint");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internalParameters");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = nw_connection_create(v11, v12);
    -[NWConnection setInternalConnection:](v8, "setInternalConnection:", v13);

    -[NWConnection internalConnection](v8, "internalConnection");
    v14 = (NWConnection *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[NWConnection setInternalConnectionState:](v8, "setInternalConnectionState:", 2);
      -[NWConnection start](v8, "start");
      v14 = v8;
    }
    goto LABEL_6;
  }
  __nwlog_obj();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWConnection initWithEndpoint:parameters:]";
  v17 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v23 = 0;
  if (__nwlog_fault(v17, &type, &v23))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConnection initWithEndpoint:parameters:]";
        v20 = "%{public}s [super init] failed";
LABEL_20:
        _os_log_impl(&dword_182FBE000, v18, v19, v20, buf, 0xCu);
      }
    }
    else
    {
      if (v23)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = type;
        v22 = os_log_type_enabled(v18, type);
        if (backtrace_string)
        {
          if (v22)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWConnection initWithEndpoint:parameters:]";
            v28 = 2082;
            v29 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v18, v19, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }
        if (!v22)
          goto LABEL_21;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConnection initWithEndpoint:parameters:]";
        v20 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_20;
      }
      __nwlog_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConnection initWithEndpoint:parameters:]";
        v20 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }
LABEL_21:

  }
LABEL_22:
  if (v17)
    free(v17);
  v14 = 0;
LABEL_6:

  return v14;
}

- (NWConnection)initWithConnectedSocket:(int)a3
{
  NWConnection *v4;
  unsigned int v5;
  _QWORD *v6;
  void *v7;
  NWConnection *v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  const char *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  char *v17;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  const char *backtrace_string;
  _BOOL4 v26;
  char v27;
  os_log_type_t type;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)NWConnection;
  v4 = -[NWConnection init](&v29, sel_init);
  if (!v4)
  {
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v31 = "-[NWConnection initWithConnectedSocket:]";
    v10 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v27 = 0;
    if (!__nwlog_fault(v10, &type, &v27))
      goto LABEL_19;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWConnection initWithConnectedSocket:]";
        v24 = "%{public}s [super init] failed";
LABEL_44:
        _os_log_impl(&dword_182FBE000, v22, v23, v24, buf, 0xCu);
      }
    }
    else
    {
      if (v27)
      {
        backtrace_string = __nw_create_backtrace_string();
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = type;
        v26 = os_log_type_enabled(v22, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            v31 = "-[NWConnection initWithConnectedSocket:]";
            v32 = 2082;
            v33 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          v17 = (char *)backtrace_string;
LABEL_18:
          free(v17);
          goto LABEL_19;
        }
        if (!v26)
          goto LABEL_45;
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWConnection initWithConnectedSocket:]";
        v24 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_44;
      }
      __nwlog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWConnection initWithConnectedSocket:]";
        v24 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_44;
      }
    }
LABEL_45:

LABEL_19:
    if (!v10)
    {
LABEL_21:
      v8 = 0;
      goto LABEL_22;
    }
LABEL_20:
    free(v10);
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
  }
  v6 = nw_connection_create_with_connected_socket(a3, v5);
  -[NWConnection setInternalConnection:](v4, "setInternalConnection:", v6);

  -[NWConnection internalConnection](v4, "internalConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v31 = "-[NWConnection initWithConnectedSocket:]";
    v10 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v27 = 0;
    if (!__nwlog_fault(v10, &type, &v27))
      goto LABEL_19;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      v12 = type;
      if (!os_log_type_enabled(v11, type))
        goto LABEL_27;
      *(_DWORD *)buf = 136446210;
      v31 = "-[NWConnection initWithConnectedSocket:]";
      v13 = "%{public}s nw_connection_create_with_connected_socket failed";
LABEL_25:
      v19 = v11;
      v20 = v12;
      goto LABEL_26;
    }
    if (!v27)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      v12 = type;
      if (!os_log_type_enabled(v11, type))
        goto LABEL_27;
      *(_DWORD *)buf = 136446210;
      v31 = "-[NWConnection initWithConnectedSocket:]";
      v13 = "%{public}s nw_connection_create_with_connected_socket failed, backtrace limit exceeded";
      goto LABEL_25;
    }
    v14 = __nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    v15 = type;
    v16 = os_log_type_enabled(v11, type);
    if (!v14)
    {
      if (!v16)
      {
LABEL_27:

        if (!v10)
          goto LABEL_21;
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446210;
      v31 = "-[NWConnection initWithConnectedSocket:]";
      v13 = "%{public}s nw_connection_create_with_connected_socket failed, no backtrace";
      v19 = v11;
      v20 = v15;
LABEL_26:
      _os_log_impl(&dword_182FBE000, v19, v20, v13, buf, 0xCu);
      goto LABEL_27;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446466;
      v31 = "-[NWConnection initWithConnectedSocket:]";
      v32 = 2082;
      v33 = v14;
      _os_log_impl(&dword_182FBE000, v11, v15, "%{public}s nw_connection_create_with_connected_socket failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    v17 = (char *)v14;
    goto LABEL_18;
  }
  -[NWConnection setInternalConnectionState:](v4, "setInternalConnectionState:", 2);
  -[NWConnection start](v4, "start");
  v8 = v4;
LABEL_22:

  return v8;
}

- (NWConnection)initWithInternalConnection:(id)a3
{
  id v4;
  NWConnection *v5;
  NWConnection *v6;
  NWConnection *v7;
  void *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  char *backtrace_string;
  _BOOL4 v15;
  char v16;
  os_log_type_t type;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NWConnection;
  v5 = -[NWConnection init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NWConnection setInternalConnection:](v5, "setInternalConnection:", v4);
    -[NWConnection setInternalConnectionState:](v6, "setInternalConnectionState:", 2);
    -[NWConnection start](v6, "start");
    v7 = v6;
    goto LABEL_3;
  }
  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWConnection initWithInternalConnection:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v16 = 0;
  if (__nwlog_fault(v10, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConnection initWithInternalConnection:]";
        v13 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v16)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = type;
        v15 = os_log_type_enabled(v11, type);
        if (backtrace_string)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136446466;
            v20 = "-[NWConnection initWithInternalConnection:]";
            v21 = 2082;
            v22 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v15)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConnection initWithInternalConnection:]";
        v13 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConnection initWithInternalConnection:]";
        v13 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v10)
    free(v10);
LABEL_3:

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;

  -[NWConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)getConnectedSocket
{
  void *v2;
  int connected_socket;

  -[NWConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  connected_socket = nw_connection_get_connected_socket(v2);

  return connected_socket;
}

- (void)cancel
{
  NSObject *v2;

  -[NWConnection internalConnection](self, "internalConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_connection_cancel(v2);

}

- (void)forceCancel
{
  NSObject *v2;

  -[NWConnection internalConnection](self, "internalConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_connection_force_cancel(v2);

}

- (void)cancelCurrentEndpoint
{
  NSObject *v2;

  -[NWConnection internalConnection](self, "internalConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_connection_cancel_current_endpoint(v2);

}

- (unsigned)tlsConnectionTime
{
  void *v2;
  _BOOL4 v3;
  _QWORD v5[2];
  uint64_t v6;

  v5[0] = 0;
  v5[1] = 0;
  v6 = 0;
  -[NWConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_fillout_tcp_statistics(v2, (uint64_t)v5);

  if (v3)
    return v6;
  else
    return 0;
}

- (int64_t)connectionState
{
  NWConnection *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWConnection internalConnectionState](v2, "internalConnectionState");
  objc_sync_exit(v2);

  return v3;
}

- (NWEndpoint)connectedLocalEndpoint
{
  void *v2;
  id v3;
  void *v4;

  -[NWConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_copy_connected_local_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)connectedRemoteEndpoint
{
  void *v2;
  id v3;
  void *v4;

  -[NWConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_copy_connected_remote_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (BOOL)isViable
{
  NWConnection *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWConnection internalIsViable](v2, "internalIsViable");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasBetterPath
{
  NWConnection *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWConnection internalHasBetterPath](v2, "internalHasBetterPath");
  objc_sync_exit(v2);

  return v3;
}

- (id)copyError
{
  NWConnection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NWConnection internalError](v2, "internalError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSError)error
{
  return (NSError *)-[NWConnection copyError](self, "copyError");
}

- (id)copyCurrentPath
{
  NWConnection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NWConnection internalPath](v2, "internalPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NWPath)currentPath
{
  return (NWPath *)-[NWConnection copyCurrentPath](self, "copyCurrentPath");
}

- (NWEndpoint)endpoint
{
  NSObject *v2;
  nw_endpoint_t v3;
  void *v4;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  NSObject *v14;
  os_log_type_t v15;
  char v16;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NWConnection internalConnection](self, "internalConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_copy_endpoint(v2);

  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWConnection endpoint]";
    v6 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
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
        v19 = "-[NWConnection endpoint]";
        v9 = "%{public}s nw_connection_copy_endpoint failed";
LABEL_18:
        v14 = v7;
        v15 = v8;
        goto LABEL_19;
      }
      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConnection endpoint]";
        v9 = "%{public}s nw_connection_copy_endpoint failed, backtrace limit exceeded";
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
            goto LABEL_14;
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConnection endpoint]";
        v9 = "%{public}s nw_connection_copy_endpoint failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWConnection endpoint]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_connection_copy_endpoint failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_14:
      v4 = 0;
      goto LABEL_15;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return (NWEndpoint *)v4;
}

- (NWParameters)parameters
{
  NSObject *v2;
  nw_parameters_t v3;
  void *v4;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  NSObject *v14;
  os_log_type_t v15;
  char v16;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NWConnection internalConnection](self, "internalConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_copy_parameters(v2);

  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWConnection parameters]";
    v6 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
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
        v19 = "-[NWConnection parameters]";
        v9 = "%{public}s nw_connection_copy_parameters failed";
LABEL_18:
        v14 = v7;
        v15 = v8;
        goto LABEL_19;
      }
      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConnection parameters]";
        v9 = "%{public}s nw_connection_copy_parameters failed, backtrace limit exceeded";
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
            goto LABEL_14;
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConnection parameters]";
        v9 = "%{public}s nw_connection_copy_parameters failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWConnection parameters]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_connection_copy_parameters failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_14:
      v4 = 0;
      goto LABEL_15;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  +[NWParameters parametersWithCParameters:](NWParameters, "parametersWithCParameters:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return (NWParameters *)v4;
}

- (int64_t)internalConnectionState
{
  return self->_internalConnectionState;
}

- (void)setInternalConnectionState:(int64_t)a3
{
  self->_internalConnectionState = a3;
}

- (BOOL)internalIsViable
{
  return self->_internalIsViable;
}

- (void)setInternalIsViable:(BOOL)a3
{
  self->_internalIsViable = a3;
}

- (BOOL)internalHasBetterPath
{
  return self->_internalHasBetterPath;
}

- (void)setInternalHasBetterPath:(BOOL)a3
{
  self->_internalHasBetterPath = a3;
}

- (NSError)internalError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternalError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NWPath)internalPath
{
  return (NWPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NWConcrete_nw_connection)internalConnection
{
  return self->_internalConnection;
}

- (void)setInternalConnection:(id)a3
{
  objc_storeStrong((id *)&self->_internalConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalConnection, 0);
  objc_storeStrong((id *)&self->_internalPath, 0);
  objc_storeStrong((id *)&self->_internalError, 0);
}

void __21__NWConnection_start__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  CFErrorRef v11;
  int v12;
  const char *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v6 = (id)gLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136446722;
    v13 = "-[NWConnection start]_block_invoke";
    v14 = 1024;
    v15 = a2;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_DEBUG, "%{public}s Connection got event: state %d %{public}@", (uint8_t *)&v12, 0x1Cu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_sync_enter(v9);
    v10 = objc_msgSend(v9, "internalConnectionState");
    if (v10 != a2)
    {
      objc_msgSend(v9, "willChangeValueForKey:", CFSTR("connectionState"));
      objc_msgSend(v9, "setInternalConnectionState:", a2);
    }
    if (v5)
    {
      objc_msgSend(v9, "willChangeValueForKey:", CFSTR("error"));
      v11 = nw_error_copy_cf_error(v5);
      objc_msgSend(v9, "setInternalError:", v11);

    }
    objc_sync_exit(v9);

    if (v10 != a2)
      objc_msgSend(v9, "didChangeValueForKey:", CFSTR("connectionState"));
    if (v5)
      objc_msgSend(v9, "didChangeValueForKey:", CFSTR("error"));
  }

}

void __21__NWConnection_start__block_invoke_11(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  id WeakRetained;
  void *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = " not";
    if ((_DWORD)a2)
      v5 = "";
    v9 = 136446466;
    v10 = "-[NWConnection start]_block_invoke";
    v11 = 2082;
    v12 = v5;
    _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_DEBUG, "%{public}s Connection got viability event: is%{public}s viable", (uint8_t *)&v9, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_sync_enter(v8);
    if (objc_msgSend(v8, "internalIsViable") == (_DWORD)a2)
    {
      objc_sync_exit(v8);

    }
    else
    {
      objc_msgSend(v8, "willChangeValueForKey:", CFSTR("viable"));
      objc_msgSend(v8, "setInternalIsViable:", a2);
      objc_sync_exit(v8);

      objc_msgSend(v8, "didChangeValueForKey:", CFSTR("viable"));
    }
  }

}

void __21__NWConnection_start__block_invoke_15(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  id WeakRetained;
  void *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = " not";
    if ((_DWORD)a2)
      v5 = "";
    v9 = 136446466;
    v10 = "-[NWConnection start]_block_invoke";
    v11 = 2082;
    v12 = v5;
    _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_DEBUG, "%{public}s Connection got better path event: better path%{public}s available", (uint8_t *)&v9, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_sync_enter(v8);
    if (objc_msgSend(v8, "internalHasBetterPath") == (_DWORD)a2)
    {
      objc_sync_exit(v8);

    }
    else
    {
      objc_msgSend(v8, "willChangeValueForKey:", CFSTR("hasBetterPath"));
      objc_msgSend(v8, "setInternalHasBetterPath:", a2);
      objc_sync_exit(v8);

      objc_msgSend(v8, "didChangeValueForKey:", CFSTR("hasBetterPath"));
    }
  }

}

void __21__NWConnection_start__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  NWPath *v6;
  id v7;
  NWPath *v8;
  BOOL v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136446210;
    v11 = "-[NWConnection start]_block_invoke";
    _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_DEBUG, "%{public}s Connection got updated path event", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = -[NWPath initWithPath:]([NWPath alloc], "initWithPath:", v3);
    v7 = WeakRetained;
    objc_sync_enter(v7);
    objc_msgSend(v7, "internalPath");
    v8 = (NWPath *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == v6;

    if (v9)
    {
      objc_sync_exit(v7);

    }
    else
    {
      objc_msgSend(v7, "willChangeValueForKey:", CFSTR("currentPath"));
      objc_msgSend(v7, "setInternalPath:", v6);
      objc_sync_exit(v7);

      objc_msgSend(v7, "didChangeValueForKey:", CFSTR("currentPath"));
    }

  }
}

@end
