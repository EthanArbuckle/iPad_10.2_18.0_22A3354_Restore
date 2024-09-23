@implementation NWRemoteConnectionDirector

- (NWRemoteConnectionDirector)initWithDelegate:(id)a3
{
  id v4;
  NWRemoteConnectionDirector *v5;
  NSMutableArray *v6;
  NSMutableArray *writeRequests;
  nw_protocol *v8;
  uint64_t internal;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  id v15;
  os_log_type_t v16;
  char *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  char *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  void *v27;
  void *v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  const char *v32;
  char *backtrace_string;
  _BOOL4 v34;
  char *v35;
  _BOOL4 v36;
  objc_super v37;
  char v38;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    __nwlog_obj();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
    v11 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v38 = 0;
    if (__nwlog_fault(v11, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v16 = type;
        if (!os_log_type_enabled(v12, type))
          goto LABEL_38;
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v14 = "%{public}s called with null delegate";
      }
      else if (v38)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v16 = type;
        v34 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
            v42 = 2082;
            v43 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_182FBE000, v12, v16, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          if (!v11)
            goto LABEL_41;
          goto LABEL_40;
        }
        if (!v34)
          goto LABEL_38;
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v14 = "%{public}s called with null delegate, no backtrace";
      }
      else
      {
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v16 = type;
        if (!os_log_type_enabled(v12, type))
          goto LABEL_38;
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v14 = "%{public}s called with null delegate, backtrace limit exceeded";
      }
      goto LABEL_35;
    }
    goto LABEL_39;
  }
  v37.receiver = self;
  v37.super_class = (Class)NWRemoteConnectionDirector;
  v5 = -[NWRemoteConnectionDirector init](&v37, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v38 = 0;
    if (!__nwlog_fault(v29, &type, &v38))
      goto LABEL_75;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v32 = "%{public}s [super init] failed";
LABEL_73:
        _os_log_impl(&dword_182FBE000, v30, v31, v32, buf, 0xCu);
      }
    }
    else
    {
      if (v38)
      {
        v35 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = type;
        v36 = os_log_type_enabled(v30, type);
        if (v35)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
            v42 = 2082;
            v43 = (uint64_t)v35;
            _os_log_impl(&dword_182FBE000, v30, v31, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v35);
          goto LABEL_75;
        }
        if (!v36)
          goto LABEL_74;
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v32 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_73;
      }
      __nwlog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v32 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_73;
      }
    }
LABEL_74:

LABEL_75:
    if (v29)
      free(v29);
    goto LABEL_42;
  }
  self = v5;
  objc_storeWeak((id *)&v5->_delegate, v4);
  self->_maximumDataChunkSize = 10240;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  writeRequests = self->_writeRequests;
  self->_writeRequests = v6;

  v8 = (nw_protocol *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  self->_directorProtocol = v8;
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
    v42 = 2048;
    v43 = 64;
    v11 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v38 = 0;
    if (!__nwlog_fault(v11, &type, &v38))
      goto LABEL_39;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v13 = type;
      if (!os_log_type_enabled(v12, type))
        goto LABEL_38;
      *(_DWORD *)buf = 136446466;
      v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
      v42 = 2048;
      v43 = 64;
      v14 = "%{public}s calloc(%zu) failed";
    }
    else
    {
      if (v38)
      {
        v17 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v18 = type;
        v19 = os_log_type_enabled(v12, type);
        if (v17)
        {
          if (v19)
          {
            *(_DWORD *)buf = 136446722;
            v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
            v42 = 2048;
            v43 = 64;
            v44 = 2082;
            v45 = v17;
            _os_log_impl(&dword_182FBE000, v12, v18, "%{public}s calloc(%zu) failed, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(v17);
          if (!v11)
            goto LABEL_41;
          goto LABEL_40;
        }
        if (!v19)
          goto LABEL_38;
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v42 = 2048;
        v43 = 64;
        v14 = "%{public}s calloc(%zu) failed, no backtrace";
        v23 = v12;
        v24 = v18;
        goto LABEL_30;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v13 = type;
      if (!os_log_type_enabled(v12, type))
        goto LABEL_38;
      *(_DWORD *)buf = 136446466;
      v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
      v42 = 2048;
      v43 = 64;
      v14 = "%{public}s calloc(%zu) failed, backtrace limit exceeded";
    }
    v23 = v12;
    v24 = v13;
LABEL_30:
    v25 = 22;
LABEL_37:
    _os_log_impl(&dword_182FBE000, v23, v24, v14, buf, v25);
    goto LABEL_38;
  }
  if (initWithDelegate__directorProtocolOnceToken != -1)
    dispatch_once(&initWithDelegate__directorProtocolOnceToken, &__block_literal_global_43254);
  self->_directorProtocol->identifier = (nw_protocol_identifier *)&NWRemoteConnectionDirectorProtocolIdentifier;
  self->_directorProtocol->callbacks = (nw_protocol_callbacks *)&NWRemoteConnectionDirectorProtocolCallbacks;
  self->_directorProtocol->handle = self;
  internal = nw_hash_table_create_internal(0x11u, 4, (const void *(*)(const void *, unsigned int *))nw_protocol_get_key, (unsigned int (*)(const void *, unsigned int))nw_protocol_key_hash, (BOOL (*)(const void *, const void *, unsigned int))nw_protocol_matches_key, 0);
  if (!internal)
  {
    self->_protocolHashTable = 0;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
    v11 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v38 = 0;
    if (!__nwlog_fault(v11, &type, &v38))
      goto LABEL_39;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v16 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v14 = "%{public}s nw_protocol_hash_table_create failed";
LABEL_35:
        v23 = v12;
        v24 = v16;
LABEL_36:
        v25 = 12;
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    if (!v38)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v16 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        v14 = "%{public}s nw_protocol_hash_table_create failed, backtrace limit exceeded";
        goto LABEL_35;
      }
LABEL_38:

      goto LABEL_39;
    }
    v20 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    v21 = type;
    v22 = os_log_type_enabled(v12, type);
    if (!v20)
    {
      if (!v22)
        goto LABEL_38;
      *(_DWORD *)buf = 136446210;
      v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
      v14 = "%{public}s nw_protocol_hash_table_create failed, no backtrace";
      v23 = v12;
      v24 = v21;
      goto LABEL_36;
    }
    if (v22)
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
      v42 = 2082;
      v43 = (uint64_t)v20;
      _os_log_impl(&dword_182FBE000, v12, v21, "%{public}s nw_protocol_hash_table_create failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(v20);
LABEL_39:
    if (!v11)
    {
LABEL_41:

LABEL_42:
      self = 0;
      goto LABEL_43;
    }
LABEL_40:
    free(v11);
    goto LABEL_41;
  }
  *(_DWORD *)(internal + 48) &= ~2u;
  self->_protocolHashTable = (nw_hash_table *)internal;
LABEL_43:

  return self;
}

