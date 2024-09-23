@implementation CAWindowServer

- (unsigned)contextIdHostingContextId:(unsigned int)a3
{
  CA::Render::Context *v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  if (!self->_impl)
    return 0;
  v3 = (CA::Render::Context *)CA::Render::Context::context_by_id(*(CA::Render::Context **)&a3);
  if (!v3)
    return 0;
  v4 = (unsigned int *)v3;
  v5 = (unsigned int *)CA::Render::Context::retain_host_context(v3);
  if (v5)
  {
    v6 = v5[4];
    v7 = v5 + 2;
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
      (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 16))(v5);
  }
  else
  {
    v6 = 0;
  }
  v10 = v4 + 2;
  do
  {
    v11 = __ldaxr(v10);
    v12 = v11 - 1;
  }
  while (__stlxr(v12, v10));
  if (!v12)
    (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
  return v6;
}

- (unsigned)taskNamePortOfContextId:(unsigned int)a3
{
  uint64_t v3;
  unsigned int *v4;
  mach_port_name_t v5;
  mach_port_name_t v6;
  pid_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  mach_port_name_t tn;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_impl)
    return 0;
  v3 = CA::Render::Context::context_by_id(*(CA::Render::Context **)&a3);
  if (!v3)
    return 0;
  v4 = (unsigned int *)v3;
  v5 = *(_DWORD *)(v3 + 252);
  tn = v5;
  if (!v5)
  {
    v6 = *MEMORY[0x1E0C83DA0];
    v7 = getpid();
    task_name_for_pid(v6, v7, &tn);
    v5 = tn;
  }
  v8 = v4 + 2;
  do
  {
    v9 = __ldaxr(v8);
    v10 = v9 - 1;
  }
  while (__stlxr(v10, v8));
  if (!v10)
    (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
  return v5;
}

+ (id)serverIfRunning
{
  return (id)_shared_server;
}

- (NSArray)displays
{
  return (NSArray *)self->_impl->var0;
}

- (CAWindowServer)init
{

  return 0;
}

- (id)_init
{
  CAWindowServer *v2;
  malloc_zone_t *malloc_zone;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAWindowServer;
  v2 = -[CAWindowServer init](&v5, sel_init);
  if (v2)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v2->_impl = (CAWindowServerImpl *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    v2->_impl->var0 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v2->_impl->var1 = 3;
  }
  return v2;
}

- (void)addDisplay:(id)a3
{
  CAWindowServerImpl *impl;
  CFRange v6;

  if (a3)
  {
    v6.length = CFArrayGetCount(self->_impl->var0);
    v6.location = 0;
    if (CFArrayGetFirstIndexOfValue(self->_impl->var0, v6, a3) == -1)
    {
      impl = self->_impl;
      *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a3 + 1) + 64) + 184) = impl->var1;
      CFArrayAppendValue(impl->var0, a3);
    }
  }
}

- (void)removeDisplay:(id)a3
{
  CFIndex FirstIndexOfValue;
  CFIndex v6;
  CFRange v7;

  if (a3)
  {
    v7.length = CFArrayGetCount(self->_impl->var0);
    v7.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(self->_impl->var0, v7, a3);
    if (FirstIndexOfValue != -1)
    {
      v6 = FirstIndexOfValue;
      objc_msgSend(a3, "invalidate");
      CFArrayRemoveValueAtIndex(self->_impl->var0, v6);
    }
  }
}

- (void)removeAllDisplays
{
  CFIndex Count;
  CFRange v4;

  Count = CFArrayGetCount(self->_impl->var0);
  if (Count)
  {
    v4.length = Count;
    v4.location = 0;
    CFArrayApplyFunction(self->_impl->var0, v4, (CFArrayApplierFunction)invalidate_display, 0);
    CFArrayRemoveAllValues(self->_impl->var0);
  }
}

