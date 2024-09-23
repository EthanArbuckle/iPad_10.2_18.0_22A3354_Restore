@implementation NWBrowseDescriptor

- (NSString)bonjourServiceDomain
{
  NSObject *v2;
  const char *bonjour_service_domain;
  _BOOL8 v4;

  -[NWBrowseDescriptor internalDescriptor](self, "internalDescriptor");
  v2 = objc_claimAutoreleasedReturnValue();
  bonjour_service_domain = nw_browse_descriptor_get_bonjour_service_domain(v2);

  if (bonjour_service_domain)
    v4 = nw_nsstring((uint64_t)bonjour_service_domain);
  else
    v4 = 0;
  return (NSString *)(id)v4;
}

- (NSString)bonjourServiceType
{
  NSObject *v2;
  const char *bonjour_service_type;
  _BOOL8 v4;

  -[NWBrowseDescriptor internalDescriptor](self, "internalDescriptor");
  v2 = objc_claimAutoreleasedReturnValue();
  bonjour_service_type = nw_browse_descriptor_get_bonjour_service_type(v2);

  if (bonjour_service_type)
    v4 = nw_nsstring((uint64_t)bonjour_service_type);
  else
    v4 = 0;
  return (NSString *)(id)v4;
}

- (NWBrowseDescriptor)initWithDescriptor:(id)a3
{
  id v5;
  NWBrowseDescriptor *v6;
  NWBrowseDescriptor *v7;
  void *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  char *v19;
  _BOOL4 v20;
  char *backtrace_string;
  _BOOL4 v22;
  objc_super v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWBrowseDescriptor;
    v6 = -[NWBrowseDescriptor init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalDescriptor, a3);
      goto LABEL_4;
    }
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24))
      goto LABEL_38;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
          v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15)
      free(v15);
    v7 = 0;
    goto LABEL_4;
  }
  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor";
LABEL_29:
        _os_log_impl(&dword_182FBE000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = type;
        v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
            v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null internalDescriptor, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:

  }
LABEL_31:
  if (v10)
    free(v10);

  v7 = 0;
LABEL_4:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NWBrowseDescriptor internalDescriptor](self, "internalDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDescriptor:", v5);

  return v6;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<type:%u>"), objc_msgSend((id)objc_opt_class(), "descriptorType"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  return -[NWBrowseDescriptor descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSString)privateDescription
{
  return (NSString *)-[NWBrowseDescriptor descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (void)browseWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  NSObject *v13;
  os_log_type_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  char *v19;
  _BOOL4 v20;
  char v21;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NWBrowseDescriptor *v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v5 = (id)gLogObj;
  if (v4)
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
    v25 = 2114;
    v26 = self;
    v6 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v21 = 0;
    if (__nwlog_fault(v6, &type, &v21))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_19;
        *(_DWORD *)buf = 136446466;
        v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        v25 = 2114;
        v26 = self;
        v9 = "%{public}s Descriptor %{public}@ does not support custom resolution";
LABEL_17:
        v13 = v7;
        v14 = v8;
        goto LABEL_18;
      }
      if (!v21)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_19;
        *(_DWORD *)buf = 136446466;
        v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        v25 = 2114;
        v26 = self;
        v9 = "%{public}s Descriptor %{public}@ does not support custom resolution, backtrace limit exceeded";
        goto LABEL_17;
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
LABEL_19:

          if (!v6)
            goto LABEL_13;
          goto LABEL_12;
        }
        *(_DWORD *)buf = 136446466;
        v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        v25 = 2114;
        v26 = self;
        v9 = "%{public}s Descriptor %{public}@ does not support custom resolution, no backtrace";
        v13 = v7;
        v14 = v11;
LABEL_18:
        _os_log_impl(&dword_182FBE000, v13, v14, v9, buf, 0x16u);
        goto LABEL_19;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446722;
        v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        v25 = 2114;
        v26 = self;
        v27 = 2082;
        v28 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s Descriptor %{public}@ does not support custom resolution, dumping backtrace:%{public}s", buf, 0x20u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_13:
      v4[2](v4, 0);
      goto LABEL_14;
    }
