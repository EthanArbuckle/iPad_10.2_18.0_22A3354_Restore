@implementation NWTCPConnection

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("state")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("hasBetterPath")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("viable")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWTCPConnection;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (id)stringFromNWTCPConnectionState:(int64_t)a3
{
  if ((unint64_t)a3 < 6)
    return off_1E149A600[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INVALID(%ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NWTCPConnection)initWithAcceptedInternalConnection:(id)a3
{
  id v5;
  NWTCPConnection *v6;
  NWTCPConnection *v7;
  nw_connection_t *p_internalConnection;
  id *v9;
  id v10;
  uint64_t v11;
  NWEndpoint *endpoint;
  NWParameters *v13;
  id *v14;
  id v15;
  uint64_t v16;
  NWParameters *parameters;
  NSObject *v18;
  NSObject *v19;
  void *v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  char *backtrace_string;
  os_log_type_t v30;
  _BOOL4 v31;
  char *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  os_log_type_t v35;
  os_log_type_t v36;
  objc_super v37;
  char v38;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v38 = 0;
    if (__nwlog_fault(v22, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_182FBE000, v23, v24, "%{public}s called with null internalConnection", buf, 0xCu);
        }
      }
      else if (v38)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v30 = type;
        v31 = os_log_type_enabled(v23, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
            v42 = 2082;
            v43 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v23, v30, "%{public}s called with null internalConnection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_36;
        }
        if (v31)
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_182FBE000, v23, v30, "%{public}s called with null internalConnection, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v35 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_182FBE000, v23, v35, "%{public}s called with null internalConnection, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_36:
    if (v22)
      free(v22);

    goto LABEL_44;
  }
  v37.receiver = self;
  v37.super_class = (Class)NWTCPConnection;
  v6 = -[NWTCPConnection init](&v37, sel_init);
  v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
    v26 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v38 = 0;
    if (__nwlog_fault(v26, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_182FBE000, v27, v28, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v38)
      {
        v32 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v33 = type;
        v34 = os_log_type_enabled(v27, type);
        if (v32)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
            v42 = 2082;
            v43 = v32;
            _os_log_impl(&dword_182FBE000, v27, v33, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v32);
          goto LABEL_42;
        }
        if (v34)
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_182FBE000, v27, v33, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v36 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_182FBE000, v27, v36, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_42:
    if (v26)
      free(v26);
LABEL_44:
    v7 = 0;
    goto LABEL_6;
  }
  p_internalConnection = (nw_connection_t *)&v6->_internalConnection;
  objc_storeStrong((id *)&v6->_internalConnection, a3);
  v9 = (id *)v5;
  v10 = v9[1];

  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  endpoint = v7->_endpoint;
  v7->_endpoint = (NWEndpoint *)v11;

  v13 = [NWParameters alloc];
  v14 = v9;
  v15 = v14[2];

  v16 = -[NWParameters initWithParameters:](v13, "initWithParameters:", v15);
  parameters = v7->_parameters;
  v7->_parameters = (NWParameters *)v16;

  v7->_state = 1;
  -[NWTCPConnection setupEventHandler](v7, "setupEventHandler");
  v18 = *p_internalConnection;
  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v19 = (id)NWCopyInternalQueue_nwQueue;
  nw_connection_set_queue(v18, v19);

  nw_connection_start(*p_internalConnection);
LABEL_6:

  return v7;
}

- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  NWTCPConnection *v11;
  NSObject *v12;
  NSObject *v13;
  nw_protocol_options_t v14;
  _BOOL4 v15;
  NWConcrete_nw_protocol_options *options;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NWParameters *v20;
  NWParameters *parameters;
  NWTCPConnection *v22;
  id v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  char *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  os_log_type_t v30;
  void *v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  void *v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  void *v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  char *backtrace_string;
  os_log_type_t v45;
  _BOOL4 v46;
  char *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  char *v50;
  os_log_type_t v51;
  _BOOL4 v52;
  os_log_type_t v53;
  os_log_type_t v54;
  os_log_type_t v55;
  id obj;
  objc_super v57;
  char v58;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  obj = a5;
  if (!v9)
  {
    __nwlog_obj();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
    v33 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v58 = 0;
    if (__nwlog_fault(v33, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = type;
        if (os_log_type_enabled(v34, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v34, v35, "%{public}s called with null endpoint", buf, 0xCu);
        }
      }
      else if (v58)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v34 = objc_claimAutoreleasedReturnValue();
        v45 = type;
        v46 = os_log_type_enabled(v34, type);
        if (backtrace_string)
        {
          if (v46)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
            v62 = 2082;
            v63 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v34, v45, "%{public}s called with null endpoint, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_76;
        }
        if (v46)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v34, v45, "%{public}s called with null endpoint, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v34 = objc_claimAutoreleasedReturnValue();
        v53 = type;
        if (os_log_type_enabled(v34, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v34, v53, "%{public}s called with null endpoint, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_76:
    if (v33)
      free(v33);
    goto LABEL_78;
  }
  if (!v10)
  {
    __nwlog_obj();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
    v37 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v58 = 0;
    if (__nwlog_fault(v37, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = type;
        if (os_log_type_enabled(v38, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v38, v39, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if (v58)
      {
        v47 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v48 = type;
        v49 = os_log_type_enabled(v38, type);
        if (v47)
        {
          if (v49)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
            v62 = 2082;
            v63 = v47;
            _os_log_impl(&dword_182FBE000, v38, v48, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v47);
          goto LABEL_82;
        }
        if (v49)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v38, v48, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v54 = type;
        if (os_log_type_enabled(v38, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v38, v54, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_82:
    if (v37)
      free(v37);
LABEL_78:

LABEL_90:
    v22 = 0;
    goto LABEL_33;
  }
  v57.receiver = self;
  v57.super_class = (Class)NWTCPConnection;
  v11 = -[NWTCPConnection init](&v57, sel_init);
  if (!v11)
  {
    __nwlog_obj();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
    v41 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v58 = 0;
    if (__nwlog_fault(v41, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v42, v43, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v58)
      {
        v50 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        v51 = type;
        v52 = os_log_type_enabled(v42, type);
        if (v50)
        {
          if (v52)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
            v62 = 2082;
            v63 = v50;
            _os_log_impl(&dword_182FBE000, v42, v51, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v50);
          goto LABEL_88;
        }
        if (v52)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v42, v51, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        v55 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v42, v55, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_88:
    if (v41)
      free(v41);
    goto LABEL_90;
  }
  v12 = objc_msgSend(v10, "copyCParameters");
  v13 = nw_parameters_copy_default_protocol_stack(v12);
  v14 = nw_protocol_stack_copy_transport_protocol(v13);
  v15 = v14 == 0;

  if (v15)
  {
    if (nw_protocol_setup_tcp_definition(void)::onceToken != -1)
      dispatch_once(&nw_protocol_setup_tcp_definition(void)::onceToken, &__block_literal_global_62963);
    options = nw_protocol_create_options((void *)g_tcp_definition);
    nw_protocol_stack_set_transport_protocol(v13, &options->super);

  }
  nw_parameters_set_indefinite(v12, 1);
  nw_parameters_set_no_opaque_proxy(v12, 1);
  objc_msgSend(v9, "internalEndpoint");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = nw_connection_create(v17, v12);

  if (v18)
  {
    if (NWCopyInternalQueue_init_once != -1)
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
    v19 = (id)NWCopyInternalQueue_nwQueue;
    nw_connection_set_queue(v18, v19);

    objc_storeStrong((id *)&v11->_endpoint, a3);
    v20 = -[NWParameters initWithParameters:]([NWParameters alloc], "initWithParameters:", v12);
    parameters = v11->_parameters;
    v11->_parameters = v20;

    objc_storeStrong((id *)&v11->_internalConnection, v18);
    objc_storeWeak((id *)&v11->_delegate, obj);
    v11->_state = 1;
    -[NWTCPConnection startInternal](v11, "startInternal");
    v22 = v11;
    goto LABEL_32;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v23 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
  v24 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v58 = 0;
  if (__nwlog_fault(v24, &type, &v58))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v25 = (id)gLogObj;
      v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
        _os_log_impl(&dword_182FBE000, v25, v26, "%{public}s nw_connection_create failed", buf, 0xCu);
      }
    }
    else if (v58)
    {
      v27 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v25 = (id)gLogObj;
      v28 = type;
      v29 = os_log_type_enabled(v25, type);
      if (v27)
      {
        if (v29)
        {
          *(_DWORD *)buf = 136446466;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          v62 = 2082;
          v63 = v27;
          _os_log_impl(&dword_182FBE000, v25, v28, "%{public}s nw_connection_create failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v27);
        if (!v24)
          goto LABEL_31;
        goto LABEL_30;
      }
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
        _os_log_impl(&dword_182FBE000, v25, v28, "%{public}s nw_connection_create failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v25 = (id)gLogObj;
      v30 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
        _os_log_impl(&dword_182FBE000, v25, v30, "%{public}s nw_connection_create failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
  if (v24)
LABEL_30:
    free(v24);
LABEL_31:
  v22 = 0;
LABEL_32:

LABEL_33:
  return v22;
}

- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  return -[NWTCPConnection initWithEndpoint:parameters:delegate:](self, "initWithEndpoint:parameters:delegate:", a3, a4, 0);
}

- (NWTCPConnection)initWithUpgradeForConnection:(NWTCPConnection *)connection
{
  NWTCPConnection *v4;
  NWTCPConnection *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NWTCPConnection *v13;
  NWTCPConnection *v14;
  NSObject *v15;
  uint64_t v16;
  NWEndpoint *endpoint;
  uint64_t v18;
  NWParameters *parameters;
  void *v20;
  NWTCPConnection *v21;
  id v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  char *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  const char *v44;
  char *backtrace_string;
  _BOOL4 v46;
  const char *v47;
  _BOOL4 v48;
  _BOOL4 v49;
  char *v50;
  _BOOL4 v51;
  objc_super v52;
  char v53;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = connection;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (!__nwlog_fault(v34, &type, &v53))
      goto LABEL_80;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      if (!os_log_type_enabled(v35, type))
        goto LABEL_79;
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      v37 = "%{public}s called with null connection";
LABEL_78:
      _os_log_impl(&dword_182FBE000, v35, v36, v37, buf, 0xCu);
      goto LABEL_79;
    }
    if (!v53)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection, backtrace limit exceeded";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = type;
    v46 = os_log_type_enabled(v35, type);
    if (!backtrace_string)
    {
      if (v46)
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection, no backtrace";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (!v46)
      goto LABEL_60;
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    v57 = 2082;
    v58 = backtrace_string;
    v47 = "%{public}s called with null connection, dumping backtrace:%{public}s";
LABEL_59:
    _os_log_impl(&dword_182FBE000, v35, v36, v47, buf, 0x16u);
LABEL_60:

    free(backtrace_string);
    goto LABEL_80;
  }
  -[NWTCPConnection endpoint](v4, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    __nwlog_obj();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (!__nwlog_fault(v34, &type, &v53))
      goto LABEL_80;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      if (!os_log_type_enabled(v35, type))
        goto LABEL_79;
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      v37 = "%{public}s called with null connection.endpoint";
      goto LABEL_78;
    }
    if (!v53)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.endpoint, backtrace limit exceeded";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = type;
    v48 = os_log_type_enabled(v35, type);
    if (!backtrace_string)
    {
      if (v48)
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.endpoint, no backtrace";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (!v48)
      goto LABEL_60;
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    v57 = 2082;
    v58 = backtrace_string;
    v47 = "%{public}s called with null connection.endpoint, dumping backtrace:%{public}s";
    goto LABEL_59;
  }
  -[NWTCPConnection parameters](v5, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NWTCPConnection endpoint](v5, "endpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internalEndpoint");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NWTCPConnection parameters](v5, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "internalParameters");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = nw_connection_create(v9, v11);

    if (v12)
    {
      v52.receiver = self;
      v52.super_class = (Class)NWTCPConnection;
      v13 = -[NWTCPConnection init](&v52, sel_init);
      if (v13)
      {
        v14 = v13;
        if (NWCopyInternalQueue_init_once != -1)
          dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
        v15 = (id)NWCopyInternalQueue_nwQueue;
        nw_connection_set_queue(v12, v15);

        -[NWTCPConnection endpoint](v5, "endpoint");
        v16 = objc_claimAutoreleasedReturnValue();
        endpoint = v14->_endpoint;
        v14->_endpoint = (NWEndpoint *)v16;

        -[NWTCPConnection parameters](v5, "parameters");
        v18 = objc_claimAutoreleasedReturnValue();
        parameters = v14->_parameters;
        v14->_parameters = (NWParameters *)v18;

        -[NWTCPConnection delegate](v5, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&v14->_delegate, v20);

        objc_storeStrong((id *)&v14->_internalConnection, v12);
        v14->_state = 1;
        -[NWTCPConnection startInternal](v14, "startInternal");
        self = v14;
        v21 = self;
        goto LABEL_27;
      }
      __nwlog_obj();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      v41 = (char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v53 = 0;
      if (!__nwlog_fault(v41, &type, &v53))
        goto LABEL_89;
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          v44 = "%{public}s [super init] failed";
LABEL_87:
          _os_log_impl(&dword_182FBE000, v42, v43, v44, buf, 0xCu);
        }
      }
      else if (v53)
      {
        v50 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = type;
        v51 = os_log_type_enabled(v42, type);
        if (v50)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
            v57 = 2082;
            v58 = v50;
            _os_log_impl(&dword_182FBE000, v42, v43, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v50);
          goto LABEL_89;
        }
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          v44 = "%{public}s [super init] failed, no backtrace";
          goto LABEL_87;
        }
      }
      else
      {
        __nwlog_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          v44 = "%{public}s [super init] failed, backtrace limit exceeded";
          goto LABEL_87;
        }
      }

LABEL_89:
      if (v41)
        free(v41);
      self = 0;
      goto LABEL_26;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v22 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    v23 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (__nwlog_fault((const char *)v23, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v24 = (id)gLogObj;
        v25 = type;
        if (!os_log_type_enabled(v24, type))
          goto LABEL_24;
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v26 = "%{public}s nw_connection_create failed";
LABEL_22:
        v30 = v24;
        v31 = v25;
        goto LABEL_23;
      }
      if (!v53)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v24 = (id)gLogObj;
        v25 = type;
        if (!os_log_type_enabled(v24, type))
          goto LABEL_24;
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v26 = "%{public}s nw_connection_create failed, backtrace limit exceeded";
        goto LABEL_22;
      }
      v27 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v24 = (id)gLogObj;
      v28 = type;
      v29 = os_log_type_enabled(v24, type);
      if (!v27)
      {
        if (!v29)
        {
LABEL_24:

          if (!v23)
          {
LABEL_26:
            v21 = 0;
LABEL_27:

            goto LABEL_28;
          }
LABEL_25:
          free(v23);
          goto LABEL_26;
        }
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v26 = "%{public}s nw_connection_create failed, no backtrace";
        v30 = v24;
        v31 = v28;
LABEL_23:
        _os_log_impl(&dword_182FBE000, v30, v31, v26, buf, 0xCu);
        goto LABEL_24;
      }
      if (v29)
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v57 = 2082;
        v58 = v27;
        _os_log_impl(&dword_182FBE000, v24, v28, "%{public}s nw_connection_create failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v27);
    }
    if (!v23)
      goto LABEL_26;
    goto LABEL_25;
  }
  __nwlog_obj();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
  v34 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v53 = 0;
  if (__nwlog_fault(v34, &type, &v53))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.parameters";
        goto LABEL_78;
      }
LABEL_79:

      goto LABEL_80;
    }
    if (!v53)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.parameters, backtrace limit exceeded";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = type;
    v49 = os_log_type_enabled(v35, type);
    if (!backtrace_string)
    {
      if (v49)
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.parameters, no backtrace";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (!v49)
      goto LABEL_60;
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    v57 = 2082;
    v58 = backtrace_string;
    v47 = "%{public}s called with null connection.parameters, dumping backtrace:%{public}s";
    goto LABEL_59;
  }
LABEL_80:
  if (v34)
    free(v34);
  v21 = 0;
LABEL_28:

  return v21;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_connection_cancel(v4);

    -[NWTCPConnection setInternalConnection:](self, "setInternalConnection:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)NWTCPConnection;
  -[NWTCPConnection dealloc](&v5, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendString:", CFSTR("{"));
  -[NWTCPConnection parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("parameters"), v5, v4);

  -[NWTCPConnection endpoint](self, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("endpoint"), v5, v4);

  objc_msgSend(v7, "appendString:", CFSTR("\n}"));
  return v7;
}

- (id)description
{
  return -[NWTCPConnection descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSString)privateDescription
{
  return (NSString *)-[NWTCPConnection descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (NWPath)connectedPath
{
  NWPath *v3;
  void *v4;
  id v5;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v3 = (NWPath *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = nw_connection_copy_connected_path(v4);

    if (v5)
      v3 = -[NWPath initWithPath:]([NWPath alloc], "initWithPath:", v5);
    else
      v3 = 0;

  }
  return v3;
}

- (NWEndpoint)localAddress
{
  void *v3;
  void *v4;
  id v5;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = nw_connection_copy_connected_local_endpoint(v4);

    if (v5)
    {
      +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return (NWEndpoint *)v3;
}

- (NWEndpoint)remoteAddress
{
  void *v3;
  void *v4;
  id v5;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = nw_connection_copy_connected_remote_endpoint(v4);

    if (v5)
    {
      +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return (NWEndpoint *)v3;
}

- (NSData)txtRecord
{
  void *v3;
  void *v4;
  id v5;
  id *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = nw_connection_copy_host_endpoint(v4);

    if (v5)
    {
      v6 = (id *)v5;
      v7 = v6[23];

      if (!v7 || ((v8 = v7[1], v9 = v7[2], v8) ? (v10 = v9 == 0) : (v10 = 1), v10))
        v11 = 0;
      else
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8, v9);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return (NSData *)v11;
}

- (void)cancel
{
  void *v3;
  NSObject *v4;

  if (-[NWTCPConnection state](self, "state") != NWTCPConnectionStateCancelled)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[NWTCPConnection internalConnection](self, "internalConnection");
      v4 = objc_claimAutoreleasedReturnValue();
      nw_connection_cancel(v4);

    }
  }
}

- (void)readLength:(NSUInteger)length completionHandler:(void *)completion
{
  -[NWTCPConnection readMinimumLength:maximumLength:completionHandler:](self, "readMinimumLength:maximumLength:completionHandler:", length, length, completion);
}

- (void)readMinimumLength:(NSUInteger)minimum maximumLength:(NSUInteger)maximum completionHandler:(void *)completion
{
  unsigned int v5;
  unsigned int v6;
  void *v8;
  void *v9;
  NSObject *v10;
  id *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  void *v15;
  _QWORD v16[4];
  void *v17;

  v5 = maximum;
  v6 = minimum;
  v8 = completion;
  -[NWTCPConnection internalConnection](self, "internalConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke;
    v16[3] = &unk_1E14A93A0;
    v11 = &v17;
    v17 = v8;
    v12 = v8;
    nw_connection_receive_internal(v10, 0, v6, v5, v16);
  }
  else
  {
    if (NWCopyInternalQueue_init_once != -1)
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
    v10 = (id)NWCopyInternalQueue_nwQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke_2;
    v14[3] = &unk_1E14AC390;
    v11 = &v15;
    v15 = v8;
    v13 = v8;
    dispatch_async(v10, v14);
  }

}

- (void)write:(NSData *)data completionHandler:(void *)completion
{
  NSData *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  void *v14;
  _QWORD completiona[4];
  id v16;

  v6 = data;
  v7 = completion;
  -[NWTCPConnection internalConnection](self, "internalConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
      v9 = -[NSData _createDispatchData](v6, "_createDispatchData");
    else
      v9 = 0;
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    completiona[0] = MEMORY[0x1E0C809B0];
    completiona[1] = 3221225472;
    completiona[2] = __43__NWTCPConnection_write_completionHandler___block_invoke;
    completiona[3] = &unk_1E14A93C8;
    v16 = v7;
    v11 = v7;
    nw_connection_send(v12, v9, (nw_content_context_t)&__block_literal_global_41718, 1, completiona);

  }
  else
  {
    if (NWCopyInternalQueue_init_once != -1)
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
    v10 = (id)NWCopyInternalQueue_nwQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__NWTCPConnection_write_completionHandler___block_invoke_2;
    v13[3] = &unk_1E14AC390;
    v14 = v7;
    v9 = v7;
    dispatch_async(v10, v13);

    v11 = v14;
  }

}

- (void)writeClose
{
  void *v3;
  NSObject *v4;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_connection_send(v4, 0, (nw_content_context_t)&__block_literal_global_3_41726, 1, &__block_literal_global_24144);

  }
}

- (void)handlePeerCertificateTrustEvaluationWithMetadata:(id)a3 trust:(id)a4 completionHandler:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  char *backtrace_string;
  os_log_type_t v23;
  _BOOL4 v24;
  os_log_type_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD handler[4];
  id v30;
  id location;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_initWeak(&location, self);
    -[NWTCPConnection delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke;
    handler[3] = &unk_1E149A540;
    v14 = v12;
    v30 = v14;
    sec_protocol_metadata_access_peer_certificate_chain(v8, handler);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 136446466;
        v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        v35 = 2048;
        v36 = v17;
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}s Evaluating trust for peer cert chain of length %lu", buf, 0x16u);
      }

      v26[0] = v13;
      v26[1] = 3221225472;
      v26[2] = __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke_28;
      v26[3] = &unk_1E149A568;
      objc_copyWeak(&v28, &location);
      v27 = v10;
      objc_msgSend(v11, "evaluateTrustForConnection:peerCertificateChain:completionHandler:", self, v14, v26);

      objc_destroyWeak(&v28);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        v35 = 2048;
        v36 = 0;
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s Can't create certificate chain %p for trust evaluation", buf, 0x16u);
      }

    }
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  __nwlog_obj();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
  v19 = (char *)_os_log_send_and_compose_impl();

  LOBYTE(location) = 16;
  v32 = 0;
  if (__nwlog_fault(v19, &location, &v32))
  {
    if (location == 17)
    {
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = location;
      if (os_log_type_enabled(v20, (os_log_type_t)location))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s called with null metadata", buf, 0xCu);
      }
    }
    else if (v32)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v23 = location;
      v24 = os_log_type_enabled(v20, (os_log_type_t)location);
      if (backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
          v35 = 2082;
          v36 = (uint64_t)backtrace_string;
          _os_log_impl(&dword_182FBE000, v20, v23, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_27;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl(&dword_182FBE000, v20, v23, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = location;
      if (os_log_type_enabled(v20, (os_log_type_t)location))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl(&dword_182FBE000, v20, v25, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_27:
  if (v19)
    free(v19);
LABEL_10:

}

- (void)handleIdentityRequestWithMetadata:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NWTCPConnection delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v9 = (id)gLogObj;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[NWTCPConnection handleIdentityRequestWithMetadata:completionHandler:]";
    _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_DEBUG, "%{public}s Peer asked for identity, asking delegate to provide identity", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__NWTCPConnection_handleIdentityRequestWithMetadata_completionHandler___block_invoke;
  v11[3] = &unk_1E149A590;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v7;
  v12 = v10;
  objc_msgSend(v8, "provideIdentityForConnection:completionHandler:", self, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (void)setupEventHandler
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD handler[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  -[NWTCPConnection internalConnection](self, "internalConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __36__NWTCPConnection_setupEventHandler__block_invoke;
  handler[3] = &unk_1E14AC888;
  objc_copyWeak(&v12, &location);
  nw_connection_set_state_changed_handler(v3, handler);

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __36__NWTCPConnection_setupEventHandler__block_invoke_32;
  v9[3] = &unk_1E149C288;
  objc_copyWeak(&v10, &location);
  nw_connection_set_viability_changed_handler(v5, v9);

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __36__NWTCPConnection_setupEventHandler__block_invoke_34;
  v7[3] = &unk_1E149C288;
  objc_copyWeak(&v8, &location);
  nw_connection_set_better_path_available_handler(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)startInternal
{
  void *v3;
  int v4;
  NSObject *v5;
  nw_parameters_t v6;
  void *v7;
  unsigned __int8 *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD challenge_block[4];
  id v16;
  _QWORD verify_block[4];
  id v18;
  id location;

  objc_initWeak(&location, self);
  -[NWTCPConnection setupEventHandler](self, "setupEventHandler");
  -[NWTCPConnection parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableTLS");

  if (v4)
  {
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = nw_connection_copy_parameters(v5);

    v7 = (void *)nw_protocol_boringssl_copy_definition();
    v8 = nw_parameters_copy_protocol_options_for_definition(v6, v7);

    v9 = v8;
    -[NWTCPConnection delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ((objc_opt_respondsToSelector() & 1) == 0
       || objc_msgSend(v10, "shouldEvaluateTrustForConnection:", self)))
    {
      verify_block[0] = MEMORY[0x1E0C809B0];
      verify_block[1] = 3221225472;
      verify_block[2] = __32__NWTCPConnection_startInternal__block_invoke;
      verify_block[3] = &unk_1E149A5B8;
      objc_copyWeak(&v18, &location);
      if (NWCopyInternalQueue_init_once != -1)
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
      v11 = (id)NWCopyInternalQueue_nwQueue;
      sec_protocol_options_set_verify_block(v9, verify_block, v11);

      objc_destroyWeak(&v18);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ((objc_opt_respondsToSelector() & 1) == 0
       || objc_msgSend(v10, "shouldProvideIdentityForConnection:", self)))
    {
      challenge_block[0] = MEMORY[0x1E0C809B0];
      challenge_block[1] = 3221225472;
      challenge_block[2] = __32__NWTCPConnection_startInternal__block_invoke_44;
      challenge_block[3] = &unk_1E149A5E0;
      objc_copyWeak(&v16, &location);
      if (NWCopyInternalQueue_init_once != -1)
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
      v12 = (id)NWCopyInternalQueue_nwQueue;
      sec_protocol_options_set_challenge_block(v9, challenge_block, v12);

      objc_destroyWeak(&v16);
    }

  }
  -[NWTCPConnection internalConnection](self, "internalConnection");
  v13 = objc_claimAutoreleasedReturnValue();
  nw_connection_start(v13);

  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)fillOutTCPConnectionInfo:(tcp_connection_info *)a3
{
  tcp_connection_info *v3;
  void *v4;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  char *backtrace_string;
  _BOOL4 v12;
  char v13;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    -[NWTCPConnection internalConnection](self, "internalConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = nw_connection_fillout_tcp_connection_info(v4, (uint64_t)v3);

    return (char)v3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        v10 = "%{public}s called with null tcp_conn_info";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v8, v9, v10, buf, 0xCu);
      }
    }
    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = type;
        v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
            v17 = 2082;
            v18 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s called with null tcp_conn_info, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v12)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        v10 = "%{public}s called with null tcp_conn_info, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        v10 = "%{public}s called with null tcp_conn_info, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v7)
    free(v7);
  return 0;
}

- (BOOL)TFOSucceeded
{
  void *v2;
  BOOL v3;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_used_tfo(v2);

  return v3;
}

- (BOOL)isMultipath
{
  void *v2;
  BOOL v3;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_uses_multipath(v2);

  return v3;
}

- (unint64_t)multipathSubflowCount
{
  void *v2;
  unint64_t subflow_count;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  subflow_count = nw_connection_multipath_get_subflow_count(v2);

  return subflow_count;
}

- (unint64_t)multipathConnectedSubflowCount
{
  void *v2;
  unint64_t subflow_count;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  subflow_count = nw_connection_multipath_get_subflow_count(v2);

  return subflow_count;
}

- (int)multipathPrimarySubflowInterfaceIndex
{
  void *v2;
  id v3;
  NWConcrete_nw_path *v4;
  int routed_interface_index;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NWTCPConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_copy_connected_path(v2);

  if (v3)
  {
    v4 = (NWConcrete_nw_path *)v3;
    if (nw_path_network_is_satisfied_update_reason(v4, 0))
      routed_interface_index = v4->policy_result.routed_interface_index;
    else
      routed_interface_index = 0;

  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446210;
      v9 = "-[NWTCPConnection multipathPrimarySubflowInterfaceIndex]";
      _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_ERROR, "%{public}s No connected path", (uint8_t *)&v8, 0xCu);
    }

    routed_interface_index = 0;
  }

  return routed_interface_index;
}

- (NSDictionary)multipathSubflowSwitchCounts
{
  void *v2;
  id v3;
  id v4;
  id v5;
  _QWORD applier[4];
  id v8;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_multipath_copy_subflow_counts(v2);

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __47__NWTCPConnection_multipathSubflowSwitchCounts__block_invoke;
    applier[3] = &unk_1E14A8E38;
    v5 = v4;
    v8 = v5;
    xpc_dictionary_apply(v3, applier);

  }
  else
  {
    v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (NSDictionary)TCPInfo
{
  void *v2;
  id v3;
  void *v4;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_copy_tcp_info(v2);

  if (v3)
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (NSData)metadata
{
  void *v2;
  id v3;
  id v4;
  const void *bytes_ptr;
  void *v6;

  -[NWTCPConnection internalConnection](self, "internalConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_connection_copy_metadata(v2);

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v3);
    v6 = (void *)objc_msgSend(v4, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v3));
  }
  else
  {
    v6 = 0;
  }

  return (NSData *)v6;
}

- (NWTCPConnectionState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isViable
{
  return self->_viable;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)hasBetterPath
{
  return self->_hasBetterPath;
}

- (void)setHasBetterPath:(BOOL)a3
{
  self->_hasBetterPath = a3;
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (NSError)internalError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_nw_connection)internalConnection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NWTCPConnectionAuthenticationDelegate)delegate
{
  return (NWTCPConnectionAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NWParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalConnection, 0);
  objc_storeStrong((id *)&self->_internalError, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

uint64_t __47__NWTCPConnection_multipathSubflowSwitchCounts__block_invoke(uint64_t a1, uint64_t a2, xpc_object_t xuint)
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_uint64_get_value(xuint));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  return 1;
}

void __32__NWTCPConnection_startInternal__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:", v7, v8, v9);
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446210;
      v14 = "-[NWTCPConnection startInternal]_block_invoke";
      _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v13, 0xCu);
    }

  }
}

void __32__NWTCPConnection_startInternal__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handleIdentityRequestWithMetadata:completionHandler:", v5, v6);
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446210;
      v11 = "-[NWTCPConnection startInternal]_block_invoke";
      _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v10, 0xCu);
    }

  }
}

void __36__NWTCPConnection_setupEventHandler__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  id WeakRetained;
  CFErrorRef v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = nw_error_copy_cf_error(v5);
      objc_msgSend(WeakRetained, "setInternalError:", v7);

    }
    v8 = objc_msgSend(WeakRetained, "state");
    if (a2 > 5)
      v9 = v8;
    else
      v9 = qword_183BA8B68[a2];
    if (objc_msgSend(WeakRetained, "state") != v9)
    {
      objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("state"));
      objc_msgSend(WeakRetained, "setState:", v9);
      objc_msgSend(WeakRetained, "didChangeValueForKey:", CFSTR("state"));
    }
    if (v9 == 5)
      objc_msgSend(WeakRetained, "setInternalConnection:", 0);
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446210;
      v12 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v11, 0xCu);
    }

  }
}

