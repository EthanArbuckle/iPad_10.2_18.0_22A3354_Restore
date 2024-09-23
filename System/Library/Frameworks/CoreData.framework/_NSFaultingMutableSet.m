@implementation _NSFaultingMutableSet

- (void)release
{
  int *p_cd_rc;
  int v3;
  unsigned int v4;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 - 2, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    if ((v3 & 0x80000000) == 0)
    {
      while (1)
      {
        v4 = __ldaxr((unsigned int *)p_cd_rc);
        if (v4 != -2)
          break;
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[_NSFaultingMutableSet dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (void)dealloc
{
  id *realSet;

  realSet = (id *)self->_realSet;
  if (realSet && (*(_BYTE *)&self->_flags & 1) != 0)
  {

    PF_FREE_OBJECT_ARRAY(self->_realSet);
  }
  else
  {

  }
  self->_realSet = 0;
  self->_source = 0;
  _PFDeallocateObject(self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t Count;
  unint64_t v6;
  CFStringRef (__cdecl *v7)(const void *);
  uint64_t v8;
  unint64_t v9;
  const void **v10;
  CFSetRef v11;
  id *realSet;
  _QWORD *v13;
  uint64_t v15;
  CFSetCallBacks callBacks;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v11 = -[_NSFaultingMutableSet initWithSource:forRelationship:asFault:]([_NSFaultingMutableSet alloc], "initWithSource:forRelationship:asFault:", self->_source, -[_NSFaultingMutableSet relationship](self, "relationship"), 1);
    realSet = (id *)self->_realSet;
    if (realSet)
    {
      v13 = PF_ALLOCATE_OBJECT_ARRAY(2);
      *v13 = objc_msgSend(*realSet, "mutableCopyWithZone:", a3);
      v13[1] = objc_msgSend(realSet[1], "mutableCopyWithZone:", a3);
      *((_QWORD *)v11 + 2) = v13;
    }
    *((_DWORD *)v11 + 3) = *((_DWORD *)v11 + 3) & 0xFFFFFFFD | (2 * ((*(_DWORD *)&self->_flags >> 1) & 1));
  }
  else
  {
    Count = CFSetGetCount((CFSetRef)self->_realSet);
    if (!Count)
      return (id)NSSet_EmptySet;
    v6 = Count;
    callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
    if (Count >= 0x201)
      v8 = 1;
    else
      v8 = Count;
    callBacks.equal = 0;
    callBacks.hash = 0;
    callBacks.copyDescription = v7;
    v9 = (8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0;
    v10 = (const void **)((char *)&v15 - v9);
    if (Count > 0x200)
      v10 = (const void **)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v15 - v9, 8 * Count);
    CFSetGetValues((CFSetRef)self->_realSet, v10);
    v11 = CFSetCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, v6, &callBacks);
    if (v6 >= 0x201)
      NSZoneFree(0, v10);
  }
  return v11;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

- (id)allObjects
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "allObjects");
}

- (id)valueForKey:(id)a3
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "valueForKey:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (unint64_t)count
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return CFSetGetCount((CFSetRef)self->_realSet);
}

- (void)willRead
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    -[_NSFaultingMutableSet willReadWithContents:](self, "willReadWithContents:", 0);
}

- (void)willReadWithContents:(id)a3
{
  void *v5;
  _QWORD *realSet;
  CFStringRef (__cdecl *v7)(const void *);
  NSManagedObjectContext *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSManagedObject *source;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  void *v22;
  void *v23;
  unint64_t flags;
  void *v25;
  _QWORD *ptr;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CFSetCallBacks callBacks;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    realSet = self->_realSet;
    callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
    callBacks.equal = 0;
    callBacks.hash = 0;
    callBacks.copyDescription = v7;
    v8 = -[NSManagedObject managedObjectContext](self->_source, "managedObjectContext");
    v9 = *(void **)((_QWORD)-[NSManagedObject entity](self->_source, "entity")[96]
                  + 24
                  + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
    self->_realSet = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks);
    ptr = realSet;
    if (a3)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(a3);
            CFSetAddValue((CFMutableSetRef)self->_realSet, *(const void **)(*((_QWORD *)&v27 + 1) + 8 * i));
          }
          v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        }
        while (v11);
      }
    }
    else
    {
      v25 = v5;
      source = self->_source;
      if (source)
        v15 = _insertion_fault_handler;
      else
        v15 = 0;
      v16 = -[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:](v15, source, v9, (uint64_t)v8);
      if (objc_msgSend(v16, "count"))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v32 != v19)
                objc_enumerationMutation(v16);
              v21 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v8, *(void **)(*((_QWORD *)&v31 + 1) + 8 * j), 0);
              CFSetAddValue((CFMutableSetRef)self->_realSet, v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          }
          while (v18);
        }
      }

      v5 = v25;
    }
    if (ptr)
    {
      v23 = (void *)*ptr;
      v22 = (void *)ptr[1];
      if (*ptr)
      {
        objc_msgSend(self->_realSet, "unionSet:", *ptr);

      }
      if (v22)
      {
        objc_msgSend(self->_realSet, "minusSet:", v22);

      }
      PF_FREE_OBJECT_ARRAY(ptr);
    }
    flags = self->_flags;
    self->_flags = (_NSFaultingMutableSetFlags)(flags & 0xFFFFFFFE);
    -[NSManagedObject _commitPhotoshoperyForRelationshipAtIndex:newValue:]((uint64_t)self->_source, flags >> 16, self);
  }
  objc_autoreleasePoolPop(v5);
}

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)getObjects:(id *)a3
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  CFSetGetValues((CFSetRef)self->_realSet, (const void **)a3);
}

