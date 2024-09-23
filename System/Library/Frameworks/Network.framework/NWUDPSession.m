@implementation NWUDPSession

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("maximumDatagramLength")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWUDPSession;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (NWUDPSession)initWithConnection:(id)a3
{
  id v4;
  NWUDPSession *v5;
  NWDatagramConnection *v6;
  NWDatagramConnection *connection;
  void *v8;
  NWEndpoint *v9;
  NWEndpoint *endpoint;
  void *v11;
  NWParameters *v12;
  NWParameters *parameters;
  NWUDPSession *v14;
  void *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  char *backtrace_string;
  _BOOL4 v26;
  char *v27;
  _BOOL4 v28;
  objc_super v30;
  char v31;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    __nwlog_obj();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWUDPSession initWithConnection:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v31 = 0;
    if (!__nwlog_fault(v16, &type, &v31))
      goto LABEL_31;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v19 = "%{public}s called with null internalConnection";
LABEL_29:
        _os_log_impl(&dword_182FBE000, v17, v18, v19, buf, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = type;
        v26 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            v34 = "-[NWUDPSession initWithConnection:]";
            v35 = 2082;
            v36 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s called with null internalConnection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_31;
        }
        if (!v26)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v19 = "%{public}s called with null internalConnection, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v19 = "%{public}s called with null internalConnection, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:

LABEL_31:
    if (v16)
      free(v16);
    goto LABEL_40;
  }
  v30.receiver = self;
  v30.super_class = (Class)NWUDPSession;
  v5 = -[NWUDPSession init](&v30, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWUDPSession initWithConnection:]";
    v21 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v31 = 0;
    if (!__nwlog_fault((const char *)v21, &type, &v31))
    {
LABEL_37:
      if (v21)
        free(v21);
      self = 0;
      goto LABEL_40;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v24 = "%{public}s [super init] failed";
LABEL_35:
        _os_log_impl(&dword_182FBE000, v22, v23, v24, buf, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        v27 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = type;
        v28 = os_log_type_enabled(v22, type);
        if (v27)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446466;
            v34 = "-[NWUDPSession initWithConnection:]";
            v35 = 2082;
            v36 = v27;
            _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v27);
          goto LABEL_37;
        }
        if (!v28)
          goto LABEL_36;
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v24 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_35;
      }
      __nwlog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        v24 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_35;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  self = v5;
  +[NWConnection connectionWithInternalConnection:](NWDatagramConnection, "connectionWithInternalConnection:", v4);
  v6 = (NWDatagramConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v6;

  if (!self->_connection)
  {
LABEL_40:
    v14 = 0;
    goto LABEL_41;
  }
  -[NWUDPSession connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endpoint");
  v9 = (NWEndpoint *)objc_claimAutoreleasedReturnValue();
  endpoint = self->_endpoint;
  self->_endpoint = v9;

  -[NWUDPSession connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parameters");
  v12 = (NWParameters *)objc_claimAutoreleasedReturnValue();
  parameters = self->_parameters;
  self->_parameters = v12;

  -[NWUDPSession setupEventHandler](self, "setupEventHandler");
  self = self;
  v14 = self;
LABEL_41:

  return v14;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NWUDPSession *v21;
  id v22;

  v22 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("connectionState")))
  {
    -[NWUDPSession connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "connectionState");

    if (v12 == 3)
    {
      -[NWUDPSession connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "connectedRemoteEndpoint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWUDPSession setResolvedEndpoint:](self, "setResolvedEndpoint:", v14);

      -[NWUDPSession setState:](self, "setState:", 3);
      -[NWUDPSession readInternal](self, "readInternal");
    }
    else
    {
      -[NWUDPSession setState:](self, "setState:", v12);
    }
  }
  else if (objc_msgSend(v22, "isEqualToString:", CFSTR("hasBetterPath")))
  {
    -[NWUDPSession connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWUDPSession setHasBetterPath:](self, "setHasBetterPath:", objc_msgSend(v15, "hasBetterPath"));

  }
  else if (objc_msgSend(v22, "isEqualToString:", CFSTR("viable")))
  {
    -[NWUDPSession connection](self, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWUDPSession setViable:](self, "setViable:", objc_msgSend(v16, "isViable"));

  }
  else if (objc_msgSend(v22, "isEqualToString:", CFSTR("currentPath")))
  {
    -[NWUDPSession connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWUDPSession setCurrentPath:](self, "setCurrentPath:", v18);

    -[NWUDPSession currentPath](self, "currentPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "maximumDatagramSize");

    v21 = self;
    objc_sync_enter(v21);
    if (v20 == -[NWUDPSession internalMTU](v21, "internalMTU"))
    {
      objc_sync_exit(v21);

    }
    else
    {
      -[NWUDPSession willChangeValueForKey:](v21, "willChangeValueForKey:", CFSTR("maximumDatagramLength"));
      -[NWUDPSession setInternalMTU:](v21, "setInternalMTU:", v20);
      objc_sync_exit(v21);

      -[NWUDPSession didChangeValueForKey:](v21, "didChangeValueForKey:", CFSTR("maximumDatagramLength"));
    }
  }

}

- (void)setupEventHandler
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NWUDPSession connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("connectionState"), 5, 0);

  -[NWUDPSession connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("hasBetterPath"), 5, 0);

  -[NWUDPSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("viable"), 5, 0);

  -[NWUDPSession connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("currentPath"), 5, 0);

}

