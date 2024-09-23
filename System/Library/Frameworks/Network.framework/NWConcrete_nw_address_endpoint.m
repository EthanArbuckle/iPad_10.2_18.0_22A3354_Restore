@implementation NWConcrete_nw_address_endpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ech_config, 0);
}

- (id)copyEndpoint
{
  nw_endpoint_t address_with_ethernet;

  address_with_ethernet = nw_endpoint_create_address_with_ethernet((const sockaddr *)&self->address, (int *)&self->ethernet_address);
  LODWORD(address_with_ethernet[48].isa) = self->original_fd;
  objc_storeStrong((id *)&address_with_ethernet[46].isa, self->ech_config);
  return address_with_ethernet;
}

- (unsigned)type
{
  return 1;
}

- (unint64_t)getHash
{
  int8x16_t v3;
  CC_SHA256_CTX v5;
  unsigned __int8 md[16];
  int8x16_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&v5, 0, sizeof(v5));
  CC_SHA256_Init(&v5);
  CC_SHA256_Update(&v5, &self->address, self->address.ss_len);
  CC_SHA256_Update(&v5, &self->ethernet_address, 6u);
  CC_SHA256_Final(md, &v5);
  v3 = veorq_s8(*(int8x16_t *)md, v7);
  return (unint64_t)veor_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
}

