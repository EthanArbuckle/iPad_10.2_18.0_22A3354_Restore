@implementation NWAddressEndpoint

+ (unsigned)endpointType
{
  return 1;
}

+ (id)endpointWithHostname:(id)a3 port:(id)a4
{
  id v5;
  id v6;
  nw_endpoint_t host;
  nw_endpoint_t v8;
  NSObject *v9;
  int v10;
  void *v11;
  id v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  os_log_type_t v17;
  char *backtrace_string;
  os_log_type_t v19;
  _BOOL4 v20;
  os_log_type_t v21;
  _BOOL4 v22;
  os_log_type_t v23;
  os_log_type_t v24;
  char v26;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  host = nw_endpoint_create_host((const char *)objc_msgSend(v5, "UTF8String"), (const char *)objc_msgSend(v6, "UTF8String"));
  v8 = host;
  if (!host)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v26 = 0;
    if (!__nwlog_fault(v13, &type, &v26))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s nw_endpoint_create_host failed", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v26)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v23 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl(&dword_182FBE000, v14, v23, "%{public}s nw_endpoint_create_host failed, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    v19 = type;
    v20 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl(&dword_182FBE000, v14, v19, "%{public}s nw_endpoint_create_host failed, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v20)
    {
      *(_DWORD *)buf = 136446466;
      v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
      v30 = 2082;
      v31 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v14, v19, "%{public}s nw_endpoint_create_host failed, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_23;
  }
  v9 = host;
  v10 = -[NSObject type](v9, "type");

  if (v10 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
    v30 = 2114;
    v31 = (char *)v5;
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v26 = 0;
    if (!__nwlog_fault(v13, &type, &v26))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v17 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        v30 = 2114;
        v31 = (char *)v5;
        _os_log_impl(&dword_182FBE000, v14, v17, "%{public}s NWAddressEndpoint created with non-address hostname %{public}@", buf, 0x16u);
      }
LABEL_36:

LABEL_37:
      if (!v13)
      {
LABEL_39:
        v11 = 0;
        goto LABEL_40;
      }
LABEL_38:
      free(v13);
      goto LABEL_39;
    }
    if (!v26)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v24 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        v30 = 2114;
        v31 = (char *)v5;
        _os_log_impl(&dword_182FBE000, v14, v24, "%{public}s NWAddressEndpoint created with non-address hostname %{public}@, backtrace limit exceeded", buf, 0x16u);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    v21 = type;
    v22 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v22)
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        v30 = 2114;
        v31 = (char *)v5;
        _os_log_impl(&dword_182FBE000, v14, v21, "%{public}s NWAddressEndpoint created with non-address hostname %{public}@, no backtrace", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (v22)
    {
      *(_DWORD *)buf = 136446722;
      v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
      v30 = 2114;
      v31 = (char *)v5;
      v32 = 2082;
      v33 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v14, v21, "%{public}s NWAddressEndpoint created with non-address hostname %{public}@, dumping backtrace:%{public}s", buf, 0x20u);
    }
LABEL_23:

    free(backtrace_string);
    if (!v13)
      goto LABEL_39;
    goto LABEL_38;
  }
  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v11;
}

+ (id)endpointWithAddress:(const sockaddr *)a3
{
  nw_endpoint_t address;
  nw_endpoint_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  id v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  os_log_type_t v13;
  char *backtrace_string;
  os_log_type_t v15;
  _BOOL4 v16;
  os_log_type_t v17;
  _BOOL4 v18;
  os_log_type_t v19;
  os_log_type_t v20;
  char v22;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  address = nw_endpoint_create_address(a3);
  v4 = address;
  if (!address)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v8 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v25 = "+[NWAddressEndpoint endpointWithAddress:]";
    v9 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v22 = 0;
    if (!__nwlog_fault(v9, &type, &v22))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s nw_endpoint_create_address failed", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v22)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_182FBE000, v10, v19, "%{public}s nw_endpoint_create_address failed, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    v15 = type;
    v16 = os_log_type_enabled(v10, type);
    if (!backtrace_string)
    {
      if (v16)
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_182FBE000, v10, v15, "%{public}s nw_endpoint_create_address failed, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446466;
      v25 = "+[NWAddressEndpoint endpointWithAddress:]";
      v26 = 2082;
      v27 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v10, v15, "%{public}s nw_endpoint_create_address failed, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_23;
  }
  v5 = address;
  v6 = -[NSObject type](v5, "type");

  if (v6 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v25 = "+[NWAddressEndpoint endpointWithAddress:]";
    v9 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v22 = 0;
    if (!__nwlog_fault(v9, &type, &v22))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v13 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_182FBE000, v10, v13, "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint", buf, 0xCu);
      }
