@implementation NWConcrete_nw_srv_endpoint

- (void)dealloc
{
  char *name;
  objc_super v4;

  name = self->name;
  if (name)
  {
    free(name);
    self->name = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_srv_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v4, sel_dealloc);
}

- (unsigned)type
{
  return 5;
}

- (id)copyDictionary
{
  id v3;
  void *v4;
  char *name;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NWConcrete_nw_srv_endpoint;
  v3 = -[NWConcrete_nw_endpoint copyDictionary](&v8, sel_copyDictionary);
  v4 = v3;
  if (v3)
  {
    name = self->name;
    if (name)
      xpc_dictionary_set_string(v3, "srv_name", name);
    v6 = v4;
  }

  return v4;
}

- (const)domainForPolicy
{
  return self->name;
}

- (char)createDescription:(BOOL)a3
{
  _BOOL4 v3;
  char *name;
  char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  char *v10;
  char *v12;
  char v13;
  char __str[13];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  name = self->name;
  v6 = (char *)nw_endpoint_copy_interface(self);
  if (v3)
  {
    v13 = 0;
    v12 = 0;
    v7 = __nwlog_salted_hostname_hash(self->name, (char *)&v12);
    name = __str;
    snprintf(__str, 0xDuLL, "%s%s", "SRV#", v7);
  }
  v8 = "@";
  v12 = 0;
  v9 = "";
  if (v6)
    v9 = v6 + 104;
  else
    v8 = "";
  asprintf(&v12, "%s%s%s", name, v8, v9);
  v10 = v12;

  return v10;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4;
  const char **v6;
  BOOL v7;
  objc_super v9;

  v4 = a4;
  v6 = (const char **)a3;
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_srv_endpoint;
  v7 = -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v9, sel_isEqualToEndpoint_matchFlags_, v6, v4)
    && strcmp(self->name, v6[29]) == 0;

  return v7;
}

- (id)copyEndpoint
{
  return (id)-[NWConcrete_nw_srv_endpoint initWithName:]([NWConcrete_nw_srv_endpoint alloc], self->name);
}

- (unint64_t)getHash
{
  char *name;
  CC_LONG v4;
  int8x16_t v5;
  CC_SHA256_CTX v7;
  unsigned __int8 md[16];
  int8x16_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  name = self->name;
  v4 = strlen(name);
  CC_SHA256_Update(&v7, name, v4);
  CC_SHA256_Final(md, &v7);
  v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (BOOL)initWithName:(void *)a1
{
  id v3;
  char *v4;
  size_t v5;
  unint64_t v6;
  _BOOL8 result;
  void *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  void *v17;
  char *backtrace_string;
  os_log_type_t v19;
  _BOOL4 v20;
  char *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  os_log_type_t v24;
  os_log_type_t v25;
  char v26;
  os_log_type_t type;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v28.receiver = a1;
  v28.super_class = (Class)NWConcrete_nw_srv_endpoint;
  v3 = objc_msgSendSuper2(&v28, sel_init);
  if (!v3)
  {
    __nwlog_obj();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
    v9 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v26 = 0;
    if (__nwlog_fault(v9, &type, &v26))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v26)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        v19 = type;
        v20 = os_log_type_enabled(v10, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
            v31 = 2082;
            v32 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v10, v19, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_42;
        }
        if (v20)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_182FBE000, v10, v19, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        v24 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_182FBE000, v10, v24, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_42:
    if (v9)
      free(v9);
    return 0;
  }
  if (!a2)
  {
    __nwlog_obj();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v26 = 0;
    if (__nwlog_fault(v13, &type, &v26))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s called with null _name", buf, 0xCu);
        }
      }
      else if (v26)
      {
        v21 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v22 = type;
        v23 = os_log_type_enabled(v14, type);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
            v31 = 2082;
            v32 = v21;
            _os_log_impl(&dword_182FBE000, v14, v22, "%{public}s called with null _name, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v21);
          goto LABEL_47;
        }
        if (v23)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_182FBE000, v14, v22, "%{public}s called with null _name, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_182FBE000, v14, v25, "%{public}s called with null _name, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_47:
    if (v13)
      free(v13);

    return 0;
  }
  v4 = strdup(a2);
  if (v4)
  {
LABEL_5:
    *((_QWORD *)v3 + 29) = v4;
    v5 = strlen(v4);
    if (v5 >= 7)
    {
      v6 = v5;
      if (!strcmp(&v4[v5 - 6], ".local") || v6 >= 8 && !strcmp(&v4[v6 - 7], ".local."))
        *((_BYTE *)v3 + 231) |= 1u;
    }
    return (BOOL)v3;
  }
  __nwlog_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v30 = "strict_strdup";
  v17 = (void *)_os_log_send_and_compose_impl();

  result = __nwlog_abort((uint64_t)v17);
  if (!result)
  {
    free(v17);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

@end
