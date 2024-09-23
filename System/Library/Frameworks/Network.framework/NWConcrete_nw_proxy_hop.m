@implementation NWConcrete_nw_proxy_hop

- (NWConcrete_nw_proxy_hop)init
{
  NWConcrete_nw_proxy_hop *v2;
  NWConcrete_nw_proxy_hop *v3;
  NWConcrete_nw_proxy_hop *v4;
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
  v16.super_class = (Class)NWConcrete_nw_proxy_hop;
  v2 = -[NWConcrete_nw_proxy_hop init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_proxy_hop init]";
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
        v18 = "-[NWConcrete_nw_proxy_hop init]";
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
          v18 = "-[NWConcrete_nw_proxy_hop init]";
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
        v18 = "-[NWConcrete_nw_proxy_hop init]";
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
        v18 = "-[NWConcrete_nw_proxy_hop init]";
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

- (void)dealloc
{
  __CFArray *raw_public_keys;
  __CFData *client_identity_persistent_reference;
  __CFArray *client_certificates;
  objc_super v6;

  raw_public_keys = self->raw_public_keys;
  if (raw_public_keys)
  {
    CFRelease(raw_public_keys);
    self->raw_public_keys = 0;
  }
  client_identity_persistent_reference = self->client_identity_persistent_reference;
  if (client_identity_persistent_reference)
  {
    CFRelease(client_identity_persistent_reference);
    self->client_identity_persistent_reference = 0;
  }
  client_certificates = self->client_certificates;
  if (client_certificates)
  {
    CFRelease(client_certificates);
    self->client_certificates = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_proxy_hop;
  -[NWConcrete_nw_proxy_hop dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tls_options, 0);
  objc_storeStrong((id *)&self->options, 0);
  objc_storeStrong((id *)&self->fallback_endpoint, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
}

@end
