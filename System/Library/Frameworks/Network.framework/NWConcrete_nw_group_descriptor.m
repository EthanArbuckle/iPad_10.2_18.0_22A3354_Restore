@implementation NWConcrete_nw_group_descriptor

- (void)dealloc
{
  OS_nw_array *members;
  OS_nw_endpoint *specific_source;
  objc_super v5;

  members = self->members;
  self->members = 0;

  specific_source = self->specific_source;
  self->specific_source = 0;

  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_group_descriptor;
  -[NWConcrete_nw_group_descriptor dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  uint64_t type;
  const char *v3;

  type = self->type;
  if (type > 4)
    v3 = "unknown";
  else
    v3 = off_1E149B878[type];
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<%s %@>"), v3, self->members);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->specific_source, 0);
  objc_storeStrong((id *)&self->members, 0);
}

- (uint64_t)initWithType:(void *)a3 member:(_OWORD *)a4 groupID:
{
  id v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  void *v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  char *backtrace_string;
  os_log_type_t v26;
  _BOOL4 v27;
  char *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  os_log_type_t v31;
  os_log_type_t v32;
  char v33;
  os_log_type_t type;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a1)
    goto LABEL_19;
  v35.receiver = a1;
  v35.super_class = (Class)NWConcrete_nw_group_descriptor;
  v8 = (unsigned __int8 *)objc_msgSendSuper2(&v35, sel_init);
  a1 = (uint64_t *)v8;
  if (!v8)
  {
    __nwlog_obj();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v33 = 0;
    if (__nwlog_fault(v18, &type, &v33))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_182FBE000, v19, v20, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v33)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        v26 = type;
        v27 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136446466;
            v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
            v38 = 2082;
            v39 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v19, v26, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_49;
        }
        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_182FBE000, v19, v26, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        v31 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_182FBE000, v19, v31, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_49:
    if (v18)
      free(v18);
    goto LABEL_18;
  }
  if (!a2)
  {
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v33 = 0;
    if (__nwlog_fault(v22, &type, &v33))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_182FBE000, v23, v24, "%{public}s called with null _type", buf, 0xCu);
        }
      }
      else if (v33)
      {
        v28 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v29 = type;
        v30 = os_log_type_enabled(v23, type);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)buf = 136446466;
            v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
            v38 = 2082;
            v39 = v28;
            _os_log_impl(&dword_182FBE000, v23, v29, "%{public}s called with null _type, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v28);
          goto LABEL_54;
        }
        if (v30)
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_182FBE000, v23, v29, "%{public}s called with null _type, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v32 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_182FBE000, v23, v32, "%{public}s called with null _type, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_54:
    if (v22)
      free(v22);

    goto LABEL_18;
  }
  v9 = v8 + 16;
  if (a4)
    *(_OWORD *)v9 = *a4;
  else
    uuid_generate_random(v9);
  *((_DWORD *)a1 + 2) = a2;
  if (v7 && !nw_group_descriptor_allows_endpoint(a1, v7))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *((unsigned int *)a1 + 2);
      if (v14 > 4)
        v15 = "unknown";
      else
        v15 = off_1E149B878[v14];
      *(_DWORD *)buf = 136446466;
      v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
      v38 = 2080;
      v39 = (void *)v15;
      _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_ERROR, "%{public}s Invalid endpoint type specified for group descriptor of type %s", buf, 0x16u);
    }

LABEL_18:
    a1 = 0;
    goto LABEL_19;
  }
  v10 = nw_array_create();
  v11 = (void *)a1[4];
  a1[4] = v10;

  if (v7)
    nw_array_append(a1[4], v7);
  v12 = (void *)a1[5];
  a1[5] = 0;

  *((_BYTE *)a1 + 48) &= ~1u;
LABEL_19:

  return a1;
}

@end
