@implementation LSDBExecutionContext

uint64_t __33__LSDBExecutionContext_syncRead___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  NSObject *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80);
  result = _LSDatabaseIsMutable();
  if (v2)
  {
    if ((_DWORD)result)
    {
      -[_LSDatabase setAccessContext:](*(_QWORD **)(a1 + 40), *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 72));
      _LSDatabaseSetMutable();
    }
    result = (uint64_t)-[_LSDatabase setAccessContext:](*(_QWORD **)(a1 + 40), *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 64));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  }
  else if ((_DWORD)result)
  {
    _LSDatabaseGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __33__LSDBExecutionContext_syncRead___block_invoke_cold_1(v4);

    abort();
  }
  return result;
}

- (os_unfair_lock_s)getPerThreadDatabaseWithError:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;

  v2 = a1;
  if (a1)
  {
    v4 = a1 + 5;
    os_unfair_lock_lock(a1 + 5);
    v5 = -[os_unfair_lock_s _perThreadContextsLock_findPerThreadContextForThisThread](v2, "_perThreadContextsLock_findPerThreadContextForThisThread");
    v2 = *(os_unfair_lock_s **)v5;
    if (*(_QWORD *)v5)
    {
      v6 = v2;
    }
    else if (a2)
    {
      *a2 = objc_retainAutorelease(*(id *)(v5 + 8));
    }
    os_unfair_lock_unlock(v4);
  }
  return v2;
}

- (void)assertActiveForThisThread
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = a1 + 5;
    os_unfair_lock_lock(a1 + 5);
    -[os_unfair_lock_s _perThreadContextsLock_findPerThreadContextForThisThread](a1, "_perThreadContextsLock_findPerThreadContextForThisThread");
    os_unfair_lock_unlock(v2);
  }
}

- (PerThreadContext)_perThreadContextsLock_findPerThreadContextForThisThread
{
  _QWORD *v4;
  void *v6;
  pthread_t v7;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_perThreadContextsLock);
  v7 = pthread_self();
  v4 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>(&self->_perThreadContexts.__table_.__bucket_list_.__ptr_.__value_, &v7);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSServerDBExecutionContext.mm"), 107, CFSTR("Calling %s but didn't have a per thread context!"), "-[LSDBExecutionContext _perThreadContextsLock_findPerThreadContextForThisThread]");

  }
  return (PerThreadContext *)v4[3];
}

- (void)syncRead:(os_unfair_lock_s *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock(a1 + 4);
    os_unfair_lock_lock(a1 + 5);
    v4 = -[os_unfair_lock_s _perThreadContextsLock_createPerThreadContextForThisThread](a1, "_perThreadContextsLock_createPerThreadContextForThisThread");
    v10 = 0;
    LaunchServices::PerThreadContext::getDatabase((id *)v4, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v5)
    {
      v9 = v5;
      _CSStoreAccessContextAccessForRead();

    }
    os_unfair_lock_lock((os_unfair_lock_t)(v4 + 20));

    os_unfair_lock_unlock(a1 + 5);
    os_unfair_lock_unlock(a1 + 4);
    v8 = v3;
    v7 = v6;
    _CSStoreAccessContextAccessForRead();
    LaunchServices::PerThreadContext::releaseDatabase((LaunchServices::PerThreadContext *)v4);
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
    os_unfair_lock_lock(a1 + 5);
    -[os_unfair_lock_s _perThreadContextsLock_destroyPerThreadContextForThisThread](a1, "_perThreadContextsLock_destroyPerThreadContextForThisThread");
    os_unfair_lock_unlock(a1 + 5);

  }
}

- (PerThreadContext)_perThreadContextsLock_createPerThreadContextForThisThread
{
  std::__shared_weak_count *v4;
  _QWORD *v5;
  char v6;
  char v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v12;
  _QWORD *v13;
  std::__shared_weak_count *v14;
  pthread_t v15;
  _QWORD *v16;
  pthread_t *v17;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_perThreadContextsLock);
  v15 = pthread_self();
  v4 = (std::__shared_weak_count *)operator new(0x30uLL);
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E103E030;
  v4->__shared_owners_ = 0;
  v4[1].__shared_owners_ = 0;
  v4[1].__shared_weak_owners_ = 0;
  v4[1].__vftable = 0;
  v13 = &v4[1].__vftable;
  v14 = v4;
  v17 = &v15;
  v16 = &v13;
  v5 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::__emplace_unique_key_args<_opaque_pthread_t *,std::piecewise_construct_t const&,std::tuple<_opaque_pthread_t *&&>,std::tuple<std::shared_ptr<LaunchServices::PerThreadContext>&&>>((uint64_t)&self->_perThreadContexts, &v15, (uint64_t)&std::piecewise_construct, &v17, (uint64_t *)&v16);
  v7 = v6;
  v8 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSServerDBExecutionContext.mm"), 122, CFSTR("calling %s but already had a per thread context!"), "-[LSDBExecutionContext _perThreadContextsLock_createPerThreadContextForThisThread]");

  }
  return (PerThreadContext *)v5[3];
}