- (void)dealloc
{
  nw_hash_table *v3;
  uint64_t v4;
  objc_super v5;

  if (-[NWRemoteConnectionDirector directorProtocol](self, "directorProtocol"))
  {
    free(-[NWRemoteConnectionDirector directorProtocol](self, "directorProtocol"));
    -[NWRemoteConnectionDirector setDirectorProtocol:](self, "setDirectorProtocol:", 0);
  }
  if (-[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable")
    && -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable"))
  {
    v3 = -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable");
    _nw_hash_table_release((os_unfair_lock_s *)v3, v4);
    -[NWRemoteConnectionDirector setProtocolHashTable:](self, "setProtocolHashTable:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)NWRemoteConnectionDirector;
  -[NWRemoteConnectionDirector dealloc](&v5, sel_dealloc);
}

- (id)createOpenConnectionMessageForClientID:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NWPBOpenConnection *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NWPBCommandMessage *v16;
  id *p_isa;
  void *v18;
  void *v19;
  void *v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  void *v26;
  void *v27;
  char *backtrace_string;
  _BOOL4 v29;
  const char *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  char v33;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v33 = 0;
    if (!__nwlog_fault(v22, &type, &v33))
      goto LABEL_50;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (!os_log_type_enabled(v23, type))
        goto LABEL_49;
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
      v25 = "%{public}s called with null clientID";
LABEL_48:
      _os_log_impl(&dword_182FBE000, v23, v24, v25, buf, 0xCu);
      goto LABEL_49;
    }
    if (!v33)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        v25 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = type;
    v29 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        v25 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (!v29)
      goto LABEL_35;
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    v37 = 2082;
    v38 = backtrace_string;
    v30 = "%{public}s called with null clientID, dumping backtrace:%{public}s";
LABEL_34:
    _os_log_impl(&dword_182FBE000, v23, v24, v30, buf, 0x16u);
LABEL_35:

    free(backtrace_string);
    goto LABEL_50;
  }
  if (!v8)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v33 = 0;
    if (!__nwlog_fault(v22, &type, &v33))
      goto LABEL_50;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (!os_log_type_enabled(v23, type))
        goto LABEL_49;
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
      v25 = "%{public}s called with null endpoint";
      goto LABEL_48;
    }
    if (!v33)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        v25 = "%{public}s called with null endpoint, backtrace limit exceeded";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = type;
    v31 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        v25 = "%{public}s called with null endpoint, no backtrace";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (!v31)
      goto LABEL_35;
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    v37 = 2082;
    v38 = backtrace_string;
    v30 = "%{public}s called with null endpoint, dumping backtrace:%{public}s";
    goto LABEL_34;
  }
  if (v9)
  {
    v11 = objc_alloc_init(NWPBOpenConnection);
    objc_msgSend(v7, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_clientUUID, v12);

      v14 = (void *)objc_msgSend(v8, "createProtocolBufferObject");
      objc_storeStrong((id *)&v11->_endpoint, v14);

      v15 = (void *)objc_msgSend(v10, "createProtocolBufferObject");
      objc_storeStrong((id *)&v11->_parameters, v15);
    }
    else
    {

      v15 = (void *)objc_msgSend(v10, "createProtocolBufferObject");
    }

    v16 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v16->super.super.isa;
    if (v16)
    {
      *(_BYTE *)&v16->_has |= 1u;
      v16->_command = 1;
      -[NWPBOpenConnection data](v11, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v18);
    }
    else
    {
      -[NWPBOpenConnection data](v11, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(p_isa, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  __nwlog_obj();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
  v22 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v33 = 0;
  if (__nwlog_fault(v22, &type, &v33))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        v25 = "%{public}s called with null parameters";
        goto LABEL_48;
      }
LABEL_49:

      goto LABEL_50;
    }
    if (!v33)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        v25 = "%{public}s called with null parameters, backtrace limit exceeded";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = type;
    v32 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        v25 = "%{public}s called with null parameters, no backtrace";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (!v32)
      goto LABEL_35;
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    v37 = 2082;
    v38 = backtrace_string;
    v30 = "%{public}s called with null parameters, dumping backtrace:%{public}s";
    goto LABEL_34;
  }
