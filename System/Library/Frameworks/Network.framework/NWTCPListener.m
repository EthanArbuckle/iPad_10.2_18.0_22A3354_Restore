@implementation NWTCPListener

- (void)handleNewConnection:(id)a3
{
  id v4;
  void *v5;
  NWTCPConnection *v6;

  v4 = a3;
  v6 = -[NWTCPConnection initWithAcceptedInternalConnection:]([NWTCPConnection alloc], "initWithAcceptedInternalConnection:", v4);

  -[NWTCPListener delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleConnection:", v6);

}

- (void)handleError:(id)a3
{
  CFErrorRef v4;

  v4 = nw_error_copy_cf_error((nw_error_t)a3);
  -[NWTCPListener setError:](self, "setError:", v4);

}

- (void)startInternal
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD handler[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  -[NWTCPListener internalListener](self, "internalListener");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __30__NWTCPListener_startInternal__block_invoke;
  handler[3] = &unk_1E14AC860;
  objc_copyWeak(&v12, &location);
  nw_listener_set_new_connection_handler(v3, handler);

  -[NWTCPListener internalListener](self, "internalListener");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __30__NWTCPListener_startInternal__block_invoke_2;
  v9[3] = &unk_1E14AC888;
  objc_copyWeak(&v10, &location);
  nw_listener_set_state_changed_handler(v5, v9);

  -[NWTCPListener internalListener](self, "internalListener");
  v6 = objc_claimAutoreleasedReturnValue();
  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v7 = (id)NWCopyInternalQueue_nwQueue;
  nw_listener_set_queue(v6, v7);

  -[NWTCPListener internalListener](self, "internalListener");
  v8 = objc_claimAutoreleasedReturnValue();
  nw_listener_start(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4 launchdKey:(id)a5 bonjourEndpoint:(id)a6
{
  id v10;
  id v11;
  NWTCPListener *v12;
  NSObject *secure_tcp;
  NSObject *v14;
  nw_protocol_options_t v15;
  _BOOL4 v16;
  NWConcrete_nw_protocol_options *options;
  void *v18;
  nw_listener_t v19;
  id v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *bonjour_service;
  NSObject *v34;
  NWParameters *v35;
  NWParameters *parameters;
  NSError *error;
  NWEndpoint *localEndpoint;
  NWTCPListener *v39;
  id v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  os_log_type_t v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  os_log_type_t v49;
  void *v51;
  char *v52;
  NSObject *v53;
  os_log_type_t v54;
  void *v55;
  char *v56;
  NSObject *v57;
  os_log_type_t v58;
  char *backtrace_string;
  NSObject *v60;
  os_log_type_t v61;
  _BOOL4 v62;
  char *v63;
  NSObject *v64;
  os_log_type_t v65;
  _BOOL4 v66;
  os_log_type_t v67;
  os_log_type_t v68;
  id v69;
  id v70;
  objc_super v71;
  char v72;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  char *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v10 = a4;
  v70 = a5;
  v11 = a6;
  if (!v10)
  {
    __nwlog_obj();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
    v52 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v72 = 0;
    if (__nwlog_fault(v52, &type, &v72))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = type;
        if (os_log_type_enabled(v53, type))
        {
          *(_DWORD *)buf = 136446210;
          v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
          _os_log_impl(&dword_182FBE000, v53, v54, "%{public}s called with null delegate", buf, 0xCu);
        }
      }
      else
      {
        if (v72)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = type;
          v62 = os_log_type_enabled(v60, type);
          if (backtrace_string)
          {
            if (v62)
            {
              *(_DWORD *)buf = 136446466;
              v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
              v76 = 2082;
              v77 = backtrace_string;
              _os_log_impl(&dword_182FBE000, v60, v61, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(backtrace_string);
          }
          else
          {
            if (v62)
            {
              *(_DWORD *)buf = 136446210;
              v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
              _os_log_impl(&dword_182FBE000, v60, v61, "%{public}s called with null delegate, no backtrace", buf, 0xCu);
            }

          }
          goto LABEL_86;
        }
        __nwlog_obj();
        v53 = objc_claimAutoreleasedReturnValue();
        v67 = type;
        if (os_log_type_enabled(v53, type))
        {
          *(_DWORD *)buf = 136446210;
          v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
          _os_log_impl(&dword_182FBE000, v53, v67, "%{public}s called with null delegate, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_86:
    if (v52)
      free(v52);
    goto LABEL_47;
  }
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EDD0AD38) & 1) != 0)
  {
    v71.receiver = self;
    v71.super_class = (Class)NWTCPListener;
    v12 = -[NWTCPListener init](&v71, sel_init);
    if (v12)
    {
      if (v69)
      {
        secure_tcp = objc_msgSend(v69, "copyCParameters");
        v14 = nw_parameters_copy_default_protocol_stack(secure_tcp);
        v15 = nw_protocol_stack_copy_transport_protocol(v14);
        v16 = v15 == 0;

        if (v16)
        {
          if (nw_protocol_setup_tcp_definition(void)::onceToken != -1)
            dispatch_once(&nw_protocol_setup_tcp_definition(void)::onceToken, &__block_literal_global_62963);
          options = nw_protocol_create_options((void *)g_tcp_definition);
          nw_protocol_stack_set_transport_protocol(v14, &options->super);

        }
        v18 = v70;
        if (v70)
          goto LABEL_10;
      }
      else
      {
        secure_tcp = nw_parameters_create_secure_tcp(&__block_literal_global_18950, &__block_literal_global_86);
        v18 = v70;
        if (v70)
        {
LABEL_10:
          v19 = (nw_listener_t)nw_listener_create_with_launchd_key(secure_tcp, (const char *)objc_msgSend(v18, "UTF8String"));
          goto LABEL_24;
        }
      }
      v19 = nw_listener_create(secure_tcp);
LABEL_24:
      v28 = v19;
      -[NWTCPListener setInternalListener:](v12, "setInternalListener:", v19);

      -[NWTCPListener internalListener](v12, "internalListener");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = v29 == 0;

      if (!(_DWORD)v28)
      {
        if (v11)
        {
          objc_msgSend(v11, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "type");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "domain");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          bonjour_service = nw_advertise_descriptor_create_bonjour_service((const char *)objc_msgSend(v30, "UTF8String"), (const char *)objc_msgSend(v31, "UTF8String"), (const char *)objc_msgSend(v32, "UTF8String"));
          -[NWTCPListener internalListener](v12, "internalListener");
          v34 = objc_claimAutoreleasedReturnValue();
          nw_listener_set_advertise_descriptor(v34, bonjour_service);

        }
        v35 = -[NWParameters initWithParameters:]([NWParameters alloc], "initWithParameters:", secure_tcp);
        parameters = v12->_parameters;
        v12->_parameters = v35;

        objc_storeWeak((id *)&v12->_delegate, v10);
        error = v12->_error;
        v12->_error = 0;

        localEndpoint = v12->_localEndpoint;
        v12->_localEndpoint = 0;

        objc_storeStrong((id *)&v12->_launchdKey, a5);
        -[NWTCPListener startInternal](v12, "startInternal");
        v39 = v12;
        goto LABEL_58;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v40 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
      v41 = (char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v72 = 0;
      if (__nwlog_fault(v41, &type, &v72))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v42 = (id)gLogObj;
          v43 = type;
          if (os_log_type_enabled(v42, type))
          {
            *(_DWORD *)buf = 136446210;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            _os_log_impl(&dword_182FBE000, v42, v43, "%{public}s nw_listener_create failed", buf, 0xCu);
          }
LABEL_32:

          goto LABEL_55;
        }
        if (!v72)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v42 = (id)gLogObj;
          v49 = type;
          if (os_log_type_enabled(v42, type))
          {
            *(_DWORD *)buf = 136446210;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            _os_log_impl(&dword_182FBE000, v42, v49, "%{public}s nw_listener_create failed, backtrace limit exceeded", buf, 0xCu);
          }
          goto LABEL_32;
        }
        v45 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v46 = (id)gLogObj;
        v47 = type;
        v48 = os_log_type_enabled(v46, type);
        if (v45)
        {
          if (v48)
          {
            *(_DWORD *)buf = 136446466;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            v76 = 2082;
            v77 = v45;
            _os_log_impl(&dword_182FBE000, v46, v47, "%{public}s nw_listener_create failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v45);
          if (!v41)
            goto LABEL_57;
          goto LABEL_56;
        }
        if (v48)
        {
          *(_DWORD *)buf = 136446210;
          v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
          _os_log_impl(&dword_182FBE000, v46, v47, "%{public}s nw_listener_create failed, no backtrace", buf, 0xCu);
        }

      }
LABEL_55:
      if (!v41)
      {
LABEL_57:
        v39 = 0;
LABEL_58:

        goto LABEL_59;
      }
LABEL_56:
      free(v41);
      goto LABEL_57;
    }
    __nwlog_obj();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
    v56 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v72 = 0;
    if (!__nwlog_fault(v56, &type, &v72))
      goto LABEL_95;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = type;
      if (os_log_type_enabled(v57, type))
      {
        *(_DWORD *)buf = 136446210;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        _os_log_impl(&dword_182FBE000, v57, v58, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else
    {
      if (v72)
      {
        v63 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = type;
        v66 = os_log_type_enabled(v64, type);
        if (v63)
        {
          if (v66)
          {
            *(_DWORD *)buf = 136446466;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            v76 = 2082;
            v77 = v63;
            _os_log_impl(&dword_182FBE000, v64, v65, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v63);
        }
        else
        {
          if (v66)
          {
            *(_DWORD *)buf = 136446210;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            _os_log_impl(&dword_182FBE000, v64, v65, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
          }

        }
        goto LABEL_95;
      }
      __nwlog_obj();
      v57 = objc_claimAutoreleasedReturnValue();
      v68 = type;
      if (os_log_type_enabled(v57, type))
      {
        *(_DWORD *)buf = 136446210;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        _os_log_impl(&dword_182FBE000, v57, v68, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

LABEL_95:
    if (v56)
      free(v56);
    goto LABEL_48;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v20 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
  v21 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v72 = 0;
  if (__nwlog_fault(v21, &type, &v72))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v22 = (id)gLogObj;
      v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s Delegate does not conform to NWTCPListenerDelegate protocol", buf, 0xCu);
      }
LABEL_15:

      goto LABEL_45;
    }
    if (!v72)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v22 = (id)gLogObj;
      v44 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        _os_log_impl(&dword_182FBE000, v22, v44, "%{public}s Delegate does not conform to NWTCPListenerDelegate protocol, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_15;
    }
    v24 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    v26 = type;
    v27 = os_log_type_enabled(v25, type);
    if (v24)
    {
      if (v27)
      {
        *(_DWORD *)buf = 136446466;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        v76 = 2082;
        v77 = v24;
        _os_log_impl(&dword_182FBE000, v25, v26, "%{public}s Delegate does not conform to NWTCPListenerDelegate protocol, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v24);
      if (!v21)
        goto LABEL_47;
      goto LABEL_46;
    }
    if (v27)
    {
      *(_DWORD *)buf = 136446210;
      v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
      _os_log_impl(&dword_182FBE000, v25, v26, "%{public}s Delegate does not conform to NWTCPListenerDelegate protocol, no backtrace", buf, 0xCu);
    }

  }
LABEL_45:
  if (v21)
LABEL_46:
    free(v21);
LABEL_47:

LABEL_48:
  v39 = 0;
LABEL_59:

  return v39;
}

- (NWTCPListener)initWithLaunchdKey:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  id v9;
  NWTCPListener *v10;
  void *v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  char *backtrace_string;
  _BOOL4 v18;
  char v19;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a3)
  {
    self = -[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:](self, "initWithParameters:delegate:launchdKey:bonjourEndpoint:", a4, a5, v9, 0);
    v10 = self;
    goto LABEL_3;
  }
  __nwlog_obj();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
  v13 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v19 = 0;
  if (__nwlog_fault(v13, &type, &v19))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        v16 = "%{public}s called with null launchdKey";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v14, v15, v16, buf, 0xCu);
      }
    }
    else
    {
      if (v19)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = type;
        v18 = os_log_type_enabled(v14, type);
        if (backtrace_string)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
            v23 = 2082;
            v24 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s called with null launchdKey, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v18)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        v16 = "%{public}s called with null launchdKey, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        v16 = "%{public}s called with null launchdKey, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v13)
    free(v13);
  v10 = 0;
LABEL_3:

  return v10;
}

- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4
{
  return -[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:](self, "initWithParameters:delegate:launchdKey:bonjourEndpoint:", a3, a4, 0, 0);
}

- (NWTCPListener)initWithBonjourServiceEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  NWTCPListener *v5;
  NWTCPListener *v6;
  void *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  char *backtrace_string;
  _BOOL4 v14;
  char v15;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v5 = self;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = -[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:](self, "initWithParameters:delegate:launchdKey:bonjourEndpoint:", a4, a5, 0, a3);
    v6 = v5;
    goto LABEL_3;
  }
  __nwlog_obj();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
  v9 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v15 = 0;
  if (__nwlog_fault(v9, &type, &v15))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        v12 = "%{public}s called with null bonjourServiceEndpoint";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v10, v11, v12, buf, 0xCu);
      }
    }
    else
    {
      if (v15)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = type;
        v14 = os_log_type_enabled(v10, type);
        if (backtrace_string)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136446466;
            v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
            v19 = 2082;
            v20 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s called with null bonjourServiceEndpoint, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v14)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        v12 = "%{public}s called with null bonjourServiceEndpoint, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        v12 = "%{public}s called with null bonjourServiceEndpoint, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v9)
    free(v9);
  v6 = 0;
LABEL_3:

  return v6;
}

- (void)cancel
{
  void *v3;
  NSObject *v4;

  -[NWTCPListener internalListener](self, "internalListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPListener internalListener](self, "internalListener");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_listener_cancel(v4);

    -[NWTCPListener setInternalListener:](self, "setInternalListener:", 0);
  }
}

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocalEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_nw_listener)internalListener
{
  return (OS_nw_listener *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternalListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 32, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)launchdKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLaunchdKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NWTCPListenerDelegate)delegate
{
  return (NWTCPListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_launchdKey, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_internalListener, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
}

void __30__NWTCPListener_startInternal__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleNewConnection:", v5);

}

void __30__NWTCPListener_startInternal__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  NSObject *v7;
  unsigned int port;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      objc_msgSend(WeakRetained, "internalListener");
      v7 = objc_claimAutoreleasedReturnValue();
      port = nw_listener_get_port(v7);

      if (port)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), port);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[NWAddressEndpoint endpointWithHostname:port:](NWAddressEndpoint, "endpointWithHostname:port:", CFSTR("0.0.0.0"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLocalEndpoint:", v10);

      }
    }
    if (v11)
      objc_msgSend(v6, "handleError:", v11);
  }

}

@end