LABEL_36:

LABEL_37:
      if (!v9)
      {
LABEL_39:
        v7 = 0;
        goto LABEL_40;
      }
LABEL_38:
      free(v9);
      goto LABEL_39;
    }
    if (!v22)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v20 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_182FBE000, v10, v20, "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    v17 = type;
    v18 = os_log_type_enabled(v10, type);
    if (!backtrace_string)
    {
      if (v18)
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_182FBE000, v10, v17, "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v18)
    {
      *(_DWORD *)buf = 136446466;
      v25 = "+[NWAddressEndpoint endpointWithAddress:]";
      v26 = 2082;
      v27 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v10, v17, "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_23:

    free(backtrace_string);
    if (!v9)
      goto LABEL_39;
    goto LABEL_38;
  }
  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v7;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = *(_QWORD *)&a3;
  -[NWAddressEndpoint ethernetAddress](self, "ethernetAddress", *(_QWORD *)&a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7 | v6;

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[NWAddressEndpoint addressString](self, "addressString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("address"), v4, 1);

    objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v6, CFSTR("ethernetAddress"), v4, 1);
    -[NWEndpoint interface](self, "interface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("interface"), v4, 1);

    -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendPrettyObject:withName:indent:showFullContent:", v12, CFSTR("parentEndpointDomain"), v4, 1);

  }
  else
  {
    -[NWAddressEndpoint addressString](self, "addressString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)ethernetAddress
{
  void *v2;
  unsigned __int8 *ethernet_address;
  void *v4;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ethernet_address = nw_endpoint_get_ethernet_address(v2);

  if (ethernet_address)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x:%x:%x:%x:%x:%x"), *ethernet_address, ethernet_address[1], ethernet_address[2], ethernet_address[3], ethernet_address[4], ethernet_address[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSData)addressData
{
  NSObject *v2;
  const sockaddr *address;
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
  address = nw_endpoint_get_address(v2);

  if (!address)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWAddressEndpoint addressData]";
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
        v19 = "-[NWAddressEndpoint addressData]";
        v9 = "%{public}s nw_endpoint_get_address failed";
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
        v19 = "-[NWAddressEndpoint addressData]";
        v9 = "%{public}s nw_endpoint_get_address failed, backtrace limit exceeded";
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
        v19 = "-[NWAddressEndpoint addressData]";
        v9 = "%{public}s nw_endpoint_get_address failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWAddressEndpoint addressData]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_endpoint_get_address failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_14:
      v4 = 0;
      return (NSData *)v4;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", address, address->sa_len);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSData *)v4;
}

- (NSString)addressString
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSString *result;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_description(v2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_4;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  v5 = (void *)_os_log_send_and_compose_impl();

  result = (NSString *)__nwlog_abort((uint64_t)v5);
  if (!(_DWORD)result)
  {
    free(v5);
LABEL_4:

    return (NSString *)v3;
  }
  __break(1u);
  return result;
}

- (NSString)addressStringNoPort
{
  NSObject *v2;
  const sockaddr *address;
  void *v4;
  char v6[70];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = objc_claimAutoreleasedReturnValue();
  address = nw_endpoint_get_address(v2);
  if (address)
  {
    v4 = 0;
    if (!getnameinfo(address, address->sa_len, v6, 0x46u, 0, 0, 10))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (const)address
{
  NSObject *v2;
  const sockaddr *address;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = objc_claimAutoreleasedReturnValue();
  address = nw_endpoint_get_address(v2);

  return address;
}

- (unint64_t)addressFamily
{
  NSObject *v2;
  const sockaddr *address;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = objc_claimAutoreleasedReturnValue();
  address = nw_endpoint_get_address(v2);

  if (address)
    return address->sa_family;
  else
    return 0;
}

@end