- (NWUDPSession)initWithEndpoint:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  NWUDPSession *v9;
  NWUDPSession *v10;
  uint64_t v11;
  NWDatagramConnection *connection;
  NWUDPSession *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  char *backtrace_string;
  _BOOL4 v20;
  char v22;
  os_log_type_t type;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)NWUDPSession;
  v9 = -[NWUDPSession init](&v24, sel_init);
  v10 = v9;
  if (!v9)
  {
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v22 = 0;
    if (!__nwlog_fault(v15, &type, &v22))
      goto LABEL_19;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        v18 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v16, v17, v18, buf, 0xCu);
      }
    }
    else
    {
      if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = type;
        v20 = os_log_type_enabled(v16, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
            v27 = 2082;
            v28 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v20)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

LABEL_19:
    if (v15)
      free(v15);
    goto LABEL_21;
  }
  v9->_internalMTU = 1500;
  objc_storeStrong((id *)&v9->_endpoint, a3);
  objc_msgSend(v8, "setDataMode:", 1);
  objc_storeStrong((id *)&v10->_parameters, a4);
  +[NWConnection connectionWithEndpoint:parameters:](NWDatagramConnection, "connectionWithEndpoint:parameters:", v7, v8);
  v11 = objc_claimAutoreleasedReturnValue();
  connection = v10->_connection;
  v10->_connection = (NWDatagramConnection *)v11;

  if (!v10->_connection)
  {
LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  -[NWUDPSession setupEventHandler](v10, "setupEventHandler");
  v13 = v10;
LABEL_22:

  return v13;
}