LABEL_12:
    free(v6);
    goto LABEL_13;
  }
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
  v15 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v21 = 0;
  if (__nwlog_fault(v15, &type, &v21))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        v18 = "%{public}s called with null completionHandler";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v16, v17, v18, buf, 0xCu);
      }
    }
    else
    {
      if (v21)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = type;
        v20 = os_log_type_enabled(v16, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
            v25 = 2082;
            v26 = (NWBrowseDescriptor *)v19;
            _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s called with null completionHandler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_38;
        }
        if (!v20)
          goto LABEL_37;
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        v18 = "%{public}s called with null completionHandler, no backtrace";
        goto LABEL_36;
      }
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        v18 = "%{public}s called with null completionHandler, backtrace limit exceeded";
        goto LABEL_36;
      }
    }
LABEL_37:

  }
LABEL_38:
  if (v15)
    free(v15);
LABEL_14:

}

- (NWBrowseDescriptor)initWithEncodedData:(id)a3
{
  id v4;
  NWBrowseDescriptor *v5;
  NWBrowseDescriptor *v6;
  void *v7;
  int v8;
  unsigned int v9;
  void *v10;
  _QWORD *v11;
  NWConcrete_nw_browse_descriptor *custom;
  NWBrowseDescriptor *v13;
  id v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  char *backtrace_string;
  os_log_type_t v20;
  _BOOL4 v21;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  void *v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  char *v35;
  _BOOL4 v36;
  char *v37;
  _BOOL4 v38;
  _QWORD v39[5];
  objc_super v40;
  char v41;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v40.receiver = self;
    v40.super_class = (Class)NWBrowseDescriptor;
    v5 = -[NWBrowseDescriptor init](&v40, sel_init);
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_opt_class();
      v8 = objc_msgSend(v7, "supportsBrowseCallback");
      v9 = objc_msgSend(v7, "descriptorType");
      v10 = (void *)objc_msgSend(v4, "_createDispatchData");
      if (v8)
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __42__NWBrowseDescriptor_initWithEncodedData___block_invoke;
        v39[3] = &__block_descriptor_40_e76_v24__0__NSObject_OS_nw_browse_descriptor__8___v____NSObject_OS_nw_array___16lu32l8;
        v39[4] = v7;
        v11 = v39;
      }
      else
      {
        v11 = 0;
      }
      custom = nw_browse_descriptor_create_custom(v9, v10, v11);

      if (custom)
      {
        -[NWBrowseDescriptor setInternalDescriptor:](v6, "setInternalDescriptor:", custom);
        v13 = v6;
LABEL_20:

        goto LABEL_21;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
      v15 = (char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v41 = 0;
      if (__nwlog_fault(v15, &type, &v41))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v16 = (id)gLogObj;
          v17 = type;
          if (!os_log_type_enabled(v16, type))
            goto LABEL_26;
          *(_DWORD *)buf = 136446210;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          v18 = "%{public}s nw_browse_descriptor_create_custom failed";
LABEL_24:
          v23 = v16;
          v24 = v17;
          goto LABEL_25;
        }
        if (!v41)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v16 = (id)gLogObj;
          v17 = type;
          if (!os_log_type_enabled(v16, type))
            goto LABEL_26;
          *(_DWORD *)buf = 136446210;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          v18 = "%{public}s nw_browse_descriptor_create_custom failed, backtrace limit exceeded";
          goto LABEL_24;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        v20 = type;
        v21 = os_log_type_enabled(v16, type);
        if (!backtrace_string)
        {
          if (!v21)
          {
LABEL_26:

            if (!v15)
              goto LABEL_19;
            goto LABEL_18;
          }
          *(_DWORD *)buf = 136446210;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          v18 = "%{public}s nw_browse_descriptor_create_custom failed, no backtrace";
          v23 = v16;
          v24 = v20;
LABEL_25:
          _os_log_impl(&dword_182FBE000, v23, v24, v18, buf, 0xCu);
          goto LABEL_26;
        }
        if (v21)
        {
          *(_DWORD *)buf = 136446466;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          v45 = 2082;
          v46 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v16, v20, "%{public}s nw_browse_descriptor_create_custom failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
      }
      if (!v15)
      {
LABEL_19:
        v13 = 0;
        goto LABEL_20;
      }
LABEL_18:
      free(v15);
      goto LABEL_19;
    }
    __nwlog_obj();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
    v31 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v41 = 0;
    if (!__nwlog_fault(v31, &type, &v41))
      goto LABEL_63;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v34 = "%{public}s [super init] failed";
LABEL_61:
        _os_log_impl(&dword_182FBE000, v32, v33, v34, buf, 0xCu);
      }
    }
    else if (v41)
    {
      v37 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = type;
      v38 = os_log_type_enabled(v32, type);
      if (v37)
      {
        if (v38)
        {
          *(_DWORD *)buf = 136446466;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          v45 = 2082;
          v46 = v37;
          _os_log_impl(&dword_182FBE000, v32, v33, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v37);
        goto LABEL_63;
      }
      if (v38)
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v34 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_61;
      }
    }
    else
    {
      __nwlog_obj();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v34 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_61;
      }
    }

