@implementation NWRemoteConnectionActor

- (NWRemoteConnectionActor)initWithDelegate:(id)a3
{
  id v4;
  NWRemoteConnectionActor *v5;
  NWRemoteConnectionActor *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *connections;
  NSMutableDictionary *v9;
  NSMutableDictionary *browsers;
  void *v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  void *v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  char *v22;
  _BOOL4 v23;
  char *backtrace_string;
  _BOOL4 v25;
  objc_super v26;
  char v27;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v26.receiver = self;
    v26.super_class = (Class)NWRemoteConnectionActor;
    v5 = -[NWRemoteConnectionActor init](&v26, sel_init);
    if (v5)
    {
      v6 = v5;
      objc_storeWeak((id *)&v5->_delegate, v4);
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      connections = v6->_connections;
      v6->_connections = v7;

      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      browsers = v6->_browsers;
      v6->_browsers = v9;

      goto LABEL_4;
    }
    __nwlog_obj();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v27 = 0;
    if (!__nwlog_fault(v18, &type, &v27))
      goto LABEL_38;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v21 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v19, v20, v21, buf, 0xCu);
      }
    }
    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = type;
      v25 = os_log_type_enabled(v19, type);
      if (backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446466;
          v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
          v31 = 2082;
          v32 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v19, v20, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v18)
      free(v18);
    v6 = 0;
    goto LABEL_4;
  }
  __nwlog_obj();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
  v13 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v27 = 0;
  if (__nwlog_fault(v13, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v16 = "%{public}s called with null delegate";
LABEL_29:
        _os_log_impl(&dword_182FBE000, v14, v15, v16, buf, 0xCu);
      }
    }
    else
    {
      if (v27)
      {
        v22 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = type;
        v23 = os_log_type_enabled(v14, type);
        if (v22)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
            v31 = 2082;
            v32 = v22;
            _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v22);
          goto LABEL_31;
        }
        if (!v23)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v16 = "%{public}s called with null delegate, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v16 = "%{public}s called with null delegate, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:

  }
LABEL_31:
  if (v13)
    free(v13);

  v6 = 0;
LABEL_4:

  return v6;
}

