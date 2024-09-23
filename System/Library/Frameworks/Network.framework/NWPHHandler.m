@implementation NWPHHandler

- (NWPHHandler)initWithHandlerFunction:(void *)a3 allowedEntitlementGroup:(id)a4
{
  id v6;
  NWPHHandler *v7;
  NWPHHandler *v8;
  NWPHHandler *v9;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  char *backtrace_string;
  _BOOL4 v17;
  char v18;
  os_log_type_t type;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NWPHHandler;
  v7 = -[NWPHHandler init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    -[NWPHHandler setHandlerFunction:](v7, "setHandlerFunction:", a3);
    -[NWPHHandler setAllowedEntitlementGroup:](v8, "setAllowedEntitlementGroup:", v6);
    v9 = v8;
    goto LABEL_3;
  }
  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
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
        v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
        v15 = "%{public}s [super init] failed";
LABEL_17:
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
            v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
            v23 = 2082;
            v24 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v17)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
        v15 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
        v15 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v12)
    free(v12);
LABEL_3:

  return v8;
}

- (NSArray)allowedEntitlementGroup
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllowedEntitlementGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)handlerFunction
{
  return self->_handlerFunction;
}

- (void)setHandlerFunction:(void *)a3
{
  self->_handlerFunction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedEntitlementGroup, 0);
}

@end
