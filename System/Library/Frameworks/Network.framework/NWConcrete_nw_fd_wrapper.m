@implementation NWConcrete_nw_fd_wrapper

- (void)dealloc
{
  objc_super v3;

  nw_fd_wrapper_close(self);
  v3.receiver = self;
  v3.super_class = (Class)NWConcrete_nw_fd_wrapper;
  -[NWConcrete_nw_fd_wrapper dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  const char *v2;

  v2 = "true";
  if ((*((_BYTE *)self + 24) & 1) == 0)
    v2 = "false";
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<fd_wrapper %d, guarded: %s>"), *((unsigned int *)self + 2), v2);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 3) = 0;
  return self;
}

- (_DWORD)initWithFileDescriptor:(void *)a1
{
  _DWORD *v3;
  _DWORD *v4;
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
  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)NWConcrete_nw_fd_wrapper;
  v3 = objc_msgSendSuper2(&v16, sel_init);
  v4 = v3;
  if (!v3)
  {
    __nwlog_obj();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
            v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
            v19 = 2082;
            v20 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_21;
        }
        if (v12)
        {
          *(_DWORD *)buf = 136446210;
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
          _os_log_impl(&dword_182FBE000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_21:
    if (v7)
      free(v7);
    return 0;
  }
  v3[2] = a2;
  *((_BYTE *)v3 + 24) &= ~2u;
  arc4random_buf(v3 + 4, 8uLL);
  return v4;
}

@end