- (void)updatePathForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NWPBUpdatePath *v15;
  NWPBUpdatePath *v16;
  NWPBCommandMessage *v17;
  id *p_isa;
  void *v19;
  NSObject *v20;
  uint64_t isa_low;
  char *v22;
  char *v23;
  Class isa;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  const char *v33;
  char *backtrace_string;
  _BOOL4 v35;
  char v36;
  os_log_type_t type;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  char *v42;
  __int16 v43;
  objc_class *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "connectionState");

    if (v7 == 2)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}s Skipping update path for connection in preparing state", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v5, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentPath");
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v10 = -[NSObject createProtocolBufferObject](v8, "createProtocolBufferObject");
        objc_msgSend(v5, "clientID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_storeStrong((id *)&v10[2].isa, v12);

        objc_msgSend(v5, "connection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "connectionState");

        if (v14 != 3 && v10)
        {
          LOBYTE(v10[8].isa) |= 1u;
          LODWORD(v10[7].isa) = 2;
        }
        v15 = objc_alloc_init(NWPBUpdatePath);
        v16 = v15;
        if (v15)
          objc_storeStrong((id *)&v15->_responsePath, v10);
        v17 = objc_alloc_init(NWPBCommandMessage);
        p_isa = (id *)&v17->super.super.isa;
        if (v17)
        {
          *(_BYTE *)&v17->_has |= 1u;
          v17->_command = 2;
          -[NWPBUpdatePath data](v16, "data");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(p_isa + 2, v19);
        }
        else
        {
          -[NWPBUpdatePath data](v16, "data");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          if (v10)
          {
            if (((uint64_t)v10[8].isa & 1) != 0)
              isa_low = SLODWORD(v10[7].isa);
            else
              isa_low = 0;
            +[NWPath createStringFromStatus:](NWPath, "createStringFromStatus:", isa_low);
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            isa = v10[2].isa;
          }
          else
          {
            +[NWPath createStringFromStatus:](NWPath, "createStringFromStatus:", 0);
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            isa = 0;
          }
          v25 = isa;
          *(_DWORD *)buf = 136446722;
          v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
          v41 = 2114;
          v42 = v23;
          v43 = 2114;
          v44 = v25;
          _os_log_impl(&dword_182FBE000, v20, OS_LOG_TYPE_DEBUG, "%{public}s Updating path (%{public}@) for %{public}@", buf, 0x20u);

        }
        -[NWRemoteConnectionActor delegate](self, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa, "data");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sendRemoteReplies:", v28);

      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "connection");
          v22 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
          v41 = 2114;
          v42 = v22;
          _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_DEBUG, "%{public}s No path for %{public}@", buf, 0x16u);

        }
      }

    }
    goto LABEL_27;
  }
  __nwlog_obj();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
  v30 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v36 = 0;
  if (__nwlog_fault(v30, &type, &v36))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = type;
      if (os_log_type_enabled(v31, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        v33 = "%{public}s called with null wrapper";
LABEL_41:
        _os_log_impl(&dword_182FBE000, v31, v32, v33, buf, 0xCu);
      }
    }
    else
    {
      if (v36)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = type;
        v35 = os_log_type_enabled(v31, type);
        if (backtrace_string)
        {
          if (v35)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
            v41 = 2082;
            v42 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v31, v32, "%{public}s called with null wrapper, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_43;
        }
        if (!v35)
          goto LABEL_42;
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        v33 = "%{public}s called with null wrapper, no backtrace";
        goto LABEL_41;
      }
      __nwlog_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = type;
      if (os_log_type_enabled(v31, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        v33 = "%{public}s called with null wrapper, backtrace limit exceeded";
        goto LABEL_41;
      }
    }
LABEL_42:

  }
LABEL_43:
  if (v30)
    free(v30);
LABEL_27:

}

- (void)sendData:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NWPBSendData *v9;
  void *messageData;
  void *v11;
  void *v12;
  NSData *v13;
  NWPBCommandMessage *v14;
  id *p_isa;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  void *v25;
  char *backtrace_string;
  _BOOL4 v27;
  char *v28;
  _BOOL4 v29;
  char v30;
  os_log_type_t type;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
    v21 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v30 = 0;
    if (!__nwlog_fault(v21, &type, &v30))
      goto LABEL_38;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        v24 = "%{public}s called with null data";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v22, v23, v24, buf, 0xCu);
      }
    }
    else if (v30)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      v27 = os_log_type_enabled(v22, type);
      if (backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446466;
          v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
          v35 = 2082;
          v36 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s called with null data, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_38:
        if (!v21)
          goto LABEL_8;
LABEL_39:
        free(v21);
        goto LABEL_8;
      }
      if (v27)
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        v24 = "%{public}s called with null data, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      __nwlog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        v24 = "%{public}s called with null data, backtrace limit exceeded";
        goto LABEL_36;
      }
    }
