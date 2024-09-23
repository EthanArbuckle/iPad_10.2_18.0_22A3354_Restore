@implementation LSRecord

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{

}

- (id)_resolvedPropertyValueForGetter:(SEL)a3 nullPlaceholder:(id)a4
{
  objc_selector *v7;
  _QWORD *CachedPropertyValue;
  char v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;

  os_unfair_recursive_lock_lock_with_options();
  CachedPropertyValue = LaunchServices::Record::getCachedPropertyValue((LaunchServices::Record *)self, (LSRecord *)a3, v7);
  if (v9)
  {
    v10 = CachedPropertyValue;
    v11 = CachedPropertyValue;
    if (!v10)
      v11 = a4;
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v12;
}

- (id)_resolvedPropertyValueForGetter:(SEL)a3
{
  return -[LSRecord _resolvedPropertyValueForGetter:nullPlaceholder:](self, "_resolvedPropertyValueForGetter:nullPlaceholder:", a3, 0);
}

- (void)_resolveAllProperties
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  float *resolvedProperties;
  float v7;
  NSObject *v8;
  void *v9;
  char *v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  SEL v16;
  void (*v17)(LSRecord *, SEL);
  const char *Name;
  int v19;
  LSRecord *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_context.db)
  {
    v3 = -[LSRecord _resolvingMethods](self, "_resolvingMethods");
    v4 = v3[1];
    v5 = v4 - *v3;
    if (v4 != *v3)
    {
      resolvedProperties = (float *)self->_resolvedProperties;
      if (resolvedProperties)
      {
        v7 = resolvedProperties[8];
      }
      else
      {
        resolvedProperties = (float *)operator new();
        *(_OWORD *)resolvedProperties = 0u;
        *((_OWORD *)resolvedProperties + 1) = 0u;
        resolvedProperties[8] = 1.0;
        self->_resolvedProperties = resolvedProperties;
        v7 = 1.0;
      }
      std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>((uint64_t)resolvedProperties, vcvtps_u32_f32((float)(unint64_t)((v5 >> 4) + 1) / v7));
    }
    v9 = (void *)MEMORY[0x186DAE7A0]();
    v10 = (char *)malloc_type_malloc(0x100uLL, 0xB6014977uLL);
    strlcpy(v10, "LSRecord: resolving ", 0x100uLL);
    v11 = strlen(v10);
    qword_1ECD29C28 = (uint64_t)v10;
    v12 = *v3;
    v13 = v3[1];
    if (*v3 != v13)
    {
      v14 = &v10[v11];
      v15 = 256 - v11;
      do
      {
        v16 = *(SEL *)v12;
        v17 = *(void (**)(LSRecord *, SEL))(v12 + 8);
        Name = sel_getName(*(SEL *)v12);
        strlcpy(v14, Name, v15);
        v17(self, v16);
        v12 += 16;
      }
      while (v12 != v13);
    }
    qword_1ECD29C28 = 0;
    free(v10);
    objc_autoreleasePoolPop(v9);
    -[LSRecord persistentIdentifier](self, "persistentIdentifier");

  }
  else if ((*((_BYTE *)self + 31) & 0x40) == 0)
  {
    _LSRecordLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138477827;
      v20 = self;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEBUG, "Record %{private}@ may be incomplete during encoding.", (uint8_t *)&v19, 0xCu);
    }

  }
  os_unfair_recursive_lock_unlock();
}

- (void)detach
{
  LSContext *p_context;
  LSRecord *v5;
  LSRecord *v6;
  _LSDatabase *db;
  LSRecord *v8;
  uint64_t Unit;
  uint64_t v10;
  uint64_t unitID;
  _LSDatabase *v12;
  NSObject *v13;
  uint8_t v14[16];

  if (*((char *)self + 31) < 0)
  {
    _LSRecordLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_ERROR, "Attempting to detach a shared record. Please file a bug report.", v14, 2u);
    }

  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    p_context = &self->_context;
    if (self->_context.db)
    {
      v5 = self;
      v6 = v5;
      db = self->_context.db;
      if ((*((_BYTE *)self + 31) & 0x40) == 0 && !db)
        __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v5, a2);
      if (db)
      {
        v8 = v5;
        Unit = CSStoreGetUnit();
        v10 = *((unsigned __int16 *)v8 + 14);
        unitID = v8->_unitID;
        -[LSRecord persistentIdentifier](v8, "persistentIdentifier");

        -[LSRecord _detachFromContext:tableID:unitID:unitBytes:](v8, "_detachFromContext:tableID:unitID:unitBytes:", p_context, v10, unitID, Unit);
      }

      v12 = p_context->db;
      p_context->db = 0;

    }
    os_unfair_recursive_lock_unlock();
  }
}

