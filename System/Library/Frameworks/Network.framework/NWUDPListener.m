@implementation NWUDPListener

- (void)handleConnection:(id)a3
{
  id v4;
  void *v5;
  NWUDPSession *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NWUDPListener delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[NWUDPSession initWithConnection:]([NWUDPSession alloc], "initWithConnection:", v4);
    objc_msgSend(v5, "handleSession:", v6);
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (NWUDPSession *)(id)gLogObj;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446210;
      v8 = "-[NWUDPListener handleConnection:]";
      _os_log_impl(&dword_182FBE000, &v6->super, OS_LOG_TYPE_ERROR, "%{public}s UDP listener received connection, but delegate is nil", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)handleError:(id)a3
{
  CFErrorRef v4;

  if (a3)
  {
    v4 = nw_error_copy_cf_error((nw_error_t)a3);
    -[NWUDPListener setError:](self, "setError:", v4);

  }
  else
  {
    -[NWUDPListener setError:](self, "setError:");
  }
}

- (NWUDPListener)initWithParameters:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *options;
  void *v13;
  NSObject *v14;
  nw_listener_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NWUDPListener *v25;
  id v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  char *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  os_log_type_t v34;
  void *v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  void *v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  void *v43;
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  char *backtrace_string;
  os_log_type_t v48;
  _BOOL4 v49;
  char *v50;
  os_log_type_t v51;
  _BOOL4 v52;
  char *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  os_log_type_t v56;
  os_log_type_t v57;
  os_log_type_t v58;
  _QWORD v59[4];
  id v60;
  _QWORD handler[4];
  id v62;
  char v63;
  id location;
  objc_super v65;
  os_log_type_t v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  char *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v68 = "-[NWUDPListener initWithParameters:delegate:]";
    v36 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(location) = 16;
    v66 = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v36, &location, &v66))
    {
      if (location == 17)
      {
        __nwlog_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = location;
        if (os_log_type_enabled(v37, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v37, v38, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if (v66)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        v48 = location;
        v49 = os_log_type_enabled(v37, (os_log_type_t)location);
        if (backtrace_string)
        {
          if (v49)
          {
            *(_DWORD *)buf = 136446466;
            v68 = "-[NWUDPListener initWithParameters:delegate:]";
            v69 = 2082;
            v70 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v37, v48, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_72;
        }
        if (v49)
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v37, v48, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        v56 = location;
        if (os_log_type_enabled(v37, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v37, v56, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_72:
    if (v36)
      free(v36);
    goto LABEL_74;
  }
  if (!v7)
  {
    __nwlog_obj();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v68 = "-[NWUDPListener initWithParameters:delegate:]";
    v40 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(location) = 16;
    v66 = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v40, &location, &v66))
    {
      if (location == 17)
      {
        __nwlog_obj();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = location;
        if (os_log_type_enabled(v41, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v41, v42, "%{public}s called with null delegate", buf, 0xCu);
        }
      }
      else if (v66)
      {
        v50 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v41 = objc_claimAutoreleasedReturnValue();
        v51 = location;
        v52 = os_log_type_enabled(v41, (os_log_type_t)location);
        if (v50)
        {
          if (v52)
          {
            *(_DWORD *)buf = 136446466;
            v68 = "-[NWUDPListener initWithParameters:delegate:]";
            v69 = 2082;
            v70 = v50;
            _os_log_impl(&dword_182FBE000, v41, v51, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v50);
          goto LABEL_78;
        }
        if (v52)
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v41, v51, "%{public}s called with null delegate, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v41 = objc_claimAutoreleasedReturnValue();
        v57 = location;
        if (os_log_type_enabled(v41, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v41, v57, "%{public}s called with null delegate, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_78:
    if (v40)
      free(v40);
LABEL_74:

LABEL_86:
    v25 = 0;
    goto LABEL_17;
  }
  v65.receiver = self;
  v65.super_class = (Class)NWUDPListener;
  v9 = -[NWUDPListener init](&v65, sel_init);
  if (!v9)
  {
    __nwlog_obj();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v68 = "-[NWUDPListener initWithParameters:delegate:]";
    v44 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(location) = 16;
    v66 = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v44, &location, &v66))
    {
      if (location == 17)
      {
        __nwlog_obj();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = location;
        if (os_log_type_enabled(v45, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v45, v46, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v66)
      {
        v53 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v45 = objc_claimAutoreleasedReturnValue();
        v54 = location;
        v55 = os_log_type_enabled(v45, (os_log_type_t)location);
        if (v53)
        {
          if (v55)
          {
            *(_DWORD *)buf = 136446466;
            v68 = "-[NWUDPListener initWithParameters:delegate:]";
            v69 = 2082;
            v70 = v53;
            _os_log_impl(&dword_182FBE000, v45, v54, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v53);
          goto LABEL_84;
        }
        if (v55)
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v45, v54, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v45 = objc_claimAutoreleasedReturnValue();
        v58 = location;
        if (os_log_type_enabled(v45, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v45, v58, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_84:
    if (v44)
      free(v44);
    goto LABEL_86;
  }
  objc_initWeak(&location, v9);
  objc_msgSend(v6, "internalParameters");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = nw_parameters_copy_default_protocol_stack(v10);

  options = nw_udp_create_options();
  nw_protocol_stack_set_transport_protocol(v11, options);

  objc_msgSend(v6, "internalParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_data_mode(v13, 1u);

  objc_msgSend(v6, "internalParameters");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = nw_listener_create(v14);
  v16 = (void *)*((_QWORD *)v9 + 3);
  *((_QWORD *)v9 + 3) = v15;

  v17 = *((_QWORD *)v9 + 3);
  if (v17)
  {
    if (NWCopyInternalQueue_init_once != -1)
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
    v18 = (id)NWCopyInternalQueue_nwQueue;
    nw_listener_set_queue(v17, v18);

    v19 = *((_QWORD *)v9 + 3);
    v20 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __45__NWUDPListener_initWithParameters_delegate___block_invoke;
    handler[3] = &unk_1E14AC888;
    objc_copyWeak(&v62, &location);
    nw_listener_set_state_changed_handler(v19, handler);
    v21 = *((_QWORD *)v9 + 3);
    v59[0] = v20;
    v59[1] = 3221225472;
    v59[2] = __45__NWUDPListener_initWithParameters_delegate___block_invoke_2;
    v59[3] = &unk_1E14AC860;
    objc_copyWeak(&v60, &location);
    nw_listener_set_new_connection_handler(v21, v59);
    v22 = objc_msgSend(v6, "copy");
    v23 = (void *)*((_QWORD *)v9 + 4);
    *((_QWORD *)v9 + 4) = v22;

    objc_storeWeak((id *)v9 + 6, v8);
    v24 = (void *)*((_QWORD *)v9 + 2);
    *((_QWORD *)v9 + 2) = 0;

    nw_listener_start(*((nw_listener_t *)v9 + 3));
    v25 = (NWUDPListener *)v9;
    objc_destroyWeak(&v60);
    objc_destroyWeak(&v62);
    goto LABEL_16;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v26 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v68 = "-[NWUDPListener initWithParameters:delegate:]";
  v27 = (char *)_os_log_send_and_compose_impl();

  v66 = OS_LOG_TYPE_ERROR;
  v63 = 0;
  if (__nwlog_fault(v27, &v66, &v63))
  {
    if (v66 == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v28 = (id)gLogObj;
      v29 = v66;
      if (os_log_type_enabled(v28, v66))
      {
        *(_DWORD *)buf = 136446210;
        v68 = "-[NWUDPListener initWithParameters:delegate:]";
        _os_log_impl(&dword_182FBE000, v28, v29, "%{public}s nw_listener_create failed", buf, 0xCu);
      }
    }
    else if (v63)
    {
      v31 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v28 = (id)gLogObj;
      v32 = v66;
      v33 = os_log_type_enabled(v28, v66);
      if (v31)
      {
        if (v33)
        {
          *(_DWORD *)buf = 136446466;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          v69 = 2082;
          v70 = v31;
          _os_log_impl(&dword_182FBE000, v28, v32, "%{public}s nw_listener_create failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v31);
        if (!v27)
          goto LABEL_15;
        goto LABEL_14;
      }
      if (v33)
      {
        *(_DWORD *)buf = 136446210;
        v68 = "-[NWUDPListener initWithParameters:delegate:]";
        _os_log_impl(&dword_182FBE000, v28, v32, "%{public}s nw_listener_create failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v28 = (id)gLogObj;
      v34 = v66;
      if (os_log_type_enabled(v28, v66))
      {
        *(_DWORD *)buf = 136446210;
        v68 = "-[NWUDPListener initWithParameters:delegate:]";
        _os_log_impl(&dword_182FBE000, v28, v34, "%{public}s nw_listener_create failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
  if (v27)
LABEL_14:
    free(v27);
LABEL_15:
  v25 = 0;
LABEL_16:

  objc_destroyWeak(&location);
LABEL_17:

  return v25;
}

- (NWEndpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_localEndpoint, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
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

- (NWUDPListenerDelegate)delegate
{
  return (NWUDPListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_internalListener, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
}

void __45__NWUDPListener_initWithParameters_delegate___block_invoke(uint64_t a1, int a2, void *a3)
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
    objc_msgSend(v6, "handleError:", v11);
  }

}

void __45__NWUDPListener_initWithParameters_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleConnection:", v5);

}

@end