LABEL_37:

    goto LABEL_38;
  }
  if (v7)
  {
    v9 = objc_alloc_init(NWPBSendData);
    objc_msgSend(v8, "clientID");
    messageData = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(messageData, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_clientUUID, v11);

      v13 = (NSData *)v6;
      messageData = v9->_messageData;
      v9->_messageData = v13;
    }
    else
    {

    }
    v14 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v14->super.super.isa;
    if (v14)
    {
      *(_BYTE *)&v14->_has |= 1u;
      v14->_command = 4;
      -[NWPBSendData data](v9, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v16);
    }
    else
    {
      -[NWPBSendData data](v9, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[NWRemoteConnectionActor delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendRemoteReplies:", v19);

    goto LABEL_8;
  }
  __nwlog_obj();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
  v21 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v30 = 0;
  if (!__nwlog_fault(v21, &type, &v30))
    goto LABEL_38;
  if (type == OS_LOG_TYPE_FAULT)
  {
    __nwlog_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = type;
    if (os_log_type_enabled(v22, type))
    {
      *(_DWORD *)buf = 136446210;
      v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
      v24 = "%{public}s called with null wrapper";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  if (!v30)
  {
    __nwlog_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = type;
    if (os_log_type_enabled(v22, type))
    {
      *(_DWORD *)buf = 136446210;
      v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
      v24 = "%{public}s called with null wrapper, backtrace limit exceeded";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  v28 = (char *)__nw_create_backtrace_string();
  __nwlog_obj();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = type;
  v29 = os_log_type_enabled(v22, type);
  if (!v28)
  {
    if (v29)
    {
      *(_DWORD *)buf = 136446210;
      v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
      v24 = "%{public}s called with null wrapper, no backtrace";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  if (v29)
  {
    *(_DWORD *)buf = 136446466;
    v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
    v35 = 2082;
    v36 = v28;
    _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s called with null wrapper, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v28);
  if (v21)
    goto LABEL_39;
LABEL_8:

}

- (void)updateEndpointsForBrowser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NWPBUpdateBrowse *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  NSMutableArray *discoveredEndpoints;
  NSMutableArray *v18;
  NSMutableArray *v19;
  NWPBCommandMessage *v20;
  id *p_isa;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  char *backtrace_string;
  _BOOL4 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char v41;
  os_log_type_t type;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "browser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "discoveredEndpoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(NWPBUpdateBrowse);
    objc_msgSend(v5, "clientID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_storeStrong((id *)&v8->_clientUUID, v10);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v11);
          v16 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "createProtocolBufferObject");
          if (v8)
          {
            discoveredEndpoints = v8->_discoveredEndpoints;
            if (!discoveredEndpoints)
            {
              v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v19 = v8->_discoveredEndpoints;
              v8->_discoveredEndpoints = v18;

              discoveredEndpoints = v8->_discoveredEndpoints;
            }
            -[NSMutableArray addObject:](discoveredEndpoints, "addObject:", v16);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      }
      while (v13);
    }

    v20 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v20->super.super.isa;
    if (v20)
    {
      *(_BYTE *)&v20->_has |= 1u;
      v20->_command = 6;
      -[NWPBUpdateBrowse data](v8, "data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_isa + 2, v22);
    }
    else
    {
      -[NWPBUpdateBrowse data](v8, "data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v23 = (id)gLogObj;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = objc_msgSend(v11, "count");
      objc_msgSend(v5, "clientID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
      v46 = 1024;
      LODWORD(v47[0]) = v24;
      WORD2(v47[0]) = 2114;
      *(_QWORD *)((char *)v47 + 6) = v26;
      _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_DEBUG, "%{public}s Updating browse results (%u) for %{public}@", buf, 0x1Cu);

    }
    -[NWRemoteConnectionActor delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "data");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sendRemoteReplies:", v29);

    goto LABEL_20;
  }
  __nwlog_obj();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
  v31 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v41 = 0;
  if (__nwlog_fault(v31, &type, &v41))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper";
LABEL_34:
        _os_log_impl(&dword_182FBE000, v32, v33, v34, buf, 0xCu);
      }
    }
    else
    {
      if (v41)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = type;
        v36 = os_log_type_enabled(v32, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
            v46 = 2082;
            v47[0] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v32, v33, "%{public}s called with null wrapper, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_36;
        }
        if (!v36)
          goto LABEL_35;
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper, no backtrace";
        goto LABEL_34;
      }
      __nwlog_obj();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper, backtrace limit exceeded";
        goto LABEL_34;
      }
    }
LABEL_35:

  }
LABEL_36:
  if (v31)
    free(v31);
LABEL_20:

}

- (void)scheduleReadsOnConnection:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id *v8;
  char v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke;
    v12[3] = &unk_1E14A3210;
    v12[4] = self;
    v8 = &v13;
    v13 = v4;
    objc_msgSend(v7, "readDataWithMinimumLength:maximumLength:completionHandler:", 1, 0x100000, v12);
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v4, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke_32;
    v10[3] = &unk_1E14A3238;
    v10[4] = self;
    v8 = &v11;
    v11 = v4;
    objc_msgSend(v7, "readDatagramsWithMinimumCount:maximumCount:completionHandler:", 1, 1, v10);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("connectionState")))
  {
    v11 = v10;
    v12 = a6;
    objc_msgSend(v12, "connection");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 != v11)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        objc_msgSend(v12, "connection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 136446722;
        v22 = "-[NWRemoteConnectionActor observeValueForKeyPath:ofObject:change:context:]";
        v23 = 2048;
        v24 = v15;
        v25 = 2048;
        v26 = v11;
        v16 = "%{public}s Connection wrapper invalid: %p != %p";
LABEL_13:
        _os_log_impl(&dword_182FBE000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, 0x20u);

      }