- (id)displayWithName:(id)a3
{
  CAWindowServerImpl *impl;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  impl = self->_impl;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CAWindowServer_displayWithName___block_invoke;
  v5[3] = &unk_1E15A9230;
  v5[4] = a3;
  return (id)find_display(&impl->var0, (uint64_t)v5);
}

- (id)displayWithDisplayId:(unsigned int)a3
{
  CAWindowServerImpl *impl;
  _QWORD v5[4];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CAWindowServer_displayWithDisplayId___block_invoke;
  v5[3] = &__block_descriptor_36_e31_B16__0__CAWindowServerDisplay_8l;
  v6 = a3;
  return (id)find_display(&impl->var0, (uint64_t)v5);
}

- (id)displayWithUniqueId:(id)a3
{
  id result;
  CAWindowServerImpl *impl;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  result = (id)objc_msgSend(a3, "UTF8String");
  if (result)
  {
    impl = self->_impl;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__CAWindowServer_displayWithUniqueId___block_invoke;
    v6[3] = &__block_descriptor_40_e31_B16__0__CAWindowServerDisplay_8l;
    v6[4] = result;
    return (id)find_display(&impl->var0, (uint64_t)v6);
  }
  return result;
}

- (void)_detectDisplays
{
  CAWindowServer *v2;
  uint64_t i;
  CAWindowServer *v4;
  CAWindowServer *v5;
  uint64_t (*v6)(CA::WindowServer::AppleInternalDisplay *__hidden, unint64_t);
  CAWindowServer *v7;
  CFIndex Count;
  CAWindowServer *v9;
  CAWindowServer *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v2 = self;
  for (i = 0; i != 3; ++i)
  {
    self = (CAWindowServer *)((uint64_t (*)(CAWindowServer *, SEL))-[CAWindowServer _detectDisplays]::count_funcs[i])(self, a2);
    if (self)
    {
      v4 = self;
      v5 = 0;
      v6 = -[CAWindowServer _detectDisplays]::open_funcs[i];
      do
      {
        self = (CAWindowServer *)((uint64_t (*)(CAWindowServer *))v6)(v5);
        if (self)
        {
          v7 = self;
          Count = CFArrayGetCount(v2->_impl->var0);
          v9 = (CAWindowServer *)(*((uint64_t (**)(CAWindowServer *))v7->super.isa + 202))(v7);
          if (!v9)
          {
            v13 = 1;
LABEL_12:
            self = (CAWindowServer *)(*((uint64_t (**)(CAWindowServer *))v7->super.isa + v13))(v7);
            goto LABEL_13;
          }
          v10 = v9;
          if (!Count)
            *(_DWORD *)((char *)v9[4].super.isa + 745) |= 0x20u;
          CA::WindowServer::Server::attach_contexts((CA::WindowServer::Server *)v9);
          v11 = -[CAWindowServerDisplay _initWithCADisplayServer:]([CAWindowServerDisplay alloc], "_initWithCADisplayServer:", v10);
          if (!v11)
          {
            (*(void (**)(CAWindowServer *))v10->super.isa)(v10);
            v7 = v10;
            v13 = 15;
            goto LABEL_12;
          }
          v12 = v11;
          -[CAWindowServer addDisplay:](v2, "addDisplay:", v11);

        }
LABEL_13:
        v5 = (CAWindowServer *)((char *)v5 + 1);
      }
      while (v4 != v5);
    }
  }
}

- (void)dealloc
{
  CAWindowServerImpl *impl;
  malloc_zone_t *malloc_zone;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    if (impl->var0)
      CFRelease(impl->var0);
    _Block_release(impl->var2);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, impl);
  }
  v5.receiver = self;
  v5.super_class = (Class)CAWindowServer;
  -[CAWindowServer dealloc](&v5, sel_dealloc);
}