- (void)dealloc
{
  char *hostname;
  objc_super v4;

  hostname = self->hostname;
  if (hostname)
  {
    free(hostname);
    self->hostname = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_address_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  _OWORD *v7;
  size_t ss_len;
  int ss_family;
  int v10;
  int v11;
  BOOL v12;
  int v14;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_address_endpoint;
  if (-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v16, sel_isEqualToEndpoint_matchFlags_, v6, v4))
  {
    v7 = v6;
    if (self->original_fd == *((_DWORD *)v7 + 96))
    {
      ss_len = self->address.ss_len;
      if ((_DWORD)ss_len == *((unsigned __int8 *)v7 + 232))
      {
        ss_family = self->address.ss_family;
        if (ss_family == *((unsigned __int8 *)v7 + 233))
        {
          if (ss_family == 30)
          {
            if (*(unsigned __int16 *)self->address.__ss_pad1 == *((unsigned __int16 *)v7 + 117)
              && *(_DWORD *)&self->address.__ss_pad1[2] == *((_DWORD *)v7 + 59))
            {
              v12 = *(_OWORD *)&self->address.__ss_align == v7[15];
              if ((v4 & 1) == 0 || *(_OWORD *)&self->address.__ss_align != v7[15])
                goto LABEL_18;
              if (*(_DWORD *)&self->address.__ss_pad2[8] == *((_DWORD *)v7 + 64))
                goto LABEL_22;
            }
          }
          else
          {
            if (ss_family != 2)
            {
              v14 = memcmp(&self->address, (char *)v7 + 232, ss_len);
              v12 = v14 == 0;
              if ((v4 & 1) == 0 || v14)
                goto LABEL_18;
              goto LABEL_22;
            }
            if (*(unsigned __int16 *)self->address.__ss_pad1 == *((unsigned __int16 *)v7 + 117))
            {
              v10 = *(_DWORD *)&self->address.__ss_pad1[2];
              v11 = *((_DWORD *)v7 + 59);
              v12 = v10 == v11;
              if ((v4 & 1) == 0 || v10 != v11)
                goto LABEL_18;
LABEL_22:
              v12 = *(_DWORD *)self->ethernet_address.octet == *((_DWORD *)v7 + 90)
                 && *(unsigned __int16 *)&self->ethernet_address.octet[4] == *((unsigned __int16 *)v7 + 182);
              goto LABEL_18;
            }
          }
        }
      }
    }
    v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (char)initWithAddress:(const char *)a3 overridePort:
{
  char *v5;
  unsigned int v6;
  id v7;
  int v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  int v13;
  unsigned int v14;
  NSObject *v15;
  char *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  int v19;
  os_log_type_t v20;
  int v21;
  int v22;
  __int16 v23;
  int v24;
  NSObject *v25;
  unsigned int v26;
  int v27;
  id v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  id v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  char *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  char *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  os_log_type_t v43;
  os_log_type_t v44;
  void *v45;
  char *v46;
  NSObject *v47;
  os_log_type_t v48;
  char *backtrace_string;
  os_log_type_t v50;
  _BOOL4 v51;
  os_log_type_t v52;
  char v53;
  os_log_type_t type;
  objc_super v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  _WORD v59[17];

  *(_QWORD *)&v59[13] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v55.receiver = a1;
  v55.super_class = (Class)NWConcrete_nw_address_endpoint;
  v5 = (char *)objc_msgSendSuper2(&v55, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    v46 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (__nwlog_fault(v46, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v47, v48, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v53)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v47 = objc_claimAutoreleasedReturnValue();
        v50 = type;
        v51 = os_log_type_enabled(v47, type);
        if (backtrace_string)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            v58 = 2082;
            *(_QWORD *)v59 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v47, v50, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_108;
        }
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v47, v50, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v47 = objc_claimAutoreleasedReturnValue();
        v52 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v47, v52, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_108:
    if (v46)
      free(v46);
    return 0;
  }
  v6 = *a2;
  if ((v6 + 127) <= 0x80u)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    v8 = *a2;
    *(_DWORD *)buf = 136446466;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    v58 = 1024;
    *(_DWORD *)v59 = v8;
    v9 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (__nwlog_fault(v9, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v11 = type;
        if (os_log_type_enabled(v10, type))
        {
          v12 = *a2;
          *(_DWORD *)buf = 136446466;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          v58 = 1024;
          *(_DWORD *)v59 = v12;
          _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s Invalid sockaddr length: %u", buf, 0x12u);
        }
      }
      else if (v53)
      {
        v16 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v17 = type;
        v18 = os_log_type_enabled(v10, type);
        if (v16)
        {
          if (v18)
          {
            v19 = *a2;
            *(_DWORD *)buf = 136446722;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            v58 = 1024;
            *(_DWORD *)v59 = v19;
            v59[2] = 2082;
            *(_QWORD *)&v59[3] = v16;
            _os_log_impl(&dword_182FBE000, v10, v17, "%{public}s Invalid sockaddr length: %u, dumping backtrace:%{public}s", buf, 0x1Cu);
          }

          free(v16);
          if (!v9)
            goto LABEL_35;
          goto LABEL_34;
        }
        if (v18)
        {
          v22 = *a2;
          *(_DWORD *)buf = 136446466;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          v58 = 1024;
          *(_DWORD *)v59 = v22;
          _os_log_impl(&dword_182FBE000, v10, v17, "%{public}s Invalid sockaddr length: %u, no backtrace", buf, 0x12u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v20 = type;
        if (os_log_type_enabled(v10, type))
        {
          v21 = *a2;
          *(_DWORD *)buf = 136446466;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          v58 = 1024;
          *(_DWORD *)v59 = v21;
          _os_log_impl(&dword_182FBE000, v10, v20, "%{public}s Invalid sockaddr length: %u, backtrace limit exceeded", buf, 0x12u);
        }
      }

    }
    if (!v9)
    {
LABEL_35:

      return 0;
    }
LABEL_34:
    free(v9);
    goto LABEL_35;
  }
  v13 = a2[1];
  if (v13 != 30)
  {
    v14 = *a2;
    if (v13 != 2)
      goto LABEL_43;
    if (v6 >= 0x11)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      v14 = 16;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
        v58 = 1024;
        *(_DWORD *)v59 = v6;
        v59[2] = 2048;
        v14 = 16;
        *(_QWORD *)&v59[3] = 16;
        _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_ERROR, "%{public}s Changing endpoint address length from %u to %lu, too long for family AF_INET", buf, 0x1Cu);
      }
LABEL_38:

      if (a2[1] != 30)
        goto LABEL_43;
      goto LABEL_39;
    }
    if (v6 == 16)
    {
      v14 = 16;
      goto LABEL_43;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v29 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    v30 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (__nwlog_fault(v30, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v31 = (id)gLogObj;
        v32 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v31, v32, "%{public}s sockaddr_in too small", buf, 0xCu);
        }
      }
      else if (v53)
      {
        v37 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v31 = objc_claimAutoreleasedReturnValue();
        v38 = type;
        v39 = os_log_type_enabled(v31, type);
        if (v37)
        {
          if (v39)
          {
            *(_DWORD *)buf = 136446466;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            v58 = 2082;
            *(_QWORD *)v59 = v37;
            _os_log_impl(&dword_182FBE000, v31, v38, "%{public}s sockaddr_in too small, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v37);
          goto LABEL_83;
        }
        if (v39)
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v31, v38, "%{public}s sockaddr_in too small, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v31 = objc_claimAutoreleasedReturnValue();
        v43 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v31, v43, "%{public}s sockaddr_in too small, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_83:
    if (v30)
      free(v30);
    goto LABEL_35;
  }
  if (v6 >= 0x1D)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
      v58 = 1024;
      *(_DWORD *)v59 = v6;
      v59[2] = 2048;
      v14 = 28;
      *(_QWORD *)&v59[3] = 28;
      _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_ERROR, "%{public}s Changing endpoint address length from %u to %lu, too long for family AF_INET6", buf, 0x1Cu);
    }
    else
    {
      v14 = 28;
    }
    goto LABEL_38;
  }
  if (v6 != 28)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v33 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v53 = 0;
    if (__nwlog_fault(v34, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v35 = (id)gLogObj;
        v36 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v35, v36, "%{public}s sockaddr_in6 too small", buf, 0xCu);
        }
      }
      else if (v53)
      {
        v40 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v35 = objc_claimAutoreleasedReturnValue();
        v41 = type;
        v42 = os_log_type_enabled(v35, type);
        if (v40)
        {
          if (v42)
          {
            *(_DWORD *)buf = 136446466;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            v58 = 2082;
            *(_QWORD *)v59 = v40;
            _os_log_impl(&dword_182FBE000, v35, v41, "%{public}s sockaddr_in6 too small, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v40);
          goto LABEL_89;
        }
        if (v42)
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v35, v41, "%{public}s sockaddr_in6 too small, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v35 = objc_claimAutoreleasedReturnValue();
        v44 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_182FBE000, v35, v44, "%{public}s sockaddr_in6 too small, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_89:
    if (v34)
      free(v34);
    goto LABEL_35;
  }
  v14 = 28;
LABEL_39:
  if (!*((_DWORD *)a2 + 2) && !*((_DWORD *)a2 + 3) && *((_DWORD *)a2 + 4) == -65536)
  {
    v23 = *((_WORD *)a2 + 1);
    v24 = *((_DWORD *)a2 + 5);
    *((_WORD *)v5 + 116) = 528;
    *((_WORD *)v5 + 117) = v23;
    *((_DWORD *)v5 + 59) = v24;
    *((_QWORD *)v5 + 30) = 0;
    LOBYTE(v14) = 16;
    goto LABEL_44;
  }
LABEL_43:
  memcpy(v5 + 232, a2, v14);
LABEL_44:
  v5[232] = v14;
  if (v5[233] == 2 && *((_QWORD *)v5 + 30))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
      _os_log_impl(&dword_182FBE000, v25, OS_LOG_TYPE_ERROR, "%{public}s Fixing endpoint address with non-zero sin_zero field", buf, 0xCu);
    }

    *((_QWORD *)v5 + 30) = 0;
  }
  if (a3)
  {
    v26 = strtol(a3, 0, 0);
    v27 = v5[233];
    if (v27 == 30 || v27 == 2)
      *((_WORD *)v5 + 117) = bswap32(v26) >> 16;
  }
  return v5;
}

