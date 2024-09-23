@implementation NWConcrete_nw_custom_endpoint

- (unsigned)type
{
  return self->type;
}

- (id)copyDictionary
{
  id v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  char *backtrace_string;
  os_log_type_t v8;
  _BOOL4 v9;
  NSObject *v11;
  os_log_type_t v12;
  char v13;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
  v3 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v13 = 0;
  if (__nwlog_fault(v3, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (id)gLogObj;
      v5 = type;
      if (!os_log_type_enabled(v4, type))
        goto LABEL_17;
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
      v6 = "%{public}s copyDictionary not supported";
LABEL_15:
      v11 = v4;
      v12 = v5;
      goto LABEL_16;
    }
    if (!v13)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (id)gLogObj;
      v5 = type;
      if (!os_log_type_enabled(v4, type))
        goto LABEL_17;
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
      v6 = "%{public}s copyDictionary not supported, backtrace limit exceeded";
      goto LABEL_15;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
    v8 = type;
    v9 = os_log_type_enabled(v4, type);
    if (!backtrace_string)
    {
      if (!v9)
      {
LABEL_17:

        if (!v3)
          return 0;
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
      v6 = "%{public}s copyDictionary not supported, no backtrace";
      v11 = v4;
      v12 = v8;
LABEL_16:
      _os_log_impl(&dword_182FBE000, v11, v12, v6, buf, 0xCu);
      goto LABEL_17;
    }
    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
      v17 = 2082;
      v18 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v4, v8, "%{public}s copyDictionary not supported, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v3)
LABEL_11:
    free(v3);
  return 0;
}

- (char)createDescription:(BOOL)a3
{
  unsigned int type;
  NSObject *data;
  char *v6;

  v6 = 0;
  type = self->type;
  data = self->data;
  if (data)
    data = dispatch_data_get_size(data);
  asprintf(&v6, "<type:%u,length:%zu>", type, (size_t)data);
  return v6;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4;
  NWConcrete_nw_custom_endpoint *v6;
  BOOL v7;
  objc_super v9;

  v4 = a4;
  v6 = (NWConcrete_nw_custom_endpoint *)a3;
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_custom_endpoint;
  v7 = -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v9, sel_isEqualToEndpoint_matchFlags_, v6, v4)
    && !self->resolver_block
    && !v6->resolver_block
    && (self == v6 || nw_dispatch_data_is_equal((dispatch_data_t)self->data, v6->data));

  return v7;
}

- (id)copyEndpoint
{
  return nw_endpoint_create_custom(self->type, self->data, self->resolver_block);
}

- (unint64_t)getHash
{
  NSObject *data;
  int8x16_t v4;
  int8x16_t v6;
  int8x16_t v7;
  _QWORD applier[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  __n128 (*v12)(uint64_t, uint64_t);
  uint64_t (*v13)();
  void *v14;
  CC_SHA256_CTX v15;
  unsigned __int8 md[16];
  int8x16_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x9812000000;
  v12 = __Block_byref_object_copy__25611;
  v13 = __Block_byref_object_dispose__25612;
  v14 = &unk_183EA1965;
  memset(&v15, 0, sizeof(v15));
  CC_SHA256_Init(&v15);
  CC_SHA256_Update((CC_SHA256_CTX *)(v10 + 6), &self->type, 4u);
  data = self->data;
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __40__NWConcrete_nw_custom_endpoint_getHash__block_invoke;
  applier[3] = &unk_1E149DE48;
  applier[4] = &v9;
  dispatch_data_apply(data, applier);
  CC_SHA256_Final(md, (CC_SHA256_CTX *)(v10 + 6));
  v6 = *(int8x16_t *)md;
  v7 = v17;
  _Block_object_dispose(&v9, 8);
  v4 = veorq_s8(v6, v7);
  return (unint64_t)veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->resolver_block, 0);
  objc_storeStrong((id *)&self->data, 0);
}

@end