- (NSData)persistentIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)sel_persistentIdentifier, sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  _QWORD v7[3];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, sizeof(v7));
  v8 = 0;
  _LSPersistentIdentifierDataMake((uint64_t *)a3, a4, a5, (uint64_t)v7);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, 28);
}

- (void)dealloc
{
  void *resolvedProperties;
  uint64_t v4;
  objc_super v5;

  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties)
  {
    v4 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)resolvedProperties);
    MEMORY[0x186DADEF4](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)LSRecord;
  -[LSRecord dealloc](&v5, sel_dealloc);
}

- (const)_resolvingMethods
{
  void *Superclass;
  uint64_t v5;
  char *v6;
  Method *v7;
  unint64_t v8;
  objc_method *v9;
  const char *Name;
  const char *v11;
  IMP Implementation;
  IMP v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  const char **v22;
  char *v23;
  char *v24;
  const char **v25;
  char v26;
  void *v28;
  const char *sel;
  void *v30;
  unsigned int outCount[2];
  void *__p;
  char *v33;
  char *v34;

  Superclass = (void *)objc_opt_class();
  os_unfair_recursive_lock_lock_with_options();
  v5 = -[LSRecord(Private) _resolvingMethods]::resultsByClass;
  if (!-[LSRecord(Private) _resolvingMethods]::resultsByClass)
  {
    v5 = operator new();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_DWORD *)(v5 + 32) = 1065353216;
    -[LSRecord(Private) _resolvingMethods]::resultsByClass = v5;
  }
  __p = Superclass;
  v6 = (char *)std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>((_QWORD *)v5, &__p);
  if (!v6)
  {
    sel = a2;
    __p = 0;
    v33 = 0;
    v34 = 0;
    v30 = Superclass;
    while (Superclass && Superclass != (void *)LaunchServices::Record::recordClass)
    {
      outCount[0] = 0;
      v7 = class_copyMethodList((Class)Superclass, outCount);
      if (v7)
      {
        if (outCount[0])
        {
          v8 = 0;
          do
          {
            v9 = v7[v8];
            Name = method_getName(v9);
            v11 = sel_getName(Name);
            if (!strncmp("_LSRecord_resolve_", v11, 0x12uLL))
            {
              Implementation = method_getImplementation(v9);
              v13 = Implementation;
              v14 = v33;
              if (v33 >= v34)
              {
                v16 = (v33 - (_BYTE *)__p) >> 4;
                v17 = v16 + 1;
                if ((unint64_t)(v16 + 1) >> 60)
                  abort();
                v18 = v34 - (_BYTE *)__p;
                if ((v34 - (_BYTE *)__p) >> 3 > v17)
                  v17 = v18 >> 3;
                if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
                  v19 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v19 = v17;
                v20 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>((uint64_t)&v34, v19);
                v22 = (const char **)&v20[16 * v16];
                *v22 = Name;
                v22[1] = (const char *)v13;
                v24 = (char *)__p;
                v23 = v33;
                v25 = v22;
                if (v33 != __p)
                {
                  do
                  {
                    *((_OWORD *)v25 - 1) = *((_OWORD *)v23 - 1);
                    v25 -= 2;
                    v23 -= 16;
                  }
                  while (v23 != v24);
                  v23 = (char *)__p;
                }
                v15 = (char *)(v22 + 2);
                __p = v25;
                v33 = (char *)(v22 + 2);
                v34 = &v20[16 * v21];
                if (v23)
                  operator delete(v23);
              }
              else
              {
                *(_QWORD *)v33 = Name;
                *((_QWORD *)v14 + 1) = Implementation;
                v15 = v14 + 16;
              }
              v33 = v15;
            }
            ++v8;
          }
          while (v8 < outCount[0]);
        }
        free(v7);
      }
      Superclass = class_getSuperclass((Class)Superclass);
    }
    std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>::shrink_to_fit((uint64_t)&__p);
    *(_QWORD *)outCount = v30;
    v6 = std::__hash_table<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>>>::__emplace_unique_key_args<void const*,void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>(-[LSRecord(Private) _resolvingMethods]::resultsByClass, outCount, outCount, (uint64_t)&__p);
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel, self, CFSTR("LSRecord.mm"), 1463, CFSTR("did not insert when filling cache for %@ in %s?"), v30, sel_getName(sel));

    }
    if (__p)
    {
      v33 = (char *)__p;
      operator delete(__p);
    }
  }
  os_unfair_recursive_lock_unlock();
  return v6 + 24;
}

