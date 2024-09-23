@implementation _NSCoreDataTaggedObjectID

- (BOOL)isTemporaryID
{
  int v2;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 7;
  return ((unint64_t)(v2 ^ self) >> 3) & 1;
}

- (id)entity
{
  int v2;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 7;
  return *(id *)(_PFTaggedPointersPool + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF) + 8);
}

- (id)persistentStore
{
  int v2;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 7;
  return *(id *)(_PFTaggedPointersPool + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF));
}

- (id)_storeInfo1
{
  int v2;
  unint64_t v3;
  BOOL v4;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 7;
  v3 = _PFTaggedPointersPool + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF);
  if (*(_QWORD *)v3)
    v4 = *(_QWORD *)(v3 + 8) == 0;
  else
    v4 = 1;
  if (v4)
    return 0;
  else
    return (id)objc_msgSend(*(id *)v3, "_storeInfoForEntityDescription:");
}

- (BOOL)_isPersistentStoreAlive
{
  int v2;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 7;
  return objc_msgSend(*(id *)(_PFTaggedPointersPool + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF)), "_isPersistentStoreAlive");
}

- (id)_storeIdentifier
{
  int v2;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 7;
  return *(id *)(_PFTaggedPointersPool + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF) + 16);
}

- (id)entityName
{
  int v2;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 7;
  return *(id *)(_PFTaggedPointersPool + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF) + 24);
}

- (int64_t)_referenceData64
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 0;
  v3 = v2 ^ (unint64_t)self;
  v4 = 0x3FFFFFFFFFFLL;
  if ((~(_BYTE)v3 & 7) == 0)
    v4 = 0x3FFFFFFFFLL;
  return v4 & (v3 >> 21);
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (Class)classWithStore:(id)a3 andEntity:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  Class result;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _BYTE v30[22];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = _PFTaggedPointersPool;
  if (!_PFTaggedPointersPool)
  {
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fatal attempt to reserve a tagged pointer slot without a pool for '%@': %@");
    v22 = objc_msgSend(a4, "name");
    _NSCoreDataLog(17, v21, v23, v24, v25, v26, v27, v28, v22);
    v29 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v30 = 138412546;
      *(_QWORD *)&v30[4] = objc_msgSend(a4, "name");
      *(_WORD *)&v30[12] = 2112;
      *(_QWORD *)&v30[14] = a3;
      _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Fatal attempt to reserve a tagged pointer slot without a pool for '%@': %@", v30, 0x16u);
    }
    __break(1u);
  }
  v7 = 0;
  while (1)
  {
    v8 = (unint64_t *)(v6 + 32 * v7);
    if (!v8[2] && !*v8)
      break;
LABEL_9:
    if (++v7 == 0x20000)
      return (Class)objc_msgSend((id)objc_opt_class(), "classWithStore:andEntity:", a3, a4);
  }
  do
  {
    if (__ldaxr(v8))
    {
      __clrex();
      v6 = _PFTaggedPointersPool;
      goto LABEL_9;
    }
  }
  while (__stlxr((unint64_t)a3, v8));
  v11 = (void *)objc_msgSend(a3, "identifier");
  v12 = objc_msgSend(a4, "name");
  os_unfair_lock_lock_with_options();
  v13 = (void *)objc_msgSend((id)qword_1ECD8D978, "member:", v11);
  if (v13)
  {
    v14 = v13;
  }
  else
  {
    v14 = (id)objc_msgSend(v11, "copy");
    objc_msgSend((id)qword_1ECD8D978, "addObject:", v14);
  }
  v15 = (void *)objc_msgSend((id)qword_1ECD8D978, "member:", v12);
  if (v15)
  {
    v16 = v15;
  }
  else
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v12);
    objc_msgSend((id)qword_1ECD8D978, "addObject:", v16);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1ECD8D96C);
  v17 = (_QWORD *)(_PFTaggedPointersPool + 32 * v7);
  v18 = (void *)v17[2];
  v19 = (void *)v17[3];
  v17[1] = a4;
  v17[2] = v14;
  v17[3] = v16;

  if ((_DWORD)v7 == -1)
    return (Class)objc_msgSend((id)objc_opt_class(), "classWithStore:andEntity:", a3, a4);
  v20 = (objc_class *)objc_opt_class();
  result = (Class)_PFAllocateObject(v20, 0);
  if (result)
  {
    *(_QWORD *)v30 = result;
    *(_QWORD *)&v30[8] = _NSCoreDataTaggedObjectIDFactory;
    result = (Class)objc_msgSendSuper2((objc_super *)v30, sel_init);
    if (result)
      *((_DWORD *)result + 3) = v7;
  }
  return result;
}

