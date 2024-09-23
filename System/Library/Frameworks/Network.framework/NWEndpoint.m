@implementation NWEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalEndpoint, 0);
}

+ (NWEndpoint)endpointWithCEndpoint:(id)a3
{
  return +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return -[NWEndpoint descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSData)txtRecord
{
  NSObject *v2;
  nw_txt_record_t v3;
  Class isa;
  Class v5;
  BOOL v6;
  void *v7;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_endpoint_copy_txt_record(v2);

  if (!v3 || ((isa = v3[1].isa, v5 = v3[2].isa, isa) ? (v6 = v5 == 0) : (v6 = 1), v6))
    v7 = 0;
  else
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", isa, v5);

  return (NSData *)v7;
}

- (id)copyCEndpoint
{
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NWEndpoint)initWithCoder:(id)a3
{
  id v4;
  NWEndpoint *v5;
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
  NSObject *v17;
  void *v18;
  NWEndpoint *v19;
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
  v53.super_class = (Class)NWEndpoint;
  v5 = -[NWEndpoint init](&v53, sel_init);
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
        v17 = nw_endpoint_create_from_dictionary(XPCDictionaryFromNSDictionary);
        -[NWEndpoint setInternalEndpoint:](v5, "setInternalEndpoint:", v17);

        -[NWEndpoint internalEndpoint](v5, "internalEndpoint");
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
        v55 = "-[NWEndpoint initWithCoder:]";
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
          v55 = "-[NWEndpoint initWithCoder:]";
          v29 = "%{public}s nw_endpoint_create_from_dictionary failed";
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
          v55 = "-[NWEndpoint initWithCoder:]";
          v29 = "%{public}s nw_endpoint_create_from_dictionary failed, backtrace limit exceeded";
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
            v55 = "-[NWEndpoint initWithCoder:]";
            v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s nw_endpoint_create_from_dictionary failed, dumping backtrace:%{public}s";
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
        v55 = "-[NWEndpoint initWithCoder:]";
        v29 = "%{public}s nw_endpoint_create_from_dictionary failed, no backtrace";
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v25 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
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
          v55 = "-[NWEndpoint initWithCoder:]";
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
          v55 = "-[NWEndpoint initWithCoder:]";
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
            v55 = "-[NWEndpoint initWithCoder:]";
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
        v55 = "-[NWEndpoint initWithCoder:]";
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
    v55 = "-[NWEndpoint initWithCoder:]";
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
        v55 = "-[NWEndpoint initWithCoder:]";
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
        v55 = "-[NWEndpoint initWithCoder:]";
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
        v55 = "-[NWEndpoint initWithCoder:]";
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
        v55 = "-[NWEndpoint initWithCoder:]";
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
  v55 = "-[NWEndpoint initWithCoder:]";
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
        v55 = "-[NWEndpoint initWithCoder:]";
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
            v55 = "-[NWEndpoint initWithCoder:]";
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
        v55 = "-[NWEndpoint initWithCoder:]";
        v48 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_76;
      }
      __nwlog_obj();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
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
  id v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  char *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  char *backtrace_string;
  os_log_type_t v23;
  _BOOL4 v24;
  os_log_type_t v25;
  os_log_type_t v26;
  char v27;
  os_log_type_t type;
  _BYTE applier[24];
  void *v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyDictionary");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    v8 = v6;
    objc_msgSend(v7, "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)applier = MEMORY[0x1E0C809B0];
    *(_QWORD *)&applier[8] = 3221225472;
    *(_QWORD *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    v30 = &unk_1E14A8E38;
    v10 = v9;
    v31 = v10;
    xpc_dictionary_apply(v8, applier);

    if (v10)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dictionary"));
LABEL_18:

      goto LABEL_19;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v27 = 0;
    if (__nwlog_fault(v16, &type, &v27))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v17 = (id)gLogObj;
        v18 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)applier = 136446210;
          *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed", applier, 0xCu);
        }
      }
      else if (v27)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v17 = (id)gLogObj;
        v23 = type;
        v24 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)applier = 136446466;
            *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
            *(_WORD *)&applier[12] = 2082;
            *(_QWORD *)&applier[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v17, v23, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
          }

          free(backtrace_string);
          if (!v16)
            goto LABEL_18;
          goto LABEL_17;
        }
        if (v24)
        {
          *(_DWORD *)applier = 136446210;
          *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl(&dword_182FBE000, v17, v23, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, no backtrace", applier, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v17 = (id)gLogObj;
        v26 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)applier = 136446210;
          *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl(&dword_182FBE000, v17, v26, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded", applier, 0xCu);
        }
      }

    }
    if (!v16)
      goto LABEL_18;