LABEL_50:
  if (v22)
    free(v22);
  v19 = 0;
LABEL_9:

  return v19;
}

- (id)createCloseConnectionMessageForClientID:(id)a3
{
  id v3;
  NWPBCloseConnection *v4;
  void *v5;
  NWPBCommandMessage *v6;
  id *p_isa;
  void *v8;
  void *v9;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  char *backtrace_string;
  _BOOL4 v17;
  char v18;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(NWPBCloseConnection);
    objc_msgSend(v3, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_storeStrong((id *)&v4->_clientUUID, v5);

    v6 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v6->super.super.isa;
    if (v6)
    {
      *(_BYTE *)&v6->_has |= 1u;
      v6->_command = 3;
      -[NWPBCloseConnection data](v4, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v8);
    }
    else
    {
      -[NWPBCloseConnection data](v4, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(p_isa, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        v15 = "%{public}s called with null clientID";
LABEL_21:
        _os_log_impl(&dword_182FBE000, v13, v14, v15, buf, 0xCu);
      }
    }
    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = type;
        v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
            v22 = 2082;
            v23 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s called with null clientID, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_23;
        }
        if (!v17)
          goto LABEL_22;
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        v15 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_21;
      }
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        v15 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_21;
      }
    }
LABEL_22:

  }
LABEL_23:
  if (v12)
    free(v12);
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)createStartBrowseMessageForClientID:(id)a3 descriptor:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NWPBStartBrowse *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NWPBCommandMessage *v16;
  id *p_isa;
  void *v18;
  void *v19;
  void *v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  void *v26;
  void *v27;
  char *backtrace_string;
  _BOOL4 v29;
  const char *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  char v33;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v33 = 0;
    if (!__nwlog_fault(v22, &type, &v33))
      goto LABEL_50;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (!os_log_type_enabled(v23, type))
        goto LABEL_49;
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
      v25 = "%{public}s called with null clientID";
LABEL_48:
      _os_log_impl(&dword_182FBE000, v23, v24, v25, buf, 0xCu);
      goto LABEL_49;
    }
    if (!v33)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        v25 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = type;
    v29 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        v25 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (!v29)
      goto LABEL_35;
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    v37 = 2082;
    v38 = backtrace_string;
    v30 = "%{public}s called with null clientID, dumping backtrace:%{public}s";
LABEL_34:
    _os_log_impl(&dword_182FBE000, v23, v24, v30, buf, 0x16u);