LABEL_14:

LABEL_18:
      goto LABEL_19;
    }
    if (objc_msgSend(v11, "connectionState") == 3)
      -[NWRemoteConnectionActor scheduleReadsOnConnection:](self, "scheduleReadsOnConnection:", v12);
    goto LABEL_17;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("currentPath")))
  {
    v11 = v10;
    v12 = a6;
    objc_msgSend(v12, "connection");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 != v11)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      goto LABEL_14;
    }
LABEL_17:
    -[NWRemoteConnectionActor updatePathForConnection:](self, "updatePathForConnection:", v12);
    goto LABEL_18;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("discoveredEndpoints")))
  {
    v18 = v10;
    v19 = a6;
    objc_msgSend(v19, "browser");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20 == v18)
    {
      -[NWRemoteConnectionActor updateEndpointsForBrowser:](self, "updateEndpointsForBrowser:", v19);
      goto LABEL_18;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    objc_msgSend(v19, "browser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136446722;
    v22 = "-[NWRemoteConnectionActor observeValueForKeyPath:ofObject:change:context:]";
    v23 = 2048;
    v24 = v15;
    v25 = 2048;
    v26 = v18;
    v16 = "%{public}s Browser wrapper invalid: %p != %p";
    goto LABEL_13;
  }
LABEL_19:

}