- (void)setRendererFlags:(unsigned int)a3
{
  unsigned int v3;
  CAWindowServerImpl *impl;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;

  v3 = a3 | 3;
  impl = self->_impl;
  if (impl->var1 != (a3 | 3))
  {
    impl->var1 = v3;
    Count = CFArrayGetCount(impl->var0);
    if (Count)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
        *(_DWORD *)(*(_QWORD *)(*((_QWORD *)CFArrayGetValueAtIndex(self->_impl->var0, i) + 1) + 64) + 184) = v3;
    }
  }
}

- (unsigned)rendererFlags
{
  return self->_impl->var1;
}

- (void)setSecure:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *ValueAtIndex;

  v3 = a3;
  NSLog(CFSTR("[CAWindowServer setSecure:] is deprecated! Please call setSecure: on the specific CAWindowServerDisplay!"), a2);
  if (CFArrayGetCount(self->_impl->var0))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(self->_impl->var0, 0);
    CA::WindowServer::Server::set_secure(*(CA::WindowServer::Server **)(ValueAtIndex[1] + 64), v3);
  }
}

- (BOOL)isSecure
{
  NSLog(CFSTR("[CAWindowServer isSecure] is deprecated! Please call isSecure on the specific CAWindowServerDisplay!"), a2);
  return CFArrayGetCount(self->_impl->var0)
      && *(_BYTE *)(*(_QWORD *)(*((_QWORD *)CFArrayGetValueAtIndex(self->_impl->var0, 0) + 1) + 64) + 514);
}