LABEL_35:

    free(backtrace_string);
    goto LABEL_50;
  }
  if (!v8)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v33 = 0;
    if (!__nwlog_fault(v22, &type, &v33))
      goto LABEL_50;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (!os_log_type_enabled(v23, type))
        goto LABEL_49;
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
      v25 = "%{public}s called with null descriptor";
      goto LABEL_48;
    }
    if (!v33)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        v25 = "%{public}s called with null descriptor, backtrace limit exceeded";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = type;
    v31 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        v25 = "%{public}s called with null descriptor, no backtrace";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (!v31)
      goto LABEL_35;
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    v37 = 2082;
    v38 = backtrace_string;
    v30 = "%{public}s called with null descriptor, dumping backtrace:%{public}s";
    goto LABEL_34;
  }
  if (v9)
  {
    v11 = objc_alloc_init(NWPBStartBrowse);
    objc_msgSend(v7, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_clientUUID, v12);

      v14 = (void *)objc_msgSend(v8, "createProtocolBufferObject");
      objc_storeStrong((id *)&v11->_descriptor, v14);

      v15 = (void *)objc_msgSend(v10, "createProtocolBufferObject");
      objc_storeStrong((id *)&v11->_parameters, v15);
    }
    else
    {

      v15 = (void *)objc_msgSend(v10, "createProtocolBufferObject");
    }

    v16 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v16->super.super.isa;
    if (v16)
    {
      *(_BYTE *)&v16->_has |= 1u;
      v16->_command = 5;
      -[NWPBStartBrowse data](v11, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v18);
    }
    else
    {
      -[NWPBStartBrowse data](v11, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(p_isa, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  __nwlog_obj();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
  v22 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v33 = 0;
  if (__nwlog_fault(v22, &type, &v33))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        v25 = "%{public}s called with null parameters";
        goto LABEL_48;
      }
LABEL_49:

      goto LABEL_50;
    }
    if (!v33)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        v25 = "%{public}s called with null parameters, backtrace limit exceeded";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = type;
    v32 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        v25 = "%{public}s called with null parameters, no backtrace";
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (!v32)
      goto LABEL_35;
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    v37 = 2082;
    v38 = backtrace_string;
    v30 = "%{public}s called with null parameters, dumping backtrace:%{public}s";
    goto LABEL_34;
  }
LABEL_50:
  if (v22)
    free(v22);
  v19 = 0;
LABEL_9:

  return v19;
}

- (id)createStopBrowseMessageForClientID:(id)a3
{
  id v3;
  NWPBStopBrowse *v4;
  void *v5;
  NWPBCommandMessage *v6;
  id *p_isa;
  void *v8;
  void *v9;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  char *backtrace_string;
  _BOOL4 v17;
  char v18;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(NWPBStopBrowse);
    objc_msgSend(v3, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_storeStrong((id *)&v4->_clientUUID, v5);

    v6 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v6->super.super.isa;
    if (v6)
    {
      *(_BYTE *)&v6->_has |= 1u;
      v6->_command = 7;
      -[NWPBStopBrowse data](v4, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v8);
    }
    else
    {
      -[NWPBStopBrowse data](v4, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(p_isa, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        v15 = "%{public}s called with null clientID";
LABEL_21:
        _os_log_impl(&dword_182FBE000, v13, v14, v15, buf, 0xCu);
      }
    }
    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = type;
        v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
            v22 = 2082;
            v23 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s called with null clientID, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_23;
        }
        if (!v17)
          goto LABEL_22;
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        v15 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_21;
      }
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        v15 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_21;
      }
    }
LABEL_22:

  }