LABEL_17:
    free(v16);
    goto LABEL_18;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v11 = (id)gLogObj;
  *(_DWORD *)applier = 136446210;
  *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v27 = 0;
  if (__nwlog_fault(v12, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s nw_endpoint_copy_dictionary failed", applier, 0xCu);
      }
    }
    else if (v27)
    {
      v19 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v20 = type;
      v21 = os_log_type_enabled(v13, type);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)applier = 136446466;
          *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          *(_WORD *)&applier[12] = 2082;
          *(_QWORD *)&applier[14] = v19;
          _os_log_impl(&dword_182FBE000, v13, v20, "%{public}s nw_endpoint_copy_dictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
        }

        free(v19);
        if (v12)
          goto LABEL_10;
        goto LABEL_19;
      }
      if (v21)
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl(&dword_182FBE000, v13, v20, "%{public}s nw_endpoint_copy_dictionary failed, no backtrace", applier, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v25 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl(&dword_182FBE000, v13, v25, "%{public}s nw_endpoint_copy_dictionary failed, backtrace limit exceeded", applier, 0xCu);
      }
    }

  }
  if (v12)
LABEL_10:
    free(v12);
LABEL_19:

}

- (OS_nw_endpoint)internalEndpoint
{
  return self->_internalEndpoint;
}

- (void)setInternalEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_internalEndpoint, a3);
}

- (NSString)parentEndpointDomain
{
  void *v2;
  _BOOL8 parent_endpoint_domain;
  void *v4;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  parent_endpoint_domain = nw_endpoint_get_parent_endpoint_domain((uint64_t)v2);

  if (parent_endpoint_domain)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", parent_endpoint_domain);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

+ (NWEndpoint)endpointWithInternalEndpoint:(id)a3
{
  NSObject *v3;
  objc_class *v4;
  void *v5;

  v3 = a3;
  v4 = +[NWEndpoint copyClassForEndpointType:](NWEndpoint, "copyClassForEndpointType:", nw_endpoint_get_type(v3));
  v5 = (void *)objc_msgSend([v4 alloc], "initWithEndpoint:", v3);

  return (NWEndpoint *)v5;
}

- (NWEndpoint)initWithEndpoint:(id)a3
{
  id v5;
  NWEndpoint *v6;
  NWEndpoint *v7;
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
    v23.super_class = (Class)NWEndpoint;
    v6 = -[NWEndpoint init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalEndpoint, a3);
      goto LABEL_4;
    }
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWEndpoint initWithEndpoint:]";
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
        v27 = "-[NWEndpoint initWithEndpoint:]";
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
          v27 = "-[NWEndpoint initWithEndpoint:]";
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
        v27 = "-[NWEndpoint initWithEndpoint:]";
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
        v27 = "-[NWEndpoint initWithEndpoint:]";
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
  v27 = "-[NWEndpoint initWithEndpoint:]";
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
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint";
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
            v27 = "-[NWEndpoint initWithEndpoint:]";
            v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null internalEndpoint, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint, backtrace limit exceeded";
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

+ (Class)copyClassForEndpointType:(int)a3
{
  objc_opt_class();
  return (Class)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEndpoint:", v5);

  return v6;
}

