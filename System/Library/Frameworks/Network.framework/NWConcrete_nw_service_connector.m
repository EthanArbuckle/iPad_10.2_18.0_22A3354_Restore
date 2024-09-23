@implementation NWConcrete_nw_service_connector

- (NWConcrete_nw_service_connector)init
{
  NWConcrete_nw_service_connector *v2;
  NWConcrete_nw_service_connector *v3;
  NWConcrete_nw_service_connector *v4;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  os_log_type_t v13;
  char v14;
  os_log_type_t type;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_service_connector;
  v2 = -[NWConcrete_nw_service_connector init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_service_connector init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_service_connector init]";
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v11 = type;
      v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_service_connector init]";
          v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_service_connector init]";
        _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_service_connector init]";
        _os_log_impl(&dword_182FBE000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v7)
    free(v7);
LABEL_3:

  return v3;
}

- (void)dealloc
{
  __SecKey *localPrivKey;
  void *retryAddrInUseTimer;
  objc_super v5;

  localPrivKey = self->localPrivKey;
  if (localPrivKey)
  {
    CFRelease(localPrivKey);
    self->localPrivKey = 0;
  }
  retryAddrInUseTimer = self->retryAddrInUseTimer;
  if (retryAddrInUseTimer)
  {
    nw_queue_cancel_source((uint64_t)retryAddrInUseTimer, (uint64_t)a2);
    self->retryAddrInUseTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_service_connector;
  -[NWConcrete_nw_service_connector dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  uint64_t state;
  const char *v3;
  __CFString *v4;
  void *v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  char *backtrace_string;
  os_log_type_t v10;
  _BOOL4 v11;
  os_log_type_t v12;
  char v14;
  os_log_type_t type;
  _BYTE cStr[12];
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    __nwlog_obj();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)cStr = 136446210;
    *(_QWORD *)&cStr[4] = "nw_service_connector_copy_description";
    v6 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v14 = 0;
    if (__nwlog_fault(v6, &type, &v14))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(_QWORD *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl(&dword_182FBE000, v7, v8, "%{public}s called with null serviceConnector", cStr, 0xCu);
        }
      }
      else if (v14)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        v10 = type;
        v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)cStr = 136446466;
            *(_QWORD *)&cStr[4] = "nw_service_connector_copy_description";
            v17 = 2082;
            v18 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v7, v10, "%{public}s called with null serviceConnector, dumping backtrace:%{public}s", cStr, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_23;
        }
        if (v11)
        {
          *(_DWORD *)cStr = 136446210;
          *(_QWORD *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl(&dword_182FBE000, v7, v10, "%{public}s called with null serviceConnector, no backtrace", cStr, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(_QWORD *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl(&dword_182FBE000, v7, v12, "%{public}s called with null serviceConnector, backtrace limit exceeded", cStr, 0xCu);
        }
      }

    }
LABEL_23:
    if (v6)
      free(v6);
    goto LABEL_25;
  }
  *(_QWORD *)cStr = 0;
  state = self->state;
  if (state > 4)
    v3 = "unknown";
  else
    v3 = off_1E14A3D88[state];
  asprintf((char **)cStr, "[SC%llu port %u %s]", self->uniqueID, self->localPortHBO, v3);
  if (!*(_QWORD *)cStr)
  {
LABEL_25:
    v4 = 0;
    return (NSString *)v4;
  }
  v4 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(const char **)cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  return (NSString *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->remotePubKeys, 0);
  objc_storeStrong((id *)&self->activeOutgoingRequests, 0);
  objc_storeStrong((id *)&self->activeConnections, 0);
  objc_storeStrong((id *)&self->pendingIncomingRequests, 0);
  objc_storeStrong((id *)&self->pendingUnverifiedIncomingRequests, 0);
  objc_storeStrong(&self->serviceAvailableBlock, 0);
  objc_storeStrong((id *)&self->serviceConnectorQueue, 0);
  objc_storeStrong((id *)&self->clientParameters, 0);
  objc_storeStrong((id *)&self->listener, 0);
}

@end