- (BOOL)receiveRemoteCommand:(id)a3
{
  char *v4;
  NWPBCommandMessage *v5;
  NWPBCommandMessage *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  BOOL v11;
  int command;
  NWPBOpenConnection *v14;
  NSData *v15;
  id v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  NWRemoteConnectionWrapper *v26;
  void *v27;
  NWPBCloseConnection *v28;
  NSData *v29;
  id v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  NWPBSendData *v35;
  NSData *v36;
  id v37;
  objc_class *v38;
  char *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NWPBStartBrowse *v44;
  NSData *v45;
  id v46;
  objc_class *v47;
  objc_class *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  NWBrowser *v52;
  NWRemoteBrowserWrapper *v53;
  void *v54;
  NWPBStopBrowse *v55;
  NSData *v56;
  id v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  const char *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  char *v73;
  NSObject *v74;
  os_log_type_t v75;
  const char *v76;
  char *backtrace_string;
  _BOOL4 v78;
  char v79;
  os_log_type_t type;
  NSObject *v81;
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  char *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
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
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v84 = 2114;
        v85 = v4;
        v8 = "%{public}s Could not parse command: %{public}@";
        v9 = v7;
        v10 = 22;
LABEL_15:
        _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    if ((*(_BYTE *)&v5->_has & 1) == 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Command missing command value";
LABEL_14:
        v9 = v7;
        v10 = 12;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if (!v5->_messageData)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Command missing message data";
        goto LABEL_14;
      }
LABEL_16:
      v11 = 0;
LABEL_17:

      goto LABEL_18;
    }
    switch(v5->_command)
    {
      case 0:
        __nwlog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Invalid command sent to connection receiver";
        goto LABEL_14;
      case 1:
        v14 = [NWPBOpenConnection alloc];
        v15 = v6->_messageData;
        v7 = -[NWPBOpenConnection initWithData:](v14, "initWithData:", v15);

        if (!v7)
        {
          __nwlog_obj();
          v63 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            goto LABEL_76;
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Open connection message could not be parsed";
          goto LABEL_60;
        }
        v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v17 = v7[1].isa;
        v18 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);

        if (v18)
        {
          v19 = v7[2].isa;
          -[objc_class data](v19, "data");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[NWEndpoint endpointWithProtocolBufferData:](NWEndpoint, "endpointWithProtocolBufferData:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v7[3].isa;
          -[objc_class data](v22, "data");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[NWParameters parametersWithProtocolBufferData:](NWParameters, "parametersWithProtocolBufferData:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          +[NWConnection connectionWithEndpoint:parameters:](NWConnection, "connectionWithEndpoint:parameters:", v21, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_alloc_init(NWRemoteConnectionWrapper);
          -[NWRemoteConnectionWrapper setClientID:](v26, "setClientID:", v18);
          -[NWRemoteConnectionWrapper setConnection:](v26, "setConnection:", v25);
          -[NWRemoteConnectionActor connections](self, "connections");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v18);

          objc_msgSend(v25, "addObserver:forKeyPath:options:context:", self, CFSTR("connectionState"), 5, v26);
          objc_msgSend(v25, "addObserver:forKeyPath:options:context:", self, CFSTR("currentPath"), 5, v26);

          goto LABEL_32;
        }
        __nwlog_obj();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v66 = "%{public}s Open connection missing client ID";
          goto LABEL_74;
        }
        goto LABEL_75;
      case 2:
        __nwlog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Update Path command is not valid to send to connection receiver";
        goto LABEL_14;
      case 3:
        v28 = [NWPBCloseConnection alloc];
        v29 = v6->_messageData;
        v7 = -[NWPBCloseConnection initWithData:](v28, "initWithData:", v29);

        if (!v7)
        {
          __nwlog_obj();
          v63 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            goto LABEL_76;
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Close connection message could not be parsed";
          goto LABEL_60;
        }
        v30 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v31 = v7[1].isa;
        v18 = (void *)objc_msgSend(v30, "initWithUUIDString:", v31);

        if (v18)
        {
          -[NWRemoteConnectionActor connections](self, "connections");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v18);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "connection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "removeObserver:forKeyPath:", self, CFSTR("connectionState"));
          objc_msgSend(v21, "removeObserver:forKeyPath:", self, CFSTR("currentPath"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v21, "writeCloseWithCompletionHandler:", &__block_literal_global_47421);
          objc_msgSend(v21, "cancel");
          -[NWRemoteConnectionActor connections](self, "connections");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", 0, v18);

LABEL_32:
          goto LABEL_49;
        }
        __nwlog_obj();
        v65 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          goto LABEL_75;
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v66 = "%{public}s Close connection missing client ID";
        goto LABEL_74;
      case 4:
        v35 = [NWPBSendData alloc];
        v36 = v6->_messageData;
        v7 = -[NWPBSendData initWithData:](v35, "initWithData:", v36);

        if (!v7)
        {
          __nwlog_obj();
          v63 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            goto LABEL_76;
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Send data message could not be parsed";
          goto LABEL_60;
        }
        v37 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v38 = v7[1].isa;
        v39 = (char *)objc_msgSend(v37, "initWithUUIDString:", v38);

        if (v39)
        {
          -[NWRemoteConnectionActor connections](self, "connections");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "connection");
          v42 = objc_claimAutoreleasedReturnValue();

          v11 = v42 != 0;
          if (v42)
          {
            v43 = v7[2].isa;
            if (v43)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[NSObject writeData:completionHandler:](v42, "writeData:completionHandler:", v43, &__block_literal_global_48_47426);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v81 = v43;
                  v69 = (void *)MEMORY[0x1E0C99D20];
                  v70 = v42;
                  objc_msgSend(v69, "arrayWithObjects:count:", &v81, 1);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject writeDatagrams:completionHandler:](v70, "writeDatagrams:completionHandler:", v71, &__block_literal_global_50_47429);

                }
              }
            }
          }
          else
          {
            __nwlog_obj();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
              v84 = 2114;
              v85 = v39;
              _os_log_impl(&dword_182FBE000, v43, OS_LOG_TYPE_ERROR, "%{public}s Send data could not find connection for %{public}@", buf, 0x16u);
            }
          }
          goto LABEL_86;
        }
        __nwlog_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          goto LABEL_77;
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v67 = "%{public}s Send data missing client ID";
        goto LABEL_71;
      case 5:
        v44 = [NWPBStartBrowse alloc];
        v45 = v6->_messageData;
        v7 = -[NWPBStartBrowse initWithData:](v44, "initWithData:", v45);

        if (!v7)
        {
          __nwlog_obj();
          v63 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            goto LABEL_76;
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Start browse message could not be parsed";
LABEL_60:
          _os_log_impl(&dword_182FBE000, v63, OS_LOG_TYPE_ERROR, v64, buf, 0xCu);
LABEL_76:
          v11 = 0;

          goto LABEL_17;
        }
        v46 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v47 = v7[1].isa;
        v39 = (char *)objc_msgSend(v46, "initWithUUIDString:", v47);

        if (!v39)
        {
          __nwlog_obj();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
            v67 = "%{public}s Start browse missing client ID";
LABEL_71:
            _os_log_impl(&dword_182FBE000, v42, OS_LOG_TYPE_ERROR, v67, buf, 0xCu);
            v11 = 0;
          }
          else
          {
LABEL_77:
            v11 = 0;
          }
          goto LABEL_87;
        }
        v48 = v7[2].isa;
        -[objc_class data](v48, "data");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[NWBrowseDescriptor descriptorWithProtocolBufferData:](NWBrowseDescriptor, "descriptorWithProtocolBufferData:", v49);
        v42 = objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v50 = v7[3].isa;
          -[objc_class data](v50, "data");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          +[NWParameters parametersWithProtocolBufferData:](NWParameters, "parametersWithProtocolBufferData:", v51);
          v43 = objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            v52 = -[NWBrowser initWithDescriptor:parameters:]([NWBrowser alloc], "initWithDescriptor:parameters:", v42, v43);
            v53 = objc_alloc_init(NWRemoteBrowserWrapper);
            -[NWRemoteBrowserWrapper setClientID:](v53, "setClientID:", v39);
            -[NWRemoteBrowserWrapper setBrowser:](v53, "setBrowser:", v52);
            -[NWRemoteConnectionActor browsers](self, "browsers");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, v39);

            -[NWBrowser addObserver:forKeyPath:options:context:](v52, "addObserver:forKeyPath:options:context:", self, CFSTR("discoveredEndpoints"), 5, v53);
            v11 = 1;
