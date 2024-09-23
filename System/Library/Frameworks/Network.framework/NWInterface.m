@implementation NWInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalInterface, 0);
}

- (int64_t)type
{
  NSObject *v2;
  int64_t type;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = objc_claimAutoreleasedReturnValue();
  type = nw_interface_get_type(v2);

  return type;
}

- (OS_nw_interface)internalInterface
{
  return (OS_nw_interface *)objc_getProperty(self, a2, 8, 1);
}

- (NWInterface)initWithInterfaceName:(id)a3
{
  char *v4;
  char *v5;
  NWConcrete_nw_interface *v6;
  NWInterface *v7;
  NSObject *v8;
  void *v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  char *backtrace_string;
  _BOOL4 v16;
  char v17;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = nw_interface_create_with_name((char *)objc_msgSend(v4, "UTF8String"));
    if (v6)
    {
      self = -[NWInterface initWithInterface:](self, "initWithInterface:", v6);
      v7 = self;
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[NWInterface initWithInterfaceName:]";
        v21 = 2114;
        v22 = v5;
        _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_ERROR, "%{public}s nw_interface_create_with_name(%{public}@) failed", buf, 0x16u);
      }

      v7 = 0;
    }

    goto LABEL_8;
  }
  __nwlog_obj();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWInterface initWithInterfaceName:]";
  v11 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v17 = 0;
  if (__nwlog_fault(v11, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWInterface initWithInterfaceName:]";
        v14 = "%{public}s called with null interfaceName";
LABEL_22:
        _os_log_impl(&dword_182FBE000, v12, v13, v14, buf, 0xCu);
      }
    }
    else
    {
      if (v17)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = type;
        v16 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            v20 = "-[NWInterface initWithInterfaceName:]";
            v21 = 2082;
            v22 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s called with null interfaceName, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }
        if (!v16)
          goto LABEL_23;
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWInterface initWithInterfaceName:]";
        v14 = "%{public}s called with null interfaceName, no backtrace";
        goto LABEL_22;
      }
      __nwlog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWInterface initWithInterfaceName:]";
        v14 = "%{public}s called with null interfaceName, backtrace limit exceeded";
        goto LABEL_22;
      }
    }
LABEL_23:

  }
LABEL_24:
  if (v11)
    free(v11);
  v7 = 0;
LABEL_8:

  return v7;
}

- (NWInterface)initWithInterface:(id)a3
{
  id v5;
  NWInterface *v6;
  NWInterface *v7;
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
    v23.super_class = (Class)NWInterface;
    v6 = -[NWInterface init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalInterface, a3);
      goto LABEL_4;
    }
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWInterface initWithInterface:]";
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
        v27 = "-[NWInterface initWithInterface:]";
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
          v27 = "-[NWInterface initWithInterface:]";
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
        v27 = "-[NWInterface initWithInterface:]";
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
        v27 = "-[NWInterface initWithInterface:]";
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
  v27 = "-[NWInterface initWithInterface:]";
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
        v27 = "-[NWInterface initWithInterface:]";
        v13 = "%{public}s called with null interface";
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
            v27 = "-[NWInterface initWithInterface:]";
            v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null interface, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v13 = "%{public}s called with null interface, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v13 = "%{public}s called with null interface, backtrace limit exceeded";
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

- (NWInterface)initWithInterfaceIndex:(unint64_t)a3
{
  int v4;
  NWConcrete_nw_interface *v5;
  NWInterface *v6;
  id v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  NSObject *v12;
  char *backtrace_string;
  os_log_type_t v14;
  _BOOL4 v15;
  NSObject *v17;
  os_log_type_t v18;
  char v19;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v22 = "-[NWInterface initWithInterfaceIndex:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v19 = 0;
    if (__nwlog_fault(v8, &type, &v19))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v10 = type;
        if (!os_log_type_enabled(v9, type))
          goto LABEL_25;
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWInterface initWithInterfaceIndex:]";
        v11 = "%{public}s called with null interfaceIndex";
