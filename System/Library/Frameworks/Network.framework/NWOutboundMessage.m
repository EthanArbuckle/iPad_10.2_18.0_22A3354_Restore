@implementation NWOutboundMessage

- (NWOutboundMessage)initWithContent:(id)a3
{
  id v4;
  NWOutboundMessage *v5;
  void *v6;
  nw_content_context_t v7;
  NWOutboundMessage *v8;
  void *v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  void *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  char *v20;
  _BOOL4 v21;
  char *backtrace_string;
  _BOOL4 v23;
  objc_super v24;
  char v25;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)NWOutboundMessage;
    v5 = -[NWOutboundMessage init](&v24, sel_init);
    if (v5)
    {
      self = v5;
      v6 = (void *)objc_msgSend(v4, "_createDispatchData");
      -[NWMessage setInternalContent:](self, "setInternalContent:", v6);

      v7 = nw_content_context_create("NWMessage");
      -[NWMessage setInternalContext:](self, "setInternalContext:", v7);

      -[NWMessage internalContext](self, "internalContext");
      v8 = (NWOutboundMessage *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        self = self;
        v8 = self;
      }
      goto LABEL_5;
    }
    __nwlog_obj();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWOutboundMessage initWithContent:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (!__nwlog_fault(v16, &type, &v25))
      goto LABEL_39;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v19 = "%{public}s [super init] failed";
LABEL_37:
        _os_log_impl(&dword_182FBE000, v17, v18, v19, buf, 0xCu);
      }
    }
    else if (v25)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      v23 = os_log_type_enabled(v17, type);
      if (backtrace_string)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136446466;
          v28 = "-[NWOutboundMessage initWithContent:]";
          v29 = 2082;
          v30 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_39;
      }
      if (v23)
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v19 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_37;
      }
    }
    else
    {
      __nwlog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v19 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_37;
      }
    }

LABEL_39:
    if (v16)
      free(v16);
    self = 0;
    v8 = 0;
    goto LABEL_5;
  }
  __nwlog_obj();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v28 = "-[NWOutboundMessage initWithContent:]";
  v11 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v25 = 0;
  if (__nwlog_fault(v11, &type, &v25))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v14 = "%{public}s called with null content";
LABEL_30:
        _os_log_impl(&dword_182FBE000, v12, v13, v14, buf, 0xCu);
      }
    }
    else
    {
      if (v25)
      {
        v20 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = type;
        v21 = os_log_type_enabled(v12, type);
        if (v20)
        {
          if (v21)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWOutboundMessage initWithContent:]";
            v29 = 2082;
            v30 = v20;
            _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s called with null content, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v20);
          goto LABEL_32;
        }
        if (!v21)
          goto LABEL_31;
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v14 = "%{public}s called with null content, no backtrace";
        goto LABEL_30;
      }
      __nwlog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v14 = "%{public}s called with null content, backtrace limit exceeded";
        goto LABEL_30;
      }
    }
LABEL_31:

  }
LABEL_32:
  if (v11)
    free(v11);
  v8 = 0;
LABEL_5:

  return v8;
}

- (unint64_t)expirationMilliseconds
{
  NSObject *v2;
  uint64_t expiration_milliseconds;

  -[NWMessage internalContext](self, "internalContext");
  v2 = objc_claimAutoreleasedReturnValue();
  expiration_milliseconds = nw_content_context_get_expiration_milliseconds(v2);

  return expiration_milliseconds;
}

- (void)setExpirationMilliseconds:(unint64_t)a3
{
  NSObject *v4;

  -[NWMessage internalContext](self, "internalContext");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_content_context_set_expiration_milliseconds(v4, a3);

}

- (double)relativePriority
{
  NSObject *v2;
  double relative_priority;

  -[NWMessage internalContext](self, "internalContext");
  v2 = objc_claimAutoreleasedReturnValue();
  relative_priority = nw_content_context_get_relative_priority(v2);

  return relative_priority;
}

- (void)setRelativePriority:(double)a3
{
  NSObject *v4;

  -[NWMessage internalContext](self, "internalContext");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_content_context_set_relative_priority(v4, a3);

}

- (void)addAntecedent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *context;

  v4 = a3;
  -[NWMessage internalContext](self, "internalContext");
  context = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalContext");
  v5 = objc_claimAutoreleasedReturnValue();

  nw_content_context_set_antecedent(context, v5);
}

@end