- (void)setSet:(id)a3
{
  if (a3 != self)
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    objc_msgSend(self->_realSet, "setSet:", a3);
  }
}

- (BOOL)_shouldProcessKVOChange
{
  return 1;
}

- (_NSFaultingMutableSet)retain
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 2, (unsigned int *)p_cd_rc));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (_NSFaultingMutableSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6
{
  _NSFaultingMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = -[_NSFaultingMutableSet initWithSource:forRelationship:asFault:](self, "initWithSource:forRelationship:asFault:", a3, a5, 0, a6);
  if (v7)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(a4);
          CFSetAddValue((CFMutableSetRef)v7->_realSet, *(const void **)(*((_QWORD *)&v13 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
  }
  return v7;
}

- (id)member:(id)a3
{
  id *realSet;
  id result;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return (id)CFSetGetValue((CFSetRef)self->_realSet, a3);
  realSet = (id *)self->_realSet;
  if (!realSet || (result = (id)objc_msgSend(*realSet, "member:", a3)) == 0)
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    return (id)CFSetGetValue((CFSetRef)self->_realSet, a3);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isNSSet");
    if (v5)
      LOBYTE(v5) = -[_NSFaultingMutableSet isEqualToSet:](self, "isEqualToSet:", a3);
  }
  return v5;
}

- (BOOL)containsObject:(id)a3
{
  id *realSet;

  -[_NSFaultingMutableSet willRead](self, "willRead");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    realSet = (id *)self->_realSet;
    if (realSet && (objc_msgSend(*realSet, "containsObject:", a3) & 1) != 0)
      return 1;
    -[_NSFaultingMutableSet willRead](self, "willRead");
  }
  return CFSetContainsValue((CFSetRef)self->_realSet, a3) != 0;
}

- (BOOL)isEqualToSet:(id)a3
{
  NSManagedObject *source;
  NSPropertyDescription *v6;

  if (a3 == self)
    return 1;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (objc_msgSend(a3, "isFault"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        source = self->_source;
        if (source == (NSManagedObject *)objc_msgSend(a3, "source"))
        {
          v6 = -[_NSFaultingMutableSet relationship](self, "relationship");
          if (v6 == (NSPropertyDescription *)objc_msgSend(a3, "relationship"))
            return 1;
        }
      }
    }
  }
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "isEqualToSet:", a3);
}

- (BOOL)_isIdenticalFault:(id)a3
{
  NSManagedObject *source;
  NSPropertyDescription *v6;

  if (a3 == self)
    return 1;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (objc_msgSend(a3, "isFault"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        source = self->_source;
        if (source == (NSManagedObject *)objc_msgSend(a3, "source"))
        {
          v6 = -[_NSFaultingMutableSet relationship](self, "relationship");
          if (v6 == (NSPropertyDescription *)objc_msgSend(a3, "relationship"))
            return 1;
        }
      }
    }
  }
  return 0;
}

