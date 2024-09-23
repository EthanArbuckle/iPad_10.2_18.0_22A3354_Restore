@implementation JSVirtualMachine

- (JSVirtualMachine)init
{
  unint64_t v3;
  JSC::VM *v4;
  JSVirtualMachine *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unsigned int **v32;
  char *v33;

  v3 = atomic_load(&JSC::initialize(void)::onceFlag);
  if (v3 != -1)
  {
    v33 = &v31;
    v32 = (unsigned int **)&v33;
    std::__call_once(&JSC::initialize(void)::onceFlag, &v32, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<JSC::initialize(void)::$_0 &&>>);
  }
  v4 = (JSC::VM *)WTF::fastMalloc((WTF *)0x16D60);
  JSC::VM::VM((uint64_t)v4, 1, 0, 0, 0);
  v5 = -[JSVirtualMachine initWithContextGroupRef:](self, "initWithContextGroupRef:", v4);
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v33, v4, v6, v7, v8, v9, v10, v11, v12);
  do
  {
    v20 = __ldaxr((unsigned int *)v4);
    v21 = v20 - 1;
  }
  while (__stlxr(v21, (unsigned int *)v4));
  if (!v21)
  {
    atomic_store(1u, (unsigned int *)v4);
    JSC::VM::~VM(v4);
    WTF::fastFree(v23, v24, v25, v26, v27, v28, v29, v30);
  }
  JSC::JSLockHolder::~JSLockHolder((unsigned int **)&v33, v13, v14, v15, v16, v17, v18, v19);
  return v5;
}

- (JSVirtualMachine)initWithContextGroupRef:(OpaqueJSContextGroup *)a3
{
  JSVirtualMachine *v4;
  JSVirtualMachine *v5;
  unsigned int v6;
  uint64_t v7;
  void *m_ptr;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)JSVirtualMachine;
  v4 = -[JSVirtualMachine init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    do
      v6 = __ldaxr((unsigned int *)a3);
    while (__stlxr(v6 + 1, (unsigned int *)a3));
    v4->m_group = a3;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 5, 0);
    m_ptr = v5->m_contextCache.m_ptr;
    v5->m_contextCache.m_ptr = (void *)v7;
    if (m_ptr)
      CFRelease(m_ptr);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
    v10 = v5->m_externalObjectGraph.m_ptr;
    v5->m_externalObjectGraph.m_ptr = (void *)v9;
    if (v10)
      CFRelease(v10);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 1282, 0);
    v12 = v5->m_externalRememberedSet.m_ptr;
    v5->m_externalRememberedSet.m_ptr = (void *)v11;
    if (v12)
      CFRelease(v12);
    +[JSVMWrapperCache addWrapper:forJSContextGroupRef:](JSVMWrapperCache, "addWrapper:forJSContextGroupRef:", v5, a3);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  JSC::VM *m_group;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  unsigned int *v29;

  m_group = self->m_group;
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v29, m_group, v2, v3, v4, v5, v6, v7, v8);
  do
  {
    v18 = __ldaxr((unsigned int *)m_group);
    v19 = v18 - 1;
  }
  while (__stlxr(v19, (unsigned int *)m_group));
  if (!v19)
  {
    atomic_store(1u, (unsigned int *)m_group);
    JSC::VM::~VM(m_group);
    WTF::fastFree(v20, v21, v22, v23, v24, v25, v26, v27);
  }
  JSC::JSLockHolder::~JSLockHolder(&v29, v11, v12, v13, v14, v15, v16, v17);
  v28.receiver = self;
  v28.super_class = (Class)JSVirtualMachine;
  -[JSVirtualMachine dealloc](&v28, sel_dealloc);
}

