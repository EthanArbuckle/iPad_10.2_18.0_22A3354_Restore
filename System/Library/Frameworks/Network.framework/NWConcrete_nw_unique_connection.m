@implementation NWConcrete_nw_unique_connection

- (NWConcrete_nw_unique_connection)init
{
  NWConcrete_nw_unique_connection *v2;
  NWConcrete_nw_unique_connection *v3;
  unint64_t v4;
  NWConcrete_nw_unique_connection *v5;
  void *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  char *backtrace_string;
  os_log_type_t v12;
  _BOOL4 v13;
  os_log_type_t v14;
  char v15;
  os_log_type_t type;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NWConcrete_nw_unique_connection;
  v2 = -[NWConcrete_nw_unique_connection init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr(&-[NWConcrete_nw_unique_connection init]::sNWSCUCUniqueID);
    while (__stlxr(v4 + 1, &-[NWConcrete_nw_unique_connection init]::sNWSCUCUniqueID));
    v2->uniqueID = v4;
    v2->dupedSocketFD = -1;
    v5 = v2;
    goto LABEL_4;
  }
  __nwlog_obj();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v19 = "-[NWConcrete_nw_unique_connection init]";
  v8 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v15 = 0;
  if (__nwlog_fault(v8, &type, &v15))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_unique_connection init]";
        _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v15)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      v13 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v13)
        {
          *(_DWORD *)buf = 136446466;
          v19 = "-[NWConcrete_nw_unique_connection init]";
          v20 = 2082;
          v21 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v9, v12, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_21;
      }
      if (v13)
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_unique_connection init]";
        _os_log_impl(&dword_182FBE000, v9, v12, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_unique_connection init]";
        _os_log_impl(&dword_182FBE000, v9, v14, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_21:
  if (v8)
    free(v8);
LABEL_4:

  return v3;
}

- (void)dealloc
{
  id v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  char *backtrace_string;
  os_log_type_t v8;
  _BOOL4 v9;
  os_log_type_t v10;
  uint8_t *v11;
  int v12;
  objc_super v13;
  char v14;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  NWConcrete_nw_unique_connection *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((self->dupedSocketFD & 0x80000000) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v17 = "-[NWConcrete_nw_unique_connection dealloc]";
    v18 = 2114;
    v19 = self;
    v12 = 22;
    v11 = buf;
    v4 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v14 = 0;
    if (__nwlog_fault(v4, &type, &v14))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v5 = (id)gLogObj;
        v6 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)buf = 136446466;
          v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          v18 = 2114;
          v19 = self;
          _os_log_impl(&dword_182FBE000, v5, v6, "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD", buf, 0x16u);
        }
      }
      else if (v14)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v5 = (id)gLogObj;
        v8 = type;
        v9 = os_log_type_enabled(v5, type);
        if (backtrace_string)
        {
          if (v9)
          {
            *(_DWORD *)buf = 136446722;
            v17 = "-[NWConcrete_nw_unique_connection dealloc]";
            v18 = 2114;
            v19 = self;
            v20 = 2082;
            v21 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v5, v8, "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
          if (!v4)
            goto LABEL_9;
          goto LABEL_8;
        }
        if (v9)
        {
          *(_DWORD *)buf = 136446466;
          v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          v18 = 2114;
          v19 = self;
          _os_log_impl(&dword_182FBE000, v5, v8, "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, no backtrace", buf, 0x16u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v5 = (id)gLogObj;
        v10 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)buf = 136446466;
          v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          v18 = 2114;
          v19 = self;
          _os_log_impl(&dword_182FBE000, v5, v10, "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, backtrace limit exceeded", buf, 0x16u);
        }
      }

    }
    if (!v4)
    {
LABEL_9:
      close(self->dupedSocketFD);
      self->dupedSocketFD = -1;
      goto LABEL_10;
    }
LABEL_8:
    free(v4);
    goto LABEL_9;
  }
LABEL_10:
  v13.receiver = self;
  v13.super_class = (Class)NWConcrete_nw_unique_connection;
  -[NWConcrete_nw_unique_connection dealloc](&v13, sel_dealloc, v11, v12);
}

- (NSString)description
{
  NWConcrete_nw_unique_connection *v2;
  NWConcrete_nw_unique_connection *v3;
  NWConcrete_nw_connection *connection;
  char *v5;
  unint64_t uniqueID;
  char v7;
  const char *description;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  __CFString *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  char *backtrace_string;
  os_log_type_t v19;
  _BOOL4 v20;
  os_log_type_t v21;
  os_log_type_t type[8];
  char v24;
  uuid_string_t out;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = self;
  if (!v2)
  {
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)out = 136446210;
    *(_QWORD *)&out[4] = "nw_unique_connection_copy_description";
    v15 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (__nwlog_fault(v15, type, &v24))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = type[0];
        if (os_log_type_enabled(v16, type[0]))
        {
          *(_DWORD *)out = 136446210;
          *(_QWORD *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s called with null uniqueConnection", (uint8_t *)out, 0xCu);
        }
      }
      else if (v24)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v19 = type[0];
        v20 = os_log_type_enabled(v16, type[0]);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)out = 136446466;
            *(_QWORD *)&out[4] = "nw_unique_connection_copy_description";
            *(_WORD *)&out[12] = 2082;
            *(_QWORD *)&out[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v16, v19, "%{public}s called with null uniqueConnection, dumping backtrace:%{public}s", (uint8_t *)out, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }
        if (v20)
        {
          *(_DWORD *)out = 136446210;
          *(_QWORD *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl(&dword_182FBE000, v16, v19, "%{public}s called with null uniqueConnection, no backtrace", (uint8_t *)out, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v21 = type[0];
        if (os_log_type_enabled(v16, type[0]))
        {
          *(_DWORD *)out = 136446210;
          *(_QWORD *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl(&dword_182FBE000, v16, v21, "%{public}s called with null uniqueConnection, backtrace limit exceeded", (uint8_t *)out, 0xCu);
        }
      }

    }
LABEL_30:
    if (v15)
      free(v15);
    goto LABEL_32;
  }
  v3 = v2;
  memset(out, 0, sizeof(out));
  uuid_unparse(v2->uuid, out);
  connection = v3->connection;
  if (connection)
    v5 = nw_service_connector_copy_connection_description(connection);
  else
    v5 = 0;
  *(_QWORD *)type = 0;
  uniqueID = v3->uniqueID;
  v7 = *((_BYTE *)v3 + 500);
  description = nw_endpoint_get_description(v3->endpoint);
  v9 = "incoming";
  if ((v7 & 1) == 0)
    v9 = "outgoing";
  v10 = " ";
  v11 = "";
  if (v5)
    v11 = v5;
  else
    v10 = "";
  asprintf((char **)type, "[SCU%llu %s %s \"%s\" %s recv seq %llu [socket%d]%s%s]", uniqueID, v9, description, v3->service, out, v3->receivedSequenceNumber, v3->dupedSocketFD, v10, v11);
  if (v5)
    free(v5);
  v12 = *(const char **)type;

  if (!v12)
  {
LABEL_32:
    v13 = 0;
    return (NSString *)v13;
  }
  v13 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  return (NSString *)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
}

@end
