@implementation NWConcrete_nw_url_endpoint

- (void)dealloc
{
  __CFURL *url_ref;
  char *url;
  char *scheme;
  char *hostname;
  char *path;
  char *sanitized_url;
  objc_super v9;

  url_ref = self->url_ref;
  if (url_ref)
  {
    CFRelease(url_ref);
    self->url_ref = 0;
  }
  url = self->url;
  if (url)
  {
    free(url);
    self->url = 0;
  }
  scheme = self->scheme;
  if (scheme)
  {
    free(scheme);
    self->scheme = 0;
  }
  hostname = self->hostname;
  if (hostname)
  {
    free(hostname);
    self->hostname = 0;
  }
  path = self->path;
  if (path)
  {
    free(path);
    self->path = 0;
  }
  sanitized_url = self->sanitized_url;
  if (sanitized_url)
  {
    free(sanitized_url);
    self->sanitized_url = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_url_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v9, sel_dealloc);
}

- (id)copyEndpoint
{
  NWConcrete_nw_url_endpoint *v3;
  NWConcrete_nw_url_endpoint *v4;
  NWConcrete_nw_url_endpoint *v5;
  _QWORD v7[4];
  NWConcrete_nw_url_endpoint *v8;
  NWConcrete_nw_url_endpoint *v9;

  v3 = objc_alloc_init(NWConcrete_nw_url_endpoint);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__NWConcrete_nw_url_endpoint_copyEndpoint__block_invoke;
  v7[3] = &unk_1E14ACE68;
  v4 = v3;
  v8 = v4;
  v9 = self;
  nw_synchronize(&self->lock, (uint64_t)v7);
  v5 = v4;

  return v5;
}

- (unsigned)type
{
  return 4;
}

- (BOOL)initWithURL:(void *)a1
{
  _DWORD *v3;
  id v4;
  const __CFURL *v5;
  CFIndex v6;
  _BOOL8 v7;
  CFRange v8;
  uint64_t v9;
  char *v10;
  CFRange v11;
  CFIndex location;
  CFIndex length;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  char *v17;
  char *v18;
  NSObject *v19;
  void *v20;
  _BOOL8 result;
  char *v22;
  SInt32 v23;
  const char *v24;
  void *v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  char *backtrace_string;
  os_log_type_t v34;
  _BOOL4 v35;
  char *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  os_log_type_t v45;
  os_log_type_t v46;
  char v47;
  os_log_type_t type;
  objc_super v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v49.receiver = a1;
  v49.super_class = (Class)NWConcrete_nw_url_endpoint;
  v3 = objc_msgSendSuper2(&v49, sel_init);
  v4 = v3;
  if (!v3)
  {
    __nwlog_obj();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
    v26 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v47 = 0;
    if (__nwlog_fault(v26, &type, &v47))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_182FBE000, v27, v28, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v47)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v34 = type;
        v35 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v35)
          {
            *(_DWORD *)buf = 136446466;
            v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
            v52 = 2082;
            v53 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v27, v34, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_74;
        }
        if (v35)
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_182FBE000, v27, v34, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v45 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_182FBE000, v27, v45, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_74:
    if (v26)
      free(v26);
    return 0;
  }
  if (!a2)
  {
    __nwlog_obj();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
    v30 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v47 = 0;
    if (__nwlog_fault(v30, &type, &v47))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_182FBE000, v31, v32, "%{public}s called with null _url", buf, 0xCu);
        }
      }
      else if (v47)
      {
        v36 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v31 = objc_claimAutoreleasedReturnValue();
        v37 = type;
        v38 = os_log_type_enabled(v31, type);
        if (v36)
        {
          if (v38)
          {
            *(_DWORD *)buf = 136446466;
            v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
            v52 = 2082;
            v53 = v36;
            _os_log_impl(&dword_182FBE000, v31, v37, "%{public}s called with null _url, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v36);
          goto LABEL_79;
        }
        if (v38)
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_182FBE000, v31, v37, "%{public}s called with null _url, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v31 = objc_claimAutoreleasedReturnValue();
        v46 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_182FBE000, v31, v46, "%{public}s called with null _url, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_79:
    if (v30)
      free(v30);

    return 0;
  }
  v3[75] = 0;
  v5 = CFURLCopyAbsoluteURL(a2);
  *((_QWORD *)v4 + 29) = v5;
  if (!v5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (char *)*((_QWORD *)v4 + 31);
      *(_DWORD *)buf = 136446467;
      v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
      v52 = 2085;
      v53 = v17;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s failed to create url from %{sensitive}s", buf, 0x16u);
    }
    goto LABEL_24;
  }
  v6 = CFURLGetBytes(v5, 0, 0);
  v7 = nw_calloc_type<unsigned char>(v6 + 1);
  *((_QWORD *)v4 + 31) = v7;
  CFURLGetBytes(a2, (UInt8 *)v7, v6);
  v8 = CFURLGetByteRangeForComponent((CFURLRef)*((_QWORD *)v4 + 29), kCFURLComponentScheme, 0);
  if (v8.location == -1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = (char *)*((_QWORD *)v4 + 31);
      *(_DWORD *)buf = 136446467;
      v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
      v52 = 2085;
      v53 = v18;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s failed to get scheme from %{sensitive}s", buf, 0x16u);
    }
LABEL_24:

    return 0;
  }
  v9 = *((_QWORD *)v4 + 31);
  if (!v9)
  {
    __nwlog_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    v51 = "strict_strndup";
    v40 = (void *)_os_log_send_and_compose_impl();

    result = __nwlog_abort((uint64_t)v40);
    if (result)
      goto LABEL_82;
    free(v40);
  }
  v10 = strndup((const char *)(v9 + v8.location), v8.length);
  if (!v10)
  {
    __nwlog_obj();
    v41 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    v51 = "strict_strndup";
    v42 = (void *)_os_log_send_and_compose_impl();

    result = __nwlog_abort((uint64_t)v42);
    if (result)
      goto LABEL_82;
    free(v42);
    *((_QWORD *)v4 + 32) = 0;

    return 0;
  }
  *((_QWORD *)v4 + 32) = v10;
  v11 = CFURLGetByteRangeForComponent((CFURLRef)*((_QWORD *)v4 + 29), kCFURLComponentHost, 0);
  if (v11.location == -1)
    location = 0;
  else
    location = v11.location;
  if (v11.location == -1)
    length = 0;
  else
    length = v11.length;
  v14 = *((_QWORD *)v4 + 31);
  v15 = (const char *)(v14 + location);
  if (length <= 1)
  {
    if (!v14)
    {
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446210;
      v51 = "strict_strndup";
      v20 = (void *)_os_log_send_and_compose_impl();

      result = __nwlog_abort((uint64_t)v20);
      if (result)
        goto LABEL_82;
      free(v20);
    }
  }
  else
  {
    if (*v15 == 91)
    {
      if (*(_BYTE *)(length + location + v14 - 1) == 93)
      {
        ++location;
        length -= 2;
      }
      else
      {
        length = v11.length;
      }
    }
    else
    {
      length = v11.length;
    }
    v15 = (const char *)(v14 + location);
  }
  v22 = strndup(v15, length);
  if (v22)
  {
    *((_QWORD *)v4 + 33) = v22;
    *((_BYTE *)v4 + 297) &= ~1u;
    v23 = CFURLGetPortNumber(*((CFURLRef *)v4 + 29));
    if (v23 == -1)
    {
      v24 = (const char *)*((_QWORD *)v4 + 32);
      if (v24)
      {
        if (nw_utilities_port_for_string(v24, (_WORD *)v4 + 120))
          *((_BYTE *)v4 + 297) |= 1u;
        else
          *((_WORD *)v4 + 120) = 0;
      }
    }
    else
    {
      *((_WORD *)v4 + 120) = bswap32(v23) >> 16;
    }
    return (BOOL)v4;
  }
  __nwlog_obj();
  v43 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v51 = "strict_strndup";
  v44 = (void *)_os_log_send_and_compose_impl();

  result = __nwlog_abort((uint64_t)v44);
  if (!result)
  {
    free(v44);
    *((_QWORD *)v4 + 33) = 0;

    return 0;
  }
