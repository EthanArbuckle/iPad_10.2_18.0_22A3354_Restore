@implementation NWConcrete_nw_unique_connection_request

- (NWConcrete_nw_unique_connection_request)init
{
  NWConcrete_nw_unique_connection_request *v2;
  NWConcrete_nw_unique_connection_request *v3;
  unint64_t v4;
  NWConcrete_nw_unique_connection_request *v5;
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
  v17.super_class = (Class)NWConcrete_nw_unique_connection_request;
  v2 = -[NWConcrete_nw_unique_connection_request init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr(&-[NWConcrete_nw_unique_connection_request init]::sNWSCUCRUniqueID);
    while (__stlxr(v4 + 1, &-[NWConcrete_nw_unique_connection_request init]::sNWSCUCRUniqueID));
    v2->uniqueID = v4;
    v5 = v2;
    goto LABEL_4;
  }
  __nwlog_obj();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
        v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
          v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
        v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
        v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
  void *rejectTimer;
  void *preexistingConnectionTimer;
  char *incomingReqBytesToVerify;
  id v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  os_log_type_t v13;
  uint8_t *v14;
  int v15;
  objc_super v16;
  char v17;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NWConcrete_nw_unique_connection_request *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  rejectTimer = self->rejectTimer;
  if (rejectTimer)
  {
    nw_queue_cancel_source((uint64_t)rejectTimer, (uint64_t)a2);
    self->rejectTimer = 0;
  }
  preexistingConnectionTimer = self->preexistingConnectionTimer;
  if (preexistingConnectionTimer)
  {
    nw_queue_cancel_source((uint64_t)preexistingConnectionTimer, (uint64_t)a2);
    self->preexistingConnectionTimer = 0;
  }
  incomingReqBytesToVerify = self->incomingReqBytesToVerify;
  if (incomingReqBytesToVerify)
  {
    free(incomingReqBytesToVerify);
    self->incomingReqBytesToVerify = 0;
  }
  self->incomingReqBytesToVerifyLen = 0;
  if (!self->requestCompletionBlock)
    goto LABEL_15;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v6 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
  v21 = 2114;
  v22 = self;
  v15 = 22;
  v14 = buf;
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v17 = 0;
  if (__nwlog_fault(v7, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        v21 = 2114;
        v22 = self;
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s Dealloc of %{public}@ with requestCompletionBlock present", buf, 0x16u);
      }
    }
    else if (v17)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v11 = type;
      v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
          v21 = 2114;
          v22 = self;
          v23 = 2082;
          v24 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(backtrace_string);
        if (v7)
          goto LABEL_14;
        goto LABEL_15;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        v21 = 2114;
        v22 = self;
        _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, no backtrace", buf, 0x16u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        v21 = 2114;
        v22 = self;
        _os_log_impl(&dword_182FBE000, v8, v13, "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, backtrace limit exceeded", buf, 0x16u);
      }
    }

  }
  if (v7)
LABEL_14:
    free(v7);
LABEL_15:
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_unique_connection_request;
  -[NWConcrete_nw_unique_connection_request dealloc](&v16, sel_dealloc, v14, v15);
}

- (NSString)description
{
  NWConcrete_nw_unique_connection_request *v2;
  NWConcrete_nw_unique_connection_request *v3;
  NWConcrete_nw_connection *connection;
  char *v5;
  unint64_t uniqueID;
  char v7;
  const char *description;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  char *v18;
  __CFString *v19;
  void *v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  char *backtrace_string;
  os_log_type_t v25;
  _BOOL4 v26;
  os_log_type_t v27;
  char *v29;
  char v30;
  uuid_string_t out;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = self;
  if (!v2)
  {
    __nwlog_obj();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)out = 136446210;
    *(_QWORD *)&out[4] = "nw_unique_connection_request_copy_description";
    v21 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(v29) = 16;
    v30 = 0;
    if (__nwlog_fault(v21, &v29, &v30))
    {
      if (v29 == 17)
      {
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v29;
        if (os_log_type_enabled(v22, (os_log_type_t)v29))
        {
          *(_DWORD *)out = 136446210;
          *(_QWORD *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s called with null request", (uint8_t *)out, 0xCu);
        }
      }
      else if (v30)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v25 = v29;
        v26 = os_log_type_enabled(v22, (os_log_type_t)v29);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)out = 136446466;
            *(_QWORD *)&out[4] = "nw_unique_connection_request_copy_description";
            *(_WORD *)&out[12] = 2082;
            *(_QWORD *)&out[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v22, v25, "%{public}s called with null request, dumping backtrace:%{public}s", (uint8_t *)out, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_43;
        }
        if (v26)
        {
          *(_DWORD *)out = 136446210;
          *(_QWORD *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl(&dword_182FBE000, v22, v25, "%{public}s called with null request, no backtrace", (uint8_t *)out, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v27 = v29;
        if (os_log_type_enabled(v22, (os_log_type_t)v29))
        {
          *(_DWORD *)out = 136446210;
          *(_QWORD *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl(&dword_182FBE000, v22, v27, "%{public}s called with null request, backtrace limit exceeded", (uint8_t *)out, 0xCu);
        }
      }

    }
LABEL_43:
    if (v21)
      free(v21);
    goto LABEL_45;
  }
  v3 = v2;
  memset(out, 0, sizeof(out));
  uuid_unparse(v2->uuid, out);
  connection = v3->connection;
  if (connection)
    v5 = nw_service_connector_copy_connection_description(connection);
  else
    v5 = 0;
  v29 = 0;
  uniqueID = v3->uniqueID;
  v7 = *((_BYTE *)v3 + 616);
  description = nw_endpoint_get_description(v3->endpoint);
  v9 = " processed";
  v10 = "";
  if ((v7 & 0x40) == 0)
    v9 = "";
  v11 = " waitingActiveConnection";
  if ((v7 & 0x10) == 0)
    v11 = "";
  v12 = " waitingListener";
  if ((v7 & 8) == 0)
    v12 = "";
  if (v7 >= 0)
    v13 = "";
  else
    v13 = " waitingPath";
  v14 = " accepted";
  if ((v7 & 4) == 0)
    v14 = "";
  v15 = " pending";
  v16 = "incoming";
  if ((v7 & 2) == 0)
    v15 = "";
  if ((v7 & 1) == 0)
    v16 = "outgoing";
  v17 = " ";
  if (v5)
    v10 = v5;
  else
    v17 = "";
  asprintf(&v29, "[SCR%llu %s%s%s%s%s%s%s %s \"%s\" %s seq %llu%s%s]", uniqueID, v16, v15, v14, v13, v12, v11, v9, description, v3->service, out, v3->sequenceNumber, v17, v10);
  if (v5)
    free(v5);
  v18 = v29;

  if (!v18)
  {
LABEL_45:
    v19 = 0;
    return (NSString *)v19;
  }
  v19 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v18, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  return (NSString *)v19;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->requestCompletionBlock, 0);
  objc_storeStrong((id *)&self->pathEvaluator, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong((id *)&self->userParameters, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
}

@end
