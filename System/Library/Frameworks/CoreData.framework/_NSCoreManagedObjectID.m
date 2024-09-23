@implementation _NSCoreManagedObjectID

- (id)URIRepresentation
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  CFURLRef v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  UInt8 *v16;
  UInt8 v17;
  uint64_t v18;
  int v19;
  CFIndex v20;
  const __CFURL *v21;
  const __CFURL *v22;
  UInt8 relativeURLBytes[1024];
  _WORD v25[512];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x18D76B4E4](self, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v4 = -[_NSCoreManagedObjectID _storeIdentifier](self, "_storeIdentifier");
      if (v4)
        v5 = v4;
      else
        v5 = &stru_1E1EE23F0;
      v6 = -[__CFString length](v5, "length");
      qmemcpy(relativeURLBytes, "x-coredata://", 13);
      if (v6 && (v7 = v6, -[__CFString getCharacters:range:](v5, "getCharacters:range:", v25, 0, v6), v7 >= 1))
      {
        for (i = 0; i != v7; ++i)
          relativeURLBytes[i + 13] = v25[i];
        v9 = i + 13;
      }
      else
      {
        v9 = 13;
      }
      v12 = v9 + 1;
      relativeURLBytes[v9] = 47;
      v13 = -[_NSCoreManagedObjectID entityName](self, "entityName");
      v14 = objc_msgSend(v13, "length");
      if (v14 && (v15 = v14, objc_msgSend(v13, "getCharacters:range:", v25, 0, v14), v15 >= 1))
      {
        v16 = (UInt8 *)v25;
        do
        {
          v17 = *v16;
          v16 += 2;
          v18 = v12 + 1;
          relativeURLBytes[v12++] = v17;
          --v15;
        }
        while (v15);
      }
      else
      {
        v18 = v12;
      }
      *(_WORD *)&relativeURLBytes[v18] = 28719;
      v19 = snprintf((char *)&relativeURLBytes[v18 + 2], 1022 - v18, "%qu", -[NSManagedObjectID _referenceData64](self, "_referenceData64"));
      v20 = v18 + 2 + (v19 & ~(v19 >> 31));
      relativeURLBytes[v20] = 0;
    }
    else
    {
      v20 = 0;
    }
    v11 = CFURLCreateAbsoluteURLWithBytes(0, relativeURLBytes, v20, 0x8000100u, 0, 1u);
    v21 = v11;
    CFRelease(v11);
  }
  else
  {
    v10 = -[NSManagedObjectID _retainedURIString](self, "_retainedURIString");
    v11 = (CFURLRef)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);

  }
  v22 = v11;
  objc_autoreleasePoolPop(v3);
  return v11;
}

+ (void)initialize
{
  const __CFAllocator *v3;

  if (objc_getClass("_NSCoreManagedObjectID") == a1)
  {
    objc_opt_self();
    object_getIndexedIvars(a1);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    qword_1ECD8D980 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    qword_1ECD8D988 = (uint64_t)CFArrayCreateMutable(v3, 0, 0);
    qword_1ECD8D990 = (uint64_t)CFArrayCreateMutable(v3, 0, 0);
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (char)generatedNameSuffix
{
  return "abstract";
}

+ (Class)classWithStore:(id)a3 andEntity:(id)a4
{
  _BYTE *v7;
  const char *v8;
  const char *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class v17;
  _QWORD *IndexedIvars;
  id v19;
  unsigned int *v21;
  unsigned int v22;
  int v23;
  Class Class;
  int v25;
  Class ClassPair;
  Class v27;
  objc_class *v28;
  objc_method *ClassMethod;
  void (*Implementation)(void);
  const char *TypeEncoding;
  objc_method *v32;
  void (*v33)(void);
  const char *v34;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49[128];
  char __str[256];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = (_BYTE *)objc_msgSend((id)objc_msgSend(a4, "name"), "UTF8String");
  if (!v7 || !*v7)
  {
    v42 = (void *)MEMORY[0x1E0C99DA0];
    v43 = *MEMORY[0x1E0C99778];
    v44 = CFSTR("Entity name must not be nil.");
    goto LABEL_48;
  }
  if (!a3)
  {
    v42 = (void *)MEMORY[0x1E0C99DA0];
    v43 = *MEMORY[0x1E0C99778];
    v44 = CFSTR("Store must not be nil.");
LABEL_48:
    objc_exception_throw((id)objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v43, v44, 0));
  }
  v8 = (const char *)objc_msgSend(a1, "generatedNameSuffix");
  v9 = v8;
  v10 = *(unsigned __int8 *)v8;
  if (v10 == 54)
    v11 = 1;
  else
    v11 = 2 * (v10 == 105);
  snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v8, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_71);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = (void *)*((_QWORD *)&_MergedGlobals_71 + v11 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
LABEL_9:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v15)
        objc_enumerationMutation(v12);
      v17 = *(Class *)(*((_QWORD *)&v45 + 1) + 8 * v16);
      IndexedIvars = object_getIndexedIvars(v17);
      if (IndexedIvars)
      {
        v19 = (id)IndexedIvars[1];
        if (!v19)
          break;
        if (v19 == a4 && IndexedIvars[2] == (_QWORD)a3)
          break;
      }
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v14)
          goto LABEL_9;
        goto LABEL_25;
      }
    }
    if (!v17)
      goto LABEL_25;
