@implementation NWResolver

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("status")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("resolvedEndpoints")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("resolvedEndpointArray")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWResolver;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setUpdateHandler
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[NWResolver internalResolver](self, "internalResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v4 = (id)NWCopyInternalQueue_nwQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__NWResolver_setUpdateHandler__block_invoke;
  v5[3] = &unk_1E14AC228;
  objc_copyWeak(&v6, &location);
  nw_resolver_set_update_handler(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NWResolver)initWithEndpoint:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  NWResolver *v9;
  NWResolver *v10;
  void *v11;
  void *v12;
  nw_endpoint_t *v13;
  OS_nw_resolver *internalResolver;
  NWResolver *v15;
  NSObject *v16;
  void *v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  char *backtrace_string;
  _BOOL4 v24;
  char v25;
  os_log_type_t type;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NWResolver;
  v9 = -[NWResolver init](&v27, sel_init);
  v10 = v9;
  if (!v9)
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWResolver initWithEndpoint:parameters:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (!__nwlog_fault(v19, &type, &v25))
      goto LABEL_24;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
        v22 = "%{public}s [super init] failed";
LABEL_22:
        _os_log_impl(&dword_182FBE000, v20, v21, v22, buf, 0xCu);
      }
    }
    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = type;
        v24 = os_log_type_enabled(v20, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136446466;
            v29 = "-[NWResolver initWithEndpoint:parameters:]";
            v30 = 2082;
            v31 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }
        if (!v24)
          goto LABEL_23;
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
        v22 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
        v22 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_22;
      }
    }
LABEL_23:

LABEL_24:
    if (v19)
      free(v19);
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v9->_endpoint, a3);
  objc_storeStrong((id *)&v10->_parameters, a4);
  objc_msgSend(v7, "internalEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = nw_resolver_create_with_endpoint(v11, v12);
  internalResolver = v10->_internalResolver;
  v10->_internalResolver = (OS_nw_resolver *)v13;

  if (!v10->_internalResolver)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWResolver initWithEndpoint:parameters:]";
      v30 = 2114;
      v31 = (char *)v7;
      v32 = 2114;
      v33 = v8;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s nw_resolver_create_with_endpoint failed with endpoint %{public}@ and parameters %{public}@", buf, 0x20u);
    }

LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  -[NWResolver setUpdateHandler](v10, "setUpdateHandler");
  v15 = v10;
LABEL_8:

  return v15;
}

- (NWResolver)initWithPath:(id)a3
{
  id v4;
  NWResolver *v5;
  uint64_t v6;
  NWEndpoint *endpoint;
  uint64_t v8;
  NWParameters *parameters;
  void *v10;
  nw_endpoint_t *v11;
  OS_nw_resolver *internalResolver;
  NWResolver *v13;
  id v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  const char *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  char *v22;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  const char *backtrace_string;
  _BOOL4 v31;
  char v32;
  os_log_type_t type;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)NWResolver;
  v5 = -[NWResolver init](&v34, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWResolver initWithPath:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (!__nwlog_fault(v15, &type, &v32))
      goto LABEL_14;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_182FBE000, v27, v28, v29, buf, 0xCu);
      }
    }
    else
    {
      if (v32)
      {
        backtrace_string = __nw_create_backtrace_string();
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = type;
        v31 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v36 = "-[NWResolver initWithPath:]";
            v37 = 2082;
            v38 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v27, v28, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          v22 = (char *)backtrace_string;
LABEL_13:
          free(v22);
          goto LABEL_14;
        }
        if (!v31)
          goto LABEL_40;
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }
      __nwlog_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }
LABEL_40:

LABEL_14:
    if (!v15)
    {
LABEL_16:
      v13 = 0;
      goto LABEL_17;
    }
LABEL_15:
    free(v15);
    goto LABEL_16;
  }
  objc_msgSend(v4, "endpoint");
  v6 = objc_claimAutoreleasedReturnValue();
  endpoint = v5->_endpoint;
  v5->_endpoint = (NWEndpoint *)v6;

  objc_msgSend(v4, "parameters");
  v8 = objc_claimAutoreleasedReturnValue();
  parameters = v5->_parameters;
  v5->_parameters = (NWParameters *)v8;

  objc_msgSend(v4, "internalPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = nw_resolver_create_with_path(v10);
  internalResolver = v5->_internalResolver;
  v5->_internalResolver = (OS_nw_resolver *)v11;

  if (!v5->_internalResolver)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWResolver initWithPath:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (!__nwlog_fault(v15, &type, &v32))
      goto LABEL_14;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      v17 = type;
      if (!os_log_type_enabled(v16, type))
        goto LABEL_22;
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWResolver initWithPath:]";
      v18 = "%{public}s nw_resolver_create_with_path failed";