- (id)secureModeViolations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *i;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  pthread_mutex_t *v12;
  unsigned int *v13;
  unsigned int v14;
  pid_t v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  unsigned int *v27;
  unsigned int *v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  unsigned int *v32;
  char *v33;
  uint64_t *v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int *v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int *j;
  _QWORD *k;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _QWORD *m;
  unsigned int *v49;
  unsigned int *v50;
  unsigned int v51;
  unsigned int v52;
  _QWORD *v54;
  id v55;
  unsigned int *v56;
  unsigned int *v57;
  unint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  _QWORD v67[3];
  _QWORD *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock(&CA::Render::Context::secure_mode_violations(void)::violations_lock);
  v59 = 0;
  v60 = 0;
  v61 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Render::Context::_context_lock);
  v2 = 0;
  v3 = CA::Render::Context::_context_table;
  v67[0] = &unk_1E159A4A0;
  v67[1] = &v59;
  v68 = v67;
  v4 = 1 << *(_DWORD *)CA::Render::Context::_context_table;
  do
  {
    for (i = *(_QWORD **)(*(_QWORD *)(v3 + 16) + 8 * v2); i; i = (_QWORD *)*i)
    {
      v6 = i[3];
      v62 = i[2];
      *(_QWORD *)&v63 = v6;
      if (!v68)
      {
        std::__throw_bad_function_call[abi:nn180100]();
LABEL_77:
        abort();
      }
      (*(void (**)(_QWORD *, int *, __int128 *))(*v68 + 48))(v68, &v62, &v63);
    }
    ++v2;
  }
  while (v2 != v4);
  v7 = v68;
  if (v68 == v67)
  {
    v8 = 4;
    v7 = v67;
    goto LABEL_10;
  }
  if (v68)
  {
    v8 = 5;
LABEL_10:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&CA::Render::Context::_context_lock);
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v9 = v59;
  v10 = v60;
  if (v59 == v60)
    goto LABEL_58;
  v54 = v60;
  do
  {
    v11 = *v9;
    v12 = (pthread_mutex_t *)(*v9 + 72);
    pthread_mutex_lock(v12);
    v13 = (unsigned int *)(v11 + 228);
    v14 = atomic_load((unsigned int *)(v11 + 228));
    if (!v14)
    {
      if (*(_DWORD *)(v11 + 252))
        v15 = 0;
      else
        v15 = getpid();
      while (1)
      {
        v16 = __ldaxr(v13);
        if (v16)
          break;
        if (!__stlxr(v15, v13))
        {
          v17 = 1;
          goto LABEL_21;
        }
      }
      v17 = 0;
      __clrex();
LABEL_21:
      if (v17)
        v14 = v15;
      else
        v14 = v16;
    }
    v18 = *(_DWORD *)(v11 + 16);
    v19 = *(_DWORD *)(v11 + 300);
    v20 = *(_DWORD *)(v11 + 304);
    v21 = *(_QWORD *)(v11 + 312);
    v22 = *(_QWORD *)(v11 + 320);
    *(_QWORD *)(v11 + 312) = 0;
    *(_QWORD *)(v11 + 320) = 0;
    *(_QWORD *)&v63 = v21;
    *((_QWORD *)&v63 + 1) = v22;
    v23 = *(_QWORD *)(v11 + 328);
    v24 = *(_QWORD *)(v11 + 336);
    *(_QWORD *)(v11 + 328) = 0;
    *(_QWORD *)(v11 + 336) = 0;
    *(_QWORD *)&v64 = v23;
    *((_QWORD *)&v64 + 1) = v24;
    *(_QWORD *)&v65 = 0;
    v25 = *(_DWORD *)(v11 + 344);
    *(_DWORD *)(v11 + 344) = 1065353216;
    LODWORD(v65) = v25;
    if (v24)
    {
      v26 = *(_QWORD *)(v23 + 8);
      if ((v22 & (v22 - 1)) != 0)
      {
        if (v26 >= v22)
          v26 %= v22;
      }
      else
      {
        v26 &= v22 - 1;
      }
      *(_QWORD *)(v21 + 8 * v26) = &v64;
    }
    v27 = v57;
    if ((unint64_t)v57 < v58)
    {
      *v57 = v14;
      v27[1] = v18;
      v27[2] = v19;
      v27[3] = v20;
      std::__hash_table<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>>>::__hash_table((uint64_t)(v27 + 4), (uint64_t *)&v63);
      v28 = v27 + 14;
      goto LABEL_52;
    }
    v29 = 0x6DB6DB6DB6DB6DB7 * (((char *)v57 - (char *)v56) >> 3) + 1;
    if (v29 > 0x492492492492492)
      goto LABEL_77;
    if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v58 - (_QWORD)v56) >> 3) > v29)
      v29 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v58 - (_QWORD)v56) >> 3);
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v58 - (_QWORD)v56) >> 3)) >= 0x249249249249249)
      v30 = 0x492492492492492;
    else
      v30 = v29;
    if (v30)
    {
      if (v30 > 0x492492492492492)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v31 = (char *)operator new(56 * v30);
    }
    else
    {
      v31 = 0;
    }
    v32 = (unsigned int *)&v31[8 * (((char *)v57 - (char *)v56) >> 3)];
    *v32 = v14;
    v32[1] = v18;
    v33 = &v31[56 * v30];
    v32[2] = v19;
    v32[3] = v20;
    std::__hash_table<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>>>::__hash_table((uint64_t)(v32 + 4), (uint64_t *)&v63);
    v28 = v32 + 14;
    v35 = v56;
    v34 = (uint64_t *)v57;
    if (v57 == v56)
    {
      v56 = v32;
      v57 = v32 + 14;
      v58 = (unint64_t)v33;
LABEL_49:
      v10 = v54;
      goto LABEL_50;
    }
    do
    {
      v36 = *((_DWORD *)v34 - 14);
      v34 -= 7;
      *(v32 - 14) = v36;
      v32 -= 14;
      v32[1] = *((_DWORD *)v34 + 1);
      v32[2] = *((_DWORD *)v34 + 2);
      v32[3] = *((_DWORD *)v34 + 3);
      std::__hash_table<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>>>::__hash_table((uint64_t)(v32 + 4), v34 + 2);
    }
    while (v34 != (uint64_t *)v35);
    v37 = v56;
    v34 = (uint64_t *)v57;
    v56 = v32;
    v57 = v28;
    v58 = (unint64_t)v33;
    if (v34 == (uint64_t *)v37)
      goto LABEL_49;
    v10 = v54;
    do
    {
      std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)(v34 - 5));
      v34 -= 7;
    }
    while (v34 != (uint64_t *)v37);
    v34 = (uint64_t *)v37;