LABEL_23:
        v17 = v9;
        v18 = v10;
        goto LABEL_24;
      }
      if (!v19)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v10 = type;
        if (!os_log_type_enabled(v9, type))
          goto LABEL_25;
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWInterface initWithInterfaceIndex:]";
        v11 = "%{public}s called with null interfaceIndex, backtrace limit exceeded";
        goto LABEL_23;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      v14 = type;
      v15 = os_log_type_enabled(v9, type);
      if (!backtrace_string)
      {
        if (!v15)
        {
LABEL_25:

          if (!v8)
            goto LABEL_19;
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWInterface initWithInterfaceIndex:]";
        v11 = "%{public}s called with null interfaceIndex, no backtrace";
        v17 = v9;
        v18 = v14;
LABEL_24:
        _os_log_impl(&dword_182FBE000, v17, v18, v11, buf, 0xCu);
        goto LABEL_25;
      }
      if (v15)
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[NWInterface initWithInterfaceIndex:]";
        v23 = 2082;
        v24 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v9, v14, "%{public}s called with null interfaceIndex, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v8)
    {
LABEL_19:
      v6 = 0;
      goto LABEL_20;
    }
LABEL_18:
    free(v8);
    goto LABEL_19;
  }
  v4 = a3;
  v5 = nw_interface_create_with_index(a3);
  if (v5)
  {
    self = -[NWInterface initWithInterface:](self, "initWithInterface:", v5);
    v6 = self;
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "-[NWInterface initWithInterfaceIndex:]";
      v23 = 1024;
      LODWORD(v24) = v4;
      _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_ERROR, "%{public}s nw_interface_create_with_index(%u) failed", buf, 0x12u);
    }

    v6 = 0;
  }

LABEL_20:
  return v6;
}

- (NWInterface)initWithCoder:(id)a3
{
  id v4;
  NWInterface *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  xpc_object_t XPCDictionaryFromNSDictionary;
  void *v16;
  NWConcrete_nw_interface *v17;
  void *v18;
  NWInterface *v19;
  id v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  id v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  char *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  id v33;
  char *backtrace_string;
  os_log_type_t v35;
  _BOOL4 v36;
  const char *v37;
  _BOOL4 v38;
  NSObject *v40;
  os_log_type_t v41;
  NSObject *v42;
  os_log_type_t v43;
  void *v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  const char *v48;
  char *v49;
  _BOOL4 v50;
  char v51;
  os_log_type_t type;
  objc_super v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NWInterface;
  v5 = -[NWInterface init](&v53, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("dictionary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      XPCDictionaryFromNSDictionary = NWUtilsCreateXPCDictionaryFromNSDictionary(v13);
      v16 = XPCDictionaryFromNSDictionary;
      if (XPCDictionaryFromNSDictionary)
      {
        v17 = nw_interface_create_from_dictionary(XPCDictionaryFromNSDictionary);
        -[NWInterface setInternalInterface:](v5, "setInternalInterface:", v17);

        -[NWInterface internalInterface](v5, "internalInterface");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = v5;
LABEL_39:

          goto LABEL_40;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v33 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v26 = (void *)_os_log_send_and_compose_impl();

        type = OS_LOG_TYPE_ERROR;
        v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51))
        {
LABEL_36:
          if (!v26)
          {
LABEL_38:
            v19 = 0;
            goto LABEL_39;
          }
LABEL_37:
          free(v26);
          goto LABEL_38;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          v28 = type;
          if (!os_log_type_enabled(v27, type))
            goto LABEL_58;
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWInterface initWithCoder:]";
          v29 = "%{public}s nw_interface_create_from_dictionary failed";
          goto LABEL_56;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          v28 = type;
          if (!os_log_type_enabled(v27, type))
            goto LABEL_58;
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWInterface initWithCoder:]";
          v29 = "%{public}s nw_interface_create_from_dictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        v35 = type;
        v38 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v38)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWInterface initWithCoder:]";
            v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s nw_interface_create_from_dictionary failed, dumping backtrace:%{public}s";
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        if (!v38)
        {
LABEL_58:

          if (!v26)
            goto LABEL_38;
          goto LABEL_37;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v29 = "%{public}s nw_interface_create_from_dictionary failed, no backtrace";
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v25 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v26 = (void *)_os_log_send_and_compose_impl();

        type = OS_LOG_TYPE_ERROR;
        v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51))
          goto LABEL_36;
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          v28 = type;
          if (!os_log_type_enabled(v27, type))
            goto LABEL_58;
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWInterface initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed";
LABEL_56:
          v42 = v27;
          v43 = v28;