- (id)_initWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5
{
  __int16 v6;
  LSRecord *v8;
  LSRecord *v9;
  _LSDatabase *db;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LSRecord;
  v8 = -[LSRecord init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3)
      db = a3->db;
    else
      db = 0;
    objc_storeStrong((id *)&v8->_context.db, db);
    *((_WORD *)v9 + 14) = v6;
    v9->_unitID = a5;
    *((_BYTE *)v9 + 31) &= 0x3Fu;
    *((_WORD *)v9 + 15) = *((_WORD *)v9 + 15) & 0xC000 | 1;
  }
  return v9;
}

- (id)compatibilityObject
{
  LSRecord *v3;
  LSRecord *v4;
  LSRecord *v5;
  _LSDatabase *db;
  LSContext *p_context;
  LSRecord *v8;
  uint64_t Unit;
  int v10;
  unsigned int unitID;
  id v12;
  id v14;
  LSRecord *v15;
  _QWORD v16[8];
  int v17;
  unsigned int v18;

  v14 = 0;
  v15 = self;
  v3 = self;
  os_unfair_recursive_lock_lock_with_options();
  v4 = v3;
  v5 = v4;
  p_context = &v4->_context;
  db = v4->_context.db;
  if ((*((_BYTE *)v4 + 31) & 0x40) == 0 && !db)
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v4, a2);
  if (db)
  {
    v8 = v4;
    Unit = CSStoreGetUnit();
    v10 = *((unsigned __int16 *)v8 + 14);
    unitID = v8->_unitID;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___ZZ31__LSRecord_compatibilityObject_ENK3__0clEP9LSContextjjPKv_block_invoke;
    v16[3] = &__block_descriptor_72_e5_v8__0ls32l8s40l8;
    v16[4] = &v14;
    v16[5] = &v15;
    v17 = v10;
    v18 = unitID;
    v16[6] = p_context;
    v16[7] = Unit;
    __LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__((uint64_t)v16);

  }
  os_unfair_recursive_lock_unlock();

  v12 = v14;
  return v12;
}

- (void)_performBlockWithContext:(id)a3
{
  LSRecord *v4;
  LSRecord *v5;
  _LSDatabase *db;
  LSContext *p_context;
  LSRecord *v8;
  uint64_t Unit;
  LSRecord *v10;

  v4 = self;
  os_unfair_recursive_lock_lock_with_options();
  v5 = v4;
  p_context = &v5->_context;
  db = v5->_context.db;
  v10 = v5;
  if ((*((_BYTE *)v5 + 31) & 0x40) == 0 && !db)
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v5, 0);
  if (db)
  {
    v8 = v5;
    Unit = CSStoreGetUnit();
    (*((void (**)(id, LSContext *, _QWORD, _QWORD, uint64_t))a3 + 2))(a3, p_context, *((unsigned __int16 *)v8 + 14), v8->_unitID, Unit);

  }
  os_unfair_recursive_lock_unlock();

}