- (void)_perThreadContextsLock_destroyPerThreadContextForThisThread
{
  pthread_t v3;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_perThreadContextsLock);
  v3 = pthread_self();
  std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::__erase_unique<_opaque_pthread_t *>(&self->_perThreadContexts.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (id)_init
{
  LSDBExecutionContext *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *maintenanceQueue;
  __CSStoreAccessContext *SharedReadingContext;
  __CSStoreAccessContext *fItem;
  __CSStoreAccessContext *v8;
  __CSStoreAccessContext *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LSDBExecutionContext;
  v2 = -[LSDBExecutionContext init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.LSDBExecutionContext", v3);
    maintenanceQueue = v2->_maintenanceQueue;
    v2->_maintenanceQueue = (OS_dispatch_queue *)v4;

    SharedReadingContext = (__CSStoreAccessContext *)_CSStoreAccessContextCreateSharedReadingContext();
    fItem = v2->_readAccessContext.fItem;
    if (fItem != SharedReadingContext)
    {
      v2->_readAccessContext.fItem = SharedReadingContext;
      SharedReadingContext = fItem;
    }
    if (SharedReadingContext)
      CFRelease(SharedReadingContext);
    v8 = (__CSStoreAccessContext *)_CSStoreAccessContextCreateWithLock();
    v9 = v2->_writeAccessContext.fItem;
    if (v9 != v8)
    {
      v2->_writeAccessContext.fItem = v8;
      v8 = v9;
    }
    if (v8)
      CFRelease(v8);
    v2->_databaseLeftWritable = 0;
  }
  return v2;
}

- (PerThreadContext)_perThreadContextsLock_findPerThreadContextForThisThreadIfExists
{
  PerThreadContext *result;
  pthread_t v4;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_perThreadContextsLock);
  v4 = pthread_self();
  result = (PerThreadContext *)std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>(&self->_perThreadContexts.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
    return (PerThreadContext *)result[1].var0;
  return result;
}

- (void)assertNotActiveForThisThread
{
  os_unfair_lock_s *v2;
  void *v3;

  if (a1)
  {
    v2 = a1 + 5;
    os_unfair_lock_lock(a1 + 5);
    if (-[os_unfair_lock_s _perThreadContextsLock_findPerThreadContextForThisThreadIfExists](a1, "_perThreadContextsLock_findPerThreadContextForThisThreadIfExists"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", sel_assertNotActiveForThisThread, a1, CFSTR("LSServerDBExecutionContext.mm"), 152, CFSTR("Had a context for this thread?"));

    }
    os_unfair_lock_unlock(v2);
  }
}

void __33__LSDBExecutionContext_syncRead___block_invoke_11(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  if (*(_BYTE *)(a1 + 56))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)syncWrite:(uint64_t)a1
{
  void (**v3)(id, uint64_t, _QWORD);
  uint64_t v4;
  uint64_t *i;
  char *v6;
  char *v7;
  os_unfair_lock_s *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char **v17;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v14 = 0;
    v15 = 0;
    v16 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    v4 = objc_msgSend((id)a1, "_perThreadContextsLock_createPerThreadContextForThisThread");
    *(_BYTE *)(v4 + 16) = 1;
    for (i = *(uint64_t **)(a1 + 40); i; i = (uint64_t *)*i)
    {
      if (i[3] != v4)
        std::vector<std::shared_ptr<LaunchServices::PerThreadContext>>::push_back[abi:nn180100](&v14, (__int128 *)(i + 3));
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    v6 = v14;
    v7 = v15;
    while (v6 != v7)
    {
      v8 = *(os_unfair_lock_s **)v6;
      v6 += 16;
      os_unfair_lock_lock(v8 + 5);
      os_unfair_lock_unlock(v8 + 5);
    }
    v9 = (void *)MEMORY[0x186DAE7A0]();
    v13 = 0;
    LaunchServices::PerThreadContext::getDatabase((id *)v4, &v13);
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (v10)
    {
      -[_LSDatabase setAccessContext:](v10, *(CFTypeRef *)(a1 + 72));
      if ((_LSDatabaseIsMutable() & 1) == 0)
        _LSDatabaseSetMutable();
      v3[2](v3, a1, 0);
      *(_BYTE *)(a1 + 80) = 1;

    }
    else
    {
      v12 = *(id *)(v4 + 8);

      v11 = v12;
      ((void (**)(id, uint64_t, id))v3)[2](v3, 0, v12);
    }
    objc_autoreleasePoolPop(v9);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    objc_msgSend((id)a1, "_perThreadContextsLock_destroyPerThreadContextForThisThread");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    v17 = &v14;
    std::vector<std::shared_ptr<LaunchServices::PerThreadContext>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v17);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

  }
}

- (void)beginServerDBBootstrap:(uint64_t)a1
{
  void *v3;
  void (**v4)(void);

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    *(_BYTE *)(objc_msgSend((id)a1, "_perThreadContextsLock_createPerThreadContextForThisThread") + 16) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    v3 = (void *)MEMORY[0x186DAE7A0]();
    v4[2]();
    objc_autoreleasePoolPop(v3);
    *(_BYTE *)(a1 + 80) = 1;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    objc_msgSend((id)a1, "_perThreadContextsLock_destroyPerThreadContextForThisThread");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }

}

