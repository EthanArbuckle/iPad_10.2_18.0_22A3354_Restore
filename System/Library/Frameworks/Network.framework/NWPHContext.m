@implementation NWPHContext

- (NWPHContext)initWithRequest:(id)a3 onConnection:(id)a4
{
  id v6;
  id v7;
  NWPHContext *v8;
  xpc_object_t reply;
  NWPHContext *v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  char *backtrace_string;
  os_log_type_t v17;
  _BOOL4 v18;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  char *v27;
  _BOOL4 v28;
  char v29;
  os_log_type_t type;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)NWPHContext;
  v8 = -[NWPHContext init](&v31, sel_init);
  if (v8)
  {
    reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      -[NWPHContext setConnection:](v8, "setConnection:", v7);
      -[NWPHContext setRequest:](v8, "setRequest:", v6);
      -[NWPHContext setReply:](v8, "setReply:", reply);
      v10 = v8;
LABEL_16:

      goto LABEL_17;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v33 = "-[NWPHContext initWithRequest:onConnection:]";
    v12 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v29 = 0;
    if (__nwlog_fault(v12, &type, &v29))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (id)gLogObj;
        v14 = type;
        if (!os_log_type_enabled(v13, type))
          goto LABEL_22;
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v15 = "%{public}s xpc_dictionary_create_reply failed";
LABEL_20:
        v20 = v13;
        v21 = v14;
        goto LABEL_21;
      }
      if (!v29)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (id)gLogObj;
        v14 = type;
        if (!os_log_type_enabled(v13, type))
          goto LABEL_22;
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v15 = "%{public}s xpc_dictionary_create_reply failed, backtrace limit exceeded";
        goto LABEL_20;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v17 = type;
      v18 = os_log_type_enabled(v13, type);
      if (!backtrace_string)
      {
        if (!v18)
        {
LABEL_22:

          if (!v12)
            goto LABEL_15;
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v15 = "%{public}s xpc_dictionary_create_reply failed, no backtrace";
        v20 = v13;
        v21 = v17;
LABEL_21:
        _os_log_impl(&dword_182FBE000, v20, v21, v15, buf, 0xCu);
        goto LABEL_22;
      }
      if (v18)
      {
        *(_DWORD *)buf = 136446466;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v34 = 2082;
        v35 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v13, v17, "%{public}s xpc_dictionary_create_reply failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v12)
    {
LABEL_15:
      v10 = 0;
      goto LABEL_16;
    }
LABEL_14:
    free(v12);
    goto LABEL_15;
  }
  __nwlog_obj();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v33 = "-[NWPHContext initWithRequest:onConnection:]";
  v23 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v29 = 0;
  if (__nwlog_fault(v23, &type, &v29))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = type;
      if (os_log_type_enabled(v24, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v26 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_182FBE000, v24, v25, v26, buf, 0xCu);
      }
    }
    else
    {
      if (v29)
      {
        v27 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        v28 = os_log_type_enabled(v24, type);
        if (v27)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446466;
            v33 = "-[NWPHContext initWithRequest:onConnection:]";
            v34 = 2082;
            v35 = v27;
            _os_log_impl(&dword_182FBE000, v24, v25, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v27);
          goto LABEL_41;
        }
        if (!v28)
          goto LABEL_40;
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v26 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }
      __nwlog_obj();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = type;
      if (os_log_type_enabled(v24, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWPHContext initWithRequest:onConnection:]";
        v26 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }
LABEL_40:

  }
LABEL_41:
  if (v23)
    free(v23);
  v10 = 0;
LABEL_17:

  return v10;
}

- (int)pid
{
  _xpc_connection_s *v2;
  pid_t pid;

  -[NWPHContext connection](self, "connection");
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  pid = xpc_connection_get_pid(v2);

  return pid;
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_xpc_object)request
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_xpc_object)reply
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReply:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