- (LSRecord)initWithPersistentIdentifier:(id)a3
{
  _LSDServiceDomain *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _LSDServiceDomain *v9;
  uint64_t v10;
  id v11;
  LSRecord *v12;
  id v13;
  id v14;
  void **CurrentContext;
  id v17;
  char v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  v17 = 0;
  v18 = 0;
  v19 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v6 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v5, 0);

  if (v6)
  {
    v7 = -[LSRecord _initWithContext:persistentIdentifier:](self, "_initWithContext:persistentIdentifier:", v6, a3);
  }
  else
  {
    _LSRecordLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0);

      if (v10)
        v11 = 0;
      else
        v11 = v19;
      *(_DWORD *)buf = 138412546;
      v21 = a3;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEBUG, "Failed to initialize record with persistent identifier %@ because the current database was not reachable. Error %@", buf, 0x16u);

    }
    v7 = 0;
  }
  v12 = (LSRecord *)v7;
  if (CurrentContext && v18)
    _LSContextDestroy(CurrentContext);
  v13 = v17;
  CurrentContext = 0;
  v17 = 0;

  v18 = 0;
  v14 = v19;
  v19 = 0;

  return v12;
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifier:(id)a4
{
  unsigned __int8 *v7;
  id v8;
  NSObject *v9;
  id v10;
  objc_class *SubclassForTable;
  LSRecord *v12;
  NSObject *v13;
  void *v14;
  id v16;
  _BYTE uu1[22];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v7 = _LSCheckRecordPISizeAndVersionReturningPIInnerBytes(a4, &v16);
  v8 = v16;
  if (!v7)
  {
    _LSRecordLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uu1 = 138412546;
      *(_QWORD *)&uu1[4] = a4;
      *(_WORD *)&uu1[12] = 2112;
      *(_QWORD *)&uu1[14] = v8;
      _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEBUG, "failed to initialize record with persistent identifier %@: %@", uu1, 0x16u);
    }
    goto LABEL_8;
  }
  *(_QWORD *)uu1 = 0;
  *(_QWORD *)&uu1[8] = 0;
  _LSDatabaseGetCacheGUIDBytes((uint64_t)a3->db, uu1);
  if (uuid_compare(uu1, v7 + 12))
  {
    _LSRecordLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a4;
      _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEBUG, "Failed to initialize record with persistent identifier %@ because it came from a different database.", buf, 0xCu);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_17;
  }
  if (-[LSRecord isMemberOfClass:](self, "isMemberOfClass:", LaunchServices::Record::recordClass))
  {
    SubclassForTable = (objc_class *)LaunchServices::Record::findSubclassForTable((LaunchServices::Record *)a3, (LSContext *)*((unsigned int *)v7 + 2));
    if (SubclassForTable)
    {
      v12 = (LSRecord *)[SubclassForTable alloc];
    }
    else
    {
      _LSRecordLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)*((unsigned int *)v7 + 2);
        *(_DWORD *)buf = 134217984;
        v19 = v14;
        _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_ERROR, "Unexpected table ID 0x%llx when instantiating an LSRecord from a persistent identifier.", buf, 0xCu);
      }

      v12 = 0;
    }

    self = v12;
  }
  v10 = -[LSRecord _initWithContext:persistentIdentifierData:length:](self, "_initWithContext:persistentIdentifierData:length:", a3, v7, objc_msgSend(a4, "length"));
LABEL_17:

  return v10;
}

- (void)_ifAttached:(id)a3 else:(id)a4
{
  LSRecord *v7;
  uint64_t Unit;

  os_unfair_recursive_lock_lock_with_options();
  if (self->_context.db)
  {
    v7 = self;
    Unit = CSStoreGetUnit();
    (*((void (**)(id, LSContext *, _QWORD, _QWORD, uint64_t))a3 + 2))(a3, &self->_context, *((unsigned __int16 *)v7 + 14), v7->_unitID, Unit);

    os_unfair_recursive_lock_unlock();
  }
  else
  {
    os_unfair_recursive_lock_unlock();
    if (a4)
      (*((void (**)(id))a4 + 2))(a4);
  }
}

_QWORD *__26__LSRecord_initWithCoder___block_invoke(uint64_t a1, NSString *aSelectorName, void *a3)
{
  uint64_t v3;
  SEL v5;
  id v6;

  v6 = a3;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(void **)(a1 + 32) == a3)
  {
    v5 = NSSelectorFromString(aSelectorName);
    return std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *,decltype(nullptr)>(v3, &v5, &v5);
  }
  else
  {
    v5 = NSSelectorFromString(aSelectorName);
    return std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *&,objc_object * const {__strong}&>(v3, &v5, &v5, &v6);
  }
}

