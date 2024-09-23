@implementation NWConcrete_nw_ws_request

- (NWConcrete_nw_ws_request)init
{
  NWConcrete_nw_ws_request *v2;
  OS_xpc_object *v3;
  OS_xpc_object *subprotocols;
  OS_xpc_object *v5;
  OS_xpc_object *header_names;
  OS_xpc_object *v7;
  OS_xpc_object *header_values;
  NWConcrete_nw_ws_request *v9;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  char *backtrace_string;
  os_log_type_t v16;
  _BOOL4 v17;
  os_log_type_t v18;
  char v19;
  os_log_type_t type;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)NWConcrete_nw_ws_request;
  v2 = -[NWConcrete_nw_ws_request init](&v21, sel_init);
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_array_create(0, 0);
    subprotocols = v2->subprotocols;
    v2->subprotocols = v3;

    v5 = (OS_xpc_object *)xpc_array_create(0, 0);
    header_names = v2->header_names;
    v2->header_names = v5;

    v7 = (OS_xpc_object *)xpc_array_create(0, 0);
    header_values = v2->header_values;
    v2->header_values = v7;

    v9 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v23 = "-[NWConcrete_nw_ws_request init]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v19 = 0;
  if (__nwlog_fault(v12, &type, &v19))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWConcrete_nw_ws_request init]";
        _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v19)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v16 = type;
      v17 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          v23 = "-[NWConcrete_nw_ws_request init]";
          v24 = 2082;
          v25 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v13, v16, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWConcrete_nw_ws_request init]";
        _os_log_impl(&dword_182FBE000, v13, v16, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWConcrete_nw_ws_request init]";
        _os_log_impl(&dword_182FBE000, v13, v18, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v12)
    free(v12);
LABEL_3:

  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_ws_request;
  -[NWConcrete_nw_ws_request dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->header_values, 0);
  objc_storeStrong((id *)&self->header_names, 0);
  objc_storeStrong((id *)&self->subprotocols, 0);
}

@end