- (void)removeObject:(id)a3
{
  id *realSet;
  CFStringRef (__cdecl *v6)(const void *);
  CFSetCallBacks v7;

  -[_NSFaultingMutableSet willRead](self, "willRead");
  realSet = (id *)self->_realSet;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (!realSet)
    {
      realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2);
      *realSet = 0;
      realSet[1] = 0;
      self->_realSet = realSet;
    }
    if (!realSet[1])
    {
      v7.version = *MEMORY[0x1E0C9B3B0];
      *(_OWORD *)&v7.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
      v6 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
      v7.equal = 0;
      v7.hash = 0;
      v7.copyDescription = v6;
      realSet[1] = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v7);
    }
    objc_msgSend(*realSet, "removeObject:", a3);
    objc_msgSend(realSet[1], "addObject:", a3);
  }
  else
  {
    CFSetRemoveValue((CFMutableSetRef)self->_realSet, a3);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;

  -[_NSFaultingMutableSet willRead](self, "willRead", a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", CFSetGetCount((CFSetRef)self->_realSet));
  objc_msgSend(v4, "setSet:", self->_realSet);
  return v4;
}

- (_NSFaultingMutableSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  _BOOL4 v5;
  _NSFaultingMutableSet *v8;
  _NSFaultingMutableSet *v9;
  unsigned int v10;
  unsigned int v11;
  CFStringRef (__cdecl *v12)(const void *);
  CFSetCallBacks v14;
  objc_super v15;

  v5 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_NSFaultingMutableSet;
  v8 = -[_NSFaultingMutableSet init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    if (objc_msgSend(a4, "_isRelationship"))
      v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD | (2 * ((unint64_t)(objc_msgSend(a4, "deleteRule") - 1) < 2));
    else
      v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD;
    v9->_flags = (_NSFaultingMutableSetFlags)v10;
    v9->_flags = (_NSFaultingMutableSetFlags)(v10 & 0xFFFF0003);
    v11 = *(_WORD *)&v9->_flags | (objc_msgSend(a4, "_entitysReferenceID") << 16);
    if (v5)
    {
      v9->_flags = (_NSFaultingMutableSetFlags)(v11 | 1);
      v9->_realSet = 0;
    }
    else
    {
      v9->_flags = (_NSFaultingMutableSetFlags)(v11 & 0xFFFFFFFE);
      v14.version = *MEMORY[0x1E0C9B3B0];
      *(_OWORD *)&v14.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
      v12 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
      v14.equal = 0;
      v14.hash = 0;
      v14.copyDescription = v12;
      v9->_realSet = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v14);
    }
  }
  return v9;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (NSPropertyDescription)relationship
{
  return *(NSPropertyDescription **)((_QWORD)-[NSManagedObject entity](self->_source, "entity")[96]
                                   + 24
                                   + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
}

- (void)addObject:(id)a3
{
  id *realSet;
  CFMutableSetRef v6;
  CFStringRef (__cdecl *v7)(const void *);
  CFSetCallBacks v8;

  -[_NSFaultingMutableSet willRead](self, "willRead");
  realSet = (id *)self->_realSet;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (!realSet)
    {
      realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2);
      *realSet = 0;
      realSet[1] = 0;
      self->_realSet = realSet;
    }
    v6 = (CFMutableSetRef)*realSet;
    if (!*realSet)
    {
      v8.version = *MEMORY[0x1E0C9B3B0];
      *(_OWORD *)&v8.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
      v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
      v8.equal = 0;
      v8.hash = 0;
      v8.copyDescription = v7;
      v6 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v8);
      *realSet = v6;
    }
    -[__CFSet addObject:](v6, "addObject:", a3);
    objc_msgSend(realSet[1], "removeObject:", a3);
  }
  else
  {
    CFSetAddValue((CFMutableSetRef)self->_realSet, a3);
  }
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "objectsWithOptions:passingTest:", a3, a4);
}

- (void)unionSet:(id)a3
{
  if (a3 != self)
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    objc_msgSend(self->_realSet, "unionSet:", a3);
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_cd_rc + 2) >> 1;
}

- (BOOL)_tryRetain
{
  int *p_cd_rc;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unsigned int v6;

  p_cd_rc = &self->_cd_rc;
  while (1)
  {
    v3 = *p_cd_rc;
    v4 = (v3 & 1) != 0 || v3 == 4294967294;
    result = !v4;
    if (v4)
      break;
    if ((int)v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr((unsigned int *)p_cd_rc);
      if (v6 != (_DWORD)v3)
        break;
      if (!__stlxr(v3 + 2, (unsigned int *)p_cd_rc))
        return result;
    }
    __clrex();
  }
  return result;
}

