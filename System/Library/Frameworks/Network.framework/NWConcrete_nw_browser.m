@implementation NWConcrete_nw_browser

- (void)dealloc
{
  id v3;
  int v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  id v9;
  int v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  void *v15;
  void *v16;
  const char *backtrace_string;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  const char *v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  os_log_type_t v27;
  int v28;
  os_log_type_t v29;
  int v30;
  os_log_type_t v31;
  int v32;
  os_log_type_t v33;
  int v34;
  uint8_t *v35;
  int v36;
  objc_super v37;
  char v38;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!*((_QWORD *)self + 6) || nw_parameters_get_logging_disabled(*((_QWORD *)self + 5)))
    goto LABEL_14;
  if (__nwlog_browser_log::onceToken[0] != -1)
    dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
  v3 = (id)gbrowserLogObj;
  v4 = *((_DWORD *)self + 48);
  *(_DWORD *)buf = 136446466;
  v41 = "-[NWConcrete_nw_browser dealloc]";
  v42 = 1024;
  v43 = v4;
  v36 = 18;
  v35 = buf;
  v5 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v38 = 0;
  if (__nwlog_fault(v5, &type, &v38))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_browser_log::onceToken[0] != -1)
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
      v6 = (id)gbrowserLogObj;
      v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        v8 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        v42 = 1024;
        v43 = v8;
        _os_log_impl(&dword_182FBE000, v6, v7, "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating", buf, 0x12u);
      }
    }
    else if (v38)
    {
      backtrace_string = __nw_create_backtrace_string();
      if (backtrace_string)
      {
        v18 = (char *)backtrace_string;
        if (__nwlog_browser_log::onceToken[0] != -1)
          dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
        v19 = (id)gbrowserLogObj;
        v20 = type;
        if (os_log_type_enabled(v19, type))
        {
          v21 = *((_DWORD *)self + 48);
          *(_DWORD *)buf = 136446722;
          v41 = "-[NWConcrete_nw_browser dealloc]";
          v42 = 1024;
          v43 = v21;
          v44 = 2082;
          v45 = v18;
          _os_log_impl(&dword_182FBE000, v19, v20, "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x1Cu);
        }

        free(v18);
        if (v5)
          goto LABEL_13;
        goto LABEL_14;
      }
      if (__nwlog_browser_log::onceToken[0] != -1)
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
      v6 = (id)gbrowserLogObj;
      v31 = type;
      if (os_log_type_enabled(v6, type))
      {
        v32 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        v42 = 1024;
        v43 = v32;
        _os_log_impl(&dword_182FBE000, v6, v31, "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, no backtrace", buf, 0x12u);
      }
    }
    else
    {
      if (__nwlog_browser_log::onceToken[0] != -1)
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
      v6 = (id)gbrowserLogObj;
      v27 = type;
      if (os_log_type_enabled(v6, type))
      {
        v28 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        v42 = 1024;
        v43 = v28;
        _os_log_impl(&dword_182FBE000, v6, v27, "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0x12u);
      }
    }

  }
  if (v5)
LABEL_13:
    free(v5);
LABEL_14:
  if (*((_QWORD *)self + 15) && !nw_parameters_get_logging_disabled(*((_QWORD *)self + 5)))
  {
    if (__nwlog_browser_log::onceToken[0] != -1)
      dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
    v9 = (id)gbrowserLogObj;
    v10 = *((_DWORD *)self + 48);
    *(_DWORD *)buf = 136446466;
    v41 = "-[NWConcrete_nw_browser dealloc]";
    v42 = 1024;
    v43 = v10;
    v36 = 18;
    v35 = buf;
    v11 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v38 = 0;
    if (!__nwlog_fault(v11, &type, &v38))
    {
LABEL_25:
      if (!v11)
        goto LABEL_27;
      goto LABEL_26;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_browser_log::onceToken[0] != -1)
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
      v12 = (id)gbrowserLogObj;
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        v14 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        v42 = 1024;
        v43 = v14;
        _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef", buf, 0x12u);
      }
LABEL_24:

      goto LABEL_25;
    }
    if (!v38)
    {
      if (__nwlog_browser_log::onceToken[0] != -1)
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
      v12 = (id)gbrowserLogObj;
      v29 = type;
      if (os_log_type_enabled(v12, type))
      {
        v30 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        v42 = 1024;
        v43 = v30;
        _os_log_impl(&dword_182FBE000, v12, v29, "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef, backtrace limit exceeded", buf, 0x12u);
      }
      goto LABEL_24;
    }
    v22 = __nw_create_backtrace_string();
    if (!v22)
    {
      if (__nwlog_browser_log::onceToken[0] != -1)
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
      v12 = (id)gbrowserLogObj;
      v33 = type;
      if (os_log_type_enabled(v12, type))
      {
        v34 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        v42 = 1024;
        v43 = v34;
        _os_log_impl(&dword_182FBE000, v12, v33, "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef, no backtrace", buf, 0x12u);
      }
      goto LABEL_24;
    }
    v23 = (char *)v22;
    if (__nwlog_browser_log::onceToken[0] != -1)
      dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44175);
    v24 = (id)gbrowserLogObj;
    v25 = type;
    if (os_log_type_enabled(v24, type))
    {
      v26 = *((_DWORD *)self + 48);
      *(_DWORD *)buf = 136446722;
      v41 = "-[NWConcrete_nw_browser dealloc]";
      v42 = 1024;
      v43 = v26;
      v44 = 2082;
      v45 = v23;
      _os_log_impl(&dword_182FBE000, v24, v25, "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef, dumping backtrace:%{public}s", buf, 0x1Cu);
    }

    free(v23);
    if (v11)
LABEL_26:
      free(v11);
  }
LABEL_27:
  v15 = (void *)*((_QWORD *)self + 22);
  if (v15)
  {
    free(v15);
    *((_QWORD *)self + 22) = 0;
  }
  v16 = (void *)*((_QWORD *)self + 23);
  if (v16)
  {
    free(v16);
    *((_QWORD *)self + 23) = 0;
  }
  v37.receiver = self;
  v37.super_class = (Class)NWConcrete_nw_browser;
  -[NWConcrete_nw_browser dealloc](&v37, sel_dealloc, v35, v36);
}

- (NSString)description
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = (const char *)nw_browser_get_description(self);
  return (NSString *)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (id)redactedDescription
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = (const char *)nw_browser_get_description(self);
  return (id)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 21, 0);
  objc_storeStrong((id *)self + 20, 0);
  objc_storeStrong((id *)self + 19, 0);
  objc_storeStrong((id *)self + 18, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 2, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
