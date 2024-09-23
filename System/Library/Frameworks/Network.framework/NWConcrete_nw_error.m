@implementation NWConcrete_nw_error

- (_DWORD)initWithDomain:(int)a3 code:
{
  void *v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  char *backtrace_string;
  os_log_type_t v10;
  _BOOL4 v11;
  os_log_type_t v12;
  char v13;
  os_log_type_t type;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v15.receiver = result;
  v15.super_class = (Class)NWConcrete_nw_error;
  result = objc_msgSendSuper2(&v15, sel_init);
  if (result)
  {
    result[2] = a2;
    result[3] = a3;
    return result;
  }
  __nwlog_obj();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
  v6 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v13 = 0;
  if (__nwlog_fault(v6, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = type;
      if (os_log_type_enabled(v7, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_182FBE000, v7, v8, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v13)
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
          *(_DWORD *)buf = 136446466;
          v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
          v18 = 2082;
          v19 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v7, v10, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_21;
      }
      if (v11)
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_182FBE000, v7, v10, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v7, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_182FBE000, v7, v12, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_21:
  if (v6)
    free(v6);
  return 0;
}

- (NSString)description
{
  __CFString *v4;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *string_for_dns_service_error;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  int code;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  char *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  char *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  int v25;
  char *backtrace_string;
  os_log_type_t v27;
  _BOOL4 v28;
  os_log_type_t v29;
  os_log_type_t v30;
  int v31;
  os_log_type_t v32;
  int v33;
  char v34;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  char __strerrbuf[4];
  const char *v41;
  __int16 v42;
  _WORD v43[65];

  *(_QWORD *)&v43[61] = *MEMORY[0x1E0C80C00];
  switch(self->domain)
  {
    case 0:
      return (NSString *)CFSTR("Invalid");
    case 1:
      if (strerror_r(self->code, __strerrbuf, 0x80uLL))
        __strerrbuf[0] = 0;
      v4 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], __strerrbuf, 0x8000100u);
      if (v4)
        return (NSString *)v4;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v37 = "-[NWConcrete_nw_error description]";
      v6 = (char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v34 = 0;
      if (!__nwlog_fault(v6, &type, &v34))
        goto LABEL_64;
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_182FBE000, v7, v8, "%{public}s CFStringCreateWithCString failed", buf, 0xCu);
        }
        goto LABEL_63;
      }
      if (!v34)
      {
        __nwlog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        v32 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_182FBE000, v7, v32, "%{public}s CFStringCreateWithCString failed, backtrace limit exceeded", buf, 0xCu);
        }
LABEL_63:

LABEL_64:
        if (!v6)
          return (NSString *)v4;