LABEL_22:
    v21 = (unsigned int *)object_getIndexedIvars(v17);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  else
  {
LABEL_25:
    v23 = 1;
    while (1)
    {
      Class = objc_getClass(__str);
      if (!Class)
        break;
      v17 = Class;
      v25 = v23;
LABEL_31:
      if (!*((_QWORD *)object_getIndexedIvars(v17) + 1))
        goto LABEL_22;
      v23 = v25 + 1;
      snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v9, v25);
    }
    while (1)
    {
      ClassPair = objc_allocateClassPair((Class)a1, __str, 0x40uLL);
      if (ClassPair)
        break;
      v25 = v23 + 1;
      snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v9, v23);
      v27 = objc_getClass(__str);
      ++v23;
      if (v27)
      {
        v17 = v27;
        goto LABEL_31;
      }
    }
    v17 = ClassPair;
    v28 = object_getClass(ClassPair);
    ClassMethod = class_getClassMethod(v17, sel__retain_1);
    Implementation = method_getImplementation(ClassMethod);
    TypeEncoding = method_getTypeEncoding(ClassMethod);
    class_addMethod(v28, sel_retain, Implementation, TypeEncoding);
    v32 = class_getClassMethod(v17, sel__release_1);
    v33 = method_getImplementation(v32);
    v34 = method_getTypeEncoding(v32);
    class_addMethod(v28, sel_release, v33, v34);
    objc_registerClassPair(v17);
    CFArrayAppendValue(*((CFMutableArrayRef *)&_MergedGlobals_71 + v11 + 3), v17);
  }
  v35 = object_getIndexedIvars(v17);
  if (!v35[1])
  {
    v36 = v35;
    *(_DWORD *)v35 = 0;
    v35[2] = a3;
    v35[5] = 0;
    v37 = (void *)objc_msgSend((id)objc_msgSend(a3, "identifier"), "copy");
    if (v37)
    {
      v38 = v37;
      v36[5] = CFRetain(v37);

    }
    v36[1] = a4;
    v36[6] = 0;
    v36[3] = 0;
    *((_DWORD *)v36 + 8) = objc_msgSend((id)objc_msgSend(a4, "name"), "hash") & 0x3F;
    if (objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()))
    {
      v39 = 3;
    }
    else if (objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()))
    {
      v39 = 2;
    }
    else
    {
      v39 = 4;
    }
    *((_DWORD *)v36 + 1) = v39;
    if (a4)
      v40 = *((_DWORD *)a4 + 40);
    else
      v40 = 0;
    *((_DWORD *)v36 + 14) = v40;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_71);
  return v17;
}

+ (BOOL)_usesTaggedPointers
{
  return 0;
}

+ (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4
{
  unsigned int v5;
  unsigned int *IndexedIvars;
  unsigned int v7;

  v5 = _PFAllocateObjects((objc_class *)a1, a3, a4, 0);
  IndexedIvars = (unsigned int *)object_getIndexedIvars(a1);
  do
    v7 = __ldxr(IndexedIvars);
  while (__stxr(v7 + v5, IndexedIvars));
  return v5;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
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

+ (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v7;
  BOOL v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *__endptr;

  __endptr = 0;
  v7 = strtouq(a3, &__endptr, 0);
  if (__endptr)
    v8 = __endptr == a3;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 4);
    v10 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v9);

  }
  else
  {
    v11 = v7;
    if (objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()))
    {
      v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPK64:", v11);
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v11);
      v14 = objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v13);

      v12 = (void *)v14;
    }
    return v12;
  }
  return v10;
}

