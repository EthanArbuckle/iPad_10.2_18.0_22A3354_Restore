@implementation NWConcrete_nw_resolver_config

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_DWORD *)self + 22) = 0;
  return self;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_resolver_config;
  -[NWConcrete_nw_resolver_config dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  OS_nw_fd_wrapper *m_obj;
  OS_nw_fd_wrapper *v4;
  OS_dispatch_source *v5;
  OS_xpc_object *v6;

  m_obj = self->agent_fd.m_obj;
  if ((*((_BYTE *)&self->agent_fd + 8) & 1) != 0 && m_obj)
  {
    self->agent_fd.m_obj = 0;

    m_obj = self->agent_fd.m_obj;
  }
  self->agent_fd.m_obj = 0;

  v4 = self->kernel_event_wrapper.m_obj;
  if ((*((_BYTE *)&self->kernel_event_wrapper + 8) & 1) != 0 && v4)
  {
    self->kernel_event_wrapper.m_obj = 0;

    v4 = self->kernel_event_wrapper.m_obj;
  }
  self->kernel_event_wrapper.m_obj = 0;

  v5 = self->kernel_event_source.m_obj;
  if ((*((_BYTE *)&self->kernel_event_source + 8) & 1) != 0 && v5)
  {
    self->kernel_event_source.m_obj = 0;

    v5 = self->kernel_event_source.m_obj;
  }
  self->kernel_event_source.m_obj = 0;

  v6 = self->dictionary.m_obj;
  if ((*((_BYTE *)&self->dictionary + 8) & 1) != 0 && v6)
  {
    self->dictionary.m_obj = 0;

    v6 = self->dictionary.m_obj;
  }
  self->dictionary.m_obj = 0;

}