LABEL_63:
    if (v31)
      free(v31);
    v13 = 0;
    goto LABEL_21;
  }
  __nwlog_obj();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
  v26 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v41 = 0;
  if (__nwlog_fault(v26, &type, &v41))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v29 = "%{public}s called with null encodedData";
LABEL_54:
        _os_log_impl(&dword_182FBE000, v27, v28, v29, buf, 0xCu);
      }
    }
    else
    {
      if (v41)
      {
        v35 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = type;
        v36 = os_log_type_enabled(v27, type);
        if (v35)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
            v45 = 2082;
            v46 = v35;
            _os_log_impl(&dword_182FBE000, v27, v28, "%{public}s called with null encodedData, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v35);
          goto LABEL_56;
        }
        if (!v36)
          goto LABEL_55;
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v29 = "%{public}s called with null encodedData, no backtrace";
        goto LABEL_54;
      }
      __nwlog_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v29 = "%{public}s called with null encodedData, backtrace limit exceeded";
        goto LABEL_54;
      }
    }
LABEL_55:

  }
LABEL_56:
  if (v26)
    free(v26);

  v13 = 0;
LABEL_21:

  return v13;
}

- (id)encodedData
{
  id v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  char *backtrace_string;
  os_log_type_t v8;
  _BOOL4 v9;
  NSObject *v11;
  os_log_type_t v12;
  char v13;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWBrowseDescriptor encodedData]";
  v3 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v13 = 0;
  if (__nwlog_fault(v3, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (id)gLogObj;
      v5 = type;
      if (!os_log_type_enabled(v4, type))
        goto LABEL_17;
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWBrowseDescriptor encodedData]";
      v6 = "%{public}s encodedData must be overridden";
LABEL_15:
      v11 = v4;
      v12 = v5;
      goto LABEL_16;
    }
    if (!v13)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (id)gLogObj;
      v5 = type;
      if (!os_log_type_enabled(v4, type))
        goto LABEL_17;
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWBrowseDescriptor encodedData]";
      v6 = "%{public}s encodedData must be overridden, backtrace limit exceeded";
      goto LABEL_15;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
    v8 = type;
    v9 = os_log_type_enabled(v4, type);
    if (!backtrace_string)
    {
      if (!v9)
      {
LABEL_17:

        if (!v3)
          return 0;
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWBrowseDescriptor encodedData]";
      v6 = "%{public}s encodedData must be overridden, no backtrace";
      v11 = v4;
      v12 = v8;
LABEL_16:
      _os_log_impl(&dword_182FBE000, v11, v12, v6, buf, 0xCu);
      goto LABEL_17;
    }
    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[NWBrowseDescriptor encodedData]";
      v17 = 2082;
      v18 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v4, v8, "%{public}s encodedData must be overridden, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v3)
LABEL_11:
    free(v3);
  return 0;
}

- (id)createProtocolBufferObject
{
  NWPBBrowseDescriptor *v3;
  NWPBServiceBrowse *v4;
  void *v5;
  NWPBServiceBrowse *v6;
  NWPBServiceBrowse *v7;
  void *v8;
  NWPBServiceBrowse *v9;
  NWPBServiceBrowse *v10;

  v3 = objc_alloc_init(NWPBBrowseDescriptor);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(NWPBServiceBrowse);
    if (v3)
      objc_storeStrong((id *)&v3->_service, v4);

    -[NWBrowseDescriptor type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3->_service;
      v7 = v6;
      if (v6)
        objc_storeStrong((id *)&v6->_type, v5);
    }
    else
    {
      v7 = 0;
    }

    -[NWBrowseDescriptor domain](self, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v9 = v3->_service;
      v10 = v9;
      if (v9)
        objc_storeStrong((id *)&v9->_domain, v8);
    }
    else
    {
      v10 = 0;
    }

  }
  return v3;
}

- (OS_nw_browse_descriptor)internalDescriptor
{
  return self->_internalDescriptor;
}

- (void)setInternalDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_internalDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDescriptor, 0);
}

