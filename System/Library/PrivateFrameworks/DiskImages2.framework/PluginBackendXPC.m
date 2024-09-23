@implementation PluginBackendXPC

- (PluginBackendXPC)initWithURL:(id)a3 openMode:(int)a4
{
  id v7;
  PluginBackendXPC *v8;
  id v9;
  char *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  _QWORD *exception;
  const std::error_category *v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  char *v29;
  objc_super v30;
  unsigned int v31;

  v7 = a3;
  v31 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PluginBackendXPC;
  v8 = -[PluginBackendXPC init](&v30, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "pluginName");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (char *)objc_msgSend(v9, "UTF8String");

    v29 = v10;
    if (!v10)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      *exception = &off_24CF07908;
      v23 = std::generic_category();
      exception[1] = 22;
      exception[2] = v23;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Invalid plugin URL, plugin name is missing";
    }
    objc_msgSend(v7, "pluginParams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v11;
    std::allocate_shared[abi:ne180100]<plugin_header,std::allocator<plugin_header>,char const*&,__CFDictionary const*,int &,void>(&v29, (uint64_t *)&v26, &v31, &v27);

    std::allocate_shared[abi:ne180100]<BackendPlugin,std::allocator<BackendPlugin>,std::shared_ptr<plugin_header> &,void>(&v27, &v24);
    v25 = v24;
    v24 = 0uLL;
    -[BackendXPC setBackend:](v8, "setBackend:", &v25, 0);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
    if (*((_QWORD *)&v25 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    objc_storeStrong((id *)&v8->_URL, a3);
    v18 = v28;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  return v8;
}

- (PluginBackendXPC)initWithCoder:(id)a3
{
  id v4;
  PluginBackendXPC *v5;
  uint64_t v6;
  DIURL *URL;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  __int128 v25;
  __int128 v26;
  void *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  __int128 v32;
  void (__cdecl *v33)(void *);
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PluginBackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (DIURL *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("encodedDict"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = xmmword_24CEEEEB0;
    v33 = plugin_release_buffer;
    -[DIURL pluginName](v5->_URL, "pluginName");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = 0;
    v29 = (char *)objc_msgSend(v14, "UTF8String");
    v27 = v13;
    std::allocate_shared[abi:ne180100]<plugin_header,std::allocator<plugin_header>,char const*,decltype(nullptr),std::nullopt_t const&,diskimage_decode_fn_t &,void *,void>(&v29, (uint64_t)&v28, (uint64_t)&std::nullopt, (uint64_t)&v32, &v27, &v30);

    std::allocate_shared[abi:ne180100]<BackendPlugin,std::allocator<BackendPlugin>,std::shared_ptr<plugin_header> &,void>(&v30, &v25);
    v26 = v25;
    v25 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v26);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
    if (*((_QWORD *)&v25 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = v31;
    if (v31)
    {
      p_shared_owners = (unint64_t *)&v31->__shared_owners_;
      do
        v23 = __ldaxr(p_shared_owners);
      while (__stlxr(v23 - 1, p_shared_owners));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PluginBackendXPC;
  -[BackendXPC encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[PluginBackendXPC URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)-[PluginBackendXPC pluginHeader](self, "pluginHeader") + 64))();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("encodedDict"));

}

- (const)pluginHeader
{
  const void *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[BackendXPC backend](self, "backend");
  v2 = *(const void **)(v6 + 24);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