- (NWUDPSession)initWithUpgradeForSession:(NWUDPSession *)session
{
  NWUDPSession *v4;
  void *v5;
  void *v6;
  NWUDPSession *v7;

  v4 = session;
  -[NWUDPSession endpoint](v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWUDPSession parameters](v4, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NWUDPSession initWithEndpoint:parameters:](self, "initWithEndpoint:parameters:", v5, v6);
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[NWUDPSession connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("connectionState"));

  -[NWUDPSession connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("viable"));

  -[NWUDPSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("hasBetterPath"));

  -[NWUDPSession connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("currentPath"));

  v7.receiver = self;
  v7.super_class = (Class)NWUDPSession;
  -[NWUDPSession dealloc](&v7, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendString:", CFSTR("{"));
  -[NWUDPSession parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("parameters"), v5, v4);

  -[NWUDPSession endpoint](self, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("endpoint"), v5, v4);

  objc_msgSend(v7, "appendString:", CFSTR("\n}"));
  return v7;
}

- (id)description
{
  return -[NWUDPSession descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSString)privateDescription
{
  return (NSString *)-[NWUDPSession descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (void)tryNextResolvedEndpoint
{
  id v2;

  -[NWUDPSession connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelCurrentEndpoint");

}

- (NSUInteger)maximumDatagramLength
{
  NWUDPSession *v2;
  NSUInteger v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWUDPSession internalMTU](v2, "internalMTU");
  objc_sync_exit(v2);

  return v3;
}

- (void)readInternal
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD v9[5];

  -[NWUDPSession readHandler](self, "readHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[NWUDPSession connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "connectionState");

    if (v6 == 3)
    {
      -[NWUDPSession connection](self, "connection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NWUDPSession maxReadDatagrams](self, "maxReadDatagrams");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __28__NWUDPSession_readInternal__block_invoke;
      v9[3] = &unk_1E14A2110;
      v9[4] = self;
      objc_msgSend(v7, "readDatagramsWithMinimumCount:maximumCount:completionHandler:", 0, v8, v9);

    }
  }
}

- (void)setReadHandler:(void *)handler maxDatagrams:(NSUInteger)maxDatagrams
{
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  char *backtrace_string;
  _BOOL4 v12;
  char v13;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (handler)
  {
    -[NWUDPSession setReadHandler:](self, "setReadHandler:");
    -[NWUDPSession setMaxReadDatagrams:](self, "setMaxReadDatagrams:", maxDatagrams);
    -[NWUDPSession readInternal](self, "readInternal");
    return;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        v10 = "%{public}s called with null handler";
LABEL_16:
        _os_log_impl(&dword_182FBE000, v8, v9, v10, buf, 0xCu);
      }
    }
    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = type;
        v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
            v17 = 2082;
            v18 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_18;
        }
        if (!v12)
          goto LABEL_17;
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        v10 = "%{public}s called with null handler, no backtrace";
        goto LABEL_16;
      }
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        v10 = "%{public}s called with null handler, backtrace limit exceeded";
        goto LABEL_16;
      }
    }
LABEL_17:

  }
LABEL_18:
  if (v7)
    free(v7);
}

- (void)writeMultipleDatagrams:(NSArray *)datagramArray completionHandler:(void *)completionHandler
{
  void *v6;
  NSArray *v7;
  id v8;

  v6 = completionHandler;
  v7 = datagramArray;
  -[NWUDPSession connection](self, "connection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeDatagrams:completionHandler:", v7, v6);

}

- (void)writeDatagram:(NSData *)datagram completionHandler:(void *)completionHandler
{
  void *v6;
  NSData *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = completionHandler;
  v7 = datagram;
  -[NWUDPSession connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "writeDatagrams:completionHandler:", v9, v6);
}

- (void)cancel
{
  id v2;

  -[NWUDPSession connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (NSString)localPort
{
  void *v2;
  void *v3;
  void *v4;

  -[NWUDPSession connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedLocalEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "port");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NWUDPSessionState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (NWEndpoint)resolvedEndpoint
{
  return self->_resolvedEndpoint;
}

- (void)setResolvedEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedEndpoint, a3);
}

- (BOOL)isViable
{
  return self->_viable;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)hasBetterPath
{
  return self->_hasBetterPath;
}

- (void)setHasBetterPath:(BOOL)a3
{
  self->_hasBetterPath = a3;
}

- (NWPath)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentPath, a3);
}

- (NWDatagramConnection)connection
{
  return (NWDatagramConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)maxReadDatagrams
{
  return self->_maxReadDatagrams;
}

- (void)setMaxReadDatagrams:(unint64_t)a3
{
  self->_maxReadDatagrams = a3;
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setReadHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (unint64_t)internalMTU
{
  return self->_internalMTU;
}

- (void)setInternalMTU:(unint64_t)a3
{
  self->_internalMTU = a3;
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_readHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_resolvedEndpoint, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

void __28__NWUDPSession_readInternal__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "readHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "readHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v7)[2](v7, v8, v5);

    objc_msgSend(*(id *)(a1 + 32), "readInternal");
  }

}

@end
