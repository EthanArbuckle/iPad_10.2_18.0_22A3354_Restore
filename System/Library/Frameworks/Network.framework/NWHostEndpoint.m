@implementation NWHostEndpoint

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[NWEndpoint txtRecord](self, "txtRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[NWEndpoint internalEndpoint](self, "internalEndpoint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithUTF8String:", nw_endpoint_get_description(v14));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NWHostEndpoint hostname](self, "hostname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("hostname"), v5, 1);

  -[NWHostEndpoint port](self, "port");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("port"), v5, 1);

  -[NWEndpoint interface](self, "interface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v12, CFSTR("interface"), v5, v4);

  -[NWEndpoint txtRecord](self, "txtRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v13, CFSTR("txtRecord"), v5, v4);

  -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v14, CFSTR("parentEndpointDomain"), v5, 1);
LABEL_5:

  return v9;
}

+ (unsigned)endpointType
{
  return 2;
}

+ (NWHostEndpoint)endpointWithHostname:(NSString *)hostname port:(NSString *)port
{
  NSString *v5;
  NSString *v6;
  nw_endpoint_t host;
  void *v8;
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
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = port;
  v6 = hostname;
  host = nw_endpoint_create_host(-[NSString UTF8String](v6, "UTF8String"), -[NSString UTF8String](v5, "UTF8String"));
  if (!host)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
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
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
        v13 = "%{public}s nw_endpoint_create_host failed";
LABEL_18:
        v18 = v11;
        v19 = v12;
        goto LABEL_19;
      }
      if (!v20)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (!os_log_type_enabled(v11, type))
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
        v13 = "%{public}s nw_endpoint_create_host failed, backtrace limit exceeded";
        goto LABEL_18;
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
LABEL_20:

          if (!v10)
            goto LABEL_14;
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136446210;
        v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
        v13 = "%{public}s nw_endpoint_create_host failed, no backtrace";
        v18 = v11;
        v19 = v15;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v18, v19, v13, buf, 0xCu);
        goto LABEL_20;
      }
      if (v16)
      {
        *(_DWORD *)buf = 136446466;
        v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
        v24 = 2082;
        v25 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v11, v15, "%{public}s nw_endpoint_create_host failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v10)
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
LABEL_13:
    free(v10);
    goto LABEL_14;
  }
  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", host);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return (NWHostEndpoint *)v8;
}

- (NSString)hostname
{
  NSObject *v3;
  nw_endpoint_type_t v4;
  NSObject *v5;
  NSObject *v6;
  const sockaddr *address;
  void *v8;
  const char *hostname;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  char *backtrace_string;
  os_log_type_t v17;
  _BOOL4 v18;
  NSObject *v19;
  os_log_type_t v20;
  char v21;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = nw_endpoint_get_type(v3);

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != nw_endpoint_type_address)
  {
    hostname = nw_endpoint_get_hostname(v5);

    if (hostname)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", hostname);
      return (NSString *)(id)objc_claimAutoreleasedReturnValue();
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v24 = "-[NWHostEndpoint hostname]";
    v12 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v21 = 0;
    if (!__nwlog_fault(v12, &type, &v21))
      goto LABEL_23;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWHostEndpoint hostname]";
        v15 = "%{public}s nw_endpoint_get_hostname failed";
LABEL_20:
        v19 = v13;
        v20 = v14;
LABEL_21:
        _os_log_impl(&dword_182FBE000, v19, v20, v15, buf, 0xCu);
      }
    }
    else if (v21)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v17 = type;
      v18 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v18)
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWHostEndpoint hostname]";
          v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v13, v17, "%{public}s nw_endpoint_get_hostname failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_23;
      }
      if (v18)
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWHostEndpoint hostname]";
        v15 = "%{public}s nw_endpoint_get_hostname failed, no backtrace";
        v19 = v13;
        v20 = v17;
        goto LABEL_21;
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWHostEndpoint hostname]";
        v15 = "%{public}s nw_endpoint_get_hostname failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }

LABEL_23:
    if (v12)
      free(v12);
    v8 = 0;
    return (NSString *)v8;
  }
  address = nw_endpoint_get_address(v5);
  if (!address)
  {

    return (NSString *)0;
  }
  v8 = 0;
  if (!getnameinfo(address, address->sa_len, (char *)buf, 0x46u, 0, 0, 10))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSString)port
{
  NSObject *v2;
  char *v3;
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
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_endpoint_copy_port_string(v2);

  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWHostEndpoint port]";
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
        v19 = "-[NWHostEndpoint port]";
        v9 = "%{public}s nw_endpoint_copy_port_string failed";
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
        v19 = "-[NWHostEndpoint port]";
        v9 = "%{public}s nw_endpoint_copy_port_string failed, backtrace limit exceeded";
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
        v19 = "-[NWHostEndpoint port]";
        v9 = "%{public}s nw_endpoint_copy_port_string failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWHostEndpoint port]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_endpoint_copy_port_string failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_14:
      v4 = 0;
      return (NSString *)v4;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(v3);
  return (NSString *)v4;
}

@end