LABEL_86:

LABEL_87:
            goto LABEL_17;
          }
          __nwlog_obj();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
            _os_log_impl(&dword_182FBE000, v68, OS_LOG_TYPE_ERROR, "%{public}s Start browse missing parameters", buf, 0xCu);
          }

          v43 = 0;
        }
        else
        {
          __nwlog_obj();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
            _os_log_impl(&dword_182FBE000, v43, OS_LOG_TYPE_ERROR, "%{public}s Start browse missing descriptor", buf, 0xCu);
          }
        }
        v11 = 0;
        goto LABEL_86;
      case 6:
        __nwlog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Update Browse command is not valid to send to connection receiver";
        goto LABEL_14;
      case 7:
        v55 = [NWPBStopBrowse alloc];
        v56 = v6->_messageData;
        v7 = -[NWPBStopBrowse initWithData:](v55, "initWithData:", v56);

        if (!v7)
        {
          __nwlog_obj();
          v63 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            goto LABEL_76;
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Stop browse message could not be parsed";
          goto LABEL_60;
        }
        v57 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v58 = v7[1].isa;
        v18 = (void *)objc_msgSend(v57, "initWithUUIDString:", v58);

        if (v18)
        {
          -[NWRemoteConnectionActor browsers](self, "browsers");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", v18);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "browser");
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "removeObserver:forKeyPath:", self, CFSTR("discoveredEndpoints"));
          objc_msgSend(v61, "cancel");
          -[NWRemoteConnectionActor browsers](self, "browsers");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setObject:forKeyedSubscript:", 0, v18);