LABEL_23:
  if (v12)
    free(v12);
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)createSendDataMessageForClientID:(id)a3 data:(id)a4 receiveWindow:(unsigned int)a5
{
  id v7;
  id v8;
  void *v9;
  NWPBSendData *v10;
  void *v11;
  void *v12;
  NWPBCommandMessage *v13;
  id *p_isa;
  void *v15;
  void *v16;
  void *v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  void *v23;
  char *backtrace_string;
  _BOOL4 v25;
  const char *v26;
  _BOOL4 v27;
  char v28;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v10 = objc_alloc_init(NWPBSendData);
      objc_msgSend(v7, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        objc_storeStrong((id *)&v10->_clientUUID, v11);

        objc_storeStrong((id *)&v10->_messageData, a4);
        *(_BYTE *)&v10->_has |= 1u;
        v10->_receiveWindow = a5;
      }
      else
      {

      }
      v13 = objc_alloc_init(NWPBCommandMessage);
      p_isa = (id *)&v13->super.super.isa;
      if (v13)
      {
        *(_BYTE *)&v13->_has |= 1u;
        v13->_command = 4;
        -[NWPBSendData data](v10, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(p_isa + 2, v15);
      }
      else
      {
        -[NWPBSendData data](v10, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(p_isa, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    __nwlog_obj();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v28 = 0;
    if (__nwlog_fault(v19, &type, &v28))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          v22 = "%{public}s called with null data";
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      if (!v28)
      {
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          v22 = "%{public}s called with null data, backtrace limit exceeded";
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = type;
      v27 = os_log_type_enabled(v20, type);
      if (!backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          v22 = "%{public}s called with null data, no backtrace";
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      if (!v27)
        goto LABEL_26;
      *(_DWORD *)buf = 136446466;
      v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
      v32 = 2082;
      v33 = backtrace_string;
      v26 = "%{public}s called with null data, dumping backtrace:%{public}s";
LABEL_25:
      _os_log_impl(&dword_182FBE000, v20, v21, v26, buf, 0x16u);
LABEL_26:

      free(backtrace_string);
    }
  }
  else
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v28 = 0;
    if (__nwlog_fault(v19, &type, &v28))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          v22 = "%{public}s called with null clientID";
LABEL_35:
          _os_log_impl(&dword_182FBE000, v20, v21, v22, buf, 0xCu);
        }
LABEL_36:

        goto LABEL_37;
      }
      if (!v28)
      {
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          v22 = "%{public}s called with null clientID, backtrace limit exceeded";
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = type;
      v25 = os_log_type_enabled(v20, type);
      if (!backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          v22 = "%{public}s called with null clientID, no backtrace";
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      if (!v25)
        goto LABEL_26;
      *(_DWORD *)buf = 136446466;
      v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
      v32 = 2082;
      v33 = backtrace_string;
      v26 = "%{public}s called with null clientID, dumping backtrace:%{public}s";
      goto LABEL_25;
    }
  }
LABEL_37:
  if (v19)
    free(v19);
  v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)receiveRemoteReply:(id)a3
{
  char *v4;
  NWPBCommandMessage *v5;
  NWPBCommandMessage *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  BOOL v15;
  int command;
  NWPBUpdatePath *v18;
  NSData *v19;
  objc_class *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  NWPBSendData *v30;
  NSData *v31;
  id v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  NWPBUpdateBrowse *v36;
  NSData *v37;
  id v38;
  objc_class *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  char *v54;
  void *v55;
  char *v56;
  NSObject *v57;
  os_log_type_t v58;
  const char *v59;
  char *backtrace_string;
  _BOOL4 v61;
  void *v62;
  NSObject *v63;
  char *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  char v69;
  os_log_type_t type;
  uint8_t v71[128];
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  char *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (v4)
  {
    v5 = -[NWPBCommandMessage initWithData:]([NWPBCommandMessage alloc], "initWithData:", v4);
    v6 = v5;
    if (!v5)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v74 = 2114;
        v75 = v4;
        v8 = "%{public}s Could not parse reply: %{public}@";
        v9 = v7;
        v10 = 22;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if ((*(_BYTE *)&v5->_has & 1) == 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v8 = "%{public}s Reply missing command value";
LABEL_18:
        v9 = v7;
        v10 = 12;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (!v5->_messageData)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v8 = "%{public}s Reply missing message data";
        goto LABEL_18;
      }
LABEL_20:
      v15 = 0;
      goto LABEL_21;
    }
    -[NWRemoteConnectionDirector delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)&v6->_has & 1) == 0)
    {
LABEL_10:
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v12 = "%{public}s Invalid command sent to connection receiver";
LABEL_12:
        v13 = v11;
        v14 = 12;
LABEL_13:
        _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      }
LABEL_14:
      v15 = 0;
      goto LABEL_15;
    }
    switch(v6->_command)
    {
      case 0:
        goto LABEL_10;
      case 1:
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v12 = "%{public}s Open connection command is not valid to send to connection director";
        goto LABEL_12;
      case 2:
        v18 = [NWPBUpdatePath alloc];
        v19 = v6->_messageData;
        v11 = -[NWPBUpdatePath initWithData:](v18, "initWithData:", v19);

        if (v11)
        {
          v20 = v11[1].isa;

          if (v20)
          {
            v21 = v11;
            v22 = v7;
            v23 = v21;
            v24 = v21[1].isa;
            -[objc_class data](v24, "data");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[NWPath pathWithProtocolBufferData:](NWPath, "pathWithProtocolBufferData:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v26 != 0;
            if (v26)
            {
              v7 = v22;
              if (objc_msgSend(v26, "status") == 1)
              {
                __nwlog_obj();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v26, "clientID");
                  v28 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136446466;
                  v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
                  v74 = 2114;
                  v75 = v28;
                  _os_log_impl(&dword_182FBE000, v27, OS_LOG_TYPE_DEBUG, "%{public}s Updated path is satisfied, opening %{public}@", buf, 0x16u);

                  v7 = v22;
                }

                objc_msgSend(v26, "clientID");
                v29 = objc_claimAutoreleasedReturnValue();
                -[NSObject openClient:](v7, "openClient:", v29);
              }
              else
              {
                if (objc_msgSend(v26, "status") != 2)
                {
                  v15 = 1;
                  v11 = v23;

LABEL_15:
LABEL_21:

                  goto LABEL_22;
                }
                __nwlog_obj();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v26, "clientID");
                  v54 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136446466;
                  v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
                  v74 = 2114;
                  v75 = v54;
                  _os_log_impl(&dword_182FBE000, v53, OS_LOG_TYPE_DEBUG, "%{public}s Updated path is unsatisfied, closing %{public}@", buf, 0x16u);

                  v7 = v22;
                }

                objc_msgSend(v26, "clientID");
                v29 = objc_claimAutoreleasedReturnValue();
                -[NSObject closeClient:](v7, "closeClient:", v29);
              }
            }
            else
            {
              __nwlog_obj();
              v29 = objc_claimAutoreleasedReturnValue();
              v7 = v22;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446210;
                v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
                _os_log_impl(&dword_182FBE000, v29, OS_LOG_TYPE_ERROR, "%{public}s Update path could not parse path", buf, 0xCu);
              }
            }
            v11 = v23;

            goto LABEL_15;
          }
          __nwlog_obj();
          v49 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            goto LABEL_70;
          *(_DWORD *)buf = 136446210;
          v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
          v50 = "%{public}s Update path message missing path";
        }
        else
        {
          __nwlog_obj();
          v49 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            goto LABEL_70;
          *(_DWORD *)buf = 136446210;
          v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
          v50 = "%{public}s Update path message could not be parsed";
        }
