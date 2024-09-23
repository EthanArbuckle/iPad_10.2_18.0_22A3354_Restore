@implementation NWConcrete_nw_write_request

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->original_message, 0);
  objc_storeStrong((id *)&self->fd, 0);
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->data, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong(&self->file_handler, 0);
  objc_storeStrong(&self->completion, 0);
  objc_storeStrong((id *)&self->next, 0);
}

- (NWConcrete_nw_write_request)init
{
  NWConcrete_nw_write_request *v2;
  NWConcrete_nw_write_request *v3;
  NWConcrete_nw_write_request *v4;
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
  v16.super_class = (Class)NWConcrete_nw_write_request;
  v2 = -[NWConcrete_nw_write_request init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_write_request init]";
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
        v18 = "-[NWConcrete_nw_write_request init]";
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
          v18 = "-[NWConcrete_nw_write_request init]";
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
        v18 = "-[NWConcrete_nw_write_request init]";
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
        v18 = "-[NWConcrete_nw_write_request init]";
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
  void *progress_timer_source;
  objc_super v4;

  progress_timer_source = self->progress_timer_source;
  if (progress_timer_source)
  {
    nw_queue_cancel_source((uint64_t)progress_timer_source, (uint64_t)a2);
    self->progress_timer_source = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_write_request;
  -[NWConcrete_nw_write_request dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  const char *v2;
  const char *v3;

  v2 = " idempotent";
  if ((*((_BYTE *)self + 128) & 4) == 0)
    v2 = "";
  if ((*((_BYTE *)self + 128) & 2) != 0)
    v3 = " reported";
  else
    v3 = "";
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<nw_write_request%s%s>"), v2, v3);
}

@end