LABEL_82:
  __break(1u);
  return result;
}

- (const)hostname
{
  return self->hostname;
}

- (unsigned)port
{
  return self->port;
}

- (id)copyDictionary
{
  id v3;
  void *v4;
  char *url;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NWConcrete_nw_url_endpoint;
  v3 = -[NWConcrete_nw_endpoint copyDictionary](&v8, sel_copyDictionary);
  v4 = v3;
  if (v3)
  {
    url = self->url;
    if (url)
      xpc_dictionary_set_string(v3, "url", url);
    v6 = v4;
  }

  return v4;
}

- (char)createDescription:(BOOL)a3
{
  char *url;
  size_t v5;
  NWConcrete_nw_url_endpoint *v6;
  char *v7;
  const char *v8;
  const char *v9;
  char *v10;
  char *v12;
  char v13;
  char __str[13];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  url = self->url;
  if (a3)
  {
    v13 = 0;
    v12 = 0;
    v5 = strlen(url);
    __nwlog_salted_hash(url, v5, (char *)&v12);
    url = __str;
    snprintf(__str, 0xDuLL, "%s%s", "URL#", (const char *)&v12);
  }
  v6 = self;
  v7 = v6->super.interface;

  v8 = v7 + 104;
  v9 = "@";
  v12 = 0;
  if (!v7)
  {
    v9 = "";
    v8 = "";
  }
  asprintf(&v12, "%s%s%s", url, v9, v8);
  v10 = v12;

  return v10;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4;
  CFTypeRef *v6;
  BOOL v7;
  objc_super v9;

  v4 = a4;
  v6 = (CFTypeRef *)a3;
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_url_endpoint;
  v7 = -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v9, sel_isEqualToEndpoint_matchFlags_, v6, v4)
    && CFEqual(v6[29], self->url_ref) != 0;

  return v7;
}

- (unint64_t)getHash
{
  char *url;
  CC_LONG v4;
  int8x16_t v5;
  CC_SHA256_CTX v7;
  unsigned __int8 md[16];
  int8x16_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  url = self->url;
  v4 = strlen(url);
  CC_SHA256_Update(&v7, url, v4);
  CC_SHA256_Final(md, &v7);
  v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

@end