LABEL_20:
      v24 = v16;
      v25 = v17;
      goto LABEL_21;
    }
    if (!v32)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      v17 = type;
      if (!os_log_type_enabled(v16, type))
        goto LABEL_22;
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWResolver initWithPath:]";
      v18 = "%{public}s nw_resolver_create_with_path failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    v19 = __nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    v20 = type;
    v21 = os_log_type_enabled(v16, type);
    if (!v19)
    {
      if (!v21)
      {
LABEL_22:

        if (!v15)
          goto LABEL_16;
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWResolver initWithPath:]";
      v18 = "%{public}s nw_resolver_create_with_path failed, no backtrace";
      v24 = v16;
      v25 = v20;
LABEL_21:
      _os_log_impl(&dword_182FBE000, v24, v25, v18, buf, 0xCu);
      goto LABEL_22;
    }
    if (v21)
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[NWResolver initWithPath:]";
      v37 = 2082;
      v38 = v19;
      _os_log_impl(&dword_182FBE000, v16, v20, "%{public}s nw_resolver_create_with_path failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    v22 = (char *)v19;
    goto LABEL_13;
  }
  -[NWResolver setUpdateHandler](v5, "setUpdateHandler");
  v13 = v5;
LABEL_17:

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NWResolver internalResolver](self, "internalResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  nw_resolver_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)NWResolver;
  -[NWResolver dealloc](&v4, sel_dealloc);
}

- (int64_t)status
{
  NWResolver *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWResolver internalStatus](v2, "internalStatus");
  objc_sync_exit(v2);

  return v3;
}

- (id)copyResolvedEndpoints
{
  NWResolver *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NWResolver internalResolvedEndpoints](v2, "internalResolvedEndpoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)resolvedEndpoints
{
  return (NSSet *)-[NWResolver copyResolvedEndpoints](self, "copyResolvedEndpoints");
}

- (id)copyResolvedEndpointArray
{
  NWResolver *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NWResolver internalResolvedEndpointArray](v2, "internalResolvedEndpointArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)resolvedEndpointArray
{
  return (NSArray *)-[NWResolver copyResolvedEndpointArray](self, "copyResolvedEndpointArray");
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 16, 1);
}

- (OS_nw_resolver)internalResolver
{
  return (OS_nw_resolver *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)internalStatus
{
  return self->_internalStatus;
}

- (void)setInternalStatus:(int64_t)a3
{
  self->_internalStatus = a3;
}

- (NSSet)internalResolvedEndpoints
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalResolvedEndpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)internalResolvedEndpointArray
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternalResolvedEndpointArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalResolvedEndpointArray, 0);
  objc_storeStrong((id *)&self->_internalResolvedEndpoints, 0);
  objc_storeStrong((id *)&self->_internalResolver, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

void __30__NWResolver_setUpdateHandler__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 *object;
  _QWORD v13[4];
  id v14;

  object = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_sync_enter(v7);
    v8 = objc_msgSend(v7, "internalStatus");
    if (v8 != a2)
    {
      objc_msgSend(v7, "willChangeValueForKey:", CFSTR("status"));
      objc_msgSend(v7, "setInternalStatus:", a2);
    }
    objc_msgSend(v7, "willChangeValueForKey:", CFSTR("resolvedEndpoints"), object);
    objc_msgSend(v7, "willChangeValueForKey:", CFSTR("resolvedEndpointArray"));
    if (object)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __30__NWResolver_setUpdateHandler__block_invoke_2;
      v13[3] = &unk_1E14AC200;
      v10 = v9;
      v14 = v10;
      nw_array_apply(object, (uint64_t)v13);
      objc_msgSend(v7, "setInternalResolvedEndpointArray:", v10);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInternalResolvedEndpoints:", v11);

    }
    else
    {
      objc_msgSend(v7, "setInternalResolvedEndpointArray:", 0);
      objc_msgSend(v7, "setInternalResolvedEndpoints:", 0);
    }
    objc_sync_exit(v7);

    objc_msgSend(v7, "didChangeValueForKey:", CFSTR("resolvedEndpointArray"));
    objc_msgSend(v7, "didChangeValueForKey:", CFSTR("resolvedEndpoints"));
    if (v8 != a2)
      objc_msgSend(v7, "didChangeValueForKey:", CFSTR("status"));
  }

}

uint64_t __30__NWResolver_setUpdateHandler__block_invoke_2(uint64_t a1)
{
  void *v2;

  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

  return 1;
}

@end
