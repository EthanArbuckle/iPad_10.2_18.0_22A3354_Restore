@implementation NWBonjourBrowseDescriptor

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[NWBonjourBrowseDescriptor type](self, "type", *(_QWORD *)&a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWBonjourBrowseDescriptor domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  -[NWBrowseDescriptor internalDescriptor](self, "internalDescriptor");
  v2 = objc_claimAutoreleasedReturnValue();
  bonjour_service_type = nw_browse_descriptor_get_bonjour_service_type(v2);

  if (!bonjour_service_type)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWBonjourBrowseDescriptor type]";
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
        v19 = "-[NWBonjourBrowseDescriptor type]";
        v9 = "%{public}s nw_browse_descriptor_get_service_type failed";
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
        v19 = "-[NWBonjourBrowseDescriptor type]";
        v9 = "%{public}s nw_browse_descriptor_get_service_type failed, backtrace limit exceeded";
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
        v19 = "-[NWBonjourBrowseDescriptor type]";
        v9 = "%{public}s nw_browse_descriptor_get_service_type failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWBonjourBrowseDescriptor type]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_browse_descriptor_get_service_type failed, dumping backtrace:%{public}s", buf, 0x16u);
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
  -[NWBrowseDescriptor internalDescriptor](self, "internalDescriptor");
  v2 = objc_claimAutoreleasedReturnValue();
  bonjour_service_domain = nw_browse_descriptor_get_bonjour_service_domain(v2);

  if (!bonjour_service_domain)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v19 = "-[NWBonjourBrowseDescriptor domain]";
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
        v19 = "-[NWBonjourBrowseDescriptor domain]";
        v9 = "%{public}s nw_browse_descriptor_get_service_domain failed";
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
        v19 = "-[NWBonjourBrowseDescriptor domain]";
        v9 = "%{public}s nw_browse_descriptor_get_service_domain failed, backtrace limit exceeded";
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
        v19 = "-[NWBonjourBrowseDescriptor domain]";
        v9 = "%{public}s nw_browse_descriptor_get_service_domain failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWBonjourBrowseDescriptor domain]";
        v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s nw_browse_descriptor_get_service_domain failed, dumping backtrace:%{public}s", buf, 0x16u);
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

+ (unsigned)descriptorType
{
  return 1;
}

+ (id)descriptorWithType:(id)a3 domain:(id)a4
{
  id v5;
  id v6;
  nw_browse_descriptor_t bonjour_service;
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
  v5 = a4;
  v6 = a3;
  bonjour_service = nw_browse_descriptor_create_bonjour_service((const char *)objc_msgSend(v6, "UTF8String"), (const char *)objc_msgSend(v5, "UTF8String"));
  if (!bonjour_service)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
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
        v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
        v13 = "%{public}s nw_browse_descriptor_create_bonjour_service failed";
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
        v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
        v13 = "%{public}s nw_browse_descriptor_create_bonjour_service failed, backtrace limit exceeded";
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
        v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
        v13 = "%{public}s nw_browse_descriptor_create_bonjour_service failed, no backtrace";
        v18 = v11;
        v19 = v15;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v18, v19, v13, buf, 0xCu);
        goto LABEL_20;
      }
      if (v16)
      {
        *(_DWORD *)buf = 136446466;
        v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
        v24 = 2082;
        v25 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v11, v15, "%{public}s nw_browse_descriptor_create_bonjour_service failed, dumping backtrace:%{public}s", buf, 0x16u);
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
  +[NWBrowseDescriptor descriptorWithInternalDescriptor:](NWBonjourBrowseDescriptor, "descriptorWithInternalDescriptor:", bonjour_service);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v8;
}

@end