LABEL_65:
        free(v6);
        return (NSString *)v4;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      v27 = type;
      v28 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (v28)
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_182FBE000, v7, v27, "%{public}s CFStringCreateWithCString failed, no backtrace", buf, 0xCu);
        }
        goto LABEL_63;
      }
      if (v28)
      {
        *(_DWORD *)buf = 136446466;
        v37 = "-[NWConcrete_nw_error description]";
        v38 = 2082;
        v39 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v27, "%{public}s CFStringCreateWithCString failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
      if (v6)
        goto LABEL_65;
      return (NSString *)v4;
    case 2:
      string_for_dns_service_error = nwlog_get_string_for_dns_service_error(self->code);
      v4 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("DNS Error: %s"), string_for_dns_service_error);
      if (v4)
        return (NSString *)v4;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      *(_DWORD *)__strerrbuf = 136446210;
      v41 = "-[NWConcrete_nw_error description]";
      v11 = (char *)_os_log_send_and_compose_impl();

      buf[0] = 16;
      type = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v11, buf, &type))
        goto LABEL_56;
      if (buf[0] == 17)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v13 = buf[0];
        if (os_log_type_enabled(v12, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)__strerrbuf = 136446210;
          v41 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s CFStringCreateWithFormat failed", (uint8_t *)__strerrbuf, 0xCu);
        }
      }
      else if (type)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v20 = buf[0];
        v21 = os_log_type_enabled(v12, (os_log_type_t)buf[0]);
        if (v19)
        {
          if (v21)
          {
            *(_DWORD *)__strerrbuf = 136446466;
            v41 = "-[NWConcrete_nw_error description]";
            v42 = 2082;
            *(_QWORD *)v43 = v19;
            _os_log_impl(&dword_182FBE000, v12, v20, "%{public}s CFStringCreateWithFormat failed, dumping backtrace:%{public}s", (uint8_t *)__strerrbuf, 0x16u);
          }

          free(v19);
          if (v11)
LABEL_57:
            free(v11);
LABEL_58:
          v4 = 0;
          return (NSString *)v4;
        }
        if (v21)
        {
          *(_DWORD *)__strerrbuf = 136446210;
          v41 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_182FBE000, v12, v20, "%{public}s CFStringCreateWithFormat failed, no backtrace", (uint8_t *)__strerrbuf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v29 = buf[0];
        if (os_log_type_enabled(v12, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)__strerrbuf = 136446210;
          v41 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_182FBE000, v12, v29, "%{public}s CFStringCreateWithFormat failed, backtrace limit exceeded", (uint8_t *)__strerrbuf, 0xCu);
        }
      }

      goto LABEL_56;
    case 3:
      v4 = (__CFString *)SecCopyErrorMessageString(self->code, 0);
      if (v4)
        return (NSString *)v4;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      code = self->code;
      *(_DWORD *)__strerrbuf = 136446466;
      v41 = "-[NWConcrete_nw_error description]";
      v42 = 1024;
      *(_DWORD *)v43 = code;
      v11 = (char *)_os_log_send_and_compose_impl();

      buf[0] = 16;
      type = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v11, buf, &type))
        goto LABEL_56;
      if (buf[0] == 17)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        v17 = buf[0];
        if (os_log_type_enabled(v16, (os_log_type_t)buf[0]))
        {
          v18 = self->code;
          *(_DWORD *)__strerrbuf = 136446466;
          v41 = "-[NWConcrete_nw_error description]";
          v42 = 1024;
          *(_DWORD *)v43 = v18;
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s SecCopyErrorMessageString(%d, NULL) failed", (uint8_t *)__strerrbuf, 0x12u);
        }
      }
      else if (type)
      {
        v22 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v23 = buf[0];
        v24 = os_log_type_enabled(v16, (os_log_type_t)buf[0]);
        if (v22)
        {
          if (v24)
          {
            v25 = self->code;
            *(_DWORD *)__strerrbuf = 136446722;
            v41 = "-[NWConcrete_nw_error description]";
            v42 = 1024;
            *(_DWORD *)v43 = v25;
            v43[2] = 2082;
            *(_QWORD *)&v43[3] = v22;
            _os_log_impl(&dword_182FBE000, v16, v23, "%{public}s SecCopyErrorMessageString(%d, NULL) failed, dumping backtrace:%{public}s", (uint8_t *)__strerrbuf, 0x1Cu);
          }

          free(v22);
          if (v11)
            goto LABEL_57;
          goto LABEL_58;
        }
        if (v24)
        {
          v33 = self->code;
          *(_DWORD *)__strerrbuf = 136446466;
          v41 = "-[NWConcrete_nw_error description]";
          v42 = 1024;
          *(_DWORD *)v43 = v33;
          _os_log_impl(&dword_182FBE000, v16, v23, "%{public}s SecCopyErrorMessageString(%d, NULL) failed, no backtrace", (uint8_t *)__strerrbuf, 0x12u);
        }
      }
      else
      {
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v30 = buf[0];
        if (os_log_type_enabled(v16, (os_log_type_t)buf[0]))
        {
          v31 = self->code;
          *(_DWORD *)__strerrbuf = 136446466;
          v41 = "-[NWConcrete_nw_error description]";
          v42 = 1024;
          *(_DWORD *)v43 = v31;
          _os_log_impl(&dword_182FBE000, v16, v30, "%{public}s SecCopyErrorMessageString(%d, NULL) failed, backtrace limit exceeded", (uint8_t *)__strerrbuf, 0x12u);
        }
      }

LABEL_56:
      if (!v11)
        goto LABEL_58;
      goto LABEL_57;
    default:
      goto LABEL_58;
  }
}

@end