- (void)resolveEndpointWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  char *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  char *backtrace_string;
  os_log_type_t v18;
  _BOOL4 v19;
  NSObject *v20;
  os_log_type_t v21;
  NSObject *v22;
  os_log_type_t v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  NWEndpoint *v29;
  __int16 v30;
  char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v5 = (id)gLogObj;
  if (!v4)
  {
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
    v10 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (__nwlog_fault(v10, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (!os_log_type_enabled(v11, type))
          goto LABEL_38;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        v13 = "%{public}s called with null completionHandler";
LABEL_36:
        v22 = v11;
        v23 = v12;
        goto LABEL_37;
      }
      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (!os_log_type_enabled(v11, type))
          goto LABEL_38;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        v13 = "%{public}s called with null completionHandler, backtrace limit exceeded";
        goto LABEL_36;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      v18 = type;
      v19 = os_log_type_enabled(v11, type);
      if (!backtrace_string)
      {
        if (!v19)
        {
LABEL_38:

          if (!v10)
            goto LABEL_25;
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        v13 = "%{public}s called with null completionHandler, no backtrace";
        v22 = v11;
        v23 = v18;
LABEL_37:
        _os_log_impl(&dword_182FBE000, v22, v23, v13, buf, 0xCu);
        goto LABEL_38;
      }
      if (v19)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        v28 = 2082;
        v29 = (NWEndpoint *)backtrace_string;
        _os_log_impl(&dword_182FBE000, v11, v18, "%{public}s called with null completionHandler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v10)
      goto LABEL_25;
LABEL_24:
    free(v10);
    goto LABEL_25;
  }
  *(_DWORD *)buf = 136446466;
  v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
  v28 = 2114;
  v29 = self;
  v6 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v24 = 0;
  if (__nwlog_fault(v6, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      v8 = type;
      if (!os_log_type_enabled(v7, type))
        goto LABEL_30;
      *(_DWORD *)buf = 136446466;
      v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      v28 = 2114;
      v29 = self;
      v9 = "%{public}s Endpoint %{public}@ does not support custom resolution";
LABEL_28:
      v20 = v7;
      v21 = v8;
      goto LABEL_29;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      v8 = type;
      if (!os_log_type_enabled(v7, type))
        goto LABEL_30;
      *(_DWORD *)buf = 136446466;
      v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      v28 = 2114;
      v29 = self;
      v9 = "%{public}s Endpoint %{public}@ does not support custom resolution, backtrace limit exceeded";
      goto LABEL_28;
    }
    v14 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    v15 = type;
    v16 = os_log_type_enabled(v7, type);
    if (!v14)
    {
      if (!v16)
      {
LABEL_30:

        if (!v6)
          goto LABEL_17;
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136446466;
      v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      v28 = 2114;
      v29 = self;
      v9 = "%{public}s Endpoint %{public}@ does not support custom resolution, no backtrace";
      v20 = v7;
      v21 = v15;
LABEL_29:
      _os_log_impl(&dword_182FBE000, v20, v21, v9, buf, 0x16u);
      goto LABEL_30;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446722;
      v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      v28 = 2114;
      v29 = self;
      v30 = 2082;
      v31 = v14;
      _os_log_impl(&dword_182FBE000, v7, v15, "%{public}s Endpoint %{public}@ does not support custom resolution, dumping backtrace:%{public}s", buf, 0x20u);
    }

    free(v14);
  }
  if (v6)
LABEL_16:
    free(v6);
LABEL_17:
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
LABEL_25:

}

- (NWEndpoint)initWithEncodedData:(id)a3
{
  id v4;
  NWEndpoint *v5;
  NWEndpoint *v6;
  void *v7;
  int v8;
  unsigned int v9;
  void *v10;
  _QWORD *v11;
  id v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  id custom;
  NWEndpoint *v18;
  id v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  const char *v23;
  char *backtrace_string;
  os_log_type_t v25;
  _BOOL4 v26;
  char *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  NSObject *v30;
  os_log_type_t v31;
  NSObject *v32;
  os_log_type_t v33;
  void *v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  const char *v39;
  char *v40;
  _BOOL4 v41;
  _QWORD v42[5];
  objc_super v43;
  char v44;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v47 = "-[NWEndpoint initWithEncodedData:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v44 = 0;
    if (__nwlog_fault(v13, &type, &v44))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        v15 = type;
        if (!os_log_type_enabled(v14, type))
          goto LABEL_33;
        *(_DWORD *)buf = 136446210;
        v47 = "-[NWEndpoint initWithEncodedData:]";
        v16 = "%{public}s called with null internalEndpoint";
LABEL_31:
        v30 = v14;
        v31 = v15;
        goto LABEL_32;
      }
      if (!v44)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        v15 = type;
        if (!os_log_type_enabled(v14, type))
          goto LABEL_33;
        *(_DWORD *)buf = 136446210;
        v47 = "-[NWEndpoint initWithEncodedData:]";
        v16 = "%{public}s called with null internalEndpoint, backtrace limit exceeded";
        goto LABEL_31;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v25 = type;
      v26 = os_log_type_enabled(v14, type);
      if (!backtrace_string)
      {
        if (!v26)
        {
LABEL_33:

          if (!v13)
            goto LABEL_23;
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136446210;
        v47 = "-[NWEndpoint initWithEncodedData:]";
        v16 = "%{public}s called with null internalEndpoint, no backtrace";
        v30 = v14;
        v31 = v25;
LABEL_32:
        _os_log_impl(&dword_182FBE000, v30, v31, v16, buf, 0xCu);
        goto LABEL_33;
      }
      if (v26)
      {
        *(_DWORD *)buf = 136446466;
        v47 = "-[NWEndpoint initWithEncodedData:]";
        v48 = 2082;
        v49 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v14, v25, "%{public}s called with null internalEndpoint, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v13)
    {
LABEL_23:

      v18 = 0;
      goto LABEL_46;
    }
LABEL_22:
    free(v13);
    goto LABEL_23;
  }
  v43.receiver = self;
  v43.super_class = (Class)NWEndpoint;
  v5 = -[NWEndpoint init](&v43, sel_init);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = objc_msgSend(v7, "supportsResolverCallback");
    v9 = objc_msgSend(v7, "endpointType");
    v10 = (void *)objc_msgSend(v4, "_createDispatchData");
    if (v8)
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __34__NWEndpoint_initWithEncodedData___block_invoke;
      v42[3] = &__block_descriptor_40_e100_v32__0__NSObject_OS_nw_endpoint__8__NSObject_OS_dispatch_queue__16___v____NSObject_OS_nw_array__B_24lu32l8;
      v42[4] = v7;
      v11 = v42;
    }
    else
    {
      v11 = 0;
    }
    custom = nw_endpoint_create_custom(v9, v10, v11);

    if (custom)
    {
      -[NWEndpoint setInternalEndpoint:](v6, "setInternalEndpoint:", custom);
      v18 = v6;
LABEL_45:

      goto LABEL_46;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v19 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v47 = "-[NWEndpoint initWithEncodedData:]";
    v20 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v44 = 0;
    if (!__nwlog_fault((const char *)v20, &type, &v44))
    {
LABEL_42:
      if (v20)
        free(v20);
      v18 = 0;
      goto LABEL_45;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v21 = (id)gLogObj;
      v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v47 = "-[NWEndpoint initWithEncodedData:]";
        v23 = "%{public}s nw_endpoint_create_custom failed";
LABEL_39:
        v32 = v21;
        v33 = v22;
LABEL_40:
        _os_log_impl(&dword_182FBE000, v32, v33, v23, buf, 0xCu);
      }
    }
    else
    {
      if (v44)
      {
        v27 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v21 = (id)gLogObj;
        v28 = type;
        v29 = os_log_type_enabled(v21, type);
        if (v27)
        {
          if (v29)
          {
            *(_DWORD *)buf = 136446466;
            v47 = "-[NWEndpoint initWithEncodedData:]";
            v48 = 2082;
            v49 = v27;
            _os_log_impl(&dword_182FBE000, v21, v28, "%{public}s nw_endpoint_create_custom failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v27);
          goto LABEL_42;
        }
        if (!v29)
          goto LABEL_41;
        *(_DWORD *)buf = 136446210;
        v47 = "-[NWEndpoint initWithEncodedData:]";
        v23 = "%{public}s nw_endpoint_create_custom failed, no backtrace";
        v32 = v21;
        v33 = v28;
        goto LABEL_40;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v21 = (id)gLogObj;
      v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v47 = "-[NWEndpoint initWithEncodedData:]";
        v23 = "%{public}s nw_endpoint_create_custom failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }
LABEL_41:

    goto LABEL_42;
  }
  __nwlog_obj();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v47 = "-[NWEndpoint initWithEncodedData:]";
  v36 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v44 = 0;
  if (!__nwlog_fault(v36, &type, &v44))
    goto LABEL_64;
  if (type == OS_LOG_TYPE_FAULT)
  {
    __nwlog_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = type;
    if (os_log_type_enabled(v37, type))
    {
      *(_DWORD *)buf = 136446210;
      v47 = "-[NWEndpoint initWithEncodedData:]";
      v39 = "%{public}s [super init] failed";
LABEL_62:
      _os_log_impl(&dword_182FBE000, v37, v38, v39, buf, 0xCu);
    }
  }
  else if (v44)
  {
    v40 = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = type;
    v41 = os_log_type_enabled(v37, type);
    if (v40)
    {
      if (v41)
      {
        *(_DWORD *)buf = 136446466;
        v47 = "-[NWEndpoint initWithEncodedData:]";
        v48 = 2082;
        v49 = v40;
        _os_log_impl(&dword_182FBE000, v37, v38, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v40);
      goto LABEL_64;
    }
    if (v41)
    {
      *(_DWORD *)buf = 136446210;
      v47 = "-[NWEndpoint initWithEncodedData:]";
      v39 = "%{public}s [super init] failed, no backtrace";
      goto LABEL_62;
    }
  }
  else
  {
    __nwlog_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = type;
    if (os_log_type_enabled(v37, type))
    {
      *(_DWORD *)buf = 136446210;
      v47 = "-[NWEndpoint initWithEncodedData:]";
      v39 = "%{public}s [super init] failed, backtrace limit exceeded";
      goto LABEL_62;
    }
  }

LABEL_64:
  if (v36)
    free(v36);
  v18 = 0;
LABEL_46:

  return v18;
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
  v16 = "-[NWEndpoint encodedData]";
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
      v16 = "-[NWEndpoint encodedData]";
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
      v16 = "-[NWEndpoint encodedData]";
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
      v16 = "-[NWEndpoint encodedData]";
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
      v16 = "-[NWEndpoint encodedData]";
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

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithUTF8String:", nw_endpoint_get_description(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)privateDescription
{
  return (NSString *)-[NWEndpoint descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (NWInterface)interface
{
  void *v2;
  id v3;
  NWInterface *v4;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_endpoint_copy_interface(v2);

  if (v3)
    v4 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)setInterface:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  nw_endpoint_set_interface(v6, v5);
}

- (int64_t)remoteInterfaceType
{
  void *v2;
  int64_t remote_interface_type;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  remote_interface_type = nw_endpoint_get_remote_interface_type(v2);

  return remote_interface_type;
}

- (void)setRemoteInterfaceType:(int64_t)a3
{
  int v3;
  id v4;

  v3 = a3;
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_endpoint_set_remote_interface_type(v4, v3);

}

- (void)setTxtRecord:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "bytes") && objc_msgSend(v6, "length"))
  {
    v4 = nw_txt_record_create_with_bytes((const uint8_t *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    -[NWEndpoint internalEndpoint](self, "internalEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    nw_endpoint_set_txt_record(v5, v4);

  }
  else
  {
    -[NWEndpoint internalEndpoint](self, "internalEndpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    nw_endpoint_set_txt_record(v4, 0);
  }

}

- (unsigned)alternatePort
{
  void *v2;
  unsigned __int16 alternate_port;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  alternate_port = nw_endpoint_get_alternate_port(v2);

  return alternate_port;
}

- (void)setAlternatePort:(unsigned __int16)a3
{
  id v4;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_endpoint_set_alternate_port(v4, a3);

}

- (id)createProtocolBufferObject
{
  NWPBEndpoint *v3;
  NWPBServiceEndpoint *v4;
  void *v5;
  NWPBServiceEndpoint *v6;
  NWPBServiceEndpoint *v7;
  void *v8;
  NWPBServiceEndpoint *v9;
  NWPBServiceEndpoint *v10;
  void *v11;
  NWPBServiceEndpoint *v12;
  uint64_t v13;
  NWPBHostEndpoint *v14;
  void *v15;
  NWPBHostEndpoint *v16;
  NWPBHostEndpoint *v17;
  NWPBAddressEndpoint *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(NWPBEndpoint);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(NWPBServiceEndpoint);
    if (v3)
      objc_storeStrong((id *)&v3->_service, v4);

    -[NWEndpoint name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3->_service;
      v7 = v6;
      if (v6)
        objc_storeStrong((id *)&v6->_name, v5);
    }
    else
    {
      v7 = 0;
    }

    -[NWEndpoint type](self, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v9 = v3->_service;
      v10 = v9;
      if (v9)
        objc_storeStrong((id *)&v9->_type, v8);
    }
    else
    {
      v10 = 0;
    }

    -[NWEndpoint domain](self, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v12 = v3->_service;
      if (v12)
      {
        v13 = 8;
LABEL_28:
        objc_storeStrong((id *)((char *)&v12->super.super.isa + v13), v11);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
LABEL_37:
    v12 = 0;
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_30;
    v18 = objc_alloc_init(NWPBAddressEndpoint);
    if (v3)
      objc_storeStrong((id *)&v3->_address, v18);

    -[NWEndpoint addressData](self, "addressData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v12 = v3->_address;
      if (v12)
      {
        v13 = 8;
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    goto LABEL_37;
  }
  v14 = objc_alloc_init(NWPBHostEndpoint);
  if (v3)
    objc_storeStrong((id *)&v3->_host, v14);

  -[NWEndpoint hostname](self, "hostname");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = v3->_host;
    v17 = v16;
    if (v16)
      objc_storeStrong((id *)&v16->_hostname, v15);
  }
  else
  {
    v17 = 0;
  }

  -[NWEndpoint port](self, "port");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_37;
  v12 = v3->_host;
  if (v12)
  {
    v13 = 16;
    goto LABEL_28;
  }
LABEL_29:

LABEL_30:
  if (-[NWEndpoint isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    -[NWEndpoint txtRecord](self, "txtRecord");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_storeStrong((id *)&v3->_txtRecord, v19);

  }
  -[NWEndpoint interface](self, "interface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "createProtocolBufferObject");
  if (v3)
    objc_storeStrong((id *)&v3->_interface, v21);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char is_equal;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[NWEndpoint internalEndpoint](self, "internalEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalEndpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    is_equal = nw_endpoint_is_equal(v6, v7, 1);
  }
  else
  {
    is_equal = 0;
  }

  return is_equal;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getHash");

  return v3;
}

void __34__NWEndpoint_initWithEncodedData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = *(objc_class **)(a1 + 32);
  v10 = a2;
  v11 = [v9 alloc];
  v12 = nw_endpoint_copy_custom_data(v10);

  v13 = v12;
  v14 = v13;
  if (v13)
    v15 = v13;

  v16 = (void *)objc_msgSend(v11, "initWithEncodedData:", v14);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __34__NWEndpoint_initWithEncodedData___block_invoke_2;
  v19[3] = &unk_1E149FED0;
  v20 = v7;
  v21 = v8;
  v17 = v8;
  v18 = v7;
  objc_msgSend(v16, "resolveEndpointWithCompletionHandler:", v19);

}

void __34__NWEndpoint_initWithEncodedData___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  _BOOL8 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    v6 = nw_array_create();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "internalEndpoint");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          nw_array_append(v6, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NWEndpoint_initWithEncodedData___block_invoke_3;
  block[3] = &unk_1E149FEA8;
  v13 = *(NSObject **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v17 = (id)v6;
  v18 = v14;
  v19 = a3;
  v15 = (id)v6;
  dispatch_async(v13, block);

}

uint64_t __34__NWEndpoint_initWithEncodedData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

+ (unsigned)endpointType
{
  return 0;
}

+ (BOOL)supportsResolverCallback
{
  return 0;
}

+ (NWEndpoint)endpointWithProtocolBufferData:(id)a3
{
  id v3;
  NWPBEndpoint *v4;
  NWPBServiceEndpoint *service;
  id *v6;
  id v7;
  NWPBServiceEndpoint *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NWPBServiceEndpoint *v12;
  NWPBServiceEndpoint *v13;
  NSString *domain;
  NSString *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  NWPBHostEndpoint *host;
  NWPBHostEndpoint *v23;
  NSString *port;
  NSData *txtRecord;
  NSData *v26;
  NWPBInterface *interface;
  NWPBInterface *v28;
  void *v29;
  void *v30;
  char *backtrace_string;
  os_log_type_t v32;
  _BOOL4 v33;
  NWPBAddressEndpoint *address;
  id *v35;
  NSObject *v36;
  os_log_type_t v37;
  char v39;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[NWPBEndpoint initWithData:]([NWPBEndpoint alloc], "initWithData:", v3);

  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v17 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
    v18 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v39 = 0;
    if (__nwlog_fault((const char *)v18, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v19 = (id)gLogObj;
        v20 = type;
        if (!os_log_type_enabled(v19, type))
          goto LABEL_34;
        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        v21 = "%{public}s [NWPBEndpoint initWithData:] failed";
LABEL_32:
        v36 = v19;
        v37 = v20;
        goto LABEL_33;
      }
      if (!v39)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v19 = (id)gLogObj;
        v20 = type;
        if (!os_log_type_enabled(v19, type))
          goto LABEL_34;
        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        v21 = "%{public}s [NWPBEndpoint initWithData:] failed, backtrace limit exceeded";
        goto LABEL_32;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      v32 = type;
      v33 = os_log_type_enabled(v19, type);
      if (!backtrace_string)
      {
        if (!v33)
        {
LABEL_34:

          if (!v18)
            goto LABEL_36;
LABEL_35:
          free(v18);
          goto LABEL_36;
        }
        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        v21 = "%{public}s [NWPBEndpoint initWithData:] failed, no backtrace";
        v36 = v19;
        v37 = v32;
LABEL_33:
        _os_log_impl(&dword_182FBE000, v36, v37, v21, buf, 0xCu);
        goto LABEL_34;
      }
      if (v33)
      {
        *(_DWORD *)buf = 136446466;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        v43 = 2082;
        v44 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v19, v32, "%{public}s [NWPBEndpoint initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v18)
      goto LABEL_36;
    goto LABEL_35;
  }
  service = v4->_service;
  if (!service)
  {
    host = v4->_host;
    if (host)
    {
      v6 = host;
      v7 = v6[1];
      v23 = v4->_host;
      v9 = v23;
      if (v23)
        port = v23->_port;
      else
        port = 0;
      v11 = port;
      +[NWHostEndpoint endpointWithHostname:port:](NWHostEndpoint, "endpointWithHostname:port:", v7, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    address = v4->_address;
    if (address)
    {
      v35 = address;
      v6 = (id *)v35[1];

      +[NWAddressEndpoint endpointWithAddress:](NWAddressEndpoint, "endpointWithAddress:", objc_msgSend(v6, "bytes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_36:
    v16 = 0;
    goto LABEL_37;
  }
  v6 = service;
  v7 = v6[2];
  v8 = v4->_service;
  v9 = v8;
  if (v8)
    v10 = v8->_type;
  else
    v10 = 0;
  v11 = v10;
  v12 = v4->_service;
  v13 = v12;
  if (v12)
    domain = v12->_domain;
  else
    domain = 0;
  v15 = domain;
  +[NWBonjourServiceEndpoint endpointWithName:type:domain:](NWBonjourServiceEndpoint, "endpointWithName:type:domain:", v7, v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
LABEL_17:

  txtRecord = v4->_txtRecord;
  if (txtRecord)
  {
    v26 = txtRecord;
    objc_msgSend(v16, "setTxtRecord:", v26);

  }
  interface = v4->_interface;
  if (interface)
  {
    v28 = interface;
    -[NWPBInterface data](v28, "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[NWInterface interfaceWithProtocolBufferData:](NWInterface, "interfaceWithProtocolBufferData:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInterface:", v30);

  }
LABEL_37:

  return (NWEndpoint *)v16;
}

@end