- (LSRecord)initWithCoder:(id)a3
{
  LSRecord *v4;
  LSRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  LaunchServices::Record *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  LSRecord *v20;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)LSRecord;
  v4 = -[LSRecord init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    -[LSRecord _propertyClassesForCoding](v4, "_propertyClassesForCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", objc_opt_class(), v6, CFSTR("resolvedProperties"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (LaunchServices::Record *)objc_msgSend(v7, "count");
      v10 = (unint64_t)v9;
      if (v9)
      {
        LaunchServices::Record::getNullPlaceholder(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = operator new();
        *(_OWORD *)v12 = 0u;
        *(_OWORD *)(v12 + 16) = 0u;
        *(_DWORD *)(v12 + 32) = 1065353216;
        v5->_resolvedProperties = (void *)v12;
        std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>(v12, (unint64_t)(float)v10);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __26__LSRecord_initWithCoder___block_invoke;
        v18[3] = &unk_1E1044E78;
        v13 = v11;
        v19 = v13;
        v20 = v5;
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v18);

      }
      *((_WORD *)v5 + 14) = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("tableID"));
      v5->_unitID = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("unitID"));
      if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("intentionallyInvalid")))
        v14 = 64;
      else
        v14 = 0;
      *((_BYTE *)v5 + 31) = v14 & 0xC0 | *((_BYTE *)v5 + 31) & 0x3F;
      *((_WORD *)v5 + 15) = *((_WORD *)v5 + 15) & 0xC000 | 1;
    }
    else
    {
      v22 = *MEMORY[0x1E0CB2938];
      v23[0] = CFSTR("Could not decode the set of resolved property values for this record.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4865, (uint64_t)"-[LSRecord initWithCoder:]", 580, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "failWithError:", v16);

      v5 = 0;
    }

  }
  return v5;
}

- (id)_propertyClassesForCoding
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  id v14;

  v14 = 0;
  v2 = objc_opt_class();
  os_unfair_recursive_lock_lock_with_options();
  v3 = -[LSRecord(Private) _propertyClassesForCoding]::resultsByClass;
  if (!-[LSRecord(Private) _propertyClassesForCoding]::resultsByClass)
  {
    v3 = operator new();
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_DWORD *)(v3 + 32) = 1065353216;
    -[LSRecord(Private) _propertyClassesForCoding]::resultsByClass = v3;
  }
  v13 = v2;
  v4 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>((_QWORD *)v3, &v13);
  if (v4)
  {
    v14 = (id)v4[3];
  }
  else
  {
    v5 = (void *)MEMORY[0x186DAE7A0]();
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    XNSGetPropertyListClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v7);

    objc_msgSend(v6, "addObject:", objc_opt_class());
    for (i = (objc_class *)v2; i && i != (objc_class *)LaunchServices::Record::recordClass; i = class_getSuperclass(i))
    {
      -[objc_class _propertyClasses](i, "_propertyClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v9);

    }
    v10 = (void *)objc_msgSend(v6, "copy");
    v13 = v2;
    v14 = v10;
    std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *&,objc_object * const {__strong}&>(-[LSRecord(Private) _propertyClassesForCoding]::resultsByClass, &v13, &v13, &v14);

    objc_autoreleasePoolPop(v5);
  }
  os_unfair_recursive_lock_unlock();
  v11 = v14;

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  LaunchServices::Record *v5;
  void *v6;
  uint64_t **i;
  const char *v8;
  uint64_t *v9;
  void *v10;
  void *v11;

  LaunchServices::Record::checkForExfiltrationRisk((LaunchServices::Record *)a3, (NSCoder *)a2);
  os_unfair_recursive_lock_lock_with_options();
  -[LSRecord _resolveAllProperties](self, "_resolveAllProperties");
  if (self->_resolvedProperties)
  {
    v5 = (LaunchServices::Record *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *((_QWORD *)self->_resolvedProperties + 3));
    LaunchServices::Record::getNullPlaceholder(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = (uint64_t **)*((_QWORD *)self->_resolvedProperties + 2); i; i = (uint64_t **)*i)
    {
      v8 = (const char *)i[2];
      v9 = i[3];
      -[LSRecord _replacementObjectForResolvedPropertyValue:forGetter:encoder:](self, "_replacementObjectForResolvedPropertyValue:forGetter:encoder:", v9, v8, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      NSStringFromSelector(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[LaunchServices::Record setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, v11);
      else
        -[LaunchServices::Record setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, v11);

    }
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("resolvedProperties"));

  }
  os_unfair_recursive_lock_unlock();
  objc_msgSend(a3, "encodeInt64:forKey:", *((unsigned __int16 *)self + 14), CFSTR("tableID"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_unitID, CFSTR("unitID"));
  objc_msgSend(a3, "encodeBool:forKey:", (*((unsigned __int8 *)self + 31) >> 6) & 1, CFSTR("intentionallyInvalid"));
}

- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = v5;
  if (-[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::once == -1)
  {
    if (!v5)
      return v6;
  }
  else
  {
    dispatch_once(&-[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::once, &__block_literal_global_64);
    if (!v6)
      return v6;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v6 = 0;
  }
  return v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    LaunchServices::Record::recordClass = (uint64_t)a1;
    LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)__LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__);
    LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)__LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__);
  }
}