void __36__NWTCPConnection_setupEventHandler__block_invoke_32(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isViable") != (_DWORD)a2)
    {
      objc_msgSend(v4, "willChangeValueForKey:", CFSTR("viable"));
      objc_msgSend(v4, "setViable:", a2);
      objc_msgSend(v4, "didChangeValueForKey:", CFSTR("viable"));
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446210;
      v7 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __36__NWTCPConnection_setupEventHandler__block_invoke_34(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "hasBetterPath") != (_DWORD)a2)
    {
      objc_msgSend(v4, "willChangeValueForKey:", CFSTR("hasBetterPath"));
      objc_msgSend(v4, "setHasBetterPath:", a2);
      objc_msgSend(v4, "didChangeValueForKey:", CFSTR("hasBetterPath"));
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446210;
      v7 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __71__NWTCPConnection_handleIdentityRequestWithMetadata_completionHandler___block_invoke(uint64_t a1, __SecIdentity *a2, void *a3)
{
  const __CFArray *v5;
  id WeakRetained;
  sec_identity_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = sec_identity_create_with_certificates(a2, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v8 = (id)gLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446210;
      v10 = "-[NWTCPConnection handleIdentityRequestWithMetadata:completionHandler:]_block_invoke";
      _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v9, 0xCu);
    }

  }
}

