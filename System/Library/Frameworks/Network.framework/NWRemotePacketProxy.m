@implementation NWRemotePacketProxy

- (NWRemotePacketProxy)initWithDelegate:(id)a3
{
  id v4;
  NWRemotePacketProxy *v5;
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
    v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
            v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s called with null delegate, backtrace limit exceeded";
      }
      goto LABEL_35;
    }
    goto LABEL_39;
  }
  v37.receiver = self;
  v37.super_class = (Class)NWRemotePacketProxy;
  v5 = -[NWRemotePacketProxy init](&v37, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
            v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v32 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_73;
      }
      __nwlog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
  v5->_receiveWindowPacketCount = 16;
  objc_storeWeak((id *)&v5->_delegate, v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  writeRequests = self->_writeRequests;
  self->_writeRequests = v6;

  v8 = (nw_protocol *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  self->_packetProtocol = v8;
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
      v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
            v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
      v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
  if (initWithDelegate__packetProtocolOnceToken[0] != -1)
    dispatch_once(initWithDelegate__packetProtocolOnceToken, &__block_literal_global_17697);
  self->_packetProtocol->identifier = (nw_protocol_identifier *)&initWithDelegate__NWRemotePacketProtocolIdentifier;
  self->_packetProtocol->callbacks = (nw_protocol_callbacks *)&initWithDelegate__NWRemotePacketProtocolCallbacks;
  self->_packetProtocol->handle = self;
  internal = nw_hash_table_create_internal(0x11u, 60, (const void *(*)(const void *, unsigned int *))nw_packet_get_key, (unsigned int (*)(const void *, unsigned int))nw_packet_key_hash, (BOOL (*)(const void *, const void *, unsigned int))nw_packet_matches_key, nw_packet_release);
  if (!internal)
  {
    self->_packetHashTable = 0;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
        v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
      v41 = "-[NWRemotePacketProxy initWithDelegate:]";
      v14 = "%{public}s nw_protocol_hash_table_create failed, no backtrace";
      v23 = v12;
      v24 = v21;
      goto LABEL_36;
    }
    if (v22)
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[NWRemotePacketProxy initWithDelegate:]";
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
  self->_packetHashTable = (nw_hash_table *)internal;
LABEL_43:

  return self;
}

- (void)dealloc
{
  nw_hash_table *v3;
  uint64_t v4;
  objc_super v5;

  if (-[NWRemotePacketProxy packetProtocol](self, "packetProtocol"))
  {
    free(-[NWRemotePacketProxy packetProtocol](self, "packetProtocol"));
    -[NWRemotePacketProxy setPacketProtocol:](self, "setPacketProtocol:", 0);
  }
  if (-[NWRemotePacketProxy packetHashTable](self, "packetHashTable")
    && -[NWRemotePacketProxy packetHashTable](self, "packetHashTable"))
  {
    v3 = -[NWRemotePacketProxy packetHashTable](self, "packetHashTable");
    _nw_hash_table_release((os_unfair_lock_s *)v3, v4);
    -[NWRemotePacketProxy setPacketHashTable:](self, "setPacketHashTable:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)NWRemotePacketProxy;
  -[NWRemotePacketProxy dealloc](&v5, sel_dealloc);
}

- (void)setReceiveWindowPacketCount:(unsigned int)a3
{
  NWRemotePacketProxy *v4;
  unsigned int receiveWindowPacketCount;
  char *v6;
  _QWORD v7[5];

  v4 = self;
  objc_sync_enter(v4);
  receiveWindowPacketCount = v4->_receiveWindowPacketCount;
  v4->_receiveWindowPacketCount = a3;
  objc_sync_exit(v4);

  if (a3)
  {
    if (!receiveWindowPacketCount)
    {
      nw_remote_packet_input_available((uint64_t)-[NWRemotePacketProxy packetProtocol](v4, "packetProtocol"), (uint64_t)-[NWRemotePacketProxy defaultOutputHandler](v4, "defaultOutputHandler"));
      v6 = -[NWRemotePacketProxy packetHashTable](v4, "packetHashTable");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__NWRemotePacketProxy_setReceiveWindowPacketCount___block_invoke;
      v7[3] = &unk_1E14AC340;
      v7[4] = v4;
      nw_hash_table_apply(v6, (uint64_t)v7);
    }
  }
}

- (nw_protocol)outputHandlerForPacket:(id)a3 inbound:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  nw_hash_table *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  __int16 v15;
  _OWORD *v16;
  uint64_t node;
  nw_protocol *v18;
  _BYTE v20[24];
  __int16 v21;
  __int16 v22;
  int v23;
  _BYTE v24[28];

  v4 = a4;
  v6 = a3;
  v7 = -[NWRemotePacketProxy packetHashTable](self, "packetHashTable");
  if (!nw_hash_table_count((uint64_t)v7, v8))
    goto LABEL_35;
  *(_OWORD *)&v24[8] = 0u;
  v9 = objc_msgSend(v6, "length", 0, 0, 0, 0, 0, 0, 0, *(_QWORD *)&v24[20]);
  v10 = objc_msgSend(v6, "bytes");
  if (!v10 || !v9)
    goto LABEL_35;
  v11 = *(_BYTE *)v10 & 0xF0;
  if (v11 == 96)
  {
    v21 = 7708;
    *(_WORD *)v20 = 7708;
    if (v9 <= 0x27)
      goto LABEL_35;
    if (v4)
    {
      *(_OWORD *)&v20[8] = *(_OWORD *)(v10 + 24);
      v16 = (_OWORD *)(v10 + 8);
    }
    else
    {
      *(_OWORD *)&v20[8] = *(_OWORD *)(v10 + 8);
      v16 = (_OWORD *)(v10 + 24);
    }
    *(_OWORD *)v24 = *v16;
    v24[20] = *(_BYTE *)(v10 + 6);
    if (v24[20] == 17)
    {
      if (v9 <= 0x2F)
        goto LABEL_35;
      if (v4)
        goto LABEL_25;
    }
    else
    {
      if (v24[20] != 6)
        goto LABEL_33;
      if (v9 <= 0x3B)
        goto LABEL_35;
      if (v4)
      {
LABEL_25:
        *(_WORD *)&v20[2] = *(_WORD *)(v10 + 42);
        v15 = *(_WORD *)(v10 + 40);
        goto LABEL_32;
      }
    }
    *(_WORD *)&v20[2] = *(_WORD *)(v10 + 40);
    v15 = *(_WORD *)(v10 + 42);
    goto LABEL_32;
  }
  if (v11 != 64)
    goto LABEL_35;
  v21 = 528;
  *(_WORD *)v20 = 528;
  if (v9 <= 0x13)
    goto LABEL_35;
  v12 = 12;
  if (v4)
    v13 = 16;
  else
    v13 = 12;
  if (!v4)
    v12 = 16;
  v14 = *(_DWORD *)(v10 + v12);
  *(_DWORD *)&v20[4] = *(_DWORD *)(v10 + v13);
  v23 = v14;
  v24[20] = *(_BYTE *)(v10 + 9);
  if (v24[20] == 17)
  {
    if (v9 > 0x1B)
    {
      if (v4)
        goto LABEL_16;
LABEL_28:
      *(_WORD *)&v20[2] = *(_WORD *)(v10 + 20);
      v15 = *(_WORD *)(v10 + 22);
      goto LABEL_32;
    }
LABEL_35:
    v18 = -[NWRemotePacketProxy defaultOutputHandler](self, "defaultOutputHandler", *(_QWORD *)v20);
    goto LABEL_36;
  }
  if (v24[20] != 6)
    goto LABEL_33;
  if (v9 <= 0x27)
    goto LABEL_35;
  if (!v4)
    goto LABEL_28;
LABEL_16:
  *(_WORD *)&v20[2] = *(_WORD *)(v10 + 22);
  v15 = *(_WORD *)(v10 + 20);
LABEL_32:
  v22 = v15;
LABEL_33:
  node = nw_hash_table_get_node((uint64_t)-[NWRemotePacketProxy packetHashTable](self, "packetHashTable", *(_OWORD *)v20, *(_QWORD *)&v20[16]), (uint64_t)v20, 60);
  if (!node)
    goto LABEL_35;
  v18 = *(nw_protocol **)(node + 32);
LABEL_36:

  return v18;
}

- (void)setOutputProtocolHandler:(nw_protocol *)a3 local:(id)a4 remote:(id)a5 ipProtocol:(unsigned __int8)a6
{
  id v10;
  id v11;
  _BYTE *v12;
  _BYTE *v13;
  nw_hash_table *v14;
  _BOOL8 node;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  char *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  NSObject *v24;
  os_log_type_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  const char *v30;
  char *backtrace_string;
  _BOOL4 v32;
  char v33;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = malloc_type_calloc(1uLL, 0x3CuLL, 0x1000040C2DCA394uLL);
  if (v12)
  {
    v13 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "address"))
      __memcpy_chk();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "address"))
      __memcpy_chk();
    v13[56] = a6;
    v14 = -[NWRemotePacketProxy packetHashTable](self, "packetHashTable");
    node = nw_hash_table_get_node((uint64_t)v14, (uint64_t)v13, 60);
    v16 = node;
    if (!a3)
    {
      if (node)
        nw_hash_table_remove_node((uint64_t)v14, node);
      goto LABEL_30;
    }
    if (node || (v16 = nw_hash_table_add_object((uint64_t)v14, (uint64_t)v13, 0)) != 0)
    {
      *(_QWORD *)(v16 + 32) = a3;
LABEL_30:
      free(v13);
      goto LABEL_31;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v26 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
    v27 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v33 = 0;
    if (!__nwlog_fault((const char *)v27, &type, &v33))
    {
LABEL_49:
      if (v27)
        free(v27);
      goto LABEL_30;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v28 = (id)gLogObj;
      v29 = type;
      if (os_log_type_enabled(v28, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed";
LABEL_47:
        _os_log_impl(&dword_182FBE000, v28, v29, v30, buf, 0xCu);
      }
    }
    else
    {
      if (v33)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = type;
        v32 = os_log_type_enabled(v28, type);
        if (backtrace_string)
        {
          if (v32)
          {
            *(_DWORD *)buf = 136446466;
            v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
            v37 = 2082;
            v38 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_182FBE000, v28, v29, "%{public}s nw_hash_table_add_object failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_49;
        }
        if (!v32)
          goto LABEL_48;
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed, no backtrace";
        goto LABEL_47;
      }
      __nwlog_obj();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = type;
      if (os_log_type_enabled(v28, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed, backtrace limit exceeded";
        goto LABEL_47;
      }
    }
LABEL_48:

    goto LABEL_49;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v17 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
  v37 = 2048;
  v38 = 60;
  v13 = (_BYTE *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v33 = 0;
  if (!__nwlog_fault(v13, &type, &v33))
    goto LABEL_29;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    v19 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
      v37 = 2048;
      v38 = 60;
      v20 = "%{public}s calloc(%zu) failed";
LABEL_26:
      v24 = v18;
      v25 = v19;
LABEL_27:
      _os_log_impl(&dword_182FBE000, v24, v25, v20, buf, 0x16u);
    }
  }
  else
  {
    if (v33)
    {
      v21 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v22 = type;
      v23 = os_log_type_enabled(v18, type);
      if (v21)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136446722;
          v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
          v37 = 2048;
          v38 = 60;
          v39 = 2082;
          v40 = v21;
          _os_log_impl(&dword_182FBE000, v18, v22, "%{public}s calloc(%zu) failed, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(v21);
        if (v13)
          goto LABEL_30;
        goto LABEL_31;
      }
      if (!v23)
        goto LABEL_28;
      *(_DWORD *)buf = 136446466;
      v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
      v37 = 2048;
      v38 = 60;
      v20 = "%{public}s calloc(%zu) failed, no backtrace";
      v24 = v18;
      v25 = v22;
      goto LABEL_27;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    v19 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
      v37 = 2048;
      v38 = 60;
      v20 = "%{public}s calloc(%zu) failed, backtrace limit exceeded";
      goto LABEL_26;
    }
  }
LABEL_28:

LABEL_29:
  if (v13)
    goto LABEL_30;
LABEL_31:

}

- (BOOL)receiveRemotePacket:(id)a3
{
  id v4;
  nw_protocol *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NWRemoteConnectionWriteRequest *v12;
  void *v13;
  void *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  char *backtrace_string;
  os_log_type_t v20;
  _BOOL4 v21;
  os_log_type_t v22;
  char v23;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    __nwlog_obj();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v23 = 0;
    if (__nwlog_fault(v16, &type, &v23))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)buf = 136446210;
          v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s called with null packet", buf, 0xCu);
        }
      }
      else if (v23)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        v20 = type;
        v21 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v21)
          {
            *(_DWORD *)buf = 136446466;
            v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
            v27 = 2082;
            v28 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v17, v20, "%{public}s called with null packet, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_28;
        }
        if (v21)
        {
          *(_DWORD *)buf = 136446210;
          v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl(&dword_182FBE000, v17, v20, "%{public}s called with null packet, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        v22 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)buf = 136446210;
          v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl(&dword_182FBE000, v17, v22, "%{public}s called with null packet, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_28:
    if (v16)
      free(v16);
    goto LABEL_11;
  }
  v5 = -[NWRemotePacketProxy outputHandlerForPacket:inbound:](self, "outputHandlerForPacket:inbound:", v4, 1);
  -[NWRemotePacketProxy writeRequests](self, "writeRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  while (1)
  {
    -[NWRemotePacketProxy writeRequests](self, "writeRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      break;
    -[NWRemotePacketProxy writeRequests](self, "writeRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!nw_remote_director_write_request((uint64_t)-[NWRemotePacketProxy packetProtocol](self, "packetProtocol"), (uint64_t)v5, v10))
    {

      break;
    }
    -[NWRemotePacketProxy writeRequests](self, "writeRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectAtIndex:", 0);

  }
  v12 = -[NWRemoteConnectionWriteRequest initWithData:clientID:]([NWRemoteConnectionWriteRequest alloc], "initWithData:clientID:", v4, 0);
  if (v8
    || !nw_remote_director_write_request((uint64_t)-[NWRemotePacketProxy packetProtocol](self, "packetProtocol"), (uint64_t)v5, v12))
  {
    -[NWRemotePacketProxy writeRequests](self, "writeRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v12);

  }
  objc_sync_exit(v6);

LABEL_11:
  return v4 != 0;
}

- (unsigned)receiveWindowPacketCount
{
  return self->_receiveWindowPacketCount;
}

- (NWRemotePacketProxyDelegate)delegate
{
  return (NWRemotePacketProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)writeRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWriteRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (nw_protocol)packetProtocol
{
  return self->_packetProtocol;
}

- (void)setPacketProtocol:(nw_protocol *)a3
{
  self->_packetProtocol = a3;
}

- (nw_protocol)defaultOutputHandler
{
  return self->_defaultOutputHandler;
}

- (void)setDefaultOutputHandler:(nw_protocol *)a3
{
  self->_defaultOutputHandler = a3;
}

- (nw_hash_table)packetHashTable
{
  return self->_packetHashTable;
}

- (void)setPacketHashTable:(nw_hash_table *)a3
{
  self->_packetHashTable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __51__NWRemotePacketProxy_setReceiveWindowPacketCount___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t *extra;

  extra = (uint64_t *)nw_hash_node_get_extra(a2);
  nw_remote_packet_input_available(objc_msgSend(*(id *)(a1 + 32), "packetProtocol"), *extra);
  return 1;
}

double __40__NWRemotePacketProxy_initWithDelegate___block_invoke()
{
  double result;

  initWithDelegate__NWRemotePacketProtocolIdentifier = 0u;
  unk_1EDCF1580 = 0u;
  *(_QWORD *)&result = 0x100000004;
  qword_1EDCF1590 = 0x100000004;
  initWithDelegate__NWRemotePacketProtocolCallbacks = (uint64_t)nw_protocol_default_add_input_handler;
  unk_1EDCF15A0 = nw_protocol_default_remove_input_handler;
  qword_1EDCF15E8 = (uint64_t)nw_protocol_default_get_input_frames;
  unk_1EDCF15F0 = nw_protocol_default_get_output_frames;
  qword_1EDCF15F8 = (uint64_t)nw_protocol_default_finalize_output_frames;
  unk_1EDCF1600 = nw_protocol_default_link_state;
  qword_1EDCF1618 = (uint64_t)nw_protocol_default_get_local;
  unk_1EDCF1620 = nw_protocol_default_get_remote;
  qword_1EDCF1608 = (uint64_t)nw_protocol_default_get_parameters;
  unk_1EDCF1610 = nw_protocol_default_get_path;
  qword_1EDCF1658 = (uint64_t)nw_protocol_default_output_finished;
  unk_1EDCF1660 = nw_protocol_default_get_output_local;
  qword_1EDCF15A8 = (uint64_t)nw_protocol_default_replace_input_handler;
  unk_1EDCF15B0 = nw_protocol_default_connect;
  qword_1EDCF15B8 = (uint64_t)nw_protocol_default_disconnect;
  unk_1EDCF15C0 = nw_protocol_default_connected;
  qword_1EDCF15C8 = (uint64_t)nw_protocol_default_disconnected;
  unk_1EDCF15D0 = nw_protocol_default_error;
  qword_1EDCF1698 = (uint64_t)nw_protocol_default_reset;
  unk_1EDCF16A0 = nw_protocol_default_input_flush;
  qword_1EDCF1648 = (uint64_t)nw_protocol_default_supports_external_data;
  unk_1EDCF1650 = nw_protocol_default_input_finished;
  qword_1EDCF1668 = (uint64_t)nw_protocol_default_get_output_interface;
  unk_1EDCF1670 = nw_protocol_default_waiting_for_output;
  qword_1EDCF1628 = (uint64_t)nw_protocol_default_register_notification;
  unk_1EDCF1630 = nw_protocol_default_unregister_notification;
  qword_1EDCF1638 = (uint64_t)nw_protocol_default_notify;
  unk_1EDCF1640 = nw_protocol_default_updated_path;
  qword_1EDCF1678 = (uint64_t)nw_protocol_default_copy_info;
  unk_1EDCF1680 = nw_protocol_default_add_listen_handler;
  qword_1EDCF1688 = (uint64_t)nw_protocol_default_remove_listen_handler;
  unk_1EDCF1690 = nw_protocol_default_get_message_properties;
  qword_1EDCF15D8 = (uint64_t)nw_remote_packet_input_available;
  unk_1EDCF15E0 = nw_remote_packet_output_available;
  return result;
}

@end
