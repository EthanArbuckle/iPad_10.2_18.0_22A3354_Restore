@implementation NWConcrete_nw_masque_connection

- (NSString)description
{
  NWConcrete_nw_masque_connection *v2;
  NWConcrete_nw_masque_connection *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  unsigned int *v10;
  const char *v11;
  __CFString *v12;
  void *v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  char *backtrace_string;
  os_log_type_t v18;
  _BOOL4 v19;
  os_log_type_t v20;
  char v22;
  os_log_type_t type;
  _BYTE buf[12];
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = self;
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)buf = 0;
    v4 = *((_QWORD *)v2 + 1);
    v5 = *((unsigned __int8 *)v2 + 112);
    v6 = "invalid";
    switch(*((_BYTE *)v2 + 112))
    {
      case 0:
        goto LABEL_23;
      case 1:
        v6 = "initial";
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (!v7)
          goto LABEL_11;
        goto LABEL_24;
      case 2:
        v6 = "connected";
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (!v7)
          goto LABEL_11;
        goto LABEL_24;
      case 3:
        v6 = "got_vers";
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (!v7)
          goto LABEL_11;
        goto LABEL_24;
      case 4:
        v6 = "got_methods";
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (!v7)
          goto LABEL_11;
        goto LABEL_24;
      case 5:
        v6 = "got_address_type";
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (!v7)
          goto LABEL_11;
        goto LABEL_24;
      case 6:
        v6 = "got_address";
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (!v7)
          goto LABEL_11;
        goto LABEL_24;
      case 7:
        v6 = "got_request";
LABEL_23:
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (v7)
          goto LABEL_24;
        goto LABEL_11;
      case 8:
        v6 = "out_connected";
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (!v7)
          goto LABEL_11;
        goto LABEL_24;
      default:
        v8 = "cancelled";
        if (v5 != 255)
          v8 = "unknown";
        if (v5 == 200)
          v6 = "ready";
        else
          v6 = v8;
        v7 = (void *)*((_QWORD *)v2 + 6);
        if (v7)
        {
LABEL_24:
          v10 = v7;
          v9 = v10[112];

        }
        else
        {
LABEL_11:
          v9 = 0;
        }
        asprintf((char **)buf, "[MPC%llu %s in[C%llu]]", v4, v6, v9);
        v11 = *(const char **)buf;

        if (!v11)
          goto LABEL_47;
        v12 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
        break;
    }
    return (NSString *)v12;
  }
  __nwlog_obj();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)&buf[4] = "nw_masque_connection_copy_description";
  v14 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v22 = 0;
  if (__nwlog_fault(v14, &type, &v22))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_masque_connection_copy_description";
        _os_log_impl(&dword_182FBE000, v15, v16, "%{public}s called with null masqueConnection", buf, 0xCu);
      }
    }
    else if (v22)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      v19 = os_log_type_enabled(v15, type);
      if (backtrace_string)
      {
        if (v19)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_masque_connection_copy_description";
          v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v15, v18, "%{public}s called with null masqueConnection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_45;
      }
      if (v19)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_masque_connection_copy_description";
        _os_log_impl(&dword_182FBE000, v15, v18, "%{public}s called with null masqueConnection, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v20 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_masque_connection_copy_description";
        _os_log_impl(&dword_182FBE000, v15, v20, "%{public}s called with null masqueConnection, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_45:
  if (v14)
    free(v14);
LABEL_47:
  v12 = 0;
  return (NSString *)v12;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  NWConcrete_nw_masque_connection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (gLogDatapath)
  {
    __nwlog_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v6 = "-[NWConcrete_nw_masque_connection dealloc]";
      v7 = 2114;
      v8 = self;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %{public}@", buf, 0x16u);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_masque_connection;
  -[NWConcrete_nw_masque_connection dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_destroyWeak((id *)self + 5);
  objc_storeStrong((id *)self + 4, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 0;
  return self;
}

@end