void __42__NWBrowseDescriptor_initWithEncodedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = *(objc_class **)(a1 + 32);
  v7 = a2;
  v8 = [v6 alloc];
  v9 = nw_browse_descriptor_copy_custom_data(v7);

  v10 = v9;
  v11 = v10;
  if (v10)
    v12 = v10;

  v13 = (void *)objc_msgSend(v8, "initWithEncodedData:", v11);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__NWBrowseDescriptor_initWithEncodedData___block_invoke_2;
  v15[3] = &unk_1E14AB1E8;
  v16 = v5;
  v14 = v5;
  objc_msgSend(v13, "browseWithCompletionHandler:", v15);

}

void __42__NWBrowseDescriptor_initWithEncodedData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = nw_array_create();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "internalEndpoint");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          nw_array_append(v4, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }
  if (nw_context_copy_implicit_context::onceToken[0] != -1)
    dispatch_once(nw_context_copy_implicit_context::onceToken, &__block_literal_global_14);
  v11 = (id)nw_context_copy_implicit_context::implicit_context;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__NWBrowseDescriptor_initWithEncodedData___block_invoke_3;
  v14[3] = &unk_1E14ACE18;
  v12 = *(id *)(a1 + 32);
  v15 = (id)v4;
  v16 = v12;
  v13 = (id)v4;
  nw_queue_context_async(v11, v14);

}

uint64_t __42__NWBrowseDescriptor_initWithEncodedData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (unsigned)descriptorType
{
  return 0;
}

+ (Class)copyClassForDescriptorType:(int)a3
{
  objc_opt_class();
  return (Class)objc_claimAutoreleasedReturnValue();
}

+ (NWBrowseDescriptor)descriptorWithInternalDescriptor:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;

  v3 = a3;
  v4 = +[NWBrowseDescriptor copyClassForDescriptorType:](NWBrowseDescriptor, "copyClassForDescriptorType:", nw_browse_descriptor_get_type(v3));
  v5 = (void *)objc_msgSend([v4 alloc], "initWithDescriptor:", v3);

  return (NWBrowseDescriptor *)v5;
}

+ (BOOL)supportsBrowseCallback
{
  return 0;
}

+ (NWBrowseDescriptor)descriptorWithProtocolBufferData:(id)a3
{
  id v3;
  NWPBBrowseDescriptor *v4;
  NWPBServiceBrowse *service;
  id *v6;
  id v7;
  NWPBServiceBrowse *v8;
  NWPBServiceBrowse *v9;
  NSString *domain;
  NSString *v11;
  void *v12;
  id v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  char *backtrace_string;
  os_log_type_t v19;
  _BOOL4 v20;
  NSObject *v22;
  os_log_type_t v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[NWPBBrowseDescriptor initWithData:]([NWPBBrowseDescriptor alloc], "initWithData:", v3);

  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (__nwlog_fault(v14, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type;
        if (!os_log_type_enabled(v15, type))
          goto LABEL_23;
        *(_DWORD *)buf = 136446210;
        v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
        v17 = "%{public}s [NWPBBrowseDescriptor initWithData:] failed";
LABEL_21:
        v22 = v15;
        v23 = v16;
        goto LABEL_22;
      }
      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type;
        if (!os_log_type_enabled(v15, type))
          goto LABEL_23;
        *(_DWORD *)buf = 136446210;
        v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
        v17 = "%{public}s [NWPBBrowseDescriptor initWithData:] failed, backtrace limit exceeded";
        goto LABEL_21;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      v19 = type;
      v20 = os_log_type_enabled(v15, type);
      if (!backtrace_string)
      {
        if (!v20)
        {
LABEL_23:

          if (!v14)
            goto LABEL_17;
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
        v17 = "%{public}s [NWPBBrowseDescriptor initWithData:] failed, no backtrace";
        v22 = v15;
        v23 = v19;
LABEL_22:
        _os_log_impl(&dword_182FBE000, v22, v23, v17, buf, 0xCu);
        goto LABEL_23;
      }
      if (v20)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
        v28 = 2082;
        v29 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s [NWPBBrowseDescriptor initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v14)
      goto LABEL_17;
LABEL_16:
    free(v14);
    goto LABEL_17;
  }
  service = v4->_service;
  if (!service)
  {
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  v6 = service;
  v7 = v6[2];
  v8 = v4->_service;
  v9 = v8;
  if (v8)
    domain = v8->_domain;
  else
    domain = 0;
  v11 = domain;
  +[NWBonjourBrowseDescriptor descriptorWithType:domain:](NWBonjourBrowseDescriptor, "descriptorWithType:domain:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return (NWBrowseDescriptor *)v12;
}

@end