- (void)_removeResolvedPropertyValueForGetter:(SEL)a3
{
  NSObject *v5;
  _QWORD *resolvedProperties;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _LSRecordLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v7 = 136446210;
    *(_QWORD *)&v7[4] = sel_getName(a3);
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEBUG, "Removing value of property %{public}s", v7, 0xCu);
  }

  os_unfair_recursive_lock_lock_with_options();
  *(_QWORD *)v7 = a3;
  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties)
    std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__erase_unique<objc_selector *>(resolvedProperties, v7);
  os_unfair_recursive_lock_unlock();
}

- (void)_setResolvedPropertyValue:(id)a3 forGetter:(SEL)a4
{
  NSObject *v7;
  objc_object *v8;
  int v9;
  const char *Name;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _LSRecordLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136446466;
    Name = sel_getName(a4);
    v11 = 2112;
    v12 = a3;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEBUG, "Setting value of property %{public}s to %@", (uint8_t *)&v9, 0x16u);
  }

  os_unfair_recursive_lock_lock_with_options();
  LaunchServices::Record::setCachedPropertyValue((LaunchServices::Record *)self, (LSRecord *)a4, (objc_selector *)a3, v8);
  os_unfair_recursive_lock_unlock();
}

- (void)_setShared:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 31) = v3 & 0x80 | *((_BYTE *)self + 31) & 0x7F;
}

+ (void)resolveAllPropertiesOfRecords:(const void *)a3 count:(unint64_t)a4 andDetachOnQueue:(id)a5
{
  void **v7;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id *v13;
  id v14;
  id v15;
  _QWORD *v16;
  id *v17;
  id *v18;
  id *v19;
  id *v20;
  _QWORD v21[4];
  _QWORD v22[3];
  id *v23;
  id *v24;
  uint64_t v25;
  id **v26;

  v7 = (void **)a3;
  if (!a3 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSRecord.mm"), 723, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("records != NULL || count == 0"));

    if (a5)
      goto LABEL_5;
  }
  else
  {
    if (!a4)
      return;
    if (a5)
    {
LABEL_5:
      v23 = 0;
      v24 = 0;
      v25 = 0;
      std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>(&v23, v7, &v7[a4], a4);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3321888768;
      v21[2] = __79__LSRecord_LSDetachable__resolveAllPropertiesOfRecords_count_andDetachOnQueue___block_invoke;
      v21[3] = &__block_descriptor_56_ea8_32c58_ZTSNSt3__16vectorIU6__weakP8LSRecordNS_9allocatorIS3_EEEE_e5_v8__0l;
      memset(v22, 0, sizeof(v22));
      std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*>(v22, v23, v24, v24 - v23);
      objc_msgSend(a5, "addOperationWithBlock:", v21);
      v26 = (id **)v22;
      std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v26);
      v26 = &v23;
      std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v26);
      return;
    }
  }
  if (pthread_main_np() && (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) == 0)
  {
    v16 = (_QWORD *)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
    if (LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool)
    {
      v17 = *(id **)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
    }
    else
    {
      v16 = (_QWORD *)operator new();
      v17 = 0;
      v16[1] = 0;
      v16[2] = 0;
      *v16 = 0;
      LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool = (uint64_t)v16;
    }
    v18 = (id *)v16[1];
    if (v17 == v18)
    {
      std::vector<LSRecord * {__weak}>::__insert_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>((uint64_t)v16, v17, v7, &v7[a4], a4);
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_209);
    }
    else
    {
      v23 = 0;
      v19 = std::remove[abi:nn180100]<std::__wrap_iter<LSRecord * {__weak}*>,decltype(nullptr)>(&v17[LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::nilScanIndex], v18);
      std::vector<LSRecord * {__weak}>::erase((uint64_t)v16, v19, *(id **)(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool + 8));
      v20 = *(id **)(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool + 8);
      LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::nilScanIndex = ((uint64_t)v20 - *(_QWORD *)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool) >> 3;
      std::vector<LSRecord * {__weak}>::__insert_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool, v20, v7, &v7[a4], a4);
    }
  }
  else
  {
    v11 = 8 * a4;
    v12 = 8 * a4;
    v13 = v7;
    do
    {
      v14 = *v13;
      objc_msgSend(v14, "_resolveAllProperties");

      ++v13;
      v12 -= 8;
    }
    while (v12);
    do
    {
      v15 = *v7;
      objc_msgSend(v15, "detach");

      ++v7;
      v11 -= 8;
    }
    while (v11);
  }
}