- (void)setServerDatabase:(uint64_t)a1
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v4 = a2;
  if (a1)
  {
    v8 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_setServerDatabase_, a1, CFSTR("LSServerDBExecutionContext.mm"), 310, CFSTR("setting nil database"));

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    v5 = objc_msgSend((id)a1, "_perThreadContextsLock_findPerThreadContextForThisThread");
    if (!*(_BYTE *)(v5 + 16))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_setServerDatabase_, a1, CFSTR("LSServerDBExecutionContext.mm"), 314, CFSTR("must be in write context to set new server database"));

    }
    -[_LSDatabase setAccessContext:](v8, *(CFTypeRef *)(a1 + 72));
    if ((_LSDatabaseIsMutable() & 1) == 0)
      _LSDatabaseSetMutable();
    _LSSetLocalDatabase(v8);
    objc_storeStrong((id *)v5, a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    v4 = v8;
  }

}

- (void)performAsyncWrite:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__LSDBExecutionContext_performAsyncWrite___block_invoke;
    v6[3] = &unk_1E10405C0;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __42__LSDBExecutionContext_performAsyncWrite___block_invoke(uint64_t a1)
{
  -[LSDBExecutionContext syncWrite:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)performAsyncRead:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__LSDBExecutionContext_performAsyncRead___block_invoke;
    v6[3] = &unk_1E10405C0;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __41__LSDBExecutionContext_performAsyncRead___block_invoke(uint64_t a1)
{
  -[LSDBExecutionContext syncRead:](*(os_unfair_lock_s **)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)rawWriteAccessContextForDBInit
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (id)maintenanceQueue
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

+ (id)sharedServerInstance
{
  objc_opt_self();
  if (+[LSDBExecutionContext sharedServerInstance]::onceToken != -1)
    dispatch_once(&+[LSDBExecutionContext sharedServerInstance]::onceToken, &__block_literal_global_6);
  return (id)+[LSDBExecutionContext sharedServerInstance]::result;
}

void __44__LSDBExecutionContext_sharedServerInstance__block_invoke()
{
  id v0;
  void *v1;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    v0 = -[LSDBExecutionContext _init]([LSDBExecutionContext alloc], "_init");
    v1 = (void *)+[LSDBExecutionContext sharedServerInstance]::result;
    +[LSDBExecutionContext sharedServerInstance]::result = (uint64_t)v0;

  }
}

- (void).cxx_destruct
{
  __CSStoreAccessContext *fItem;
  __CSStoreAccessContext *v4;

  fItem = self->_writeAccessContext.fItem;
  if (fItem)
    CFRelease(fItem);
  self->_writeAccessContext.fItem = 0;
  v4 = self->_readAccessContext.fItem;
  if (v4)
    CFRelease(v4);
  self->_readAccessContext.fItem = 0;
  std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::~__hash_table((uint64_t)&self->_perThreadContexts);
  objc_storeStrong((id *)&self->_maintenanceQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

void __33__LSDBExecutionContext_syncRead___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "Database was mutable but a note attesting to that was not left for us!", v1, 2u);
}

@end