+ (id)managedObjectIDFromURIRepresentation:(id)a3
{
  void *v5;
  void *v6;
  _QWORD *IndexedIvars;
  uint64_t v8;
  char v9;
  void *v10;
  NSTemporaryObjectID *v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v16;

  v5 = (void *)MEMORY[0x18D76B4E4](a1, a2);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents"), "objectAtIndex:", 2);
  IndexedIvars = object_getIndexedIvars(a1);
  v8 = IndexedIvars[2];
  v9 = objc_msgSend(v6, "characterAtIndex:", 0);
  v10 = (void *)objc_msgSend(v6, "substringFromIndex:", 1);
  if (v9 == 116)
  {
    v11 = -[NSTemporaryObjectID initWithEntity:andUUIDString:]([NSTemporaryObjectID alloc], "initWithEntity:andUUIDString:", IndexedIvars[1], v10);
    -[NSTemporaryObjectID _setPersistentStore:](v11, "_setPersistentStore:", v8);
    if (v11)
      goto LABEL_9;
  }
  v16 = 0;
  if (!+[_PFRoutines convertCString:toUnsignedInt64:withBase:]((uint64_t)_PFRoutines, (const char *)objc_msgSend(v10, "UTF8String"), &v16, 0))
  {
LABEL_8:
    v11 = (NSTemporaryObjectID *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v10);
    goto LABEL_9;
  }
  if (!objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v14 = (void *)objc_msgSend(v13, "initWithUnsignedLongLong:", v16);
    v11 = (NSTemporaryObjectID *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v14);

    if (v11)
      goto LABEL_9;
    goto LABEL_8;
  }
  v12 = objc_alloc((Class)a1);
  v11 = (NSTemporaryObjectID *)objc_msgSend(v12, "initWithPK64:", v16);
  if (!v11)
    goto LABEL_8;
LABEL_9:
  objc_autoreleasePoolPop(v5);
  return v11;
}

+ (void)setObjectStoreIdentifier:(id)a3
{
  _QWORD *IndexedIvars;
  id v5;
  void *v6;

  IndexedIvars = object_getIndexedIvars(a1);
  v5 = (id)IndexedIvars[5];
  if (v5 != a3)
  {
    if (v5)
      CFRelease(v5);
    v6 = (void *)CFRetain((CFTypeRef)objc_msgSend(a3, "copy"));
    IndexedIvars[5] = v6;

  }
}

+ (void)_setStoreInfo1:(id)a3
{
  *((_QWORD *)object_getIndexedIvars(a1) + 6) = a3;
}

+ (id)_storeInfo1
{
  id result;

  result = object_getIndexedIvars(a1);
  if (result)
    return (id)*((_QWORD *)result + 6);
  return result;
}

+ (void)_storeDeallocated
{
  _QWORD *IndexedIvars;

  IndexedIvars = object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    IndexedIvars[6] = 0;
    IndexedIvars[2] = 0;
    __dmb(0xBu);
  }
}

- (_NSCoreManagedObjectID)retain
{
  return (_NSCoreManagedObjectID *)_PFfastOidRetain((int)self, (unint64_t)self);
}

- (void)release
{
  _PFfastOidRelease((int)self, (unint64_t)self);
}

- (id)entity
{
  Class Class;
  id result;

  Class = object_getClass(self);
  result = object_getIndexedIvars(Class);
  if (result)
    return (id)*((_QWORD *)result + 1);
  return result;
}

- (id)entityName
{
  return (id)objc_msgSend(-[_NSCoreManagedObjectID entity](self, "entity"), "name");
}

- (id)persistentStore
{
  Class Class;
  id result;

  Class = object_getClass(self);
  result = object_getIndexedIvars(Class);
  if (result)
    return (id)*((_QWORD *)result + 2);
  return result;
}

- (BOOL)isTemporaryID
{
  return 0;
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
    result = (id)*((_QWORD *)result + 5);
    if (!result)
    {
      objc_msgSend((id)objc_opt_class(), "setObjectStoreIdentifier:", objc_msgSend(v4[2], "identifier"));
      return v4[5];
    }
  }
  return result;
}

- (id)_storeInfo1
{
  Class Class;
  id result;

  Class = object_getClass(self);
  result = object_getIndexedIvars(Class);
  if (result)
    return (id)*((_QWORD *)result + 6);
  return result;
}

- (BOOL)_isPersistentStoreAlive
{
  Class Class;
  id *IndexedIvars;

  Class = object_getClass(self);
  IndexedIvars = (id *)object_getIndexedIvars(Class);
  if (IndexedIvars)
    LOBYTE(IndexedIvars) = objc_msgSend(IndexedIvars[2], "_isPersistentStoreAlive");
  return (char)IndexedIvars;
}

- (unint64_t)retainCount
{
  return SLODWORD(self[1].super.super.isa) + 1;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && _PFObjectIDFastEquals64((unint64_t)self, (unint64_t)a3) != 0;
}

@end
