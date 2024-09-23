@implementation NSTemporaryObjectID

- (id)entity
{
  return self->_entity;
}

- (unint64_t)hash
{
  return __rbit32(self->_counter);
}

- (NSTemporaryObjectID)retain
{
  int *p_cd_rc;
  unsigned int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (BOOL)_isPersistentStoreAlive
{
  Class Class;
  id *IndexedIvars;

  Class = object_getClass(self);
  IndexedIvars = (id *)object_getIndexedIvars(Class);
  if (IndexedIvars)
    LOBYTE(IndexedIvars) = objc_msgSend(IndexedIvars[1], "_isPersistentStoreAlive");
  return (char)IndexedIvars;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return self->_counter == *((_DWORD *)a3 + 3);
  }
  return 0;
}

- (BOOL)isTemporaryID
{
  return 1;
}

- (void)release
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    *p_cd_rc += 0x20000000;
    -[NSTemporaryObjectID dealloc](self, "dealloc");
  }
}

- (void)dealloc
{
  Class Class;

  self->_entity = 0;
  if (object_getClass(self) != (Class)_NSTemporaryObjectID_Default_Class)
  {
    Class = object_getClass(self);
    _PFfastFactoryRelease2(Class);
  }
  _PFDeallocateObject(self);
}

+ (void)initialize
{
  uuid_t out;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (objc_getClass("NSTemporaryObjectID") == a1)
  {
    objc_opt_self();
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    qword_1ECD8D810 = (uint64_t)-[_NS128bitWrapper initWithBytes:]((char *)[_NS128bitWrapper alloc], out);
    _CoreDataProcessInstanceTempIDCounter = 1;
    object_getIndexedIvars(a1);
    qword_1ECD8D818 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    _NSTemporaryObjectID_Default_Class = (uint64_t)objc_allocateClassPair((Class)a1, "NSTemporaryObjectID_default", 0x18uLL);
    objc_registerClassPair((Class)_NSTemporaryObjectID_Default_Class);
  }
}

- (id)persistentStore
{
  Class Class;
  id result;

  Class = object_getClass(self);
  result = object_getIndexedIvars(Class);
  if (result)
    return (id)*((_QWORD *)result + 1);
  return result;
}

- (void)_setPersistentStore:(id)a3
{
  Class Class;
  id *IndexedIvars;
  objc_class *v7;
  unsigned int *v8;
  unsigned int v9;

  Class = object_getClass(self);
  IndexedIvars = (id *)object_getIndexedIvars(Class);
  if (a3 && IndexedIvars[1] != a3)
  {
    v7 = _PFFastStoreTemporaryIDClass((uint64_t)a3);
    v8 = (unsigned int *)object_getIndexedIvars(v7);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    object_setClass(self, v7);
  }
}

+ (Class)classForStore:(id)a3
{
  const char *Name;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  unsigned int *IndexedIvars;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  int v16;
  Class Class;
  int v18;
  Class ClassPair;
  const char *v20;
  Class v21;
  unsigned int *v22;
  unsigned int v23;
  const char *v24;
  objc_class *v25;
  objc_method *ClassMethod;
  void (*Implementation)(void);
  const char *TypeEncoding;
  objc_method *v29;
  void (*v30)(void);
  const char *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char v41[128];
  char __str[256];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Store must not be nil."), 0));
  Name = class_getName((Class)a1);
  snprintf(__str, 0x100uLL, "%s_%x", Name, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_7);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = (void *)qword_1ECD8D818;
  v7 = objc_msgSend((id)qword_1ECD8D818, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v9)
        objc_enumerationMutation(v6);
      v11 = *(Class *)(*((_QWORD *)&v37 + 1) + 8 * v10);
      IndexedIvars = (unsigned int *)object_getIndexedIvars(v11);
      if (IndexedIvars)
      {
        if (!*((_QWORD *)IndexedIvars + 1))
          break;
      }
LABEL_13:
      if (++v10 == v8)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v8)
          goto LABEL_4;
        goto LABEL_20;
      }
    }
    do
    {
      v13 = __ldaxr(IndexedIvars);
      if (v13 != -1)
      {
        __clrex();
        goto LABEL_13;
      }
    }
    while (__stlxr(0, IndexedIvars));
    if (v11)
    {
LABEL_17:
      v14 = (unsigned int *)object_getIndexedIvars(v11);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
      goto LABEL_33;
    }
  }
LABEL_20:
  v16 = 1;
  while (1)
  {
    Class = objc_getClass(__str);
    if (!Class)
      break;
    v11 = Class;
    v18 = v16;
LABEL_26:
    v22 = (unsigned int *)object_getIndexedIvars(v11);
    if (!*((_QWORD *)v22 + 1))
    {
      while (1)
      {
        v23 = __ldaxr(v22);
        if (v23 != -1)
          break;
        if (!__stlxr(0, v22))
          goto LABEL_17;
      }
      __clrex();
    }
    v24 = class_getName((Class)a1);
    v16 = v18 + 1;
    snprintf(__str, 0x100uLL, "%s_%x", v24, v18);
  }
  while (1)
  {
    ClassPair = objc_allocateClassPair((Class)a1, __str, 0x18uLL);
    if (ClassPair)
      break;
    v20 = class_getName((Class)a1);
    v18 = v16 + 1;
    snprintf(__str, 0x100uLL, "%s_%x", v20, v16);
    v21 = objc_getClass(__str);
    ++v16;
    if (v21)
    {
      v11 = v21;
      goto LABEL_26;
    }
  }
  v11 = ClassPair;
  v25 = object_getClass(ClassPair);
  ClassMethod = class_getClassMethod(v11, sel__retain_1);
  Implementation = method_getImplementation(ClassMethod);
  TypeEncoding = method_getTypeEncoding(ClassMethod);
  class_addMethod(v25, sel_retain, Implementation, TypeEncoding);
  v29 = class_getClassMethod(v11, sel__release_1);
  v30 = method_getImplementation(v29);
  v31 = method_getTypeEncoding(v29);
  class_addMethod(v25, sel_release, v30, v31);
  objc_registerClassPair(v11);
  CFArrayAppendValue((CFMutableArrayRef)qword_1ECD8D818, v11);