LABEL_66:
        _os_log_impl(&dword_182FBE000, v49, OS_LOG_TYPE_ERROR, v50, buf, 0xCu);
LABEL_70:
        v15 = 0;

        goto LABEL_15;
      case 3:
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v12 = "%{public}s Close connection command is not valid to send to connection director";
        goto LABEL_12;
      case 4:
        v30 = [NWPBSendData alloc];
        v31 = v6->_messageData;
        v11 = -[NWPBSendData initWithData:](v30, "initWithData:", v31);

        if (v11)
        {
          v32 = objc_alloc(MEMORY[0x1E0CB3A28]);
          v33 = v11[1].isa;
          v34 = (void *)objc_msgSend(v32, "initWithUUIDString:", v33);

          if (v34)
          {
            v35 = v11[2].isa;
            -[NWRemoteConnectionDirector receiveData:forClient:](self, "receiveData:forClient:", v35, v34);

            v15 = 1;
            goto LABEL_15;
          }
          __nwlog_obj();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
            _os_log_impl(&dword_182FBE000, v52, OS_LOG_TYPE_ERROR, "%{public}s Send data missing client ID", buf, 0xCu);
          }

          v49 = 0;
          goto LABEL_70;
        }
        __nwlog_obj();
        v49 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v50 = "%{public}s Send data message could not be parsed";
        goto LABEL_66;
      case 5:
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v12 = "%{public}s Open connection command is not valid to send to connection director";
        goto LABEL_12;
      case 6:
        v36 = [NWPBUpdateBrowse alloc];
        v37 = v6->_messageData;
        v11 = -[NWPBUpdateBrowse initWithData:](v36, "initWithData:", v37);

        if (v11)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB3A28]);
          v39 = v11[1].isa;
          v40 = (void *)objc_msgSend(v38, "initWithUUIDString:", v39);

          v15 = v40 != 0;
          if (v40)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              v15 = 1;

              goto LABEL_15;
            }
            v62 = v40;
            v63 = v7;
            v64 = v4;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v41 = objc_claimAutoreleasedReturnValue();
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v42 = v11[2].isa;
            v43 = -[objc_class countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v66;
              do
              {
                for (i = 0; i != v44; ++i)
                {
                  if (*(_QWORD *)v66 != v45)
                    objc_enumerationMutation(v42);
                  objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "data");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  +[NWEndpoint endpointWithProtocolBufferData:](NWEndpoint, "endpointWithProtocolBufferData:", v47);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();

                  -[NSObject addObject:](v41, "addObject:", v48);
                }
                v44 = -[objc_class countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
              }
              while (v44);
            }

            v7 = v63;
            v40 = v62;
            -[NSObject setDiscoveredEndpoints:forClient:](v63, "setDiscoveredEndpoints:forClient:", v41, v62);
            v4 = v64;
          }
          else
          {
            __nwlog_obj();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
              _os_log_impl(&dword_182FBE000, v41, OS_LOG_TYPE_ERROR, "%{public}s Update browse message missing client ID", buf, 0xCu);
            }
          }

        }
        else
        {
          __nwlog_obj();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
            _os_log_impl(&dword_182FBE000, v51, OS_LOG_TYPE_ERROR, "%{public}s Update browse message could not be parsed", buf, 0xCu);
          }
          v15 = 0;

        }
        goto LABEL_15;
      case 7:
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v12 = "%{public}s Close connection command is not valid to send to connection director";
        goto LABEL_12;
      default:
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        if ((*(_BYTE *)&v6->_has & 1) != 0)
          command = v6->_command;
        else
          command = 0;
        *(_DWORD *)buf = 136446466;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v74 = 1024;
        LODWORD(v75) = command;
        v12 = "%{public}s Unknown command %u sent to connection receiver";
        v13 = v11;
        v14 = 18;
        goto LABEL_13;
    }
  }
  __nwlog_obj();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
  v56 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v69 = 0;
  if (__nwlog_fault(v56, &type, &v69))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = type;
      if (os_log_type_enabled(v57, type))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v59 = "%{public}s called with null replyData";