LABEL_57:
          _os_log_impl(&dword_182FBE000, v42, v43, v29, buf, 0xCu);
          goto LABEL_58;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          v28 = type;
          if (!os_log_type_enabled(v27, type))
            goto LABEL_58;
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWInterface initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        v35 = type;
        v36 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWInterface initWithCoder:]";
            v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, dumping backtrace:%{public}s";
LABEL_34:
            _os_log_impl(&dword_182FBE000, v27, v35, v37, buf, 0x16u);
          }
LABEL_35:

          free(backtrace_string);
          goto LABEL_36;
        }
        if (!v36)
          goto LABEL_58;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, no backtrace";
      }
      v42 = v27;
      v43 = v35;
      goto LABEL_57;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v20 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v55 = "-[NWInterface initWithCoder:]";
    v21 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v51 = 0;
    if (__nwlog_fault(v21, &type, &v51))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        v23 = type;
        if (!os_log_type_enabled(v22, type))
          goto LABEL_46;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed";
LABEL_44:
        v40 = v22;
        v41 = v23;
        goto LABEL_45;
      }
      if (!v51)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        v23 = type;
        if (!os_log_type_enabled(v22, type))
          goto LABEL_46;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed, backtrace limit exceeded";
        goto LABEL_44;
      }
      v30 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v22 = (id)gLogObj;
      v31 = type;
      v32 = os_log_type_enabled(v22, type);
      if (!v30)
      {
        if (!v32)
        {
LABEL_46:

          if (!v21)
            goto LABEL_21;
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed, no backtrace";
        v40 = v22;
        v41 = v31;
LABEL_45:
        _os_log_impl(&dword_182FBE000, v40, v41, v24, buf, 0xCu);
        goto LABEL_46;
      }
      if (v32)
      {
        *(_DWORD *)buf = 136446466;
        v55 = "-[NWInterface initWithCoder:]";
        v56 = 2082;
        v57 = v30;
        _os_log_impl(&dword_182FBE000, v22, v31, "%{public}s decodeObjectOfClasses:forKey failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v30);
    }
    if (!v21)
    {
LABEL_21:
      v19 = 0;
LABEL_40:

      goto LABEL_41;
    }
LABEL_20:
    free(v21);
    goto LABEL_21;
  }
  __nwlog_obj();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v55 = "-[NWInterface initWithCoder:]";
  v45 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v51 = 0;
  if (__nwlog_fault(v45, &type, &v51))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v48 = "%{public}s [super init] failed";
LABEL_76:
        _os_log_impl(&dword_182FBE000, v46, v47, v48, buf, 0xCu);
      }
    }
    else
    {
      if (v51)
      {
        v49 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = type;
        v50 = os_log_type_enabled(v46, type);
        if (v49)
        {
          if (v50)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWInterface initWithCoder:]";
            v56 = 2082;
            v57 = v49;
            _os_log_impl(&dword_182FBE000, v46, v47, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v49);
          goto LABEL_78;
        }
        if (!v50)
          goto LABEL_77;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v48 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_76;
      }
      __nwlog_obj();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v48 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_76;
      }
    }
LABEL_77:

  }
LABEL_78:
  if (v45)
    free(v45);
  v19 = 0;