- (NWConcrete_nw_resolver_config)init
{
  NWConcrete_nw_resolver_config *v2;
  NWConcrete_nw_resolver_config *v3;
  NWConcrete_nw_resolver_config *v4;
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
  v16.super_class = (Class)NWConcrete_nw_resolver_config;
  v2 = -[NWConcrete_nw_resolver_config init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_resolver_config init]";
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
        v18 = "-[NWConcrete_nw_resolver_config init]";
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
          v18 = "-[NWConcrete_nw_resolver_config init]";
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
        v18 = "-[NWConcrete_nw_resolver_config init]";
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
        v18 = "-[NWConcrete_nw_resolver_config init]";
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

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t *v10;
  unsigned int v11;
  _QWORD *v12;
  const char *v13;
  size_t v14;
  _QWORD *v15;
  unsigned int protocol;
  const char *v17;
  size_t v18;
  uint64_t v19;
  const char *provider_name;
  uint64_t provider_path;
  const char *v22;
  _QWORD *v23;
  size_t v24;
  size_t v25;
  uint64_t *v26;
  int v27;
  size_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  const void **v32;
  const void *v33;
  uint64_t v34;
  uint64_t v35;
  void **v36;
  __CFString *v37;
  void *__p[2];
  int64_t v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  void *v48;
  uint64_t v49;
  uint64_t v50[8];
  __int128 v51;
  __int128 v52;
  int v53;
  uint64_t v54[19];

  v43 = 0;
  v44 = &v43;
  v45 = 0x13812000000;
  v46 = __Block_byref_object_copy__52656;
  v47 = __Block_byref_object_dispose__52657;
  v3 = MEMORY[0x1E0DE4FE0];
  v4 = MEMORY[0x1E0DE4FE0] + 64;
  v54[0] = MEMORY[0x1E0DE4FE0] + 64;
  v5 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v48 = &unk_183EA1965;
  v49 = v6;
  *(uint64_t *)((char *)&v50[-1] + *(_QWORD *)(v6 - 24)) = v7;
  v8 = (std::ios_base *)((char *)&v50[-1] + *(_QWORD *)(v49 - 24));
  std::ios_base::init(v8, v50);
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v49 = v3 + 24;
  v54[0] = v4;
  std::streambuf::basic_streambuf();
  v9 = MEMORY[0x1E0DE4FB8];
  v50[0] = MEMORY[0x1E0DE4FB8] + 16;
  v51 = 0u;
  v52 = 0u;
  v53 = 16;
  v10 = v44;
  v11 = nw_resolver_config_get_class(self);
  v12 = v10 + 6;
  if (v11 > 4)
    v13 = "unknown";
  else
    v13 = off_1E14A4BB0[v11];
  v14 = strlen(v13);
  v15 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v12, (uint64_t)v13, v14);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)" ", 1);
  protocol = nw_resolver_config_get_protocol(self);
  if (protocol > 3)
    v17 = "unknown";
  else
    v17 = off_1E14A4BD8[protocol];
  v18 = strlen(v17);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v12, (uint64_t)v17, v18);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44 + 6, (uint64_t)"servers = [ ", 12);
  v19 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __44__NWConcrete_nw_resolver_config_description__block_invoke;
  v42[3] = &unk_1E14A7900;
  v42[4] = &v43;
  nw_resolver_config_enumerate_name_servers(self, v42);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44 + 6, (uint64_t)"] domains = [ ", 14);
  v41[0] = v19;
  v41[1] = 3221225472;
  v41[2] = __44__NWConcrete_nw_resolver_config_description__block_invoke_2;
  v41[3] = &unk_1E14A7900;
  v41[4] = &v43;
  nw_resolver_config_enumerate_search_domains(self, v41);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44 + 6, (uint64_t)"]", 1);
  provider_name = (const char *)nw_resolver_config_get_provider_name(self);
  provider_path = nw_resolver_config_get_provider_path(self);
  if (provider_name)
  {
    v22 = (const char *)provider_path;
    v23 = v44 + 6;
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44 + 6, (uint64_t)" provider = ", 12);
    if (v22)
    {
      v24 = strlen(provider_name);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v23, (uint64_t)provider_name, v24);
    }
    else
    {
      v22 = provider_name;
    }
    v25 = strlen(v22);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v23, (uint64_t)v22, v25);
  }
  v26 = v44;
  v27 = *((_DWORD *)v44 + 38);
  if ((v27 & 0x10) != 0)
  {
    v30 = v44[18];
    v31 = v44[13];
    if (v30 < v31)
    {
      v44[18] = v31;
      v30 = v31;
    }
    v32 = (const void **)(v26 + 12);
  }
  else
  {
    if ((v27 & 8) == 0)
    {
      v28 = 0;
      HIBYTE(v40) = 0;
      v29 = __p;
      goto LABEL_27;
    }
    v32 = (const void **)(v44 + 9);
    v30 = v44[11];
  }
  v33 = *v32;
  v28 = v30 - (_QWORD)*v32;
  if (v28 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (v28 >= 0x17)
  {
    v34 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v28 | 7) != 0x17)
      v34 = v28 | 7;
    v35 = v34 + 1;
    v29 = operator new(v34 + 1);
    __p[1] = (void *)v28;
    v40 = v35 | 0x8000000000000000;
    __p[0] = v29;
    goto LABEL_26;
  }
  HIBYTE(v40) = v30 - *(_BYTE *)v32;
  v29 = __p;
  if (v28)
LABEL_26:
    memmove(v29, v33, v28);
LABEL_27:
  *((_BYTE *)v29 + v28) = 0;
  if (v40 >= 0)
    v36 = __p;
  else
    v36 = (void **)__p[0];
  v37 = (__CFString *)CFStringCreateWithCString(0, (const char *)v36, 0x8000100u);
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  _Block_object_dispose(&v43, 8);
  v49 = *v5;
  *(uint64_t *)((char *)&v50[-1] + *(_QWORD *)(v49 - 24)) = v5[3];
  v50[0] = v9 + 16;
  if (SBYTE7(v52) < 0)
    operator delete((void *)v51);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x186DB3548](v54);
  return (NSString *)v37;
}

@end