- (BOOL)isOldExternalObject:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  id v13;
  unsigned __int8 *v14;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;

  v4 = *((_QWORD *)self->m_group + 74);
  v5 = *(_QWORD *)(v4 + 120);
  v6 = *(_QWORD *)(v5 + 48);
  if (v5 + 56 != v6)
  {
    v7 = *(_DWORD *)(v6 + 4);
    v8 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
    v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
    v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
    v11 = v7 & ((v10 >> 31) ^ v10);
    v12 = v11;
    while (1)
    {
      v13 = *(id *)(v6 + 8 * v12 + 16);
      if (!v13)
        return 0;
      if (v13 == a3)
        goto LABEL_14;
      v12 = (v12 + 1) & v7;
      if (v12 == v11)
      {
        __break(0xC471u);
        JUMPOUT(0x197F07E24);
      }
    }
  }
  v14 = (unsigned __int8 *)(v5 + 80);
  if (__ldaxr((unsigned __int8 *)(v5 + 80)))
  {
    __clrex();
  }
  else if (!__stxr(1u, v14))
  {
    goto LABEL_11;
  }
  WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::lockSlow(v5 + 80);
LABEL_11:
  v16 = WTF::ConcurrentPtrHashSet::containsImpl((WTF::ConcurrentPtrHashSet *)v5, a3);
  v23 = v16;
  v24 = __ldxr(v14);
  if (v24 != 1)
  {
    __clrex();
LABEL_18:
    WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::unlockSlow(v14, 0, v17, v18, v19, v20, v21, v22);
    if (v23)
      goto LABEL_14;
    return 0;
  }
  if (__stlxr(0, v14))
    goto LABEL_18;
  if (!v16)
    return 0;
LABEL_14:
  if (*(_BYTE *)(v4 + 131))
    (*(void (**)(uint64_t, id))(*(_QWORD *)v4 + 152))(v4, a3);
  return 1;
}