LABEL_41:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  id v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  char *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  char *backtrace_string;
  os_log_type_t v25;
  _BOOL4 v26;
  NSObject *v27;
  os_log_type_t v28;
  NSObject *v29;
  os_log_type_t v30;
  char v31;
  os_log_type_t type;
  _BYTE applier[24];
  void *v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NWInterface internalInterface](self, "internalInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = nw_interface_copy_dictionary(v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    v8 = v6;
    objc_msgSend(v7, "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)applier = MEMORY[0x1E0C809B0];
    *(_QWORD *)&applier[8] = 3221225472;
    *(_QWORD *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    v34 = &unk_1E14A8E38;
    v10 = v9;
    v35 = v10;
    xpc_dictionary_apply(v8, applier);

    if (v10)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dictionary"));
LABEL_39:

      goto LABEL_40;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    v17 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v31 = 0;
    if (!__nwlog_fault((const char *)v17, &type, &v31))
    {
LABEL_37:
      if (v17)
        free(v17);
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed";
LABEL_34:
        v29 = v18;
        v30 = v19;
LABEL_35:
        _os_log_impl(&dword_182FBE000, v29, v30, v20, applier, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v25 = type;
        v26 = os_log_type_enabled(v18, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)applier = 136446466;
            *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
            *(_WORD *)&applier[12] = 2082;
            *(_QWORD *)&applier[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v18, v25, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_37;
        }
        if (!v26)
          goto LABEL_36;
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, no backtrace";
        v29 = v18;
        v30 = v25;
        goto LABEL_35;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded";
        goto LABEL_34;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v11 = (id)gLogObj;
  *(_DWORD *)applier = 136446210;
  *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v31 = 0;
  if (!__nwlog_fault(v12, &type, &v31))
    goto LABEL_17;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    v14 = type;
    if (!os_log_type_enabled(v13, type))
      goto LABEL_28;
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    v15 = "%{public}s nw_interface_copy_dictionary failed";
LABEL_26:
    v27 = v13;
    v28 = v14;
LABEL_27:
    _os_log_impl(&dword_182FBE000, v27, v28, v15, applier, 0xCu);
    goto LABEL_28;
  }
  if (!v31)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    v14 = type;
    if (!os_log_type_enabled(v13, type))
      goto LABEL_28;
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    v15 = "%{public}s nw_interface_copy_dictionary failed, backtrace limit exceeded";
    goto LABEL_26;
  }
  v21 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v13 = (id)gLogObj;
  v22 = type;
  v23 = os_log_type_enabled(v13, type);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)applier = 136446466;
      *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
      *(_WORD *)&applier[12] = 2082;
      *(_QWORD *)&applier[14] = v21;
      _os_log_impl(&dword_182FBE000, v13, v22, "%{public}s nw_interface_copy_dictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
    }

    free(v21);
LABEL_17:
    if (!v12)
      goto LABEL_40;
    goto LABEL_29;
  }
  if (v23)
  {
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    v15 = "%{public}s nw_interface_copy_dictionary failed, no backtrace";
    v27 = v13;
    v28 = v22;
    goto LABEL_27;
  }
LABEL_28:

  if (v12)
LABEL_29:
    free(v12);
LABEL_40:

}

