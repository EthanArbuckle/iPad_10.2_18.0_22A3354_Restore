@implementation NWConcrete_nw_browse_descriptor

- (NWConcrete_nw_browse_descriptor)init
{
  NWConcrete_nw_browse_descriptor *v2;
  NWConcrete_nw_browse_descriptor *v3;
  NWConcrete_nw_browse_descriptor *v4;
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
  v16.super_class = (Class)NWConcrete_nw_browse_descriptor;
  v2 = -[NWConcrete_nw_browse_descriptor init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)v2 + 11) = -1;
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
          v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = (void *)*((_QWORD *)self + 2);
  if (v3)
  {
    free(v3);
    *((_QWORD *)self + 2) = 0;
  }
  v4 = (void *)*((_QWORD *)self + 3);
  if (v4)
  {
    free(v4);
    *((_QWORD *)self + 3) = 0;
  }
  v5 = (void *)*((_QWORD *)self + 9);
  if (v5)
  {
    free(v5);
    *((_QWORD *)self + 9) = 0;
  }
  v6 = (void *)*((_QWORD *)self + 10);
  if (v6)
  {
    free(v6);
    *((_QWORD *)self + 10) = 0;
  }
  v7 = (void *)*((_QWORD *)self + 4);
  if (v7)
  {
    free(v7);
    *((_QWORD *)self + 4) = 0;
  }
  v8 = (void *)*((_QWORD *)self + 5);
  if (v8)
  {
    free(v8);
    *((_QWORD *)self + 5) = 0;
  }
  v9 = (void *)*((_QWORD *)self + 13);
  *((_QWORD *)self + 13) = 0;

  v10.receiver = self;
  v10.super_class = (Class)NWConcrete_nw_browse_descriptor;
  -[NWConcrete_nw_browse_descriptor dealloc](&v10, sel_dealloc);
}

- (NSString)description
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = nw_browse_descriptor_get_description(self, 0);
  return (NSString *)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (id)redactedDescription
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = nw_browse_descriptor_get_description(self, 1);
  return (id)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  return self;
}

@end