+ (BOOL)hasDatabaseAccess
{
  return _LSCurrentProcessMayMapDatabase() != 0;
}

+ (id)new
{
  abort();
}

- (LSRecord)init
{
  abort();
}

- (id)_initInvalid
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSRecord;
  result = -[LSRecord init](&v3, sel_init);
  if (result)
  {
    *((_BYTE *)result + 31) = *((_BYTE *)result + 31) & 0x3F | 0x40;
    *((_WORD *)result + 15) = *((_WORD *)result + 15) & 0xC000 | 1;
  }
  return result;
}

- (id)_attributedDescription
{
  LSRecord *v3;
  LSRecord *v4;
  LSRecord *v5;
  _LSDatabase *db;
  id *p_db;
  LSRecord *v8;
  uint64_t v9;
  uint64_t unitID;
  void *Visualizer;
  void *v12;

  v3 = self;
  os_unfair_recursive_lock_lock_with_options();
  v4 = v3;
  v5 = v4;
  p_db = (id *)&v4->_context.db;
  db = v4->_context.db;
  if ((*((_BYTE *)v4 + 31) & 0x40) == 0 && !db)
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v4, a2);
  if (db)
  {
    v8 = v4;
    CSStoreGetUnit();
    v9 = *((unsigned __int16 *)v8 + 14);
    unitID = v8->_unitID;
    Visualizer = _LSContextCreateVisualizer(p_db);
    objc_msgSend(Visualizer, "descriptionOfUnit:inTable:", unitID, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  os_unfair_recursive_lock_unlock();
  return v12;
}

- (BOOL)_isShared
{
  return *((unsigned __int8 *)self + 31) >> 7;
}

- (unsigned)unitID
{
  return self->_unitID;
}

- (unsigned)tableID
{
  return *((unsigned __int16 *)self + 14);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  os_unfair_recursive_lock_lock_with_options();
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  if (self->_context.db)
    v5 = CFSTR("yes");
  else
    v5 = CFSTR("no");
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> { table: %llx, unit: %llx, attached: %@ }"), v4, self, *((unsigned __int16 *)self + 14), self->_unitID, v5);
  os_unfair_recursive_lock_unlock();
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  _LSDatabase *v10;
  uint8_t buf[4];
  LSRecord *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v10 = self->_context.db;
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithContext:tableID:unitID:", &v10, *((unsigned __int16 *)self + 14), self->_unitID);
  if (v5)
  {
    if (self->_context.db)
    {
      _LSRecordLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = self;
        _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEBUG, "Copied attached record %@; not copying its properties.",
          buf,
          0xCu);
      }

    }
    else if (self->_resolvedProperties)
    {
      _LSRecordLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = self;
        _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEBUG, "Copied detached record %@; copying its properties.",
          buf,
          0xCu);
      }

      v8 = operator new();
      std::unordered_map<objc_selector *,objc_object * {__strong}>::unordered_map(v8, (uint64_t)self->_resolvedProperties);
      v5[1] = v8;
    }
  }

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (BOOL)beginContentAccess
{
  int v4;
  void *v6;

  os_unfair_recursive_lock_lock_with_options();
  v4 = *((unsigned __int16 *)self + 15);
  if ((~v4 & 0x3FFF) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSRecord.mm"), 632, CFSTR("-[LSRecord beginContentAccess] counter saturated."));

    LOWORD(v4) = *((_WORD *)self + 15);
  }
  *((_WORD *)self + 15) = v4 & 0xC000 | (v4 + 1) & 0x3FFF;
  os_unfair_recursive_lock_unlock();
  return 1;
}