LABEL_50:
    if (v34)
      operator delete(v34);
LABEL_52:
    v57 = v28;
    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&v63);
    pthread_mutex_unlock(v12);
    *(_DWORD *)(v11 + 12) &= ~0x40000u;
    v38 = (unsigned int *)(v11 + 8);
    do
    {
      v39 = __ldaxr(v38);
      v40 = v39 - 1;
    }
    while (__stlxr(v40, v38));
    if (!v40)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
    ++v9;
  }
  while (v9 != v10);
  v9 = v59;
LABEL_58:
  if (v9)
  {
    v60 = v9;
    operator delete(v9);
  }
  os_unfair_lock_unlock(&CA::Render::Context::secure_mode_violations(void)::violations_lock);
  for (j = v56; j != v57; j += 14)
  {
    v66 = 0;
    v63 = *(_OWORD *)j;
    v64 = 0u;
    v65 = 0u;
    LODWORD(v66) = j[12];
    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::__rehash<true>((uint64_t)&v64, *((_QWORD *)j + 3));
    for (k = (_QWORD *)*((_QWORD *)j + 4); k; k = (_QWORD *)*k)
      std::__hash_table<CA::Render::String *,std::hash<CA::Render::String *>,std::equal_to<CA::Render::String *>,std::allocator<CA::Render::String *>>::__emplace_unique_key_args<CA::Render::String *,CA::Render::String * const&>((uint64_t)&v64, k[2], k[2]);
    v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v44 = DWORD1(v63);
    v46 = DWORD2(v63);
    v45 = HIDWORD(v63);
    objc_msgSend(v43, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v63), CFSTR("processId"));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v44), CFSTR("contextId"));
    if ((_DWORD)v46 && (_DWORD)v45)
    {
      objc_msgSend(v43, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v46), CFSTR("hostProcessId"));
      objc_msgSend(v43, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v45), CFSTR("hostContextId"));
    }
    if (*((_QWORD *)&v65 + 1))
    {
      v47 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      for (m = (_QWORD *)v65; m; m = (_QWORD *)*m)
      {
        objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", m[2] + 28, v54));
        v49 = (unsigned int *)m[2];
        v50 = v49 + 2;
        do
        {
          v51 = __ldaxr(v50);
          v52 = v51 - 1;
        }
        while (__stlxr(v52, v50));
        if (!v52)
          (*(void (**)(unsigned int *))(*(_QWORD *)v49 + 16))(v49);
      }
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v47, CFSTR("layerNames"), v54);
    }
    objc_msgSend(v55, "addObject:", v43, v54);

    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&v64);
  }
  *(_QWORD *)&v63 = &v56;
  std::vector<std::tuple<int,unsigned int,int,unsigned int,std::unordered_set<CA::Render::String *>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v63);
  return v55;
}

- (id)insecureProcessIds
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t **i;
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  unsigned int *v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Render::Context::_context_lock);
  v4 = 0;
  v5 = CA::Render::Context::_context_table;
  v6 = 1 << *(_DWORD *)CA::Render::Context::_context_table;
  do
  {
    for (i = *(uint64_t ***)(*(_QWORD *)(v5 + 16) + 8 * v4); i; i = (uint64_t **)*i)
      CA::Render::collect_insecure_process_ids((CA::Render *)i[2], (uint64_t)i[3], (CA::Render::Context *)&v12, v3);
    ++v4;
  }
  while (v4 != v6);
  os_unfair_lock_unlock((os_unfair_lock_t)&CA::Render::Context::_context_lock);
  v8 = v12;
  v9 = v13;
  if (v12 != v13)
  {
    do
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v8, v12);
      if ((objc_msgSend(v2, "containsObject:", v10) & 1) == 0)
        objc_msgSend(v2, "addObject:", v10);
      ++v8;
    }
    while (v8 != v9);
    v8 = v12;
  }
  if (v8)
  {
    v13 = v8;
    operator delete(v8);
  }
  return v2;
}