LABEL_33:
  v32 = object_getIndexedIvars(v11);
  if (!v32[1])
  {
    v33 = v32;
    *(_DWORD *)v32 = 0;
    v32[1] = a3;
    v34 = (void *)objc_msgSend((id)objc_msgSend(a3, "identifier"), "copy");
    if (v34)
    {
      v35 = v34;
      v33[2] = CFRetain(v34);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_7);
  return v11;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (void)_storeDeallocated
{
  _QWORD *IndexedIvars;

  IndexedIvars = object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    IndexedIvars[1] = 0;
    __dmb(0xBu);
  }
}

+ (void)setObjectStoreIdentifier:(id)a3
{
  _QWORD *IndexedIvars;
  id v5;
  void *v6;

  IndexedIvars = object_getIndexedIvars(a1);
  v5 = (id)IndexedIvars[2];
  if (v5 != a3)
  {
    if (v5)
      CFRelease(v5);
    v6 = (void *)CFRetain((CFTypeRef)objc_msgSend(a3, "copy"));
    IndexedIvars[2] = v6;

  }
}

+ (BOOL)_usesTaggedPointers
{
  return 0;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (int64_t)version
{
  return 134481920;
}

+ (id)_retain_1
{
  unsigned int *IndexedIvars;
  unsigned int v4;

  IndexedIvars = (unsigned int *)object_getIndexedIvars(a1);
  do
    v4 = __ldxr(IndexedIvars);
  while (__stxr(v4 + 1, IndexedIvars));
  return a1;
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

+ (unsigned)allocateBatch:(id *)a3 forEntity:(id)a4 count:(unsigned int)a5
{
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  _DWORD *v12;

  if (_PFAllocateObjects((objc_class *)_NSTemporaryObjectID_Default_Class, a3, a5, 0) != a5)
    goto LABEL_8;
  v8 = a5;
  do
    v9 = __ldxr((unsigned int *)&_CoreDataProcessInstanceTempIDCounter);
  while (__stxr(v9 + a5, (unsigned int *)&_CoreDataProcessInstanceTempIDCounter));
  if (a5)
  {
    v10 = 0;
    v11 = v9 + 1;
    do
    {
      v12 = a3[v10];
      v12[3] = v11 + v10;
      *((_QWORD *)v12 + 2) = a4;
      ++v10;
    }
    while (v8 != v10);
  }
  else
  {
LABEL_8:
    LODWORD(v8) = 0;
  }
  return v8;
}

+ (id)initWithEntity:(id)a3
{
  return _PFFastTemporaryIDCreation(a3);
}

+ (id)initWithEntity:(id)a3 andUUIDString:(id)a4
{
  return +[_NSTemporaryObjectID2 initWithEntity:andUUIDString:](_NSTemporaryObjectID2, "initWithEntity:andUUIDString:", a3, a4);
}

- (NSTemporaryObjectID)initWithEntity:(id)a3
{
  return +[NSTemporaryObjectID initWithEntity:](NSTemporaryObjectID, "initWithEntity:", a3);
}

- (NSTemporaryObjectID)initWithEntity:(id)a3 andUUIDString:(id)a4
{
  return (NSTemporaryObjectID *)+[_NSTemporaryObjectID2 initWithEntity:andUUIDString:](_NSTemporaryObjectID2, "initWithEntity:andUUIDString:", a3, a4);
}

- (int)_temporaryIDCounter
{
  return self->_counter;
}

- (id)_storeIdentifier
{
  Class Class;
  id result;
  id *v4;

  Class = object_getClass(self);
  result = object_getIndexedIvars(Class);
  if (result)
  {
    v4 = (id *)result;
    result = (id)*((_QWORD *)result + 2);
    if (!result)
    {
      objc_msgSend((id)objc_opt_class(), "setObjectStoreIdentifier:", objc_msgSend(v4[1], "identifier"));
      return v4[2];
    }
  }
  return result;
}

- (id)_retainedURIString
{
  const __CFString *v3;
  const __CFString *v4;
  int counter;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v10;

  v3 = -[NSTemporaryObjectID _storeIdentifier](self, "_storeIdentifier");
  if (v3)
    v4 = v3;
  else
    v4 = &stru_1E1EE23F0;
  counter = self->_counter;
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7 = objc_msgSend(-[NSTemporaryObjectID entity](self, "entity"), "name");
  v8 = -[NSTemporaryObjectID _referenceData](self, "_referenceData");
  if (counter)
    return (id)objc_msgSend(v6, "initWithFormat:", CFSTR("%@://%@/%@/t%@%d"), CFSTR("x-coredata"), v4, v7, v8, self->_counter);
  else
    return (id)objc_msgSend(v6, "initWithFormat:", CFSTR("%@://%@/%@/t%@"), CFSTR("x-coredata"), v4, v7, v8, v10);
}

- (id)URIRepresentation
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v4 = -[NSTemporaryObjectID _retainedURIString](self, "_retainedURIString");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);

  v6 = v5;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)_referenceData
{
  return (id)qword_1ECD8D810;
}

@end