- (void)endContentAccess
{
  __int16 v4;
  void *v5;

  os_unfair_recursive_lock_lock_with_options();
  v4 = *((_WORD *)self + 15);
  if ((v4 & 0x3FFF) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSRecord.mm"), 643, CFSTR("-[LSRecord endContentAccess] counter saturated."));

    v4 = *((_WORD *)self + 15);
  }
  *((_WORD *)self + 15) = v4 & 0xC000 | (v4 - 1) & 0x3FFF;
  -[LSRecord discardContentIfPossible](self, "discardContentIfPossible");
  os_unfair_recursive_lock_unlock();
}

- (void)discardContentIfPossible
{
  void *resolvedProperties;
  uint64_t v4;

  os_unfair_recursive_lock_lock_with_options();
  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties && (*((_WORD *)self + 15) & 0x3FFF) == 0 && self->_context.db)
  {
    v4 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)resolvedProperties);
    MEMORY[0x186DADEF4](v4, 0x10A0C408EF24B1CLL);
    self->_resolvedProperties = 0;
  }
  os_unfair_recursive_lock_unlock();
}

- (BOOL)isContentDiscarded
{
  void *resolvedProperties;

  os_unfair_recursive_lock_lock_with_options();
  resolvedProperties = self->_resolvedProperties;
  os_unfair_recursive_lock_unlock();
  return resolvedProperties == 0;
}

- (NSURL)visualizerURL
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__43;
  v9 = __Block_byref_object_dispose__43;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__LSRecord_CSStoreViewerAdditions__visualizerURL__block_invoke;
  v4[3] = &unk_1E10444A8;
  v4[4] = &v5;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v4, 0);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURL *)v2;
}

void __49__LSRecord_CSStoreViewerAdditions__visualizerURL__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D18B90], "URLForUnit:inTable:", a4, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (NSUUID)databaseUUID
{
  void *v2;
  void *v3;

  -[LSRecord persistentIdentifier](self, "persistentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LSPersistentIdentifierGetKnowledgeUUIDInternal(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)resolveAllPropertiesAndDetachOnQueue:(id)a3
{
  LSRecord *v3;

  v3 = self;
  +[LSRecord resolveAllPropertiesOfRecords:count:andDetachOnQueue:](LSRecord, "resolveAllPropertiesOfRecords:count:andDetachOnQueue:", &v3, 1, a3);
}

void __79__LSRecord_LSDetachable__resolveAllPropertiesOfRecords_count_andDetachOnQueue___block_invoke(uint64_t a1)
{
  id *v1;
  id *v2;
  id *v3;
  id WeakRetained;
  id v5;

  v1 = *(id **)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v1 != v2)
  {
    v3 = *(id **)(a1 + 32);
    do
    {
      WeakRetained = objc_loadWeakRetained(v3);
      objc_msgSend(WeakRetained, "_resolveAllProperties");

      ++v3;
    }
    while (v3 != v2);
    do
    {
      v5 = objc_loadWeakRetained(v1);
      objc_msgSend(v5, "detach");

      ++v1;
    }
    while (v1 != v2);
  }
}

+ (void)resolveAllPropertiesOfRecords:(id)a3 andDetachOnQueue:(id)a4
{
  unint64_t v7;
  void *v9;
  uint64_t v10;
  void *__p;
  void *v12;
  uint64_t v13;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSRecord.mm"), 759, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("records != nil"));

  }
  v7 = objc_msgSend(a3, "count");
  if (v7 > 0x80)
  {
    __p = 0;
    v12 = 0;
    v13 = 0;
    v10 = 0;
    std::vector<LSRecord *>::resize((uint64_t)&__p, v7, &v10);
    objc_msgSend(a3, "getObjects:range:", __p, 0, v7);
    objc_msgSend(a1, "resolveAllPropertiesOfRecords:count:andDetachOnQueue:", __p, v7, a4);
    if (__p)
    {
      v12 = __p;
      operator delete(__p);
    }
  }
  else
  {
    objc_msgSend(a3, "getObjects:range:", &__p, 0, v7);
    objc_msgSend(a1, "resolveAllPropertiesOfRecords:count:andDetachOnQueue:", &__p, v7, a4);
  }
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  return 0;
}

+ (NSArray)_propertyClasses
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  if (CSStoreGetUnit())
    return -[LSRecord _initWithContext:tableID:unitID:](self, "_initWithContext:tableID:unitID:", a3, a4->var3, a4->var2);

  return 0;
}

uint64_t __99__LSRecord_SubclassResponsibilities___replacementObjectForResolvedPropertyValue_forGetter_encoder___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  -[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::applicationRecordClass = result;
  return result;
}

@end