+ (void)initialize
{
  objc_class *Class;
  size_t *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *ImageName;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  Class = objc_getClass("_NSCoreDataTaggedObjectID");
  if (Class != (objc_class *)objc_opt_class())
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failure to initialize tagged pointers (classes don't match): %@:%p:%@:%p - %p\n%s\n%s");
    NSStringFromClass(Class);
    class_getImageName((Class)a1);
    class_getImageName(Class);
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a1);
    v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413826;
      v25 = a1;
      v26 = 2048;
      v27 = a1;
      v28 = 2112;
      v29 = NSStringFromClass(Class);
      v30 = 2048;
      v31 = Class;
      v32 = 2048;
      v33 = _PFTaggedPointersPool;
      v34 = 2080;
      ImageName = class_getImageName((Class)a1);
      v36 = 2080;
      v37 = class_getImageName(Class);
      v14 = "CoreData: Failure to initialize tagged pointers (classes don't match): %@:%p:%@:%p - %p\n%s\n%s";
      v15 = v13;
LABEL_11:
      _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, v14, buf, 0x48u);
    }
LABEL_12:
    __break(1u);
    return;
  }
  if (*MEMORY[0x1E0DE7C50])
  {
    if (Class == a1 && !_PFTaggedPointersPool)
    {
      v4 = (size_t *)MEMORY[0x1E0C85AD8];
      v5 = ((*MEMORY[0x1E0C85AC0] + 0x400000) & ~*MEMORY[0x1E0C85AC0]) + *MEMORY[0x1E0C85AD8];
      _PFTaggedPointersPool = (uint64_t)mmap(0, v5, 3, 4098, 771751936, 0);
      mprotect((void *)(v5 + _PFTaggedPointersPool - *v4), *v4, 0);
      unk_1ECD8D970 = a1;
      _objc_registerTaggedPointerClass();
      qword_1ECD8D978 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E20]);
      dword_1ECD8D96C = 0;
      if (!_PFTaggedPointersPool)
      {
        v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failure to initialize tagged pointers (pool is NULL after initialization attempt): %@:%p:%@:%p - %p\n%s\n%s");
        NSStringFromClass((Class)a1);
        class_getImageName((Class)a1);
        class_getImageName((Class)a1);
        _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)a1);
        v23 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138413826;
          v25 = a1;
          v26 = 2048;
          v27 = a1;
          v28 = 2112;
          v29 = NSStringFromClass((Class)a1);
          v30 = 2048;
          v31 = a1;
          v32 = 2048;
          v33 = _PFTaggedPointersPool;
          v34 = 2080;
          ImageName = class_getImageName((Class)a1);
          v36 = 2080;
          v37 = class_getImageName((Class)a1);
          v14 = "CoreData: Failure to initialize tagged pointers (pool is NULL after initialization attempt): %@:%p:%@:%p - %p\n%s\n%s";
          v15 = v23;
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
  }
}

- (_NSCoreDataTaggedObjectID)initWithObject:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-initWithObject: is not implemented on tagged objectIDs"), 0));
}

- (unint64_t)retainCount
{
  return -1;
}

- (id)_retainedURIString
{
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v11;

  v3 = -[_NSCoreDataTaggedObjectID _storeIdentifier](self, "_storeIdentifier");
  if (v3)
    v4 = v3;
  else
    v4 = &stru_1E1EE23F0;
  v5 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v5 = 0;
  v6 = v5 ^ (unint64_t)self;
  v7 = v6 >> 21;
  if ((v6 & 8) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@://%@/%@/t%@%d"), CFSTR("x-coredata"), v4, -[_NSCoreDataTaggedObjectID entityName](self, "entityName"), _PFCoreDataProcessInstanceUUID(), v7);
  v8 = (~(_BYTE)v6 & 7) == 0;
  v9 = 0x3FFFFFFFFFFLL;
  if (v8)
    v9 = 0x3FFFFFFFFLL;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@://%@/%@/p%qu"), CFSTR("x-coredata"), v4, -[_NSCoreDataTaggedObjectID entityName](self, "entityName"), v9 & v7, v11);
}

+ (BOOL)_usesTaggedPointers
{
  return 1;
}

@end