- (id)copyWithZone:(_NSZone *)a3
{
  NWInterface *v4;
  void *v5;
  NWInterface *v6;

  v4 = +[NWInterface allocWithZone:](NWInterface, "allocWithZone:", a3);
  -[NWInterface internalInterface](self, "internalInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NWInterface initWithInterface:](v4, "initWithInterface:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NWInterface *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = (NWInterface *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NWInterface internalInterface](self, "internalInterface");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWInterface internalInterface](v4, "internalInterface");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = nw_interface_shallow_compare(v5, v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t shallow_hash;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  shallow_hash = nw_interface_get_shallow_hash(v2);

  return shallow_hash;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  +[NWInterface descriptionForType:](NWInterface, "descriptionForType:", -[NWInterface type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("type"), v5, 1);

  +[NWInterface descriptionForSubtype:](NWInterface, "descriptionForSubtype:", -[NWInterface subtype](self, "subtype"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("subtype"), v5, 1);

  if (v4)
  {
    -[NWInterface interfaceName](self, "interfaceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("interfaceName"), v5, 1);

    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWInterface interfaceIndex](self, "interfaceIndex"), CFSTR("interfaceIndex"), v5);
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWInterface generation](self, "generation"), CFSTR("generation"), v5);
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWInterface mtu](self, "mtu"), CFSTR("mtu"), v5);
    -[NWInterface ipv4Netmask](self, "ipv4Netmask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("ipv4Netmask"), v5, 1);

    -[NWInterface ipv4Broadcast](self, "ipv4Broadcast");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v12, CFSTR("ipv4Broadcast"), v5, 1);

    if (-[NWInterface supportsMulticast](self, "supportsMulticast"))
      objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("supportsMulticast"), v5);
    if (-[NWInterface hasDNS](self, "hasDNS"))
      objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("hasDNS"), v5);
    if (-[NWInterface hasNAT64](self, "hasNAT64"))
      objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("hasNAT64"), v5);
    if (-[NWInterface isIPv4Routable](self, "isIPv4Routable"))
      objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("ipv4Routable"), v5);
    if (-[NWInterface isIPv6Routable](self, "isIPv6Routable"))
      objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("ipv6Routable"), v5);
  }
  if (-[NWInterface isExpensive](self, "isExpensive"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("expensive"), v5);
  if (-[NWInterface isConstrained](self, "isConstrained"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("constrained"), v5);
  if (-[NWInterface isUltraConstrained](self, "isUltraConstrained"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("ultraConstrained"), v5);
  return v7;
}

- (id)description
{
  return -[NWInterface descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSString)privateDescription
{
  return (NSString *)-[NWInterface descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (NSString)interfaceName
{
  char *v2;
  void *v3;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (char *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2 + 104);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)interfaceIndex
{
  unsigned int *v2;
  unint64_t v3;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[2];
  else
    v3 = 0;

  return v3;
}

- (int64_t)subtype
{
  void *v2;
  int64_t subtype;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  subtype = nw_interface_get_subtype(v2);

  return subtype;
}

- (BOOL)isExpensive
{
  void *v2;
  char is_expensive;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_expensive = nw_interface_is_expensive(v2);

  return is_expensive;
}

- (BOOL)isConstrained
{
  void *v2;
  char is_constrained;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_constrained = nw_interface_is_constrained(v2);

  return is_constrained;
}

- (BOOL)isUltraConstrained
{
  void *v2;
  char is_ultra_constrained;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_ultra_constrained = nw_interface_is_ultra_constrained(v2);

  return is_ultra_constrained;
}

- (BOOL)supportsMulticast
{
  void *v2;
  char v3;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_interface_supports_multicast(v2);

  return v3;
}

- (BOOL)hasDNS
{
  void *v2;
  char has_dns;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_dns = nw_interface_has_dns(v2);

  return has_dns;
}

- (BOOL)hasNAT64
{
  void *v2;
  char has_nat64;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_nat64 = nw_interface_has_nat64(v2);

  return has_nat64;
}

- (BOOL)isIPv4Routable
{
  void *v2;
  char is_ipv4_routable;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_ipv4_routable = nw_interface_is_ipv4_routable(v2);

  return is_ipv4_routable;
}

- (BOOL)isIPv6Routable
{
  void *v2;
  char is_ipv6_routable;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_ipv6_routable = nw_interface_is_ipv6_routable(v2);

  return is_ipv6_routable;
}

- (int64_t)mtu
{
  void *v2;
  int64_t mtu;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  mtu = (int)nw_interface_get_mtu(v2);

  return mtu;
}

- (unint64_t)generation
{
  void *v2;
  unint64_t generation;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  generation = nw_interface_get_generation(v2);

  return generation;
}

- (NWInterface)delegateInterface
{
  void *v2;
  NWConcrete_nw_interface *v3;
  NWInterface *v4;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_interface_copy_delegate_interface(v2);

  if (v3)
    v4 = -[NWInterface initWithInterfaceIndex:]([NWInterface alloc], "initWithInterfaceIndex:", v3->index);
  else
    v4 = 0;

  return v4;
}

- (id)ipv4Netmask
{
  void *v2;
  nw_endpoint_t v3;
  void *v4;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_interface_copy_ipv4_netmask_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithCEndpoint:](NWEndpoint, "endpointWithCEndpoint:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)ipv4Broadcast
{
  void *v2;
  nw_endpoint_t v3;
  void *v4;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_interface_copy_ipv4_broadcast_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithCEndpoint:](NWEndpoint, "endpointWithCEndpoint:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isShallowEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[NWInterface internalInterface](self, "internalInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = nw_interface_shallow_compare(v5, v6);
  return (char)v4;
}

- (BOOL)isDeepEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[NWInterface internalInterface](self, "internalInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = nw_interface_deep_compare(v5, v6);
  return (char)v4;
}

- (NSString)typeString
{
  NSObject *v2;
  void *v3;

  -[NWInterface internalInterface](self, "internalInterface");
  v2 = objc_claimAutoreleasedReturnValue();
  +[NWInterface descriptionForType:](NWInterface, "descriptionForType:", nw_interface_get_type(v2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)createProtocolBufferObject
{
  NWPBInterface *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  BOOL v13;

  v3 = objc_alloc_init(NWPBInterface);
  -[NWInterface interfaceName](self, "interfaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_name, v4);

    v6 = -[NWInterface interfaceIndex](self, "interfaceIndex");
    *(_BYTE *)&v3->_has |= 4u;
    v3->_index = v6;
  }
  else
  {

    -[NWInterface interfaceIndex](self, "interfaceIndex");
  }
  -[NWInterface delegateInterface](self, "delegateInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceIndex");
  if (v3)
  {
    *(_BYTE *)&v3->_has |= 1u;
    v3->_delegateIndex = v8;

    v9 = -[NWInterface mtu](self, "mtu");
    *(_BYTE *)&v3->_has |= 8u;
    v3->_mtu = v9;
    v10 = -[NWInterface generation](self, "generation");
    *(_BYTE *)&v3->_has |= 2u;
    v3->_generation = v10;
    v11 = -[NWInterface type](self, "type");
    *(_BYTE *)&v3->_has |= 0x20u;
    v3->_type = v11;
    v12 = -[NWInterface subtype](self, "subtype");
    *(_BYTE *)&v3->_has |= 0x10u;
    v3->_subtype = v12;
    v13 = -[NWInterface isExpensive](self, "isExpensive");
    *(_BYTE *)&v3->_has |= 0x40u;
    v3->_expensive = v13;
  }
  else
  {

    -[NWInterface mtu](self, "mtu");
    -[NWInterface generation](self, "generation");
    -[NWInterface type](self, "type");
    -[NWInterface subtype](self, "subtype");
    -[NWInterface isExpensive](self, "isExpensive");
  }
  return v3;
}

- (void)setInternalInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForType:(int64_t)a3
{
  const char *v3;

  if (a3 > 4)
    v3 = "unknown";
  else
    v3 = off_1E14AD0B0[a3];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
}

+ (id)descriptionForSubtype:(int64_t)a3
{
  const char *v3;

  if ((int)a3 <= 1001)
  {
    if (!(_DWORD)a3)
    {
      v3 = "other";
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    }
    if ((_DWORD)a3 == 1001)
    {
      v3 = "wifi_infrastructure";
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    }
LABEL_13:
    v3 = "unknown";
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  }
  if ((_DWORD)a3 == 1002)
  {
    v3 = "wifi_awdl";
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  }
  if ((_DWORD)a3 == 4001)
  {
    v3 = "coprocessor";
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  }
  if ((_DWORD)a3 != 5001)
    goto LABEL_13;
  v3 = "companion";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
}

+ (NWInterface)interfaceWithProtocolBufferData:(id)a3
{
  id v3;
  NWPBInterface *v4;
  NSString *v5;
  unsigned __int8 *v6;
  int v7;
  int subtype;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  NWConcrete_nw_interface *v14;
  NWInterface *v15;
  char *backtrace_string;
  os_log_type_t v17;
  _BOOL4 v18;
  NSObject *v20;
  os_log_type_t v21;
  char v22;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[NWPBInterface initWithData:]([NWPBInterface alloc], "initWithData:", v3);

  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
    v10 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v22 = 0;
    if (__nwlog_fault(v10, &type, &v22))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (!os_log_type_enabled(v11, type))
          goto LABEL_28;
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
        v13 = "%{public}s [NWPBInterface initWithData:] failed";
LABEL_26:
        v20 = v11;
        v21 = v12;
        goto LABEL_27;
      }
      if (!v22)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (!os_log_type_enabled(v11, type))
          goto LABEL_28;
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
        v13 = "%{public}s [NWPBInterface initWithData:] failed, backtrace limit exceeded";
        goto LABEL_26;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      v17 = type;
      v18 = os_log_type_enabled(v11, type);
      if (!backtrace_string)
      {
        if (!v18)
        {
LABEL_28:

          if (!v10)
            goto LABEL_22;
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
        v13 = "%{public}s [NWPBInterface initWithData:] failed, no backtrace";
        v20 = v11;
        v21 = v17;
LABEL_27:
        _os_log_impl(&dword_182FBE000, v20, v21, v13, buf, 0xCu);
        goto LABEL_28;
      }
      if (v18)
      {
        *(_DWORD *)buf = 136446466;
        v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
        v26 = 2082;
        v27 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v11, v17, "%{public}s [NWPBInterface initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v10)
    {
LABEL_22:
      v15 = 0;
      goto LABEL_23;
    }
LABEL_21:
    free(v10);
    goto LABEL_22;
  }
  v5 = v4->_name;
  v6 = -[NSString UTF8String](v5, "UTF8String");
  if ((*(_BYTE *)&v4->_has & 0x20) != 0)
  {
    v7 = v4->_type;
    if ((*(_BYTE *)&v4->_has & 0x10) != 0)
      goto LABEL_4;
LABEL_10:
    subtype = 0;
    goto LABEL_11;
  }
  v7 = 0;
  if ((*(_BYTE *)&v4->_has & 0x10) == 0)
    goto LABEL_10;
LABEL_4:
  subtype = v4->_subtype;
LABEL_11:
  v14 = nw_interface_create_static(v6, v4->_index, v7, subtype, v4->_generation, v4->_delegateIndex, v4->_expensive, 0, v4->_mtu, 0, 0);
  if (v14)
    v15 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v14);
  else
    v15 = 0;

LABEL_23:
  return v15;
}

- (NWInterface)initWithInterfaceIndex:(unint64_t)a3 interfaceName:(id)a4
{
  id v6;
  void *v7;
  NWConcrete_nw_interface *v8;
  NWInterface *v9;
  NSObject *v10;
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
  void *v27;
  char *v28;
  _BOOL4 v29;
  const char *v30;
  _BOOL4 v31;
  char v32;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  _WORD v37[17];

  *(_QWORD *)&v37[13] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (v6)
    {
      v8 = nw_interface_create_with_index_and_name(a3, (unsigned __int8 *)objc_msgSend(v6, "UTF8String"));
      if (v8)
      {
        self = -[NWInterface initWithInterface:](self, "initWithInterface:", v8);
        v9 = self;
LABEL_19:

        goto LABEL_20;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
        v36 = 1024;
        *(_DWORD *)v37 = a3;
        v37[2] = 2114;
        *(_QWORD *)&v37[3] = v7;
        _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_ERROR, "%{public}s nw_interface_create_with_index_and_name failed for index, name (%u, %{public}@)", buf, 0x1Cu);
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
      v12 = (char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v32 = 0;
      if (__nwlog_fault(v12, &type, &v32))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v13 = (id)gLogObj;
          v14 = type;
          if (!os_log_type_enabled(v13, type))
            goto LABEL_25;
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v15 = "%{public}s nw_interface_create_with_index_and_name failed";
LABEL_23:
          v20 = v13;
          v21 = v14;
          goto LABEL_24;
        }
        if (!v32)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v13 = (id)gLogObj;
          v14 = type;
          if (!os_log_type_enabled(v13, type))
            goto LABEL_25;
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v15 = "%{public}s nw_interface_create_with_index_and_name failed, backtrace limit exceeded";
          goto LABEL_23;
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
LABEL_25:

            if (!v12)
              goto LABEL_18;
            goto LABEL_17;
          }
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v15 = "%{public}s nw_interface_create_with_index_and_name failed, no backtrace";
          v20 = v13;
          v21 = v17;
LABEL_24:
          _os_log_impl(&dword_182FBE000, v20, v21, v15, buf, 0xCu);
          goto LABEL_25;
        }
        if (v18)
        {
          *(_DWORD *)buf = 136446466;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v36 = 2082;
          *(_QWORD *)v37 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v13, v17, "%{public}s nw_interface_create_with_index_and_name failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
      }
      if (!v12)
      {
LABEL_18:
        v9 = 0;
        goto LABEL_19;
      }
LABEL_17:
      free(v12);
      goto LABEL_18;
    }
    __nwlog_obj();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
    v23 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (__nwlog_fault(v23, &type, &v32))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v26 = "%{public}s called with null interfaceName";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      if (!v32)
      {
        __nwlog_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v26 = "%{public}s called with null interfaceName, backtrace limit exceeded";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      v28 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = type;
      v31 = os_log_type_enabled(v24, type);
      if (!v28)
      {
        if (v31)
        {
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v26 = "%{public}s called with null interfaceName, no backtrace";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      if (!v31)
        goto LABEL_46;
      *(_DWORD *)buf = 136446466;
      v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
      v36 = 2082;
      *(_QWORD *)v37 = v28;
      v30 = "%{public}s called with null interfaceName, dumping backtrace:%{public}s";
LABEL_45:
      _os_log_impl(&dword_182FBE000, v24, v25, v30, buf, 0x16u);
LABEL_46:

      free(v28);
    }
  }
  else
  {
    __nwlog_obj();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
    v23 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (__nwlog_fault(v23, &type, &v32))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v26 = "%{public}s called with null interfaceIndex";
LABEL_55:
          _os_log_impl(&dword_182FBE000, v24, v25, v26, buf, 0xCu);
        }
LABEL_56:

        goto LABEL_57;
      }
      if (!v32)
      {
        __nwlog_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v26 = "%{public}s called with null interfaceIndex, backtrace limit exceeded";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      v28 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = type;
      v29 = os_log_type_enabled(v24, type);
      if (!v28)
      {
        if (v29)
        {
          *(_DWORD *)buf = 136446210;
          v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          v26 = "%{public}s called with null interfaceIndex, no backtrace";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      if (!v29)
        goto LABEL_46;
      *(_DWORD *)buf = 136446466;
      v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
      v36 = 2082;
      *(_QWORD *)v37 = v28;
      v30 = "%{public}s called with null interfaceIndex, dumping backtrace:%{public}s";
      goto LABEL_45;
    }
  }
LABEL_57:
  if (v23)
    free(v23);
  v9 = 0;
LABEL_20:

  return v9;
}

- (id)copyLocalAddressForRemoteAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  nw_endpoint_t v7;
  void *v8;

  v4 = a3;
  -[NWInterface internalInterface](self, "internalInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = nw_interface_copy_local_address_for_remote_address(v5, v6);
  if (v7)
  {
    +[NWEndpoint endpointWithCEndpoint:](NWEndpoint, "endpointWithCEndpoint:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyLocalAddressForDefaultIPv6
{
  void *v3;
  id v4;

  +[NWAddressEndpoint endpointWithHostname:port:](NWAddressEndpoint, "endpointWithHostname:port:", CFSTR("::"), CFSTR("0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NWInterface copyLocalAddressForRemoteAddress:](self, "copyLocalAddressForRemoteAddress:", v3);

  return v4;
}

- (id)copyLocalAddressForDefaultIPv4
{
  void *v3;
  id v4;

  +[NWAddressEndpoint endpointWithHostname:port:](NWAddressEndpoint, "endpointWithHostname:port:", CFSTR("0.0.0.0"), CFSTR("0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NWInterface copyLocalAddressForRemoteAddress:](self, "copyLocalAddressForRemoteAddress:", v3);

  return v4;
}

@end
