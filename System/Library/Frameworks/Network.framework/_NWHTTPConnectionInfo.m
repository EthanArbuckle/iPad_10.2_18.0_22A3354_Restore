@implementation _NWHTTPConnectionInfo

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NWHTTPConnectionInfo;
  if (-[_NWHTTPConnectionInfo isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (void)sendPingWithReceiveHandler:(id)a3
{
  id v4;
  OS_nw_protocol_metadata *connectionMetadata;
  uint64_t v6;
  id v7;
  OS_nw_protocol_metadata *v8;
  _QWORD *v9;
  id *v10;
  id v11;
  BOOL is_equal_unsafe;
  id *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  os_log_type_t v21;
  char *backtrace_string;
  os_log_type_t v23;
  _BOOL4 v24;
  char *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  os_log_type_t v28;
  os_log_type_t v29;
  _QWORD v30[5];
  id v31;
  char v32;
  os_log_type_t type;
  _BYTE buf[24];
  void *v35;
  id *v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    connectionMetadata = self->_connectionMetadata;
  else
    connectionMetadata = 0;
  v6 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke;
  v30[3] = &unk_1E14A3070;
  v30[4] = self;
  v31 = v4;
  v7 = v4;
  v8 = connectionMetadata;
  v9 = v30;
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
    v17 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (!__nwlog_fault(v17, &type, &v32))
      goto LABEL_44;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl(&dword_182FBE000, v18, v19, "%{public}s called with null metadata", buf, 0xCu);
      }
    }
    else if (v32)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v23 = type;
      v24 = os_log_type_enabled(v18, type);
      if (backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v18, v23, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_44:
        if (!v17)
          goto LABEL_10;
LABEL_45:
        free(v17);
        goto LABEL_10;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl(&dword_182FBE000, v18, v23, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v28 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl(&dword_182FBE000, v18, v28, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_43:

    goto LABEL_44;
  }
  v10 = v8;
  v11 = v10[1];

  if (nw_protocol_copy_http_connection_definition_onceToken != -1)
    dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
  is_equal_unsafe = nw_protocol_definition_is_equal_unsafe((uint64_t)v11, nw_protocol_copy_http_connection_definition_definition);

  if (is_equal_unsafe)
  {
    *(_QWORD *)buf = v6;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __nw_http_connection_metadata_send_ping_block_invoke;
    v35 = &unk_1E14AA370;
    v13 = v10;
    v36 = v13;
    v14 = v9;
    v37 = v14;
    v15 = (uint64_t)v13[4];
    if (v15)
    {
      __nw_http_connection_metadata_send_ping_block_invoke((uint64_t)buf, v15);
      v14 = v37;
    }

    goto LABEL_10;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v20 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
  v17 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v32 = 0;
  if (!__nwlog_fault(v17, &type, &v32))
    goto LABEL_44;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    v21 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
      _os_log_impl(&dword_182FBE000, v18, v21, "%{public}s metadata must be http_connection", buf, 0xCu);
    }
    goto LABEL_43;
  }
  if (!v32)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    v29 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
      _os_log_impl(&dword_182FBE000, v18, v29, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_43;
  }
  v25 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v18 = (id)gLogObj;
  v26 = type;
  v27 = os_log_type_enabled(v18, type);
  if (!v25)
  {
    if (v27)
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
      _os_log_impl(&dword_182FBE000, v18, v26, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
    }
    goto LABEL_43;
  }
  if (v27)
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "nw_http_connection_metadata_send_ping";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl(&dword_182FBE000, v18, v26, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v25);
  if (v17)
    goto LABEL_45;
LABEL_10:

}

- (BOOL)isValid
{
  if (self)
    self = (_NWHTTPConnectionInfo *)self->_connectionMetadata;
  return !nw_http_connection_metadata_get_is_closed(self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_storeStrong((id *)&self->_connectionMetadata, 0);
}

@end