- (void)setPriority:(unsigned __int16)a3
{
  self->priority = a3;
}

- (unsigned)priority
{
  return self->priority;
}

- (char)createDescription:(BOOL)a3
{
  _BOOL4 v3;
  char *v5;
  sockaddr_storage *p_address;
  int ss_family;
  int v9;
  id v11;
  char *v12;
  uint64_t v13;
  int v14;
  id v16;
  int ss_len;
  char *v18;
  uint64_t v19;
  int v20;
  char *v21;
  int ss_align_low;
  uint64_t_t *p_ss_align;
  unsigned int v24;
  NWConcrete_nw_interface *v25;
  id v26;
  uint64_t v27;
  int v28;
  unsigned int alternate_port;
  unsigned int v30;
  const char *v31;
  unsigned int v32;
  const char *v33;
  unsigned int v34;
  const char *v35;
  char *v36;
  char *result;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  char *v46;
  _BYTE v47[18];
  __int16 v48;
  char *v49;
  char __str[8];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  char v54;
  char __s1[100];
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  __s1[0] = 0;
  v46 = 0;
  v5 = (char *)nw_endpoint_copy_interface(self);
  p_address = &self->address;
  ss_family = self->address.ss_family;
  if (ss_family == 30 || ss_family == 2)
  {
    v54 = 0;
    v53 = 0;
    __s1[0] = 0;
    if (ss_family == 30)
    {
      p_ss_align = &self->address.__ss_align;
      ss_align_low = LOBYTE(self->address.__ss_align);
      *(_QWORD *)__str = 0;
      v51 = 0;
      v52 = 0;
      if (ss_align_low == 254 && (BYTE1(self->address.__ss_align) & 0xC0) == 0x80)
      {
        v24 = *(_DWORD *)&self->address.__ss_pad2[8];
        if (v24)
        {
          v25 = nw_interface_create_with_index(v24);
          if (v25)
            snprintf(__str, 0x12uLL, "%%%s");
          else
            snprintf(__str, 0x12uLL, "%%%u");

        }
      }
      if (v3
        && (*(_DWORD *)p_ss_align
         || HIDWORD(self->address.__ss_align)
         || *(_DWORD *)self->address.__ss_pad2
         || (*(_DWORD *)&self->address.__ss_pad2[4] | 0x1000000) != 0x1000000))
      {
        __nwlog_salted_hash(p_ss_align, 16, (char *)&v53);
        snprintf(__s1, 0x64uLL, "IPv6#%s%s.");
        goto LABEL_59;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v26 = (id)gLogObj;
      *(_QWORD *)v47 = 0x1004120302;
      *(_WORD *)&v47[8] = 2098;
      *(_QWORD *)&v47[10] = &self->address.__ss_align;
      v48 = 2082;
      v49 = __str;
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12 == __s1)
        goto LABEL_59;
      if (!v12)
      {
        __nwlog_obj();
        v44 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
        *(_DWORD *)v47 = 136446210;
        *(_QWORD *)&v47[4] = "_strict_strlcpy";
        v45 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v45);
        if ((_DWORD)result)
          goto LABEL_73;
        free(v45);
      }
      v27 = 0;
      while (1)
      {
        v28 = __s1[v27];
        v12[v27] = v28;
        if (!v28)
          break;
        if (++v27 == 99)
        {
LABEL_56:
          v12[99] = 0;
          break;
        }
      }
    }
    else
    {
      if (ss_family != 2)
      {
LABEL_59:
        alternate_port = nw_endpoint_get_alternate_port(self);
        v30 = -[NWConcrete_nw_address_endpoint port](self, "port");
        v31 = v5 + 104;
        v32 = __rev16(v30);
        v33 = "/";
        if (!alternate_port)
          v33 = "";
        v34 = __rev16(alternate_port);
        v35 = "@";
        if (!v5)
        {
          v35 = "";
          v31 = "";
        }
        asprintf(&v46, "%s%u%s%.0u%s%s", __s1, v32, v33, v34, v35, v31);
        goto LABEL_64;
      }
      v9 = *(_DWORD *)&self->address.__ss_pad1[2];
      *(_DWORD *)__str = v9;
      if (v3 && v9 && v9 != 16777343)
      {
        __nwlog_salted_hash(__str, 4, (char *)&v53);
        snprintf(__s1, 0x64uLL, "IPv4#%s:");
        goto LABEL_59;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      *(_DWORD *)v47 = 67240192;
      *(_DWORD *)&v47[4] = v9;
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12 == __s1)
        goto LABEL_59;
      if (!v12)
      {
        __nwlog_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
        *(_DWORD *)v47 = 136446210;
        *(_QWORD *)&v47[4] = "_strict_strlcpy";
        v41 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v41);
        if ((_DWORD)result)
          goto LABEL_73;
        free(v41);
      }
      v13 = 0;
      while (1)
      {
        v14 = __s1[v13];
        v12[v13] = v14;
        if (!v14)
          break;
        if (++v13 == 99)
          goto LABEL_56;
      }
    }
    if (v12)
      free(v12);
    goto LABEL_59;
  }
  if (ss_family == 1 || !v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    ss_len = p_address->ss_len;
    *(_DWORD *)v47 = 68157954;
    *(_DWORD *)&v47[4] = ss_len;
    *(_WORD *)&v47[8] = 2098;
    *(_QWORD *)&v47[10] = &self->address;
    v18 = (char *)_os_log_send_and_compose_impl();

    if (v18 != __s1)
    {
      if (!v18)
      {
        __nwlog_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
        *(_DWORD *)v47 = 136446210;
        *(_QWORD *)&v47[4] = "_strict_strlcpy";
        v43 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v43);
        if ((_DWORD)result)
          goto LABEL_73;
        free(v43);
      }
      v19 = 0;
      while (1)
      {
        v20 = __s1[v19];
        v18[v19] = v20;
        if (!v20)
          break;
        if (++v19 == 99)
        {
          v18[99] = 0;
          break;
        }
      }
      if (v18)
        free(v18);
    }
    if (!__s1[0])
    {
LABEL_42:
      asprintf(&v46, "<af:%u>", p_address->ss_family);
      goto LABEL_64;
    }
  }
  else
  {
    v47[8] = 0;
    *(_QWORD *)v47 = 0;
    __nwlog_salted_hash(p_address, p_address->ss_len, v47);
    snprintf(__s1, 0x64uLL, "sockaddr#%s", v47);
    if (!__s1[0])
      goto LABEL_42;
  }
  v21 = strdup(__s1);
  if (v21)
  {
LABEL_35:
    v46 = v21;
LABEL_64:
    v36 = v46;

    return v36;
  }
  __nwlog_obj();
  v38 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
  *(_DWORD *)v47 = 136446210;
  *(_QWORD *)&v47[4] = "strict_strdup";
  v39 = (void *)_os_log_send_and_compose_impl();

  result = (char *)__nwlog_abort((uint64_t)v39);
  if (!(_DWORD)result)
  {
    free(v39);
    goto LABEL_35;
  }