LABEL_97:
        _os_log_impl(&dword_182FBE000, v57, v58, v59, buf, 0xCu);
      }
    }
    else
    {
      if (v69)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = type;
        v61 = os_log_type_enabled(v57, type);
        if (backtrace_string)
        {
          if (v61)
          {
            *(_DWORD *)buf = 136446466;
            v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
            v74 = 2082;
            v75 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v57, v58, "%{public}s called with null replyData, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_99;
        }
        if (!v61)
          goto LABEL_98;
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v59 = "%{public}s called with null replyData, no backtrace";
        goto LABEL_97;
      }
      __nwlog_obj();
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = type;
      if (os_log_type_enabled(v57, type))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v59 = "%{public}s called with null replyData, backtrace limit exceeded";
        goto LABEL_97;
      }
    }
LABEL_98:

  }
LABEL_99:
  if (v56)
    free(v56);
  v15 = 0;
LABEL_22:

  return v15;
}

- (unint64_t)dataModeForFlowID:(id)a3
{
  id v4;
  nw_hash_table *v5;
  uint64_t v6;
  uint64_t node;
  unint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable");
  if (nw_hash_table_count((uint64_t)v5, v6))
  {
    v10[0] = 0;
    v10[1] = 0;
    objc_msgSend(v4, "getUUIDBytes:", v10);
    node = nw_hash_table_get_node((uint64_t)-[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable"), (uint64_t)v10, 16);
    if (node)
      v8 = *(unsigned int *)(node + 32);
    else
      v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (nw_protocol)outputHandlerForFlowID:(id)a3
{
  id v4;
  nw_hash_table *v5;
  uint64_t v6;
  uint64_t node;
  nw_protocol *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable");
  if (nw_hash_table_count((uint64_t)v5, v6)
    && (v10[0] = 0,
        v10[1] = 0,
        objc_msgSend(v4, "getUUIDBytes:", v10),
        (node = nw_hash_table_get_node((uint64_t)-[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable"), (uint64_t)v10, 16)) != 0))
  {
    v8 = *(nw_protocol **)(node + 16);
  }
  else
  {
    v8 = -[NWRemoteConnectionDirector defaultOutputHandler](self, "defaultOutputHandler");
  }

  return v8;
}

- (void)setOutputProtocolHandler:(nw_protocol *)a3 forFlowID:(id)a4 dataMode:(unint64_t)a5
{
  int v5;
  id v8;
  nw_hash_table *v9;
  _BOOL8 node;
  uint64_t v11;
  _QWORD v12[3];

  v5 = a5;
  v12[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = -[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable");
  v12[0] = 0;
  v12[1] = 0;
  objc_msgSend(v8, "getUUIDBytes:", v12);

  node = nw_hash_table_get_node((uint64_t)v9, (uint64_t)v12, 16);
  if (node)
    nw_hash_table_remove_node((uint64_t)v9, node);
  if (a3)
  {
    v11 = nw_hash_table_add_object((uint64_t)v9, (uint64_t)a3, 0);
    if (v11)
      *(_DWORD *)(v11 + 32) = v5;
  }
}

- (void)receiveData:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  nw_protocol *v8;
  uint64_t v9;
  NWRemoteConnectionDirector *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NWRemoteConnectionWriteRequest *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[NWRemoteConnectionDirector outputHandlerForFlowID:](self, "outputHandlerForFlowID:", v7);
  if (v8)
  {
    v9 = (uint64_t)v8;
    v10 = self;
    objc_sync_enter(v10);
    while (1)
    {
      -[NWRemoteConnectionDirector writeRequests](v10, "writeRequests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
        break;
      -[NWRemoteConnectionDirector writeRequests](v10, "writeRequests");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!nw_remote_director_write_request((uint64_t)-[NWRemoteConnectionDirector directorProtocol](v10, "directorProtocol"), v9, v14))
      {

        break;
      }
      -[NWRemoteConnectionDirector writeRequests](v10, "writeRequests");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectAtIndex:", 0);

    }
    v17 = -[NWRemoteConnectionWriteRequest initWithData:clientID:]([NWRemoteConnectionWriteRequest alloc], "initWithData:clientID:", v6, v7);
    if (v12
      || !nw_remote_director_write_request((uint64_t)-[NWRemoteConnectionDirector directorProtocol](v10, "directorProtocol"), v9, v17))
    {
      -[NWRemoteConnectionDirector writeRequests](v10, "writeRequests");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v17);

    }
    objc_sync_exit(v10);

  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446466;
      v20 = "-[NWRemoteConnectionDirector receiveData:forClient:]";
      v21 = 2114;
      v22 = 0;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s No client protocol found for %{public}@, dropping data", (uint8_t *)&v19, 0x16u);
    }

  }
}

- (unint64_t)maximumDataChunkSize
{
  return self->_maximumDataChunkSize;
}

- (void)setMaximumDataChunkSize:(unint64_t)a3
{
  self->_maximumDataChunkSize = a3;
}

- (NWRemoteConnectionDirectorDelegate)delegate
{
  return (NWRemoteConnectionDirectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (nw_protocol)directorProtocol
{
  return self->_directorProtocol;
}

- (void)setDirectorProtocol:(nw_protocol *)a3
{
  self->_directorProtocol = a3;
}

- (nw_protocol)defaultOutputHandler
{
  return self->_defaultOutputHandler;
}

- (void)setDefaultOutputHandler:(nw_protocol *)a3
{
  self->_defaultOutputHandler = a3;
}

- (nw_hash_table)protocolHashTable
{
  return self->_protocolHashTable;
}

- (void)setProtocolHashTable:(nw_hash_table *)a3
{
  self->_protocolHashTable = a3;
}

- (NSMutableArray)writeRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWriteRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

double __47__NWRemoteConnectionDirector_initWithDelegate___block_invoke()
{
  double result;

  NWRemoteConnectionDirectorProtocolIdentifier = 0u;
  unk_1EDCF1FA8 = 0u;
  *(_QWORD *)&result = 0x100000004;
  qword_1EDCF1FB8 = 0x100000004;
  NWRemoteConnectionDirectorProtocolCallbacks = (uint64_t)nw_protocol_default_add_input_handler;
  *(_QWORD *)algn_1EDCF1FC8 = nw_protocol_default_remove_input_handler;
  qword_1EDCF2010 = (uint64_t)nw_protocol_default_get_input_frames;
  unk_1EDCF2018 = nw_protocol_default_get_output_frames;
  qword_1EDCF2020 = (uint64_t)nw_protocol_default_finalize_output_frames;
  unk_1EDCF2028 = nw_protocol_default_link_state;
  qword_1EDCF2040 = (uint64_t)nw_protocol_default_get_local;
  unk_1EDCF2048 = nw_protocol_default_get_remote;
  qword_1EDCF2030 = (uint64_t)nw_protocol_default_get_parameters;
  unk_1EDCF2038 = nw_protocol_default_get_path;
  qword_1EDCF2080 = (uint64_t)nw_protocol_default_output_finished;
  unk_1EDCF2088 = nw_protocol_default_get_output_local;
  qword_1EDCF1FD0 = (uint64_t)nw_protocol_default_replace_input_handler;
  unk_1EDCF1FD8 = nw_protocol_default_connect;
  qword_1EDCF1FE0 = (uint64_t)nw_protocol_default_disconnect;
  unk_1EDCF1FE8 = nw_protocol_default_connected;
  qword_1EDCF1FF0 = (uint64_t)nw_protocol_default_disconnected;
  unk_1EDCF1FF8 = nw_protocol_default_error;
  qword_1EDCF20C0 = (uint64_t)nw_protocol_default_reset;
  unk_1EDCF20C8 = nw_protocol_default_input_flush;
  qword_1EDCF2070 = (uint64_t)nw_protocol_default_supports_external_data;
  unk_1EDCF2078 = nw_protocol_default_input_finished;
  qword_1EDCF2090 = (uint64_t)nw_protocol_default_get_output_interface;
  unk_1EDCF2098 = nw_protocol_default_waiting_for_output;
  qword_1EDCF2050 = (uint64_t)nw_protocol_default_register_notification;
  unk_1EDCF2058 = nw_protocol_default_unregister_notification;
  qword_1EDCF2060 = (uint64_t)nw_protocol_default_notify;
  unk_1EDCF2068 = nw_protocol_default_updated_path;
  qword_1EDCF20A0 = (uint64_t)nw_protocol_default_copy_info;
  unk_1EDCF20A8 = nw_protocol_default_add_listen_handler;
  qword_1EDCF20B0 = (uint64_t)nw_protocol_default_remove_listen_handler;
  unk_1EDCF20B8 = nw_protocol_default_get_message_properties;
  qword_1EDCF2000 = (uint64_t)nw_remote_director_input_available;
  unk_1EDCF2008 = nw_remote_director_output_available;
  return result;
}

@end