- (void)addExternalRememberedObject:(id)a3
{
  Lock *p_m_externalDataMutex;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  p_m_externalDataMutex = &self->m_externalDataMutex;
  if (__ldaxr(&self->m_externalDataMutex.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_m_externalDataMutex->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::lockSlow((uint64_t)&self->m_externalDataMutex);
LABEL_5:
  objc_msgSend(self->m_externalRememberedSet.m_ptr, "setObject:forKey:", MEMORY[0x1E0C9AAB0], a3);
  v13 = __ldxr(&p_m_externalDataMutex->m_byte.value.__a_.__a_value);
  if (v13 != 1)
  {
    __clrex();
    goto LABEL_9;
  }
  if (__stlxr(0, &p_m_externalDataMutex->m_byte.value.__a_.__a_value))
LABEL_9:
    WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::unlockSlow(&p_m_externalDataMutex->m_byte.value.__a_.__a_value, 0, v7, v8, v9, v10, v11, v12);
}

- (void)addManagedReference:(id)object withOwner:(id)owner
{
  void *v7;
  objc_object *InternalObjcObject;
  objc_object *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  objc_object *v17;
  Lock *p_m_externalDataMutex;
  NSMapTable *v20;
  NSMapTable *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int *v31;

  v7 = (void *)MEMORY[0x19AEBB88C](self, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(object, "didAddOwner:", owner);
  InternalObjcObject = getInternalObjcObject((objc_object *)object);
  v9 = getInternalObjcObject((objc_object *)owner);
  if (InternalObjcObject)
  {
    v17 = v9;
    if (v9)
    {
      JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v31, self->m_group, v10, v11, v12, v13, v14, v15, v16);
      if (-[JSVirtualMachine isOldExternalObject:](self, "isOldExternalObject:", v17)
        && !-[JSVirtualMachine isOldExternalObject:](self, "isOldExternalObject:", InternalObjcObject))
      {
        -[JSVirtualMachine addExternalRememberedObject:](self, "addExternalRememberedObject:", v17);
      }
      p_m_externalDataMutex = &self->m_externalDataMutex;
      if (__ldaxr(&self->m_externalDataMutex.m_byte.value.__a_.__a_value))
      {
        __clrex();
      }
      else if (!__stxr(1u, &p_m_externalDataMutex->m_byte.value.__a_.__a_value))
      {
        goto LABEL_12;
      }
      WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::lockSlow((uint64_t)&self->m_externalDataMutex);
LABEL_12:
      v20 = (NSMapTable *)objc_msgSend(self->m_externalObjectGraph.m_ptr, "objectForKey:", v17);
      v21 = v20;
      if (v20)
      {
        CFRetain(v20);
      }
      else
      {
        v21 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 1282, 1);
        objc_msgSend(self->m_externalObjectGraph.m_ptr, "setObject:forKey:", v21, v17);
      }
      v22 = (char *)NSMapGet(v21, InternalObjcObject);
      NSMapInsert(v21, InternalObjcObject, v22 + 1);
      if (v21)
        CFRelease(v21);
      v30 = __ldxr(&p_m_externalDataMutex->m_byte.value.__a_.__a_value);
      if (v30 == 1)
      {
        if (!__stlxr(0, &p_m_externalDataMutex->m_byte.value.__a_.__a_value))
          goto LABEL_22;
      }
      else
      {
        __clrex();
      }
      WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::unlockSlow(&self->m_externalDataMutex.m_byte.value.__a_.__a_value, 0, v24, v25, v26, v27, v28, v29);
LABEL_22:
      JSC::JSLockHolder::~JSLockHolder(&v31, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  objc_autoreleasePoolPop(v7);
}

- (void)removeManagedReference:(id)object withOwner:(id)owner
{
  void *v7;
  objc_object *InternalObjcObject;
  objc_object *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  objc_object *v17;
  Lock *p_m_externalDataMutex;
  NSMapTable *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMapTable *v28;
  char *v29;
  int v30;
  unsigned int *v31;

  v7 = (void *)MEMORY[0x19AEBB88C](self, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(object, "didRemoveOwner:", owner);
  InternalObjcObject = getInternalObjcObject((objc_object *)object);
  v9 = getInternalObjcObject((objc_object *)owner);
  if (InternalObjcObject)
  {
    v17 = v9;
    if (v9)
    {
      JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v31, self->m_group, v10, v11, v12, v13, v14, v15, v16);
      p_m_externalDataMutex = &self->m_externalDataMutex;
      if (__ldaxr(&self->m_externalDataMutex.m_byte.value.__a_.__a_value))
      {
        __clrex();
      }
      else if (!__stxr(1u, &p_m_externalDataMutex->m_byte.value.__a_.__a_value))
      {
        goto LABEL_9;
      }
      WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::lockSlow((uint64_t)&self->m_externalDataMutex);
LABEL_9:
      v20 = (NSMapTable *)objc_msgSend(self->m_externalObjectGraph.m_ptr, "objectForKey:", v17);
      v28 = v20;
      if (v20)
      {
        v29 = (char *)NSMapGet(v20, InternalObjcObject);
        if ((unint64_t)v29 < 2)
        {
          if (v29 == (char *)1)
            NSMapRemove(v28, InternalObjcObject);
          if (!-[NSMapTable count](v28, "count"))
          {
            objc_msgSend(self->m_externalObjectGraph.m_ptr, "removeObjectForKey:", v17);
            objc_msgSend(self->m_externalRememberedSet.m_ptr, "removeObjectForKey:", v17);
          }
        }
        else
        {
          NSMapInsert(v28, InternalObjcObject, v29 - 1);
        }
      }
      v30 = __ldxr(&p_m_externalDataMutex->m_byte.value.__a_.__a_value);
      if (v30 == 1)
      {
        if (!__stlxr(0, &p_m_externalDataMutex->m_byte.value.__a_.__a_value))
          goto LABEL_21;
      }
      else
      {
        __clrex();
      }
      WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::unlockSlow(&self->m_externalDataMutex.m_byte.value.__a_.__a_value, 0, v22, v23, v24, v25, v26, v27);
LABEL_21:
      JSC::JSLockHolder::~JSLockHolder(&v31, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  objc_autoreleasePoolPop(v7);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->m_externalRememberedSet.m_ptr;
  self->m_externalRememberedSet.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->m_externalObjectGraph.m_ptr;
  self->m_externalObjectGraph.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->m_contextCache.m_ptr;
  self->m_contextCache.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 16) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (JSVirtualMachine)virtualMachineWithContextGroupRef:(OpaqueJSContextGroup *)a3
{
  JSVirtualMachine *v4;
  JSVirtualMachine *v5;

  v4 = +[JSVMWrapperCache wrapperForJSContextGroupRef:](JSVMWrapperCache, "wrapperForJSContextGroupRef:");
  if (v4)
  {
    v5 = v4;
    CFRetain(v4);
  }
  else
  {
    v5 = -[JSVirtualMachine initWithContextGroupRef:]([JSVirtualMachine alloc], "initWithContextGroupRef:", a3);
  }
  return (JSVirtualMachine *)(id)CFMakeCollectable(v5);
}

- (id)contextForGlobalContextRef:(OpaqueJSContext *)a3
{
  return NSMapGet((NSMapTable *)self->m_contextCache.m_ptr, a3);
}

- (void)addContext:(id)a3 forGlobalContextRef:(OpaqueJSContext *)a4
{
  NSMapInsert((NSMapTable *)self->m_contextCache.m_ptr, a4, a3);
}

- (void)externalDataMutex
{
  return &self->m_externalDataMutex;
}

- (id)externalObjectGraph
{
  return self->m_externalObjectGraph.m_ptr;
}

- (id)externalRememberedSet
{
  return self->m_externalRememberedSet.m_ptr;
}

- (void)shrinkFootprintWhenIdle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  JSC::VM *m_group;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;

  m_group = self->m_group;
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v17, m_group, v2, v3, v4, v5, v6, v7, v8);
  JSC::VM::shrinkFootprintWhenIdle(m_group);
  JSC::JSLockHolder::~JSLockHolder(&v17, v10, v11, v12, v13, v14, v15, v16);
}

+ (unint64_t)setNumberOfDFGCompilerThreads:(unint64_t)a3
{
  int v3;
  unint64_t v4;
  unint64_t result;
  char v6;
  char **v7;
  char *v8;

  v3 = a3;
  v4 = atomic_load(&JSC::JITWorklist::ensureGlobalWorklist(void)::once);
  if (v4 != -1)
  {
    v8 = &v6;
    v7 = &v8;
    std::__call_once(&JSC::JITWorklist::ensureGlobalWorklist(void)::once, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<JSC::JITWorklist::ensureGlobalWorklist(void)::$_0 &&>>);
  }
  result = *(unsigned int *)(JSC::theGlobalJITWorklist + 20);
  *(_DWORD *)(JSC::theGlobalJITWorklist + 20) = v3;
  return result;
}

+ (unint64_t)setNumberOfFTLCompilerThreads:(unint64_t)a3
{
  int v3;
  unint64_t v4;
  unint64_t result;
  char v6;
  char **v7;
  char *v8;

  v3 = a3;
  v4 = atomic_load(&JSC::JITWorklist::ensureGlobalWorklist(void)::once);
  if (v4 != -1)
  {
    v8 = &v6;
    v7 = &v8;
    std::__call_once(&JSC::JITWorklist::ensureGlobalWorklist(void)::once, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<JSC::JITWorklist::ensureGlobalWorklist(void)::$_0 &&>>);
  }
  result = *(unsigned int *)(JSC::theGlobalJITWorklist + 24);
  *(_DWORD *)(JSC::theGlobalJITWorklist + 24) = v3;
  return result;
}

- (OpaqueJSContextGroup)JSContextGroupRef
{
  return self->m_group;
}

- (BOOL)isWebThreadAware
{
  return *(_BYTE *)(*((_QWORD *)self->m_group + 14) + 5);
}

+ (void)setCrashOnVMCreation:(BOOL)a3
{
  JSC::vmCreationShouldCrash = a3;
}

@end