LABEL_73:
  __break(1u);
  return result;
}

- (unsigned)port
{
  sockaddr_storage *p_address;
  int ss_family;
  NSObject *v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_address = &self->address;
  ss_family = self->address.ss_family;
  if (ss_family == 30 || ss_family == 2)
    return *(_WORD *)self->address.__ss_pad1;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v5 = (id)gLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = p_address->ss_family;
    v7 = 136446466;
    v8 = "-[NWConcrete_nw_address_endpoint port]";
    v9 = 1024;
    v10 = v6;
    _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_INFO, "%{public}s Can't fetch port for address family: %u", (uint8_t *)&v7, 0x12u);
  }

  return 0;
}

- (id)copyDictionary
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_address_endpoint;
  v3 = -[NWConcrete_nw_endpoint copyDictionary](&v6, sel_copyDictionary);
  v4 = v3;
  if (v3)
    xpc_dictionary_set_data(v3, "address", &self->address, self->address.ss_len);
  return v4;
}

- (const)hostname
{
  _QWORD v4[5];

  if ((*((_BYTE *)self + 390) & 1) == 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__NWConcrete_nw_address_endpoint_hostname__block_invoke;
    v4[3] = &unk_1E14ACFD0;
    v4[4] = self;
    nw_endpoint_locked(self, v4);
  }
  return self->hostname;
}

- (id)echConfig
{
  return self->ech_config;
}

- (void)setEchConfig:(id)a3
{
  objc_storeStrong((id *)&self->ech_config, a3);
}

@end