LABEL_49:
          v11 = 1;

          goto LABEL_17;
        }
        __nwlog_obj();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v66 = "%{public}s Stop browse missing client ID";
LABEL_74:
          _os_log_impl(&dword_182FBE000, v65, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);
        }
LABEL_75:

        v63 = 0;
        goto LABEL_76;
      default:
        __nwlog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        if ((*(_BYTE *)&v6->_has & 1) != 0)
          command = v6->_command;
        else
          command = 0;
        *(_DWORD *)buf = 136446466;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v84 = 1024;
        LODWORD(v85) = command;
        v8 = "%{public}s Unknown command %u sent to connection receiver";
        v9 = v7;
        v10 = 18;
        goto LABEL_15;
    }
  }
  __nwlog_obj();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
  v73 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v79 = 0;
  if (__nwlog_fault(v73, &type, &v79))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = type;
      if (os_log_type_enabled(v74, type))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v76 = "%{public}s called with null commandData";
LABEL_103:
        _os_log_impl(&dword_182FBE000, v74, v75, v76, buf, 0xCu);
      }
    }
    else
    {
      if (v79)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v74 = objc_claimAutoreleasedReturnValue();
        v75 = type;
        v78 = os_log_type_enabled(v74, type);
        if (backtrace_string)
        {
          if (v78)
          {
            *(_DWORD *)buf = 136446466;
            v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
            v84 = 2082;
            v85 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v74, v75, "%{public}s called with null commandData, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_105;
        }
        if (!v78)
          goto LABEL_104;
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v76 = "%{public}s called with null commandData, no backtrace";
        goto LABEL_103;
      }
      __nwlog_obj();
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = type;
      if (os_log_type_enabled(v74, type))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v76 = "%{public}s called with null commandData, backtrace limit exceeded";
        goto LABEL_103;
      }
    }
LABEL_104:

  }
LABEL_105:
  if (v73)
    free(v73);
  v11 = 0;
LABEL_18:

  return v11;
}

- (NWRemoteConnectionActorDelegate)delegate
{
  return (NWRemoteConnectionActorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)browsers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBrowsers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsers, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke_49(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      v6 = 2114;
      v7 = v2;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_ERROR, "%{public}s Write had error %{public}@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke_47(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      v6 = 2114;
      v7 = v2;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_ERROR, "%{public}s Write had error %{public}@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      v6 = 2114;
      v7 = v2;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_ERROR, "%{public}s Write close had error %{public}@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "sendData:forConnection:", v5, *(_QWORD *)(a1 + 40));
  if (v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136446466;
      v10 = "-[NWRemoteConnectionActor scheduleReadsOnConnection:]_block_invoke";
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_DEBUG, "%{public}s Read length had error %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduleReadsOnConnection:", *(_QWORD *)(a1 + 40));
  }

}

void __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "sendData:forConnection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), *(_QWORD *)(a1 + 40));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v8);
  }
  if (v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[NWRemoteConnectionActor scheduleReadsOnConnection:]_block_invoke";
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_DEBUG, "%{public}s Read had error %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cancel");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduleReadsOnConnection:", *(_QWORD *)(a1 + 40));
  }

}

@end
