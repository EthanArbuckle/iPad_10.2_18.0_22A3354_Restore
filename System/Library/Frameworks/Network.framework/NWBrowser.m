@implementation NWBrowser

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("discoveredEndpoints")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWBrowser;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setUpdateHandler
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD handler[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[NWBrowser internalBrowser](self, "internalBrowser");
  v3 = objc_claimAutoreleasedReturnValue();
  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v4 = (id)NWCopyInternalQueue_nwQueue;
  nw_browser_set_queue(v3, v4);

  -[NWBrowser internalBrowser](self, "internalBrowser");
  v5 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __29__NWBrowser_setUpdateHandler__block_invoke;
  handler[3] = &unk_1E14A8A00;
  objc_copyWeak(&v8, &location);
  handler[4] = self;
  nw_browser_set_browse_results_changed_handler(v5, handler);

  -[NWBrowser internalBrowser](self, "internalBrowser");
  v6 = objc_claimAutoreleasedReturnValue();
  nw_browser_start(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (NWBrowser)initWithDescriptor:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  NWBrowser *v9;
  NWBrowser *v10;
  NSObject *v11;
  NSObject *v12;
  nw_browser_t v13;
  OS_nw_browser *internalBrowser;
  NWBrowser *v15;
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
  v27.super_class = (Class)NWBrowser;
  v9 = -[NWBrowser init](&v27, sel_init);
  v10 = v9;
  if (!v9)
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWBrowser initWithDescriptor:parameters:]";
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
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
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
            v29 = "-[NWBrowser initWithDescriptor:parameters:]";
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
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
        v22 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
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
  objc_storeStrong((id *)&v9->_descriptor, a3);
  objc_storeStrong((id *)&v10->_parameters, a4);
  objc_msgSend(v7, "internalDescriptor");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalParameters");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = nw_browser_create(v11, v12);
  internalBrowser = v10->_internalBrowser;
  v10->_internalBrowser = (OS_nw_browser *)v13;

  if (!v10->_internalBrowser)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWBrowser initWithDescriptor:parameters:]";
      v30 = 2114;
      v31 = (char *)v7;
      v32 = 2114;
      v33 = v8;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s nw_browser_create failed with descriptor %{public}@ and parameters %{public}@", buf, 0x20u);
    }

LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  -[NWBrowser setUpdateHandler](v10, "setUpdateHandler");
  v15 = v10;
LABEL_8:

  return v15;
}

- (void)cancel
{
  void *v3;
  NSObject *v4;

  -[NWBrowser internalBrowser](self, "internalBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWBrowser internalBrowser](self, "internalBrowser");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_browser_cancel(v4);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NWBrowser cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)NWBrowser;
  -[NWBrowser dealloc](&v3, sel_dealloc);
}

- (id)copyDiscoveredEndpoints
{
  NWBrowser *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NWBrowser internalDiscoveredEndpoints](v2, "internalDiscoveredEndpoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)discoveredEndpoints
{
  return (NSSet *)-[NWBrowser copyDiscoveredEndpoints](self, "copyDiscoveredEndpoints");
}

- (NWBrowseDescriptor)descriptor
{
  return (NWBrowseDescriptor *)objc_getProperty(self, a2, 8, 1);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 16, 1);
}

- (OS_nw_browser)internalBrowser
{
  return (OS_nw_browser *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)internalDiscoveredEndpoints
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalDiscoveredEndpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDiscoveredEndpoints, 0);
  objc_storeStrong((id *)&self->_internalBrowser, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

void __29__NWBrowser_setUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v16 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained && a4)
  {
    v10 = WeakRetained;
    objc_sync_enter(v10);
    objc_msgSend(v10, "willChangeValueForKey:", CFSTR("discoveredEndpoints"), v16);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "internalBrowser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    nw_browser_copy_browse_results(v12);
    v13 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __29__NWBrowser_setUpdateHandler__block_invoke_2;
      v17[3] = &unk_1E14AC200;
      v14 = v11;
      v18 = v14;
      nw_array_apply(v13, (uint64_t)v17);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setInternalDiscoveredEndpoints:", v15);

    }
    else
    {
      objc_msgSend(v10, "setInternalDiscoveredEndpoints:", 0);
    }
    objc_msgSend(v10, "didChangeValueForKey:", CFSTR("discoveredEndpoints"));

    objc_sync_exit(v10);
  }

}

uint64_t __29__NWBrowser_setUpdateHandler__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id endpoint;
  void *v5;

  endpoint = nw_browse_result_get_endpoint(a3);
  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", endpoint);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  return 1;
}

@end
