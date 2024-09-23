@implementation NWBonjourServiceEndpoint

+ (unsigned)endpointType
{
  return 3;
}

+ (NWBonjourServiceEndpoint)endpointWithName:(NSString *)name type:(NSString *)type domain:(NSString *)domain
{
  NSString *v7;
  NSString *v8;
  NSString *v9;
  nw_endpoint_t bonjour_service;
  nw_endpoint_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  id v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  os_log_type_t v20;
  char *backtrace_string;
  os_log_type_t v22;
  _BOOL4 v23;
  os_log_type_t v24;
  _BOOL4 v25;
  os_log_type_t v26;
  os_log_type_t v27;
  char v29;
  os_log_type_t typea;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = domain;
  v8 = type;
  v9 = name;
  bonjour_service = nw_endpoint_create_bonjour_service(-[NSString UTF8String](v9, "UTF8String"), -[NSString UTF8String](v8, "UTF8String"), -[NSString UTF8String](v7, "UTF8String"));
  v11 = bonjour_service;
  if (!bonjour_service)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    typea = OS_LOG_TYPE_ERROR;
    v29 = 0;
    if (!__nwlog_fault(v16, &typea, &v29))
      goto LABEL_37;
    if (typea == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      v18 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s nw_endpoint_create_bonjour_service failed", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v29)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      v26 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_182FBE000, v17, v26, "%{public}s nw_endpoint_create_bonjour_service failed, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v17 = (id)gLogObj;
    v22 = typea;
    v23 = os_log_type_enabled(v17, typea);
    if (!backtrace_string)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_182FBE000, v17, v22, "%{public}s nw_endpoint_create_bonjour_service failed, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v23)
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
      v33 = 2082;
      v34 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v17, v22, "%{public}s nw_endpoint_create_bonjour_service failed, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_23;
  }
  v12 = bonjour_service;
  v13 = -[NSObject type](v12, "type");

  if (v13 != 3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v19 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    typea = OS_LOG_TYPE_ERROR;
    v29 = 0;
    if (!__nwlog_fault(v16, &typea, &v29))
      goto LABEL_37;
    if (typea == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      v20 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_182FBE000, v17, v20, "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type", buf, 0xCu);
      }
LABEL_36:

LABEL_37:
      if (!v16)
      {
LABEL_39:
        v14 = 0;
        goto LABEL_40;
      }
LABEL_38:
      free(v16);
      goto LABEL_39;
    }
    if (!v29)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      v27 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_182FBE000, v17, v27, "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v17 = (id)gLogObj;
    v24 = typea;
    v25 = os_log_type_enabled(v17, typea);
    if (!backtrace_string)
    {
      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_182FBE000, v17, v24, "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v25)
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
      v33 = 2082;
      v34 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v17, v24, "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_23:

    free(backtrace_string);
    if (!v16)
      goto LABEL_39;
    goto LABEL_38;
  }
  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return (NWBonjourServiceEndpoint *)v14;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a3;
  -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain", *(_QWORD *)&a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[NWBonjourServiceEndpoint name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("name"), v4, 1);

    -[NWBonjourServiceEndpoint type](self, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("type"), v4, 1);

    -[NWBonjourServiceEndpoint domain](self, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("domain"), v4, 1);

    -[NWEndpoint interface](self, "interface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("interface"), v4, 1);

    -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v12, CFSTR("parentEndpointDomain"), v4, 1);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[NWEndpoint internalEndpoint](self, "internalEndpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithUTF8String:", nw_endpoint_get_description(v12));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSString)name
{
  NSObject *v2;
  const char *bonjour_service_name;
  _BOOL8 v4;
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
  bonjour_service_name = nw_endpoint_get_bonjour_service_name(v2);

  if (!bonjour_service_name)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWBonjourServiceEndpoint name]";
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
        v19 = "-[NWBonjourServiceEndpoint name]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed";
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
        v19 = "-[NWBonjourServiceEndpoint name]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed, backtrace limit exceeded";
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
        v19 = "-[NWBonjourServiceEndpoint name]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWBonjourServiceEndpoint name]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_endpoint_get_bonjour_service_name failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_14:
      v4 = 0;
      return (NSString *)(id)v4;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  v4 = nw_nsstring((uint64_t)bonjour_service_name);
  return (NSString *)(id)v4;
}

- (NSString)type
{
  NSObject *v2;
  const char *bonjour_service_type;
  _BOOL8 v4;
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
  bonjour_service_type = nw_endpoint_get_bonjour_service_type(v2);

  if (!bonjour_service_type)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWBonjourServiceEndpoint type]";
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
        v19 = "-[NWBonjourServiceEndpoint type]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed";
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
        v19 = "-[NWBonjourServiceEndpoint type]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed, backtrace limit exceeded";
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
        v19 = "-[NWBonjourServiceEndpoint type]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWBonjourServiceEndpoint type]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_endpoint_get_bonjour_service_type failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_14:
      v4 = 0;
      return (NSString *)(id)v4;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  v4 = nw_nsstring((uint64_t)bonjour_service_type);
  return (NSString *)(id)v4;
}

- (NSString)domain
{
  NSObject *v2;
  const char *bonjour_service_domain;
  _BOOL8 v4;
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
  bonjour_service_domain = nw_endpoint_get_bonjour_service_domain(v2);

  if (!bonjour_service_domain)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWBonjourServiceEndpoint domain]";
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
        v19 = "-[NWBonjourServiceEndpoint domain]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed";
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
        v19 = "-[NWBonjourServiceEndpoint domain]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed, backtrace limit exceeded";
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
        v19 = "-[NWBonjourServiceEndpoint domain]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWBonjourServiceEndpoint domain]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_endpoint_get_bonjour_service_domain failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_14:
      v4 = 0;
      return (NSString *)(id)v4;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  v4 = nw_nsstring((uint64_t)bonjour_service_domain);
  return (NSString *)(id)v4;
}

@end