- (BOOL)isSlotValid:(unsigned int)a3
{
  BOOL v4;

  os_unfair_lock_lock((os_unfair_lock_t)&CA::Render::Context::_context_lock);
  if (CA::Render::Context::_slot_table)
    v4 = x_hash_table_lookup(CA::Render::Context::_slot_table, a3, 0) != 0;
  else
    v4 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&CA::Render::Context::_context_lock);
  return v4;
}

- (void)setSlotDeletionCallback:(id)a3
{
  _Block_release(self->_impl->var2);
  self->_impl->var2 = _Block_copy(a3);
}

- (id)slotDeletionCallback
{
  return self->_impl->var2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CAWindowServer:%p %@>"), self, -[CAWindowServer displays](self, "displays"));
}

- (unsigned)clientPortOfContextId:(unsigned int)a3
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;

  if (!self->_impl)
    return 0;
  v3 = (unsigned int *)CA::Render::Context::context_by_id(*(CA::Render::Context **)&a3);
  if (!v3)
    return 0;
  v4 = v3[65];
  if (!v4)
    v4 = v3[64];
  v5 = v3 + 2;
  do
  {
    v6 = __ldaxr(v5);
    v7 = v6 - 1;
  }
  while (__stlxr(v7, v5));
  if (!v7)
    (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
  return v4;
}

- (BOOL)isMirroringEnabled
{
  return self->_mirroringEnabled;
}

- (void)setMirroringEnabled:(BOOL)a3
{
  self->_mirroringEnabled = a3;
}

BOOL __38__CAWindowServer_displayWithUniqueId___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  _BOOL8 result;
  _OWORD v6[4];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 64) + 96);
  v4 = (*(uint64_t (**)(uint64_t, _QWORD, _OWORD *, uint64_t, uint64_t))(*(_QWORD *)v3 + 800))(v3, 0, v6, 64, 1);
  result = 0;
  if (v4)
    return strcmp(*(const char **)(a1 + 32), (const char *)v6) == 0;
  return result;
}

BOOL __39__CAWindowServer_displayWithDisplayId___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 64) + 96) + 24) == *(_DWORD *)(a1 + 32);
}

uint64_t __34__CAWindowServer_displayWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 64) + 104));
}

+ (id)context
{
  return (id)objc_msgSend(a1, "contextWithOptions:", 0);
}

+ (id)contextWithOptions:(id)a3
{
  id result;

  if (_shared_server)
    return +[CAContext localContextWithOptions:](CAContext, "localContextWithOptions:", a3);
  result = +[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", a3);
  if (!result)
  {
    if (!_shared_server)
      +[CAWindowServer server](CAWindowServer, "server");
    return +[CAContext localContextWithOptions:](CAContext, "localContextWithOptions:", a3);
  }
  return result;
}

+ (id)server
{
  return (id)objc_msgSend(a1, "serverWithOptions:", 0);
}

+ (id)serverWithOptions:(id)a3
{
  id result;

  result = (id)_shared_server;
  if (!_shared_server)
  {
    if (+[CAWindowServer serverWithOptions:]::once[0] != -1)
      dispatch_once_f(+[CAWindowServer serverWithOptions:]::once, a3, (dispatch_function_t)shared_server_init);
    return (id)_shared_server;
  }
  return result;
}

+ (void)stopServer
{

  _shared_server = 0;
}

@end