void __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke(uint64_t a1, sec_certificate_t certificate)
{
  SecCertificateRef v3;

  v3 = sec_certificate_copy_ref(certificate);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke_28(uint64_t a1, __SecTrust *a2)
{
  id WeakRetained;
  NSObject *v5;
  _BYTE cf[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(_QWORD *)cf = 0;
    SecTrustEvaluateWithError(a2, (CFErrorRef *)cf);
    if (*(_QWORD *)cf)
    {
      CFRelease(*(CFTypeRef *)cf);
      *(_QWORD *)cf = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cf = 136446210;
      *(_QWORD *)&cf[4] = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]_block_invoke";
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", cf, 0xCu);
    }

  }
}

void __43__NWTCPConnection_write_completionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  nw_error_t v3;

  if (error)
    error = (nw_error_t)nw_error_copy_cf_error(error);
  v3 = error;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __43__NWTCPConnection_write_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = nw_error_copy_cf_error(v10);
    if (v16)
      goto LABEL_8;
  }
  else
  {
    v12 = 0;
    if (v16)
      goto LABEL_8;
  }
  if (a4 && !v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = *(_QWORD *)(a1 + 32);
LABEL_9:
    v15 = v13;
    goto LABEL_10;
  }
LABEL_8:
  v14 = *(_QWORD *)(a1 + 32);
  v13 = v16;
  if (v16)
    goto LABEL_9;
LABEL_10:

  (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v16, v12);
}

void __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

@end