- (BOOL)_isDeallocating
{
  int cd_rc;

  cd_rc = self->_cd_rc;
  if (cd_rc == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (cd_rc <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = cd_rc & 1;
  }
  return (char)self;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (void)turnIntoFault
{
  id *realSet;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  realSet = (id *)self->_realSet;
  if (realSet && (*(_BYTE *)&self->_flags & 1) != 0)
  {

    PF_FREE_OBJECT_ARRAY(self->_realSet);
  }
  else
  {

  }
  self->_realSet = 0;
  *(_DWORD *)&self->_flags |= 1u;
}

- (NSManagedObject)source
{
  return self->_source;
}

- (id)description
{
  _NSFaultingMutableSetFlags flags;
  void *v4;
  NSString *v5;
  NSManagedObject *source;
  uint64_t v8;

  flags = self->_flags;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[NSPropertyDescription name](-[_NSFaultingMutableSet relationship](self, "relationship"), "name");
  source = self->_source;
  if ((*(_BYTE *)&flags & 1) != 0)
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("Relationship '%@' fault on managed object (%p) %@"), v5, self->_source, source, v8);
  else
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("Relationship '%@' on managed object (%p) %@ with objects %@"), v5, source, source, objc_msgSend(self->_realSet, "description"));
}

- (id)descriptionWithLocale:(id)a3
{
  _NSFaultingMutableSetFlags flags;
  void *v6;
  NSString *v7;
  NSManagedObject *source;
  uint64_t v10;

  flags = self->_flags;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = -[NSPropertyDescription name](-[_NSFaultingMutableSet relationship](self, "relationship"), "name");
  source = self->_source;
  if ((*(_BYTE *)&flags & 1) != 0)
    return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("Relationship '%@' fault on managed object (%p) %@"), v7, self->_source, source, v10);
  else
    return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("Relationship '%@' on managed object (%p) %@ with objects %@"), v7, source, source, objc_msgSend(self->_realSet, "descriptionWithLocale:", a3));
}

- (id)objectEnumerator
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "objectEnumerator");
}

- (id)anyObject
{
  id *realSet;
  id *p_realSet;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
  realSet = (id *)self->_realSet;
  if (!realSet || !objc_msgSend(*realSet, "count"))
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
LABEL_8:
    p_realSet = &self->_realSet;
    return (id)objc_msgSend(*p_realSet, "anyObject");
  }
  p_realSet = (id *)self->_realSet;
  return (id)objc_msgSend(*p_realSet, "anyObject");
}

- (BOOL)intersectsSet:(id)a3
{
  if (a3 == self)
    return 1;
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "intersectsSet:", a3);
}

- (BOOL)isSubsetOfSet:(id)a3
{
  if (a3 == self)
    return 1;
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "isSubsetOfSet:", a3);
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "makeObjectsPerformSelector:", a3);
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "makeObjectsPerformSelector:withObject:", a3, a4);
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id *realSet;
  CFMutableSetRef v10;
  CFStringRef (__cdecl *v11)(const void *);
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CFSetCallBacks callBacks;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[_NSFaultingMutableSet willRead](self, "willRead");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    realSet = (id *)self->_realSet;
    if (!realSet)
    {
      realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2);
      *realSet = 0;
      realSet[1] = 0;
      self->_realSet = realSet;
    }
    v10 = (CFMutableSetRef)*realSet;
    if (!*realSet)
    {
      callBacks.version = *MEMORY[0x1E0C9B3B0];
      *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
      v11 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
      callBacks.equal = 0;
      callBacks.hash = 0;
      callBacks.copyDescription = v11;
      v10 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks);
      *realSet = v10;
    }
    -[__CFSet addObjectsFromArray:](v10, "addObjectsFromArray:", a3);
    if (objc_msgSend(realSet[1], "count"))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a3);
      objc_msgSend(realSet[1], "minusSet:", v12);

    }
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(a3);
          CFSetAddValue((CFMutableSetRef)self->_realSet, *(const void **)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }
  }
}

- (void)intersectSet:(id)a3
{
  if (a3 != self)
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    objc_msgSend(self->_realSet, "intersectSet:", a3);
  }
}

- (void)minusSet:(id)a3
{
  if (a3 == self)
  {
    objc_msgSend(a3, "removeAllObjects");
  }
  else
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    objc_msgSend(self->_realSet, "minusSet:", a3);
  }
}

- (void)removeAllObjects
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  CFSetRemoveAllValues((CFMutableSetRef)self->_realSet);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "setValue:forKey:", a3, a4);
}

- (id)valueForKeyPath:(id)a3
{
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "valueForKeyPath:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)replacementObjectForCoder:(id)a3
{
  -[_NSFaultingMutableSet willRead](self, "willRead", a3);
  return self->_realSet;
}

@end
